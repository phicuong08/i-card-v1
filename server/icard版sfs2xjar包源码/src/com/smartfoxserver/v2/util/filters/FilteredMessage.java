/*    */ package com.smartfoxserver.v2.util.filters;
/*    */ 
/*    */ public class FilteredMessage
/*    */ {
/*    */   private String message;
/*    */   private int occurrences;
/*    */ 
/*    */   public String getMessage()
/*    */   {
/* 10 */     return this.message;
/*    */   }
/*    */ 
/*    */   public void setMessage(String message)
/*    */   {
/* 15 */     this.message = message;
/*    */   }
/*    */ 
/*    */   public int getOccurrences()
/*    */   {
/* 20 */     return this.occurrences;
/*    */   }
/*    */ 
/*    */   public void setOccurrences(int substitutions)
/*    */   {
/* 25 */     this.occurrences = substitutions;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.filters.FilteredMessage
 * JD-Core Version:    0.6.0
 */