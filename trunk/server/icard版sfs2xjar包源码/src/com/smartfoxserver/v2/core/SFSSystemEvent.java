/*    */ package com.smartfoxserver.v2.core;
/*    */ 
/*    */ import java.util.Map;
/*    */ 
/*    */ public class SFSSystemEvent extends SFSEvent
/*    */ {
/*    */   private final Map<ISFSEventParam, Object> sysParams;
/*    */ 
/*    */   public SFSSystemEvent(SFSEventType type, Map<ISFSEventParam, Object> params, Map<ISFSEventParam, Object> sysParams)
/*    */   {
/* 11 */     super(type, params);
/* 12 */     this.sysParams = sysParams;
/*    */   }
/*    */ 
/*    */   public Object getSysParameter(ISFSEventParam key)
/*    */   {
/* 17 */     return this.sysParams.get(key);
/*    */   }
/*    */ 
/*    */   public void setSysParameter(ISFSEventParam key, Object value)
/*    */   {
/* 22 */     if (this.sysParams != null)
/* 23 */       this.sysParams.put(key, value);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.core.SFSSystemEvent
 * JD-Core Version:    0.6.0
 */