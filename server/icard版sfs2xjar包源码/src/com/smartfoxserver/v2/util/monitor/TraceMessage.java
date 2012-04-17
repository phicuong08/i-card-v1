/*    */ package com.smartfoxserver.v2.util.monitor;
/*    */ 
/*    */ import com.smartfoxserver.v2.entities.Room;
/*    */ import com.smartfoxserver.v2.entities.Zone;
/*    */ import com.smartfoxserver.v2.extensions.ExtensionLogLevel;
/*    */ 
/*    */ public class TraceMessage
/*    */ {
/*    */   private Zone zone;
/*    */   private Room room;
/*    */   private ExtensionLogLevel level;
/*    */   private String message;
/*    */   private long timestamp;
/*    */ 
/*    */   public TraceMessage(Zone zone, Room room, ExtensionLogLevel level, String message)
/*    */   {
/* 31 */     this.zone = zone;
/* 32 */     this.room = room;
/* 33 */     this.level = level;
/* 34 */     this.message = message;
/* 35 */     this.timestamp = System.currentTimeMillis();
/*    */   }
/*    */ 
/*    */   public Zone getZone()
/*    */   {
/* 40 */     return this.zone;
/*    */   }
/*    */ 
/*    */   public Room getRoom()
/*    */   {
/* 45 */     return this.room;
/*    */   }
/*    */ 
/*    */   public ExtensionLogLevel getLevel()
/*    */   {
/* 50 */     return this.level;
/*    */   }
/*    */ 
/*    */   public String getMessage()
/*    */   {
/* 55 */     return this.message;
/*    */   }
/*    */ 
/*    */   public long getTimestamp()
/*    */   {
/* 60 */     return this.timestamp;
/*    */   }
/*    */ 
/*    */   public String toString()
/*    */   {
/* 66 */     return String.format(
/* 68 */       "[ %s | Z: %s | R: %s | %s | %s ]", new Object[] { 
/* 69 */       Long.valueOf(this.timestamp), 
/* 70 */       this.zone, 
/* 71 */       this.room, 
/* 72 */       this.level, 
/* 73 */       this.message });
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.monitor.TraceMessage
 * JD-Core Version:    0.6.0
 */