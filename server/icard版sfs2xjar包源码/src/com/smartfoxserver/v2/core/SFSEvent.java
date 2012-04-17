/*    */ package com.smartfoxserver.v2.core;
/*    */ 
/*    */ import java.util.Map;
/*    */ 
/*    */ public class SFSEvent
/*    */   implements ISFSEvent
/*    */ {
/*    */   private final SFSEventType type;
/*    */   private final Map<ISFSEventParam, Object> params;
/*    */ 
/*    */   public SFSEvent(SFSEventType type)
/*    */   {
/* 20 */     this(type, null);
/*    */   }
/*    */ 
/*    */   public SFSEvent(SFSEventType type, Map<ISFSEventParam, Object> params)
/*    */   {
/* 25 */     this.type = type;
/* 26 */     this.params = params;
/*    */   }
/*    */ 
/*    */   public SFSEventType getType()
/*    */   {
/* 35 */     return this.type;
/*    */   }
/*    */ 
/*    */   public Object getParameter(ISFSEventParam id)
/*    */   {
/* 44 */     Object param = null;
/*    */ 
/* 46 */     if (this.params != null) {
/* 47 */       param = this.params.get(id);
/*    */     }
/* 49 */     return param;
/*    */   }
/*    */ 
/*    */   public String toString()
/*    */   {
/* 55 */     return String.format("{ %s, Params: %s }", new Object[] { this.type, this.params != null ? this.params.keySet() : "none" });
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.core.SFSEvent
 * JD-Core Version:    0.6.0
 */