/*    */ package com.smartfoxserver.v2.entities.match;
/*    */ 
/*    */ public enum StringMatch
/*    */   implements IMatcher
/*    */ {
/*  9 */   EQUALS("=="), 
/*    */ 
/* 13 */   NOT_EQUALS("!="), 
/*    */ 
/* 16 */   CONTAINS("contains"), 
/*    */ 
/* 19 */   STARTS_WITH("startsWith"), 
/*    */ 
/* 22 */   ENDS_WITH("endsWith");
/*    */ 
/*    */   private String symbol;
/*    */ 
/*    */   private StringMatch(String symbol) {
/* 28 */     this.symbol = symbol;
/*    */   }
/*    */ 
/*    */   public String getSymbol()
/*    */   {
/* 37 */     return this.symbol;
/*    */   }
/*    */ 
/*    */   public static StringMatch fromSymbol(String symbol)
/*    */   {
/* 42 */     for (StringMatch item : values())
/*    */     {
/* 44 */       if (item.symbol.equals(symbol)) {
/* 45 */         return item;
/*    */       }
/*    */     }
/* 48 */     return null;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.StringMatch
 * JD-Core Version:    0.6.0
 */