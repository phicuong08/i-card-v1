/*     */ package com.smartfoxserver.v2.entities;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.bitswarm.sessions.SessionType;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyListManager;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyProperties;
/*     */ import com.smartfoxserver.v2.buddylist.SFSBuddyProperties;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*     */ import com.smartfoxserver.v2.entities.variables.UserVariable;
/*     */ import com.smartfoxserver.v2.entities.variables.VariableType;
/*     */ import com.smartfoxserver.v2.exceptions.SFSVariableException;
/*     */ import com.smartfoxserver.v2.security.PrivilegeManager;
/*     */ import com.smartfoxserver.v2.security.SystemPermission;
/*     */ import com.smartfoxserver.v2.util.IAdminHelper;
/*     */ import com.smartfoxserver.v2.util.IDisconnectionReason;
/*     */ import java.util.ArrayList;
/*     */ import java.util.HashMap;
/*     */ import java.util.HashSet;
/*     */ import java.util.Iterator;
/*     */ import java.util.LinkedList;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import java.util.Set;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import java.util.concurrent.ConcurrentMap;
/*     */ import java.util.concurrent.atomic.AtomicInteger;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSUser
/*     */   implements User
/*     */ {
/*  65 */   private static AtomicInteger autoID = new AtomicInteger(0);
/*     */   private int id;
/*     */   private ISession session;
/*     */   private String name;
/*  70 */   private short privilegeId = 0;
/*     */ 
/*  72 */   private volatile long lastLoginTime = 0L;
/*     */   private final Set<String> registeredGroups;
/*     */   private final LinkedList<Room> joinedRooms;
/*     */   private final Set<Room> createdRooms;
/*     */   private final ConcurrentMap<Integer, Integer> playerIdByRoomId;
/*     */   private final ConcurrentMap<Object, Object> properties;
/*     */   private final ConcurrentMap<String, UserVariable> variables;
/*  79 */   private volatile int ownedRoomsCount = 0;
/*  80 */   private volatile int badWordsWarnings = 0;
/*  81 */   private volatile int floodWarnings = 0;
/*  82 */   private volatile boolean beingKicked = false;
/*  83 */   private volatile boolean connected = false;
/*  84 */   private boolean joining = false;
/*  85 */   private int maxVariablesAllowed = 0;
/*     */   private IAdminHelper adminHelper;
/*     */   private BuddyProperties buddyProperties;
/*     */   private Zone currentZone;
/*     */   private Logger logger;
/*     */ 
/*     */   private static int getNewID()
/*     */   {
/*  94 */     return autoID.getAndIncrement();
/*     */   }
/*     */ 
/*     */   public SFSUser(ISession session)
/*     */   {
/*  99 */     this("", session);
/*     */   }
/*     */ 
/*     */   public SFSUser(String name, ISession session)
/*     */   {
/* 104 */     this.id = getNewID();
/* 105 */     this.name = name;
/* 106 */     this.session = session;
/* 107 */     this.beingKicked = false;
/*     */ 
/* 109 */     this.joinedRooms = new LinkedList();
/* 110 */     this.properties = new ConcurrentHashMap();
/* 111 */     this.playerIdByRoomId = new ConcurrentHashMap();
/* 112 */     this.variables = new ConcurrentHashMap();
/* 113 */     this.registeredGroups = new HashSet();
/* 114 */     this.createdRooms = new HashSet();
/*     */ 
/* 116 */     updateLastRequestTime();
/* 117 */     this.logger = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ 
/*     */   public BuddyProperties getBuddyProperties()
/*     */   {
/* 128 */     return this.buddyProperties;
/*     */   }
/*     */ 
/*     */   public int getId()
/*     */   {
/* 134 */     return this.id;
/*     */   }
/*     */ 
/*     */   public short getPrivilegeId()
/*     */   {
/* 140 */     return this.privilegeId;
/*     */   }
/*     */ 
/*     */   public void setPrivilegeId(short id)
/*     */   {
/* 146 */     this.privilegeId = id;
/*     */   }
/*     */ 
/*     */   public boolean isSuperUser()
/*     */   {
/* 153 */     return this.currentZone.getPrivilegeManager().isFlagSet(this, SystemPermission.SuperUser);
/*     */   }
/*     */ 
/*     */   public boolean isConnected()
/*     */   {
/* 159 */     return this.connected;
/*     */   }
/*     */ 
/*     */   public boolean isLocal()
/*     */   {
/* 165 */     return this.session.isLocal();
/*     */   }
/*     */ 
/*     */   public synchronized void setConnected(boolean flag)
/*     */   {
/* 171 */     this.connected = flag;
/*     */   }
/*     */ 
/*     */   public synchronized boolean isJoining()
/*     */   {
/* 177 */     return this.joining;
/*     */   }
/*     */ 
/*     */   public synchronized void setJoining(boolean flag)
/*     */   {
/* 183 */     this.joining = flag;
/*     */   }
/*     */ 
/*     */   public String getIpAddress()
/*     */   {
/* 189 */     return this.session.getAddress();
/*     */   }
/*     */ 
/*     */   public int getMaxAllowedVariables()
/*     */   {
/* 195 */     return this.maxVariablesAllowed;
/*     */   }
/*     */ 
/*     */   public synchronized void setMaxAllowedVariables(int max)
/*     */   {
/* 202 */     this.maxVariablesAllowed = max;
/*     */   }
/*     */ 
/*     */   public void addCreatedRoom(Room room)
/*     */   {
/* 208 */     synchronized (this.createdRooms)
/*     */     {
/* 210 */       this.createdRooms.add(room);
/*     */     }
/*     */   }
/*     */ 
/*     */   public List<Room> getCreatedRooms()
/*     */   {
/* 217 */     List rooms = null;
/*     */ 
/* 219 */     synchronized (this.createdRooms)
/*     */     {
/* 221 */       rooms = new ArrayList(this.createdRooms);
/*     */     }
/*     */ 
/* 224 */     return rooms;
/*     */   }
/*     */ 
/*     */   public void removeCreatedRoom(Room room)
/*     */   {
/* 230 */     synchronized (this.createdRooms)
/*     */     {
/* 232 */       this.createdRooms.remove(room);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void addJoinedRoom(Room room)
/*     */   {
/* 239 */     synchronized (this.joinedRooms)
/*     */     {
/* 241 */       if (!this.joinedRooms.contains(room))
/* 242 */         this.joinedRooms.add(room);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void removeJoinedRoom(Room room)
/*     */   {
/* 250 */     synchronized (this.joinedRooms)
/*     */     {
/* 252 */       this.joinedRooms.remove(room);
/*     */     }
/*     */ 
/* 256 */     this.playerIdByRoomId.remove(Integer.valueOf(room.getId()));
/*     */   }
/*     */ 
/*     */   public int getOwnedRoomsCount()
/*     */   {
/* 262 */     return this.ownedRoomsCount;
/*     */   }
/*     */ 
/*     */   public void subscribeGroup(String id)
/*     */   {
/* 268 */     synchronized (this.registeredGroups)
/*     */     {
/* 270 */       this.registeredGroups.add(id);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void unsubscribeGroup(String id)
/*     */   {
/* 277 */     synchronized (this.registeredGroups)
/*     */     {
/* 279 */       this.registeredGroups.remove(id);
/*     */     }
/*     */   }
/*     */ 
/*     */   public List<String> getSubscribedGroups()
/*     */   {
/* 286 */     List theGroups = null;
/*     */ 
/* 288 */     synchronized (this.registeredGroups)
/*     */     {
/* 290 */       theGroups = new ArrayList(this.registeredGroups);
/*     */     }
/*     */ 
/* 293 */     return theGroups;
/*     */   }
/*     */ 
/*     */   public boolean isSubscribedToGroup(String id)
/*     */   {
/* 299 */     boolean found = false;
/*     */ 
/* 301 */     synchronized (this.registeredGroups)
/*     */     {
/* 303 */       found = this.registeredGroups.contains(id);
/*     */     }
/*     */ 
/* 306 */     return found;
/*     */   }
/*     */ 
/*     */   public void disconnect(IDisconnectionReason reason)
/*     */   {
/* 312 */     SmartFoxServer.getInstance().getAPIManager().getSFSApi().disconnectUser(this, reason);
/*     */   }
/*     */ 
/*     */   public boolean isNpc()
/*     */   {
/* 318 */     return this.session.getType() == SessionType.VOID;
/*     */   }
/*     */ 
/*     */   public List<Room> getJoinedRooms()
/*     */   {
/*     */     List rooms;
/* 326 */     synchronized (this.joinedRooms)
/*     */     {
/* 328 */       rooms = new ArrayList(this.joinedRooms);
/*     */     }
/*     */     List rooms;
/* 331 */     return rooms;
/*     */   }
/*     */ 
/*     */   public Zone getZone()
/*     */   {
/* 339 */     return this.currentZone;
/*     */   }
/*     */ 
/*     */   public void setZone(Zone currentZone)
/*     */   {
/* 345 */     if (this.currentZone != null) {
/* 346 */       throw new IllegalStateException("The User Zone is already set. It cannot be modified at Runtime. " + this);
/*     */     }
/* 348 */     this.currentZone = currentZone;
/*     */ 
/* 354 */     if (currentZone.getBuddyListManager().isActive())
/* 355 */       this.buddyProperties = new SFSBuddyProperties();
/*     */   }
/*     */ 
/*     */   public Room getLastJoinedRoom()
/*     */   {
/* 361 */     Room lastRoom = null;
/*     */ 
/* 363 */     synchronized (this.joinedRooms)
/*     */     {
/* 365 */       if (this.joinedRooms.size() > 0) {
/* 366 */         lastRoom = (Room)this.joinedRooms.getLast();
/*     */       }
/*     */     }
/* 369 */     return lastRoom;
/*     */   }
/*     */ 
/*     */   public boolean isJoinedInRoom(Room room)
/*     */   {
/* 375 */     boolean found = false;
/*     */ 
/* 377 */     synchronized (this.joinedRooms)
/*     */     {
/* 379 */       found = this.joinedRooms.contains(room);
/*     */     }
/*     */ 
/* 382 */     return found;
/*     */   }
/*     */ 
/*     */   public long getLoginTime()
/*     */   {
/* 390 */     return this.lastLoginTime;
/*     */   }
/*     */ 
/*     */   public void setLastLoginTime(long lastLoginTime)
/*     */   {
/* 397 */     this.lastLoginTime = lastLoginTime;
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/* 403 */     return this.name;
/*     */   }
/*     */ 
/*     */   public void setName(String name)
/*     */   {
/* 408 */     this.name = name;
/*     */   }
/*     */ 
/*     */   public int getPlayerId()
/*     */   {
/* 414 */     Room theRoom = getLastJoinedRoom();
/*     */ 
/* 416 */     if (theRoom == null) {
/* 417 */       return 0;
/*     */     }
/* 419 */     return ((Integer)this.playerIdByRoomId.get(Integer.valueOf(theRoom.getId()))).intValue();
/*     */   }
/*     */ 
/*     */   public int getPlayerId(Room room)
/*     */   {
/* 429 */     if (room == null) {
/* 430 */       return 0;
/*     */     }
/* 432 */     Integer playerId = (Integer)this.playerIdByRoomId.get(Integer.valueOf(room.getId()));
/*     */ 
/* 434 */     if (playerId == null)
/*     */     {
/* 436 */       this.logger.info("Can't find playerID -- User: " + this.name + " is not joined in the requestd Room: " + room);
/* 437 */       playerId = Integer.valueOf(0);
/*     */     }
/*     */ 
/* 440 */     return playerId.intValue();
/*     */   }
/*     */ 
/*     */   public Map<Room, Integer> getPlayerIds()
/*     */   {
/* 446 */     Map allPlayerIds = new HashMap();
/*     */ 
/* 448 */     synchronized (this.joinedRooms)
/*     */     {
/* 450 */       for (Room room : this.joinedRooms) {
/* 451 */         allPlayerIds.put(room, Integer.valueOf(getPlayerId(room)));
/*     */       }
/*     */     }
/* 454 */     return allPlayerIds;
/*     */   }
/*     */ 
/*     */   public void setPlayerId(int id, Room room)
/*     */   {
/* 460 */     this.playerIdByRoomId.put(Integer.valueOf(room.getId()), Integer.valueOf(id));
/*     */   }
/*     */ 
/*     */   public boolean isPlayer()
/*     */   {
/* 466 */     return isPlayer(getLastJoinedRoom());
/*     */   }
/*     */ 
/*     */   public boolean isSpectator()
/*     */   {
/* 472 */     return isSpectator(getLastJoinedRoom());
/*     */   }
/*     */ 
/*     */   public boolean isPlayer(Room room)
/*     */   {
/* 479 */     return getPlayerId(room) > 0;
/*     */   }
/*     */ 
/*     */   public boolean isSpectator(Room room)
/*     */   {
/* 485 */     return getPlayerId(room) < 0;
/*     */   }
/*     */ 
/*     */   public Object getProperty(Object key)
/*     */   {
/* 491 */     return this.properties.get(key);
/*     */   }
/*     */ 
/*     */   public void setProperty(Object key, Object val)
/*     */   {
/* 497 */     this.properties.put(key, val);
/*     */   }
/*     */ 
/*     */   public boolean containsProperty(Object key)
/*     */   {
/* 503 */     return this.properties.containsKey(key);
/*     */   }
/*     */ 
/*     */   public void removeProperty(Object key)
/*     */   {
/* 509 */     this.properties.remove(key);
/*     */   }
/*     */ 
/*     */   public ISession getSession()
/*     */   {
/* 515 */     return this.session;
/*     */   }
/*     */ 
/*     */   public int getVariablesCount()
/*     */   {
/* 521 */     return this.variables.size();
/*     */   }
/*     */ 
/*     */   public UserVariable getVariable(String varName)
/*     */   {
/* 527 */     return (UserVariable)this.variables.get(varName);
/*     */   }
/*     */ 
/*     */   public void setVariable(UserVariable var)
/*     */     throws SFSVariableException
/*     */   {
/* 533 */     String varName = var.getName();
/*     */ 
/* 536 */     if (var.getType() == VariableType.NULL) {
/* 537 */       removeVariable(varName);
/*     */     }
/*     */     else
/*     */     {
/* 542 */       if (!containsVariable(varName))
/*     */       {
/* 544 */         if (this.variables.size() >= this.maxVariablesAllowed) {
/* 545 */           throw new SFSVariableException("The max number of variables (" + this.maxVariablesAllowed + ") for this User: " + this.name + " was reached. Discarding variable: " + varName);
/*     */         }
/*     */       }
/*     */ 
/* 549 */       this.variables.put(varName, var);
/*     */ 
/* 551 */       if (this.logger.isDebugEnabled())
/* 552 */         this.logger.debug(String.format("UserVar set: %s, %s ", new Object[] { var, this }));
/*     */     }
/*     */   }
/*     */ 
/*     */   public void setVariables(List<UserVariable> userVariables)
/*     */     throws SFSVariableException
/*     */   {
/* 559 */     for (UserVariable uVar : userVariables)
/*     */     {
/* 561 */       setVariable(uVar);
/*     */     }
/*     */   }
/*     */ 
/*     */   public boolean containsVariable(String varName)
/*     */   {
/* 568 */     return this.variables.containsKey(varName);
/*     */   }
/*     */ 
/*     */   public List<UserVariable> getVariables()
/*     */   {
/* 574 */     return new ArrayList(this.variables.values());
/*     */   }
/*     */ 
/*     */   public void removeVariable(String varName)
/*     */   {
/* 580 */     this.variables.remove(varName);
/*     */ 
/* 582 */     if (this.logger.isDebugEnabled())
/* 583 */       this.logger.debug(String.format("UserVar removed: %s, %s", new Object[] { varName, this }));
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 589 */     return String.format("( User Name: %s, Id: %s, Priv: %s, Sess: %s ) ", new Object[] { this.name, Integer.valueOf(this.id), Short.valueOf(this.privilegeId), this.session.getFullIpAddress() });
/*     */   }
/*     */ 
/*     */   public long getLastRequestTime()
/*     */   {
/* 594 */     return this.session.getLastLoggedInActivityTime();
/*     */   }
/*     */ 
/*     */   public synchronized void updateLastRequestTime()
/*     */   {
/* 600 */     setLastRequestTime(System.currentTimeMillis());
/*     */   }
/*     */ 
/*     */   public void setLastRequestTime(long lastRequestTime)
/*     */   {
/* 605 */     this.session.setLastLoggedInActivityTime(lastRequestTime);
/*     */   }
/*     */ 
/*     */   public int getBadWordsWarnings()
/*     */   {
/* 610 */     return this.badWordsWarnings;
/*     */   }
/*     */ 
/*     */   public void setBadWordsWarnings(int badWordsWarnings)
/*     */   {
/* 615 */     this.badWordsWarnings = badWordsWarnings;
/*     */   }
/*     */ 
/*     */   public int getFloodWarnings()
/*     */   {
/* 620 */     return this.floodWarnings;
/*     */   }
/*     */ 
/*     */   public void setFloodWarnings(int floodWarnings)
/*     */   {
/* 625 */     this.floodWarnings = floodWarnings;
/*     */   }
/*     */ 
/*     */   public long getLastLoginTime()
/*     */   {
/* 630 */     return this.lastLoginTime;
/*     */   }
/*     */ 
/*     */   public boolean isBeingKicked()
/*     */   {
/* 636 */     return this.beingKicked;
/*     */   }
/*     */ 
/*     */   public void setBeingKicked(boolean flag)
/*     */   {
/* 642 */     this.beingKicked = flag;
/*     */   }
/*     */ 
/*     */   public ISFSArray getUserVariablesData()
/*     */   {
/* 648 */     ISFSArray variablesData = SFSArray.newInstance();
/*     */ 
/* 650 */     for (UserVariable var : this.variables.values())
/*     */     {
/* 653 */       if (var.isHidden()) {
/*     */         continue;
/*     */       }
/* 656 */       variablesData.addSFSArray(var.toSFSArray());
/*     */     }
/*     */ 
/* 659 */     return variablesData;
/*     */   }
/*     */ 
/*     */   public int getReconnectionSeconds()
/*     */   {
/* 665 */     return this.session.getReconnectionSeconds();
/*     */   }
/*     */ 
/*     */   public void setReconnectionSeconds(int seconds)
/*     */   {
/* 671 */     this.session.setReconnectionSeconds(seconds);
/*     */   }
/*     */ 
/*     */   public ISFSArray toSFSArray(Room room)
/*     */   {
/* 677 */     ISFSArray userObj = SFSArray.newInstance();
/*     */ 
/* 679 */     userObj.addInt(this.id);
/* 680 */     userObj.addUtfString(this.name);
/* 681 */     userObj.addShort(this.privilegeId);
/* 682 */     userObj.addShort((short)getPlayerId(room));
/* 683 */     userObj.addSFSArray(getUserVariablesData());
/*     */ 
/* 685 */     return userObj;
/*     */   }
/*     */ 
/*     */   public ISFSArray toSFSArray()
/*     */   {
/* 690 */     return toSFSArray(getLastJoinedRoom());
/*     */   }
/*     */ 
/*     */   public boolean equals(Object obj)
/*     */   {
/* 697 */     if (!(obj instanceof User)) {
/* 698 */       return false;
/*     */     }
/* 700 */     User user = (User)obj;
/* 701 */     boolean isEqual = false;
/*     */ 
/* 703 */     if (user.getId() == this.id) {
/* 704 */       isEqual = true;
/*     */     }
/* 706 */     return isEqual;
/*     */   }
/*     */ 
/*     */   public String getDump()
/*     */   {
/* 712 */     StringBuilder sb = new StringBuilder("/////////////// User Dump ////////////////").append("\n");
/*     */ 
/* 714 */     sb.append("\tName: ").append(this.name).append("\n")
/* 715 */       .append("\tId: ").append(this.id).append("\n")
/* 716 */       .append("\tHash: ").append(this.session.getHashId()).append("\n")
/* 717 */       .append("\tZone: ").append(getZone()).append("\n")
/* 718 */       .append("\tIP Address: ").append(getIpAddress()).append("\n")
/* 719 */       .append("\tPrivilegeId: ").append(getPrivilegeId()).append("\n")
/* 720 */       .append("\tisSubscribed Groups: ").append(getSubscribedGroups()).append("\n")
/* 721 */       .append("\tLast Joined Room: ").append(getLastJoinedRoom()).append("\n")
/* 722 */       .append("\tJoined Rooms: ").append(getJoinedRooms()).append("\n");
/*     */ 
/* 724 */     if (this.variables.size() > 0)
/*     */     {
/* 726 */       sb.append("\tUserVariables: ").append("\n");
/*     */ 
/* 728 */       for (UserVariable var : this.variables.values())
/*     */       {
/* 730 */         sb.append("\t\t").append(var.toString()).append("\n");
/*     */       }
/*     */     }
/*     */ 
/* 734 */     if (this.properties.size() > 0)
/*     */     {
/* 736 */       sb.append("\tProperties: ").append("\n");
/*     */ 
/* 738 */       for (??? = this.properties.keySet().iterator(); ???.hasNext(); ) { Object key = ???.next();
/*     */ 
/* 740 */         sb.append("\t\t").append(key).append(": ").append(this.properties.get(key)).append("\n");
/*     */       }
/*     */     }
/*     */ 
/* 744 */     sb.append("/////////////// End Dump /////////////////").append("\n");
/*     */ 
/* 746 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public IAdminHelper getAdminHelper()
/*     */   {
/* 751 */     return this.adminHelper;
/*     */   }
/*     */ 
/*     */   public void setAdminHelper(IAdminHelper adminHelper)
/*     */   {
/* 756 */     this.adminHelper = adminHelper;
/*     */   }
/*     */ 
/*     */   private void populateTransientFields()
/*     */   {
/* 766 */     this.logger = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.SFSUser
 * JD-Core Version:    0.6.0
 */