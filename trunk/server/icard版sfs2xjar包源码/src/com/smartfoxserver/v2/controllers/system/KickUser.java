/*    */ package com.smartfoxserver.v2.controllers.system;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.api.ISFSApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.Zone;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.exceptions.SFSAdminException;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ 
/*    */ public class KickUser extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_USER_ID = "u";
/*    */   public static final String KEY_MESSAGE = "m";
/*    */   public static final String KEY_DELAY = "d";
/*    */ 
/*    */   public KickUser()
/*    */   {
/* 20 */     super(SystemRequest.KickUser);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 26 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 28 */     if (!sfso.containsKey("u")) {
/* 29 */       throw new SFSRequestValidationException("Missing user Id");
/*    */     }
/* 31 */     if (!sfso.containsKey("d")) {
/* 32 */       throw new SFSRequestValidationException("Missing delay parameter");
/*    */     }
/* 34 */     if (sfso.getInt("d").intValue() > 10) {
/* 35 */       throw new SFSRequestValidationException("Delay param out of range (0...10 seconds)");
/*    */     }
/* 37 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 44 */     User sender = checkSuperUser(request);
/* 45 */     Zone zone = sender.getZone();
/*    */ 
/* 47 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 49 */     Integer id = sfso.getInt("u");
/* 50 */     User userToKick = zone.getUserById(id.intValue());
/*    */ 
/* 52 */     if (userToKick == null)
/*    */     {
/* 54 */       throw new SFSAdminException(
/* 56 */         String.format(
/* 58 */         "KickRequest failed. No user exist with Id: %s, requested by ", new Object[] { 
/* 59 */         id, 
/* 60 */         sender }));
/*    */     }
/*    */ 
/* 65 */     this.api.kickUser(
/* 67 */       userToKick, 
/* 68 */       sender, 
/* 69 */       sfso.getUtfString("m"), 
/* 70 */       sfso.getInt("d").intValue());
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.KickUser
 * JD-Core Version:    0.6.0
 */