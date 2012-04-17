/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSJoinRoomException extends SFSException
/*    */ {
/*    */   private static final long serialVersionUID = 6384101728401558209L;
/*    */ 
/*    */   public SFSJoinRoomException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public SFSJoinRoomException(String message)
/*    */   {
/* 14 */     super(message);
/*    */   }
/*    */ 
/*    */   public SFSJoinRoomException(String message, SFSErrorData data)
/*    */   {
/* 19 */     super(message, data);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSJoinRoomException
 * JD-Core Version:    0.6.0
 */