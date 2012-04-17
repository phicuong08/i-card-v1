/*     */ package com.smartfoxserver.v2.controllers.system.game;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.api.ISFSGameApi;
/*     */ import com.smartfoxserver.v2.api.response.ISFSResponseApi;
/*     */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.match.MatchExpression;
/*     */ import com.smartfoxserver.v2.exceptions.SFSQuickJoinGameException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Collection;
/*     */ import java.util.List;
/*     */ 
/*     */ public class QuickJoinGame extends BaseControllerCommand
/*     */ {
/*     */   private static final int MAX_ROOMS = 32;
/*     */   public static final String KEY_ROOM_LIST = "rl";
/*     */   public static final String KEY_GROUP_LIST = "gl";
/*     */   public static final String KEY_ROOM_TO_LEAVE = "tl";
/*     */   public static final String KEY_MATCH_EXPRESSION = "me";
/*     */ 
/*     */   public QuickJoinGame()
/*     */   {
/*  30 */     super(SystemRequest.QuickJoinGame);
/*     */   }
/*     */ 
/*     */   public boolean validate(IRequest request)
/*     */     throws SFSRequestValidationException
/*     */   {
/*  36 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/*  38 */     if ((!sfso.containsKey("rl")) && (!sfso.containsKey("gl"))) {
/*  39 */       throw new SFSRequestValidationException("No Room/Group specified where to search for Games");
/*     */     }
/*  41 */     return true;
/*     */   }
/*     */ 
/*     */   public void execute(IRequest request)
/*     */     throws Exception
/*     */   {
/*  48 */     User user = checkRequestPermissions(request);
/*  49 */     Zone zone = user.getZone();
/*     */ 
/*  52 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/*  55 */     MatchExpression matchExpression = null;
/*  56 */     ISFSArray matchExprData = sfso.getSFSArray("me");
/*     */ 
/*  58 */     if (matchExprData != null) {
/*  59 */       matchExpression = MatchExpression.fromSFSArray(matchExprData);
/*     */     }
/*     */ 
/*  62 */     Collection searchableRooms = autoDetectSearchableRooms(zone, sfso);
/*     */ 
/*  65 */     Room roomToLeave = null;
/*  66 */     if (sfso.containsKey("tl")) {
/*  67 */       roomToLeave = zone.getRoomById(sfso.getInt("tl").intValue());
/*     */     }
/*     */ 
/*     */     try
/*     */     {
/*  72 */       this.sfs.getAPIManager().getGameApi().quickJoinGame(
/*  74 */         user, 
/*  75 */         matchExpression, 
/*  76 */         searchableRooms, 
/*  77 */         roomToLeave);
/*     */     }
/*     */     catch (SFSQuickJoinGameException quickJoinError)
/*     */     {
/*  90 */       this.api.getResponseAPI().notifyRequestError(quickJoinError.getErrorData(), user, SystemRequest.QuickJoinGame);
/*     */     }
/*     */   }
/*     */ 
/*     */   private Collection<Room> autoDetectSearchableRooms(Zone zone, ISFSObject sfso)
/*     */   {
/*  96 */     List searchableRooms = new ArrayList();
/*     */ 
/*  98 */     if (sfso.containsKey("gl"))
/*     */     {
/* 100 */       Collection groupIds = sfso.getUtfStringArray("gl");
/*     */ 
/* 102 */       for (String groupId : groupIds)
/*     */       {
/* 104 */         if (zone.containsPublicGroup(groupId)) {
/* 105 */           searchableRooms.addAll(zone.getRoomListFromGroup(groupId));
/*     */         }
/*     */       }
/*     */     }
/* 109 */     else if (sfso.containsKey("rl"))
/*     */     {
/* 112 */       int count = 0;
/*     */ 
/* 114 */       Collection roomIds = sfso.getIntArray("rl");
/*     */ 
/* 116 */       for (Integer id : roomIds)
/*     */       {
/* 118 */         Room room = zone.getRoomById(id.intValue());
/*     */ 
/* 120 */         if (room != null) {
/* 121 */           searchableRooms.add(room);
/*     */         }
/*     */ 
/* 124 */         if (count++ > 32) {
/*     */           break;
/*     */         }
/*     */       }
/*     */     }
/* 129 */     return searchableRooms;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.game.QuickJoinGame
 * JD-Core Version:    0.6.0
 */