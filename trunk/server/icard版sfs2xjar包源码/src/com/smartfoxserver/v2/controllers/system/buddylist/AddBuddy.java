/*    */ package com.smartfoxserver.v2.controllers.system.buddylist;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.SmartFoxServer;
/*    */ import com.smartfoxserver.v2.api.APIManager;
/*    */ import com.smartfoxserver.v2.api.ISFSBuddyApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ 
/*    */ public class AddBuddy extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_BUDDY_NAME = "bn";
/*    */ 
/*    */   public AddBuddy()
/*    */   {
/* 16 */     super(SystemRequest.AddBuddy);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 22 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 24 */     if (!sfso.containsKey("bn")) {
/* 25 */       throw new SFSRequestValidationException("Missing buddy name");
/*    */     }
/* 27 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 33 */     User sender = checkRequestPermissions(request);
/* 34 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 36 */     this.sfs.getAPIManager().getBuddyApi().addBuddy(
/* 38 */       sender, 
/* 39 */       sfso.getUtfString("bn"), 
/* 40 */       false, 
/* 41 */       true, 
/* 42 */       true);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.buddylist.AddBuddy
 * JD-Core Version:    0.6.0
 */