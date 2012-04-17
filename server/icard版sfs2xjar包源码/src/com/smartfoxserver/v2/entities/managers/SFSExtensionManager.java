/*      */ package com.smartfoxserver.v2.entities.managers;
/*      */ 
/*      */ import com.smartfoxserver.bitswarm.io.IRequest;
/*      */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*      */ import com.smartfoxserver.v2.SmartFoxServer;
/*      */ import com.smartfoxserver.v2.api.LoginErrorHandler;
/*      */ import com.smartfoxserver.v2.config.ZoneSettings.ExtensionSettings;
/*      */ import com.smartfoxserver.v2.controllers.IControllerCommand;
/*      */ import com.smartfoxserver.v2.core.ISFSEvent;
/*      */ import com.smartfoxserver.v2.core.ISFSEventListener;
/*      */ import com.smartfoxserver.v2.core.ISFSEventManager;
/*      */ import com.smartfoxserver.v2.core.SFSEventParam;
/*      */ import com.smartfoxserver.v2.core.SFSEventSysParam;
/*      */ import com.smartfoxserver.v2.core.SFSEventType;
/*      */ import com.smartfoxserver.v2.core.SFSSystemEvent;
/*      */ import com.smartfoxserver.v2.entities.Room;
/*      */ import com.smartfoxserver.v2.entities.User;
/*      */ import com.smartfoxserver.v2.entities.Zone;
/*      */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*      */ import com.smartfoxserver.v2.exceptions.SFSExtensionException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSLoginException;
/*      */ import com.smartfoxserver.v2.extensions.ExtensionLevel;
/*      */ import com.smartfoxserver.v2.extensions.ExtensionReloadMode;
/*      */ import com.smartfoxserver.v2.extensions.ExtensionType;
/*      */ import com.smartfoxserver.v2.extensions.ISFSExtension;
/*      */ import com.smartfoxserver.v2.extensions.JavascriptExtension;
/*      */ import com.smartfoxserver.v2.extensions.PythonExtension;
/*      */ import it.gotoandplay.util.launcher.BootException;
/*      */ import it.gotoandplay.util.launcher.IClassLoader;
/*      */ import it.gotoandplay.util.launcher.JarLoader;
/*      */ import java.io.File;
/*      */ import java.io.IOException;
/*      */ import java.util.ArrayList;
/*      */ import java.util.Collection;
/*      */ import java.util.List;
/*      */ import java.util.Map;
/*      */ import java.util.Set;
/*      */ import java.util.concurrent.ConcurrentHashMap;
/*      */ import java.util.concurrent.ConcurrentMap;
/*      */ import java.util.concurrent.CopyOnWriteArraySet;
/*      */ import org.apache.commons.vfs.FileChangeEvent;
/*      */ import org.apache.commons.vfs.FileListener;
/*      */ import org.apache.commons.vfs.FileName;
/*      */ import org.apache.commons.vfs.FileObject;
/*      */ import org.apache.commons.vfs.FileSystemException;
/*      */ import org.apache.commons.vfs.FileSystemManager;
/*      */ import org.apache.commons.vfs.VFS;
/*      */ import org.apache.commons.vfs.impl.DefaultFileMonitor;
/*      */ import org.mozilla.javascript.WrappedException;
/*      */ import org.slf4j.Logger;
/*      */ import org.slf4j.LoggerFactory;
/*      */ 
/*      */ public final class SFSExtensionManager
/*      */   implements IExtensionManager, ISFSEventListener
/*      */ {
/*      */   private static final String JAR_EXTENSION = "jar";
/*      */   private static final String JS_EXTENSION = "js";
/*      */   private static final String PY_EXTENSION = "py";
/*      */   private final ConcurrentMap<Zone, ISFSExtension> extensionsByZone;
/*      */   private final ConcurrentMap<Room, ISFSExtension> extensionsByRoom;
/*      */   private final Map<Room, Map<SFSEventType, Set<ISFSEventListener>>> listenersByRoom;
/*      */   private final Map<Zone, Map<SFSEventType, Set<ISFSEventListener>>> listenersByZone;
/*      */   private final Logger logger;
/*      */   private SmartFoxServer sfs;
/*      */   private final IClassLoader jarLoader;
/*      */   private final LoginErrorHandler loginErrorHandler;
/*      */   private FileSystemManager fsManager;
/*      */   private DefaultFileMonitor extensionFileMonitor;
/*      */   private FileListener extensionFileListener;
/*      */   private ISFSEventManager eventManager;
/*   80 */   private boolean vfsFailed = false;
/*   81 */   private volatile boolean extMonitorActive = false;
/*      */ 
/*      */   public SFSExtensionManager()
/*      */   {
/*  131 */     this.logger = LoggerFactory.getLogger(getClass());
/*  132 */     this.jarLoader = new JarLoader();
/*      */ 
/*  134 */     this.extensionsByZone = new ConcurrentHashMap();
/*  135 */     this.extensionsByRoom = new ConcurrentHashMap();
/*      */ 
/*  137 */     this.listenersByRoom = new ConcurrentHashMap();
/*  138 */     this.listenersByZone = new ConcurrentHashMap();
/*      */ 
/*  140 */     this.loginErrorHandler = new LoginErrorHandler();
/*      */   }
/*      */ 
/*      */   public boolean isExtensionMonitorActive()
/*      */   {
/*  146 */     return this.extMonitorActive;
/*      */   }
/*      */ 
/*      */   public void setExtensionMonitorActive(boolean flag)
/*      */   {
/*  153 */     if ((this.vfsFailed) && (flag))
/*      */     {
/*  155 */       this.logger.warn("Cannot activate Extension files monitoring services. Initialization failed at server boot. Check your logs.");
/*  156 */       return;
/*      */     }
/*      */ 
/*  159 */     this.extMonitorActive = flag;
/*      */ 
/*  161 */     if (this.extMonitorActive)
/*      */     {
/*  163 */       this.extensionFileMonitor.start();
/*  164 */       this.logger.debug("Extension File Monitor started");
/*      */     }
/*      */     else
/*      */     {
/*  168 */       this.extensionFileMonitor.stop();
/*  169 */       this.logger.debug("Extension File Monitor stopped");
/*      */     }
/*      */   }
/*      */ 
/*      */   public synchronized void activateAllExtensions()
/*      */   {
/*  176 */     for (ISFSExtension extension : this.extensionsByRoom.values()) {
/*  177 */       extension.setActive(true);
/*      */     }
/*  179 */     for (ISFSExtension extension : this.extensionsByZone.values())
/*  180 */       extension.setActive(true);
/*      */   }
/*      */ 
/*      */   public void addExtension(ISFSExtension extension)
/*      */   {
/*  191 */     if (extension.getLevel() == ExtensionLevel.ZONE) {
/*  192 */       this.extensionsByZone.put(extension.getParentZone(), extension);
/*      */     }
/*  194 */     else if (extension.getLevel() == ExtensionLevel.ROOM)
/*  195 */       this.extensionsByRoom.put(extension.getParentRoom(), extension);
/*      */   }
/*      */ 
/*      */   public ISFSExtension getRoomExtension(Room room)
/*      */   {
/*  201 */     return (ISFSExtension)this.extensionsByRoom.get(room);
/*      */   }
/*      */ 
/*      */   public ISFSExtension getZoneExtension(Zone zone)
/*      */   {
/*  207 */     return (ISFSExtension)this.extensionsByZone.get(zone);
/*      */   }
/*      */ 
/*      */   private List<ISFSExtension> findZoneExtensionByName(String extName)
/*      */   {
/*  215 */     List extensions = new ArrayList();
/*      */ 
/*  217 */     for (ISFSExtension ext : this.extensionsByZone.values())
/*      */     {
/*  219 */       if (extName.equals(ext.getName())) {
/*  220 */         extensions.add(ext);
/*      */       }
/*      */     }
/*  223 */     return extensions;
/*      */   }
/*      */ 
/*      */   public void createExtension(ZoneSettings.ExtensionSettings settings, ExtensionLevel level, Zone parentZone, Room parentRoom)
/*      */     throws SFSExtensionException
/*      */   {
/*  233 */     if ((settings.file == null) || (settings.file.length() == 0)) {
/*  234 */       throw new SFSExtensionException("Extension file parameter is missing!");
/*      */     }
/*      */ 
/*  237 */     if ((settings.name == null) || (settings.name.length() == 0)) {
/*  238 */       throw new SFSExtensionException("Extension name parameter is missing!");
/*      */     }
/*      */ 
/*  241 */     if (settings.type == null) {
/*  242 */       throw new SFSExtensionException("Extension type was not specified: " + settings.name);
/*      */     }
/*      */ 
/*  245 */     if (settings.reloadMode == null) {
/*  246 */       settings.reloadMode = "";
/*      */     }
/*      */ 
/*  249 */     ExtensionReloadMode reloadMode = ExtensionReloadMode.valueOf(settings.reloadMode.toUpperCase());
/*      */ 
/*  252 */     if (reloadMode == null) {
/*  253 */       reloadMode = ExtensionReloadMode.MANUAL;
/*      */     }
/*  255 */     ExtensionType extensionType = ExtensionType.valueOf(settings.type.toUpperCase());
/*      */     ISFSExtension extension;
/*  258 */     if (extensionType == ExtensionType.JAVA) {
/*  259 */       extension = createJavaExtension(settings);
/*      */     }
/*      */     else
/*      */     {
/*      */       ISFSExtension extension;
/*  261 */       if (extensionType == ExtensionType.JAVASCRIPT) {
/*  262 */         extension = createJSExtension(settings);
/*      */       }
/*      */       else
/*      */       {
/*      */         ISFSExtension extension;
/*  264 */         if (extensionType == ExtensionType.PYTHON) {
/*  265 */           extension = createPYExtension(settings);
/*      */         }
/*      */         else
/*  268 */           throw new SFSExtensionException("Extension type not supported: " + extensionType);
/*      */       }
/*      */     }
/*      */     ISFSExtension extension;
/*  271 */     extension.setLevel(level);
/*  272 */     extension.setName(settings.name);
/*  273 */     extension.setExtensionFileName(settings.file);
/*  274 */     extension.setReloadMode(reloadMode);
/*  275 */     extension.setParentZone(parentZone);
/*  276 */     extension.setParentRoom(parentRoom);
/*      */     try
/*      */     {
/*  285 */       if (settings.propertiesFile != null)
/*      */       {
/*  287 */         if ((settings.propertiesFile.startsWith("../")) || (settings.propertiesFile.startsWith("/"))) {
/*  288 */           throw new SFSExtensionException("Illegal path for Extension property file. File path outside the extensions/ folder is not valid: " + settings.propertiesFile);
/*      */         }
/*      */       }
/*  291 */       extension.setPropertiesFileName(settings.propertiesFile);
/*      */     }
/*      */     catch (IOException e)
/*      */     {
/*  295 */       throw new SFSExtensionException("Unable to load extension properties file: " + settings.propertiesFile);
/*      */     }
/*      */ 
/*      */     try
/*      */     {
/*  302 */       extension.init();
/*      */ 
/*  305 */       addExtension(extension);
/*      */ 
/*  308 */       if (parentRoom != null) {
/*  309 */         parentRoom.setExtension(extension);
/*      */       }
/*      */       else
/*  312 */         parentZone.setExtension(extension);
/*      */     }
/*      */     catch (Exception err)
/*      */     {
/*  316 */       ExceptionMessageComposer msg = new ExceptionMessageComposer(err);
/*  317 */       msg.setDescription("Extension initialization failed.");
/*  318 */       this.logger.error(msg.toString());
/*      */     }
/*      */   }
/*      */ 
/*      */   private ISFSExtension createJavaExtension(ZoneSettings.ExtensionSettings settings)
/*      */     throws SFSExtensionException
/*      */   {
/*      */     try
/*      */     {
/*  328 */       String extensionPath = "extensions/" + settings.name;
/*      */ 
/*  331 */       ClassLoader extensionClassLoader = this.jarLoader.loadClasses(new String[] { extensionPath }, getClass().getClassLoader());
/*      */ 
/*  334 */       Class extensionClass = extensionClassLoader.loadClass(settings.file);
/*      */ 
/*  337 */       if (!ISFSExtension.class.isAssignableFrom(extensionClass)) {
/*  338 */         throw new SFSExtensionException("Extension does not implement ISFSExtension interface: " + settings.name);
/*      */       }
/*  340 */       ISFSExtension extension = (ISFSExtension)extensionClass.newInstance();
/*  341 */       extension.setType(ExtensionType.JAVA);
/*      */     }
/*      */     catch (BootException e)
/*      */     {
/*  345 */       throw new SFSExtensionException("Extension boot error. " + e.getMessage());
/*      */     }
/*      */     catch (IllegalAccessException e)
/*      */     {
/*  349 */       throw new SFSExtensionException("Illegal access while instantiating class: " + settings.file);
/*      */     }
/*      */     catch (InstantiationException e)
/*      */     {
/*  353 */       throw new SFSExtensionException("Cannot instantiate class: " + settings.file);
/*      */     }
/*      */     catch (ClassNotFoundException e)
/*      */     {
/*  357 */       throw new SFSExtensionException("Class not found: " + settings.file);
/*      */     }
/*      */     ISFSExtension extension;
/*  360 */     return extension;
/*      */   }
/*      */ 
/*      */   private ISFSExtension createJSExtension(ZoneSettings.ExtensionSettings settings)
/*      */   {
/*  368 */     ISFSExtension extension = new JavascriptExtension();
/*  369 */     extension.setType(ExtensionType.JAVASCRIPT);
/*      */ 
/*  371 */     return extension;
/*      */   }
/*      */ 
/*      */   private ISFSExtension createPYExtension(ZoneSettings.ExtensionSettings settings)
/*      */   {
/*  376 */     ISFSExtension extension = new PythonExtension();
/*  377 */     extension.setType(ExtensionType.PYTHON);
/*      */ 
/*  379 */     return extension;
/*      */   }
/*      */ 
/*      */   public synchronized void deactivateAllExtensions()
/*      */   {
/*  385 */     for (ISFSExtension extension : this.extensionsByRoom.values()) {
/*  386 */       extension.setActive(false);
/*      */     }
/*  388 */     for (ISFSExtension extension : this.extensionsByZone.values())
/*  389 */       extension.setActive(false);
/*      */   }
/*      */ 
/*      */   public void destroyExtension(ISFSExtension extension)
/*      */   {
/*      */     try
/*      */     {
/*  397 */       extension.destroy();
/*      */     }
/*      */     finally
/*      */     {
/*  403 */       if (extension.getLevel() == ExtensionLevel.ROOM)
/*  404 */         this.extensionsByRoom.remove(extension.getParentRoom());
/*      */       else {
/*  406 */         this.extensionsByZone.remove(extension.getParentZone());
/*      */       }
/*  408 */       this.logger.debug("Removed: " + extension);
/*      */     }
/*      */   }
/*      */ 
/*      */   public List<ISFSExtension> getExtensions()
/*      */   {
/*  415 */     List allOfThem = new ArrayList(this.extensionsByRoom.values());
/*  416 */     allOfThem.addAll(this.extensionsByZone.values());
/*      */ 
/*  418 */     return allOfThem;
/*      */   }
/*      */ 
/*      */   public int getExtensionsCount()
/*      */   {
/*  424 */     return this.extensionsByRoom.size() + this.extensionsByZone.size();
/*      */   }
/*      */ 
/*      */   public void init()
/*      */   {
/*  430 */     this.sfs = SmartFoxServer.getInstance();
/*  431 */     this.eventManager = this.sfs.getEventManager();
/*      */ 
/*  433 */     initializeExtensionFileMonitoring();
/*      */ 
/*  436 */     for (SFSEventType type : SFSEventType.values()) {
/*  437 */       this.eventManager.addEventListener(type, this);
/*      */     }
/*  439 */     this.logger.debug("Extension Manager started.");
/*      */   }
/*      */ 
/*      */   public void destroy()
/*      */   {
/*  446 */     for (SFSEventType type : SFSEventType.values()) {
/*  447 */       this.eventManager.removeEventListener(type, this);
/*      */     }
/*      */ 
/*  450 */     this.listenersByRoom.clear();
/*  451 */     this.listenersByZone.clear();
/*      */ 
/*  454 */     for (ISFSExtension extension : this.extensionsByRoom.values()) {
/*  455 */       extension.destroy();
/*      */     }
/*  457 */     for (ISFSExtension extension : this.extensionsByZone.values()) {
/*  458 */       extension.destroy();
/*      */     }
/*  460 */     this.extensionsByRoom.clear();
/*  461 */     this.extensionsByZone.clear();
/*      */ 
/*  463 */     this.logger.debug("Extension Manager stopped.");
/*      */   }
/*      */ 
/*      */   private void initializeExtensionFileMonitoring()
/*      */   {
/*      */     try
/*      */     {
/*  471 */       this.fsManager = VFS.getManager();
/*      */ 
/*  474 */       File extFolder = new File("extensions/");
/*  475 */       FileObject directoryToWatch = this.fsManager.resolveFile(extFolder.getAbsolutePath());
/*      */ 
/*  478 */       this.extensionFileListener = new ExtensionFileChangeListener(null);
/*      */ 
/*  481 */       this.extensionFileMonitor = new DefaultFileMonitor(this.extensionFileListener);
/*  482 */       this.extensionFileMonitor.setRecursive(true);
/*  483 */       this.extensionFileMonitor.addFile(directoryToWatch);
/*      */     }
/*      */     catch (FileSystemException e)
/*      */     {
/*  488 */       e.printStackTrace();
/*  489 */       this.vfsFailed = true;
/*      */ 
/*  491 */       ExceptionMessageComposer composer = new ExceptionMessageComposer(e);
/*  492 */       composer.setDescription("Failed activating extension file monitoring services.");
/*  493 */       composer.setPossibleCauses("You might need to adjust the permissions for the extensions folder");
/*      */ 
/*  495 */       this.logger.warn(composer.toString());
/*      */     }
/*      */   }
/*      */ 
/*      */   public void reloadExtension(ISFSExtension extension)
/*      */   {
/*  502 */     this.logger.info("Reloading extension: " + extension);
/*      */ 
/*  504 */     ZoneSettings.ExtensionSettings newSettings = new ZoneSettings.ExtensionSettings();
/*  505 */     newSettings.file = extension.getExtensionFileName();
/*  506 */     newSettings.name = extension.getName();
/*  507 */     newSettings.propertiesFile = extension.getPropertiesFileName();
/*  508 */     newSettings.reloadMode = extension.getReloadMode().toString();
/*  509 */     newSettings.type = extension.getType().toString();
/*      */     try
/*      */     {
/*  529 */       createExtension(
/*  531 */         newSettings, 
/*  532 */         ExtensionLevel.ZONE, 
/*  533 */         extension.getParentZone(), 
/*  534 */         extension.getParentRoom());
/*      */ 
/*  542 */       extension.destroy();
/*      */     }
/*      */     catch (Throwable t)
/*      */     {
/*  550 */       ExceptionMessageComposer composer = new ExceptionMessageComposer(t);
/*  551 */       composer.setDescription("An error occurred while reloading extension: " + extension.getName() + " in " + extension.getParentZone());
/*  552 */       composer.addInfo("The new extension might not function properly.");
/*      */ 
/*  554 */       this.logger.error(composer.toString());
/*      */     }
/*      */   }
/*      */ 
/*      */   public void reloadRoomExtension(String extName, Room room)
/*      */   {
/*  561 */     throw new UnsupportedOperationException("Sorry, this feature is not implemented yet.");
/*      */   }
/*      */ 
/*      */   public void reloadZoneExtension(String extName, Zone zone)
/*      */   {
/*  569 */     ISFSExtension extension = (ISFSExtension)this.extensionsByZone.get(zone);
/*      */ 
/*  571 */     if (extension != null) {
/*  572 */       reloadExtension(extension);
/*      */     }
/*      */     else
/*  575 */       this.logger.warn(
/*  577 */         String.format("Could not find extension to reload: %s, %s", new Object[] { extName, zone }));
/*      */   }
/*      */ 
/*      */   public synchronized void addZoneEventListener(SFSEventType type, ISFSEventListener listener, Zone zone)
/*      */   {
/*  585 */     Map listenersByType = (Map)this.listenersByZone.get(zone);
/*      */ 
/*  588 */     if (listenersByType == null)
/*      */     {
/*  590 */       listenersByType = new ConcurrentHashMap();
/*  591 */       this.listenersByZone.put(zone, listenersByType);
/*      */     }
/*      */ 
/*  594 */     Set listeners = (Set)listenersByType.get(type);
/*      */ 
/*  597 */     if (listeners == null)
/*      */     {
/*  599 */       listeners = new CopyOnWriteArraySet();
/*  600 */       listenersByType.put(type, listeners);
/*      */     }
/*      */ 
/*  603 */     listeners.add(listener);
/*      */   }
/*      */ 
/*      */   public synchronized void addRoomEventListener(SFSEventType type, ISFSEventListener listener, Room room)
/*      */   {
/*  609 */     Map listenersByType = (Map)this.listenersByRoom.get(room);
/*      */ 
/*  612 */     if (listenersByType == null)
/*      */     {
/*  614 */       listenersByType = new ConcurrentHashMap();
/*  615 */       this.listenersByRoom.put(room, listenersByType);
/*      */     }
/*      */ 
/*  618 */     Set listeners = (Set)listenersByType.get(type);
/*      */ 
/*  620 */     if (listeners == null)
/*      */     {
/*  622 */       listeners = new CopyOnWriteArraySet();
/*  623 */       listenersByType.put(type, listeners);
/*      */     }
/*      */ 
/*  626 */     listeners.add(listener);
/*      */   }
/*      */ 
/*      */   public void dispatchEvent(ISFSEvent event, ExtensionLevel level)
/*      */   {
/*  632 */     if (level == ExtensionLevel.GLOBAL) {
/*  633 */       dispatchGlobalEvent(event);
/*      */     }
/*  635 */     else if (level == ExtensionLevel.ZONE) {
/*  636 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  638 */     else if (level == ExtensionLevel.ROOM)
/*  639 */       dispatchRoomLevelEvent(event);
/*      */   }
/*      */ 
/*      */   private void dispatchGlobalEvent(ISFSEvent event)
/*      */   {
/*  646 */     List allListeners = new ArrayList();
/*  647 */     SFSEventType type = event.getType();
/*      */ 
/*  650 */     for (Map zoneListeners : this.listenersByZone.values())
/*      */     {
/*  652 */       Set listeners = (Set)zoneListeners.get(type);
/*  653 */       if (listeners != null) {
/*  654 */         allListeners.addAll(listeners);
/*      */       }
/*      */     }
/*      */ 
/*  658 */     for (Map roomListeners : this.listenersByRoom.values())
/*      */     {
/*  660 */       Set listeners = (Set)roomListeners.get(type);
/*  661 */       if (listeners != null) {
/*  662 */         allListeners.addAll(listeners);
/*      */       }
/*      */     }
/*  665 */     dispatchEvent(event, allListeners);
/*      */   }
/*      */ 
/*      */   private void dispatchZoneLevelEvent(ISFSEvent event)
/*      */   {
/*  671 */     Zone zone = (Zone)event.getParameter(SFSEventParam.ZONE);
/*      */ 
/*  673 */     if (zone != null)
/*      */     {
/*  675 */       Map listenersByType = (Map)this.listenersByZone.get(zone);
/*      */ 
/*  677 */       if (listenersByType != null)
/*      */       {
/*  684 */         Set listeners = (Set)listenersByType.get(event.getType());
/*  685 */         dispatchEvent(event, listeners);
/*      */       }
/*      */     }
/*      */     else
/*      */     {
/*  690 */       this.logger.info("Zone Event was not dispatched. ZONE param is null: " + event);
/*      */     }
/*      */   }
/*      */ 
/*      */   private void dispatchRoomLevelEvent(ISFSEvent event)
/*      */   {
/*  697 */     Room room = (Room)event.getParameter(SFSEventParam.ROOM);
/*      */ 
/*  699 */     if (room != null)
/*      */     {
/*  701 */       Map listenersByType = (Map)this.listenersByRoom.get(room);
/*      */ 
/*  703 */       if (listenersByType != null)
/*      */       {
/*  708 */         Set listeners = (Set)listenersByType.get(event.getType());
/*  709 */         dispatchEvent(event, listeners);
/*      */       }
/*      */     }
/*      */     else
/*      */     {
/*  714 */       this.logger.info("Room Event was not dispatched. ROOM param is null: " + event);
/*      */     }
/*      */   }
/*      */ 
/*      */   private void dispatchRoomLevelEvent(ISFSEvent event, List<Room> roomList)
/*      */   {
/*  723 */     if (roomList != null)
/*      */     {
/*  725 */       for (Room room : roomList)
/*      */       {
/*  727 */         Map listenersByType = (Map)this.listenersByRoom.get(room);
/*      */ 
/*  729 */         if (listenersByType == null)
/*      */           continue;
/*  731 */         Set listeners = (Set)listenersByType.get(event.getType());
/*  732 */         dispatchEvent(event, listeners);
/*      */       }
/*      */ 
/*      */     }
/*      */     else
/*      */     {
/*  738 */       this.logger.info("Multi Room Event was not dispatched. RoomList param is null: " + event);
/*      */     }
/*      */   }
/*      */ 
/*      */   private void dispatchEvent(ISFSEvent event, Collection<ISFSEventListener> listeners)
/*      */   {
/*  749 */     if ((listeners != null) && (listeners.size() > 0))
/*      */     {
/*  751 */       for (ISFSEventListener listener : listeners)
/*      */       {
/*      */         try
/*      */         {
/*  760 */           listener.handleServerEvent(event);
/*      */ 
/*  766 */           if (!(event instanceof SFSSystemEvent))
/*      */             continue;
/*  768 */           executeEventCommand((SFSSystemEvent)event);
/*      */         }
/*      */         catch (WrappedException jsWrappedException)
/*      */         {
/*  777 */           Throwable t = jsWrappedException.getWrappedException();
/*      */ 
/*  779 */           if ((t instanceof SFSLoginException))
/*  780 */             handleLoginException((SFSSystemEvent)event, (SFSLoginException)t);
/*      */           else {
/*  782 */             throw jsWrappedException;
/*      */           }
/*      */ 
/*      */         }
/*      */         catch (SFSLoginException logErr)
/*      */         {
/*  790 */           handleLoginException((SFSSystemEvent)event, logErr);
/*      */         }
/*      */         catch (Exception e)
/*      */         {
/*  798 */           ExceptionMessageComposer composer = new ExceptionMessageComposer(e);
/*  799 */           composer.setDescription("Error during event handling: " + e + ", Listener: " + listener);
/*      */ 
/*  801 */           this.logger.warn(composer.toString());
/*      */         }
/*      */       }
/*      */     }
/*      */   }
/*      */ 
/*      */   public void removeListenerFromZone(ISFSEventListener listener, Zone zone)
/*      */   {
/*  814 */     Map listenersByType = (Map)this.listenersByZone.get(zone);
/*      */ 
/*  816 */     if (listenersByType != null)
/*      */     {
/*  818 */       for (Set listenersByEvent : listenersByType.values())
/*      */       {
/*  820 */         listenersByEvent.remove(listener);
/*      */       }
/*      */     }
/*      */   }
/*      */ 
/*      */   public void removeListenerFromRoom(ISFSEventListener listener, Room room)
/*      */   {
/*  830 */     Map listenersByType = (Map)this.listenersByRoom.get(room);
/*      */ 
/*  832 */     if (listenersByType != null)
/*      */     {
/*  835 */       this.listenersByRoom.remove(room);
/*      */ 
/*  837 */       for (Set listenersByEvent : listenersByType.values())
/*      */       {
/*  839 */         listenersByEvent.remove(listener);
/*      */       }
/*      */     }
/*      */   }
/*      */ 
/*      */   public void removeZoneEventListener(SFSEventType type, ISFSEventListener listener, Zone zone)
/*      */   {
/*  847 */     removeEventListener((Map)this.listenersByZone.get(zone), type, listener);
/*      */   }
/*      */ 
/*      */   public void removeRoomEventListener(SFSEventType type, ISFSEventListener listener, Room room)
/*      */   {
/*  853 */     removeEventListener((Map)this.listenersByRoom.get(room), type, listener);
/*      */   }
/*      */ 
/*      */   private void removeEventListener(Map<SFSEventType, Set<ISFSEventListener>> listenersByType, SFSEventType type, ISFSEventListener listener)
/*      */   {
/*  858 */     if (listenersByType != null)
/*      */     {
/*  860 */       Set listeners = (Set)listenersByType.get(type);
/*  861 */       if (listeners != null)
/*  862 */         listeners.remove(listener);
/*      */     }
/*      */   }
/*      */ 
/*      */   public void handleServerEvent(ISFSEvent event)
/*      */   {
/*  872 */     SFSEventType type = event.getType();
/*      */ 
/*  874 */     if (type == SFSEventType.SERVER_READY) {
/*  875 */       dispatchEvent(event, ExtensionLevel.GLOBAL);
/*      */     }
/*  877 */     else if (type == SFSEventType.USER_LOGIN) {
/*  878 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  880 */     else if (type == SFSEventType.USER_JOIN_ZONE) {
/*  881 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  883 */     else if (type == SFSEventType.USER_LOGOUT) {
/*  884 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  886 */     else if (type == SFSEventType.USER_JOIN_ROOM)
/*      */     {
/*  888 */       dispatchZoneLevelEvent(event);
/*  889 */       dispatchRoomLevelEvent(event);
/*      */     }
/*  892 */     else if (type == SFSEventType.USER_LEAVE_ROOM)
/*      */     {
/*  894 */       dispatchZoneLevelEvent(event);
/*  895 */       dispatchRoomLevelEvent(event);
/*      */     }
/*  898 */     else if (type == SFSEventType.ROOM_ADDED) {
/*  899 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  901 */     else if (type == SFSEventType.ROOM_REMOVED)
/*      */     {
/*  904 */       Room theRoom = (Room)event.getParameter(SFSEventParam.ROOM);
/*  905 */       this.extensionsByRoom.remove(theRoom);
/*      */ 
/*  907 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  910 */     else if (type == SFSEventType.USER_DISCONNECT)
/*      */     {
/*  912 */       dispatchZoneLevelEvent(event);
/*      */ 
/*  915 */       dispatchRoomLevelEvent(event, (List)event.getParameter(SFSEventParam.JOINED_ROOMS));
/*      */     }
/*  918 */     else if (type == SFSEventType.USER_RECONNECTION_TRY)
/*      */     {
/*  920 */       dispatchZoneLevelEvent(event);
/*      */ 
/*  923 */       User user = (User)event.getParameter(SFSEventParam.USER);
/*  924 */       dispatchRoomLevelEvent(event, user.getJoinedRooms());
/*      */     }
/*  927 */     else if (type == SFSEventType.USER_RECONNECTION_SUCCESS)
/*      */     {
/*  929 */       dispatchZoneLevelEvent(event);
/*      */ 
/*  932 */       User user = (User)event.getParameter(SFSEventParam.USER);
/*  933 */       dispatchRoomLevelEvent(event, user.getJoinedRooms());
/*      */     }
/*  936 */     else if (type == SFSEventType.PUBLIC_MESSAGE)
/*      */     {
/*  938 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  941 */     else if (type == SFSEventType.PRIVATE_MESSAGE)
/*      */     {
/*  943 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  946 */     else if (type == SFSEventType.ROOM_VARIABLES_UPDATE)
/*      */     {
/*  948 */       dispatchZoneLevelEvent(event);
/*  949 */       dispatchRoomLevelEvent(event);
/*      */     }
/*  952 */     else if (type == SFSEventType.USER_VARIABLES_UPDATE) {
/*  953 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  955 */     else if (type == SFSEventType.SPECTATOR_TO_PLAYER)
/*      */     {
/*  957 */       dispatchZoneLevelEvent(event);
/*  958 */       dispatchRoomLevelEvent(event);
/*      */     }
/*  961 */     else if (type == SFSEventType.PLAYER_TO_SPECTATOR)
/*      */     {
/*  963 */       dispatchZoneLevelEvent(event);
/*  964 */       dispatchRoomLevelEvent(event);
/*      */     }
/*  967 */     else if (type == SFSEventType.BUDDY_ADD) {
/*  968 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  970 */     else if (type == SFSEventType.BUDDY_BLOCK) {
/*  971 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  973 */     else if (type == SFSEventType.BUDDY_LIST_INIT) {
/*  974 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  976 */     else if (type == SFSEventType.BUDDY_MESSAGE) {
/*  977 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  979 */     else if (type == SFSEventType.BUDDY_ONLINE_STATE_UPDATE) {
/*  980 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  982 */     else if (type == SFSEventType.BUDDY_REMOVE) {
/*  983 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  985 */     else if (type == SFSEventType.BUDDY_VARIABLES_UPDATE) {
/*  986 */       dispatchZoneLevelEvent(event);
/*      */     }
/*  988 */     else if (type == SFSEventType.GAME_INVITATION_SUCCESS)
/*      */     {
/*  990 */       dispatchZoneLevelEvent(event);
/*  991 */       dispatchRoomLevelEvent(event);
/*      */     }
/*  993 */     else if (type == SFSEventType.GAME_INVITATION_FAILURE)
/*      */     {
/*  995 */       dispatchZoneLevelEvent(event);
/*  996 */       dispatchRoomLevelEvent(event);
/*      */     }
/*  998 */     else if (type == SFSEventType.__TRACE_MESSAGE)
/*      */     {
/* 1000 */       dispatchZoneLevelEvent(event);
/*      */     }
/*      */   }
/*      */ 
/*      */   private void executeEventCommand(SFSSystemEvent sysEvent) throws Exception
/*      */   {
/* 1006 */     Class commandClass = (Class)sysEvent.getSysParameter(SFSEventSysParam.NEXT_COMMAND);
/* 1007 */     IRequest request = (IRequest)sysEvent.getSysParameter(SFSEventSysParam.REQUEST_OBJ);
/*      */ 
/* 1009 */     if ((commandClass != null) && (request != null))
/*      */     {
/* 1011 */       IControllerCommand command = (IControllerCommand)commandClass.newInstance();
/* 1012 */       command.execute(request);
/*      */     }
/*      */   }
/*      */ 
/*      */   private void handleLoginException(SFSSystemEvent event, SFSLoginException err)
/*      */   {
/* 1018 */     this.logger.warn(err.toString());
/* 1019 */     ISession sender = ((IRequest)event.getSysParameter(SFSEventSysParam.REQUEST_OBJ)).getSender();
/* 1020 */     this.loginErrorHandler.execute(sender, err);
/*      */   }
/*      */ 
/*      */   private final class ExtensionFileChangeListener
/*      */     implements FileListener
/*      */   {
/*      */     private ExtensionFileChangeListener()
/*      */     {
/*      */     }
/*      */ 
/*      */     public void fileChanged(FileChangeEvent fileEvent)
/*      */       throws Exception
/*      */     {
/*   96 */       String changedFileExtension = fileEvent.getFile().getName().getExtension();
/*      */ 
/*   99 */       if ((changedFileExtension.equalsIgnoreCase("jar")) || (changedFileExtension.equalsIgnoreCase("py")))
/*      */       {
/*  101 */         String extName = fileEvent.getFile().getName().getParent().getBaseName();
/*  102 */         List reloadableExtensions = SFSExtensionManager.this.findZoneExtensionByName(extName);
/*      */ 
/*  104 */         if (reloadableExtensions.size() > 0)
/*      */         {
/*  107 */           for (ISFSExtension theExtension : reloadableExtensions)
/*      */           {
/*  109 */             if ((theExtension != null) && (theExtension.getReloadMode() == ExtensionReloadMode.AUTO))
/*  110 */               SFSExtensionManager.this.reloadExtension(theExtension);
/*      */           }
/*      */         }
/*      */       }
/*      */     }
/*      */ 
/*      */     public void fileCreated(FileChangeEvent arg0)
/*      */       throws Exception
/*      */     {
/*      */     }
/*      */ 
/*      */     public void fileDeleted(FileChangeEvent arg0)
/*      */       throws Exception
/*      */     {
/*      */     }
/*      */   }
/*      */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.SFSExtensionManager
 * JD-Core Version:    0.6.0
 */