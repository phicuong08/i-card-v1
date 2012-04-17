/*    */ package com.smartfoxserver.v2.controllers;
/*    */ 
/*    */ public enum SystemRequest
/*    */ {
/*  5 */   Handshake(Short.valueOf(0)), 
/*  6 */   Login(Short.valueOf(1)), 
/*  7 */   Logout(Short.valueOf(2)), 
/*  8 */   GetRoomList(Short.valueOf(3)), 
/*  9 */   JoinRoom(Short.valueOf(4)), 
/* 10 */   AutoJoin(Short.valueOf(5)), 
/* 11 */   CreateRoom(Short.valueOf(6)), 
/* 12 */   GenericMessage(Short.valueOf(7)), 
/* 13 */   ChangeRoomName(Short.valueOf(8)), 
/* 14 */   ChangeRoomPassword(Short.valueOf(9)), 
/* 15 */   ObjectMessage(Short.valueOf(10)), 
/* 16 */   SetRoomVariables(Short.valueOf(11)), 
/* 17 */   SetUserVariables(Short.valueOf(12)), 
/* 18 */   CallExtension(Short.valueOf(13)), 
/* 19 */   LeaveRoom(Short.valueOf(14)), 
/* 20 */   SubscribeRoomGroup(Short.valueOf(15)), 
/* 21 */   UnsubscribeRoomGroup(Short.valueOf(16)), 
/* 22 */   SpectatorToPlayer(Short.valueOf(17)), 
/* 23 */   PlayerToSpectator(Short.valueOf(18)), 
/* 24 */   ChangeRoomCapacity(Short.valueOf(19)), 
/* 25 */   PublicMessage(Short.valueOf(20)), 
/* 26 */   PrivateMessage(Short.valueOf(21)), 
/* 27 */   ModeratorMessage(Short.valueOf(22)), 
/* 28 */   AdminMessage(Short.valueOf(23)), 
/* 29 */   KickUser(Short.valueOf(24)), 
/* 30 */   BanUser(Short.valueOf(25)), 
/* 31 */   ManualDisconnection(Short.valueOf(26)), 
/* 32 */   FindRooms(Short.valueOf(27)), 
/* 33 */   FindUsers(Short.valueOf(28)), 
/* 34 */   PingPong(Short.valueOf(29)), 
/*    */ 
/* 37 */   InitBuddyList(Short.valueOf(200)), 
/* 38 */   AddBuddy(Short.valueOf(201)), 
/* 39 */   BlockBuddy(Short.valueOf(202)), 
/* 40 */   RemoveBuddy(Short.valueOf(203)), 
/* 41 */   SetBuddyVariables(Short.valueOf(204)), 
/* 42 */   GoOnline(Short.valueOf(205)), 
/* 43 */   BuddyMessage(Short.valueOf(206)), 
/*    */ 
/* 46 */   InviteUser(Short.valueOf(300)), 
/* 47 */   InvitationReply(Short.valueOf(301)), 
/* 48 */   CreateSFSGame(Short.valueOf(302)), 
/* 49 */   QuickJoinGame(Short.valueOf(303)), 
/*    */ 
/* 52 */   OnEnterRoom(Short.valueOf(1000)), 
/* 53 */   OnRoomCountChange(Short.valueOf(1001)), 
/* 54 */   OnUserLost(Short.valueOf(1002)), 
/* 55 */   OnRoomLost(Short.valueOf(1003)), 
/* 56 */   OnUserExitRoom(Short.valueOf(1004)), 
/* 57 */   OnClientDisconnection(Short.valueOf(1005));
/*    */ 
/*    */   private Object id;
/*    */ 
/* 61 */   public static SystemRequest fromId(Object id) { SystemRequest req = null;
/*    */ 
/* 63 */     for (SystemRequest item : values())
/*    */     {
/* 65 */       if (!item.getId().equals(id))
/*    */         continue;
/* 67 */       req = item;
/* 68 */       break;
/*    */     }
/*    */ 
/* 72 */     return req;
/*    */   }
/*    */ 
/*    */   private SystemRequest(Object id)
/*    */   {
/* 77 */     this.id = id;
/*    */   }
/*    */ 
/*    */   public Object getId()
/*    */   {
/* 82 */     return this.id;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.SystemRequest
 * JD-Core Version:    0.6.0
 */