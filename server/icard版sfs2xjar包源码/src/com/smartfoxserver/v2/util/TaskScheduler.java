/*     */ package com.smartfoxserver.v2.util;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.service.IService;
/*     */ import java.util.List;
/*     */ import java.util.concurrent.ScheduledFuture;
/*     */ import java.util.concurrent.ScheduledThreadPoolExecutor;
/*     */ import java.util.concurrent.TimeUnit;
/*     */ import java.util.concurrent.atomic.AtomicInteger;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class TaskScheduler
/*     */   implements IService
/*     */ {
/*  35 */   private static AtomicInteger schedulerId = new AtomicInteger(0);
/*     */   private final ScheduledThreadPoolExecutor taskScheduler;
/*     */   private final String serviceName;
/*     */   private final Logger logger;
/*     */ 
/*     */   public TaskScheduler(int threadPoolSize)
/*     */   {
/*  46 */     this.serviceName = ("TaskScheduler-" + schedulerId.getAndIncrement());
/*  47 */     this.logger = LoggerFactory.getLogger(getClass());
/*  48 */     this.taskScheduler = new ScheduledThreadPoolExecutor(threadPoolSize);
/*     */   }
/*     */ 
/*     */   public void init(Object o)
/*     */   {
/*  57 */     this.logger.info(this.serviceName + " started.");
/*     */   }
/*     */ 
/*     */   public void destroy(Object o)
/*     */   {
/*  65 */     List awaitingExecution = this.taskScheduler.shutdownNow();
/*  66 */     this.logger.info(this.serviceName + " stopping. Tasks awaiting execution: " + awaitingExecution.size());
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/*  75 */     return this.serviceName;
/*     */   }
/*     */ 
/*     */   public void handleMessage(Object arg0)
/*     */   {
/*     */   }
/*     */ 
/*     */   public void setName(String arg0)
/*     */   {
/*     */   }
/*     */ 
/*     */   public ScheduledFuture<?> schedule(Runnable task, int delay, TimeUnit unit)
/*     */   {
/* 105 */     this.logger.debug("Task scheduled: " + task + ", " + delay + " " + unit);
/* 106 */     return this.taskScheduler.schedule(task, delay, unit);
/*     */   }
/*     */ 
/*     */   public ScheduledFuture<?> scheduleAtFixedRate(Runnable task, int initialDelay, int period, TimeUnit unit)
/*     */   {
/* 125 */     return this.taskScheduler.scheduleAtFixedRate(task, initialDelay, period, unit);
/*     */   }
/*     */ 
/*     */   public void resizeThreadPool(int threadPoolSize)
/*     */   {
/* 136 */     this.taskScheduler.setCorePoolSize(threadPoolSize);
/*     */   }
/*     */ 
/*     */   public int getThreadPoolSize()
/*     */   {
/* 145 */     return this.taskScheduler.getCorePoolSize();
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.TaskScheduler
 * JD-Core Version:    0.6.0
 */