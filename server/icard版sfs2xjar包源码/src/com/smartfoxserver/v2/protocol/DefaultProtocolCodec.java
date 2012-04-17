/*     */ package com.smartfoxserver.v2.protocol;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.data.IPacket;
/*     */ import com.smartfoxserver.bitswarm.data.Packet;
/*     */ import com.smartfoxserver.bitswarm.io.IOHandler;
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.bitswarm.io.IResponse;
/*     */ import com.smartfoxserver.bitswarm.io.Request;
/*     */ import com.smartfoxserver.bitswarm.io.protocols.AbstractProtocolCodec;
/*     */ import com.smartfoxserver.bitswarm.io.protocols.ProtocolType;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import java.nio.ByteBuffer;
/*     */ import java.util.Collection;
/*     */ import org.slf4j.Logger;
/*     */ 
/*     */ public class DefaultProtocolCodec extends AbstractProtocolCodec
/*     */ {
/*     */   private static final String CONTROLLER_ID = "c";
/*     */   private static final String ACTION_ID = "a";
/*     */   private static final String PARAM_ID = "p";
/*     */ 
/*     */   public DefaultProtocolCodec(IOHandler ioHandler)
/*     */   {
/*  26 */     setIOHandler(ioHandler);
/*     */   }
/*     */ 
/*     */   public void onPacketRead(IPacket packet)
/*     */   {
/*  31 */     if (packet == null) {
/*  32 */       throw new IllegalStateException("Protocol Codec didn't expect a null packet!");
/*     */     }
/*  34 */     ProtocolType type = (ProtocolType)packet.getAttribute("type");
/*     */ 
/*  37 */     if (type == ProtocolType.BINARY) {
/*  38 */       onBinaryData(packet);
/*     */     }
/*  41 */     else if (type == ProtocolType.TEXT) {
/*  42 */       onTextData(packet);
/*     */     }
/*     */     else
/*     */     {
/*  46 */       throw new IllegalArgumentException("Protocol Codec is not able to decode protocol type: " + type);
/*     */     }
/*     */   }
/*     */ 
/*     */   private void onBinaryData(IPacket packet)
/*     */   {
/*  57 */     ByteBuffer buff = (ByteBuffer)packet.getData();
/*  58 */     ISFSObject requestObject = SFSObject.newFromBinaryData(buff.array());
/*     */ 
/*  62 */     if (this.logger.isDebugEnabled()) {
/*  63 */       this.logger.debug(requestObject.getDump());
/*     */     }
/*     */ 
/*  66 */     dispatchRequest(requestObject, packet, true);
/*     */   }
/*     */ 
/*     */   private void onTextData(IPacket packet)
/*     */   {
/*  76 */     String jsonData = (String)packet.getData();
/*  77 */     ISFSObject requestObject = SFSObject.newFromJsonData(jsonData);
/*     */ 
/*  79 */     dispatchRequest(requestObject, packet, false);
/*     */   }
/*     */ 
/*     */   private void dispatchRequest(ISFSObject requestObject, IPacket packet, boolean isBinary)
/*     */   {
/*  88 */     if (requestObject.isNull("c")) {
/*  89 */       throw new IllegalStateException("Request rejected: No Controller ID in request!");
/*     */     }
/*     */ 
/*  92 */     if (requestObject.isNull("a")) {
/*  93 */       throw new IllegalStateException("Request rejected: No Action ID in request!");
/*     */     }
/*  95 */     if (requestObject.isNull("p")) {
/*  96 */       throw new IllegalStateException("Request rejected: Missing parameters field!");
/*     */     }
/*     */ 
/*  99 */     IRequest request = new Request();
/* 100 */     Object controllerKey = null;
/*     */ 
/* 102 */     if (isBinary)
/*     */     {
/* 104 */       request.setId(requestObject.getShort("a"));
/* 105 */       controllerKey = requestObject.getByte("c");
/*     */     }
/*     */     else
/*     */     {
/* 109 */       request.setId(Short.valueOf(requestObject.getInt("a").shortValue()));
/* 110 */       controllerKey = Byte.valueOf(requestObject.getInt("c").byteValue());
/*     */     }
/*     */ 
/* 113 */     request.setContent(requestObject.getSFSObject("p"));
/* 114 */     request.setSender(packet.getSender());
/* 115 */     request.setTransportType(packet.getTransportType());
/*     */ 
/* 117 */     dispatchRequestToController(request, controllerKey);
/*     */   }
/*     */ 
/*     */   public void onPacketWrite(IResponse response)
/*     */   {
/* 124 */     ISFSObject params = SFSObject.newInstance();
/*     */ 
/* 127 */     params.putByte("c", ((Byte)response.getTargetController()).byteValue());
/*     */ 
/* 130 */     params.putShort("a", ((Short)response.getId()).shortValue());
/*     */ 
/* 133 */     params.putSFSObject("p", (ISFSObject)response.getContent());
/*     */ 
/* 135 */     IPacket packet = new Packet();
/* 136 */     packet.setTransportType(response.getTransportType());
/* 137 */     packet.setData(params);
/* 138 */     packet.setRecipients(response.getRecipients());
/*     */ 
/* 141 */     if (response.getRecipients().size() > 0) {
/* 142 */       this.logger.info("{OUT}: " + SystemRequest.fromId(response.getId()));
/*     */     }
/*     */ 
/* 145 */     this.ioHandler.onDataWrite(packet);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.DefaultProtocolCodec
 * JD-Core Version:    0.6.0
 */