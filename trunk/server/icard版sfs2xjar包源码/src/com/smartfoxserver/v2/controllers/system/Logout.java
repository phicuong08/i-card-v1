/*    */ package com.smartfoxserver.v2.controllers.system;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.api.ISFSApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ 
/*    */ public class Logout extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_ZONE_NAME = "zn";
/*    */ 
/*    */   public Logout()
/*    */   {
/* 15 */     super(SystemRequest.Logout);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 21 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 27 */     User sender = this.api.getUserBySession(request.getSender());
/*    */ 
/* 29 */     if (sender == null) {
/* 30 */       throw new IllegalArgumentException("Logout failure. Session is not logged in: " + request.getSender());
/*    */     }
/* 32 */     this.api.logout(sender);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.Logout
 * JD-Core Version:    0.6.0
 */