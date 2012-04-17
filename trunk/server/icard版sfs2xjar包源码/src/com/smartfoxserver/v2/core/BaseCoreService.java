/*    */ package com.smartfoxserver.v2.core;
/*    */ 
/*    */ import java.util.concurrent.atomic.AtomicInteger;
/*    */ 
/*    */ public abstract class BaseCoreService
/*    */   implements ICoreService
/*    */ {
/* 11 */   private static final AtomicInteger serviceId = new AtomicInteger(0);
/*    */   private static final String DEFAULT_NAME = "AnonymousService-";
/*    */   protected String name;
/* 14 */   protected volatile boolean active = false;
/*    */ 
/*    */   public void init(Object o)
/*    */   {
/* 18 */     this.name = getId();
/* 19 */     this.active = true;
/*    */   }
/*    */ 
/*    */   public void destroy(Object o)
/*    */   {
/* 24 */     this.active = false;
/*    */   }
/*    */ 
/*    */   public String getName()
/*    */   {
/* 29 */     return this.name;
/*    */   }
/*    */ 
/*    */   public void setName(String name)
/*    */   {
/* 34 */     this.name = name;
/*    */   }
/*    */ 
/*    */   public void handleMessage(Object param)
/*    */   {
/* 39 */     throw new UnsupportedOperationException("This method should be overridden by the child class!");
/*    */   }
/*    */ 
/*    */   public boolean isActive()
/*    */   {
/* 44 */     return this.active;
/*    */   }
/*    */ 
/*    */   public String toString()
/*    */   {
/* 50 */     return "[Core Service]: " + this.name + ", State: " + (isActive() ? "active" : "not active");
/*    */   }
/*    */ 
/*    */   private static String getId()
/*    */   {
/* 55 */     return "AnonymousService-" + serviceId.getAndIncrement();
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.core.BaseCoreService
 * JD-Core Version:    0.6.0
 */