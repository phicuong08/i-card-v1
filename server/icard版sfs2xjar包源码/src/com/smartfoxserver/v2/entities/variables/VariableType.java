/*    */ package com.smartfoxserver.v2.entities.variables;
/*    */ 
/*    */ public enum VariableType
/*    */ {
/*  5 */   NULL(0), 
/*  6 */   BOOL(1), 
/*  7 */   INT(2), 
/*  8 */   DOUBLE(3), 
/*  9 */   STRING(4), 
/* 10 */   OBJECT(5), 
/* 11 */   ARRAY(6);
/*    */ 
/*    */   private int id;
/*    */ 
/*    */   private VariableType(int id) {
/* 17 */     this.id = id;
/*    */   }
/*    */ 
/*    */   public int getId()
/*    */   {
/* 22 */     return this.id;
/*    */   }
/*    */ 
/*    */   public static VariableType fromString(String id)
/*    */   {
/* 27 */     return valueOf(id.toUpperCase());
/*    */   }
/*    */ 
/*    */   public static VariableType fromId(int id)
/*    */   {
/* 32 */     for (VariableType type : values())
/*    */     {
/* 34 */       if (type.id == id) {
/* 35 */         return type;
/*    */       }
/*    */     }
/* 38 */     return null;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.variables.VariableType
 * JD-Core Version:    0.6.0
 */