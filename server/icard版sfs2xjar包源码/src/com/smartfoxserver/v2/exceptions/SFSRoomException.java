/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSRoomException extends SFSException
/*    */ {
/*    */   public SFSRoomException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public SFSRoomException(String message)
/*    */   {
/* 12 */     super(message);
/*    */   }
/*    */ 
/*    */   public SFSRoomException(String message, SFSErrorData data)
/*    */   {
/* 17 */     super(message, data);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSRoomException
 * JD-Core Version:    0.6.0
 */