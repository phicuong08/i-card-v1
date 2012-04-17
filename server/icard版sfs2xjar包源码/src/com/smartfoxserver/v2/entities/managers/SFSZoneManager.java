/*     */ package com.smartfoxserver.v2.entities.managers;
/*     */ 
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.CreateRoomSettings;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyListManager;
/*     */ import com.smartfoxserver.v2.buddylist.SFSBuddyListManager;
/*     */ import com.smartfoxserver.v2.buddylist.storage.BuddyStorage;
/*     */ import com.smartfoxserver.v2.config.IConfigurator;
/*     */ import com.smartfoxserver.v2.config.ServerSettings;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings.BadWordsFilterSettings;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings.BuddyListSettings;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings.ExtensionSettings;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings.FloodFilterSettings;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings.PermissionProfile;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings.PrivilegeManagerSettings;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings.RequestFilterSettings;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings.RoomPermissions;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings.RoomSettings;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings.RoomVariableDefinition;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings.WordFilterSettings;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.core.BaseCoreService;
/*     */ import com.smartfoxserver.v2.db.DBConfig;
/*     */ import com.smartfoxserver.v2.db.IDBManager;
/*     */ import com.smartfoxserver.v2.db.SFSDBManager;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.SFSRoomRemoveMode;
/*     */ import com.smartfoxserver.v2.entities.SFSRoomSettings;
/*     */ import com.smartfoxserver.v2.entities.SFSZone;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.variables.RoomVariable;
/*     */ import com.smartfoxserver.v2.entities.variables.SFSRoomVariable;
/*     */ import com.smartfoxserver.v2.exceptions.SFSException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSExtensionException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import com.smartfoxserver.v2.extensions.ExtensionLevel;
/*     */ import com.smartfoxserver.v2.security.PrivilegeManager;
/*     */ import com.smartfoxserver.v2.security.SFSPermissionProfile;
/*     */ import com.smartfoxserver.v2.security.SystemPermission;
/*     */ import com.smartfoxserver.v2.util.IFloodFilter;
/*     */ import com.smartfoxserver.v2.util.IWordFilter;
/*     */ import com.smartfoxserver.v2.util.TaskScheduler;
/*     */ import com.smartfoxserver.v2.util.filters.WordsFilterMode;
/*     */ import com.smartfoxserver.v2.util.stats.ITrafficMeter;
/*     */ import com.smartfoxserver.v2.util.stats.ZoneTrafficMeter;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Arrays;
/*     */ import java.util.Collection;
/*     */ import java.util.HashSet;
/*     */ import java.util.List;
/*     */ import java.util.Set;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import java.util.concurrent.ConcurrentMap;
/*     */ import java.util.concurrent.TimeUnit;
/*     */ import org.apache.commons.lang.ArrayUtils;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSZoneManager extends BaseCoreService
/*     */   implements IZoneManager
/*     */ {
/*     */   private Logger logger;
/*     */   private ConcurrentMap<String, Zone> zones;
/*     */   private SmartFoxServer sfs;
/*     */   private IConfigurator configurator;
/*     */   private final ConcurrentMap<String, ITrafficMeter> trafficMonitors;
/*     */   private final TrafficMeterExecutor trafficMeterExecutor;
/*     */ 
/*     */   public SFSZoneManager()
/*     */   {
/* 139 */     this.logger = LoggerFactory.getLogger(getClass());
/*     */ 
/* 142 */     if (this.zones == null) {
/* 143 */       this.zones = new ConcurrentHashMap();
/*     */     }
/* 145 */     this.trafficMonitors = new ConcurrentHashMap();
/* 146 */     this.trafficMeterExecutor = new TrafficMeterExecutor(this.trafficMonitors.values());
/*     */ 
/* 149 */     Runtime.getRuntime().addShutdownHook(new ShutDownHandler(null));
/*     */   }
/*     */ 
/*     */   public void init(Object o)
/*     */   {
/* 155 */     super.init(o);
/* 156 */     this.sfs = SmartFoxServer.getInstance();
/* 157 */     this.configurator = this.sfs.getConfigurator();
/*     */   }
/*     */ 
/*     */   public void addZone(Zone zone)
/*     */   {
/* 163 */     if (this.zones.containsKey(zone.getName())) {
/* 164 */       throw new SFSRuntimeException("Zone already exists: " + zone.getName() + ". Can't add the same zone more than once.");
/*     */     }
/* 166 */     this.zones.put(zone.getName(), zone);
/*     */   }
/*     */ 
/*     */   public Zone getZoneByName(String name)
/*     */   {
/* 172 */     return (Zone)this.zones.get(name);
/*     */   }
/*     */ 
/*     */   public Zone getZoneById(int id)
/*     */   {
/* 181 */     Zone theZone = null;
/*     */ 
/* 183 */     for (Zone zone : this.zones.values())
/*     */     {
/* 185 */       if (zone.getId() != id)
/*     */         continue;
/* 187 */       theZone = zone;
/* 188 */       break;
/*     */     }
/*     */ 
/* 192 */     return theZone;
/*     */   }
/*     */ 
/*     */   public List<Zone> getZoneList()
/*     */   {
/* 198 */     return new ArrayList(this.zones.values());
/*     */   }
/*     */ 
/*     */   public synchronized void initializeZones()
/*     */     throws SFSException
/*     */   {
/* 214 */     if (this.zones.size() > 0)
/*     */     {
/* 216 */       this.logger.info(this.zones.size() + " Zones found in cluster: ");
/* 217 */       for (Zone zone : this.zones.values())
/*     */       {
/* 219 */         this.logger.info(zone.toString());
/*     */       }
/* 221 */       return;
/*     */     }
/*     */ 
/* 224 */     List zoneSettings = this.configurator.loadZonesConfiguration();
/*     */ 
/* 226 */     for (ZoneSettings settings : zoneSettings)
/*     */     {
/* 228 */       this.logger.info(
/* 230 */         String.format(
/* 232 */         "%n%n%s%n >> Zone: %s %n%s%n", new Object[] { 
/* 233 */         "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::", 
/* 234 */         settings.name, 
/* 235 */         "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::" }));
/*     */ 
/* 240 */       addZone(createZone(settings));
/*     */     }
/*     */ 
/* 247 */     activateTrafficMonitors();
/*     */   }
/*     */ 
/*     */   public void toggleZone(String name, boolean isActive)
/*     */   {
/* 257 */     Zone theZone = getZoneByName(name);
/* 258 */     theZone.setActive(isActive);
/*     */   }
/*     */ 
/*     */   public ITrafficMeter getZoneTrafficMeter(String zoneName)
/*     */   {
/* 266 */     return (ITrafficMeter)this.trafficMonitors.get(zoneName);
/*     */   }
/*     */ 
/*     */   private void activateTrafficMonitors()
/*     */   {
/* 279 */     for (Zone zone : this.zones.values())
/*     */     {
/* 281 */       this.trafficMonitors.put(zone.getName(), new ZoneTrafficMeter(zone));
/*     */     }
/*     */ 
/* 284 */     this.sfs.getTaskScheduler().scheduleAtFixedRate(
/* 286 */       this.trafficMeterExecutor, 
/* 287 */       0, 
/* 288 */       5, 
/* 289 */       TimeUnit.MINUTES);
/*     */   }
/*     */ 
/*     */   public Zone createZone(ZoneSettings settings)
/*     */     throws SFSException
/*     */   {
/* 295 */     Zone zone = new SFSZone(settings.name);
/* 296 */     zone.setId(settings.getId());
/*     */ 
/* 299 */     zone.setCustomLogin(settings.isCustomLogin);
/* 300 */     zone.setForceLogout(settings.isForceLogout);
/* 301 */     zone.setFilterUserNames(settings.isFilterUserNames);
/* 302 */     zone.setFilterRoomNames(settings.isFilterRoomNames);
/* 303 */     zone.setFilterPrivateMessages(settings.isFilterPrivateMessages);
/* 304 */     zone.setFilterBuddyMessages(settings.isFilterBuddyMessages);
/* 305 */     zone.setGuestUserAllowed(settings.allowGuestUsers);
/* 306 */     zone.setGuestUserNamePrefix(settings.guestUserNamePrefix);
/* 307 */     zone.setMaxAllowedRooms(settings.maxRooms);
/*     */ 
/* 309 */     zone.setMaxAllowedUsers(settings.maxUsers);
/* 310 */     zone.setMaxUserVariablesAllowed(settings.maxUserVariablesAllowed);
/* 311 */     zone.setMaxRoomVariablesAllowed(settings.maxRoomVariablesAllowed);
/* 312 */     zone.setMinRoomNameChars(settings.minRoomNameChars);
/* 313 */     zone.setMaxRoomNameChars(settings.maxRoomNameChars);
/* 314 */     zone.setMaxRoomsCreatedPerUserLimit(settings.maxRoomsCreatedPerUser);
/* 315 */     zone.setDefaultPlayerIdGeneratorClassName(settings.defaultPlayerIdGeneratorClass);
/* 316 */     zone.setUserCountChangeUpdateInterval(settings.userCountChangeUpdateInterval);
/* 317 */     zone.setUserReconnectionSeconds(settings.userReconnectionSeconds);
/*     */ 
/* 319 */     int theZoneIdleTime = this.sfs.getConfigurator().getServerSettings().userMaxIdleTime;
/*     */ 
/* 322 */     if (settings.overrideMaxUserIdleTime > 0)
/*     */     {
/* 324 */       if (settings.overrideMaxUserIdleTime >= this.sfs.getConfigurator().getServerSettings().sessionMaxIdleTime) {
/* 325 */         theZoneIdleTime = settings.overrideMaxUserIdleTime;
/*     */       }
/*     */       else
/*     */       {
/* 330 */         this.logger.warn(
/* 332 */           String.format(
/* 334 */           "%s - Could not override maxUserIdleTime. The provided value (%s sec) is < sessionMaxIdleTime (%s sec). You must provide a value > sessionMaxIdleTime. Please double check your configuration.", new Object[] { 
/* 335 */           zone, 
/* 336 */           Integer.valueOf(settings.overrideMaxUserIdleTime), 
/* 337 */           Integer.valueOf(this.sfs.getConfigurator().getServerSettings().sessionMaxIdleTime) }));
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 343 */     zone.setMaxUserIdleTime(theZoneIdleTime);
/*     */ 
/* 348 */     List defaultRoomGroups = null;
/* 349 */     if (settings.defaultRoomGroups != null)
/*     */     {
/* 351 */       String[] defaultGroups = settings.defaultRoomGroups.split("\\,");
/* 352 */       defaultRoomGroups = Arrays.asList(defaultGroups);
/*     */     }
/*     */     else {
/* 355 */       defaultRoomGroups = new ArrayList();
/*     */     }
/* 357 */     if (defaultRoomGroups.size() == 0)
/* 358 */       defaultRoomGroups.add("default");
/* 359 */     zone.setDefaultGroups(defaultRoomGroups);
/*     */ 
/* 363 */     List publicRoomGroups = null;
/* 364 */     if (settings.publicRoomGroups != null)
/*     */     {
/* 366 */       String[] publicGroups = settings.publicRoomGroups.split("\\,");
/* 367 */       publicRoomGroups = Arrays.asList(publicGroups);
/*     */     }
/*     */     else {
/* 370 */       publicRoomGroups = new ArrayList();
/*     */     }
/* 372 */     if (publicRoomGroups.size() == 0) {
/* 373 */       publicRoomGroups.add("default");
/*     */     }
/* 375 */     zone.setPublicGroups(publicRoomGroups);
/*     */ 
/* 379 */     zone.setZoneManager(this);
/*     */ 
/* 382 */     for (String eventName : settings.disabledSystemEvents)
/*     */     {
/* 384 */       zone.addDisabledSystemEvent(eventName);
/*     */     }
/*     */ 
/* 391 */     configureWordsFilter(zone, settings.wordsFilter);
/*     */ 
/* 394 */     configureFloodFilter(zone, settings.floodFilter);
/*     */ 
/* 397 */     configureZonePermissions(zone, settings.privilegeManager);
/*     */ 
/* 400 */     if (settings.databaseManager != null) {
/* 401 */       configureDBManager(zone, settings.databaseManager);
/*     */     }
/*     */ 
/* 404 */     configureBuddyListManager(zone, settings.buddyList);
/*     */ 
/* 407 */     for (ZoneSettings.RoomSettings roomSettings : settings.rooms)
/*     */     {
/*     */       try
/*     */       {
/* 414 */         createRoom(zone, roomSettings);
/*     */       }
/*     */       catch (SFSException e)
/*     */       {
/* 419 */         this.logger.warn("Error while creating Room: " + roomSettings.name + " -> " + e.getMessage());
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 424 */     if ((settings.extension != null) && (settings.extension.name != null) && (settings.extension.name.length() > 0))
/*     */     {
/*     */       try
/*     */       {
/* 428 */         this.sfs.getExtensionManager().createExtension(settings.extension, ExtensionLevel.ZONE, zone, null);
/*     */       }
/*     */       catch (SFSExtensionException err)
/*     */       {
/* 432 */         String extName = settings.extension.name == null ? "{Unknown}" : settings.extension.name;
/*     */ 
/* 435 */         throw new SFSException("Extension creation failure: " + extName + " - " + err.getMessage());
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 440 */     zone.setActive(true);
/*     */ 
/* 442 */     return zone;
/*     */   }
/*     */ 
/*     */   private void configureWordsFilter(Zone zone, ZoneSettings.WordFilterSettings settings)
/*     */   {
/* 476 */     IWordFilter wordFilter = zone.getWordFilter();
/* 477 */     wordFilter.setBanDurationMinutes(settings.banDuration);
/* 478 */     wordFilter.setBanMessage(settings.banMessage);
/* 479 */     wordFilter.setBanMode(BanMode.fromString(settings.banMode));
/* 480 */     wordFilter.setBannedUserManager(this.sfs.getBannedUserManager());
/* 481 */     wordFilter.setFilterMode(WordsFilterMode.fromString(settings.filterMode));
/*     */ 
/* 483 */     wordFilter.setUseWarnings(settings.useWarnings);
/* 484 */     wordFilter.setWarningMessage(settings.warningMessage);
/* 485 */     wordFilter.setKickMessage(settings.kickMessage);
/* 486 */     wordFilter.setKicksBeforeBan(settings.kicksBeforeBan);
/* 487 */     wordFilter.setKicksBeforeBanMinutes(settings.kicksBeforeBanMinutes);
/* 488 */     wordFilter.setMaskCharacter(settings.hideBadWordWithCharacter);
/* 489 */     wordFilter.setMaxBadWordsPerMessage(settings.maxBadWordsPerMessage);
/* 490 */     wordFilter.setName(zone.getName() + "-WordFilter");
/* 491 */     wordFilter.setSecondsBeforeBanOrKick(settings.secondsBeforeBanOrKick);
/* 492 */     wordFilter.setWarningsBeforeKick(settings.warningsBeforeKick);
/* 493 */     wordFilter.setWordsFile(settings.wordsFile);
/* 494 */     wordFilter.setActive(settings.isActive);
/* 495 */     wordFilter.init(null);
/*     */   }
/*     */ 
/*     */   private void configureFloodFilter(Zone zone, ZoneSettings.FloodFilterSettings settings)
/*     */   {
/* 500 */     IFloodFilter floodFilter = zone.getFloodFilter();
/*     */ 
/* 502 */     floodFilter.setActive(settings.isActive);
/* 503 */     floodFilter.setBanDurationMinutes(settings.banDurationMinutes);
/* 504 */     floodFilter.setBanMessage(settings.banMessage);
/* 505 */     floodFilter.setBanMode(BanMode.fromString(settings.banMode));
/* 506 */     floodFilter.setLogFloodingAttempts(settings.logFloodingAttempts);
/* 507 */     floodFilter.setMaxFloodingAttempts(settings.maxFloodingAttempts);
/* 508 */     floodFilter.setSecondsBeforeBan(settings.secondsBeforeBan);
/*     */ 
/* 510 */     if (settings.requestFilters != null)
/*     */     {
/* 512 */       for (ZoneSettings.RequestFilterSettings item : settings.requestFilters)
/*     */       {
/* 514 */         floodFilter.addRequestFilter(SystemRequest.valueOf(item.reqName), item.maxRequestsPerSecond);
/*     */       }
/*     */     }
/*     */   }
/*     */ 
/*     */   private void configureZonePermissions(Zone zone, ZoneSettings.PrivilegeManagerSettings settings)
/*     */   {
/* 522 */     PrivilegeManager privilegeManager = zone.getPrivilegeManager();
/* 523 */     privilegeManager.setActive(settings.active);
/*     */ 
/* 527 */     if (settings.active)
/*     */     {
/* 529 */       for (ZoneSettings.PermissionProfile profileSetting : settings.profiles)
/*     */       {
/* 532 */         List deniedReq = new ArrayList();
/* 533 */         for (String reqName : profileSetting.deniedRequests)
/*     */         {
/* 535 */           deniedReq.add(SystemRequest.valueOf(reqName));
/*     */         }
/*     */ 
/* 538 */         List deniedSysReq = new ArrayList();
/* 539 */         Object sysFlags = new ArrayList();
/*     */ 
/* 541 */         if (profileSetting.deniedRequests != null)
/*     */         {
/* 543 */           for (String sysReqName : profileSetting.deniedRequests)
/*     */           {
/* 545 */             deniedSysReq.add(SystemRequest.valueOf(sysReqName));
/*     */           }
/*     */         }
/*     */ 
/* 549 */         if (profileSetting.permissionFlags != null)
/*     */         {
/* 551 */           for (String flagName : profileSetting.permissionFlags)
/*     */           {
/* 553 */             ((List)sysFlags).add(SystemPermission.valueOf(flagName));
/*     */           }
/*     */         }
/*     */ 
/* 557 */         privilegeManager.setPermissionProfile(
/* 559 */           new SFSPermissionProfile(
/* 561 */           profileSetting.id, 
/* 562 */           profileSetting.name, 
/* 563 */           deniedSysReq, 
/* 564 */           (List)sysFlags));
/*     */       }
/*     */     }
/*     */   }
/*     */ 
/*     */   private void configureBuddyListManager(Zone zone, ZoneSettings.BuddyListSettings settings)
/*     */   {
/* 573 */     BuddyListManager buddyListManager = new SFSBuddyListManager(zone, settings.active);
/*     */ 
/* 575 */     if (buddyListManager.isActive())
/*     */     {
/* 577 */       buddyListManager.setBuddyListMaxSize(settings.maxItemsPerList);
/* 578 */       buddyListManager.setMaxBuddyVariables(settings.maxBuddyVariables);
/* 579 */       buddyListManager.setOfflineBuddyVariablesCacheSize(settings.offlineBuddyVariablesCacheSize);
/* 580 */       buddyListManager.setAllowOfflineBuddyVariables(settings.allowOfflineBuddyVariables);
/* 581 */       buddyListManager.setBuddyStates(settings.buddyStates);
/* 582 */       buddyListManager.setUseTempBuddies(settings.useTempBuddies);
/* 583 */       buddyListManager.setApplyBadWordsFilter(settings.badWordsFilter.isActive);
/*     */ 
/* 588 */       String customClass = null;
/*     */ 
/* 591 */       if ((settings.customStorageClass != null) && (settings.customStorageClass.length() > 0))
/* 592 */         customClass = settings.customStorageClass;
/*     */       else {
/* 594 */         customClass = "com.smartfoxserver.v2.buddylist.storage.FSBuddyStorage";
/*     */       }
/*     */       try
/*     */       {
/* 598 */         Class storageClass = Class.forName(customClass);
/*     */ 
/* 600 */         if (!BuddyStorage.class.isAssignableFrom(storageClass)) {
/* 601 */           throw new SFSRuntimeException("Specified BuddyList Storage class: " + customClass + " does not implement the BuddyStorage interface");
/*     */         }
/* 603 */         buddyListManager.setStorageHandler((BuddyStorage)storageClass.newInstance());
/*     */ 
/* 606 */         buddyListManager.init(null);
/*     */       }
/*     */       catch (ClassNotFoundException e)
/*     */       {
/* 611 */         throw new SFSRuntimeException("BuddyList storage class: " + customClass + " was not found.");
/*     */       }
/*     */       catch (InstantiationException e)
/*     */       {
/* 615 */         throw new SFSRuntimeException("BuddyList storage class: " + customClass + " could not be instantiated.");
/*     */       }
/*     */       catch (IllegalAccessException e)
/*     */       {
/* 619 */         throw new SFSRuntimeException("Illegal access for BuddyList storage class: " + customClass);
/*     */       }
/*     */     }
/*     */ 
/* 623 */     zone.setBuddyListManager(buddyListManager);
/*     */   }
/*     */ 
/*     */   private void configureDBManager(Zone zone, DBConfig settings)
/*     */   {
/* 628 */     IDBManager dbManager = new SFSDBManager(settings);
/* 629 */     zone.setDBManager(dbManager);
/* 630 */     dbManager.init(zone);
/*     */   }
/*     */ 
/*     */   public Room createRoom(Zone zone, ZoneSettings.RoomSettings roomSettings) throws SFSException
/*     */   {
/* 635 */     this.logger.info(
/* 637 */       String.format(
/* 639 */       "Creating room: (%s) %s", new Object[] { 
/* 640 */       roomSettings.groupId.length() == 0 ? "default" : roomSettings.groupId, 
/* 641 */       roomSettings.name }));
/*     */ 
/* 645 */     CreateRoomSettings params = new CreateRoomSettings();
/* 646 */     params.setName(roomSettings.name);
/* 647 */     params.setGroupId(roomSettings.groupId);
/* 648 */     params.setPassword(roomSettings.password);
/* 649 */     params.setAutoRemoveMode(SFSRoomRemoveMode.fromString(roomSettings.autoRemoveMode));
/* 650 */     params.setMaxUsers(roomSettings.maxUsers);
/* 651 */     params.setMaxSpectators(roomSettings.maxSpectators);
/* 652 */     params.setMaxVariablesAllowed(roomSettings.permissions.maxRoomVariablesAllowed);
/* 653 */     params.setDynamic(roomSettings.isDynamic);
/* 654 */     params.setGame(roomSettings.isGame);
/* 655 */     params.setHidden(roomSettings.isHidden);
/* 656 */     params.setUseWordsFilter(roomSettings.badWordsFilter.isActive);
/*     */ 
/* 659 */     Set sfsRoomSettings = new HashSet();
/*     */ 
/* 662 */     String[] settings = (String[])ArrayUtils.addAll(roomSettings.permissions.flags.split("\\,"), roomSettings.events.split("\\,"));
/*     */ 
/* 664 */     for (String item : settings)
/*     */     {
/*     */       try
/*     */       {
/* 668 */         sfsRoomSettings.add(SFSRoomSettings.valueOf(item.toUpperCase()));
/*     */       }
/*     */       catch (IllegalArgumentException argError)
/*     */       {
/* 673 */         this.logger.warn("RoomSetting literal not found: " + item);
/*     */       }
/*     */     }
/*     */ 
/* 677 */     params.setRoomSettings(sfsRoomSettings);
/*     */ 
/* 680 */     List variables = new ArrayList();
/* 681 */     for (ZoneSettings.RoomVariableDefinition varDef : roomSettings.roomVariables)
/*     */     {
/* 683 */       Object sfsRoomVar = SFSRoomVariable.newFromStringLiteral(varDef.name, varDef.type, varDef.value);
/* 684 */       ((RoomVariable)sfsRoomVar).setPrivate(varDef.isPrivate);
/* 685 */       ((RoomVariable)sfsRoomVar).setPersistent(varDef.isPersistent);
/* 686 */       ((RoomVariable)sfsRoomVar).setGlobal(varDef.isGlobal);
/* 687 */       ((RoomVariable)sfsRoomVar).setHidden(varDef.isHidden);
/*     */ 
/* 689 */       variables.add(sfsRoomVar);
/*     */     }
/*     */ 
/* 692 */     params.setRoomVariables(variables);
/*     */ 
/* 694 */     Room room = this.sfs.getAPIManager().getSFSApi().createRoom(zone, params, null, false, null, false, false);
/*     */ 
/* 697 */     if ((roomSettings.extension != null) && (roomSettings.extension.name != null) && (roomSettings.extension.name.length() > 0))
/*     */     {
/*     */       try
/*     */       {
/* 701 */         this.sfs.getExtensionManager().createExtension(roomSettings.extension, ExtensionLevel.ROOM, zone, room);
/*     */       }
/*     */       catch (SFSExtensionException err)
/*     */       {
/* 705 */         String extName = roomSettings.extension.name == null ? "{Unknown}" : roomSettings.extension.name;
/* 706 */         throw new SFSException("Room Extension creation failure: " + extName + " - " + err.getMessage() + " - Room: " + room);
/*     */       }
/*     */     }
/*     */ 
/* 710 */     return (Room)room;
/*     */   }
/*     */ 
/*     */   private void populateTransientFields()
/*     */   {
/* 720 */     this.logger = LoggerFactory.getLogger(getClass());
/* 721 */     this.sfs = SmartFoxServer.getInstance();
/* 722 */     this.configurator = this.sfs.getConfigurator();
/*     */   }
/*     */ 
/*     */   private final class ShutDownHandler extends Thread
/*     */   {
/*     */     private ShutDownHandler()
/*     */     {
/*     */     }
/*     */ 
/*     */     public void run()
/*     */     {
/*  81 */       SFSZoneManager.this.logger.info("BuddyList saveAll...");
/*     */ 
/*  83 */       for (Zone zone : SFSZoneManager.this.zones.values())
/*     */       {
/*     */         try
/*     */         {
/*  87 */           zone.getBuddyListManager().saveAll();
/*     */         }
/*     */         catch (Exception e)
/*     */         {
/*  91 */           SFSZoneManager.this.logger.warn(e.toString());
/*     */         }
/*     */       }
/*     */     }
/*     */   }
/*     */ 
/*     */   private static class TrafficMeterExecutor
/*     */     implements Runnable
/*     */   {
/*     */     private final Logger log;
/*     */     private final Collection<ITrafficMeter> trafficMonitors;
/*     */ 
/*     */     public TrafficMeterExecutor(Collection<ITrafficMeter> trafficMonitors)
/*     */     {
/* 107 */       this.trafficMonitors = trafficMonitors;
/* 108 */       this.log = LoggerFactory.getLogger(getClass());
/*     */     }
/*     */ 
/*     */     public void run()
/*     */     {
/*     */       try
/*     */       {
/* 116 */         long t1 = System.nanoTime();
/*     */ 
/* 118 */         for (ITrafficMeter monitor : this.trafficMonitors)
/*     */         {
/* 120 */           monitor.onTick();
/*     */         }
/*     */ 
/* 123 */         long t2 = System.nanoTime();
/*     */ 
/* 125 */         if (this.log.isDebugEnabled())
/* 126 */           this.log.debug("Traffic Monitor update: " + (t2 - t1) / 1000000.0D + "ms.");
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/* 130 */         this.log.warn("Unexpected exception: " + e + ". Task will not be interrupted.");
/*     */       }
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.SFSZoneManager
 * JD-Core Version:    0.6.0
 */