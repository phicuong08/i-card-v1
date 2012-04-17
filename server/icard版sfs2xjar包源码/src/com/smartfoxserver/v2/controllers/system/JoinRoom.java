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
/*    */ import org.slf4j.Logger;
/*    */ 
/*    */ public class JoinRoom extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_ROOM = "r";
/*    */   public static final String KEY_USER_LIST = "ul";
/*    */   public static final String KEY_ROOM_NAME = "n";
/*    */   public static final String KEY_ROOM_ID = "i";
/*    */   public static final String KEY_PASS = "p";
/*    */   public static final String KEY_ROOM_TO_LEAVE = "rl";
/*    */   public static final String KEY_AS_SPECTATOR = "sp";
/*    */ 
/*    */   public JoinRoom()
/*    */   {
/* 25 */     super(SystemRequest.JoinRoom);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 31 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 36 */     if ((!sfso.containsKey("n")) && (!sfso.containsKey("i"))) {
/* 37 */       throw new SFSRequestValidationException("No Room id/name was specified");
/*    */     }
/* 39 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 46 */     User user = checkRequestPermissions(request);
/* 47 */     Zone zone = user.getZone();
/*    */ 
/* 50 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 52 */     Room roomToJoin = null;
/*    */ 
/* 54 */     if (sfso.containsKey("i"))
/*    */     {
/* 56 */       roomToJoin = zone.getRoomById(sfso.getInt("i").intValue());
/* 57 */       if (roomToJoin == null) {
/* 58 */         this.logger.warn("Client requested non exixtent Room with ID: " + sfso.getInt("i"));
/*    */       }
/*    */     }
/*    */     else
/*    */     {
/* 63 */       roomToJoin = zone.getRoomByName(sfso.getUtfString("n"));
/* 64 */       if (roomToJoin == null) {
/* 65 */         this.logger.warn("Client requested non exixtent Room with name: " + sfso.getUtfString("n"));
/*    */       }
/*    */ 
/*    */     }
/*    */ 
/* 75 */     Room roomToLeave = sfso.containsKey("rl") ? zone.getRoomById(sfso.getInt("rl").intValue()) : user.getLastJoinedRoom();
/* 76 */     String password = sfso.getUtfString("p");
/* 77 */     boolean asSpectator = sfso.containsKey("sp") ? sfso.getBool("sp").booleanValue() : false;
/*    */ 
/* 80 */     user.updateLastRequestTime();
/*    */ 
/* 83 */     this.api.joinRoom(user, roomToJoin, password, asSpectator, roomToLeave);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.JoinRoom
 * JD-Core Version:    0.6.0
 */