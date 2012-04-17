/*     */ package com.smartfoxserver.v2.extensions;
/*     */ 
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import java.util.List;
/*     */ 
/*     */ public abstract class BaseClientRequestHandler
/*     */   implements IClientRequestHandler
/*     */ {
/*     */   private SFSExtension parentExtension;
/*     */ 
/*     */   public SFSExtension getParentExtension()
/*     */   {
/*  24 */     return this.parentExtension;
/*     */   }
/*     */ 
/*     */   public void setParentExtension(SFSExtension ext)
/*     */   {
/*  33 */     this.parentExtension = ext;
/*     */   }
/*     */ 
/*     */   protected ISFSApi getApi()
/*     */   {
/*  42 */     return this.parentExtension.sfsApi;
/*     */   }
/*     */ 
/*     */   protected void send(String cmdName, ISFSObject params, User recipient)
/*     */   {
/*  54 */     this.parentExtension.send(cmdName, params, recipient);
/*     */   }
/*     */ 
/*     */   protected void send(String cmdName, ISFSObject params, List<User> recipients)
/*     */   {
/*  66 */     this.parentExtension.send(cmdName, params, recipients);
/*     */   }
/*     */ 
/*     */   protected void send(String cmdName, ISFSObject params, User recipient, boolean useUDP)
/*     */   {
/*  79 */     this.parentExtension.send(cmdName, params, recipient, useUDP);
/*     */   }
/*     */ 
/*     */   protected void send(String cmdName, ISFSObject params, List<User> recipients, boolean useUDP)
/*     */   {
/*  92 */     this.parentExtension.send(cmdName, params, recipients, useUDP);
/*     */   }
/*     */ 
/*     */   protected void trace(Object[] args)
/*     */   {
/* 101 */     this.parentExtension.trace(args);
/*     */   }
/*     */ 
/*     */   protected void trace(ExtensionLogLevel level, Object[] args)
/*     */   {
/* 111 */     this.parentExtension.trace(level, args);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.BaseClientRequestHandler
 * JD-Core Version:    0.6.0
 */