/*     */ package com.smartfoxserver.v2.extensions;
/*     */ 
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.exceptions.SFSException;
/*     */ import java.io.File;
/*     */ import java.io.IOException;
/*     */ import java.util.Properties;
/*     */ import org.apache.commons.io.FileUtils;
/*     */ import org.python.core.PyJavaInstance;
/*     */ import org.python.core.PyObject;
/*     */ import org.python.core.PyString;
/*     */ import org.python.util.PythonInterpreter;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public final class PythonExtension extends BaseSFSExtension
/*     */ {
/*     */   public static final String py_path = "./extensions/";
/*     */   private final Logger log;
/*     */   private PythonInterpreter interp;
/*     */   private PyObject fnInit;
/*     */   private PyObject fnDestroy;
/*     */   private PyObject fnHandleClientRequest;
/*     */   private PyObject fnHandleMessage;
/*     */ 
/*     */   public PythonExtension()
/*     */   {
/*  39 */     this.log = LoggerFactory.getLogger(getClass());
/*  40 */     File f = new File("./extensions/");
/*     */ 
/*  43 */     Properties props = new Properties();
/*  44 */     props.setProperty("python.path", f.getAbsolutePath());
/*  45 */     PythonInterpreter.initialize(System.getProperties(), props, new String[0]);
/*     */ 
/*  67 */     this.interp = new PythonInterpreter();
/*     */   }
/*     */ 
/*     */   public void init()
/*     */   {
/*     */     try
/*     */     {
/*  75 */       loadPyScript();
/*  76 */       this.fnInit.__call__();
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/*  80 */       this.log.warn("Failed initializing Python Extension: " + getName() + " -> " + e);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void destroy()
/*     */   {
/*     */     try
/*     */     {
/*  89 */       this.fnDestroy.__call__();
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/*  94 */       this.log.warn("Failed destroying Python Extension: " + getName() + " -> " + e);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void handleClientRequest(String cmdName, User sender, ISFSObject params)
/*     */     throws SFSException
/*     */   {
/*     */     try
/*     */     {
/* 104 */       PyObject[] args = 
/* 105 */         { 
/* 106 */         new PyString(cmdName), 
/* 107 */         new PyJavaInstance(sender), 
/* 108 */         new PyJavaInstance(params) };
/*     */ 
/* 111 */       this.fnHandleClientRequest.__call__(args);
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 116 */       this.log.warn("handleClientRequest error in Python Extension: " + getName() + " -> " + e);
/*     */     }
/*     */   }
/*     */ 
/*     */   public Object handleInternalMessage(String cmdName, Object params)
/*     */   {
/*     */     try
/*     */     {
/* 130 */       PyObject[] args = 
/* 131 */         { 
/* 132 */         new PyString(cmdName), 
/* 133 */         new PyJavaInstance(params) };
/*     */ 
/* 136 */       this.fnHandleMessage.__call__(args);
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 141 */       this.log.warn("handleInternalMessage error in Python Extension: " + getName() + " -> " + e);
/*     */     }
/*     */ 
/* 144 */     return null;
/*     */   }
/*     */ 
/*     */   private void loadPyScript()
/*     */     throws Exception
/*     */   {
/* 151 */     String sourceFilePath = "extensions/" + getName() + "/" + getExtensionFileName();
/* 152 */     String pyScript = loadSourceCode(sourceFilePath);
/*     */ 
/* 155 */     this.interp.exec(pyScript);
/*     */ 
/* 158 */     this.interp.set("_sfsApi", new PyJavaInstance(this.sfsApi));
/* 159 */     this.interp.set("_base", new PyJavaInstance(this));
/* 160 */     this.interp.set("_sfs", SmartFoxServer.getInstance());
/* 161 */     this.interp.set("_sfsGameApi", SmartFoxServer.getInstance().getAPIManager().getGameApi());
/*     */ 
/* 172 */     String fnTraceCode = "def trace(*args):\n\tfrom java.lang import Object\n\tfrom jarray import array\n\t_base.trace(array(args, Object))\n";
/*     */ 
/* 177 */     this.interp.exec(fnTraceCode);
/*     */ 
/* 180 */     this.fnInit = this.interp.get("init");
/* 181 */     this.fnDestroy = this.interp.get("destroy");
/* 182 */     this.fnHandleClientRequest = this.interp.get("handleClientRequest");
/* 183 */     this.fnHandleMessage = this.interp.get("handleMessage");
/*     */   }
/*     */ 
/*     */   private String loadSourceCode(String sourceFilePath) throws IOException
/*     */   {
/* 188 */     return FileUtils.readFileToString(new File(sourceFilePath));
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.PythonExtension
 * JD-Core Version:    0.6.0
 */