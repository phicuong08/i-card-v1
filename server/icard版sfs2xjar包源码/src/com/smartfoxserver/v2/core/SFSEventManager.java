/*     */ package com.smartfoxserver.v2.core;
/*     */ 
/*     */ import java.util.Map;
/*     */ import java.util.Set;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import java.util.concurrent.CopyOnWriteArraySet;
/*     */ import java.util.concurrent.LinkedBlockingQueue;
/*     */ import java.util.concurrent.ThreadPoolExecutor;
/*     */ import java.util.concurrent.TimeUnit;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public final class SFSEventManager extends BaseCoreService
/*     */   implements ISFSEventManager
/*     */ {
/*  40 */   private int corePoolSize = 4;
/*  41 */   private int maxPoolSize = 5;
/*  42 */   private int threadKeepAliveTime = 60;
/*     */   private final ThreadPoolExecutor threadPool;
/*     */   private final Map<SFSEventType, Set<ISFSEventListener>> listenersByEvent;
/*     */   private final Logger logger;
/*     */ 
/*     */   public SFSEventManager()
/*     */   {
/*  77 */     setName("SFSEventManager");
/*     */ 
/*  80 */     this.logger = LoggerFactory.getLogger(SFSEventManager.class);
/*     */ 
/*  83 */     this.threadPool = 
/*  89 */       new ThreadPoolExecutor(this.corePoolSize, 
/*  86 */       this.maxPoolSize, 
/*  87 */       this.threadKeepAliveTime, 
/*  88 */       TimeUnit.SECONDS, 
/*  89 */       new LinkedBlockingQueue());
/*     */ 
/*  93 */     this.listenersByEvent = new ConcurrentHashMap();
/*     */   }
/*     */ 
/*     */   public void init(Object o)
/*     */   {
/*  99 */     super.init(o);
/* 100 */     this.logger.info(this.name + " initalized");
/*     */   }
/*     */ 
/*     */   public void destroy(Object o)
/*     */   {
/* 106 */     super.destroy(o);
/* 107 */     this.listenersByEvent.clear();
/* 108 */     this.logger.info(this.name + " shut down.");
/*     */   }
/*     */ 
/*     */   public void setThreadPoolSize(int poolSize)
/*     */   {
/* 114 */     this.threadPool.setCorePoolSize(poolSize);
/*     */   }
/*     */ 
/*     */   public synchronized void addEventListener(SFSEventType type, ISFSEventListener listener)
/*     */   {
/* 120 */     Set listeners = (Set)this.listenersByEvent.get(type);
/*     */ 
/* 122 */     if (listeners == null)
/*     */     {
/* 124 */       listeners = new CopyOnWriteArraySet();
/* 125 */       this.listenersByEvent.put(type, listeners);
/*     */     }
/*     */ 
/* 128 */     listeners.add(listener);
/*     */   }
/*     */ 
/*     */   public boolean hasEventListener(SFSEventType type)
/*     */   {
/* 134 */     boolean found = false;
/*     */ 
/* 136 */     Set listeners = (Set)this.listenersByEvent.get(type);
/* 137 */     if ((listeners != null) && (listeners.size() > 0)) {
/* 138 */       found = true;
/*     */     }
/* 140 */     return found;
/*     */   }
/*     */ 
/*     */   public synchronized void removeEventListener(SFSEventType type, ISFSEventListener listener)
/*     */   {
/* 146 */     Set listeners = (Set)this.listenersByEvent.get(type);
/*     */ 
/* 148 */     if (listeners != null)
/* 149 */       listeners.remove(listener);
/*     */   }
/*     */ 
/*     */   public void dispatchEvent(ISFSEvent event)
/*     */   {
/* 155 */     Set listeners = (Set)this.listenersByEvent.get(event.getType());
/*     */ 
/* 157 */     if ((listeners != null) && (listeners.size() > 0))
/*     */     {
/* 159 */       for (ISFSEventListener listener : listeners)
/*     */       {
/* 165 */         this.threadPool.execute(new SFSEventRunner(listener, event));
/*     */       }
/*     */     }
/*     */   }
/*     */ 
/*     */   private static final class SFSEventRunner
/*     */     implements Runnable
/*     */   {
/*     */     private final ISFSEventListener listener;
/*     */     private final ISFSEvent event;
/*     */ 
/*     */     public SFSEventRunner(ISFSEventListener listener, ISFSEvent event)
/*     */     {
/*  55 */       this.listener = listener;
/*  56 */       this.event = event;
/*     */     }
/*     */ 
/*     */     public void run()
/*     */     {
/*     */       try
/*     */       {
/*  64 */         this.listener.handleServerEvent(this.event);
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/*  68 */         e.printStackTrace();
/*  69 */         LoggerFactory.getLogger(getClass()).warn("Error in event handler: " + e + ", Event: " + this.event + " Listener: " + this.listener);
/*     */       }
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.core.SFSEventManager
 * JD-Core Version:    0.6.0
 */