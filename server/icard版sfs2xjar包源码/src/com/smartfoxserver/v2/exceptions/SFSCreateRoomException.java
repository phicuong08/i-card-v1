/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSCreateRoomException extends SFSException
/*    */ {
/*    */   private static final long serialVersionUID = 4751733417642191809L;
/*    */ 
/*    */   public SFSCreateRoomException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public SFSCreateRoomException(String message)
/*    */   {
/* 14 */     super(message);
/*    */   }
/*    */ 
/*    */   public SFSCreateRoomException(String message, SFSErrorData data)
/*    */   {
/* 19 */     super(message, data);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSCreateRoomException
 * JD-Core Version:    0.6.0
 */