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
/*    */ import com.smartfoxserver.v2.entities.managers.IUserManager;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ import com.smartfoxserver.v2.game.GenericInvitationCallback;
/*    */ import java.util.ArrayList;
/*    */ import java.util.Collection;
/*    */ import java.util.List;
/*    */ 
/*    */ public class InviteUser extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_USER = "u";
/*    */   public static final String KEY_USER_ID = "ui";
/*    */   public static final String KEY_INVITATION_ID = "ii";
/*    */   public static final String KEY_TIME = "t";
/*    */   public static final String KEY_PARAMS = "p";
/*    */   public static final String KEY_INVITED_USERS = "iu";
/*    */   public static final String KEY_REPLY_ID = "ri";
/*    */ 
/*    */   public InviteUser()
/*    */   {
/* 27 */     super(SystemRequest.InviteUser);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 33 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 35 */     if (sfso.isNull("iu")) {
/* 36 */       throw new SFSRequestValidationException("missing list of invited users");
/*    */     }
/* 38 */     if (sfso.isNull("t"))
/* 39 */       throw new SFSRequestValidationException("missing SecondsForAnswer parameter");
/* 40 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 47 */     User user = checkRequestPermissions(request);
/*    */ 
/* 50 */     ISFSObject sfso = (ISFSObject)request.getContent();
/* 51 */     Collection invitedUserIds = sfso.getIntArray("iu");
/*    */ 
/* 53 */     if (invitedUserIds.size() < 1) {
/* 54 */       throw new IllegalArgumentException("Invited Users Array expected to contain at least 1 element!, Sender: " + user);
/*    */     }
/*    */ 
/* 57 */     List invitedPeople = new ArrayList();
/*    */ 
/* 59 */     for (Integer userId : invitedUserIds)
/*    */     {
/* 61 */       User invitedUser = this.sfs.getUserManager().getUserById(userId.intValue());
/*    */ 
/* 63 */       if ((invitedUser != null) && (invitedUser != user)) {
/* 64 */         invitedPeople.add(invitedUser);
/*    */       }
/*    */     }
/*    */ 
/* 68 */     this.sfs.getAPIManager().getGameApi().sendInvitation(
/* 70 */       user, 
/* 71 */       invitedPeople, 
/* 72 */       sfso.getShort("t").shortValue(), 
/* 73 */       new GenericInvitationCallback(), 
/* 74 */       sfso.getSFSObject("p"));
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.game.InviteUser
 * JD-Core Version:    0.6.0
 */