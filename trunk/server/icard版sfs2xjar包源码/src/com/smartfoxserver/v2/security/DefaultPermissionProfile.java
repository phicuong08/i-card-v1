/*    */ package com.smartfoxserver.v2.security;
/*    */ 
/*    */ public enum DefaultPermissionProfile
/*    */   implements IPermissionProfile
/*    */ {
/*  5 */   GUEST(0), 
/*  6 */   STANDARD(1), 
/*  7 */   MODERATOR(2), 
/*  8 */   ADMINISTRATOR(3);
/*    */ 
/*    */   private short id;
/*    */ 
/* 12 */   private DefaultPermissionProfile(int id) { this.id = (short)id;
/*    */   }
/*    */ 
/*    */   public short getId()
/*    */   {
/* 19 */     return this.id;
/*    */   }
/*    */ 
/*    */   public static DefaultPermissionProfile fromId(short id)
/*    */   {
/* 24 */     for (DefaultPermissionProfile dpp : values())
/*    */     {
/* 26 */       if (dpp.id == id) {
/* 27 */         return dpp;
/*    */       }
/*    */     }
/* 30 */     return null;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.security.DefaultPermissionProfile
 * JD-Core Version:    0.6.0
 */