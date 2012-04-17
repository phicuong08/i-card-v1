/*    */ package com.smartfoxserver.v2.entities.managers;
/*    */ 
/*    */ public class ConnectionStats
/*    */ {
/*    */   private final int socketSessionCount;
/*    */   private final int npcSessionCount;
/*    */   private final int tunnelledSessionCount;
/*    */ 
/*    */   public ConnectionStats(int socketSessionCount, int npcSessionCount, int tunnelledSessionCount)
/*    */   {
/* 12 */     this.socketSessionCount = socketSessionCount;
/* 13 */     this.npcSessionCount = npcSessionCount;
/* 14 */     this.tunnelledSessionCount = tunnelledSessionCount;
/*    */   }
/*    */ 
/*    */   public int getSocketCount()
/*    */   {
/* 19 */     return this.socketSessionCount;
/*    */   }
/*    */ 
/*    */   public int getNpcCount()
/*    */   {
/* 24 */     return this.npcSessionCount;
/*    */   }
/*    */ 
/*    */   public int getTunnelledCount()
/*    */   {
/* 29 */     return this.tunnelledSessionCount;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.ConnectionStats
 * JD-Core Version:    0.6.0
 */