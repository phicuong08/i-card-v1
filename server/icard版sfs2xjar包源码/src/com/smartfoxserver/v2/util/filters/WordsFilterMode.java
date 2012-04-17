/*    */ package com.smartfoxserver.v2.util.filters;
/*    */ 
/*    */ public enum WordsFilterMode
/*    */ {
/*  5 */   WHITE_LIST, 
/*  6 */   BLACK_LIST;
/*    */ 
/*    */   public static WordsFilterMode fromString(String id)
/*    */   {
/* 10 */     WordsFilterMode mode = BLACK_LIST;
/*    */ 
/* 12 */     if (id.equalsIgnoreCase("whitelist")) {
/* 13 */       mode = WHITE_LIST;
/*    */     }
/* 15 */     return mode;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.filters.WordsFilterMode
 * JD-Core Version:    0.6.0
 */