/*    */ package com.smartfoxserver.v2.controllers.system;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.api.ISFSApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.Room;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.Zone;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.entities.variables.RoomVariable;
/*    */ import com.smartfoxserver.v2.entities.variables.SFSRoomVariable;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ 
/*    */ public class SetRoomVariables extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_VAR_LIST = "vl";
/*    */   public static final String KEY_VAR_ROOM = "r";
/*    */ 
/*    */   public SetRoomVariables()
/*    */   {
/* 25 */     super(SystemRequest.SetRoomVariables);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 31 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 33 */     if (!sfso.containsKey("r")) {
/* 34 */       throw new SFSRequestValidationException("Missing target room id");
/*    */     }
/* 36 */     if (!sfso.containsKey("vl")) {
/* 37 */       throw new SFSRequestValidationException("Missing variables list");
/*    */     }
/* 39 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 45 */     List roomVars = new ArrayList();
/* 46 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 49 */     User user = checkRequestPermissions(request);
/* 50 */     Zone zone = user.getZone();
/* 51 */     Room targetRoom = zone.getRoomById(sfso.getInt("r").intValue());
/*    */ 
/* 53 */     if (targetRoom == null) {
/* 54 */       throw new SFSRequestValidationException("Can't set RoomVariables. Room does not exist. ID: " + sfso.getInt("r"));
/*    */     }
/* 56 */     if (!targetRoom.containsUser(user)) {
/* 57 */       throw new SFSRequestValidationException("Can't set RoomVariables. User " + user + " is not joined in " + targetRoom);
/*    */     }
/* 59 */     ISFSArray varListData = sfso.getSFSArray("vl");
/*    */ 
/* 65 */     for (int j = 0; j < varListData.size(); j++)
/*    */     {
/* 67 */       RoomVariable rv = SFSRoomVariable.newFromSFSArray(varListData.getSFSArray(j));
/* 68 */       rv.setOwner(user);
/*    */ 
/* 71 */       RoomVariable targetVar = targetRoom.getVariable(rv.getName());
/* 72 */       if ((targetVar != null) && (targetVar.isHidden())) {
/*    */         continue;
/*    */       }
/* 75 */       roomVars.add(rv);
/*    */     }
/*    */ 
/* 78 */     this.api.setRoomVariables(user, targetRoom, roomVars);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.SetRoomVariables
 * JD-Core Version:    0.6.0
 */