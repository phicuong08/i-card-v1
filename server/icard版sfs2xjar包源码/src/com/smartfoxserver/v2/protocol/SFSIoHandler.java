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
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import com.smartfoxserver.v2.entities.managers.IUserManager;
/*     */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*     */ import com.smartfoxserver.v2.exceptions.SFSCodecException;
/*     */ import com.smartfoxserver.v2.protocol.binary.BinaryIoHandler;
/*     */ import com.smartfoxserver.v2.protocol.binary.IPacketCompressor;
/*     */ import com.smartfoxserver.v2.protocol.binary.PacketHeader;
/*     */ import com.smartfoxserver.v2.protocol.binary.PacketReadState;
/*     */ import java.net.SocketAddress;
/*     */ import java.nio.ByteBuffer;
/*     */ import java.nio.channels.DatagramChannel;
/*     */ import java.util.Arrays;
/*     */ import java.util.Collection;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSIoHandler extends AbstractIOHandler
/*     */ {
/*     */   private static final String FLASH_CROSSDOMAIN_POLICY_REQ = "<policy-file-request/>";
/*     */   private static final char TAG_TOKEN = '<';
/*  46 */   private static final int CROSSDOMAIN_REQ_LEN = "<policy-file-request/>".length() + 1;
/*     */   private static final int UDP_PACKET_MIN_SIZE = 13;
/*     */   private static final String KEY_UDP_HANDSHAKE = "h";
/*     */   private final BinaryIoHandler binHandler;
/*     */   private final Logger logger;
/*     */   private final SmartFoxServer sfs;
/*     */   private final BitSwarmEngine engine;
/*     */   private ByteBuffer bufferedXmlSocketPolicy;
/*     */ 
/*     */   public SFSIoHandler()
/*     */   {
/*  61 */     this.logger = LoggerFactory.getLogger(getClass());
/*  62 */     this.sfs = SmartFoxServer.getInstance();
/*  63 */     this.engine = BitSwarmEngine.getInstance();
/*  64 */     this.binHandler = new BinaryIoHandler(this);
/*  65 */     this.bufferedXmlSocketPolicy = null;
/*     */ 
/*  68 */     setCodec(new SFSProtocolCodec(this));
/*     */   }
/*     */ 
/*     */   public void onDataRead(ISession session, byte[] data)
/*     */   {
/*  79 */     if ((data == null) || (data.length < 1)) {
/*  80 */       throw new IllegalArgumentException("Unexpected null or empty byte array!");
/*     */     }
/*     */ 
/*  83 */     ProtocolType sessionProtocol = (ProtocolType)session.getSystemProperty("session_protocol");
/*     */ 
/*  97 */     if (sessionProtocol == null)
/*     */     {
/* 115 */       if (data[0] == 60)
/*     */       {
/* 117 */         handlSocketPolicyRequest(data, session);
/* 118 */         return;
/*     */       }
/*     */ 
/* 126 */       session.setSystemProperty("session_protocol", ProtocolType.BINARY);
/* 127 */       session.setSystemProperty("read_state", PacketReadState.WAIT_NEW_PACKET);
/*     */     }
/*     */ 
/* 131 */     this.binHandler.handleRead(session, data);
/*     */   }
/*     */ 
/*     */   public void setCodec(IProtocolCodec codec)
/*     */   {
/* 137 */     super.setCodec(codec);
/* 138 */     this.binHandler.setProtocolCodec(codec);
/*     */   }
/*     */ 
/*     */   public long getReadPackets()
/*     */   {
/* 145 */     return this.binHandler.getReadPackets();
/*     */   }
/*     */ 
/*     */   public long getIncomingDroppedPackets()
/*     */   {
/* 151 */     return this.binHandler.getIncomingDroppedPackets();
/*     */   }
/*     */ 
/*     */   public void onDataRead(DatagramChannel channel, SocketAddress address, byte[] data)
/*     */   {
/* 158 */     String senderIP = null;
/* 159 */     int senderPort = 0;
/*     */     try
/*     */     {
/* 167 */       if (data.length < 4) {
/* 168 */         throw new SFSCodecException("Packet too small: " + data.length + " bytes");
/*     */       }
/*     */ 
/* 171 */       PacketHeader packetHeader = decodeFirstHeaderByte(data[0]);
/*     */ 
/* 174 */       int msb = data[1] & 0xFF;
/* 175 */       int lsb = data[2] & 0xFF;
/* 176 */       int dataSize = msb * 256 + lsb;
/*     */ 
/* 179 */       if (dataSize < 13) {
/* 180 */         throw new SFSCodecException("Packet data too small: " + data.length + " bytes");
/*     */       }
/*     */ 
/* 183 */       String[] adrData = address.toString().split("\\:");
/* 184 */       senderIP = adrData[0].substring(1);
/* 185 */       senderPort = Integer.parseInt(adrData[1]);
/*     */ 
/* 187 */       byte[] sfsObjData = new byte[data.length - 3];
/* 188 */       System.arraycopy(data, 3, sfsObjData, 0, sfsObjData.length);
/*     */ 
/* 190 */       if (sfsObjData.length != dataSize) {
/* 191 */         throw new SFSCodecException("Packet truncated. Expected: " + dataSize + ", only got: " + sfsObjData.length);
/*     */       }
/*     */ 
/* 194 */       if (packetHeader.isCompressed())
/*     */       {
/*     */         try
/*     */         {
/* 198 */           sfsObjData = this.binHandler.getPacketCompressor().uncompress(sfsObjData);
/*     */         }
/*     */         catch (Exception e)
/*     */         {
/* 203 */           throw new RuntimeException(e);
/*     */         }
/*     */ 
/*     */       }
/*     */ 
/* 212 */       ISFSObject reqObj = SFSObject.newFromBinaryData(sfsObjData);
/*     */ 
/* 215 */       ISession session = validateUDPRequest(senderIP, senderPort, reqObj);
/*     */ 
/* 228 */       if (reqObj.containsKey("h"))
/*     */       {
/* 230 */         if (this.logger.isDebugEnabled()) {
/* 231 */           this.logger.debug("UDP Handshake OK: " + session);
/*     */         }
/* 233 */         if (session.getDatagramChannel() == null) {
/* 234 */           session.setDatagrmChannel(channel);
/*     */         }
/* 236 */         sendUDPHandshakeResponse(session);
/* 237 */         return;
/*     */       }
/*     */ 
/* 243 */       IPacket newPacket = new Packet();
/* 244 */       newPacket.setData(reqObj);
/* 245 */       newPacket.setSender(session);
/* 246 */       newPacket.setOriginalSize(dataSize);
/* 247 */       newPacket.setTransportType(TransportType.UDP);
/*     */ 
/* 250 */       newPacket.setAttribute("type", ProtocolType.BINARY);
/*     */ 
/* 252 */       this.codec.onPacketRead(newPacket);
/*     */     }
/*     */     catch (RuntimeException err)
/*     */     {
/* 256 */       this.logger.warn("Problems decoding UDP packet from: " + senderIP + ":" + senderPort + ", " + err);
/* 257 */       err.printStackTrace();
/*     */     }
/*     */     catch (SFSCodecException codecErr)
/*     */     {
/* 261 */       this.logger.warn(
/* 263 */         String.format(
/* 265 */         "Discard UDP packet from %s:%s, reason: %s ", new Object[] { 
/* 266 */         senderIP, 
/* 267 */         Integer.valueOf(senderPort), 
/* 268 */         codecErr.getMessage() }));
/*     */     }
/*     */   }
/*     */ 
/*     */   private ISession validateUDPRequest(String senderIP, int senderPort, ISFSObject packet)
/*     */     throws SFSCodecException
/*     */   {
/* 276 */     if (!packet.containsKey("c")) {
/* 277 */       throw new SFSCodecException("Missing controllerId");
/*     */     }
/* 279 */     if (!packet.containsKey("u")) {
/* 280 */       throw new SFSCodecException("Missing userId");
/*     */     }
/* 282 */     if (!packet.containsKey("i")) {
/* 283 */       throw new SFSCodecException("Missing packet id");
/*     */     }
/* 285 */     int userId = packet.getInt("u").intValue();
/* 286 */     User sender = this.sfs.getUserManager().getUserById(userId);
/*     */ 
/* 288 */     if (sender == null) {
/* 289 */       throw new SFSCodecException("User does not exist, id: " + userId);
/*     */     }
/* 291 */     ISession session = sender.getSession();
/*     */ 
/* 293 */     if (!session.getAddress().equals(senderIP)) {
/* 294 */       throw new SFSCodecException(String.format("Sender IP doesn't match TCP session address: %s != %s", new Object[] { senderIP, session.getAddress() }));
/*     */     }
/* 296 */     Integer sessionUdpPort = (Integer)session.getSystemProperty("UDPPort");
/*     */ 
/* 299 */     if (sessionUdpPort == null) {
/* 300 */       session.setSystemProperty("UDPPort", Integer.valueOf(senderPort));
/*     */     }
/* 303 */     else if (senderPort != sessionUdpPort.intValue()) {
/* 304 */       throw new SFSCodecException(String.format("Sender UDP Port doesn't match current session port: %s != %s", new Object[] { Integer.valueOf(senderPort), sessionUdpPort }));
/*     */     }
/*     */ 
/* 311 */     return sender.getSession();
/*     */   }
/*     */ 
/*     */   public void onDataWrite(IPacket packet)
/*     */   {
/* 321 */     if (packet.getRecipients().size() > 0)
/*     */     {
/*     */       try
/*     */       {
/* 325 */         this.binHandler.handleWrite(packet);
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/* 329 */         ExceptionMessageComposer composer = new ExceptionMessageComposer(e);
/* 330 */         this.logger.warn(composer.toString());
/*     */       }
/*     */     }
/*     */   }
/*     */ 
/*     */   public PacketHeader decodeFirstHeaderByte(byte headerByte)
/*     */   {
/* 338 */     return new PacketHeader(
/* 340 */       (headerByte & 0x80) > 0, 
/* 341 */       (headerByte & 0x40) > 0, 
/* 342 */       (headerByte & 0x20) > 0, 
/* 343 */       (headerByte & 0x10) > 0, 
/* 344 */       (headerByte & 0x8) > 0);
/*     */   }
/*     */ 
/*     */   public byte encodeFirstHeaderByte(PacketHeader packetHeader)
/*     */   {
/* 350 */     byte headerByte = 0;
/*     */ 
/* 352 */     if (packetHeader.isBinary()) {
/* 353 */       headerByte = (byte)(headerByte + 128);
/*     */     }
/* 355 */     if (packetHeader.isEncrypted()) {
/* 356 */       headerByte = (byte)(headerByte + 64);
/*     */     }
/* 358 */     if (packetHeader.isCompressed()) {
/* 359 */       headerByte = (byte)(headerByte + 32);
/*     */     }
/* 361 */     if (packetHeader.isBlueBoxed()) {
/* 362 */       headerByte = (byte)(headerByte + 16);
/*     */     }
/* 364 */     if (packetHeader.isBigSized()) {
/* 365 */       headerByte = (byte)(headerByte + 8);
/*     */     }
/* 367 */     return headerByte;
/*     */   }
/*     */ 
/*     */   private byte[] handlSocketPolicyRequest(byte[] data, ISession session)
/*     */   {
/* 376 */     String stringMsg = new String(data);
/* 377 */     byte[] newData = data;
/*     */ 
/* 379 */     if (stringMsg.startsWith("<policy-file-request/>"))
/*     */     {
/* 382 */       this.logger.debug("Handling Flash Policy request");
/*     */ 
/* 384 */       if (data.length > CROSSDOMAIN_REQ_LEN) {
/* 385 */         newData = new byte[data.length - CROSSDOMAIN_REQ_LEN];
/*     */       }
/* 387 */       System.arraycopy(data, CROSSDOMAIN_REQ_LEN, newData, 0, newData.length - CROSSDOMAIN_REQ_LEN);
/*     */     }
/*     */ 
/* 391 */     if (this.bufferedXmlSocketPolicy == null)
/*     */     {
/* 393 */       String policyText = this.engine.getConfiguration().getFlashCrossdomainPolicyXml();
/* 394 */       this.bufferedXmlSocketPolicy = ByteBuffer.allocate(policyText.length() + 1);
/* 395 */       this.bufferedXmlSocketPolicy.put(policyText.getBytes());
/* 396 */       this.bufferedXmlSocketPolicy.put(0);
/* 397 */       this.bufferedXmlSocketPolicy.flip();
/*     */     }
/*     */ 
/* 400 */     IPacket policyPacket = new Packet();
/* 401 */     policyPacket.setData(this.bufferedXmlSocketPolicy.array());
/* 402 */     policyPacket.setTransportType(TransportType.TCP);
/* 403 */     policyPacket.setRecipients(Arrays.asList(new ISession[] { session }));
/*     */ 
/* 406 */     this.engine.getSocketWriter().enqueuePacket(policyPacket);
/*     */ 
/* 408 */     return newData;
/*     */   }
/*     */ 
/*     */   private void sendUDPHandshakeResponse(ISession recipient)
/*     */   {
/* 416 */     ISFSObject responseObj = new SFSObject();
/* 417 */     responseObj.putByte("c", 1);
/* 418 */     responseObj.putByte("h", 1);
/* 419 */     responseObj.putShort("a", 0);
/*     */ 
/* 421 */     IPacket udpResponsePacket = new Packet();
/* 422 */     udpResponsePacket.setTransportType(TransportType.UDP);
/* 423 */     udpResponsePacket.setRecipients(Arrays.asList(new ISession[] { recipient }));
/* 424 */     udpResponsePacket.setData(responseObj);
/*     */ 
/* 427 */     onDataWrite(udpResponsePacket);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.SFSIoHandler
 * JD-Core Version:    0.6.0
 */