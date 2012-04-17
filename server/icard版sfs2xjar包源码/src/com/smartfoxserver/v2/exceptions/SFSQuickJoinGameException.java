/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSQuickJoinGameException extends SFSJoinRoomException
/*    */ {
/*    */   private static final long serialVersionUID = -4059208183771012804L;
/*    */ 
/*    */   public SFSQuickJoinGameException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public SFSQuickJoinGameException(String message)
/*    */   {
/* 14 */     super(message);
/*    */   }
/*    */ 
/*    */   public SFSQuickJoinGameException(String message, SFSErrorData data)
/*    */   {
/* 19 */     super(message, data);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSQuickJoinGameException
 * JD-Core Version:    0.6.0
 */