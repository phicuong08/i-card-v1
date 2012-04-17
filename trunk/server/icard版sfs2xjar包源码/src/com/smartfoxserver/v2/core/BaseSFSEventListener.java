/*    */ package com.smartfoxserver.v2.core;
/*    */ 
/*    */ public class BaseSFSEventListener
/*    */ {
/*    */   private Object parentObject;
/*    */ 
/*    */   public BaseSFSEventListener()
/*    */   {
/*  9 */     this.parentObject = null;
/*    */   }
/*    */ 
/*    */   public BaseSFSEventListener(Object parentObject)
/*    */   {
/* 14 */     this.parentObject = parentObject;
/*    */   }
/*    */ 
/*    */   public Object getParentObject()
/*    */   {
/* 19 */     return this.parentObject;
/*    */   }
/*    */ 
/*    */   public void handleServerEvent(ISFSEvent event)
/*    */   {
/*    */   }
/*    */ 
/*    */   public String toString()
/*    */   {
/* 30 */     return this.parentObject == null ? "{ Anonymous listener }" : this.parentObject.toString();
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.core.BaseSFSEventListener
 * JD-Core Version:    0.6.0
 */