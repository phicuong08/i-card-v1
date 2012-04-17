/*     */ package com.smartfoxserver.v2.controllers;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.controllers.AbstractController;
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.managers.IExtensionManager;
/*     */ import com.smartfoxserver.v2.entities.managers.IUserManager;
/*     */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*     */ import com.smartfoxserver.v2.exceptions.SFSExtensionException;
/*     */ import com.smartfoxserver.v2.extensions.ISFSExtension;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class ExtensionController extends AbstractController
/*     */ {
/*     */   public static final String KEY_EXT_CMD = "c";
/*     */   public static final String KEY_EXT_PARAMS = "p";
/*     */   public static final String KEY_ROOMID = "r";
/*     */   private final Logger logger;
/*     */   private final SmartFoxServer sfs;
/*     */   private IExtensionManager extensionManager;
/*     */ 
/*     */   public ExtensionController()
/*     */   {
/*  31 */     this.logger = LoggerFactory.getLogger(getClass());
/*  32 */     this.sfs = SmartFoxServer.getInstance();
/*     */   }
/*     */ 
/*     */   public void init(Object o)
/*     */   {
/*  38 */     super.init(o);
/*  39 */     this.extensionManager = this.sfs.getExtensionManager();
/*     */   }
/*     */ 
/*     */   public void destroy(Object o)
/*     */   {
/*  45 */     super.destroy(o);
/*  46 */     this.extensionManager = null;
/*     */   }
/*     */ 
/*     */   public void processRequest(IRequest request)
/*     */     throws Exception
/*     */   {
/*  52 */     if (this.logger.isDebugEnabled()) {
/*  53 */       this.logger.debug(request.toString());
/*     */     }
/*  55 */     long t1 = System.nanoTime();
/*     */ 
/*  58 */     User sender = this.sfs.getUserManager().getUserBySession(request.getSender());
/*     */ 
/*  64 */     if (sender == null) {
/*  65 */       throw new SFSExtensionException("Extension Request refused. Sender is not a User: " + request.getSender());
/*     */     }
/*     */ 
/*  68 */     ISFSObject reqObj = (ISFSObject)request.getContent();
/*     */ 
/*  70 */     if (this.logger.isDebugEnabled()) {
/*  71 */       this.logger.debug(reqObj.getDump());
/*     */     }
/*     */ 
/*  74 */     String cmd = reqObj.getUtfString("c");
/*     */ 
/*  76 */     if ((cmd == null) || (cmd.length() == 0)) {
/*  77 */       throw new SFSExtensionException("Extension Request refused. Missing CMD. " + sender);
/*     */     }
/*     */ 
/*  80 */     int roomId = -1;
/*  81 */     if (reqObj.containsKey("r")) {
/*  82 */       roomId = reqObj.getInt("r").intValue();
/*     */     }
/*     */ 
/*  85 */     ISFSObject params = reqObj.getSFSObject("p");
/*     */ 
/*  88 */     if (request.isUdp()) {
/*  89 */       params.putLong("$FS_REQUEST_UDP_TIMESTAMP", ((Long)request.getAttribute("$FS_REQUEST_UDP_TIMESTAMP")).longValue());
/*     */     }
/*  91 */     Zone zone = sender.getZone();
/*     */ 
/*  94 */     ISFSExtension extension = null;
/*     */ 
/*  97 */     if (roomId > -1)
/*     */     {
/* 100 */       Room room = zone.getRoomById(roomId);
/*     */ 
/* 102 */       if (room != null)
/*     */       {
/* 105 */         if (room.containsUser(sender))
/* 106 */           extension = this.extensionManager.getRoomExtension(room);
/*     */         else {
/* 108 */           throw new SFSExtensionException("User cannot invoke Room extension if he's not joined in that Room. " + sender + ", " + room);
/*     */         }
/*     */       }
/*     */ 
/*     */     }
/*     */     else
/*     */     {
/* 115 */       extension = this.extensionManager.getZoneExtension(zone);
/*     */     }
/*     */ 
/* 118 */     if (extension == null)
/*     */     {
/* 120 */       throw new SFSExtensionException(
/* 122 */         String.format(
/* 124 */         "No extensions can be invoked: %s, RoomId: %s", new Object[] { 
/* 125 */         zone.toString(), 
/* 126 */         roomId == -1 ? "None" : Integer.valueOf(roomId) }));
/*     */     }
/*     */ 
/* 132 */     sender.updateLastRequestTime();
/*     */     try
/*     */     {
/* 137 */       extension.handleClientRequest(cmd, sender, params);
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 141 */       ExceptionMessageComposer composer = new ExceptionMessageComposer(e);
/* 142 */       composer.setDescription("Error while handling client request in extension: " + extension.toString());
/* 143 */       composer.addInfo("Extension Cmd: " + cmd);
/*     */ 
/* 145 */       this.logger.error(composer.toString());
/*     */     }
/*     */ 
/* 148 */     long t2 = System.nanoTime();
/*     */ 
/* 150 */     if (this.logger.isDebugEnabled())
/* 151 */       this.logger.debug("Extension call executed in: " + (t2 - t1) / 1000000.0D);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.ExtensionController
 * JD-Core Version:    0.6.0
 */