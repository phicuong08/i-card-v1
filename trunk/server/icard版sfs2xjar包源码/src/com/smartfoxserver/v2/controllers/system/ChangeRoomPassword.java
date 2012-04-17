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
/*    */ import com.smartfoxserver.v2.exceptions.SFSRoomException;
/*    */ 
/*    */ public class ChangeRoomPassword extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_ROOM = "r";
/*    */   public static final String KEY_PASS = "p";
/*    */ 
/*    */   public ChangeRoomPassword()
/*    */   {
/* 20 */     super(SystemRequest.ChangeRoomPassword);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 26 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 28 */     if (!sfso.containsKey("r")) {
/* 29 */       throw new SFSRequestValidationException("No Room was specified");
/*    */     }
/* 31 */     if (!sfso.containsKey("p")) {
/* 32 */       throw new SFSRequestValidationException("No new Password was specified.");
/*    */     }
/* 34 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 40 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 43 */     User user = checkRequestPermissions(request);
/* 44 */     Zone zone = user.getZone();
/* 45 */     Room targetRoom = zone.getRoomById(sfso.getInt("r").intValue());
/*    */ 
/* 47 */     if (targetRoom == null) {
/* 48 */       throw new SFSRoomException("Target Room does not exist. Id: " + sfso.getInt("r"));
/*    */     }
/* 50 */     this.api.changeRoomPassword(user, targetRoom, sfso.getUtfString("p"));
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.ChangeRoomPassword
 * JD-Core Version:    0.6.0
 */