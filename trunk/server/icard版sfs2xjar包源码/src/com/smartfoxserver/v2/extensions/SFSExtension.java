/*     */ package com.smartfoxserver.v2.extensions;
/*     */ 
/*     */ import com.smartfoxserver.v2.annotations.MultiHandler;
/*     */ import com.smartfoxserver.v2.core.ISFSEvent;
/*     */ import com.smartfoxserver.v2.core.SFSEventType;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import com.smartfoxserver.v2.extensions.filter.FilterAction;
/*     */ import com.smartfoxserver.v2.extensions.filter.IFilterChain;
/*     */ import com.smartfoxserver.v2.extensions.filter.SFSExtensionFilter;
/*     */ import com.smartfoxserver.v2.extensions.filter.SFSExtensionFilterChain;
/*     */ 
/*     */ public abstract class SFSExtension extends BaseSFSExtension
/*     */ {
/*     */   public static final String MULTIHANDLER_REQUEST_ID = "__[[REQUEST_ID]]__";
/*     */   private final IHandlerFactory handlerFactory;
/*     */   private final IFilterChain filterChain;
/*     */ 
/*     */   public SFSExtension()
/*     */   {
/*  51 */     this.handlerFactory = new SFSHandlerFactory(this);
/*  52 */     this.filterChain = new SFSExtensionFilterChain(this);
/*     */   }
/*     */ 
/*     */   public void destroy()
/*     */   {
/*  58 */     this.handlerFactory.clearAll();
/*  59 */     this.filterChain.destroy();
/*  60 */     removeEventsForListener(this);
/*     */   }
/*     */ 
/*     */   protected void addRequestHandler(String requestId, Class<?> theClass)
/*     */   {
/*  85 */     if (!IClientRequestHandler.class.isAssignableFrom(theClass))
/*     */     {
/*  87 */       throw new SFSRuntimeException(
/*  89 */         String.format(
/*  91 */         "Provided Request Handler does not implement IClientRequestHandler: %s, Cmd: %s", new Object[] { 
/*  92 */         theClass, 
/*  93 */         requestId }));
/*     */     }
/*     */ 
/*  99 */     this.handlerFactory.addHandler(requestId, theClass);
/*     */   }
/*     */ 
/*     */   protected void addEventHandler(SFSEventType eventType, Class<?> theClass)
/*     */   {
/* 114 */     if (!IServerEventHandler.class.isAssignableFrom(theClass))
/*     */     {
/* 116 */       throw new SFSRuntimeException(
/* 118 */         String.format(
/* 120 */         "Provided Event Handler does not implement IServerEventHandler: %s, Cmd: %s", new Object[] { 
/* 121 */         theClass, 
/* 122 */         eventType.toString() }));
/*     */     }
/*     */ 
/* 128 */     addEventListener(eventType, this);
/*     */ 
/* 131 */     this.handlerFactory.addHandler(eventType.toString(), theClass);
/*     */   }
/*     */ 
/*     */   protected void removeRequestHandler(String requestId)
/*     */   {
/* 141 */     this.handlerFactory.removeHandler(requestId);
/*     */   }
/*     */ 
/*     */   protected void removeEventHandler(SFSEventType eventType)
/*     */   {
/* 150 */     removeEventListener(eventType, this);
/* 151 */     this.handlerFactory.removeHandler(eventType.toString());
/*     */   }
/*     */ 
/*     */   protected void clearAllHandlers()
/*     */   {
/* 159 */     this.handlerFactory.clearAll();
/*     */   }
/*     */ 
/*     */   public void handleClientRequest(String requestId, User sender, ISFSObject params)
/*     */   {
/* 169 */     if (this.filterChain.size() > 0)
/*     */     {
/* 172 */       if (this.filterChain.runRequestInChain(requestId, sender, params) == FilterAction.HALT) {
/* 173 */         return;
/*     */       }
/*     */     }
/*     */     try
/*     */     {
/* 178 */       IClientRequestHandler handler = (IClientRequestHandler)this.handlerFactory.findHandler(requestId);
/*     */ 
/* 180 */       if (handler == null) {
/* 181 */         throw new SFSRuntimeException("Request handler not found: '" + requestId + "'. Make sure the handler is registered in your extension using addRequestHandler()");
/*     */       }
/*     */ 
/* 184 */       if (handler.getClass().isAnnotationPresent(MultiHandler.class))
/*     */       {
/* 187 */         String[] requestNameTokens = requestId.split("\\.");
/* 188 */         params.putUtfString("__[[REQUEST_ID]]__", requestNameTokens[(requestNameTokens.length - 1)]);
/*     */       }
/*     */ 
/* 192 */       handler.handleClientRequest(sender, params);
/*     */     }
/*     */     catch (InstantiationException err)
/*     */     {
/* 197 */       trace(ExtensionLogLevel.WARN, new Object[] { "Cannot instantiate handler class: " + err });
/*     */     }
/*     */     catch (IllegalAccessException err)
/*     */     {
/* 202 */       trace(ExtensionLogLevel.WARN, new Object[] { "Illegal access for handler class: " + err });
/*     */     }
/*     */   }
/*     */ 
/*     */   public void handleServerEvent(ISFSEvent event)
/*     */     throws Exception
/*     */   {
/* 212 */     String handlerId = event.getType().toString();
/*     */ 
/* 215 */     if (this.filterChain.size() > 0)
/*     */     {
/* 218 */       if (this.filterChain.runEventInChain(event) == FilterAction.HALT) {
/* 219 */         return;
/*     */       }
/*     */     }
/*     */     try
/*     */     {
/* 224 */       IServerEventHandler handler = (IServerEventHandler)this.handlerFactory.findHandler(handlerId);
/*     */ 
/* 226 */       if (handler == null)
/*     */       {
/* 232 */         if (getLevel() == ExtensionLevel.ROOM)
/*     */         {
/* 235 */           if (getParentZone().getRoomById(getParentRoom().getId()) == null) {
/* 236 */             return;
/*     */           }
/*     */         }
/* 239 */         throw new SFSRuntimeException("Event handler not found: '" + handlerId + "'. Make sure the handler is registered in your extension using addEventHandler()");
/*     */       }
/*     */ 
/* 242 */       handler.handleServerEvent(event);
/*     */     }
/*     */     catch (InstantiationException err)
/*     */     {
/* 247 */       trace(ExtensionLogLevel.WARN, new Object[] { "Cannot instantiate handler class: " + err });
/*     */     }
/*     */     catch (IllegalAccessException err)
/*     */     {
/* 252 */       trace(ExtensionLogLevel.WARN, new Object[] { "Illegal access for handler class: " + err });
/*     */     }
/*     */   }
/*     */ 
/*     */   public final void addFilter(String filterName, SFSExtensionFilter filter)
/*     */   {
/* 264 */     this.filterChain.addFilter(filterName, filter);
/*     */   }
/*     */ 
/*     */   public void removeFilter(String filterName)
/*     */   {
/* 273 */     this.filterChain.remove(filterName);
/*     */   }
/*     */ 
/*     */   public void clearFilters()
/*     */   {
/* 281 */     this.filterChain.destroy();
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.SFSExtension
 * JD-Core Version:    0.6.0
 */