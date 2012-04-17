/*    */ package com.smartfoxserver.v2.controllers.system.game;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.SmartFoxServer;
/*    */ import com.smartfoxserver.v2.api.APIManager;
/*    */ import com.smartfoxserver.v2.api.ISFSGameApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.entities.invitation.InvitationResponse;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ 
/*    */ public class InvitationReply extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_INVITATION_ID = "i";
/*    */   public static final String KEY_INVITATION_REPLY = "r";
/*    */   public static final String KEY_INVITATION_PARAMS = "p";
/*    */ 
/*    */   public InvitationReply()
/*    */   {
/* 19 */     super(SystemRequest.InvitationReply);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 25 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 27 */     if (sfso.isNull("i")) {
/* 28 */       throw new SFSRequestValidationException("missing Invitation id");
/*    */     }
/* 30 */     if (sfso.isNull("r")) {
/* 31 */       throw new SFSRequestValidationException("missing Invitation reply (accept/refuse)");
/*    */     }
/* 33 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 40 */     User user = checkRequestPermissions(request);
/*    */ 
/* 43 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 45 */     this.sfs.getAPIManager().getGameApi().replyToInvitation(
/* 47 */       user, 
/* 48 */       sfso.getInt("i").intValue(), 
/* 49 */       InvitationResponse.fromId(sfso.getByte("r").byteValue()), 
/* 50 */       sfso.getSFSObject("p"), 
/* 51 */       true);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.game.InvitationReply
 * JD-Core Version:    0.6.0
 */