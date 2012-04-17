/*    */ package com.smartfoxserver.v2.entities;
/*    */ 
/*    */ public enum SFSRoomRemoveMode
/*    */ {
/* 16 */   DEFAULT, 
/*    */ 
/* 19 */   WHEN_EMPTY, 
/*    */ 
/* 22 */   WHEN_EMPTY_AND_CREATOR_IS_GONE, 
/*    */ 
/* 25 */   NEVER_REMOVE;
/*    */ 
/*    */   public static SFSRoomRemoveMode fromString(String id)
/*    */   {
/* 29 */     return valueOf(id.toUpperCase());
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.SFSRoomRemoveMode
 * JD-Core Version:    0.6.0
 */