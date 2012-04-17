/*    */ package com.smartfoxserver.v2.entities.match;
/*    */ 
/*    */ import com.smartfoxserver.v2.entities.Room;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.variables.UserVariable;
/*    */ import java.util.Collection;
/*    */ 
/*    */ public class EntityWithVariablesWrapper
/*    */   implements EntityWithVariables
/*    */ {
/*    */   private final Object entity;
/*    */ 
/*    */   public EntityWithVariablesWrapper(Object entity)
/*    */   {
/* 19 */     if ((!(entity instanceof Room)) && (!(entity instanceof User))) {
/* 20 */       throw new IllegalArgumentException("Object not supported. Provided entity is not a Room, nor a User!");
/*    */     }
/* 22 */     this.entity = entity;
/*    */   }
/*    */ 
/*    */   public UserVariable getVariable(String varName)
/*    */   {
/* 28 */     if ((this.entity instanceof Room)) {
/* 29 */       return ((Room)this.entity).getVariable(varName);
/*    */     }
/* 31 */     return ((User)this.entity).getVariable(varName);
/*    */   }
/*    */ 
/*    */   public Collection<? extends UserVariable> getVariables()
/*    */   {
/* 37 */     if ((this.entity instanceof Room)) {
/* 38 */       return ((Room)this.entity).getVariables();
/*    */     }
/* 40 */     return ((User)this.entity).getVariables();
/*    */   }
/*    */ 
/*    */   public Object getEntity()
/*    */   {
/* 46 */     return this.entity;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.EntityWithVariablesWrapper
 * JD-Core Version:    0.6.0
 */