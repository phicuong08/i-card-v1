/*     */ package com.smartfoxserver.v2.config;
/*     */ 
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.db.DBConfig;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Arrays;
/*     */ import java.util.Collections;
/*     */ import java.util.List;
/*     */ import java.util.concurrent.atomic.AtomicInteger;
/*     */ import org.apache.commons.lang.StringUtils;
/*     */ 
/*     */ public class ZoneSettings
/*     */ {
/*  18 */   private static final AtomicInteger idGenerator = new AtomicInteger();
/*     */   private transient Integer id;
/*  21 */   public String name = "";
/*  22 */   public boolean isCustomLogin = false;
/*  23 */   public boolean isForceLogout = true;
/*  24 */   public boolean isFilterUserNames = true;
/*  25 */   public boolean isFilterRoomNames = true;
/*  26 */   public boolean isFilterPrivateMessages = true;
/*  27 */   public boolean isFilterBuddyMessages = true;
/*  28 */   public int maxUsers = 1000;
/*  29 */   public int maxUserVariablesAllowed = 5;
/*  30 */   public int maxRoomVariablesAllowed = 5;
/*  31 */   public int minRoomNameChars = 3;
/*  32 */   public int maxRoomNameChars = 10;
/*  33 */   public int maxRooms = 500;
/*  34 */   public int maxRoomsCreatedPerUser = 3;
/*  35 */   public int userCountChangeUpdateInterval = 1000;
/*  36 */   public int userReconnectionSeconds = 0;
/*  37 */   public int overrideMaxUserIdleTime = 120;
/*     */ 
/*  39 */   public boolean allowGuestUsers = true;
/*  40 */   public String guestUserNamePrefix = "Guest#";
/*  41 */   public String publicRoomGroups = "default";
/*  42 */   public String defaultRoomGroups = "default";
/*  43 */   public String defaultPlayerIdGeneratorClass = "";
/*     */   public WordFilterSettings wordsFilter;
/*     */   public FloodFilterSettings floodFilter;
/*     */   public List<RoomSettings> rooms;
/*     */   public List<String> disabledSystemEvents;
/*     */   public PrivilegeManagerSettings privilegeManager;
/*     */   public ExtensionSettings extension;
/*     */   public BuddyListSettings buddyList;
/*     */   public DBConfig databaseManager;
/*     */   public static final String DENIABLE_REQUESTS = "JoinRoom,CreateRoom,ChangeRoomName,ChangeRoomPassword,ObjectMessage,SetRoomVariables,SetUserVariables,LeaveRoom,SubscribeRoomGroup,UnsubscribeRoomGroup,SpectatorToPlayer,PlayerToSpectator,ChangeRoomCapacity,PublicMessage,PrivateMessage,FindRooms,FindUsers,InitBuddyList,AddBuddy,BlockBuddy,RemoveBuddy,SetBuddyVariables,GoOnline,BuddyMessage,InviteUser,InvitationReply,CreateSFSGame,QuickJoinGame";
/*  56 */   public static final String DB_EXHAUSTED_POOL_MODES = String.format("%s,%s,%s", new Object[] { "BLOCK", "FAIL", "GROW" });
/*     */ 
/*     */   public ZoneSettings()
/*     */   {
/*  60 */     getId();
/*     */   }
/*     */ 
/*     */   public ZoneSettings(String name)
/*     */   {
/*  69 */     this();
/*  70 */     this.name = name;
/*     */ 
/*  72 */     this.wordsFilter = new WordFilterSettings();
/*  73 */     this.floodFilter = new FloodFilterSettings();
/*     */ 
/*  75 */     this.rooms = new ArrayList();
/*  76 */     this.disabledSystemEvents = new ArrayList();
/*  77 */     this.buddyList = new BuddyListSettings();
/*     */ 
/*  80 */     this.privilegeManager = new PrivilegeManagerSettings();
/*  81 */     this.privilegeManager.profiles = new ArrayList();
/*  82 */     setupDefaultPrivileges();
/*     */ 
/*  85 */     this.extension = new ExtensionSettings();
/*  86 */     this.databaseManager = new DBConfig();
/*     */   }
/*     */ 
/*     */   private void setupDefaultPrivileges()
/*     */   {
/*  95 */     PermissionProfile guestProfile = new PermissionProfile();
/*  96 */     guestProfile.id = 0;
/*  97 */     guestProfile.name = "Guest";
/*  98 */     guestProfile.permissionFlags = new ArrayList();
/*  99 */     guestProfile.deniedRequests = Arrays.asList(new String[] { 
/* 101 */       "CreateRoom", 
/* 102 */       "PrivateMessage", 
/* 103 */       "SetRoomVariables", 
/* 104 */       "SetUserVariables", 
/* 105 */       "ChangeRoomName", 
/* 106 */       "ChangeRoomPassword", 
/* 107 */       "ChangeRoomCapacity", 
/* 108 */       "InitBuddyList", 
/* 109 */       "AddBuddy", 
/* 110 */       "BlockBuddy", 
/* 111 */       "RemoveBuddy", 
/* 112 */       "SetBuddyVariables", 
/* 113 */       "GoOnline", 
/* 114 */       "BuddyMessage", 
/* 115 */       "ModeratorMessage", 
/* 116 */       "AdminMessage", 
/* 117 */       "KickUser", 
/* 118 */       "BanUser" });
/*     */ 
/* 122 */     PermissionProfile regularProfile = new PermissionProfile();
/* 123 */     regularProfile.id = 1;
/* 124 */     regularProfile.name = "Standard";
/* 125 */     regularProfile.permissionFlags = new ArrayList();
/* 126 */     regularProfile.deniedRequests = Arrays.asList(new String[] { 
/* 128 */       "ModeratorMessage", 
/* 129 */       "AdminMessage", 
/* 130 */       "KickUser", 
/* 131 */       "BanUser" });
/*     */ 
/* 133 */     regularProfile.permissionFlags = Arrays.asList(new String[] { "ExtensionCalls" });
/*     */ 
/* 136 */     PermissionProfile modProfile = new PermissionProfile();
/* 137 */     modProfile.id = 2;
/* 138 */     modProfile.name = "Moderator";
/* 139 */     modProfile.deniedRequests = Arrays.asList(new String[] { "AdminMessage" });
/* 140 */     modProfile.permissionFlags = Arrays.asList(new String[] { "ExtensionCalls", "SuperUser" });
/*     */ 
/* 143 */     PermissionProfile adminProfile = new PermissionProfile();
/* 144 */     adminProfile.id = 3;
/* 145 */     adminProfile.name = "Administrator";
/* 146 */     adminProfile.deniedRequests = new ArrayList();
/* 147 */     adminProfile.permissionFlags = Arrays.asList(new String[] { "ExtensionCalls", "SuperUser" });
/*     */ 
/* 149 */     this.privilegeManager.profiles = Arrays.asList(new PermissionProfile[] { guestProfile, regularProfile, modProfile, adminProfile });
/*     */   }
/*     */ 
/*     */   public String getDeniableRequests()
/*     */   {
/* 154 */     return "JoinRoom,CreateRoom,ChangeRoomName,ChangeRoomPassword,ObjectMessage,SetRoomVariables,SetUserVariables,LeaveRoom,SubscribeRoomGroup,UnsubscribeRoomGroup,SpectatorToPlayer,PlayerToSpectator,ChangeRoomCapacity,PublicMessage,PrivateMessage,FindRooms,FindUsers,InitBuddyList,AddBuddy,BlockBuddy,RemoveBuddy,SetBuddyVariables,GoOnline,BuddyMessage,InviteUser,InvitationReply,CreateSFSGame,QuickJoinGame";
/*     */   }
/*     */ 
/*     */   public synchronized int getId()
/*     */   {
/* 159 */     if (this.id == null) {
/* 160 */       this.id = Integer.valueOf(setUniqueId());
/*     */     }
/* 162 */     return this.id.intValue();
/*     */   }
/*     */ 
/*     */   public synchronized RoomSettings getRoomSettings(int id)
/*     */   {
/* 167 */     if (this.rooms == null) {
/* 168 */       throw new IllegalStateException("No Room configuration has been loaded yet!");
/*     */     }
/* 170 */     RoomSettings settings = null;
/*     */ 
/* 172 */     for (RoomSettings item : this.rooms)
/*     */     {
/* 174 */       if (item.getId() != id)
/*     */         continue;
/* 176 */       settings = item;
/* 177 */       break;
/*     */     }
/*     */ 
/* 181 */     return settings;
/*     */   }
/*     */ 
/*     */   public synchronized RoomSettings getRoomSettings(String name)
/*     */   {
/* 186 */     if (this.rooms == null) {
/* 187 */       throw new IllegalStateException("No Room configuration has been loaded yet!");
/*     */     }
/* 189 */     RoomSettings settings = null;
/*     */ 
/* 191 */     for (RoomSettings item : this.rooms)
/*     */     {
/* 193 */       if (!item.name.equals(name))
/*     */         continue;
/* 195 */       settings = item;
/* 196 */       break;
/*     */     }
/*     */ 
/* 200 */     return settings;
/*     */   }
/*     */ 
/*     */   public synchronized void addRoomSettings(RoomSettings settings)
/*     */   {
/* 205 */     if (getRoomSettings(settings.name) != null) {
/* 206 */       throw new IllegalArgumentException("A room with the same name already exists: " + settings.name);
/*     */     }
/* 208 */     this.rooms.add(settings);
/*     */   }
/*     */ 
/*     */   public synchronized void removeRoomSetting(RoomSettings settings)
/*     */   {
/* 213 */     this.rooms.remove(settings);
/*     */   }
/*     */ 
/*     */   public ISFSObject toSFSObject()
/*     */   {
/* 494 */     ISFSObject sfsObj = SFSObject.newInstance();
/*     */ 
/* 496 */     return sfsObj;
/*     */   }
/*     */ 
/*     */   public static ZoneSettings fromSFSObject(ISFSObject sfsObj)
/*     */   {
/* 501 */     ZoneSettings settings = new ZoneSettings();
/*     */ 
/* 503 */     return settings;
/*     */   }
/*     */ 
/*     */   private static int setUniqueId()
/*     */   {
/* 510 */     return idGenerator.getAndIncrement();
/*     */   }
/*     */ 
/*     */   public static final class BadWordsFilterSettings
/*     */   {
/* 396 */     public boolean isActive = false;
/*     */   }
/*     */ 
/*     */   public static final class BuddyListSettings
/*     */   {
/* 478 */     public boolean active = false;
/* 479 */     public boolean allowOfflineBuddyVariables = true;
/* 480 */     public int maxItemsPerList = 100;
/* 481 */     public int maxBuddyVariables = 15;
/* 482 */     public int offlineBuddyVariablesCacheSize = 500;
/* 483 */     public String customStorageClass = "";
/* 484 */     public boolean useTempBuddies = true;
/*     */ 
/* 486 */     public List<String> buddyStates = Arrays.asList(new String[] { "Available", "Away", "Occupied" });
/* 487 */     public ZoneSettings.BadWordsFilterSettings badWordsFilter = new ZoneSettings.BadWordsFilterSettings();
/*     */   }
/*     */ 
/*     */   public static final class ExtensionSettings
/*     */   {
/* 469 */     public String name = "";
/* 470 */     public String type = "JAVA";
/* 471 */     public String file = "";
/* 472 */     public String propertiesFile = "";
/* 473 */     public String reloadMode = "AUTO";
/*     */   }
/*     */ 
/*     */   public static final class FloodFilterSettings
/*     */   {
/* 243 */     private static String REQUEST_LIST = null;
/*     */ 
/* 245 */     public boolean isActive = false;
/* 246 */     public int banDurationMinutes = 1440;
/* 247 */     public int maxFloodingAttempts = 5;
/* 248 */     public int secondsBeforeBan = 5;
/* 249 */     public String banMode = "NAME";
/* 250 */     public boolean logFloodingAttempts = true;
/* 251 */     public String banMessage = "Too much flooding, you are banned";
/*     */     public List<ZoneSettings.RequestFilterSettings> requestFilters;
/*     */ 
/*     */     public String getRequestsList()
/*     */     {
/* 256 */       if (REQUEST_LIST == null) {
/* 257 */         createRequestList();
/*     */       }
/* 259 */       return REQUEST_LIST;
/*     */     }
/*     */ 
/*     */     private void createRequestList()
/*     */     {
/* 264 */       List names = new ArrayList();
/* 265 */       for (SystemRequest item : SystemRequest.values())
/*     */       {
/* 267 */         if (((Short)item.getId()).shortValue() < 1000) {
/* 268 */           names.add(item.toString());
/*     */         }
/*     */       }
/* 271 */       Collections.sort(names);
/*     */ 
/* 273 */       REQUEST_LIST = "";
/* 274 */       for (String name : names)
/*     */       {
/* 276 */         REQUEST_LIST = REQUEST_LIST + name + ",";
/*     */       }
/*     */ 
/* 279 */       REQUEST_LIST = REQUEST_LIST.substring(0, REQUEST_LIST.length() - 1);
/*     */     }
/*     */   }
/*     */   public static final class PermissionProfile {
/* 420 */     public short id = -1;
/* 421 */     public String name = "";
/*     */     public List<String> deniedRequests;
/*     */     public List<String> permissionFlags;
/*     */ 
/*     */     public String getDeniedRequestsString() {
/* 427 */       return StringUtils.join(this.deniedRequests, ",");
/*     */     }
/*     */ 
/*     */     public void setDeniedRequestsString(Object stringList)
/*     */     {
/* 432 */       String list = stringList.toString();
/*     */ 
/* 434 */       if (list.length() > 0)
/* 435 */         this.deniedRequests = Arrays.asList(list.toString().split("\\,"));
/*     */       else
/* 437 */         this.deniedRequests = new ArrayList();
/*     */     }
/*     */ 
/*     */     public String getPermissionFlagsString()
/*     */     {
/* 442 */       return StringUtils.join(this.permissionFlags, ",");
/*     */     }
/*     */ 
/*     */     public void setPermissionFlagsString(Object stringList)
/*     */     {
/* 447 */       String list = stringList.toString();
/*     */ 
/* 449 */       if (list.length() > 0)
/* 450 */         this.permissionFlags = Arrays.asList(list.split("\\,"));
/*     */       else
/* 452 */         this.permissionFlags = new ArrayList();
/*     */     }
/*     */ 
/*     */     public int getIntId()
/*     */     {
/* 458 */       return this.id;
/*     */     }
/*     */ 
/*     */     public void setIntId(Object id)
/*     */     {
/* 463 */       this.id = ((Integer)id).shortValue();
/*     */     }
/*     */   }
/*     */ 
/*     */   public static final class PrivilegeManagerSettings
/*     */   {
/* 414 */     public boolean active = false;
/*     */     public List<ZoneSettings.PermissionProfile> profiles;
/*     */   }
/*     */ 
/*     */   public static final class RegisteredRoomEvents
/*     */   {
/* 303 */     public String groupId = "";
/* 304 */     public boolean roomNameChange = false;
/* 305 */     public boolean roomCapacityChange = false;
/* 306 */     public boolean userCountChange = true;
/* 307 */     public boolean roomVariablesUpdate = true;
/* 308 */     public boolean passwordStatusChange = false;
/*     */   }
/*     */ 
/*     */   public static final class RequestFilterSettings
/*     */   {
/*     */     public String reqName;
/*     */     public int maxRequestsPerSecond;
/*     */   }
/*     */ 
/*     */   public static final class RoomEventsSettings
/*     */   {
/* 297 */     public boolean isClientOverrideAllowed = true;
/* 298 */     public String registeredEvents = "ROOM_NAME_CHANGE,PASSWORD_STATE_CHANGE,USER_COUNT_CHANGE,ROOM_VARIABLES_UPDATE";
/*     */   }
/*     */ 
/*     */   public static final class RoomPermissions
/*     */   {
/*     */     public static final String FLAGS = "ROOM_NAME_CHANGE,PASSWORD_STATE_CHANGE,PUBLIC_MESSAGES,CAPACITY_CHANGE";
/* 385 */     public String flags = "PASSWORD_STATE_CHANGE,PUBLIC_MESSAGES";
/* 386 */     public int maxRoomVariablesAllowed = 10;
/*     */ 
/*     */     public String getAvailableFlags()
/*     */     {
/* 390 */       return "ROOM_NAME_CHANGE,PASSWORD_STATE_CHANGE,PUBLIC_MESSAGES,CAPACITY_CHANGE";
/*     */     }
/*     */   }
/*     */ 
/*     */   public static final class RoomSettings
/*     */   {
/*     */     public static final String EVENTS = "USER_ENTER_EVENT,USER_EXIT_EVENT,USER_COUNT_CHANGE_EVENT,USER_VARIABLES_UPDATE_EVENT";
/* 315 */     private static final AtomicInteger idGenerator = new AtomicInteger();
/*     */     private transient Integer id;
/* 318 */     public String name = null;
/* 319 */     public String groupId = "default";
/* 320 */     public String password = null;
/* 321 */     public int maxUsers = 20;
/* 322 */     public int maxSpectators = 0;
/*     */ 
/* 324 */     public boolean isDynamic = false;
/* 325 */     public boolean isGame = false;
/* 326 */     public boolean isHidden = false;
/*     */ 
/* 334 */     public String autoRemoveMode = "DEFAULT";
/*     */ 
/* 336 */     public ZoneSettings.RoomPermissions permissions = new ZoneSettings.RoomPermissions();
/* 337 */     public String events = "USER_ENTER_EVENT,USER_EXIT_EVENT,USER_COUNT_CHANGE_EVENT,USER_VARIABLES_UPDATE_EVENT";
/* 338 */     public ZoneSettings.BadWordsFilterSettings badWordsFilter = new ZoneSettings.BadWordsFilterSettings();
/*     */     public List<ZoneSettings.RoomVariableDefinition> roomVariables;
/*     */     public ZoneSettings.ExtensionSettings extension;
/*     */ 
/*     */     public RoomSettings()
/*     */     {
/* 347 */       getId();
/*     */     }
/*     */ 
/*     */     public RoomSettings(String name)
/*     */     {
/* 355 */       this();
/* 356 */       this.name = name;
/* 357 */       this.password = "";
/* 358 */       this.roomVariables = new ArrayList();
/* 359 */       this.extension = new ZoneSettings.ExtensionSettings();
/*     */     }
/*     */ 
/*     */     public int getId()
/*     */     {
/* 364 */       if (this.id == null) {
/* 365 */         this.id = Integer.valueOf(getUniqueId());
/*     */       }
/* 367 */       return this.id.intValue();
/*     */     }
/*     */ 
/*     */     private static int getUniqueId()
/*     */     {
/* 372 */       return idGenerator.getAndIncrement();
/*     */     }
/*     */ 
/*     */     public String getAvailableEvents()
/*     */     {
/* 377 */       return "USER_ENTER_EVENT,USER_EXIT_EVENT,USER_COUNT_CHANGE_EVENT,USER_VARIABLES_UPDATE_EVENT";
/*     */     }
/*     */   }
/*     */ 
/*     */   public static final class RoomVariableDefinition
/*     */   {
/* 401 */     public String name = "";
/* 402 */     public String value = "";
/* 403 */     public String type = "";
/*     */ 
/* 406 */     public boolean isPrivate = false;
/* 407 */     public boolean isPersistent = false;
/* 408 */     public boolean isGlobal = false;
/* 409 */     public boolean isHidden = false;
/*     */   }
/*     */ 
/*     */   public static final class WordFilterSettings
/*     */   {
/* 222 */     public boolean isActive = false;
/* 223 */     public boolean useWarnings = false;
/* 224 */     public int warningsBeforeKick = 3;
/* 225 */     public int kicksBeforeBan = 2;
/* 226 */     public int banDuration = 1440;
/* 227 */     public int maxBadWordsPerMessage = 0;
/* 228 */     public int kicksBeforeBanMinutes = 3;
/* 229 */     public int secondsBeforeBanOrKick = 5;
/* 230 */     public String warningMessage = "Stop swearing or you will be banned";
/* 231 */     public String kickMessage = "Swearing not allowed: you are being kicked";
/* 232 */     public String banMessage = "Too much swearing: you are banned";
/* 233 */     public String wordsFile = "config/wordsFile.txt";
/* 234 */     public String filterMode = "WHITELIST";
/* 235 */     public String banMode = "NAME";
/* 236 */     public String hideBadWordWithCharacter = "*";
/*     */ 
/* 238 */     public String customWordFilterClass = null;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.config.ZoneSettings
 * JD-Core Version:    0.6.0
 */