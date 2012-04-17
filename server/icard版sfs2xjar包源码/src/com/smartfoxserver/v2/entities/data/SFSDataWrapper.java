/*    */ package com.smartfoxserver.v2.entities.data;
/*    */ 
/*    */ public class SFSDataWrapper
/*    */ {
/*    */   private SFSDataType typeId;
/*    */   private Object object;
/*    */ 
/*    */   public SFSDataWrapper(SFSDataType typeId, Object object)
/*    */   {
/* 10 */     this.typeId = typeId;
/* 11 */     this.object = object;
/*    */   }
/*    */ 
/*    */   public SFSDataType getTypeId()
/*    */   {
/* 16 */     return this.typeId;
/*    */   }
/*    */ 
/*    */   public Object getObject()
/*    */   {
/* 21 */     return this.object;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.data.SFSDataWrapper
 * JD-Core Version:    0.6.0
 */