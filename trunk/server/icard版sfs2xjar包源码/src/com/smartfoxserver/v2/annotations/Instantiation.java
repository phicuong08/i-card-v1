/*    */ package com.smartfoxserver.v2.annotations;
/*    */ 
/*    */ import java.lang.annotation.Annotation;
/*    */ import java.lang.annotation.Retention;
/*    */ import java.lang.annotation.RetentionPolicy;
/*    */ import java.lang.annotation.Target;
/*    */ 
/*    */ @Retention(RetentionPolicy.RUNTIME)
/*    */ @Target({java.lang.annotation.ElementType.TYPE})
/*    */ public @interface Instantiation
/*    */ {
/*    */   public abstract InstantiationMode value();
/*    */ 
/*    */   public static enum InstantiationMode
/*    */   {
/* 24 */     NEW_INSTANCE, SINGLE_INSTANCE;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.annotations.Instantiation
 * JD-Core Version:    0.6.0
 */