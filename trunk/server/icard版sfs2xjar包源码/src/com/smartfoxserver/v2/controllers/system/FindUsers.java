/*     */ package com.smartfoxserver.v2.controllers.system;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.api.response.ISFSResponseApi;
/*     */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.match.MatchExpression;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*     */ import com.smartfoxserver.v2.util.UsersUtil;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Collection;
/*     */ import org.slf4j.Logger;
/*     */ 
/*     */ public class FindUsers extends BaseControllerCommand
/*     */ {
/*     */   public static final String KEY_EXPRESSION = "e";
/*     */   public static final String KEY_GROUP = "g";
/*     */   public static final String KEY_ROOM = "r";
/*     */   public static final String KEY_LIMIT = "l";
/*     */   public static final String KEY_FILTERED_USERS = "fu";
/*     */ 
/*     */   public FindUsers()
/*     */   {
/*  28 */     super(SystemRequest.FindUsers);
/*     */   }
/*     */ 
/*     */   public boolean validate(IRequest request)
/*     */     throws SFSRequestValidationException
/*     */   {
/*  34 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/*  36 */     if (!sfso.containsKey("e")) {
/*  37 */       throw new SFSRequestValidationException("No Expression was specified");
/*     */     }
/*  39 */     return true;
/*     */   }
/*     */ 
/*     */   public void execute(IRequest request)
/*     */     throws Exception
/*     */   {
/*  46 */     User user = checkRequestPermissions(request);
/*  47 */     Zone zone = user.getZone();
/*     */ 
/*  50 */     if (!UsersUtil.isAllowedToPerformNewSearch(user)) {
/*  51 */       throw new IllegalStateException("Denied: too little time since the last Find request, " + user);
/*     */     }
/*     */ 
/*  54 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*  55 */     ISFSArray expressionData = sfso.getSFSArray("e");
/*     */ 
/*  57 */     Collection searchableUsers = null;
/*  58 */     String failureMessage = null;
/*     */ 
/*  61 */     if (sfso.containsKey("r"))
/*     */     {
/*  63 */       int roomId = sfso.getInt("r").intValue();
/*  64 */       Room room = zone.getRoomById(roomId);
/*     */ 
/*  66 */       if (room != null)
/*  67 */         searchableUsers = room.getUserList();
/*     */       else {
/*  69 */         failureMessage = "Room not found, id: " + roomId;
/*     */       }
/*     */ 
/*     */     }
/*  73 */     else if (sfso.containsKey("g"))
/*     */     {
/*  75 */       String groupId = sfso.getUtfString("g");
/*     */ 
/*  77 */       if (zone.containsPublicGroup(groupId))
/*  78 */         searchableUsers = zone.getUsersInGroup(sfso.getUtfString("g"));
/*     */       else {
/*  80 */         failureMessage = "Group does not exist or is not public: " + groupId;
/*     */       }
/*     */ 
/*     */     }
/*     */     else
/*     */     {
/*  86 */       searchableUsers = zone.getUserList();
/*     */     }
/*     */ 
/*  90 */     MatchExpression expression = MatchExpression.fromSFSArray(expressionData);
/*     */ 
/*  92 */     Collection filteredUsers = null;
/*  93 */     int limit = sfso.containsKey("l") ? sfso.getShort("l").shortValue() : 0;
/*     */ 
/*  96 */     if (failureMessage != null)
/*     */     {
/*  98 */       this.logger.warn("FindUsers failed: " + failureMessage);
/*  99 */       filteredUsers = new ArrayList();
/*     */     }
/*     */     else
/*     */     {
/* 105 */       filteredUsers = this.api.findUsers(searchableUsers, expression, limit);
/*     */     }
/*     */ 
/* 109 */     this.api.getResponseAPI().notifyFilteredUserList(user.getSession(), filteredUsers);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.FindUsers
 * JD-Core Version:    0.6.0
 */