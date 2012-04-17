/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSAdminException extends SFSException
/*    */ {
/*    */   public SFSAdminException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public SFSAdminException(String message)
/*    */   {
/* 13 */     super(message);
/*    */   }
/*    */ 
/*    */   public SFSAdminException(String message, SFSErrorData data)
/*    */   {
/* 18 */     super(message, data);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSAdminException
 * JD-Core Version:    0.6.0
 */