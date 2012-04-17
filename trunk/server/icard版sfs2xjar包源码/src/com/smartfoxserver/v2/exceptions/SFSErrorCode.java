/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public enum SFSErrorCode
/*    */   implements IErrorCode
/*    */ {
/*  6 */   HANDSHAKE_API_OBSOLETE(0), 
/*    */ 
/*  8 */   LOGIN_BAD_ZONENAME(1), 
/*  9 */   LOGIN_BAD_USERNAME(2), 
/* 10 */   LOGIN_BAD_PASSWORD(3), 
/* 11 */   LOGIN_BANNED_USER(4), 
/* 12 */   LOGIN_ZONE_FULL(5), 
/* 13 */   LOGIN_ALREADY_LOGGED(6), 
/* 14 */   LOGIN_SERVER_FULL(7), 
/* 15 */   LOGIN_INACTIVE_ZONE(8), 
/* 16 */   LOGIN_NAME_CONTAINS_BAD_WORDS(9), 
/* 17 */   LOGIN_GUEST_NOT_ALLOWED(10), 
/* 18 */   LOGIN_BANNED_IP(11), 
/* 19 */   ROOM_DUPLICATE_NAME(12), 
/* 20 */   CREATE_ROOM_BAD_GROUP(13), 
/* 21 */   ROOM_NAME_BAD_SIZE(14), 
/* 22 */   ROOM_NAME_CONTAINS_BADWORDS(15), 
/* 23 */   CREATE_ROOM_ZONE_FULL(16), 
/* 24 */   CREATE_ROOM_EXCEED_USER_LIMIT(17), 
/* 25 */   CREATE_ROOM_WRONG_PARAMETER(18), 
/* 26 */   JOIN_ALREADY_JOINED(19), 
/* 27 */   JOIN_ROOM_FULL(20), 
/* 28 */   JOIN_BAD_PASSWORD(21), 
/* 29 */   JOIN_BAD_ROOM(22), 
/* 30 */   JOIN_ROOM_LOCKED(23), 
/* 31 */   SUBSCRIBE_GROUP_ALREADY_SUBSCRIBED(24), 
/* 32 */   SUBSCRIBE_GROUP_NOT_FOUND(25), 
/* 33 */   UNSUBSCRIBE_GROUP_NOT_SUBSCRIBED(26), 
/* 34 */   UNSUBSCRIBE_GROUP_NOT_FOUND(27), 
/* 35 */   GENERIC_ERROR(28), 
/* 36 */   ROOM_NAME_CHANGE_PERMISSION_ERR(29), 
/* 37 */   ROOM_PASS_CHANGE_PERMISSION_ERR(30), 
/* 38 */   ROOM_CAPACITY_CHANGE_PERMISSION_ERR(31), 
/* 39 */   SWITCH_NO_PLAYER_SLOTS_AVAILABLE(32), 
/* 40 */   SWITCH_NO_SPECTATOR_SLOTS_AVAILABLE(33), 
/* 41 */   SWITCH_NOT_A_GAME_ROOM(34), 
/* 42 */   SWITCH_NOT_JOINED_IN_ROOM(35), 
/* 43 */   BUDDY_LIST_LOAD_FAILURE(36), 
/* 44 */   BUDDY_LIST_FULL(37), 
/* 45 */   BUDDY_BLOCK_FAILURE(38), 
/* 46 */   BUDDY_TOO_MANY_VARIABLES(39), 
/* 47 */   JOIN_GAME_ACCESS_DENIED(40), 
/* 48 */   JOIN_GAME_NOT_FOUND(41), 
/* 49 */   INVITATION_NOT_VALID(42);
/*    */ 
/*    */   private short id;
/*    */ 
/* 53 */   private SFSErrorCode(int id) { this.id = (short)id;
/*    */   }
/*    */ 
/*    */   public short getId()
/*    */   {
/* 60 */     return this.id;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSErrorCode
 * JD-Core Version:    0.6.0
 */