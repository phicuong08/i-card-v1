/*    */ package com.smartfoxserver.v2.util;
/*    */ 
/*    */ import java.text.DecimalFormat;
/*    */ import java.text.Format;
/*    */ 
/*    */ public class ServerUptime
/*    */ {
/*    */   private static final int ONE_DAY = 86400000;
/*    */   private static final int ONE_HOUR = 3600000;
/*    */   private static final int ONE_MINUTE = 60000;
/*    */   private static final int ONE_SECOND = 1000;
/*    */   private int days;
/*    */   private int hours;
/*    */   private int minutes;
/*    */   private int seconds;
/*    */ 
/*    */   public ServerUptime(long unixTime)
/*    */   {
/* 22 */     this.days = (int)Math.floor(unixTime / 86400000L);
/* 23 */     unixTime -= 86400000L * this.days;
/*    */ 
/* 26 */     this.hours = (int)Math.floor(unixTime / 3600000L);
/* 27 */     unixTime -= 3600000 * this.hours;
/*    */ 
/* 30 */     this.minutes = (int)Math.floor(unixTime / 60000L);
/* 31 */     unixTime -= 60000 * this.minutes;
/*    */ 
/* 34 */     this.seconds = (int)Math.floor(unixTime / 1000L);
/*    */   }
/*    */ 
/*    */   public int getDays()
/*    */   {
/* 39 */     return this.days;
/*    */   }
/*    */ 
/*    */   public int getHours()
/*    */   {
/* 44 */     return this.hours;
/*    */   }
/*    */ 
/*    */   public int getMinutes()
/*    */   {
/* 49 */     return this.minutes;
/*    */   }
/*    */ 
/*    */   public int getSeconds()
/*    */   {
/* 54 */     return this.seconds;
/*    */   }
/*    */ 
/*    */   public String toString()
/*    */   {
/* 67 */     Format fmt = new DecimalFormat("##00");
/*    */ 
/* 69 */     return String.format(
/* 71 */       "%s days, %s:%s:%s", new Object[] { Integer.valueOf(this.days), fmt.format(Integer.valueOf(this.hours)), fmt.format(Integer.valueOf(this.minutes)), fmt.format(Integer.valueOf(this.seconds)) });
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.ServerUptime
 * JD-Core Version:    0.6.0
 */