/*    */ package com.smartfoxserver.v2.controllers.system;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.api.ISFSApi;
/*    */ import com.smartfoxserver.v2.api.response.ISFSResponseApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.Zone;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.exceptions.SFSErrorCode;
/*    */ import com.smartfoxserver.v2.exceptions.SFSErrorData;
/*    */ import com.smartfoxserver.v2.exceptions.SFSException;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ 
/*    */ public class SubscribeRoomGroup extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_GROUP_ID = "g";
/*    */   public static final String KEY_ROOM_LIST = "rl";
/*    */ 
/*    */   public SubscribeRoomGroup()
/*    */   {
/* 21 */     super(SystemRequest.SubscribeRoomGroup);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 27 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 29 */     if (!sfso.containsKey("g")) {
/* 30 */       throw new SFSRequestValidationException("Missing GroupId");
/*    */     }
/* 32 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 38 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 41 */     User user = checkRequestPermissions(request);
/* 42 */     Zone zone = user.getZone();
/* 43 */     String groupId = sfso.getUtfString("g");
/*    */ 
/* 49 */     if (!zone.containsPublicGroup(groupId))
/*    */     {
/* 51 */       SFSErrorData errData = new SFSErrorData(SFSErrorCode.SUBSCRIBE_GROUP_NOT_FOUND);
/* 52 */       errData.addParameter(groupId);
/*    */ 
/* 54 */       this.api.getResponseAPI().notifyRequestError(errData, user, SystemRequest.SubscribeRoomGroup);
/*    */ 
/* 56 */       throw new SFSException(
/* 58 */         String.format("Invalid client group subscription: %s, User: %s", new Object[] { groupId, user.getName() }), 
/* 59 */         errData);
/*    */     }
/*    */ 
/* 68 */     this.api.subscribeRoomGroup(user, groupId);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.SubscribeRoomGroup
 * JD-Core Version:    0.6.0
 */