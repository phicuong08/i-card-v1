/*     */ package com.smartfoxserver.v2.entities.managers;
/*     */ 
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.CreateRoomSettings;
/*     */ import com.smartfoxserver.v2.api.CreateRoomSettings.RoomExtensionSettings;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.config.ZoneSettings.ExtensionSettings;
/*     */ import com.smartfoxserver.v2.core.BaseCoreService;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.SFSRoom;
/*     */ import com.smartfoxserver.v2.entities.SFSRoomSettings;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*     */ import com.smartfoxserver.v2.exceptions.SFSCreateRoomException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorCode;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorData;
/*     */ import com.smartfoxserver.v2.exceptions.SFSExtensionException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRoomException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import com.smartfoxserver.v2.extensions.ExtensionLevel;
/*     */ import com.smartfoxserver.v2.extensions.ExtensionType;
/*     */ import com.smartfoxserver.v2.extensions.ISFSExtension;
/*     */ import com.smartfoxserver.v2.game.CreateSFSGameSettings;
/*     */ import com.smartfoxserver.v2.game.SFSGame;
/*     */ import com.smartfoxserver.v2.util.DefaultPlayerIdGenerator;
/*     */ import com.smartfoxserver.v2.util.IPlayerIdGenerator;
/*     */ import com.smartfoxserver.v2.util.IWordFilter;
/*     */ import com.smartfoxserver.v2.util.filters.FilteredMessage;
/*     */ import com.smartfoxserver.v2.util.filters.WordsFilterMode;
/*     */ import java.util.ArrayList;
/*     */ import java.util.EnumSet;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import java.util.Set;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import org.apache.commons.lang.StringUtils;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public final class SFSRoomManager extends BaseCoreService
/*     */   implements IRoomManager
/*     */ {
/*     */   private final Map<Integer, Room> roomsById;
/*     */   private final Map<String, Room> roomsByName;
/*     */   private final Map<String, List<Room>> roomsByGroup;
/*     */   private final List<String> groups;
/*     */   private Logger logger;
/*     */   private SmartFoxServer sfs;
/*     */   private Zone ownerZone;
/*  54 */   private Class<? extends IPlayerIdGenerator> playerIdGeneratorClass = DefaultPlayerIdGenerator.class;
/*     */ 
/*     */   public SFSRoomManager()
/*     */   {
/*  59 */     this.sfs = SmartFoxServer.getInstance();
/*  60 */     this.logger = LoggerFactory.getLogger(getClass());
/*     */ 
/*  62 */     this.roomsById = new ConcurrentHashMap();
/*  63 */     this.roomsByName = new ConcurrentHashMap();
/*  64 */     this.roomsByGroup = new ConcurrentHashMap();
/*  65 */     this.groups = new ArrayList();
/*     */   }
/*     */ 
/*     */   public Room createRoom(CreateRoomSettings params)
/*     */     throws SFSCreateRoomException
/*     */   {
/*  71 */     return createRoom(params, null);
/*     */   }
/*     */ 
/*     */   public Room createRoom(CreateRoomSettings params, User owner)
/*     */     throws SFSCreateRoomException
/*     */   {
/*  80 */     String roomName = params.getName();
/*     */     try
/*     */     {
/*  88 */       validateRoomName(roomName);
/*     */     }
/*     */     catch (SFSRoomException roomExc)
/*     */     {
/*  92 */       throw new SFSCreateRoomException(roomExc.getMessage(), roomExc.getErrorData());
/*     */     }
/*     */     Room newRoom;
/*  97 */     if ((params instanceof CreateSFSGameSettings))
/*     */     {
/* 100 */       Room newRoom = new SFSGame(roomName);
/*     */ 
/* 103 */       params.setGame(true);
/*     */     }
/*     */     else {
/* 106 */       newRoom = new SFSRoom(roomName);
/*     */     }
/* 108 */     newRoom.setZone(this.ownerZone);
/* 109 */     newRoom.setGroupId(params.getGroupId());
/* 110 */     newRoom.setPassword(params.getPassword());
/* 111 */     newRoom.setDynamic(params.isDynamic());
/* 112 */     newRoom.setHidden(params.isHidden());
/* 113 */     newRoom.setMaxUsers(params.getMaxUsers());
/*     */ 
/* 115 */     if (params.isGame())
/* 116 */       newRoom.setMaxSpectators(params.getMaxSpectators());
/*     */     else {
/* 118 */       newRoom.setMaxSpectators(0);
/*     */     }
/*     */ 
/* 125 */     newRoom.setGame(
/* 127 */       params.isGame(), 
/* 128 */       params.getCustomPlayerIdGeneratorClass() == null ? this.playerIdGeneratorClass : params.getCustomPlayerIdGeneratorClass());
/*     */ 
/* 131 */     newRoom.setMaxRoomVariablesAllowed(params.getMaxVariablesAllowed());
/*     */ 
/* 133 */     if (params.getRoomVariables() != null) {
/* 134 */       newRoom.setVariables(params.getRoomVariables());
/*     */     }
/*     */ 
/* 137 */     Set roomSettings = params.getRoomSettings();
/* 138 */     if (roomSettings == null)
/*     */     {
/* 140 */       roomSettings = EnumSet.of(
/* 142 */         SFSRoomSettings.USER_ENTER_EVENT, 
/* 143 */         SFSRoomSettings.USER_EXIT_EVENT, 
/* 144 */         SFSRoomSettings.USER_COUNT_CHANGE_EVENT, 
/* 145 */         SFSRoomSettings.USER_VARIABLES_UPDATE_EVENT, 
/* 146 */         SFSRoomSettings.PUBLIC_MESSAGES);
/*     */     }
/*     */ 
/* 150 */     newRoom.setUseWordsFilter(params.isUseWordsFilter());
/* 151 */     newRoom.setFlags(roomSettings);
/* 152 */     newRoom.setOwner(owner);
/* 153 */     newRoom.setAutoRemoveMode(params.getAutoRemoveMode());
/*     */ 
/* 156 */     if (this.roomsById.size() >= this.ownerZone.getMaxAllowedRooms())
/*     */     {
/* 158 */       SFSErrorData errorData = new SFSErrorData(SFSErrorCode.CREATE_ROOM_ZONE_FULL);
/* 159 */       throw new SFSCreateRoomException("Zone is full. Can't add any more rooms.", errorData);
/*     */     }
/*     */ 
/* 164 */     if ((params.getExtension() != null) && (params.getExtension().getId() != null) && (params.getExtension().getId().length() > 0))
/*     */     {
/*     */       try
/*     */       {
/* 168 */         createRoomExtension(newRoom, params.getExtension());
/*     */       }
/*     */       catch (SFSExtensionException e)
/*     */       {
/* 172 */         ExceptionMessageComposer message = new ExceptionMessageComposer(e);
/* 173 */         message.setDescription("Failure while creating room extension.");
/* 174 */         message.setPossibleCauses("If the CreateRoom request was sent from client make sure that the extension name matches the name of an existing extension");
/* 175 */         this.logger.warn(message.toString());
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 180 */     addRoom(newRoom);
/*     */ 
/* 183 */     newRoom.setActive(true);
/*     */ 
/* 185 */     return newRoom;
/*     */   }
/*     */ 
/*     */   private void createRoomExtension(Room room, CreateRoomSettings.RoomExtensionSettings params) throws SFSExtensionException
/*     */   {
/* 190 */     if (params == null) {
/* 191 */       return;
/*     */     }
/* 193 */     ExtensionType extType = ExtensionType.JAVA;
/* 194 */     ExtensionLevel extLevel = ExtensionLevel.ROOM;
/*     */ 
/* 196 */     String className = params.getClassName();
/*     */ 
/* 199 */     if (StringUtils.endsWithIgnoreCase(className, ".py")) {
/* 200 */       extType = ExtensionType.PYTHON;
/*     */     }
/* 202 */     ZoneSettings.ExtensionSettings extSettings = new ZoneSettings.ExtensionSettings();
/* 203 */     extSettings.name = params.getId();
/* 204 */     extSettings.file = className;
/* 205 */     extSettings.propertiesFile = params.getPropertiesFile();
/* 206 */     extSettings.reloadMode = "AUTO";
/* 207 */     extSettings.type = extType.toString();
/*     */ 
/* 209 */     this.sfs.getExtensionManager().createExtension(extSettings, extLevel, room.getZone(), room);
/*     */   }
/*     */ 
/*     */   public Class<? extends IPlayerIdGenerator> getDefaultRoomPlayerIdGenerator()
/*     */   {
/* 215 */     return this.playerIdGeneratorClass;
/*     */   }
/*     */ 
/*     */   public void setDefaultRoomPlayerIdGeneratorClass(Class<? extends IPlayerIdGenerator> customIdGeneratorClass)
/*     */   {
/* 221 */     this.playerIdGeneratorClass = customIdGeneratorClass;
/*     */   }
/*     */ 
/*     */   public void addGroup(String groupId)
/*     */   {
/* 227 */     synchronized (this.groups)
/*     */     {
/* 229 */       this.groups.add(groupId);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void addRoom(Room room)
/*     */   {
/* 236 */     this.roomsById.put(Integer.valueOf(room.getId()), room);
/* 237 */     this.roomsByName.put(room.getName(), room);
/*     */ 
/* 240 */     synchronized (this.groups)
/*     */     {
/* 242 */       if (!this.groups.contains(room.getGroupId())) {
/* 243 */         this.groups.add(room.getGroupId());
/*     */       }
/*     */     }
/* 246 */     addRoomToGroup(room);
/*     */   }
/*     */ 
/*     */   public boolean containsGroup(String groupId)
/*     */   {
/* 253 */     boolean flag = false;
/*     */ 
/* 255 */     synchronized (this.groups)
/*     */     {
/* 257 */       flag = this.groups.contains(groupId);
/*     */     }
/*     */ 
/* 260 */     return flag;
/*     */   }
/*     */ 
/*     */   public List<String> getGroups()
/*     */   {
/* 266 */     List groupsCopy = null;
/*     */ 
/* 268 */     synchronized (this.groups)
/*     */     {
/* 270 */       groupsCopy = new ArrayList(this.groups);
/*     */     }
/*     */ 
/* 273 */     return groupsCopy;
/*     */   }
/*     */ 
/*     */   public Room getRoomById(int id)
/*     */   {
/* 279 */     return (Room)this.roomsById.get(Integer.valueOf(id));
/*     */   }
/*     */ 
/*     */   public Room getRoomByName(String name)
/*     */   {
/* 285 */     return (Room)this.roomsByName.get(name);
/*     */   }
/*     */ 
/*     */   public List<Room> getRoomList()
/*     */   {
/* 291 */     return new ArrayList(this.roomsById.values());
/*     */   }
/*     */ 
/*     */   public List<Room> getRoomListFromGroup(String groupId)
/*     */   {
/* 297 */     List roomList = (List)this.roomsByGroup.get(groupId);
/* 298 */     List copyOfRoomList = null;
/*     */ 
/* 300 */     if (roomList != null)
/*     */     {
/* 302 */       synchronized (roomList)
/*     */       {
/* 304 */         copyOfRoomList = new ArrayList(roomList);
/*     */       }
/*     */     }
/*     */ 
/* 308 */     copyOfRoomList = new ArrayList();
/*     */ 
/* 310 */     return copyOfRoomList;
/*     */   }
/*     */ 
/*     */   public void removeGroup(String groupId)
/*     */   {
/* 316 */     synchronized (this.groups)
/*     */     {
/* 318 */       this.groups.remove(groupId);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void removeRoom(int roomId)
/*     */   {
/* 325 */     Room room = (Room)this.roomsById.get(Integer.valueOf(roomId));
/*     */ 
/* 327 */     if (room == null)
/* 328 */       this.logger.warn("Can't remove requested room. ID = " + roomId + ". Room was not found.");
/*     */     else
/* 330 */       removeRoom(room);
/*     */   }
/*     */ 
/*     */   public void removeRoom(String name)
/*     */   {
/* 336 */     Room room = (Room)this.roomsByName.get(name);
/*     */ 
/* 338 */     if (room == null)
/* 339 */       this.logger.warn("Can't remove requested room. Name = " + name + ". Room was not found.");
/*     */     else
/* 341 */       removeRoom(room);
/*     */   }
/*     */ 
/*     */   public void removeRoom(Room room)
/*     */   {
/*     */     try
/*     */     {
/* 350 */       ISFSExtension roomExtension = room.getExtension();
/*     */ 
/* 352 */       if (roomExtension != null) {
/* 353 */         this.sfs.getExtensionManager().destroyExtension(roomExtension);
/*     */       }
/*     */ 
/*     */     }
/*     */     finally
/*     */     {
/* 360 */       room.setActive(false);
/*     */ 
/* 362 */       this.roomsById.remove(Integer.valueOf(room.getId()));
/* 363 */       this.roomsByName.remove(room.getName());
/* 364 */       removeRoomFromGroup(room);
/*     */ 
/* 366 */       this.logger.info("Removed: " + room);
/*     */     }
/*     */   }
/*     */ 
/*     */   public boolean containsRoom(int id, String groupId)
/*     */   {
/* 374 */     Room room = (Room)this.roomsById.get(Integer.valueOf(id));
/* 375 */     return isRoomContainedInGroup(room, groupId);
/*     */   }
/*     */ 
/*     */   public boolean containsRoom(int id)
/*     */   {
/* 381 */     return this.roomsById.containsKey(Integer.valueOf(id));
/*     */   }
/*     */ 
/*     */   public boolean containsRoom(Room room, String groupId)
/*     */   {
/* 387 */     return isRoomContainedInGroup(room, groupId);
/*     */   }
/*     */ 
/*     */   public boolean containsRoom(Room room)
/*     */   {
/* 393 */     return this.roomsById.containsValue(room);
/*     */   }
/*     */ 
/*     */   public boolean containsRoom(String name, String groupId)
/*     */   {
/* 400 */     Room room = (Room)this.roomsByName.get(name);
/* 401 */     return isRoomContainedInGroup(room, groupId);
/*     */   }
/*     */ 
/*     */   public boolean containsRoom(String name)
/*     */   {
/* 407 */     return this.roomsByName.containsKey(name);
/*     */   }
/*     */ 
/*     */   public Zone getOwnerZone()
/*     */   {
/* 413 */     return this.ownerZone;
/*     */   }
/*     */ 
/*     */   public void setOwnerZone(Zone zone)
/*     */   {
/* 419 */     this.ownerZone = zone;
/*     */   }
/*     */ 
/*     */   public void removeUser(User user)
/*     */   {
/* 425 */     for (Room room : user.getJoinedRooms())
/*     */     {
/* 427 */       removeUser(user, room);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void removeUser(User user, Room room)
/*     */   {
/* 434 */     if (room.containsUser(user))
/*     */     {
/* 436 */       room.removeUser(user);
/* 437 */       this.logger.debug("User: " + user.getName() + " removed from Room: " + room.getName());
/*     */ 
/* 439 */       handleAutoRemove(room);
/*     */     }
/*     */     else {
/* 442 */       throw new SFSRuntimeException("Can't remove user: " + user + ", from: " + room);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void checkAndRemove(Room room)
/*     */   {
/* 451 */     handleAutoRemove(room);
/*     */   }
/*     */ 
/*     */   public void changeRoomName(Room room, String newName)
/*     */     throws SFSRoomException
/*     */   {
/* 457 */     if (room == null) {
/* 458 */       throw new IllegalArgumentException("Can't change name. Room is Null!");
/*     */     }
/* 460 */     if (!containsRoom(room)) {
/* 461 */       throw new IllegalArgumentException(room + " is not managed by this Zone: " + this.ownerZone);
/*     */     }
/*     */ 
/* 464 */     validateRoomName(newName);
/*     */ 
/* 466 */     String oldName = room.getName();
/*     */ 
/* 469 */     room.setName(newName);
/*     */ 
/* 476 */     this.roomsByName.put(newName, room);
/* 477 */     this.roomsByName.remove(oldName);
/*     */   }
/*     */ 
/*     */   public void changeRoomPasswordState(Room room, String password)
/*     */   {
/* 483 */     if (room == null) {
/* 484 */       throw new IllegalArgumentException("Can't change password. Room is Null!");
/*     */     }
/* 486 */     if (!containsRoom(room)) {
/* 487 */       throw new IllegalArgumentException(room + " is not managed by this Zone: " + this.ownerZone);
/*     */     }
/* 489 */     room.setPassword(password);
/*     */   }
/*     */ 
/*     */   public void changeRoomCapacity(Room room, int newMaxUsers, int newMaxSpect)
/*     */   {
/* 495 */     if (room == null) {
/* 496 */       throw new IllegalArgumentException("Can't change password. Room is Null!");
/*     */     }
/* 498 */     if (!containsRoom(room)) {
/* 499 */       throw new IllegalArgumentException(room + " is not managed by this Zone: " + this.ownerZone);
/*     */     }
/* 501 */     if (newMaxUsers > 0) {
/* 502 */       room.setMaxUsers(newMaxUsers);
/*     */     }
/* 504 */     if (newMaxSpect >= 0)
/* 505 */       room.setMaxSpectators(newMaxSpect);
/*     */   }
/*     */ 
/*     */   private void handleAutoRemove(Room room)
/*     */   {
/* 515 */     if ((room.isEmpty()) && (room.isDynamic()))
/*     */     {
/* 517 */       switch ($SWITCH_TABLE$com$smartfoxserver$v2$entities$SFSRoomRemoveMode()[room.getAutoRemoveMode().ordinal()])
/*     */       {
/*     */       case 1:
/* 526 */         if (room.isGame())
/* 527 */           removeWhenEmpty(room);
/*     */         else {
/* 529 */           removeWhenEmptyAndCreatorIsGone(room);
/*     */         }
/* 531 */         break;
/*     */       case 2:
/* 537 */         removeWhenEmpty(room);
/* 538 */         break;
/*     */       case 3:
/* 544 */         removeWhenEmptyAndCreatorIsGone(room);
/*     */       case 4:
/*     */       }
/*     */     }
/*     */   }
/*     */ 
/*     */   private void removeWhenEmpty(Room room)
/*     */   {
/* 558 */     if (room.isEmpty())
/* 559 */       this.sfs.getAPIManager().getSFSApi().removeRoom(room);
/*     */   }
/*     */ 
/*     */   private void removeWhenEmptyAndCreatorIsGone(Room room)
/*     */   {
/* 564 */     User owner = room.getOwner();
/*     */ 
/* 566 */     if ((owner != null) && (!owner.isConnected()))
/* 567 */       this.sfs.getAPIManager().getSFSApi().removeRoom(room);
/*     */   }
/*     */ 
/*     */   private boolean isRoomContainedInGroup(Room room, String groupId)
/*     */   {
/* 572 */     boolean flag = false;
/*     */ 
/* 575 */     if ((room != null) && (room.getGroupId().equals(groupId)) && (containsGroup(groupId))) {
/* 576 */       flag = true;
/*     */     }
/* 578 */     return flag;
/*     */   }
/*     */ 
/*     */   private void addRoomToGroup(Room room)
/*     */   {
/* 583 */     String groupId = room.getGroupId();
/*     */ 
/* 586 */     List roomList = (List)this.roomsByGroup.get(groupId);
/*     */ 
/* 589 */     if (roomList == null)
/*     */     {
/* 591 */       roomList = new ArrayList();
/* 592 */       this.roomsByGroup.put(groupId, roomList);
/*     */     }
/*     */ 
/* 596 */     synchronized (roomList)
/*     */     {
/* 598 */       roomList.add(room);
/*     */     }
/*     */   }
/*     */ 
/*     */   private void removeRoomFromGroup(Room room)
/*     */   {
/* 615 */     List roomList = (List)this.roomsByGroup.get(room.getGroupId());
/*     */ 
/* 617 */     if (roomList != null)
/*     */     {
/* 619 */       synchronized (roomList)
/*     */       {
/* 621 */         roomList.remove(room);
/*     */       }
/*     */     }
/*     */ 
/* 625 */     this.logger.info("Cannot remove room: " + room.getName() + " from it's group: " + room.getGroupId() + ". The group was not found.");
/*     */   }
/*     */ 
/*     */   private void validateRoomName(String roomName)
/*     */     throws SFSRoomException
/*     */   {
/* 632 */     if (containsRoom(roomName))
/*     */     {
/* 634 */       SFSErrorData errorData = new SFSErrorData(SFSErrorCode.ROOM_DUPLICATE_NAME);
/* 635 */       errorData.addParameter(roomName);
/*     */ 
/* 637 */       String message = String.format("A room with the same name already exists: %s", new Object[] { roomName });
/* 638 */       throw new SFSRoomException(message, errorData);
/*     */     }
/*     */ 
/* 642 */     int nameLen = roomName.length();
/* 643 */     int minLen = this.ownerZone.getMinRoomNameChars();
/* 644 */     int maxLen = this.ownerZone.getMaxRoomNameChars();
/*     */ 
/* 646 */     if ((nameLen < minLen) || (nameLen > maxLen))
/*     */     {
/* 648 */       SFSErrorData errorData = new SFSErrorData(SFSErrorCode.ROOM_NAME_BAD_SIZE);
/* 649 */       errorData.addParameter(String.valueOf(minLen));
/* 650 */       errorData.addParameter(String.valueOf(maxLen));
/* 651 */       errorData.addParameter(String.valueOf(nameLen));
/*     */ 
/* 653 */       String message = String.format("Room name length is out of valid range. Min: %s, Max: %s, Found: %s (%s)", new Object[] { Integer.valueOf(minLen), Integer.valueOf(maxLen), Integer.valueOf(nameLen), roomName });
/* 654 */       throw new SFSRoomException(message, errorData);
/*     */     }
/*     */ 
/* 664 */     IWordFilter wordFilter = this.ownerZone.getWordFilter();
/* 665 */     if (this.ownerZone.isFilterRoomNames())
/*     */     {
/* 667 */       if ((wordFilter.isActive()) && (wordFilter.getFilterMode() == WordsFilterMode.BLACK_LIST))
/*     */       {
/* 669 */         FilteredMessage filteredName = wordFilter.apply(roomName);
/* 670 */         if (filteredName.getOccurrences() > 0)
/*     */         {
/* 672 */           SFSErrorData errorData = new SFSErrorData(SFSErrorCode.ROOM_NAME_CONTAINS_BADWORDS);
/* 673 */           errorData.addParameter(roomName);
/*     */ 
/* 675 */           String message = String.format("Room name contains bad words: %s", new Object[] { roomName });
/* 676 */           throw new SFSRoomException(message, errorData);
/*     */         }
/*     */       }
/*     */     }
/*     */   }
/*     */ 
/*     */   private void populateTransientFields()
/*     */   {
/* 689 */     this.sfs = SmartFoxServer.getInstance();
/* 690 */     this.logger = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.SFSRoomManager
 * JD-Core Version:    0.6.0
 */