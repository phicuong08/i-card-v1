/*     */ package com.smartfoxserver.v2.util.monitor;
/*     */ 
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.core.ISFSEventManager;
/*     */ import com.smartfoxserver.v2.core.SFSEvent;
/*     */ import com.smartfoxserver.v2.core.SFSEventParam;
/*     */ import com.smartfoxserver.v2.core.SFSEventSysParam;
/*     */ import com.smartfoxserver.v2.core.SFSEventType;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.managers.IZoneManager;
/*     */ import com.smartfoxserver.v2.util.IResponseThrottler;
/*     */ import com.smartfoxserver.v2.util.TaskScheduler;
/*     */ import java.util.ArrayList;
/*     */ import java.util.HashMap;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import java.util.concurrent.TimeUnit;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ final class TraceMessageThrottler
/*     */   implements IResponseThrottler
/*     */ {
/*  31 */   private final int MIN_THROTTLING_SPEED = 250;
/*     */   private final Logger log;
/*     */   private final SmartFoxServer sfs;
/*     */   private int interval;
/*     */   private List<TraceMessage> messages;
/*     */   private Runnable taskRunner;
/*     */ 
/*     */   public TraceMessageThrottler(int interval)
/*     */   {
/*  41 */     this.log = LoggerFactory.getLogger(getClass());
/*  42 */     this.sfs = SmartFoxServer.getInstance();
/*  43 */     this.messages = new ArrayList();
/*     */ 
/*  45 */     setInterval(interval);
/*     */   }
/*     */ 
/*     */   public void enqueueResponse(Object o)
/*     */   {
/*  51 */     TraceMessage tms = (TraceMessage)o;
/*     */ 
/*  53 */     synchronized (this.messages)
/*     */     {
/*  55 */       this.messages.add(tms);
/*     */     }
/*     */   }
/*     */ 
/*     */   public int getInterval()
/*     */   {
/*  62 */     return this.interval;
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/*  68 */     return "TraceMessageThrottler";
/*     */   }
/*     */ 
/*     */   public void setInterval(int interval)
/*     */   {
/*  74 */     if (interval < 250) {
/*  75 */       this.interval = 250;
/*     */     }
/*  77 */     this.interval = interval;
/*     */ 
/*  79 */     if (this.taskRunner != null) {
/*  80 */       ((TraceEventTaskRunner)this.taskRunner).stop();
/*     */     }
/*  82 */     this.taskRunner = new TraceEventTaskRunner();
/*     */ 
/*  84 */     this.sfs.getTaskScheduler().scheduleAtFixedRate(
/*  86 */       this.taskRunner, 
/*  87 */       0, 
/*  88 */       this.interval, 
/*  89 */       TimeUnit.MILLISECONDS);
/*     */   }
/*     */ 
/*     */   final class TraceEventTaskRunner
/*     */     implements Runnable
/*     */   {
/*  99 */     private volatile boolean stopMe = false;
/*     */ 
/*     */     TraceEventTaskRunner()
/*     */     {
/*     */     }
/*     */ 
/*     */     public void run()
/*     */     {
/* 108 */       if (this.stopMe) {
/* 109 */         throw new RuntimeException("Stopping Task");
/*     */       }
/*     */ 
/* 112 */       if (TraceMessageThrottler.this.messages.size() == 0) {
/* 113 */         return;
/*     */       }
/*     */ 
/*     */       try
/*     */       {
/* 123 */         synchronized (TraceMessageThrottler.this.messages)
/*     */         {
/* 126 */           List eventData = new ArrayList(TraceMessageThrottler.this.messages);
/*     */ 
/* 129 */           TraceMessageThrottler.this.messages.clear();
/*     */         }
/*     */         List eventData;
/* 140 */         Zone targetZone = TraceMessageThrottler.this.sfs.getZoneManager().getZoneByName("--=={{{ AdminZone }}}==--");
/* 141 */         if (targetZone != null)
/*     */         {
/* 143 */           Map params = new HashMap();
/* 144 */           params.put(SFSEventParam.ZONE, targetZone);
/* 145 */           params.put(SFSEventSysParam.TRACE_MESSAGE_LIST, eventData);
/*     */ 
/* 147 */           TraceMessageThrottler.this.sfs.getEventManager().dispatchEvent(
/* 149 */             new SFSEvent(
/* 151 */             SFSEventType.__TRACE_MESSAGE, 
/* 152 */             params));
/*     */         }
/*     */ 
/*     */       }
/*     */       catch (Exception err)
/*     */       {
/* 159 */         TraceMessageThrottler.this.log.warn("Unexpected Error: " + err);
/*     */       }
/*     */     }
/*     */ 
/*     */     public void stop()
/*     */     {
/* 165 */       this.stopMe = true;
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.monitor.TraceMessageThrottler
 * JD-Core Version:    0.6.0
 */