/*    */ package com.smartfoxserver.v2.util.monitor;
/*    */ 
/*    */ public class TraceMessageMonitor
/*    */   implements ITraceMonitor
/*    */ {
/*    */   private final TraceMessageThrottler throttler;
/* 22 */   private final int throttlingSpeed = 1000;
/*    */ 
/*    */   public TraceMessageMonitor()
/*    */   {
/* 26 */     this.throttler = new TraceMessageThrottler(1000);
/*    */   }
/*    */ 
/*    */   public void handleTraceMessage(TraceMessage tmsg)
/*    */   {
/* 31 */     this.throttler.enqueueResponse(tmsg);
/*    */   }
/*    */ 
/*    */   public void destroy(Object o)
/*    */   {
/*    */   }
/*    */ 
/*    */   public String getName()
/*    */   {
/* 42 */     return "ExtensionTraceMonitorService";
/*    */   }
/*    */ 
/*    */   public void handleMessage(Object message)
/*    */   {
/*    */   }
/*    */ 
/*    */   public void init(Object o)
/*    */   {
/*    */   }
/*    */ 
/*    */   public void setName(String name)
/*    */   {
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.monitor.TraceMessageMonitor
 * JD-Core Version:    0.6.0
 */