/*     */ package com.smartfoxserver.v2.extensions;
/*     */ 
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.core.ISFSEvent;
/*     */ import com.smartfoxserver.v2.core.ISFSEventListener;
/*     */ import com.smartfoxserver.v2.core.SFSEventType;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.managers.IExtensionManager;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import com.smartfoxserver.v2.util.monitor.ITraceMonitor;
/*     */ import com.smartfoxserver.v2.util.monitor.TraceMessage;
/*     */ import java.io.FileInputStream;
/*     */ import java.io.IOException;
/*     */ import java.util.List;
/*     */ import java.util.Properties;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public abstract class BaseSFSExtension
/*     */   implements ISFSExtension, ISFSEventListener
/*     */ {
/*     */   private String name;
/*     */   private String fileName;
/*     */   private String configFileName;
/*     */   private ExtensionLevel level;
/*     */   private ExtensionType type;
/*  56 */   private Room parentRoom = null;
/*  57 */   private Zone parentZone = null;
/*     */   private volatile boolean active;
/*     */   private final SmartFoxServer sfs;
/*     */   private Properties configProperties;
/*     */   private ExtensionReloadMode reloadMode;
/*     */   private String currentPath;
/*  73 */   protected volatile int lagSimulationMillis = 0;
/*     */   private final Logger logger;
/*     */   protected final ISFSApi sfsApi;
/*     */ 
/*     */   public BaseSFSExtension()
/*     */   {
/*  84 */     this.logger = LoggerFactory.getLogger("Extensions");
/*  85 */     this.active = true;
/*     */ 
/*  87 */     this.sfs = SmartFoxServer.getInstance();
/*  88 */     this.sfsApi = this.sfs.getAPIManager().getSFSApi();
/*     */   }
/*     */ 
/*     */   public String getCurrentFolder()
/*     */   {
/* 102 */     return this.currentPath;
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/* 111 */     return this.name;
/*     */   }
/*     */ 
/*     */   public void setName(String name)
/*     */   {
/* 120 */     if (this.name != null) {
/* 121 */       throw new SFSRuntimeException("Cannot redefine name of extension: " + toString());
/*     */     }
/* 123 */     this.name = name;
/*     */ 
/* 126 */     this.currentPath = ("extensions/" + name + "/");
/*     */   }
/*     */ 
/*     */   public String getExtensionFileName()
/*     */   {
/* 135 */     return this.fileName;
/*     */   }
/*     */ 
/*     */   public Properties getConfigProperties()
/*     */   {
/* 144 */     return this.configProperties;
/*     */   }
/*     */ 
/*     */   public String getPropertiesFileName()
/*     */   {
/* 153 */     return this.configFileName;
/*     */   }
/*     */ 
/*     */   public void setPropertiesFileName(String fileName)
/*     */     throws IOException
/*     */   {
/* 162 */     if (this.configFileName != null) {
/* 163 */       throw new SFSRuntimeException("Cannot redefine properties file name of an extension: " + toString());
/*     */     }
/* 165 */     boolean isDefault = false;
/*     */ 
/* 168 */     if ((fileName == null) || (fileName.length() == 0) || (fileName.equals("config.properties")))
/*     */     {
/* 170 */       isDefault = true;
/* 171 */       this.configFileName = "config.properties";
/*     */     }
/*     */     else
/*     */     {
/* 175 */       this.configFileName = fileName;
/*     */     }
/* 177 */     String fileToLoad = "extensions/" + this.name + "/" + this.configFileName;
/*     */ 
/* 179 */     if (isDefault)
/* 180 */       loadDefaultConfigFile(fileToLoad);
/*     */     else
/* 182 */       loadCustomConfigFile(fileToLoad);
/*     */   }
/*     */ 
/*     */   public ISFSApi getApi()
/*     */   {
/* 191 */     return this.sfsApi;
/*     */   }
/*     */ 
/*     */   public void handleServerEvent(ISFSEvent event)
/*     */     throws Exception
/*     */   {
/*     */   }
/*     */ 
/*     */   public Object handleInternalMessage(String cmdName, Object params)
/*     */   {
/* 209 */     return null;
/*     */   }
/*     */ 
/*     */   private void loadDefaultConfigFile(String fileName)
/*     */   {
/* 218 */     this.configProperties = new Properties();
/*     */     try
/*     */     {
/* 222 */       this.configProperties.load(new FileInputStream(fileName));
/*     */     }
/*     */     catch (IOException localIOException)
/*     */     {
/*     */     }
/*     */   }
/*     */ 
/*     */   private void loadCustomConfigFile(String fileName)
/*     */     throws IOException
/*     */   {
/* 237 */     this.configProperties = new Properties();
/* 238 */     this.configProperties.load(new FileInputStream(fileName));
/*     */   }
/*     */ 
/*     */   public void setExtensionFileName(String fileName)
/*     */   {
/* 247 */     if (this.fileName != null) {
/* 248 */       throw new SFSRuntimeException("Cannot redefine file name of an extension: " + toString());
/*     */     }
/* 250 */     this.fileName = fileName;
/*     */   }
/*     */ 
/*     */   public Room getParentRoom()
/*     */   {
/* 259 */     return this.parentRoom;
/*     */   }
/*     */ 
/*     */   public void setParentRoom(Room room)
/*     */   {
/* 268 */     if (this.parentRoom != null) {
/* 269 */       throw new SFSRuntimeException("Cannot redefine parent room of extension: " + toString());
/*     */     }
/* 271 */     this.parentRoom = room;
/*     */   }
/*     */ 
/*     */   public Zone getParentZone()
/*     */   {
/* 280 */     return this.parentZone;
/*     */   }
/*     */ 
/*     */   public void setParentZone(Zone zone)
/*     */   {
/* 289 */     if (this.parentZone != null) {
/* 290 */       throw new SFSRuntimeException("Cannot redefine parent zone of extension: " + toString());
/*     */     }
/* 292 */     this.parentZone = zone;
/*     */   }
/*     */ 
/*     */   public void addEventListener(SFSEventType eventType, ISFSEventListener listener)
/*     */   {
/* 301 */     if (this.level == ExtensionLevel.ZONE) {
/* 302 */       this.sfs.getExtensionManager().addZoneEventListener(eventType, listener, this.parentZone);
/*     */     }
/* 304 */     else if (this.level == ExtensionLevel.ROOM)
/* 305 */       this.sfs.getExtensionManager().addRoomEventListener(eventType, listener, this.parentRoom);
/*     */   }
/*     */ 
/*     */   public void removeEventListener(SFSEventType eventType, ISFSEventListener listener)
/*     */   {
/* 315 */     if (this.level == ExtensionLevel.ZONE) {
/* 316 */       this.sfs.getExtensionManager().removeZoneEventListener(eventType, listener, this.parentZone);
/*     */     }
/* 318 */     else if (this.level == ExtensionLevel.ROOM)
/* 319 */       this.sfs.getExtensionManager().removeRoomEventListener(eventType, listener, this.parentRoom);
/*     */   }
/*     */ 
/*     */   public boolean isActive()
/*     */   {
/* 328 */     return this.active;
/*     */   }
/*     */ 
/*     */   public void setActive(boolean flag)
/*     */   {
/* 337 */     this.active = flag;
/*     */   }
/*     */ 
/*     */   public ExtensionLevel getLevel()
/*     */   {
/* 346 */     return this.level;
/*     */   }
/*     */ 
/*     */   public void setLevel(ExtensionLevel level)
/*     */   {
/* 355 */     if (this.level != null) {
/* 356 */       throw new SFSRuntimeException("Cannot change level for extension: " + toString());
/*     */     }
/* 358 */     this.level = level;
/*     */   }
/*     */ 
/*     */   public ExtensionType getType()
/*     */   {
/* 367 */     return this.type;
/*     */   }
/*     */ 
/*     */   public void setType(ExtensionType type)
/*     */   {
/* 376 */     if (this.type != null) {
/* 377 */       throw new SFSRuntimeException("Cannot change type for extension: " + toString());
/*     */     }
/* 379 */     this.type = type;
/*     */   }
/*     */ 
/*     */   public ExtensionReloadMode getReloadMode()
/*     */   {
/* 388 */     return this.reloadMode;
/*     */   }
/*     */ 
/*     */   public void setReloadMode(ExtensionReloadMode mode)
/*     */   {
/* 397 */     if (this.reloadMode != null) {
/* 398 */       throw new SFSRuntimeException("Cannot change reloadMode for extension: " + toString());
/*     */     }
/* 400 */     this.reloadMode = mode;
/*     */   }
/*     */ 
/*     */   public void send(String cmdName, ISFSObject params, List<User> recipients)
/*     */   {
/* 409 */     send(cmdName, params, recipients, false);
/*     */   }
/*     */ 
/*     */   public void send(String cmdName, ISFSObject params, User recipient)
/*     */   {
/* 418 */     send(cmdName, params, recipient, false);
/*     */   }
/*     */ 
/*     */   public void send(String cmdName, ISFSObject params, List<User> recipients, boolean useUDP)
/*     */   {
/* 427 */     checkLagSimulation();
/* 428 */     Room room = this.level == ExtensionLevel.ROOM ? this.parentRoom : null;
/* 429 */     this.sfsApi.sendExtensionResponse(cmdName, params, recipients, room, useUDP);
/*     */   }
/*     */ 
/*     */   public void send(String cmdName, ISFSObject params, User recipient, boolean useUDP)
/*     */   {
/* 435 */     checkLagSimulation();
/* 436 */     Room room = this.level == ExtensionLevel.ROOM ? this.parentRoom : null;
/* 437 */     this.sfsApi.sendExtensionResponse(cmdName, params, recipient, room, useUDP);
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 446 */     return String.format("{ Ext: %s, Type: %s, Lev: %s, %s, %s }", new Object[] { this.name, this.type, this.level, this.parentZone, this.parentRoom == null ? "{}" : this.parentRoom });
/*     */   }
/*     */ 
/*     */   public void trace(Object[] args)
/*     */   {
/* 459 */     trace(ExtensionLogLevel.INFO, args);
/*     */   }
/*     */ 
/*     */   public void trace(ExtensionLogLevel level, Object[] args)
/*     */   {
/* 469 */     String traceMsg = getTraceMessage(args);
/*     */ 
/* 471 */     if (level == ExtensionLogLevel.DEBUG) {
/* 472 */       this.logger.debug(traceMsg);
/*     */     }
/* 474 */     else if (level == ExtensionLogLevel.INFO) {
/* 475 */       this.logger.info(traceMsg);
/*     */     }
/* 477 */     else if (level == ExtensionLogLevel.WARN) {
/* 478 */       this.logger.warn(traceMsg);
/*     */     }
/* 480 */     else if (level == ExtensionLogLevel.ERROR) {
/* 481 */       this.logger.error(traceMsg);
/*     */     }
/* 483 */     this.sfs.getTraceMonitor().handleTraceMessage(new TraceMessage(this.parentZone, this.parentRoom, level, traceMsg));
/*     */   }
/*     */ 
/*     */   private String getTraceMessage(Object[] args)
/*     */   {
/* 488 */     StringBuilder traceMsg = new StringBuilder().append("{").append(this.name).append("}: ");
/*     */ 
/* 490 */     for (Object o : args) {
/* 491 */       traceMsg.append(o.toString()).append(" ");
/*     */     }
/* 493 */     return traceMsg.toString();
/*     */   }
/*     */ 
/*     */   protected void removeEventsForListener(ISFSEventListener listener)
/*     */   {
/* 511 */     if (this.level == ExtensionLevel.ZONE) {
/* 512 */       this.sfs.getExtensionManager().removeListenerFromZone(listener, this.parentZone);
/*     */     }
/* 514 */     else if (this.level == ExtensionLevel.ROOM)
/* 515 */       this.sfs.getExtensionManager().removeListenerFromRoom(listener, this.parentRoom);
/*     */   }
/*     */ 
/*     */   private void checkLagSimulation()
/*     */   {
/* 524 */     if (this.lagSimulationMillis > 0)
/*     */     {
/*     */       try
/*     */       {
/* 528 */         this.logger.debug("Lag simulation, sleeping for: " + this.lagSimulationMillis + "ms.");
/* 529 */         Thread.sleep(this.lagSimulationMillis);
/*     */       }
/*     */       catch (InterruptedException e)
/*     */       {
/* 533 */         this.logger.warn("Interruption during lag simulation: " + e);
/*     */       }
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.BaseSFSExtension
 * JD-Core Version:    0.6.0
 */