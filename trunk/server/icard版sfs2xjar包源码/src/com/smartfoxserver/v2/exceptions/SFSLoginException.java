/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSLoginException extends SFSException
/*    */ {
/*    */   public SFSLoginException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public SFSLoginException(String message)
/*    */   {
/* 13 */     super(message);
/*    */   }
/*    */ 
/*    */   public SFSLoginException(String message, SFSErrorData data)
/*    */   {
/* 18 */     super(message, data);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSLoginException
 * JD-Core Version:    0.6.0
 */