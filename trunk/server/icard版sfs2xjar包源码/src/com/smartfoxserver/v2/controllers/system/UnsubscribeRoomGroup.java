/*    */ package com.smartfoxserver.v2.controllers.system;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.api.ISFSApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ 
/*    */ public class UnsubscribeRoomGroup extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_GROUP_ID = "g";
/*    */ 
/*    */   public UnsubscribeRoomGroup()
/*    */   {
/* 16 */     super(SystemRequest.UnsubscribeRoomGroup);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 22 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 24 */     if (!sfso.containsKey("g")) {
/* 25 */       throw new SFSRequestValidationException("Missing GroupId");
/*    */     }
/* 27 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 33 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 36 */     User user = checkRequestPermissions(request);
/* 37 */     String groupId = sfso.getUtfString("g");
/*    */ 
/* 39 */     this.api.unsubscribeRoomGroup(user, groupId);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.UnsubscribeRoomGroup
 * JD-Core Version:    0.6.0
 */