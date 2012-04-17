/*    */ package com.smartfoxserver.v2.entities;
/*    */ 
/*    */ public class SFSEmail
/*    */   implements Email
/*    */ {
/*    */   private final String from;
/*    */   private final String to;
/*    */   private final String subject;
/*    */   private final String message;
/*    */   private final int priority;
/*    */ 
/*    */   public SFSEmail(String from, String to, String subject, String message)
/*    */   {
/* 29 */     this(from, to, subject, message, 0);
/*    */   }
/*    */ 
/*    */   public SFSEmail(String from, String to, String subject, String message, int priority)
/*    */   {
/* 43 */     this.from = from;
/* 44 */     this.to = to;
/* 45 */     this.subject = subject;
/* 46 */     this.message = message;
/* 47 */     this.priority = priority;
/*    */   }
/*    */ 
/*    */   public String getFromAddress()
/*    */   {
/* 56 */     return this.from;
/*    */   }
/*    */ 
/*    */   public String getToAddress()
/*    */   {
/* 65 */     return this.to;
/*    */   }
/*    */ 
/*    */   public String getSubject()
/*    */   {
/* 74 */     return this.subject;
/*    */   }
/*    */ 
/*    */   public String getMessage()
/*    */   {
/* 83 */     return this.message;
/*    */   }
/*    */ 
/*    */   public int getPriority()
/*    */   {
/* 92 */     return this.priority;
/*    */   }
/*    */ 
/*    */   public String toString()
/*    */   {
/* 98 */     return String.format("{ Email To: %s, From: %s, Subject: %s }", new Object[] { this.to, this.from, this.subject });
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.SFSEmail
 * JD-Core Version:    0.6.0
 */