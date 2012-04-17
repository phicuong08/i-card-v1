/*     */ package com.smartfoxserver.v2.extensions;
/*     */ 
/*     */ import com.smartfoxserver.v2.annotations.Instantiation;
/*     */ import com.smartfoxserver.v2.annotations.Instantiation.InstantiationMode;
/*     */ import com.smartfoxserver.v2.annotations.MultiHandler;
/*     */ import java.util.Map;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ 
/*     */ @Instantiation(Instantiation.InstantiationMode.NEW_INSTANCE)
/*     */ public class SFSHandlerFactory
/*     */   implements IHandlerFactory
/*     */ {
/*     */   private static final String DOT_SEPARATOR = ".";
/*     */   private final Map<String, Class<?>> handlers;
/*     */   private final Map<String, Object> cachedHandlers;
/*     */   private final SFSExtension parentExtension;
/*     */ 
/*     */   public SFSHandlerFactory(SFSExtension parentExtension)
/*     */   {
/*  24 */     this.handlers = new ConcurrentHashMap();
/*  25 */     this.cachedHandlers = new ConcurrentHashMap();
/*  26 */     this.parentExtension = parentExtension;
/*     */   }
/*     */ 
/*     */   public void addHandler(String handlerKey, Class<?> handlerClass)
/*     */   {
/*  34 */     this.handlers.put(handlerKey, handlerClass);
/*     */   }
/*     */ 
/*     */   public synchronized void clearAll()
/*     */   {
/*  40 */     this.handlers.clear();
/*  41 */     this.cachedHandlers.clear();
/*     */   }
/*     */ 
/*     */   public synchronized void removeHandler(String handlerKey)
/*     */   {
/*  48 */     this.handlers.remove(handlerKey);
/*     */ 
/*  51 */     if (this.cachedHandlers.containsKey(handlerKey))
/*  52 */       this.cachedHandlers.remove(handlerKey);
/*     */   }
/*     */ 
/*     */   public Object findHandler(String key)
/*     */     throws InstantiationException, IllegalAccessException
/*     */   {
/*  59 */     Object handler = getHandlerInstance(key);
/*     */ 
/*  62 */     if (handler == null)
/*     */     {
/*  64 */       int lastDotPos = key.lastIndexOf(".");
/*     */ 
/*  70 */       if (lastDotPos > 0) {
/*  71 */         key = key.substring(0, lastDotPos);
/*     */       }
/*     */ 
/*  74 */       handler = getHandlerInstance(key);
/*     */ 
/*  77 */       if ((handler != null) && (!handler.getClass().isAnnotationPresent(MultiHandler.class))) {
/*  78 */         handler = null;
/*     */       }
/*     */     }
/*  81 */     return handler;
/*     */   }
/*     */ 
/*     */   private Object getHandlerInstance(String key)
/*     */     throws InstantiationException, IllegalAccessException
/*     */   {
/*  87 */     Object handler = this.cachedHandlers.get(key);
/*     */ 
/*  89 */     if (handler != null) {
/*  90 */       return handler;
/*     */     }
/*     */ 
/*  93 */     Class handlerClass = (Class)this.handlers.get(key);
/*     */ 
/*  96 */     if (handlerClass == null) {
/*  97 */       return null;
/*     */     }
/*     */ 
/* 100 */     handler = handlerClass.newInstance();
/*     */ 
/* 103 */     if ((handler instanceof IClientRequestHandler)) {
/* 104 */       ((IClientRequestHandler)handler).setParentExtension(this.parentExtension);
/*     */     }
/* 106 */     else if ((handler instanceof IServerEventHandler)) {
/* 107 */       ((IServerEventHandler)handler).setParentExtension(this.parentExtension);
/*     */     }
/*     */ 
/* 110 */     if (handlerClass.isAnnotationPresent(Instantiation.class))
/*     */     {
/* 112 */       Instantiation instAnnotation = (Instantiation)handlerClass.getAnnotation(Instantiation.class);
/*     */ 
/* 115 */       if (instAnnotation.value() == Instantiation.InstantiationMode.SINGLE_INSTANCE) {
/* 116 */         this.cachedHandlers.put(key, handler);
/*     */       }
/*     */     }
/* 119 */     return handler;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.SFSHandlerFactory
 * JD-Core Version:    0.6.0
 */