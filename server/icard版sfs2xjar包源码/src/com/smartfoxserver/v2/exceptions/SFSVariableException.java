/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSVariableException extends SFSException
/*    */ {
/*    */   public SFSVariableException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public SFSVariableException(String message)
/*    */   {
/* 12 */     super(message);
/*    */   }
/*    */ 
/*    */   public SFSVariableException(String message, SFSErrorData data)
/*    */   {
/* 17 */     super(message, data);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSVariableException
 * JD-Core Version:    0.6.0
 */