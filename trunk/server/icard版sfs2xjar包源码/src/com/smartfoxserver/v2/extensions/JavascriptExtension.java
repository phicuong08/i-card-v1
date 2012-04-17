/*     */ package com.smartfoxserver.v2.extensions;
/*     */ 
/*     */ import com.smartfoxserver.v2.core.ISFSEvent;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorData;
/*     */ import com.smartfoxserver.v2.exceptions.SFSLoginException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import java.io.File;
/*     */ import java.io.IOException;
/*     */ import java.io.StringReader;
/*     */ import org.apache.commons.io.FileUtils;
/*     */ import org.mozilla.javascript.Context;
/*     */ import org.mozilla.javascript.Function;
/*     */ import org.mozilla.javascript.Script;
/*     */ import org.mozilla.javascript.Scriptable;
/*     */ 
/*     */ public final class JavascriptExtension extends BaseSFSExtension
/*     */ {
/*  24 */   private boolean isInited = false;
/*     */   private Scriptable scope;
/*     */   private String scriptSourceCode;
/*     */   private Function fnInit;
/*     */   private Function fnDestroy;
/*     */   private Function fnHandleClientRequest;
/*     */ 
/*     */   public void init()
/*     */   {
/*  35 */     loadScript();
/*  36 */     invokeFunction(this.fnInit, new Object[] { this.sfsApi, this });
/*     */   }
/*     */ 
/*     */   public void destroy()
/*     */   {
/*  42 */     invokeFunction(this.fnDestroy, new Object[0]);
/*     */   }
/*     */ 
/*     */   public void handleClientRequest(String cmdName, User sender, ISFSObject params)
/*     */   {
/*  48 */     invokeFunction(this.fnHandleClientRequest, new Object[] { cmdName, sender, params });
/*     */   }
/*     */ 
/*     */   public void handleServerEvent(ISFSEvent event)
/*     */     throws Exception
/*     */   {
/*     */   }
/*     */ 
/*     */   public void fireLoginException(String message, SFSErrorData data)
/*     */     throws SFSLoginException
/*     */   {
/*  64 */     throw new SFSLoginException(message, data);
/*     */   }
/*     */ 
/*     */   private void loadScript()
/*     */   {
/*     */     try
/*     */     {
/*  74 */       Context cx = Context.enter();
/*  75 */       String sourceFilePath = "extensions/" + getName() + "/" + getExtensionFileName();
/*     */ 
/*  78 */       this.scriptSourceCode = loadSourceCode(sourceFilePath);
/*     */ 
/*  81 */       Script compiledScript = cx.compileReader(
/*  83 */         new StringReader(this.scriptSourceCode), 
/*  84 */         sourceFilePath, 
/*  85 */         1, 
/*  86 */         null);
/*     */ 
/*  92 */       this.scope = cx.initStandardObjects(null);
/*     */ 
/*  95 */       cx.setOptimizationLevel(9);
/*     */ 
/*  98 */       compiledScript.exec(cx, this.scope);
/*     */ 
/* 101 */       this.fnInit = ((Function)this.scope.get("init", this.scope));
/* 102 */       this.fnDestroy = ((Function)this.scope.get("destroy", this.scope));
/* 103 */       this.fnHandleClientRequest = ((Function)this.scope.get("handleClientRequest", this.scope));
/*     */ 
/* 106 */       this.isInited = true;
/*     */     }
/*     */     catch (Exception err)
/*     */     {
/* 110 */       ExceptionMessageComposer msg = new ExceptionMessageComposer(err);
/* 111 */       msg.setDescription("Error while initializing Javascript extension");
/* 112 */       trace(new Object[] { msg.toString(), ExtensionLogLevel.WARN });
/*     */     }
/*     */     finally
/*     */     {
/* 116 */       Context.exit();
/*     */     }
/*     */   }
/*     */ 
/*     */   private String loadSourceCode(String sourceFilePath) throws IOException
/*     */   {
/* 122 */     return FileUtils.readFileToString(new File(sourceFilePath));
/*     */   }
/*     */ 
/*     */   private void invokeFunction(Function fn, Object[] params)
/*     */   {
/* 128 */     if (!this.isInited) {
/* 129 */       throw new SFSRuntimeException("Cannot call extension: " + getName() + " - Extension was not inited correctly, please check the logs.");
/*     */     }
/*     */     try
/*     */     {
/* 133 */       Context cx = Context.enter();
/* 134 */       fn.call(cx, this.scope, this.scope, params);
/* 135 */       Context.exit();
/*     */     }
/*     */     catch (Exception err)
/*     */     {
/* 140 */       ExceptionMessageComposer msg = new ExceptionMessageComposer(err);
/* 141 */       trace(new Object[] { msg.toString(), ExtensionLogLevel.WARN });
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.JavascriptExtension
 * JD-Core Version:    0.6.0
 */