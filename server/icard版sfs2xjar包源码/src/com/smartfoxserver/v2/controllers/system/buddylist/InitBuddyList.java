/*    */ package com.smartfoxserver.v2.controllers.system.buddylist;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.SmartFoxServer;
/*    */ import com.smartfoxserver.v2.api.APIManager;
/*    */ import com.smartfoxserver.v2.api.ISFSBuddyApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ 
/*    */ public class InitBuddyList extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_BUDDY_LIST = "bl";
/*    */   public static final String KEY_BUDDY_STATES = "bs";
/*    */   public static final String KEY_MY_VARS = "mv";
/*    */ 
/*    */   public InitBuddyList()
/*    */   {
/* 17 */     super(SystemRequest.InitBuddyList);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 23 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 30 */     User sender = checkRequestPermissions(request);
/*    */ 
/* 32 */     this.sfs.getAPIManager().getBuddyApi().initBuddyList(sender, true);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.buddylist.InitBuddyList
 * JD-Core Version:    0.6.0
 */