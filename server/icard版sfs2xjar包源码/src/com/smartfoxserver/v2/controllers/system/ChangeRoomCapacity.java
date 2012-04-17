/*     */ package com.smartfoxserver.v2.controllers.system;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRoomException;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class ChangeRoomCapacity extends BaseControllerCommand
/*     */ {
/*     */   public static final String KEY_ROOM = "r";
/*     */   public static final String KEY_MAX_USERS = "u";
/*     */   public static final String KEY_MAX_SPECT = "s";
/*     */   private static final int MAX_USERS_LIMIT = 200;
/*     */   private static final int MAX_SPECT_LIMIT = 32;
/*     */   private final Logger logger;
/*     */ 
/*     */   public ChangeRoomCapacity()
/*     */   {
/*  28 */     super(SystemRequest.ChangeRoomCapacity);
/*  29 */     this.logger = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ 
/*     */   public boolean validate(IRequest request)
/*     */     throws SFSRequestValidationException
/*     */   {
/*  35 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/*  37 */     if (!sfso.containsKey("r")) {
/*  38 */       throw new SFSRequestValidationException("No Room was specified");
/*     */     }
/*  40 */     if (!sfso.containsKey("u")) {
/*  41 */       throw new SFSRequestValidationException("No new Room MaxUsers was specified.");
/*     */     }
/*  43 */     if (!sfso.containsKey("s")) {
/*  44 */       throw new SFSRequestValidationException("No new Room MaxSpect was specified.");
/*     */     }
/*  46 */     return true;
/*     */   }
/*     */ 
/*     */   public void execute(IRequest request)
/*     */     throws Exception
/*     */   {
/*  52 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/*  55 */     User user = checkRequestPermissions(request);
/*  56 */     Zone zone = user.getZone();
/*  57 */     Room targetRoom = zone.getRoomById(sfso.getInt("r").intValue());
/*     */ 
/*  59 */     if (targetRoom == null) {
/*  60 */       throw new SFSRoomException("Target Room does not exist. Id: " + sfso.getInt("r"));
/*     */     }
/*     */ 
/*  75 */     int maxUsers = sfso.getInt("u").intValue();
/*  76 */     int maxSpect = sfso.getInt("s").intValue();
/*     */ 
/*  79 */     if (!user.isSuperUser())
/*     */     {
/*  81 */       if (maxUsers > 200)
/*     */       {
/*  83 */         this.logger.info(
/*  85 */           String.format(
/*  87 */           "MaxUsers parameter exceeds the limit allowed for a client: %s / %s. Restrictions were applied.", new Object[] { 
/*  88 */           Integer.valueOf(maxUsers), 
/*  89 */           Integer.valueOf(200) }));
/*     */ 
/*  93 */         maxUsers = 200;
/*     */       }
/*     */ 
/*  96 */       if (maxSpect > 32)
/*     */       {
/*  98 */         this.logger.info(
/* 100 */           String.format(
/* 102 */           "MaxSpect parameter exceeds the limit allowed for a client: %s / %s. Restrictions were applied.", new Object[] { 
/* 103 */           Integer.valueOf(maxSpect), 
/* 104 */           Integer.valueOf(32) }));
/*     */ 
/* 108 */         maxSpect = 32;
/*     */       }
/*     */     }
/*     */ 
/* 112 */     this.api.changeRoomCapacity(
/* 114 */       user, 
/* 115 */       targetRoom, 
/* 116 */       maxUsers, 
/* 117 */       maxSpect);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.ChangeRoomCapacity
 * JD-Core Version:    0.6.0
 */