/*     */ package com.smartfoxserver.v2.extensions.filter;
/*     */ 
/*     */ import com.smartfoxserver.v2.core.ISFSEvent;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.exceptions.SFSException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import com.smartfoxserver.v2.extensions.SFSExtension;
/*     */ import java.util.Collection;
/*     */ import java.util.Iterator;
/*     */ import java.util.concurrent.ConcurrentLinkedQueue;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSExtensionFilterChain
/*     */   implements IFilterChain
/*     */ {
/*     */   private final Collection<SFSExtensionFilter> filters;
/*     */   private final SFSExtension parentExtension;
/*     */   private final Logger log;
/*     */ 
/*     */   public SFSExtensionFilterChain(SFSExtension parentExtension)
/*     */   {
/*  31 */     this.parentExtension = parentExtension;
/*  32 */     this.log = LoggerFactory.getLogger(getClass());
/*     */ 
/*  34 */     this.filters = new ConcurrentLinkedQueue();
/*     */   }
/*     */ 
/*     */   public void addFilter(String filterName, SFSExtensionFilter filter)
/*     */   {
/*  43 */     if (this.filters.contains(filter)) {
/*  44 */       throw new SFSRuntimeException("A filter with the same name already exists: " + filterName + ", Ext: " + this.parentExtension);
/*     */     }
/*     */ 
/*  47 */     filter.setName(filterName);
/*     */ 
/*  50 */     filter.init(this.parentExtension);
/*     */ 
/*  52 */     this.filters.add(filter);
/*     */   }
/*     */ 
/*     */   public void remove(String filterName)
/*     */   {
/*  61 */     for (Iterator it = this.filters.iterator(); it.hasNext(); )
/*     */     {
/*  63 */       SFSExtensionFilter filter = (SFSExtensionFilter)it.next();
/*  64 */       if (!filter.getName().equals(filterName))
/*     */         continue;
/*  66 */       it.remove();
/*  67 */       break;
/*     */     }
/*     */   }
/*     */ 
/*     */   public FilterAction runEventInChain(ISFSEvent event)
/*     */     throws SFSException
/*     */   {
/*  75 */     FilterAction filterAction = FilterAction.CONTINUE;
/*     */ 
/*  77 */     for (SFSExtensionFilter filter : this.filters)
/*     */     {
/*     */       try
/*     */       {
/*  81 */         filterAction = filter.handleServerEvent(event);
/*     */ 
/*  83 */         if (filterAction != FilterAction.HALT) {
/*     */           continue;
/*     */         }
/*     */       }
/*     */       catch (SFSException sfsEx)
/*     */       {
/*  89 */         throw sfsEx;
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/*  94 */         this.log.warn(
/*  96 */           String.format(
/*  98 */           "Exception in FilterChain execution:%s --- Filter: %s, Event: %s, Ext: %s", new Object[] { 
/*  99 */           e.toString(), 
/* 100 */           filter.getName(), 
/* 101 */           event, 
/* 102 */           this.parentExtension }));
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 109 */     return filterAction;
/*     */   }
/*     */ 
/*     */   public FilterAction runRequestInChain(String requestId, User sender, ISFSObject params)
/*     */   {
/* 115 */     FilterAction filterAction = FilterAction.CONTINUE;
/*     */ 
/* 117 */     for (SFSExtensionFilter filter : this.filters)
/*     */     {
/*     */       try
/*     */       {
/* 121 */         filterAction = filter.handleClientRequest(requestId, sender, params);
/*     */ 
/* 123 */         if (filterAction != FilterAction.HALT)
/*     */           continue;
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/* 128 */         this.log.warn(
/* 130 */           String.format(
/* 132 */           "Exception in FilterChain execution:%s --- Filter: %s, Req: %s, Ext: %s", new Object[] { 
/* 133 */           e.toString(), 
/* 134 */           filter.getName(), 
/* 135 */           requestId, 
/* 136 */           this.parentExtension }));
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 143 */     return filterAction;
/*     */   }
/*     */ 
/*     */   public int size()
/*     */   {
/* 152 */     return this.filters.size();
/*     */   }
/*     */ 
/*     */   public void destroy()
/*     */   {
/* 161 */     for (SFSExtensionFilter filter : this.filters)
/*     */     {
/* 163 */       filter.destroy();
/*     */     }
/*     */ 
/* 166 */     this.filters.clear();
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.filter.SFSExtensionFilterChain
 * JD-Core Version:    0.6.0
 */