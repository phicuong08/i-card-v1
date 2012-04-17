/*    */ package com.smartfoxserver.v2.util.filters;
/*    */ 
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import java.util.Map;
/*    */ import java.util.concurrent.ConcurrentHashMap;
/*    */ 
/*    */ public class RequestMonitor
/*    */ {
/*    */   private final Map<SystemRequest, RequestRateMeter> rateMeters;
/*    */ 
/*    */   public RequestMonitor()
/*    */   {
/* 51 */     this.rateMeters = new ConcurrentHashMap();
/*    */   }
/*    */ 
/*    */   public int updateRequest(SystemRequest request)
/*    */   {
/* 56 */     RequestRateMeter meter = (RequestRateMeter)this.rateMeters.get(request);
/*    */ 
/* 58 */     if (meter != null) {
/* 59 */       return meter.updateAndCheck();
/*    */     }
/*    */ 
/* 68 */     this.rateMeters.put(request, new RequestRateMeter());
/* 69 */     return 1;
/*    */   }
/*    */ 
/*    */   private static final class RequestRateMeter
/*    */   {
/*    */     private static final int DEFAULT_SECONDS = 1;
/*    */     private int rateMonitorMillis;
/*    */     private long lastUpdate;
/*    */     private int reqCounter;
/*    */ 
/*    */     public RequestRateMeter()
/*    */     {
/* 19 */       this(1);
/*    */     }
/*    */ 
/*    */     public RequestRateMeter(int secondsMonitored)
/*    */     {
/* 24 */       this.rateMonitorMillis = (secondsMonitored * 1000);
/* 25 */       this.lastUpdate = System.currentTimeMillis();
/* 26 */       this.reqCounter = 0;
/*    */     }
/*    */ 
/*    */     public synchronized int updateAndCheck()
/*    */     {
/* 34 */       long now = System.currentTimeMillis();
/*    */ 
/* 37 */       if (now - this.lastUpdate > this.rateMonitorMillis) {
/* 38 */         this.reqCounter = 0;
/*    */       }
/* 40 */       this.reqCounter += 1;
/* 41 */       this.lastUpdate = now;
/*    */ 
/* 43 */       return this.reqCounter;
/*    */     }
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.filters.RequestMonitor
 * JD-Core Version:    0.6.0
 */