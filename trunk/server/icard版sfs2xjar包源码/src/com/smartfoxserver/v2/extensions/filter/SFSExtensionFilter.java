/*    */ package com.smartfoxserver.v2.extensions.filter;
/*    */ 
/*    */ import com.smartfoxserver.v2.extensions.ExtensionLogLevel;
/*    */ import com.smartfoxserver.v2.extensions.SFSExtension;
/*    */ 
/*    */ public abstract class SFSExtensionFilter
/*    */   implements IFilter
/*    */ {
/*    */   private String name;
/*    */   protected SFSExtension parentExtension;
/*    */ 
/*    */   public void init(SFSExtension ext)
/*    */   {
/* 21 */     this.parentExtension = ext;
/*    */   }
/*    */ 
/*    */   public String getName()
/*    */   {
/* 30 */     return this.name;
/*    */   }
/*    */ 
/*    */   public void setName(String name)
/*    */   {
/* 39 */     this.name = name;
/*    */   }
/*    */ 
/*    */   protected void trace(Object[] args)
/*    */   {
/* 49 */     this.parentExtension.trace(args);
/*    */   }
/*    */ 
/*    */   protected void trace(ExtensionLogLevel level, Object[] args)
/*    */   {
/* 59 */     this.parentExtension.trace(level, args);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.filter.SFSExtensionFilter
 * JD-Core Version:    0.6.0
 */