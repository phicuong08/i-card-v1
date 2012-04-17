/*     */ package com.smartfoxserver.v2.protocol;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.data.IPacket;
/*     */ import com.smartfoxserver.bitswarm.data.Packet;
/*     */ import com.smartfoxserver.bitswarm.io.IOHandler;
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.bitswarm.io.IResponse;
/*     */ import com.smartfoxserver.bitswarm.io.Request;
/*     */ import com.smartfoxserver.bitswarm.io.protocols.AbstractProtocolCodec;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import java.nio.ByteBuffer;
/*     */ import java.util.Collection;
/*     */ import java.util.concurrent.atomic.AtomicLong;
/*     */ import org.slf4j.Logger;
/*     */ 
/*     */ public class SFSTxtProtocolCodec extends AbstractProtocolCodec
/*     */ {
/*     */   private static final String CONTROLLER_ID = "c";
/*     */   private static final String ACTION_ID = "a";
/*     */   private static final String PARAM_ID = "p";
/*     */   private final AtomicLong udpPacketCounter;
/*     */ 
/*     */   public SFSTxtProtocolCodec(IOHandler ioHandler)
/*     */   {
/*  29 */     setIOHandler(ioHandler);
/*  30 */     this.udpPacketCounter = new AtomicLong();
/*     */   }
/*     */ 
/*     */   public void onPacketRead(IPacket packet)
/*     */   {
/*  35 */     if (packet == null) {
/*  36 */       throw new IllegalStateException("Protocol Codec didn't expect a null packet!");
/*     */     }
/*  38 */     ISFSObject requestObject = null;
/*     */ 
/*  40 */     if (packet.isTcp())
/*     */     {
/*  43 */       ByteBuffer buff = (ByteBuffer)packet.getData();
/*     */       try
/*     */       {
/*  47 */         requestObject = SFSObject.newFromBinaryData(buff.array());
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/*  51 */         this.logger.warn("Error deserializing request: " + e);
/*     */       }
/*     */ 
/*     */     }
/*  55 */     else if (packet.isUdp())
/*     */     {
/*  57 */       requestObject = (ISFSObject)packet.getData();
/*     */ 
/*  64 */       requestObject.putShort("a", 0);
/*     */     }
/*     */ 
/*  67 */     if (requestObject != null)
/*     */     {
/*  71 */       if (this.logger.isDebugEnabled()) {
/*  72 */         this.logger.debug(requestObject.getDump());
/*     */       }
/*     */ 
/*  80 */       dispatchRequest(requestObject, packet);
/*     */     }
/*     */   }
/*     */ 
/*     */   private void dispatchRequest(ISFSObject requestObject, IPacket packet)
/*     */   {
/*  91 */     if (requestObject.isNull("c")) {
/*  92 */       throw new IllegalStateException("Request rejected: No Controller ID in request!");
/*     */     }
/*     */ 
/*  95 */     if (requestObject.isNull("a")) {
/*  96 */       throw new IllegalStateException("Request rejected: No Action ID in request!");
/*     */     }
/*  98 */     if (requestObject.isNull("p")) {
/*  99 */       throw new IllegalStateException("Request rejected: Missing parameters field!");
/*     */     }
/*     */ 
/* 102 */     IRequest request = new Request();
/* 103 */     Object controllerKey = null;
/*     */ 
/* 105 */     request.setId(requestObject.getShort("a"));
/* 106 */     controllerKey = requestObject.getByte("c");
/*     */ 
/* 108 */     request.setContent(requestObject.getSFSObject("p"));
/* 109 */     request.setSender(packet.getSender());
/* 110 */     request.setTransportType(packet.getTransportType());
/*     */ 
/* 112 */     if (packet.isUdp()) {
/* 113 */       request.setAttribute("$FS_REQUEST_UDP_TIMESTAMP", requestObject.getLong("i"));
/*     */     }
/* 115 */     dispatchRequestToController(request, controllerKey);
/*     */   }
/*     */ 
/*     */   public void onPacketWrite(IResponse response)
/*     */   {
/* 122 */     ISFSObject params = SFSObject.newInstance();
/*     */ 
/* 125 */     params.putByte("c", ((Byte)response.getTargetController()).byteValue());
/*     */ 
/* 128 */     params.putShort("a", ((Short)response.getId()).shortValue());
/*     */ 
/* 131 */     if (response.isUDP()) {
/* 132 */       params.putLong("i", this.udpPacketCounter.getAndIncrement());
/*     */     }
/*     */ 
/* 135 */     params.putSFSObject("p", (ISFSObject)response.getContent());
/*     */ 
/* 137 */     IPacket packet = new Packet();
/* 138 */     packet.setTransportType(response.getTransportType());
/* 139 */     packet.setData(params);
/* 140 */     packet.setRecipients(response.getRecipients());
/*     */ 
/* 143 */     if ((response.getRecipients().size() > 0) && (this.logger.isDebugEnabled())) {
/* 144 */       this.logger.debug("{OUT}: " + SystemRequest.fromId(response.getId()));
/*     */     }
/*     */ 
/* 147 */     this.ioHandler.onDataWrite(packet);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.SFSTxtProtocolCodec
 * JD-Core Version:    0.6.0
 */