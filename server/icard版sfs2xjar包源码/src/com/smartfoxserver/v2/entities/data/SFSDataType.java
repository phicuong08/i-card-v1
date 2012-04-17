/*    */ package com.smartfoxserver.v2.entities.data;
/*    */ 
/*    */ public enum SFSDataType
/*    */ {
/*  5 */   NULL(0), 
/*  6 */   BOOL(1), 
/*  7 */   BYTE(2), 
/*  8 */   SHORT(3), 
/*  9 */   INT(4), 
/* 10 */   LONG(5), 
/* 11 */   FLOAT(6), 
/* 12 */   DOUBLE(7), 
/* 13 */   UTF_STRING(8), 
/* 14 */   BOOL_ARRAY(9), 
/* 15 */   BYTE_ARRAY(10), 
/* 16 */   SHORT_ARRAY(11), 
/* 17 */   INT_ARRAY(12), 
/* 18 */   LONG_ARRAY(13), 
/* 19 */   FLOAT_ARRAY(14), 
/* 20 */   DOUBLE_ARRAY(15), 
/* 21 */   UTF_STRING_ARRAY(16), 
/* 22 */   SFS_ARRAY(17), 
/* 23 */   SFS_OBJECT(18), 
/* 24 */   CLASS(19);
/*    */ 
/*    */   private int typeID;
/*    */ 
/*    */   private SFSDataType(int typeID)
/*    */   {
/* 31 */     this.typeID = typeID;
/*    */   }
/*    */ 
/*    */   public static SFSDataType fromTypeId(int typeId)
/*    */   {
/* 42 */     for (SFSDataType item : values())
/*    */     {
/* 44 */       if (item.getTypeID() == typeId)
/*    */       {
/* 46 */         return item;
/*    */       }
/*    */     }
/*    */ 
/* 50 */     throw new IllegalArgumentException("Unknown typeId for SFSDataType");
/*    */   }
/*    */ 
/*    */   public static SFSDataType fromClass(Class clazz)
/*    */   {
/* 56 */     return null;
/*    */   }
/*    */ 
/*    */   public int getTypeID()
/*    */   {
/* 61 */     return this.typeID;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.data.SFSDataType
 * JD-Core Version:    0.6.0
 */