/*    */ package com.smartfoxserver.v2.entities.match;
/*    */ 
/*    */ public enum BoolMatch
/*    */   implements IMatcher
/*    */ {
/* 10 */   EQUALS("=="), 
/*    */ 
/* 13 */   NOT_EQUALS("!=");
/*    */ 
/*    */   String symbol;
/*    */ 
/*    */   private BoolMatch(String symbol) {
/* 19 */     this.symbol = symbol;
/*    */   }
/*    */ 
/*    */   public String getSymbol()
/*    */   {
/* 28 */     return this.symbol;
/*    */   }
/*    */ 
/*    */   public static BoolMatch fromSymbol(String symbol)
/*    */   {
/* 33 */     for (BoolMatch item : values())
/*    */     {
/* 35 */       if (item.symbol.equals(symbol)) {
/* 36 */         return item;
/*    */       }
/*    */     }
/* 39 */     return null;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.BoolMatch
 * JD-Core Version:    0.6.0
 */