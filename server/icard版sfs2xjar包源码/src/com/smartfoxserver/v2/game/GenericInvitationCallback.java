/*    */ package com.smartfoxserver.v2.game;
/*    */ 
/*    */ import com.smartfoxserver.v2.SmartFoxServer;
/*    */ import com.smartfoxserver.v2.api.APIManager;
/*    */ import com.smartfoxserver.v2.api.ISFSGameApi;
/*    */ import com.smartfoxserver.v2.api.response.ISFSGameResponseApi;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.entities.invitation.Invitation;
/*    */ import com.smartfoxserver.v2.entities.invitation.InvitationCallback;
/*    */ import com.smartfoxserver.v2.entities.invitation.InvitationResponse;
/*    */ 
/*    */ public class GenericInvitationCallback
/*    */   implements InvitationCallback
/*    */ {
/*    */   private final ISFSGameResponseApi responseApi;
/*    */ 
/*    */   public GenericInvitationCallback()
/*    */   {
/* 16 */     this.responseApi = SmartFoxServer.getInstance().getAPIManager().getGameApi().getResponseAPI();
/*    */   }
/*    */ 
/*    */   public void onAccepted(Invitation invObj, ISFSObject params)
/*    */   {
/* 22 */     this.responseApi.notifyInvitationResponse(invObj, InvitationResponse.ACCEPT, params);
/*    */   }
/*    */ 
/*    */   public void onExpired(Invitation invObj)
/*    */   {
/* 28 */     this.responseApi.notifyInvitationResponse(invObj, InvitationResponse.EXPIRED, null);
/*    */   }
/*    */ 
/*    */   public void onRefused(Invitation invObj, ISFSObject params)
/*    */   {
/* 34 */     this.responseApi.notifyInvitationResponse(invObj, InvitationResponse.REFUSE, params);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.game.GenericInvitationCallback
 * JD-Core Version:    0.6.0
 */