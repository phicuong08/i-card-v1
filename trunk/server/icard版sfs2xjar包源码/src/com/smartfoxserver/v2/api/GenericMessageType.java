/*    */ package com.smartfoxserver.v2.api;
/*    */ 
/*    */ public enum GenericMessageType
/*    */ {
/*  5 */   PUBLIC_MSG(0), 
/*  6 */   PRIVATE_MSG(1), 
/*  7 */   MODERATOR_MSG(2), 
/*  8 */   ADMING_MSG(3), 
/*  9 */   OBJECT_MSG(4), 
/* 10 */   BUDDY_MSG(5);
/*    */ 
/*    */   private int id;
/*    */ 
/*    */   private GenericMessageType(int id) {
/* 16 */     this.id = id;
/*    */   }
/*    */ 
/*    */   public int getId()
/*    */   {
/* 21 */     return this.id;
/*    */   }
/*    */ 
/*    */   public static GenericMessageType fromId(int id)
/*    */   {
/* 26 */     GenericMessageType type = null;
/*    */ 
/* 28 */     for (GenericMessageType item : values())
/*    */     {
/* 30 */       if (item.getId() != id)
/*    */         continue;
/* 32 */       type = item;
/* 33 */       break;
/*    */     }
/*    */ 
/* 37 */     return type;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.GenericMessageType
 * JD-Core Version:    0.6.0
 */