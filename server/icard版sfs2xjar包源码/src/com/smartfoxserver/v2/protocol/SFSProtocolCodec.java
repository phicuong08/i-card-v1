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
/*     */ public class SFSProtocolCodec extends AbstractProtocolCodec
/*     */ {
/*     */   private static final String CONTROLLER_ID = "c";
/*     */   private static final String ACTION_ID = "a";
/*     */   private static final String PARAM_ID = "p";
/*     */   private final AtomicLong udpPacketCounter;
/*     */ 
/*     */   public SFSProtocolCodec(IOHandler ioHandler)
/*     */   {
/*  40 */     setIOHandler(ioHandler);
/*  41 */     this.udpPacketCounter = new AtomicLong();
/*     */   }
/*     */ 
/*     */   public void onPacketRead(IPacket packet)
/*     */   {
/*  46 */     if (packet == null) {
/*  47 */       throw new IllegalStateException("Protocol Codec didn't expect a null packet!");
/*     */     }
/*  49 */     ISFSObject requestObject = null;
/*     */ 
/*  51 */     if (packet.isTcp())
/*     */     {
/*  54 */       ByteBuffer buff = (ByteBuffer)packet.getData();
/*     */       try
/*     */       {
/*  58 */         requestObject = SFSObject.newFromBinaryData(buff.array());
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/*  62 */         this.logger.warn("Error deserializing request: " + e);
/*     */       }
/*     */ 
/*     */     }
/*  66 */     else if (packet.isUdp())
/*     */     {
/*  68 */       requestObject = (ISFSObject)packet.getData();
/*     */ 
/*  75 */       requestObject.putShort("a", 0);
/*     */     }
/*     */ 
/*  78 */     if (requestObject != null)
/*     */     {
/*  82 */       if (this.logger.isDebugEnabled()) {
/*  83 */         this.logger.debug(requestObject.getDump());
/*     */       }
/*     */ 
/*  91 */       dispatchRequest(requestObject, packet);
/*     */     }
/*     */   }
/*     */ 
/*     */   private void dispatchRequest(ISFSObject requestObject, IPacket packet)
/*     */   {
/* 102 */     if (requestObject.isNull("c")) {
/* 103 */       throw new IllegalStateException("Request rejected: No Controller ID in request!");
/*     */     }
/*     */ 
/* 106 */     if (requestObject.isNull("a")) {
/* 107 */       throw new IllegalStateException("Request rejected: No Action ID in request!");
/*     */     }
/* 109 */     if (requestObject.isNull("p")) {
/* 110 */       throw new IllegalStateException("Request rejected: Missing parameters field!");
/*     */     }
/*     */ 
/* 113 */     IRequest request = new Request();
/* 114 */     Object controllerKey = null;
/*     */ 
/* 116 */     request.setId(requestObject.getShort("a"));
/* 117 */     controllerKey = requestObject.getByte("c");
/*     */ 
/* 119 */     request.setContent(requestObject.getSFSObject("p"));
/* 120 */     request.setSender(packet.getSender());
/* 121 */     request.setTransportType(packet.getTransportType());
/*     */ 
/* 123 */     if (packet.isUdp()) {
/* 124 */       request.setAttribute("$FS_REQUEST_UDP_TIMESTAMP", requestObject.getLong("i"));
/*     */     }
/* 126 */     dispatchRequestToController(request, controllerKey);
/*     */   }
/*     */ 
/*     */   public void onPacketWrite(IResponse response)
/*     */   {
/* 133 */     ISFSObject params = SFSObject.newInstance();
/*     */ 
/* 136 */     params.putByte("c", ((Byte)response.getTargetController()).byteValue());
/*     */ 
/* 139 */     params.putShort("a", ((Short)response.getId()).shortValue());
/*     */ 
/* 142 */     if (response.isUDP()) {
/* 143 */       params.putLong("i", this.udpPacketCounter.getAndIncrement());
/*     */     }
/*     */ 
/* 146 */     params.putSFSObject("p", (ISFSObject)response.getContent());
/*     */ 
/* 148 */     IPacket packet = new Packet();
/* 149 */     packet.setTransportType(response.getTransportType());
/* 150 */     packet.setData(params);
/* 151 */     packet.setRecipients(response.getRecipients());
/*     */ 
/* 154 */     if ((response.getRecipients().size() > 0) && (this.logger.isDebugEnabled())) {
/* 155 */       this.logger.debug("{OUT}: " + SystemRequest.fromId(response.getId()));
/*     */     }
/*     */ 
/* 158 */     this.ioHandler.onDataWrite(packet);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.SFSProtocolCodec
 * JD-Core Version:    0.6.0
 */