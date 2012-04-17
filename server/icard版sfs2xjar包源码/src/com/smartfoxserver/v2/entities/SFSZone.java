/*      */ package com.smartfoxserver.v2.entities;
/*      */ 
/*      */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*      */ import com.smartfoxserver.v2.SmartFoxServer;
/*      */ import com.smartfoxserver.v2.api.APIManager;
/*      */ import com.smartfoxserver.v2.api.CreateRoomSettings;
/*      */ import com.smartfoxserver.v2.api.ISFSApi;
/*      */ import com.smartfoxserver.v2.buddylist.BuddyListManager;
/*      */ import com.smartfoxserver.v2.buddylist.BuddyProperties;
/*      */ import com.smartfoxserver.v2.db.IDBManager;
/*      */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*      */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*      */ import com.smartfoxserver.v2.entities.managers.IBannedUserManager;
/*      */ import com.smartfoxserver.v2.entities.managers.ILSManager;
/*      */ import com.smartfoxserver.v2.entities.managers.IRoomManager;
/*      */ import com.smartfoxserver.v2.entities.managers.IUserManager;
/*      */ import com.smartfoxserver.v2.entities.managers.IZoneManager;
/*      */ import com.smartfoxserver.v2.entities.managers.SFSRoomManager;
/*      */ import com.smartfoxserver.v2.entities.managers.SFSUserManager;
/*      */ import com.smartfoxserver.v2.exceptions.SFSCreateRoomException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSErrorCode;
/*      */ import com.smartfoxserver.v2.exceptions.SFSErrorData;
/*      */ import com.smartfoxserver.v2.exceptions.SFSException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSLoginException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSRoomException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSTooManyRoomsException;
/*      */ import com.smartfoxserver.v2.extensions.ISFSExtension;
/*      */ import com.smartfoxserver.v2.security.PrivilegeManager;
/*      */ import com.smartfoxserver.v2.security.SFSPrivilegeManager;
/*      */ import com.smartfoxserver.v2.util.DefaultPlayerIdGenerator;
/*      */ import com.smartfoxserver.v2.util.IAdminHelper;
/*      */ import com.smartfoxserver.v2.util.IFloodFilter;
/*      */ import com.smartfoxserver.v2.util.IResponseThrottler;
/*      */ import com.smartfoxserver.v2.util.IWordFilter;
/*      */ import com.smartfoxserver.v2.util.SFSFloodFilter;
/*      */ import com.smartfoxserver.v2.util.SFSWordFilter;
/*      */ import com.smartfoxserver.v2.util.UserCountChangeResponseThrottler;
/*      */ import com.smartfoxserver.v2.util.filters.FilteredMessage;
/*      */ import com.smartfoxserver.v2.util.filters.WordsFilterMode;
/*      */ import java.util.ArrayList;
/*      */ import java.util.Arrays;
/*      */ import java.util.Collection;
/*      */ import java.util.Collections;
/*      */ import java.util.HashSet;
/*      */ import java.util.List;
/*      */ import java.util.Map;
/*      */ import java.util.Set;
/*      */ import java.util.concurrent.ConcurrentHashMap;
/*      */ import java.util.concurrent.ConcurrentMap;
/*      */ import org.slf4j.Logger;
/*      */ import org.slf4j.LoggerFactory;
/*      */ 
/*      */ public final class SFSZone
/*      */   implements Zone
/*      */ {
/*   94 */   private static final boolean B = SmartFoxServer.getInstance().getVersion().contains("B");
/*      */   private static final int C = 943;
/*      */   private List<String> disabledSystemEvents;
/*      */   private List<String> publicGroups;
/*      */   private List<String> defaultGroups;
/*      */   private IZoneManager zoneManager;
/*      */   private final IRoomManager roomManager;
/*      */   private final IUserManager userManager;
/*      */   private IFloodFilter floodFilter;
/*      */   private IWordFilter wordFilter;
/*      */   private PrivilegeManager privilegeManager;
/*      */   private BuddyListManager buddyListManager;
/*      */   private IDBManager dbManager;
/*      */   private IResponseThrottler uCountResponseThrottler;
/*      */   private volatile ISFSExtension extension;
/*  112 */   private volatile boolean isActive = false;
/*  113 */   private boolean customLogin = false;
/*  114 */   private boolean forceLogout = false;
/*  115 */   private boolean clientAllowedToOverridRoomEvents = false;
/*  116 */   private boolean guestUserAllowed = false;
/*  117 */   private volatile boolean filterUserNames = false;
/*  118 */   private volatile boolean filterRoomNames = false;
/*  119 */   private volatile boolean filterPrivateMessages = false;
/*  120 */   private volatile boolean filterBuddyMessages = false;
/*      */   private IAdminHelper adminHelper;
/*      */   private volatile int maxAllowedRooms;
/*      */   private volatile int maxAllowedUsers;
/*      */   private volatile int maxAllowedUserVariables;
/*      */   private volatile int maxAllowedRoomVariables;
/*      */   private volatile int maxRoomsCreatedPerUser;
/*  140 */   private volatile int userCountChangeUpdateInterval = 0;
/*      */   private volatile int minRoomNameChars;
/*      */   private volatile int maxRoomNameChars;
/*  143 */   private volatile int userReconnectionSeconds = 0;
/*  144 */   private int maxUserIdleTime = 0;
/*      */   private final String name;
/*      */   private String guestUserNamePrefix;
/*      */   private String defaultPlayerIdGeneratorClass;
/*      */   private ConcurrentMap<Object, Object> properties;
/*      */   private volatile Map<String, Set<SFSRoomEvents>> groupEvents;
/*      */   private Logger logger;
/*      */   private SmartFoxServer sfs;
/*  160 */   private int id = -1;
/*      */ 
/*      */   public SFSZone(String name)
/*      */   {
/*  164 */     this.name = name;
/*  165 */     this.logger = LoggerFactory.getLogger(getClass());
/*  166 */     this.sfs = SmartFoxServer.getInstance();
/*      */ 
/*  168 */     this.roomManager = new SFSRoomManager();
/*  169 */     this.roomManager.setOwnerZone(this);
/*      */ 
/*  171 */     this.userManager = new SFSUserManager();
/*  172 */     this.userManager.setOwnerZone(this);
/*      */ 
/*  174 */     this.disabledSystemEvents = new ArrayList();
/*  175 */     this.publicGroups = new ArrayList();
/*  176 */     this.properties = new ConcurrentHashMap();
/*      */ 
/*  179 */     this.roomManager.addGroup("default");
/*  180 */     this.publicGroups.add("default");
/*      */ 
/*  183 */     this.privilegeManager = new SFSPrivilegeManager();
/*      */ 
/*  186 */     this.groupEvents = new ConcurrentHashMap();
/*      */ 
/*  189 */     this.floodFilter = new SFSFloodFilter(this.sfs.getBannedUserManager());
/*      */ 
/*  192 */     this.wordFilter = new SFSWordFilter(this.sfs.getBannedUserManager());
/*      */   }
/*      */ 
/*      */   public IUserManager getUserManager()
/*      */   {
/*  208 */     return this.userManager;
/*      */   }
/*      */ 
/*      */   public boolean containsGroup(String groupId)
/*      */   {
/*  215 */     return this.roomManager.containsGroup(groupId);
/*      */   }
/*      */ 
/*      */   public boolean containsPublicGroup(String groupId)
/*      */   {
/*  222 */     boolean flag = false;
/*      */ 
/*  224 */     synchronized (this.publicGroups)
/*      */     {
/*  226 */       flag = this.publicGroups.contains(groupId);
/*      */     }
/*      */ 
/*  229 */     return flag;
/*      */   }
/*      */ 
/*      */   public Room createRoom(CreateRoomSettings params, User user)
/*      */     throws SFSCreateRoomException
/*      */   {
/*  238 */     return this.roomManager.createRoom(params, user);
/*      */   }
/*      */ 
/*      */   public Room createRoom(CreateRoomSettings params)
/*      */     throws SFSCreateRoomException
/*      */   {
/*  247 */     return this.roomManager.createRoom(params);
/*      */   }
/*      */ 
/*      */   public void changeRoomName(Room room, String newName)
/*      */     throws SFSRoomException
/*      */   {
/*  256 */     this.roomManager.changeRoomName(room, newName);
/*      */   }
/*      */ 
/*      */   public void changeRoomPasswordState(Room room, String password)
/*      */   {
/*  265 */     this.roomManager.changeRoomPasswordState(room, password);
/*      */   }
/*      */ 
/*      */   public void changeRoomCapacity(Room room, int newMaxUsers, int newMaxSpect)
/*      */   {
/*  274 */     this.roomManager.changeRoomCapacity(room, newMaxUsers, newMaxSpect);
/*      */   }
/*      */ 
/*      */   public void addDisabledSystemEvent(String eventID)
/*      */   {
/*  280 */     synchronized (this.disabledSystemEvents)
/*      */     {
/*  282 */       this.disabledSystemEvents.add(eventID);
/*      */     }
/*      */   }
/*      */ 
/*      */   public void addRoom(Room room)
/*      */     throws SFSTooManyRoomsException
/*      */   {
/*  289 */     this.roomManager.addRoom(room);
/*      */   }
/*      */ 
/*      */   public String getGuestUserNamePrefix()
/*      */   {
/*  298 */     return this.guestUserNamePrefix;
/*      */   }
/*      */ 
/*      */   public int getUserCount()
/*      */   {
/*  307 */     return this.userManager.getUserCount();
/*      */   }
/*      */ 
/*      */   public int getMaxAllowedRooms()
/*      */   {
/*  316 */     return this.maxAllowedRooms;
/*      */   }
/*      */ 
/*      */   public int getMaxUserVariablesAllowed()
/*      */   {
/*  325 */     return this.maxAllowedUserVariables;
/*      */   }
/*      */ 
/*      */   public int getMaxAllowedUsers()
/*      */   {
/*  334 */     return this.maxAllowedUsers;
/*      */   }
/*      */ 
/*      */   public int getMaxRoomsCreatedPerUserLimit()
/*      */   {
/*  343 */     return this.maxRoomsCreatedPerUser;
/*      */   }
/*      */ 
/*      */   public String getName()
/*      */   {
/*  352 */     return this.name;
/*      */   }
/*      */ 
/*      */   public int getId()
/*      */   {
/*  361 */     return this.id;
/*      */   }
/*      */ 
/*      */   public Object getProperty(Object key)
/*      */   {
/*  370 */     return this.properties.get(key);
/*      */   }
/*      */ 
/*      */   public void removeProperty(Object key)
/*      */   {
/*  379 */     this.properties.remove(key);
/*      */   }
/*      */ 
/*      */   public List<String> getPublicGroups()
/*      */   {
/*  388 */     List newList = null;
/*      */ 
/*  390 */     synchronized (this.publicGroups)
/*      */     {
/*  392 */       newList = new ArrayList(this.publicGroups);
/*      */     }
/*      */ 
/*  395 */     return newList;
/*      */   }
/*      */ 
/*      */   public List<String> getGroups()
/*      */   {
/*  410 */     return this.roomManager.getGroups();
/*      */   }
/*      */ 
/*      */   public List<String> getDefaultGroups()
/*      */   {
/*  419 */     return new ArrayList(this.defaultGroups);
/*      */   }
/*      */ 
/*      */   public Room getRoomById(int id)
/*      */   {
/*  428 */     return this.roomManager.getRoomById(id);
/*      */   }
/*      */ 
/*      */   public Room getRoomByName(String name)
/*      */   {
/*  437 */     return this.roomManager.getRoomByName(name);
/*      */   }
/*      */ 
/*      */   public List<Room> getRoomList()
/*      */   {
/*  446 */     return this.roomManager.getRoomList();
/*      */   }
/*      */ 
/*      */   public List<Room> getRoomListFromGroup(String groupId)
/*      */   {
/*  455 */     return this.roomManager.getRoomListFromGroup(groupId);
/*      */   }
/*      */ 
/*      */   public User getUserById(int id)
/*      */   {
/*  464 */     return this.userManager.getUserById(id);
/*      */   }
/*      */ 
/*      */   public User getUserByName(String name)
/*      */   {
/*  473 */     return this.userManager.getUserByName(name);
/*      */   }
/*      */ 
/*      */   public User getUserBySession(ISession session)
/*      */   {
/*  482 */     return this.userManager.getUserBySession(session);
/*      */   }
/*      */ 
/*      */   public int getUserCountChangeUpdateInterval()
/*      */   {
/*  491 */     return this.userCountChangeUpdateInterval;
/*      */   }
/*      */ 
/*      */   public IResponseThrottler getUCountThrottler()
/*      */   {
/*  497 */     return this.uCountResponseThrottler;
/*      */   }
/*      */ 
/*      */   public String getDefaultPlayerIdGeneratorClassName()
/*      */   {
/*  506 */     return this.defaultPlayerIdGeneratorClass;
/*      */   }
/*      */ 
/*      */   public void setDefaultPlayerIdGeneratorClassName(String className)
/*      */   {
/*  513 */     if ((className == null) || (className.length() == 0)) {
/*  514 */       className = "com.smartfoxserver.v2.util.DefaultPlayerIdGenerator";
/*      */     }
/*  516 */     this.defaultPlayerIdGeneratorClass = className;
/*      */ 
/*  518 */     Class playerGeneratorClass = DefaultPlayerIdGenerator.class;
/*      */     try
/*      */     {
/*  522 */       playerGeneratorClass = Class.forName(className);
/*      */     }
/*      */     catch (ClassNotFoundException e)
/*      */     {
/*  526 */       this.logger.warn("Was not able to instantiate PlayerIdGenerator Class: " + className + ", class is not found. Reverting to default implementation: " + playerGeneratorClass);
/*      */     }
/*      */ 
/*  529 */     this.roomManager.setDefaultRoomPlayerIdGeneratorClass(playerGeneratorClass);
/*      */   }
/*      */ 
/*      */   public ISFSExtension getExtension()
/*      */   {
/*  538 */     return this.extension;
/*      */   }
/*      */ 
/*      */   public void setExtension(ISFSExtension extension)
/*      */   {
/*  544 */     this.extension = extension;
/*      */   }
/*      */ 
/*      */   public int getUserReconnectionSeconds()
/*      */   {
/*  553 */     return this.userReconnectionSeconds;
/*      */   }
/*      */ 
/*      */   public void setUserReconnectionSeconds(int seconds)
/*      */   {
/*  562 */     this.userReconnectionSeconds = seconds;
/*      */   }
/*      */ 
/*      */   public int getMaxUserIdleTime()
/*      */   {
/*  571 */     return this.maxUserIdleTime;
/*      */   }
/*      */ 
/*      */   public void setMaxUserIdleTime(int seconds)
/*      */   {
/*  580 */     this.maxUserIdleTime = seconds;
/*      */   }
/*      */ 
/*      */   public Collection<User> getUsersInGroup(String groupId)
/*      */   {
/*  597 */     Set userList = new HashSet();
/*      */ 
/*  599 */     for (Room room : this.roomManager.getRoomListFromGroup(groupId))
/*      */     {
/*  603 */       userList.addAll(room.getUserList());
/*      */     }
/*      */ 
/*  606 */     return userList;
/*      */   }
/*      */ 
/*      */   public Collection<ISession> getSessionsInGroup(String groupId)
/*      */   {
/*  627 */     Set sessionList = new HashSet();
/*      */ 
/*  629 */     for (Room room : this.roomManager.getRoomListFromGroup(groupId))
/*      */     {
/*  631 */       sessionList.addAll(room.getSessionList());
/*      */     }
/*      */ 
/*  634 */     return sessionList;
/*      */   }
/*      */ 
/*      */   public Collection<ISession> getSessionsListeningToGroup(String groupId)
/*      */   {
/*  644 */     Set sessionList = new HashSet();
/*  645 */     List allUsers = this.userManager.getAllUsers();
/*      */ 
/*  647 */     for (User user : allUsers)
/*      */     {
/*  649 */       if (user.isSubscribedToGroup(groupId)) {
/*  650 */         sessionList.add(user.getSession());
/*      */       }
/*      */     }
/*  653 */     return sessionList;
/*      */   }
/*      */ 
/*      */   public Collection<ISession> getSessionList()
/*      */   {
/*  662 */     return this.userManager.getAllSessions();
/*      */   }
/*      */ 
/*      */   public Collection<User> getUserList()
/*      */   {
/*  671 */     return this.userManager.getAllUsers();
/*      */   }
/*      */ 
/*      */   public IZoneManager getZoneManager()
/*      */   {
/*  677 */     return this.zoneManager;
/*      */   }
/*      */ 
/*      */   public boolean isActive()
/*      */   {
/*  686 */     return this.isActive;
/*      */   }
/*      */ 
/*      */   /** @deprecated */
/*      */   public boolean isClientAllowedToOverridRoomEvents()
/*      */   {
/*  693 */     return this.clientAllowedToOverridRoomEvents;
/*      */   }
/*      */ 
/*      */   public boolean isCustomLogin()
/*      */   {
/*  702 */     return this.customLogin;
/*      */   }
/*      */ 
/*      */   public boolean isForceLogout()
/*      */   {
/*  711 */     return this.forceLogout;
/*      */   }
/*      */ 
/*      */   public boolean isGuestUserAllowed()
/*      */   {
/*  720 */     return this.guestUserAllowed;
/*      */   }
/*      */ 
/*      */   public boolean isSystemEventAllowed(String eventID)
/*      */   {
/*  729 */     boolean flag = false;
/*      */ 
/*  731 */     synchronized (this.disabledSystemEvents)
/*      */     {
/*  733 */       flag = !this.disabledSystemEvents.contains(eventID);
/*      */     }
/*      */ 
/*  736 */     return flag;
/*      */   }
/*      */ 
/*      */   public boolean isFilterUserNames()
/*      */   {
/*  745 */     return this.filterUserNames;
/*      */   }
/*      */ 
/*      */   public boolean isFilterRoomNames()
/*      */   {
/*  754 */     return this.filterRoomNames;
/*      */   }
/*      */ 
/*      */   public void setFilterRoomNames(boolean flag)
/*      */   {
/*  763 */     this.filterRoomNames = flag;
/*      */   }
/*      */ 
/*      */   public boolean isFilterBuddyMessages()
/*      */   {
/*  772 */     return this.filterBuddyMessages;
/*      */   }
/*      */ 
/*      */   public void setFilterBuddyMessages(boolean flag)
/*      */   {
/*  781 */     this.filterBuddyMessages = flag;
/*      */   }
/*      */ 
/*      */   public boolean containsProperty(Object key)
/*      */   {
/*  790 */     return this.properties.containsKey(key);
/*      */   }
/*      */ 
/*      */   public void registerEventsForRoomGroup(String groupId, Set<SFSRoomEvents> flags)
/*      */   {
/*  799 */     if (this.roomManager.containsGroup(groupId)) {
/*  800 */       this.groupEvents.put(groupId, flags);
/*      */     }
/*      */     else
/*  803 */       this.logger.warn("Cannot register events for room group: " + groupId + ". Group doesn't exists");
/*      */   }
/*      */ 
/*      */   public boolean isGroupEventSet(String groupId, SFSRoomEvents eventToCheck)
/*      */   {
/*  812 */     boolean res = false;
/*  813 */     Set events = (Set)this.groupEvents.get(groupId);
/*      */ 
/*  815 */     if (events != null) {
/*  816 */       res = events.contains(eventToCheck);
/*      */     }
/*  818 */     return res;
/*      */   }
/*      */ 
/*      */   public Set<SFSRoomEvents> getGroupEvents(String groupId)
/*      */   {
/*  824 */     return Collections.unmodifiableSet((Set)this.groupEvents.get(groupId));
/*      */   }
/*      */ 
/*      */   public void removeDisabledSystemEvent(String eventID)
/*      */   {
/*  830 */     synchronized (this.disabledSystemEvents)
/*      */     {
/*  832 */       this.disabledSystemEvents.remove(eventID);
/*      */     }
/*      */   }
/*      */ 
/*      */   public void removeRoom(int roomId)
/*      */   {
/*  842 */     this.roomManager.removeRoom(roomId);
/*      */   }
/*      */ 
/*      */   public void removeRoom(String name)
/*      */   {
/*  851 */     this.roomManager.removeRoom(name);
/*      */   }
/*      */ 
/*      */   public void removeRoom(Room room)
/*      */   {
/*  860 */     this.roomManager.removeRoom(room);
/*      */   }
/*      */ 
/*      */   public void checkAndRemove(Room room)
/*      */   {
/*  866 */     this.roomManager.checkAndRemove(room);
/*      */   }
/*      */ 
/*      */   public void removeUserFromRoom(User user, Room room)
/*      */   {
/*  875 */     this.roomManager.removeUser(user, room);
/*      */   }
/*      */ 
/*      */   public int getMinRoomNameChars()
/*      */   {
/*  884 */     return this.minRoomNameChars;
/*      */   }
/*      */ 
/*      */   public void setMinRoomNameChars(int minRoomNameChars)
/*      */   {
/*  893 */     this.minRoomNameChars = minRoomNameChars;
/*      */   }
/*      */ 
/*      */   public int getMaxRoomNameChars()
/*      */   {
/*  902 */     return this.maxRoomNameChars;
/*      */   }
/*      */ 
/*      */   public void setMaxRoomNameChars(int maxRoomNameChars)
/*      */   {
/*  911 */     this.maxRoomNameChars = maxRoomNameChars;
/*      */   }
/*      */ 
/*      */   public void setActive(boolean flag)
/*      */   {
/*  922 */     if ((!flag) && (this.isActive))
/*      */     {
/*  924 */       removeAllUsers();
/*      */     }
/*      */ 
/*  927 */     this.isActive = flag;
/*      */   }
/*      */ 
/*      */   public void setId(int id)
/*      */   {
/*  933 */     if (this.id != -1) {
/*  934 */       throw new IllegalStateException("ID is already assigned = " + this.id);
/*      */     }
/*  936 */     this.id = id;
/*      */   }
/*      */ 
/*      */   /** @deprecated */
/*      */   public void setClientAllowedToOverridRoomEvents(boolean flag)
/*      */   {
/*  943 */     this.clientAllowedToOverridRoomEvents = flag;
/*      */   }
/*      */ 
/*      */   public void setCustomLogin(boolean flag)
/*      */   {
/*  949 */     this.customLogin = flag;
/*      */   }
/*      */ 
/*      */   public void setForceLogout(boolean flag)
/*      */   {
/*  955 */     this.forceLogout = flag;
/*      */   }
/*      */ 
/*      */   public void setGuestUserAllowed(boolean flag)
/*      */   {
/*  964 */     this.guestUserAllowed = flag;
/*      */   }
/*      */ 
/*      */   public void setFilterUserNames(boolean flag)
/*      */   {
/*  973 */     this.filterUserNames = flag;
/*      */   }
/*      */ 
/*      */   public void setGuestUserNamePrefix(String prefix)
/*      */   {
/*  982 */     this.guestUserNamePrefix = prefix;
/*      */   }
/*      */ 
/*      */   public void setMaxAllowedRooms(int max)
/*      */   {
/*  991 */     if (max < 0) {
/*  992 */       throw new SFSRuntimeException("Negative values are not acceptable for Zone.maxAllowedRooms: " + max);
/*      */     }
/*  994 */     this.maxAllowedRooms = max;
/*      */   }
/*      */ 
/*      */   public void setMaxAllowedUsers(int max)
/*      */   {
/* 1001 */     if (max < 0) {
/* 1002 */       throw new SFSRuntimeException("Negative values are not acceptable for Zone.maxAllowedUsers: " + max);
/*      */     }
/*      */ 
/* 1005 */     this.maxAllowedUsers = ((max > 943) && (B) ? 943 : max);
/*      */   }
/*      */ 
/*      */   public void setMaxUserVariablesAllowed(int max)
/*      */   {
/* 1014 */     if (max < 0) {
/* 1015 */       throw new SFSRuntimeException("Negative values are not acceptable for Zone.maxAllowedUserVariables: " + max);
/*      */     }
/* 1017 */     this.maxAllowedUserVariables = max;
/*      */   }
/*      */ 
/*      */   public void setMaxRoomsCreatedPerUserLimit(int max)
/*      */   {
/* 1024 */     if (max < 0) {
/* 1025 */       throw new SFSRuntimeException("Negative values are not acceptable for Zone.maxRoomsCreatedPerUser: " + max);
/*      */     }
/* 1027 */     this.maxRoomsCreatedPerUser = max;
/*      */   }
/*      */ 
/*      */   public void setProperty(Object key, Object value)
/*      */   {
/* 1034 */     this.properties.put(key, value);
/*      */   }
/*      */ 
/*      */   public void setPublicGroups(List<String> groupIDs)
/*      */   {
/* 1041 */     this.publicGroups = groupIDs;
/*      */   }
/*      */ 
/*      */   public void setDefaultGroups(List<String> groupIDs)
/*      */   {
/* 1048 */     this.defaultGroups = groupIDs;
/*      */   }
/*      */ 
/*      */   public void setUserCountChangeUpdateInterval(int interval)
/*      */   {
/* 1055 */     if (interval < 0) {
/* 1056 */       throw new SFSRuntimeException("Negative values are not acceptable for Zone.userCountChangeUpdateInterval: " + interval);
/*      */     }
/*      */ 
/* 1059 */     synchronized (this)
/*      */     {
/* 1061 */       this.userCountChangeUpdateInterval = interval;
/*      */     }
/*      */ 
/* 1064 */     if (this.uCountResponseThrottler == null)
/* 1065 */       this.uCountResponseThrottler = new UserCountChangeResponseThrottler(this.userCountChangeUpdateInterval, this.name);
/*      */     else
/* 1067 */       this.uCountResponseThrottler.setInterval(this.userCountChangeUpdateInterval);
/*      */   }
/*      */ 
/*      */   public void setZoneManager(IZoneManager manager)
/*      */   {
/* 1074 */     this.zoneManager = manager;
/*      */   }
/*      */ 
/*      */   public void validateUserName(String name)
/*      */     throws SFSException
/*      */   {
/* 1081 */     if (this.userManager.containsName(name))
/* 1082 */       throw new SFSException("User name is already taken: " + name);
/*      */   }
/*      */ 
/*      */   public IFloodFilter getFloodFilter()
/*      */   {
/* 1089 */     return this.floodFilter;
/*      */   }
/*      */ 
/*      */   public IWordFilter getWordFilter()
/*      */   {
/* 1096 */     return this.wordFilter;
/*      */   }
/*      */ 
/*      */   public void removeAllUsers()
/*      */   {
/* 1105 */     for (User user : this.userManager.getAllUsers())
/* 1106 */       removeUser(user);
/*      */   }
/*      */ 
/*      */   public void removeUser(int userId)
/*      */   {
/* 1113 */     User user = this.userManager.getUserById(userId);
/*      */ 
/* 1115 */     if (user == null)
/* 1116 */       this.logger.info("Can't remove user with Id: " + userId + ". User doesn't exist in Zone: " + this.name);
/*      */     else
/* 1118 */       removeUser(user);
/*      */   }
/*      */ 
/*      */   public void removeUser(ISession session)
/*      */   {
/* 1126 */     User user = this.userManager.getUserBySession(session);
/*      */ 
/* 1128 */     if (user == null)
/* 1129 */       this.logger.info("Can't remove user with Session: " + session + ". User doesn't exist in Zone: " + this.name);
/*      */     else
/* 1131 */       removeUser(user);
/*      */   }
/*      */ 
/*      */   public void removeUser(String userName)
/*      */   {
/* 1138 */     User user = this.userManager.getUserByName(userName);
/*      */ 
/* 1140 */     if (user == null)
/* 1141 */       this.logger.info("Can't remove user with Name: " + userName + ". User doesn't exist in Zone: " + this.name);
/*      */     else
/* 1143 */       removeUser(user);
/*      */   }
/*      */ 
/*      */   public void removeUser(User user)
/*      */   {
/* 1151 */     this.userManager.disconnectUser(user);
/*      */ 
/* 1154 */     this.roomManager.removeUser(user);
/*      */ 
/* 1156 */     this.logger.info("User: " + user.getName() + " was disconnected.");
/*      */   }
/*      */ 
/*      */   public int getMaxRoomVariablesAllowed()
/*      */   {
/* 1163 */     return this.maxAllowedRoomVariables;
/*      */   }
/*      */ 
/*      */   public void setMaxRoomVariablesAllowed(int max)
/*      */   {
/* 1170 */     this.maxAllowedRoomVariables = max;
/*      */   }
/*      */ 
/*      */   public PrivilegeManager getPrivilegeManager()
/*      */   {
/* 1177 */     return this.privilegeManager;
/*      */   }
/*      */ 
/*      */   public void setPrivilegeManager(PrivilegeManager privilegeManager)
/*      */   {
/* 1184 */     if (this.privilegeManager != null) {
/* 1185 */       throw new SFSRuntimeException("Cannot re-assign the PrivilegeManager in this Zone: " + this.name);
/*      */     }
/* 1187 */     this.privilegeManager = privilegeManager;
/*      */   }
/*      */ 
/*      */   public BuddyListManager getBuddyListManager()
/*      */   {
/* 1194 */     return this.buddyListManager;
/*      */   }
/*      */ 
/*      */   public void setBuddyListManager(BuddyListManager buddyListManager)
/*      */   {
/* 1201 */     if (this.buddyListManager != null) {
/* 1202 */       throw new SFSRuntimeException("Cannot re-assign the BuddListManager in this Zone: " + this.name);
/*      */     }
/* 1204 */     this.buddyListManager = buddyListManager;
/*      */   }
/*      */ 
/*      */   public IDBManager getDBManager()
/*      */   {
/* 1211 */     return this.dbManager;
/*      */   }
/*      */ 
/*      */   public void setDBManager(IDBManager manager)
/*      */   {
/* 1217 */     if (this.dbManager != null) {
/* 1218 */       throw new SFSRuntimeException("Cannot re-assign the DBManager in this Zone: " + this.name);
/*      */     }
/* 1220 */     this.dbManager = manager;
/*      */   }
/*      */ 
/*      */   public boolean isFilterPrivateMessages()
/*      */   {
/* 1227 */     return this.filterPrivateMessages;
/*      */   }
/*      */ 
/*      */   public void setFilterPrivateMessages(boolean flag)
/*      */   {
/* 1234 */     this.filterPrivateMessages = flag;
/*      */   }
/*      */ 
/*      */   public User login(ISession session, String userName, String password)
/*      */     throws SFSLoginException
/*      */   {
/* 1241 */     return login(session, userName, password, false);
/*      */   }
/*      */ 
/*      */   public User login(ISession session, String userName, String password, boolean forceLogout)
/*      */     throws SFSLoginException
/*      */   {
/* 1248 */     boolean isEmptyName = userName.length() == 0;
/*      */ 
/* 1251 */     if (!isActive())
/*      */     {
/* 1253 */       SFSErrorData errorData = new SFSErrorData(SFSErrorCode.LOGIN_INACTIVE_ZONE);
/* 1254 */       errorData.addParameter(getName());
/*      */ 
/* 1256 */       throw new SFSLoginException("Zone: " + getName() + " is not active!", errorData);
/*      */     }
/*      */ 
/* 1260 */     if ((forceLogout) && (isForceLogout())) {
/* 1261 */       applyForceLogin(userName);
/*      */     }
/*      */ 
/* 1264 */     if (getUserCount() >= this.maxAllowedUsers)
/*      */     {
/* 1266 */       SFSErrorData errorData = new SFSErrorData(SFSErrorCode.LOGIN_ZONE_FULL);
/* 1267 */       errorData.addParameter(getName());
/*      */ 
/* 1269 */       throw new SFSLoginException("The Zone is full, can't login user: " + userName, errorData);
/*      */     }
/*      */ 
/*      */     try
/*      */     {
/* 1275 */       this.sfs.getLSManager().execute("join", session);
/*      */     }
/*      */     catch (SFSException se)
/*      */     {
/* 1280 */       throw ((SFSLoginException)se);
/*      */     }
/*      */ 
/* 1284 */     if ((!isGuestUserAllowed()) && (isEmptyName))
/*      */     {
/* 1286 */       SFSErrorData errorData = new SFSErrorData(SFSErrorCode.LOGIN_GUEST_NOT_ALLOWED);
/* 1287 */       errorData.addParameter(getName());
/*      */ 
/* 1289 */       throw new SFSLoginException("Guest users are not allowed in Zone: " + getName(), errorData);
/*      */     }
/*      */ 
/* 1294 */     if ((!isEmptyName) && (getUserByName(userName) != null))
/*      */     {
/* 1296 */       SFSErrorData errorData = new SFSErrorData(SFSErrorCode.LOGIN_ALREADY_LOGGED);
/* 1297 */       errorData.setParams(Arrays.asList(new String[] { userName, getName() }));
/*      */ 
/* 1299 */       throw new SFSLoginException("Another user is already logged with the same name: " + userName, errorData);
/*      */     }
/*      */ 
/* 1303 */     if ((!isEmptyName) && (this.sfs.getBannedUserManager().isNameBanned(userName, getName())))
/*      */     {
/* 1305 */       SFSErrorData errorData = new SFSErrorData(SFSErrorCode.LOGIN_BANNED_USER);
/* 1306 */       errorData.addParameter(userName);
/*      */ 
/* 1308 */       throw new SFSLoginException("This user name is banned: " + userName, errorData);
/*      */     }
/*      */ 
/* 1312 */     if (this.sfs.getBannedUserManager().isIpBanned(session.getAddress()))
/*      */     {
/* 1314 */       SFSErrorData errorData = new SFSErrorData(SFSErrorCode.LOGIN_BANNED_IP);
/* 1315 */       errorData.addParameter(session.getAddress());
/*      */ 
/* 1317 */       throw new SFSLoginException("This IP address is banned: " + userName, errorData);
/*      */     }
/*      */ 
/* 1321 */     boolean applyWordFilter = getWordFilter().isActive();
/* 1322 */     applyWordFilter &= isFilterUserNames();
/* 1323 */     applyWordFilter &= getWordFilter().getFilterMode() == WordsFilterMode.BLACK_LIST;
/* 1324 */     applyWordFilter &= !isEmptyName;
/*      */ 
/* 1326 */     if (applyWordFilter)
/*      */     {
/* 1328 */       FilteredMessage filteredName = getWordFilter().apply(userName);
/*      */ 
/* 1330 */       if (filteredName.getOccurrences() > 0)
/*      */       {
/* 1332 */         SFSErrorData errorData = new SFSErrorData(SFSErrorCode.LOGIN_NAME_CONTAINS_BAD_WORDS);
/* 1333 */         errorData.setParams(Arrays.asList(new String[] { userName, filteredName.getMessage() }));
/*      */ 
/* 1335 */         throw new SFSLoginException("User name: " + userName + " contains bad words.", errorData);
/*      */       }
/*      */     }
/*      */ 
/* 1339 */     User user = defaultLogin(session, userName, password);
/*      */ 
/* 1342 */     user.setMaxAllowedVariables(this.maxAllowedUserVariables);
/* 1343 */     user.setLastLoginTime(System.currentTimeMillis());
/* 1344 */     user.setReconnectionSeconds(this.userReconnectionSeconds);
/*      */ 
/* 1347 */     if (this.maxUserIdleTime > 0) {
/* 1348 */       user.getSession().setMaxLoggedInIdleTime(this.maxUserIdleTime);
/*      */     }
/*      */ 
/* 1351 */     manageNewUser(user);
/*      */ 
/* 1354 */     registerUserInterests(user);
/*      */ 
/* 1357 */     setupBuddyProperties(user);
/*      */ 
/* 1359 */     return user;
/*      */   }
/*      */ 
/*      */   public ISFSArray getRoomListData()
/*      */   {
/* 1364 */     return getRoomListData(this.defaultGroups);
/*      */   }
/*      */ 
/*      */   public ISFSArray getRoomListData(List<String> groupIds)
/*      */   {
/* 1370 */     ISFSArray roomList = SFSArray.newInstance();
/*      */ 
/* 1372 */     if (groupIds.size() > 0)
/*      */     {
/* 1375 */       for (String groupId : groupIds)
/*      */       {
/* 1377 */         List roomsInGroup = getRoomListFromGroup(groupId);
/*      */ 
/* 1380 */         if (roomsInGroup == null)
/*      */           continue;
/* 1382 */         for (Room room : roomsInGroup)
/*      */         {
/* 1385 */           roomList.addSFSArray(room.toSFSArray(true));
/*      */         }
/*      */       }
/*      */ 
/*      */     }
/*      */ 
/* 1391 */     return roomList;
/*      */   }
/*      */ 
/*      */   public String toString()
/*      */   {
/* 1397 */     return "{ Zone: " + this.name + " }";
/*      */   }
/*      */ 
/*      */   public String getDump()
/*      */   {
/* 1403 */     throw new UnsupportedOperationException("Sorry, not implemented yet!");
/*      */   }
/*      */ 
/*      */   public IAdminHelper getAdminHelper()
/*      */   {
/* 1408 */     return this.adminHelper;
/*      */   }
/*      */ 
/*      */   public void setAdminHelper(IAdminHelper adminHelper)
/*      */   {
/* 1413 */     this.adminHelper = adminHelper;
/*      */   }
/*      */ 
/*      */   private User defaultLogin(ISession session, String userName, String password)
/*      */   {
/* 1421 */     User user = new SFSUser(session);
/*      */ 
/* 1424 */     if (userName.length() == 0) {
/* 1425 */       userName = getGuestUserNamePrefix() + user.getId();
/*      */     }
/*      */ 
/* 1428 */     user.setName(userName);
/*      */ 
/* 1431 */     user.setZone(this);
/*      */ 
/* 1433 */     return user;
/*      */   }
/*      */ 
/*      */   private void applyForceLogin(String userName)
/*      */   {
/* 1443 */     User oldUser = getUserByName(userName);
/*      */ 
/* 1446 */     if (oldUser == null) {
/* 1447 */       return;
/*      */     }
/*      */ 
/* 1450 */     oldUser.getSession().setReconnectionSeconds(0);
/*      */ 
/* 1452 */     this.logger.info("User already logged in. Disconnecting previous instance : " + oldUser);
/* 1453 */     this.sfs.getAPIManager().getSFSApi().disconnectUser(oldUser);
/*      */   }
/*      */ 
/*      */   private void manageNewUser(User user)
/*      */   {
/* 1463 */     this.userManager.addUser(user);
/*      */ 
/* 1466 */     this.sfs.getUserManager().addUser(user);
/*      */   }
/*      */ 
/*      */   private void registerUserInterests(User user)
/*      */   {
/* 1478 */     if (this.defaultGroups.size() > 0)
/*      */     {
/* 1480 */       for (String groupId : this.defaultGroups)
/*      */       {
/* 1482 */         user.subscribeGroup(groupId);
/*      */       }
/*      */     }
/*      */   }
/*      */ 
/*      */   private void setupBuddyProperties(User user)
/*      */   {
/* 1493 */     if (this.buddyListManager.isActive())
/*      */     {
/* 1496 */       List bvars = this.buddyListManager.getOfflineBuddyVariables(user.getName(), true);
/*      */ 
/* 1498 */       if (bvars != null)
/* 1499 */         user.getBuddyProperties().setVariables(bvars);
/*      */     }
/*      */   }
/*      */ 
/*      */   private void populateTransientFields()
/*      */   {
/* 1509 */     this.sfs = SmartFoxServer.getInstance();
/* 1510 */     this.logger = LoggerFactory.getLogger(getClass());
/* 1511 */     this.wordFilter = new SFSWordFilter(this.sfs.getBannedUserManager());
/*      */ 
/* 1514 */     this.floodFilter = null;
/*      */ 
/* 1516 */     this.uCountResponseThrottler = new UserCountChangeResponseThrottler(this.userCountChangeUpdateInterval, this.name);
/*      */   }
/*      */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.SFSZone
 * JD-Core Version:    0.6.0
 */