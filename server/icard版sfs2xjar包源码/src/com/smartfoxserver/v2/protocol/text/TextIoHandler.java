/*     */ package com.smartfoxserver.v2.protocol.text;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.core.BitSwarmEngine;
/*     */ import com.smartfoxserver.bitswarm.core.ISocketWriter;
/*     */ import com.smartfoxserver.bitswarm.data.IPacket;
/*     */ import com.smartfoxserver.bitswarm.data.Packet;
/*     */ import com.smartfoxserver.bitswarm.data.TransportType;
/*     */ import com.smartfoxserver.bitswarm.io.IProtocolCodec;
/*     */ import com.smartfoxserver.bitswarm.io.protocols.ProtocolType;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.bitswarm.util.ByteUtils;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import com.smartfoxserver.v2.protocol.SFSIoHandler;
/*     */ import com.smartfoxserver.v2.protocol.binary.PacketHeader;
/*     */ import com.smartfoxserver.v2.protocol.binary.PacketReadState;
/*     */ import com.smartfoxserver.v2.protocol.binary.PendingPacket;
/*     */ import com.smartfoxserver.v2.protocol.binary.ProcessedPacket;
/*     */ import java.io.PrintStream;
/*     */ import java.nio.ByteBuffer;
/*     */ 
/*     */ public class TextIoHandler
/*     */ {
/*     */   private final BitSwarmEngine engine;
/*     */   private final SFSIoHandler parentHandler;
/*     */   private IProtocolCodec protocolCodec;
/*  26 */   private final String EOM = new String(new byte[1]);
/*  27 */   private final byte TEXT_HEADER_BYTE = 1;
/*     */ 
/*     */   public TextIoHandler(SFSIoHandler parentHandler)
/*     */   {
/*  31 */     this.engine = BitSwarmEngine.getInstance();
/*  32 */     this.parentHandler = parentHandler;
/*     */   }
/*     */ 
/*     */   public void setProtocolCodec(IProtocolCodec protocolCodec)
/*     */   {
/*  37 */     this.protocolCodec = protocolCodec;
/*     */   }
/*     */ 
/*     */   public void handleRead(ISession session, byte[] data)
/*     */   {
/*  43 */     PacketReadState readState = (PacketReadState)session.getSystemProperty("read_state");
/*     */ 
/*  46 */     if (readState == PacketReadState.WAIT_NEW_PACKET)
/*     */     {
/*  48 */       ProcessedPacket process = handleNewPacket(session, data);
/*  49 */       readState = process.getState();
/*  50 */       data = process.getData();
/*     */     }
/*     */ 
/*  53 */     if (readState == PacketReadState.WAIT_DATA)
/*     */     {
/*  55 */       ProcessedPacket process = handlePacketData(session, data);
/*  56 */       readState = process.getState();
/*  57 */       data = process.getData();
/*     */     }
/*     */ 
/*  60 */     session.setSystemProperty("read_state", readState);
/*     */   }
/*     */ 
/*     */   public void handleWrite(IPacket packet)
/*     */   {
/*  66 */     byte[] binData = ((SFSObject)packet.getData()).toJson().getBytes();
/*     */ 
/*  69 */     ByteBuffer packetBuffer = ByteBuffer.allocate(2 + binData.length);
/*  70 */     packetBuffer.put(1);
/*  71 */     packetBuffer.put(binData);
/*  72 */     packetBuffer.put(0);
/*     */ 
/*  74 */     packet.setData(packetBuffer.array());
/*     */ 
/*  76 */     System.out.println("TEXT DATA written:");
/*  77 */     System.out.println(ByteUtils.fullHexDump(packetBuffer.array()));
/*     */ 
/*  80 */     this.engine.getSocketWriter().enqueuePacket(packet);
/*     */   }
/*     */ 
/*     */   private ProcessedPacket handleNewPacket(ISession session, byte[] data)
/*     */   {
/*  92 */     PacketHeader header = this.parentHandler.decodeFirstHeaderByte(data[0]);
/*     */ 
/*  95 */     PendingPacket pending = new PendingPacket(header);
/*  96 */     pending.setBuffer(new StringBuilder());
/*  97 */     session.setSystemProperty("session_data_buffer", pending);
/*     */ 
/* 100 */     data = ByteUtils.resizeByteArray(data, 1, data.length - 1);
/* 101 */     System.out.println("data post-header: " + data.length);
/*     */ 
/* 104 */     return new ProcessedPacket(PacketReadState.WAIT_DATA, data);
/*     */   }
/*     */ 
/*     */   private ProcessedPacket handlePacketData(ISession session, byte[] data)
/*     */   {
/* 109 */     PacketReadState state = PacketReadState.WAIT_DATA;
/* 110 */     PendingPacket pending = (PendingPacket)session.getSystemProperty("session_data_buffer");
/*     */ 
/* 122 */     String rawStr = new String(data);
/*     */ 
/* 125 */     StringBuilder buffer = (StringBuilder)pending.getBuffer();
/*     */ 
/* 128 */     buffer.append(rawStr);
/*     */ 
/* 131 */     int msgCount = 0;
/* 132 */     int posEOM = buffer.indexOf(this.EOM);
/*     */ 
/* 134 */     while (posEOM != -1)
/*     */     {
/* 136 */       msgCount++;
/*     */ 
/* 140 */       String fullMsg = buffer.substring(0, posEOM).trim();
/*     */ 
/* 144 */       int msgSize = fullMsg.length();
/*     */ 
/* 147 */       System.out.println("<<< PACKET COMPLETE >>>");
/* 148 */       System.out.println("=> " + fullMsg);
/*     */ 
/* 151 */       IPacket newPacket = new Packet();
/* 152 */       newPacket.setData(fullMsg);
/* 153 */       newPacket.setSender(session);
/* 154 */       newPacket.setOriginalSize(fullMsg.length());
/* 155 */       newPacket.setTransportType(TransportType.TCP);
/*     */ 
/* 158 */       newPacket.setAttribute("type", ProtocolType.TEXT);
/*     */ 
/* 160 */       this.protocolCodec.onPacketRead(newPacket);
/*     */ 
/* 163 */       buffer.delete(0, posEOM + 1);
/*     */ 
/* 166 */       posEOM = buffer.indexOf(this.EOM);
/*     */     }
/*     */ 
/* 169 */     data = new byte[0];
/* 170 */     return new ProcessedPacket(state, data);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.text.TextIoHandler
 * JD-Core Version:    0.6.0
 */