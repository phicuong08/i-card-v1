/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSBuddyListException extends SFSException
/*    */ {
/*    */   public SFSBuddyListException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public SFSBuddyListException(String message)
/*    */   {
/* 13 */     super(message);
/*    */   }
/*    */ 
/*    */   public SFSBuddyListException(String message, SFSErrorData data)
/*    */   {
/* 18 */     super(message, data);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSBuddyListException
 * JD-Core Version:    0.6.0
 */