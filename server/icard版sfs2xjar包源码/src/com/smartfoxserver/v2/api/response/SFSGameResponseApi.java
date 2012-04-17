/*    */ package com.smartfoxserver.v2.api.response;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IResponse;
/*    */ import com.smartfoxserver.bitswarm.io.Response;
/*    */ import com.smartfoxserver.v2.config.DefaultConstants;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*    */ import com.smartfoxserver.v2.entities.invitation.Invitation;
/*    */ import com.smartfoxserver.v2.entities.invitation.InvitationResponse;
/*    */ import com.smartfoxserver.v2.util.UsersUtil;
/*    */ 
/*    */ public class SFSGameResponseApi
/*    */   implements ISFSGameResponseApi
/*    */ {
/*    */   public void notifyInivitation(Invitation invitation)
/*    */   {
/* 21 */     ISFSObject resObj = SFSObject.newInstance();
/*    */ 
/* 23 */     User inviter = invitation.getInviter();
/* 24 */     User invitee = invitation.getInvitee();
/*    */ 
/* 30 */     if (UsersUtil.usersSeeEachOthers(inviter, invitee)) {
/* 31 */       resObj.putInt("ui", inviter.getId());
/*    */     }
/*    */     else {
/* 34 */       resObj.putSFSArray("u", inviter.toSFSArray());
/*    */     }
/* 36 */     resObj.putShort("t", (short)invitation.getSecondsForAnswer());
/* 37 */     resObj.putInt("ii", invitation.getId());
/*    */ 
/* 39 */     if (invitation.getParams() != null) {
/* 40 */       resObj.putSFSObject("p", invitation.getParams());
/*    */     }
/*    */ 
/* 43 */     IResponse response = new Response();
/* 44 */     response.setId(SystemRequest.InviteUser.getId());
/* 45 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 46 */     response.setContent(resObj);
/* 47 */     response.setRecipients(invitee.getSession());
/*    */ 
/* 50 */     response.write();
/*    */   }
/*    */ 
/*    */   public void notifyInvitationResponse(Invitation invitation, InvitationResponse invitationResponse, ISFSObject params)
/*    */   {
/* 57 */     ISFSObject resObj = SFSObject.newInstance();
/*    */ 
/* 59 */     User inviter = invitation.getInviter();
/* 60 */     User invitee = invitation.getInvitee();
/*    */ 
/* 66 */     if (UsersUtil.usersSeeEachOthers(inviter, invitee))
/* 67 */       resObj.putInt("ui", invitee.getId());
/*    */     else {
/* 69 */       resObj.putSFSArray("u", invitee.toSFSArray());
/*    */     }
/*    */ 
/* 72 */     resObj.putByte("ri", (byte)invitationResponse.getId());
/*    */ 
/* 75 */     if (params != null) {
/* 76 */       resObj.putSFSObject("p", params);
/*    */     }
/*    */ 
/* 79 */     IResponse response = new Response();
/* 80 */     response.setId(SystemRequest.InvitationReply.getId());
/* 81 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 82 */     response.setContent(resObj);
/* 83 */     response.setRecipients(inviter.getSession());
/*    */ 
/* 86 */     response.write();
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.response.SFSGameResponseApi
 * JD-Core Version:    0.6.0
 */