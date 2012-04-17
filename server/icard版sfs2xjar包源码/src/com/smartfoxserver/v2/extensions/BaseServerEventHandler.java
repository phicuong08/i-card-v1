/*     */ package com.smartfoxserver.v2.extensions;
/*     */ 
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import java.util.List;
/*     */ 
/*     */ public abstract class BaseServerEventHandler
/*     */   implements IServerEventHandler
/*     */ {
/*     */   private SFSExtension parentExtension;
/*     */ 
/*     */   public SFSExtension getParentExtension()
/*     */   {
/*  19 */     return this.parentExtension;
/*     */   }
/*     */ 
/*     */   public void setParentExtension(SFSExtension ext)
/*     */   {
/*  28 */     this.parentExtension = ext;
/*     */   }
/*     */ 
/*     */   protected ISFSApi getApi()
/*     */   {
/*  37 */     return this.parentExtension.sfsApi;
/*     */   }
/*     */ 
/*     */   protected void send(String cmdName, ISFSObject params, User recipient)
/*     */   {
/*  49 */     this.parentExtension.send(cmdName, params, recipient);
/*     */   }
/*     */ 
/*     */   protected void send(String cmdName, ISFSObject params, List<User> recipients)
/*     */   {
/*  61 */     this.parentExtension.send(cmdName, params, recipients);
/*     */   }
/*     */ 
/*     */   protected void send(String cmdName, ISFSObject params, User recipient, boolean useUDP)
/*     */   {
/*  74 */     this.parentExtension.send(cmdName, params, recipient, useUDP);
/*     */   }
/*     */ 
/*     */   protected void send(String cmdName, ISFSObject params, List<User> recipients, boolean useUDP)
/*     */   {
/*  87 */     this.parentExtension.send(cmdName, params, recipients, useUDP);
/*     */   }
/*     */ 
/*     */   protected void trace(Object[] args)
/*     */   {
/*  96 */     this.parentExtension.trace(args);
/*     */   }
/*     */ 
/*     */   protected void trace(ExtensionLogLevel level, Object[] args)
/*     */   {
/* 106 */     this.parentExtension.trace(level, args);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.BaseServerEventHandler
 * JD-Core Version:    0.6.0
 */