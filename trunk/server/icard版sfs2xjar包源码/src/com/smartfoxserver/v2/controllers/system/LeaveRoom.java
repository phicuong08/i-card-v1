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
/*    */ public class LeaveRoom extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_ROOM_ID = "r";
/*    */ 
/*    */   public LeaveRoom()
/*    */   {
/* 18 */     super(SystemRequest.LeaveRoom);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 25 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 32 */     User user = checkRequestPermissions(request);
/* 33 */     Zone zone = user.getZone();
/*    */ 
/* 35 */     ISFSObject reqObj = (ISFSObject)request.getContent();
/* 36 */     int roomId = -1;
/*    */ 
/* 38 */     if (reqObj.containsKey("r")) {
/* 39 */       roomId = reqObj.getInt("r").intValue();
/*    */     }
/* 41 */     Room theRoom = roomId >= 0 ? zone.getRoomById(roomId) : null;
/*    */ 
/* 43 */     this.api.leaveRoom(user, theRoom, true, true);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.LeaveRoom
 * JD-Core Version:    0.6.0
 */