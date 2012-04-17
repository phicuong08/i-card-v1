/*     */ package com.smartfoxserver.v2.protocol.binary;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.config.EngineConfiguration;
/*     */ import com.smartfoxserver.bitswarm.core.BitSwarmEngine;
/*     */ import com.smartfoxserver.bitswarm.core.ISocketWriter;
/*     */ import com.smartfoxserver.bitswarm.data.IPacket;
/*     */ import com.smartfoxserver.bitswarm.data.Packet;
/*     */ import com.smartfoxserver.bitswarm.data.TransportType;
/*     */ import com.smartfoxserver.bitswarm.io.IProtocolCodec;
/*     */ import com.smartfoxserver.bitswarm.io.protocols.ProtocolType;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.bitswarm.util.ByteUtils;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.config.IConfigurator;
/*     */ import com.smartfoxserver.v2.config.ServerSettings;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.managers.IUserManager;
/*     */ import com.smartfoxserver.v2.protocol.SFSIoHandler;
/*     */ import java.nio.ByteBuffer;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class BinaryIoHandler
/*     */ {
/*     */   private static final int SHORT_SIZE = 2;
/*     */   private static final int INT_SIZE = 4;
/*     */   private final Logger log;
/*     */   private final BitSwarmEngine engine;
/*     */   private final SmartFoxServer sfs;
/*     */   private final SFSIoHandler parentHandler;
/*     */   private final IPacketCompressor packetCompressor;
/*     */   private final IPacketEncrypter packetEncrypter;
/*     */   private IProtocolCodec protocolCodec;
/*     */   private ServerSettings serverSettings;
/*     */   private final int maxIncomingPacketSize;
/*  37 */   private volatile long packetsRead = 0L;
/*  38 */   private volatile long droppedIncomingPackets = 0L;
/*     */ 
/*     */   public BinaryIoHandler(SFSIoHandler parentHandler)
/*     */   {
/*  42 */     this.log = LoggerFactory.getLogger(getClass());
/*  43 */     this.engine = BitSwarmEngine.getInstance();
/*  44 */     this.sfs = SmartFoxServer.getInstance();
/*  45 */     this.parentHandler = parentHandler;
/*  46 */     this.serverSettings = SmartFoxServer.getInstance().getConfigurator().getServerSettings();
/*  47 */     this.packetCompressor = new DefaultPacketCompressor();
/*  48 */     this.packetEncrypter = new DefaultPacketEncrypter();
/*  49 */     this.maxIncomingPacketSize = BitSwarmEngine.getInstance().getConfiguration().getMaxIncomingRequestSize();
/*     */   }
/*     */ 
/*     */   public void setProtocolCodec(IProtocolCodec protocolCodec)
/*     */   {
/*  54 */     this.protocolCodec = protocolCodec;
/*     */   }
/*     */ 
/*     */   public IPacketCompressor getPacketCompressor()
/*     */   {
/*  59 */     return this.packetCompressor;
/*     */   }
/*     */ 
/*     */   public long getReadPackets()
/*     */   {
/*  64 */     return this.packetsRead;
/*     */   }
/*     */ 
/*     */   public long getIncomingDroppedPackets()
/*     */   {
/*  69 */     return this.droppedIncomingPackets;
/*     */   }
/*     */ 
/*     */   public void handleWrite(IPacket packet)
/*     */     throws Exception
/*     */   {
/*  75 */     byte[] binData = ((ISFSObject)packet.getData()).toBinary();
/*  76 */     packet.setData(binData);
/*     */ 
/*  79 */     boolean isEncrypted = false;
/*  80 */     if (packet.getAttribute("encryption") != null) {
/*  81 */       isEncrypted = ((Boolean)packet.getAttribute("encryption")).booleanValue();
/*     */     }
/*     */ 
/*  91 */     boolean isCompressed = false;
/*  92 */     int originalSize = binData.length;
/*  93 */     if (!isEncrypted)
/*     */     {
/*  95 */       if (binData.length > this.serverSettings.protocolCompressionThreshold)
/*     */       {
/*  97 */         byte[] beforeCompression = binData;
/*  98 */         binData = this.packetCompressor.compress(binData);
/*     */ 
/* 105 */         if (binData != beforeCompression) {
/* 106 */           isCompressed = true;
/*     */         }
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 112 */     int sizeBytes = 2;
/*     */ 
/* 114 */     if (binData.length > 65535) {
/* 115 */       sizeBytes = 4;
/*     */     }
/*     */ 
/* 137 */     PacketHeader packetHeader = new PacketHeader(
/* 139 */       true, 
/* 140 */       isEncrypted, 
/* 141 */       isCompressed, 
/* 142 */       false, 
/* 143 */       sizeBytes > 2);
/*     */ 
/* 147 */     byte headerByte = this.parentHandler.encodeFirstHeaderByte(packetHeader);
/*     */ 
/* 150 */     ByteBuffer packetBuffer = ByteBuffer.allocate(1 + sizeBytes + binData.length);
/* 151 */     packetBuffer.put(headerByte);
/*     */ 
/* 153 */     if (sizeBytes > 2)
/* 154 */       packetBuffer.putInt(binData.length);
/*     */     else {
/* 156 */       packetBuffer.putShort((short)binData.length);
/*     */     }
/* 158 */     packetBuffer.put(binData);
/*     */ 
/* 160 */     packet.setData(packetBuffer.array());
/*     */ 
/* 163 */     if ((isCompressed) && (this.log.isDebugEnabled())) {
/* 164 */       this.log.debug(String.format(" (cmp: %sb / %sb)", new Object[] { Integer.valueOf(originalSize), Integer.valueOf(binData.length) }));
/*     */     }
/* 166 */     if ((binData.length < 1024) && (this.log.isDebugEnabled())) {
/* 167 */       this.log.debug(ByteUtils.fullHexDump((byte[])packet.getData()));
/*     */     }
/*     */ 
/* 171 */     this.engine.getSocketWriter().enqueuePacket(packet);
/*     */   }
/*     */ 
/*     */   public void handleRead(ISession session, byte[] data)
/*     */   {
/* 187 */     if ((data.length < 1024) && (this.log.isDebugEnabled())) {
/* 188 */       this.log.debug(ByteUtils.fullHexDump(data));
/*     */     }
/*     */ 
/* 191 */     PacketReadState readState = (PacketReadState)session.getSystemProperty("read_state");
/*     */     try
/*     */     {
/* 204 */       while (data.length > 0)
/*     */       {
/* 206 */         if (this.log.isDebugEnabled()) {
/* 207 */           this.log.debug("STATE: " + readState);
/*     */         }
/* 209 */         if (readState == PacketReadState.WAIT_NEW_PACKET)
/*     */         {
/* 211 */           ProcessedPacket process = handleNewPacket(session, data);
/* 212 */           readState = process.getState();
/* 213 */           data = process.getData();
/*     */         }
/*     */ 
/* 216 */         if (readState == PacketReadState.WAIT_DATA_SIZE)
/*     */         {
/* 218 */           ProcessedPacket process = handleDataSize(session, data);
/* 219 */           readState = process.getState();
/* 220 */           data = process.getData();
/*     */         }
/*     */ 
/* 223 */         if (readState == PacketReadState.WAIT_DATA_SIZE_FRAGMENT)
/*     */         {
/* 225 */           ProcessedPacket process = handleDataSizeFragment(session, data);
/* 226 */           readState = process.getState();
/* 227 */           data = process.getData();
/*     */         }
/*     */ 
/* 230 */         if (readState != PacketReadState.WAIT_DATA)
/*     */           continue;
/* 232 */         ProcessedPacket process = handlePacketData(session, data);
/* 233 */         readState = process.getState();
/* 234 */         data = process.getData();
/*     */       }
/*     */ 
/*     */     }
/*     */     catch (Exception err)
/*     */     {
/* 241 */       this.log.warn(err.getMessage());
/* 242 */       readState = PacketReadState.WAIT_NEW_PACKET;
/*     */     }
/*     */ 
/* 245 */     session.setSystemProperty("read_state", readState);
/*     */   }
/*     */ 
/*     */   private ProcessedPacket handleNewPacket(ISession session, byte[] data)
/*     */   {
/* 257 */     PacketHeader header = this.parentHandler.decodeFirstHeaderByte(data[0]);
/*     */ 
/* 260 */     session.setSystemProperty("session_data_buffer", new PendingPacket(header));
/*     */ 
/* 263 */     data = ByteUtils.resizeByteArray(data, 1, data.length - 1);
/*     */ 
/* 266 */     return new ProcessedPacket(PacketReadState.WAIT_DATA_SIZE, data);
/*     */   }
/*     */ 
/*     */   private ProcessedPacket handleDataSize(ISession session, byte[] data)
/*     */   {
/* 275 */     PacketReadState state = PacketReadState.WAIT_DATA;
/* 276 */     PendingPacket pending = (PendingPacket)session.getSystemProperty("session_data_buffer");
/* 277 */     int dataSize = -1;
/* 278 */     int sizeBytes = 2;
/*     */ 
/* 281 */     if (pending.getHeader().isBigSized())
/*     */     {
/* 284 */       if (data.length >= 4)
/*     */       {
/* 287 */         dataSize = 0;
/*     */ 
/* 289 */         for (int i = 0; i < 4; i++)
/*     */         {
/* 292 */           int pow256 = (int)Math.pow(256.0D, 3 - i);
/*     */ 
/* 295 */           int intByte = data[i] & 0xFF;
/*     */ 
/* 297 */           dataSize += pow256 * intByte;
/*     */         }
/*     */       }
/*     */ 
/* 301 */       sizeBytes = 4;
/*     */ 
/* 303 */       if (this.log.isDebugEnabled()) {
/* 304 */         this.log.debug("BIG SIZED PACKET: " + (dataSize == -1 ? "Unknown" : Integer.valueOf(dataSize)));
/*     */       }
/*     */ 
/*     */     }
/*     */     else
/*     */     {
/* 311 */       if (data.length >= 2)
/*     */       {
/* 314 */         int msb = data[0] & 0xFF;
/* 315 */         int lsb = data[1] & 0xFF;
/* 316 */         dataSize = msb * 256 + lsb;
/*     */       }
/*     */ 
/* 319 */       if (this.log.isDebugEnabled()) {
/* 320 */         this.log.debug("NORMAL SIZED PACKET: " + (dataSize == -1 ? "Unknown" : Integer.valueOf(dataSize)));
/*     */       }
/*     */     }
/*     */ 
/* 324 */     if (dataSize != -1)
/*     */     {
/* 327 */       validateIncomingDataSize(session, dataSize);
/*     */ 
/* 330 */       pending.getHeader().setExpectedLen(dataSize);
/*     */ 
/* 333 */       pending.setBuffer(ByteBuffer.allocate(dataSize));
/* 334 */       data = ByteUtils.resizeByteArray(data, sizeBytes, data.length - sizeBytes);
/*     */     }
/*     */     else
/*     */     {
/* 338 */       state = PacketReadState.WAIT_DATA_SIZE_FRAGMENT;
/*     */ 
/* 341 */       ByteBuffer sizeBuffer = ByteBuffer.allocate(4);
/* 342 */       sizeBuffer.put(data);
/*     */ 
/* 345 */       pending.setBuffer(sizeBuffer);
/*     */ 
/* 348 */       data = new byte[0];
/*     */     }
/*     */ 
/* 357 */     return new ProcessedPacket(state, data);
/*     */   }
/*     */ 
/*     */   private ProcessedPacket handleDataSizeFragment(ISession session, byte[] data)
/*     */   {
/* 363 */     if (this.log.isDebugEnabled()) {
/* 364 */       this.log.debug("Handling DataSize fragment...");
/*     */     }
/* 366 */     PacketReadState state = PacketReadState.WAIT_DATA_SIZE_FRAGMENT;
/* 367 */     PendingPacket pending = (PendingPacket)session.getSystemProperty("session_data_buffer");
/* 368 */     ByteBuffer sizeBuffer = (ByteBuffer)pending.getBuffer();
/*     */ 
/* 371 */     int remaining = pending.getHeader().isBigSized() ? 4 - sizeBuffer.position() : 2 - sizeBuffer.position();
/*     */ 
/* 374 */     if (data.length >= remaining)
/*     */     {
/* 376 */       sizeBuffer.put(data, 0, remaining);
/* 377 */       sizeBuffer.flip();
/* 378 */       int dataSize = pending.getHeader().isBigSized() ? sizeBuffer.getInt() : sizeBuffer.getShort();
/*     */ 
/* 380 */       if (this.log.isDebugEnabled()) {
/* 381 */         this.log.debug("DataSize is ready: " + dataSize);
/*     */       }
/*     */ 
/* 385 */       validateIncomingDataSize(session, dataSize);
/* 386 */       pending.getHeader().setExpectedLen(dataSize);
/* 387 */       pending.setBuffer(ByteBuffer.allocate(dataSize));
/*     */ 
/* 390 */       state = PacketReadState.WAIT_DATA;
/*     */ 
/* 393 */       if (data.length > remaining)
/* 394 */         data = ByteUtils.resizeByteArray(data, remaining, data.length - remaining);
/*     */       else {
/* 396 */         data = new byte[0];
/*     */       }
/*     */ 
/*     */     }
/*     */     else
/*     */     {
/* 403 */       sizeBuffer.put(data);
/* 404 */       data = new byte[0];
/*     */     }
/*     */ 
/* 407 */     return new ProcessedPacket(state, data);
/*     */   }
/*     */ 
/*     */   private ProcessedPacket handlePacketData(ISession session, byte[] data)
/*     */     throws Exception
/*     */   {
/* 416 */     PacketReadState state = PacketReadState.WAIT_DATA;
/* 417 */     PendingPacket pending = (PendingPacket)session.getSystemProperty("session_data_buffer");
/* 418 */     ByteBuffer dataBuffer = (ByteBuffer)pending.getBuffer();
/*     */ 
/* 421 */     int readLen = dataBuffer.remaining();
/*     */ 
/* 424 */     boolean isThereMore = data.length > readLen;
/*     */ 
/* 427 */     if (data.length >= readLen)
/*     */     {
/* 429 */       dataBuffer.put(data, 0, readLen);
/*     */ 
/* 432 */       if (pending.getHeader().getExpectedLen() != dataBuffer.capacity())
/*     */       {
/* 434 */         throw new IllegalStateException(
/* 435 */           "Expected data size differs from the buffer capacity! Expected: " + 
/* 436 */           pending.getHeader().getExpectedLen() + 
/* 437 */           ", Buffer size: " + 
/* 438 */           dataBuffer.capacity());
/*     */       }
/*     */ 
/* 442 */       if (this.log.isDebugEnabled()) {
/* 443 */         this.log.debug("<<< PACKET COMPLETE >>>");
/*     */       }
/*     */ 
/* 450 */       if (pending.getHeader().isCompressed())
/*     */       {
/*     */         byte[] compressedData;
/*     */         byte[] compressedData;
/* 455 */         if (data.length == readLen) {
/* 456 */           compressedData = dataBuffer.array();
/*     */         }
/*     */         else
/*     */         {
/* 462 */           compressedData = new byte[pending.getHeader().getExpectedLen()];
/* 463 */           System.arraycopy(data, 0, compressedData, 0, compressedData.length);
/*     */         }
/*     */ 
/* 466 */         long t1 = System.nanoTime();
/* 467 */         byte[] deflatedData = this.packetCompressor.uncompress(compressedData);
/* 468 */         long t2 = System.nanoTime();
/*     */ 
/* 470 */         if (this.log.isDebugEnabled())
/*     */         {
/* 472 */           this.log.debug("<<< Packet was decompressed >>>");
/* 473 */           this.log.debug(
/* 475 */             String.format(
/* 477 */             "Original: %s, Deflated: %s, Comp. Ratio: %s%%, Time: %sms.", new Object[] { 
/* 478 */             Integer.valueOf(dataBuffer.capacity()), 
/* 479 */             Integer.valueOf(deflatedData.length), 
/* 480 */             Integer.valueOf(100 - dataBuffer.capacity() * 100 / deflatedData.length), 
/* 481 */             Float.valueOf((float)(t2 - t1) / 1000000.0F) }));
/*     */         }
/*     */ 
/* 491 */         dataBuffer = ByteBuffer.wrap(deflatedData);
/*     */       }
/*     */ 
/* 495 */       IPacket newPacket = new Packet();
/* 496 */       newPacket.setData(dataBuffer);
/* 497 */       newPacket.setSender(session);
/* 498 */       newPacket.setOriginalSize(dataBuffer.capacity());
/* 499 */       newPacket.setTransportType(TransportType.TCP);
/*     */ 
/* 502 */       newPacket.setAttribute("type", ProtocolType.BINARY);
/*     */ 
/* 504 */       this.packetsRead += 1L;
/* 505 */       this.protocolCodec.onPacketRead(newPacket);
/*     */ 
/* 515 */       state = PacketReadState.WAIT_NEW_PACKET;
/*     */     }
/*     */     else
/*     */     {
/* 521 */       dataBuffer.put(data);
/*     */ 
/* 523 */       if (this.log.isDebugEnabled()) {
/* 524 */         this.log.debug("NOT ENOUGH DATA, GO AHEAD");
/*     */       }
/*     */     }
/*     */ 
/* 528 */     if (isThereMore)
/* 529 */       data = ByteUtils.resizeByteArray(data, readLen, data.length - readLen);
/*     */     else {
/* 531 */       data = new byte[0];
/*     */     }
/* 533 */     return new ProcessedPacket(state, data);
/*     */   }
/*     */ 
/*     */   private void validateIncomingDataSize(ISession session, int dataSize)
/*     */   {
/* 540 */     User user = this.sfs.getUserManager().getUserBySession(session);
/* 541 */     String who = user != null ? user.toString() : session.toString();
/*     */ 
/* 543 */     if (dataSize < 1)
/*     */     {
/* 545 */       this.droppedIncomingPackets += 1L;
/* 546 */       throw new IllegalArgumentException("Illegal request size: " + dataSize + " bytes, from: " + who);
/*     */     }
/*     */ 
/* 556 */     if (dataSize > this.maxIncomingPacketSize)
/*     */     {
/* 559 */       this.sfs.getAPIManager().getSFSApi().disconnect(session);
/* 560 */       this.droppedIncomingPackets += 1L;
/*     */ 
/* 562 */       throw new IllegalArgumentException(
/* 564 */         String.format(
/* 566 */         "Incoming request size too large: %s, Current limit: %s, From: %s", new Object[] { 
/* 567 */         Integer.valueOf(dataSize), 
/* 568 */         Integer.valueOf(this.maxIncomingPacketSize), 
/* 569 */         who }));
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.binary.BinaryIoHandler
 * JD-Core Version:    0.6.0
 */