/*    */ package com.smartfoxserver.v2.entities;
/*    */ 
/*    */ public class RoomSize
/*    */ {
/*    */   private int userCount;
/*    */   private int spectatorCount;
/*    */ 
/*    */   public RoomSize(int userCount, int spectatorCount)
/*    */   {
/* 13 */     this.userCount = userCount;
/* 14 */     this.spectatorCount = spectatorCount;
/*    */   }
/*    */ 
/*    */   public int getUserCount()
/*    */   {
/* 23 */     return this.userCount;
/*    */   }
/*    */ 
/*    */   public int getSpectatorCount()
/*    */   {
/* 32 */     return this.spectatorCount;
/*    */   }
/*    */ 
/*    */   public int getTotalUsers()
/*    */   {
/* 41 */     return getUserCount() + getSpectatorCount();
/*    */   }
/*    */ 
/*    */   public String toString()
/*    */   {
/* 47 */     return String.format("{ u: %s, s: %s }", new Object[] { Integer.valueOf(this.userCount), Integer.valueOf(this.spectatorCount) });
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.RoomSize
 * JD-Core Version:    0.6.0
 */