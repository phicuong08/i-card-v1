/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ public class SFSCreateGameException extends SFSCreateRoomException
/*    */ {
/*    */   private static final long serialVersionUID = -5896198785404576552L;
/*    */ 
/*    */   public SFSCreateGameException()
/*    */   {
/*    */   }
/*    */ 
/*    */   public SFSCreateGameException(String message)
/*    */   {
/* 14 */     super(message);
/*    */   }
/*    */ 
/*    */   public SFSCreateGameException(String message, SFSErrorData data)
/*    */   {
/* 19 */     super(message, data);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSCreateGameException
 * JD-Core Version:    0.6.0
 */