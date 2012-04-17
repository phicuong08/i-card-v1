/*    */ package com.smartfoxserver.v2.util;
/*    */ 
/*    */ public enum ClientDisconnectionReason
/*    */   implements IDisconnectionReason
/*    */ {
/*  6 */   IDLE(0), 
/*    */ 
/*  9 */   KICK(1), 
/*    */ 
/* 12 */   BAN(2), 
/*    */ 
/* 15 */   UNKNOWN(3);
/*    */ 
/*    */   private final int value;
/*    */ 
/*    */   private ClientDisconnectionReason(int id) {
/* 21 */     this.value = id;
/*    */   }
/*    */ 
/*    */   public int getValue()
/*    */   {
/* 27 */     return this.value;
/*    */   }
/*    */ 
/*    */   public byte getByteValue()
/*    */   {
/* 33 */     return (byte)this.value;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.ClientDisconnectionReason
 * JD-Core Version:    0.6.0
 */