/*     */ package com.smartfoxserver.v2.util;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.io.IResponse;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import java.util.Collection;
/*     */ import java.util.Iterator;
/*     */ import java.util.Map;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import java.util.concurrent.TimeUnit;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public final class UserCountChangeResponseThrottler
/*     */   implements IResponseThrottler
/*     */ {
/*     */   private static final int MIN_INTERVAL_MILLIS = 250;
/*     */   private Runnable taskHandler;
/*     */   private final Map<Integer, IResponse> responsesByRoomId;
/*     */   private volatile int interval;
/*     */   private final Logger log;
/*     */   private final String zoneName;
/*     */   private final SmartFoxServer sfs;
/*     */ 
/*     */   public UserCountChangeResponseThrottler(int delay, String zoneName)
/*     */   {
/*  80 */     this.log = LoggerFactory.getLogger(getClass());
/*  81 */     this.responsesByRoomId = new ConcurrentHashMap();
/*  82 */     this.zoneName = zoneName;
/*  83 */     this.sfs = SmartFoxServer.getInstance();
/*     */ 
/*  85 */     setInterval(delay);
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/*  91 */     return this.zoneName;
/*     */   }
/*     */ 
/*     */   public int getInterval()
/*     */   {
/*  97 */     return this.interval;
/*     */   }
/*     */ 
/*     */   public void setInterval(int delay)
/*     */   {
/* 102 */     this.interval = (delay >= 250 ? delay : 0);
/*     */ 
/* 105 */     if (this.taskHandler != null) {
/* 106 */       ((UCountTaskHandler)this.taskHandler).stop();
/*     */     }
/*     */ 
/* 109 */     if (this.interval > 0)
/*     */     {
/* 111 */       this.taskHandler = new UCountTaskHandler();
/*     */ 
/* 113 */       this.sfs.getTaskScheduler().scheduleAtFixedRate(
/* 115 */         this.taskHandler, 
/* 116 */         0, 
/* 117 */         this.interval, 
/* 118 */         TimeUnit.MILLISECONDS);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void enqueueResponse(Object o)
/*     */   {
/* 126 */     IResponse response = (IResponse)o;
/*     */ 
/* 129 */     if (this.interval == 0)
/*     */     {
/* 131 */       response.write();
/*     */     }
/*     */     else
/*     */     {
/* 137 */       ISFSObject sfso = (ISFSObject)response.getContent();
/* 138 */       Integer roomId = sfso.getInt("r");
/*     */ 
/* 140 */       if (roomId == null) {
/* 141 */         throw new SFSRuntimeException("Unexpected malformed UCount response, missing room id:\n " + sfso.getDump());
/*     */       }
/*     */ 
/* 144 */       this.responsesByRoomId.put(roomId, response);
/*     */     }
/*     */   }
/*     */ 
/*     */   final class UCountTaskHandler
/*     */     implements Runnable
/*     */   {
/*  34 */     private volatile boolean stopMe = false;
/*     */ 
/*     */     UCountTaskHandler()
/*     */     {
/*     */     }
/*     */ 
/*     */     public void run()
/*     */     {
/*  43 */       if (this.stopMe) {
/*  44 */         throw new RuntimeException("Stopping");
/*     */       }
/*     */ 
/*     */       try
/*     */       {
/*  53 */         for (Iterator iter = UserCountChangeResponseThrottler.this.responsesByRoomId.values().iterator(); iter.hasNext(); )
/*     */         {
/*  55 */           IResponse response = (IResponse)iter.next();
/*  56 */           UserCountChangeResponseThrottler.this.log.debug("---> Throttler running: " + response);
/*     */ 
/*  58 */           response.write();
/*  59 */           iter.remove();
/*     */         }
/*     */       }
/*     */       catch (Exception err)
/*     */       {
/*  64 */         UserCountChangeResponseThrottler.this.log.warn("Unexpected Error: " + err);
/*     */       }
/*     */     }
/*     */ 
/*     */     public void stop()
/*     */     {
/*  70 */       this.stopMe = true;
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.UserCountChangeResponseThrottler
 * JD-Core Version:    0.6.0
 */