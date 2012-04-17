/*     */ package com.smartfoxserver.v2.http;
/*     */ 
/*     */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*     */ import java.io.FileInputStream;
/*     */ import java.io.FileNotFoundException;
/*     */ import java.io.InputStream;
/*     */ import org.mortbay.jetty.Connector;
/*     */ import org.mortbay.jetty.Server;
/*     */ import org.mortbay.xml.XmlConfiguration;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSHttpServer
/*     */   implements IHttpServer
/*     */ {
/*     */   private final String name;
/*     */   private final Logger log;
/*     */   private Server jettyServer;
/*  20 */   private boolean initSuccess = false;
/*     */ 
/*     */   public SFSHttpServer()
/*     */   {
/*  24 */     this.log = LoggerFactory.getLogger(getClass());
/*  25 */     this.name = "Jetty Http Server";
/*     */ 
/*  27 */     this.jettyServer = new Server();
/*     */   }
/*     */ 
/*     */   public void setAttribute(String key, Object value)
/*     */   {
/*  33 */     this.jettyServer.setAttribute(key, value);
/*     */   }
/*     */ 
/*     */   public Object getAttribute(String key)
/*     */   {
/*  38 */     return this.jettyServer.getAttribute(key);
/*     */   }
/*     */ 
/*     */   public void init(Object params)
/*     */   {
/*  48 */     String jettyCfgPath = (String)params;
/*  49 */     configureJetty(jettyCfgPath);
/*     */ 
/*  51 */     if (!this.initSuccess)
/*  52 */       this.log.warn("Jetty initialization failed. Please check the logs for further details.");
/*     */   }
/*     */ 
/*     */   public void destroy(Object params)
/*     */   {
/*     */     try
/*     */     {
/*  60 */       this.jettyServer.stop();
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/*  64 */       this.log.error("Failed to stop Jetty server: " + e);
/*     */     }
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/*  71 */     return this.name;
/*     */   }
/*     */ 
/*     */   public void setName(String arg0)
/*     */   {
/*     */   }
/*     */ 
/*     */   public void handleMessage(Object arg0)
/*     */   {
/*  83 */     throw new UnsupportedOperationException("The service does not support this call.");
/*     */   }
/*     */ 
/*     */   public void restart()
/*     */     throws Exception
/*     */   {
/*  93 */     if (this.initSuccess)
/*     */     {
/*  95 */       stop();
/*  96 */       start();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void start()
/*     */     throws Exception
/*     */   {
/* 103 */     if (!this.initSuccess)
/*     */     {
/* 105 */       this.log.info("Http Server cannot be started, initialization failed. Please check the logs for more details.");
/* 106 */       return;
/*     */     }
/*     */ 
/* 109 */     if (!this.jettyServer.isRunning())
/*     */     {
/* 111 */       this.jettyServer.start();
/* 112 */       this.log.info("Http Server started.");
/*     */     }
/*     */     else {
/* 115 */       this.log.warn("HttpServer Start failure: already running.");
/*     */     }
/*     */   }
/*     */ 
/*     */   public void stop() throws Exception
/*     */   {
/* 121 */     if (!this.initSuccess)
/*     */     {
/* 123 */       this.log.info("Http Server cannot be started, initialization failed. Please check the logs for more details.");
/* 124 */       return;
/*     */     }
/*     */ 
/* 127 */     if (this.jettyServer.isRunning())
/*     */     {
/* 129 */       this.jettyServer.stop();
/* 130 */       this.log.info("Http Server stopped.");
/*     */     }
/*     */     else {
/* 133 */       this.log.warn("HttpServer Stop failure: already not running");
/*     */     }
/*     */   }
/*     */ 
/*     */   public Connector getConnector(int index) {
/* 138 */     if (this.jettyServer.isRunning()) {
/* 139 */       return this.jettyServer.getConnectors()[index];
/*     */     }
/* 141 */     return null;
/*     */   }
/*     */ 
/*     */   private void configureJetty(String jettyCfgPath)
/*     */   {
/*     */     try
/*     */     {
/* 152 */       InputStream is = new FileInputStream(jettyCfgPath);
/* 153 */       XmlConfiguration cfg = new XmlConfiguration(is);
/* 154 */       cfg.configure(this.jettyServer);
/*     */ 
/* 156 */       this.initSuccess = true;
/*     */     }
/*     */     catch (FileNotFoundException fnfe)
/*     */     {
/* 160 */       ExceptionMessageComposer emc = new ExceptionMessageComposer(fnfe);
/* 161 */       emc.setDescription("Http Server config was not found: " + jettyCfgPath);
/* 162 */       emc.setPossibleCauses("Maybe the configuration file was moved or removed?");
/*     */ 
/* 164 */       this.log.warn(emc.toString());
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 168 */       e.printStackTrace();
/* 169 */       ExceptionMessageComposer emc = new ExceptionMessageComposer(e);
/* 170 */       emc.setDescription("Unexpected error while configuring the Http Server (config: " + jettyCfgPath + ")");
/* 171 */       emc.setPossibleCauses("Maybe the configuration is corrupted, or there's not enough permissions to read it.");
/*     */ 
/* 173 */       this.log.warn(emc.toString());
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.http.SFSHttpServer
 * JD-Core Version:    0.6.0
 */