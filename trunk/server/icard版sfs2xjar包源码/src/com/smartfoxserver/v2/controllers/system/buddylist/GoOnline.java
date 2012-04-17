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
/*    */ public class GoOnline extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_ONLINE = "o";
/*    */   public static final String KEY_BUDDY_NAME = "bn";
/*    */   public static final String KEY_BUDDY_ID = "bi";
/*    */ 
/*    */   public GoOnline()
/*    */   {
/* 18 */     super(SystemRequest.GoOnline);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 24 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 26 */     if (!sfso.containsKey("o")) {
/* 27 */       throw new SFSRequestValidationException("Missing online status");
/*    */     }
/* 29 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 35 */     User sender = checkRequestPermissions(request);
/* 36 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 38 */     this.sfs.getAPIManager().getBuddyApi().goOnline(sender, sfso.getBool("o").booleanValue(), true);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.buddylist.GoOnline
 * JD-Core Version:    0.6.0
 */