/*    */ package com.smartfoxserver.v2.entities.match;
/*    */ 
/*    */ public enum NumberMatch
/*    */   implements IMatcher
/*    */ {
/*  9 */   EQUALS("=="), 
/*    */ 
/* 12 */   NOT_EQUALS("!="), 
/*    */ 
/* 15 */   LESS_THAN("<"), 
/*    */ 
/* 18 */   GREATER_THAN(">"), 
/*    */ 
/* 21 */   LESS_THAN_OR_EQUAL_TO("<="), 
/*    */ 
/* 24 */   GREATER_THAN_OR_EQUAL_TO(">=");
/*    */ 
/*    */   String symbol;
/*    */ 
/*    */   private NumberMatch(String symbol) {
/* 30 */     this.symbol = symbol;
/*    */   }
/*    */ 
/*    */   public String getSymbol()
/*    */   {
/* 39 */     return this.symbol;
/*    */   }
/*    */ 
/*    */   public static NumberMatch fromSymbol(String symbol)
/*    */   {
/* 44 */     for (NumberMatch item : values())
/*    */     {
/* 46 */       if (item.symbol.equals(symbol)) {
/* 47 */         return item;
/*    */       }
/*    */     }
/* 50 */     return null;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.NumberMatch
 * JD-Core Version:    0.6.0
 */