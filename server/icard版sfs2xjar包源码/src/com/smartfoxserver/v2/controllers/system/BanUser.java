/*    */ package com.smartfoxserver.v2.controllers.system;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.api.ISFSApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.Zone;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.entities.managers.BanMode;
/*    */ import com.smartfoxserver.v2.exceptions.SFSAdminException;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ 
/*    */ public class BanUser extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_USER_ID = "u";
/*    */   public static final String KEY_MESSAGE = "m";
/*    */   public static final String KEY_DELAY = "d";
/*    */   public static final String KEY_BAN_MODE = "b";
/*    */   public static final String KEY_BAN_DURATION_HOURS = "dh";
/*    */ 
/*    */   public BanUser()
/*    */   {
/* 23 */     super(SystemRequest.BanUser);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 29 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 31 */     if (!sfso.containsKey("u")) {
/* 32 */       throw new SFSRequestValidationException("Missing user Id");
/*    */     }
/* 34 */     if (!sfso.containsKey("b")) {
/* 35 */       throw new SFSRequestValidationException("Missing BanMode parameter");
/*    */     }
/* 37 */     if (!sfso.containsKey("d")) {
/* 38 */       throw new SFSRequestValidationException("Missing delay parameter");
/*    */     }
/* 40 */     if (sfso.getInt("d").intValue() > 10) {
/* 41 */       throw new SFSRequestValidationException("Delay param out of range (0...10 seconds)");
/*    */     }
/* 43 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 50 */     User sender = checkSuperUser(request);
/* 51 */     Zone zone = sender.getZone();
/*    */ 
/* 53 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 55 */     Integer id = sfso.getInt("u");
/* 56 */     User userToBan = zone.getUserById(id.intValue());
/*    */ 
/* 58 */     if (userToBan == null)
/*    */     {
/* 60 */       throw new SFSAdminException(
/* 62 */         String.format(
/* 64 */         "BanRequest failed. No user exist with Id: %s, requested by ", new Object[] { 
/* 65 */         id, 
/* 66 */         sender }));
/*    */     }
/*    */ 
/* 81 */     int banDuration = sfso.containsKey("dh") ? sfso.getInt("dh").intValue() * 60 : 1440;
/*    */ 
/* 83 */     this.api.banUser(
/* 85 */       userToBan, 
/* 86 */       sender, 
/* 87 */       sfso.getUtfString("m"), 
/* 88 */       BanMode.fromId(sfso.getInt("b").intValue()), 
/* 89 */       banDuration, 
/* 90 */       sfso.getInt("d").intValue());
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.BanUser
 * JD-Core Version:    0.6.0
 */