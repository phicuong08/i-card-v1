/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSExtensionException extends SFSException
/*    */ {
/*    */   public SFSExtensionException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public SFSExtensionException(String message)
/*    */   {
/* 12 */     super(message);
/*    */   }
/*    */ 
/*    */   public SFSExtensionException(String message, SFSErrorData data)
/*    */   {
/* 17 */     super(message, data);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSExtensionException
 * JD-Core Version:    0.6.0
 */