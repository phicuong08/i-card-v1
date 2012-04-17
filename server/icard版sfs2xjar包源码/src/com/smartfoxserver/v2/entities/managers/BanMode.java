/*    */ package com.smartfoxserver.v2.entities.managers;
/*    */ 
/*    */ public enum BanMode
/*    */ {
/*  5 */   BY_ADDRESS(0), 
/*  6 */   BY_NAME(1);
/*    */ 
/*    */   private int id;
/*    */ 
/*    */   private BanMode(int id) {
/* 12 */     this.id = id;
/*    */   }
/*    */ 
/*    */   public static BanMode fromId(int id)
/*    */   {
/* 17 */     if (id == 0) {
/* 18 */       return BY_ADDRESS;
/*    */     }
/* 20 */     return BY_NAME;
/*    */   }
/*    */ 
/*    */   public static BanMode fromString(String id)
/*    */   {
/* 25 */     BanMode mode = BY_NAME;
/*    */ 
/* 27 */     if (id.equalsIgnoreCase("ip")) {
/* 28 */       mode = BY_ADDRESS;
/*    */     }
/* 30 */     return mode;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.BanMode
 * JD-Core Version:    0.6.0
 */