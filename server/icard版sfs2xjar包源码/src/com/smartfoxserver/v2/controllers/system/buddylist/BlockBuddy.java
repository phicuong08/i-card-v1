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
/*    */ public class BlockBuddy extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_BUDDY_NAME = "bn";
/*    */   public static final String KEY_BUDDY_BLOCK_STATE = "bs";
/*    */ 
/*    */   public BlockBuddy()
/*    */   {
/* 18 */     super(SystemRequest.BlockBuddy);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 24 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 26 */     if (!sfso.containsKey("bn")) {
/* 27 */       throw new SFSRequestValidationException("Missing buddy name");
/*    */     }
/* 29 */     if (!sfso.containsKey("bs")) {
/* 30 */       throw new SFSRequestValidationException("Missing buddy block state");
/*    */     }
/* 32 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 38 */     User sender = checkRequestPermissions(request);
/* 39 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 41 */     this.sfs.getAPIManager().getBuddyApi().blockBuddy(
/* 43 */       sender, 
/* 44 */       sfso.getUtfString("bn"), 
/* 45 */       sfso.getBool("bs").booleanValue(), 
/* 46 */       true, 
/* 47 */       true);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.buddylist.BlockBuddy
 * JD-Core Version:    0.6.0
 */