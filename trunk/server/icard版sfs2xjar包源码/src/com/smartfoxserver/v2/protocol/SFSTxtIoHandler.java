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
/*     */ import com.smartfoxserver.v2.protocol.text.TextIoHandler;
/*     */ import java.net.SocketAddress;
/*     */ import java.nio.ByteBuffer;
/*     */ import java.nio.channels.DatagramChannel;
/*     */ import java.util.Arrays;
/*     */ import java.util.Collection;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSTxtIoHandler extends AbstractIOHandler
/*     */ {
/*     */   private static final String FLASH_CROSSDOMAIN_POLICY_REQ = "<policy-file-request/>";
/*     */   private static final char TAG_TOKEN = '<';
/*     */   private static final char EOM = '\000';
/*  35 */   private static final int CROSSDOMAIN_REQ_LEN = "<policy-file-request/>".length() + 1;
/*     */   private static final int UDP_PACKET_MIN_SIZE = 13;
/*     */   private static final String KEY_UDP_HANDSHAKE = "h";
/*     */   private final TextIoHandler txtHandler;
/*     */   private final Logger logger;
/*     */   private final SmartFoxServer sfs;
/*     */   private final BitSwarmEngine engine;
/*     */   private ByteBuffer bufferedXmlSocketPolicy;
/*     */ 
/*     */   public SFSTxtIoHandler()
/*     */   {
/*  48 */     this.logger = LoggerFactory.getLogger(getClass());
/*  49 */     this.sfs = SmartFoxServer.getInstance();
/*  50 */     this.engine = BitSwarmEngine.getInstance();
/*  51 */     this.txtHandler = null;
/*  52 */     this.bufferedXmlSocketPolicy = null;
/*     */ 
/*  55 */     setCodec(new SFSProtocolCodec(this));
/*     */   }
/*     */ 
/*     */   public void onDataRead(ISession session, byte[] data)
/*     */   {
/*  65 */     if ((data == null) || (data.length < 1)) {
/*  66 */       throw new IllegalArgumentException("Unexpected null or empty byte array!");
/*     */     }
/*     */ 
/*  69 */     ProtocolType sessionProtocol = (ProtocolType)session.getSystemProperty("session_protocol");
/*     */ 
/*  83 */     if (sessionProtocol == null)
/*     */     {
/* 101 */       if (data[0] == 60)
/*     */       {
/* 103 */         handlSocketPolicyRequest(data, session);
/* 104 */         return;
/*     */       }
/*     */ 
/* 112 */       session.setSystemProperty("session_protocol", ProtocolType.TEXT);
/*     */     }
/*     */     else
/*     */     {
/* 118 */       this.txtHandler.handleRead(session, data);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void setCodec(IProtocolCodec codec)
/*     */   {
/* 124 */     super.setCodec(codec);
/* 125 */     this.txtHandler.setProtocolCodec(codec);
/*     */   }
/*     */ 
/*     */   public long getReadPackets()
/*     */   {
/* 132 */     return 1L;
/*     */   }
/*     */ 
/*     */   public long getIncomingDroppedPackets()
/*     */   {
/* 138 */     return 1L;
/*     */   }
/*     */ 
/*     */   public void onDataRead(DatagramChannel channel, SocketAddress address, byte[] data)
/*     */   {
/* 145 */     onTextUDP(channel, address, data);
/*     */   }
/*     */ 
/*     */   private void onTextUDP(DatagramChannel channel, SocketAddress address, byte[] data)
/*     */   {
/* 151 */     String senderIP = null;
/* 152 */     int senderPort = 0;
/*     */     try
/*     */     {
/* 160 */       if (data.length < 4) {
/* 161 */         throw new SFSCodecException("Packet too small: " + data.length + " bytes");
/*     */       }
/*     */ 
/* 164 */       if (data[(data.length - 1)] != 0) {
/* 165 */         throw new SFSCodecException("Invalid packet. No EOM byte found, size:" + data.length + " bytes");
/*     */       }
/*     */ 
/* 168 */       String[] adrData = address.toString().split("\\:");
/* 169 */       senderIP = adrData[0].substring(1);
/* 170 */       senderPort = Integer.parseInt(adrData[1]);
/*     */ 
/* 173 */       String jso = new String(data);
/*     */ 
/* 180 */       ISFSObject reqObj = SFSObject.newFromJsonData(jso);
/*     */ 
/* 183 */       ISession session = validateUDPRequest(senderIP, senderPort, reqObj);
/*     */ 
/* 196 */       if (reqObj.containsKey("h"))
/*     */       {
/* 198 */         if (this.logger.isDebugEnabled()) {
/* 199 */           this.logger.debug("UDP Handshake OK: " + session);
/*     */         }
/* 201 */         if (session.getDatagramChannel() == null) {
/* 202 */           session.setDatagrmChannel(channel);
/*     */         }
/* 204 */         sendUDPHandshakeResponse(session);
/* 205 */         return;
/*     */       }
/*     */ 
/* 211 */       IPacket newPacket = new Packet();
/* 212 */       newPacket.setData(reqObj);
/* 213 */       newPacket.setSender(session);
/* 214 */       newPacket.setOriginalSize(data.length);
/* 215 */       newPacket.setTransportType(TransportType.UDP);
/*     */ 
/* 218 */       newPacket.setAttribute("type", ProtocolType.TEXT);
/*     */ 
/* 220 */       this.codec.onPacketRead(newPacket);
/*     */     }
/*     */     catch (RuntimeException err)
/*     */     {
/* 224 */       this.logger.warn("Problems decoding UDP packet from: " + senderIP + ":" + senderPort + ", " + err);
/* 225 */       err.printStackTrace();
/*     */     }
/*     */     catch (SFSCodecException codecErr)
/*     */     {
/* 229 */       this.logger.warn(
/* 231 */         String.format(
/* 233 */         "Discard UDP packet from %s:%s, reason: %s ", new Object[] { 
/* 234 */         senderIP, 
/* 235 */         Integer.valueOf(senderPort), 
/* 236 */         codecErr.getMessage() }));
/*     */     }
/*     */   }
/*     */ 
/*     */   private ISession validateUDPRequest(String senderIP, int senderPort, ISFSObject packet)
/*     */     throws SFSCodecException
/*     */   {
/* 244 */     if (!packet.containsKey("c")) {
/* 245 */       throw new SFSCodecException("Missing controllerId");
/*     */     }
/* 247 */     if (!packet.containsKey("u")) {
/* 248 */       throw new SFSCodecException("Missing userId");
/*     */     }
/* 250 */     if (!packet.containsKey("i")) {
/* 251 */       throw new SFSCodecException("Missing packet id");
/*     */     }
/* 253 */     int userId = packet.getInt("u").intValue();
/* 254 */     User sender = this.sfs.getUserManager().getUserById(userId);
/*     */ 
/* 256 */     if (sender == null) {
/* 257 */       throw new SFSCodecException("User does not exist, id: " + userId);
/*     */     }
/* 259 */     ISession session = sender.getSession();
/*     */ 
/* 261 */     if (!session.getAddress().equals(senderIP)) {
/* 262 */       throw new SFSCodecException(String.format("Sender IP doesn't match TCP session address: %s != %s", new Object[] { senderIP, session.getAddress() }));
/*     */     }
/* 264 */     Integer sessionUdpPort = (Integer)session.getSystemProperty("UDPPort");
/*     */ 
/* 267 */     if (sessionUdpPort == null) {
/* 268 */       session.setSystemProperty("UDPPort", Integer.valueOf(senderPort));
/*     */     }
/* 271 */     else if (senderPort != sessionUdpPort.intValue()) {
/* 272 */       throw new SFSCodecException(String.format("Sender UDP Port doesn't match current session port: %s != %s", new Object[] { Integer.valueOf(senderPort), sessionUdpPort }));
/*     */     }
/*     */ 
/* 279 */     return sender.getSession();
/*     */   }
/*     */ 
/*     */   public void onDataWrite(IPacket packet)
/*     */   {
/* 289 */     if (packet.getRecipients().size() > 0)
/*     */     {
/*     */       try
/*     */       {
/* 293 */         this.txtHandler.handleWrite(packet);
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/* 297 */         ExceptionMessageComposer composer = new ExceptionMessageComposer(e);
/* 298 */         this.logger.warn(composer.toString());
/*     */       }
/*     */     }
/*     */   }
/*     */ 
/*     */   private byte[] handlSocketPolicyRequest(byte[] data, ISession session)
/*     */   {
/* 309 */     String stringMsg = new String(data);
/* 310 */     byte[] newData = data;
/*     */ 
/* 312 */     if (stringMsg.startsWith("<policy-file-request/>"))
/*     */     {
/* 315 */       this.logger.debug("Handling Flash Policy request");
/*     */ 
/* 317 */       if (data.length > CROSSDOMAIN_REQ_LEN) {
/* 318 */         newData = new byte[data.length - CROSSDOMAIN_REQ_LEN];
/*     */       }
/* 320 */       System.arraycopy(data, CROSSDOMAIN_REQ_LEN, newData, 0, newData.length - CROSSDOMAIN_REQ_LEN);
/*     */     }
/*     */ 
/* 324 */     if (this.bufferedXmlSocketPolicy == null)
/*     */     {
/* 326 */       String policyText = this.engine.getConfiguration().getFlashCrossdomainPolicyXml();
/* 327 */       this.bufferedXmlSocketPolicy = ByteBuffer.allocate(policyText.length() + 1);
/* 328 */       this.bufferedXmlSocketPolicy.put(policyText.getBytes());
/* 329 */       this.bufferedXmlSocketPolicy.put(0);
/* 330 */       this.bufferedXmlSocketPolicy.flip();
/*     */     }
/*     */ 
/* 333 */     IPacket policyPacket = new Packet();
/* 334 */     policyPacket.setData(this.bufferedXmlSocketPolicy.array());
/* 335 */     policyPacket.setTransportType(TransportType.TCP);
/* 336 */     policyPacket.setRecipients(Arrays.asList(new ISession[] { session }));
/*     */ 
/* 339 */     this.engine.getSocketWriter().enqueuePacket(policyPacket);
/*     */ 
/* 341 */     return newData;
/*     */   }
/*     */ 
/*     */   private void sendUDPHandshakeResponse(ISession recipient)
/*     */   {
/* 349 */     ISFSObject responseObj = new SFSObject();
/* 350 */     responseObj.putByte("c", 1);
/* 351 */     responseObj.putByte("h", 1);
/* 352 */     responseObj.putShort("a", 0);
/*     */ 
/* 354 */     IPacket udpResponsePacket = new Packet();
/* 355 */     udpResponsePacket.setTransportType(TransportType.UDP);
/* 356 */     udpResponsePacket.setRecipients(Arrays.asList(new ISession[] { recipient }));
/* 357 */     udpResponsePacket.setData(responseObj);
/*     */ 
/* 360 */     onDataWrite(udpResponsePacket);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.SFSTxtIoHandler
 * JD-Core Version:    0.6.0
 */