/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSException extends Exception
/*    */ {
/*    */   private static final long serialVersionUID = 6052949605652105170L;
/*    */   SFSErrorData errorData;
/*    */ 
/*    */   public SFSException()
/*    */   {
/* 16 */     this.errorData = null;
/*    */   }
/*    */ 
/*    */   public SFSException(String message)
/*    */   {
/* 21 */     super(message);
/* 22 */     this.errorData = null;
/*    */   }
/*    */ 
/*    */   public SFSException(String message, SFSErrorData data)
/*    */   {
/* 27 */     super(message);
/* 28 */     this.errorData = data;
/*    */   }
/*    */ 
/*    */   public SFSException(Throwable t)
/*    */   {
/* 33 */     super(t);
/* 34 */     this.errorData = null;
/*    */   }
/*    */ 
/*    */   public SFSErrorData getErrorData()
/*    */   {
/* 39 */     return this.errorData;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSException
 * JD-Core Version:    0.6.0
 */