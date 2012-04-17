/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSUserException extends SFSException
/*    */ {
/*    */   public SFSUserException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public SFSUserException(String message)
/*    */   {
/* 13 */     super(message);
/*    */   }
/*    */ 
/*    */   public SFSUserException(String message, SFSErrorData data)
/*    */   {
/* 18 */     super(message, data);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSUserException
 * JD-Core Version:    0.6.0
 */