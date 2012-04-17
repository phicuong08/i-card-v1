/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSRuntimeException extends RuntimeException
/*    */ {
/*    */   public SFSRuntimeException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public SFSRuntimeException(String message)
/*    */   {
/* 12 */     super(message);
/*    */   }
/*    */ 
/*    */   public SFSRuntimeException(Throwable t)
/*    */   {
/* 17 */     super(t);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSRuntimeException
 * JD-Core Version:    0.6.0
 */