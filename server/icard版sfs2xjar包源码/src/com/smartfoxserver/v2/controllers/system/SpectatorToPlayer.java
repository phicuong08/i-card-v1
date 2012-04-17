/*    */ package com.smartfoxserver.v2.controllers.system;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.api.ISFSApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.Room;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.Zone;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ 
/*    */ public class SpectatorToPlayer extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_ROOM = "r";
/*    */   public static final String KEY_USER_ID = "u";
/*    */   public static final String KEY_PLAYER_ID = "p";
/*    */ 
/*    */   public SpectatorToPlayer()
/*    */   {
/* 20 */     super(SystemRequest.SpectatorToPlayer);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 26 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 31 */     if (!sfso.containsKey("r")) {
/* 32 */       throw new SFSRequestValidationException("No Room specified");
/*    */     }
/* 34 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 41 */     User user = checkRequestPermissions(request);
/* 42 */     Zone zone = user.getZone();
/*    */ 
/* 45 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 47 */     Room targetRoom = zone.getRoomById(sfso.getInt("r").intValue());
/*    */ 
/* 50 */     this.api.spectatorToPlayer(user, targetRoom, true, true);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.SpectatorToPlayer
 * JD-Core Version:    0.6.0
 */