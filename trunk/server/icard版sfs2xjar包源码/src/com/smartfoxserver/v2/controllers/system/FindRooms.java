/*    */ package com.smartfoxserver.v2.controllers.system;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.api.ISFSApi;
/*    */ import com.smartfoxserver.v2.api.response.ISFSResponseApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.Zone;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.entities.match.MatchExpression;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ import com.smartfoxserver.v2.util.UsersUtil;
/*    */ import java.util.Collection;
/*    */ 
/*    */ public class FindRooms extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_EXPRESSION = "e";
/*    */   public static final String KEY_GROUP = "g";
/*    */   public static final String KEY_LIMIT = "l";
/*    */   public static final String KEY_FILTERED_ROOMS = "fr";
/*    */ 
/*    */   public FindRooms()
/*    */   {
/* 26 */     super(SystemRequest.FindRooms);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 32 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 34 */     if (!sfso.containsKey("e")) {
/* 35 */       throw new SFSRequestValidationException("No Expression was specified");
/*    */     }
/* 37 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 44 */     User user = checkRequestPermissions(request);
/* 45 */     Zone zone = user.getZone();
/*    */ 
/* 48 */     if (!UsersUtil.isAllowedToPerformNewSearch(user)) {
/* 49 */       throw new IllegalStateException("Denied: too little time since the last Find request, " + user);
/*    */     }
/*    */ 
/* 52 */     ISFSObject sfso = (ISFSObject)request.getContent();
/* 53 */     ISFSArray expressionData = sfso.getSFSArray("e");
/*    */ 
/* 55 */     String groupId = sfso.getUtfString("g");
/* 56 */     int limit = sfso.containsKey("l") ? sfso.getShort("l").shortValue() : 0;
/*    */ 
/* 58 */     if (expressionData == null) {
/* 59 */       throw new IllegalArgumentException("Invalid expression. Null data");
/*    */     }
/*    */ 
/* 62 */     MatchExpression expression = MatchExpression.fromSFSArray(expressionData);
/*    */ 
/* 65 */     Collection roomList = null;
/* 66 */     if ((groupId == null) || (groupId.length() == 0))
/* 67 */       roomList = zone.getRoomList();
/*    */     else {
/* 69 */       roomList = zone.getRoomListFromGroup(groupId);
/*    */     }
/*    */ 
/* 72 */     Collection filteredRooms = this.api.findRooms(roomList, expression, limit);
/*    */ 
/* 75 */     this.api.getResponseAPI().notifyFilteredRoomList(user.getSession(), filteredRooms);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.FindRooms
 * JD-Core Version:    0.6.0
 */