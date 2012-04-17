/*     */ package com.smartfoxserver.v2.core;
/*     */ 
/*     */ public enum SFSEventType
/*     */ {
/*  48 */   SERVER_READY, 
/*     */ 
/*  73 */   USER_LOGIN, 
/*     */ 
/*  90 */   USER_JOIN_ZONE, 
/*     */ 
/* 109 */   USER_LOGOUT, 
/*     */ 
/* 127 */   USER_JOIN_ROOM, 
/*     */ 
/* 146 */   USER_LEAVE_ROOM, 
/*     */ 
/* 169 */   USER_DISCONNECT, 
/*     */ 
/* 195 */   USER_RECONNECTION_TRY, 
/*     */ 
/* 225 */   USER_RECONNECTION_SUCCESS, 
/*     */ 
/* 241 */   ROOM_ADDED, 
/*     */ 
/* 257 */   ROOM_REMOVED, 
/*     */ 
/* 275 */   PUBLIC_MESSAGE, 
/*     */ 
/* 294 */   PRIVATE_MESSAGE, 
/*     */ 
/* 312 */   ROOM_VARIABLES_UPDATE, 
/*     */ 
/* 329 */   USER_VARIABLES_UPDATE, 
/*     */ 
/* 348 */   SPECTATOR_TO_PLAYER, 
/*     */ 
/* 366 */   PLAYER_TO_SPECTATOR, 
/*     */ 
/* 383 */   BUDDY_ADD, 
/*     */ 
/* 400 */   BUDDY_REMOVE, 
/*     */ 
/* 417 */   BUDDY_BLOCK, 
/*     */ 
/* 434 */   BUDDY_VARIABLES_UPDATE, 
/*     */ 
/* 451 */   BUDDY_ONLINE_STATE_UPDATE, 
/*     */ 
/* 469 */   BUDDY_MESSAGE, 
/*     */ 
/* 487 */   BUDDY_LIST_INIT, 
/*     */ 
/* 504 */   GAME_INVITATION_SUCCESS, 
/*     */ 
/* 521 */   GAME_INVITATION_FAILURE, 
/*     */ 
/* 528 */   __TRACE_MESSAGE;
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.core.SFSEventType
 * JD-Core Version:    0.6.0
 */