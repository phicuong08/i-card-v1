/*    */ package com.smartfoxserver.v2.entities.match;
/*    */ 
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import java.util.List;
/*    */ 
/*    */ public class UserProxyVariableMatcher
/*    */   implements IProxyVariableResolver
/*    */ {
/*    */   public Object getValue(EntityWithVariables entity, String variableName)
/*    */   {
/* 10 */     Object o = entity.getEntity();
/*    */ 
/* 13 */     if (!(o instanceof User)) {
/* 14 */       return null;
/*    */     }
/* 16 */     User user = (User)o;
/* 17 */     Object value = null;
/*    */ 
/* 19 */     if (variableName.equals("${N}")) {
/* 20 */       value = user.getName();
/*    */     }
/* 22 */     else if (variableName.equals("${ISP}")) {
/* 23 */       value = Boolean.valueOf(user.isPlayer());
/*    */     }
/* 25 */     else if (variableName.equals("${ISS}")) {
/* 26 */       value = Boolean.valueOf(user.isSpectator());
/*    */     }
/* 28 */     else if (variableName.equals("${ISN}")) {
/* 29 */       value = Boolean.valueOf(user.isNpc());
/*    */     }
/* 31 */     else if (variableName.equals("${PRID}")) {
/* 32 */       value = Integer.valueOf(user.getPrivilegeId());
/*    */     }
/* 34 */     else if (variableName.equals("${IAR}")) {
/* 35 */       value = Boolean.valueOf(user.getJoinedRooms().size() == 0);
/*    */     }
/* 37 */     return value;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.UserProxyVariableMatcher
 * JD-Core Version:    0.6.0
 */