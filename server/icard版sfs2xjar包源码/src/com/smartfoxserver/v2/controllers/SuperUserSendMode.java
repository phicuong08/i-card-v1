/*    */ package com.smartfoxserver.v2.controllers;
/*    */ 
/*    */ public enum SuperUserSendMode
/*    */ {
/*  5 */   TO_USER(0), 
/*  6 */   TO_ROOM(1), 
/*  7 */   TO_GROUP(2), 
/*  8 */   TO_ZONE(3);
/*    */ 
/*    */   private int modeId;
/*    */ 
/*    */   private SuperUserSendMode(int id) {
/* 14 */     this.modeId = id;
/*    */   }
/*    */ 
/*    */   public int getId()
/*    */   {
/* 19 */     return this.modeId;
/*    */   }
/*    */ 
/*    */   public static SuperUserSendMode fromId(int id)
/*    */   {
/* 24 */     SuperUserSendMode mode = null;
/*    */ 
/* 26 */     for (SuperUserSendMode item : values())
/*    */     {
/* 28 */       if (item.getId() != id)
/*    */         continue;
/* 30 */       mode = item;
/* 31 */       break;
/*    */     }
/*    */ 
/* 35 */     return mode;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.SuperUserSendMode
 * JD-Core Version:    0.6.0
 */