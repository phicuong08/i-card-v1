/*    */ package com.smartfoxserver.v2.entities.invitation;
/*    */ 
/*    */ public enum InvitationResponse
/*    */ {
/*  6 */   ACCEPT(0), 
/*    */ 
/*  9 */   REFUSE(1), 
/*    */ 
/* 12 */   EXPIRED(255);
/*    */ 
/*    */   private int id;
/*    */ 
/*    */   private InvitationResponse(int id) {
/* 18 */     this.id = id;
/*    */   }
/*    */ 
/*    */   public int getId()
/*    */   {
/* 23 */     return this.id;
/*    */   }
/*    */ 
/*    */   public static InvitationResponse fromId(int id)
/*    */   {
/* 28 */     if (id == 0)
/* 29 */       return ACCEPT;
/* 30 */     if (id == 1) {
/* 31 */       return REFUSE;
/*    */     }
/* 33 */     return EXPIRED;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.invitation.InvitationResponse
 * JD-Core Version:    0.6.0
 */