/*    */ package com.smartfoxserver.v2.entities.match;
/*    */ 
/*    */ import com.smartfoxserver.v2.entities.Room;
/*    */ import com.smartfoxserver.v2.entities.RoomSize;
/*    */ import com.smartfoxserver.v2.game.SFSGame;
/*    */ 
/*    */ public class RoomProxyVariableResolver
/*    */   implements IProxyVariableResolver
/*    */ {
/*    */   public Object getValue(EntityWithVariables entity, String variableName)
/*    */   {
/* 11 */     Object o = entity.getEntity();
/*    */ 
/* 14 */     if (!(o instanceof Room)) {
/* 15 */       return null;
/*    */     }
/* 17 */     Room room = (Room)o;
/* 18 */     Object value = null;
/*    */ 
/* 20 */     if (variableName.equals("${N}")) {
/* 21 */       value = room.getName();
/*    */     }
/* 23 */     else if (variableName.equals("${G}")) {
/* 24 */       value = room.getGroupId();
/*    */     }
/* 26 */     else if (variableName.equals("${ISG}")) {
/* 27 */       value = Boolean.valueOf(room.isGame());
/*    */     }
/* 29 */     else if (variableName.equals("${MXU}")) {
/* 30 */       value = Integer.valueOf(room.getMaxUsers());
/*    */     }
/* 32 */     else if (variableName.equals("${MXS}")) {
/* 33 */       value = Integer.valueOf(room.getMaxSpectators());
/*    */     }
/* 35 */     else if (variableName.equals("${UC}")) {
/* 36 */       value = Integer.valueOf(room.getSize().getUserCount());
/*    */     }
/* 38 */     else if (variableName.equals("${SC}")) {
/* 39 */       value = Integer.valueOf(room.getSize().getSpectatorCount());
/*    */     }
/* 41 */     else if (variableName.equals("${ISP}")) {
/* 42 */       value = Boolean.valueOf(room.isPasswordProtected());
/*    */     }
/* 44 */     else if (variableName.equals("${HFP}")) {
/* 45 */       value = Boolean.valueOf(!room.isFull());
/*    */     }
/* 47 */     else if (variableName.equals("${IST}")) {
/* 48 */       value = Boolean.valueOf(room instanceof SFSGame);
/*    */     }
/* 50 */     return value;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.RoomProxyVariableResolver
 * JD-Core Version:    0.6.0
 */