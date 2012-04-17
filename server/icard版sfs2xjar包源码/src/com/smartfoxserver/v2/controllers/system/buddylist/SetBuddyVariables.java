/*    */ package com.smartfoxserver.v2.controllers.system.buddylist;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.SmartFoxServer;
/*    */ import com.smartfoxserver.v2.api.APIManager;
/*    */ import com.smartfoxserver.v2.api.ISFSBuddyApi;
/*    */ import com.smartfoxserver.v2.buddylist.BuddyVariable;
/*    */ import com.smartfoxserver.v2.buddylist.SFSBuddyVariable;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import org.slf4j.Logger;
/*    */ 
/*    */ public class SetBuddyVariables extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_BUDDY_VARS = "bv";
/*    */   public static final String KEY_BUDDY_NAME = "bn";
/*    */ 
/*    */   public SetBuddyVariables()
/*    */   {
/* 24 */     super(SystemRequest.SetBuddyVariables);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 30 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 32 */     if (!sfso.containsKey("bv")) {
/* 33 */       throw new SFSRequestValidationException("Missing variables list");
/*    */     }
/* 35 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 41 */     List buddyVars = new ArrayList();
/* 42 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 45 */     User user = checkRequestPermissions(request);
/*    */ 
/* 48 */     ISFSArray varListData = sfso.getSFSArray("bv");
/*    */ 
/* 51 */     for (int j = 0; j < varListData.size(); j++)
/*    */     {
/* 53 */       BuddyVariable bVar = SFSBuddyVariable.newFromSFSArray(varListData.getSFSArray(j));
/*    */ 
/* 56 */       if (bVar.getName().equals("$__BV_ONLINE__"))
/*    */       {
/* 58 */         this.logger.warn(String.format("Client can't set the reserver BV_ONLINE BuddyVariable. Update discarded. %s", new Object[] { user }));
/*    */       }
/*    */       else
/*    */       {
/* 62 */         buddyVars.add(bVar);
/*    */       }
/*    */     }
/* 65 */     this.sfs.getAPIManager().getBuddyApi().setBuddyVariables(
/* 67 */       user, 
/* 68 */       buddyVars, 
/* 69 */       true, 
/* 70 */       true);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.buddylist.SetBuddyVariables
 * JD-Core Version:    0.6.0
 */