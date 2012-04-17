/*     */ package com.smartfoxserver.v2.protocol;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.config.EngineConfiguration;
/*     */ import com.smartfoxserver.bitswarm.core.BitSwarmEngine;
/*     */ import com.smartfoxserver.bitswarm.core.ISocketWriter;
/*     */ import com.smartfoxserver.bitswarm.data.IPacket;
/*     */ import com.smartfoxserver.bitswarm.data.Packet;
/*     */ import com.smartfoxserver.bitswarm.data.TransportType;
/*     */ import com.smartfoxserver.bitswarm.io.AbstractIOHandler;
/*     */ import com.smartfoxserver.bitswarm.io.IProtocolCodec;
/*     */ import com.smartfoxserver.bitswarm.io.protocols.ProtocolType;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.bitswarm.util.ByteUtils;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*     */ import com.smartfoxserver.v2.protocol.binary.BinaryIoHandler;
/*     */ import com.smartfoxserver.v2.protocol.binary.PacketHeader;
/*     */ import com.smartfoxserver.v2.protocol.binary.PacketReadState;
/*     */ import com.smartfoxserver.v2.protocol.text.TextIoHandler;
/*     */ import java.io.PrintStream;
/*     */ import java.net.SocketAddress;
/*     */ import java.nio.ByteBuffer;
/*     */ import java.nio.channels.DatagramChannel;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Arrays;
/*     */ import java.util.Collection;
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class DefaultIoHandler extends AbstractIOHandler
/*     */ {
/*     */   private static final String FLASH_CROSSDOMAIN_POLICY_REQ = "<policy-file-request/>";
/*     */   private static final char TAG_TOKEN = '<';
/*  36 */   private static final int CROSSDOMAIN_REQ_LEN = "<policy-file-request/>".length() + 1;
/*     */   private final BinaryIoHandler binHandler;
/*     */   private final TextIoHandler textHandler;
/*     */   private final Logger logger;
/*     */   private final SmartFoxServer sfs;
/*     */   private final BitSwarmEngine engine;
/*  44 */   private boolean useBinaryProtocol = false;
/*     */   private ByteBuffer bufferedXmlSocketPolicy;
/*     */ 
/*     */   public DefaultIoHandler()
/*     */   {
/*  50 */     this.logger = LoggerFactory.getLogger(getClass());
/*  51 */     this.sfs = SmartFoxServer.getInstance();
/*  52 */     this.engine = BitSwarmEngine.getInstance();
/*  53 */     this.binHandler = null;
/*  54 */     this.textHandler = null;
/*  55 */     this.bufferedXmlSocketPolicy = null;
/*     */ 
/*  58 */     setCodec(new DefaultProtocolCodec(this));
/*     */   }
/*     */ 
/*     */   public long getIncomingDroppedPackets()
/*     */   {
/*  67 */     return 0L;
/*     */   }
/*     */ 
/*     */   public void onDataRead(ISession session, byte[] data)
/*     */   {
/*  75 */     if ((data == null) || (data.length < 1)) {
/*  76 */       throw new IllegalArgumentException("Unexpected null or empty byte array!");
/*     */     }
/*     */ 
/*  79 */     ProtocolType sessionProtocol = (ProtocolType)session.getSystemProperty("session_protocol");
/*     */ 
/*  93 */     if (sessionProtocol == null)
/*     */     {
/* 111 */       if (data[0] == 60) {
/* 112 */         handlSocketPolicyRequest(data, session);
/*     */       }
/*     */       else
/*     */       {
/* 117 */         sessionProtocol = decodeProtocol(data[0]);
/* 118 */         session.setSystemProperty("session_protocol", sessionProtocol);
/* 119 */         session.setSystemProperty("read_state", PacketReadState.WAIT_NEW_PACKET);
/*     */       }
/*     */     }
/*     */ 
/* 123 */     if (sessionProtocol != null)
/*     */     {
/* 125 */       if (sessionProtocol == ProtocolType.BINARY) {
/* 126 */         this.binHandler.handleRead(session, data);
/*     */       }
/* 128 */       else if (sessionProtocol == ProtocolType.TEXT)
/* 129 */         this.textHandler.handleRead(session, data);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void setCodec(IProtocolCodec codec)
/*     */   {
/* 136 */     super.setCodec(codec);
/* 137 */     this.binHandler.setProtocolCodec(codec);
/* 138 */     this.textHandler.setProtocolCodec(codec);
/*     */   }
/*     */ 
/*     */   public void onDataRead(DatagramChannel channel, SocketAddress address, byte[] data)
/*     */   {
/* 144 */     System.out.println("UDP DATA:\n " + ByteUtils.fullHexDump(data));
/*     */   }
/*     */ 
/*     */   public void onDataWrite(IPacket packet)
/*     */   {
/* 165 */     List textProtocolRecipients = null;
/*     */ 
/* 168 */     if (!this.useBinaryProtocol)
/*     */     {
/* 170 */       for (Iterator iter = packet.getRecipients().iterator(); iter.hasNext(); )
/*     */       {
/* 172 */         ISession session = (ISession)iter.next();
/* 173 */         ProtocolType proto = (ProtocolType)session.getSystemProperty("session_protocol");
/*     */ 
/* 175 */         if ((proto == null) || (proto != ProtocolType.TEXT))
/*     */           continue;
/* 177 */         if (textProtocolRecipients == null) {
/* 178 */           textProtocolRecipients = new ArrayList();
/*     */         }
/*     */ 
/* 181 */         iter.remove();
/*     */ 
/* 184 */         textProtocolRecipients.add(session);
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 190 */     if (packet.getRecipients().size() > 0)
/*     */     {
/*     */       try
/*     */       {
/* 194 */         this.binHandler.handleWrite(packet);
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/* 198 */         ExceptionMessageComposer composer = new ExceptionMessageComposer(e);
/* 199 */         this.logger.warn(composer.toString());
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 205 */     if ((textProtocolRecipients != null) && (textProtocolRecipients.size() > 0))
/*     */     {
/* 208 */       IPacket textPacket = packet.clone();
/*     */ 
/* 211 */       textPacket.setRecipients(textProtocolRecipients);
/*     */ 
/* 213 */       this.textHandler.handleWrite(packet);
/*     */     }
/*     */   }
/*     */ 
/*     */   public PacketHeader decodeFirstHeaderByte(byte headerByte)
/*     */   {
/* 220 */     return new PacketHeader(
/* 221 */       (headerByte & 0x80) > 0, 
/* 222 */       (headerByte & 0x40) > 0, 
/* 223 */       (headerByte & 0x20) > 0, 
/* 224 */       (headerByte & 0x10) > 0, 
/* 225 */       (headerByte & 0x8) > 0);
/*     */   }
/*     */ 
/*     */   public byte encodeFirstHeaderByte(PacketHeader packetHeader)
/*     */   {
/* 231 */     byte headerByte = 0;
/*     */ 
/* 233 */     if (packetHeader.isBinary()) {
/* 234 */       headerByte = (byte)(headerByte + 128);
/*     */     }
/* 236 */     if (packetHeader.isEncrypted()) {
/* 237 */       headerByte = (byte)(headerByte + 64);
/*     */     }
/* 239 */     if (packetHeader.isCompressed()) {
/* 240 */       headerByte = (byte)(headerByte + 32);
/*     */     }
/* 242 */     if (packetHeader.isBlueBoxed()) {
/* 243 */       headerByte = (byte)(headerByte + 16);
/*     */     }
/* 245 */     if (packetHeader.isBigSized()) {
/* 246 */       headerByte = (byte)(headerByte + 8);
/*     */     }
/* 248 */     return headerByte;
/*     */   }
/*     */ 
/*     */   private byte[] handlSocketPolicyRequest(byte[] data, ISession session)
/*     */   {
/* 257 */     String stringMsg = new String(data);
/* 258 */     byte[] newData = data;
/*     */ 
/* 260 */     if (stringMsg.startsWith("<policy-file-request/>"))
/*     */     {
/* 263 */       this.logger.debug("Handling Flash Policy request");
/*     */ 
/* 265 */       if (data.length > CROSSDOMAIN_REQ_LEN) {
/* 266 */         newData = new byte[data.length - CROSSDOMAIN_REQ_LEN];
/*     */       }
/* 268 */       System.arraycopy(data, CROSSDOMAIN_REQ_LEN, newData, 0, newData.length - CROSSDOMAIN_REQ_LEN);
/*     */     }
/*     */ 
/* 272 */     if (this.bufferedXmlSocketPolicy == null)
/*     */     {
/* 274 */       String policyText = this.engine.getConfiguration().getFlashCrossdomainPolicyXml();
/* 275 */       this.bufferedXmlSocketPolicy = ByteBuffer.allocate(policyText.length() + 1);
/* 276 */       this.bufferedXmlSocketPolicy.put(policyText.getBytes());
/* 277 */       this.bufferedXmlSocketPolicy.put(0);
/* 278 */       this.bufferedXmlSocketPolicy.flip();
/*     */     }
/*     */ 
/* 281 */     IPacket policyPacket = new Packet();
/* 282 */     policyPacket.setData(this.bufferedXmlSocketPolicy.array());
/* 283 */     policyPacket.setTransportType(TransportType.TCP);
/* 284 */     policyPacket.setRecipients(Arrays.asList(new ISession[] { session }));
/*     */ 
/* 287 */     this.engine.getSocketWriter().enqueuePacket(policyPacket);
/*     */ 
/* 289 */     return newData;
/*     */   }
/*     */ 
/*     */   private ProtocolType decodeProtocol(byte headerFirstByte)
/*     */   {
/* 294 */     return (headerFirstByte & 0x80) > 0 ? ProtocolType.BINARY : ProtocolType.TEXT;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.DefaultIoHandler
 * JD-Core Version:    0.6.0
 */