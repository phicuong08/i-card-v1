/*      */ package com.smartfoxserver.v2.entities;
/*      */ 
/*      */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*      */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*      */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*      */ import com.smartfoxserver.v2.entities.managers.IUserManager;
/*      */ import com.smartfoxserver.v2.entities.managers.SFSUserManager;
/*      */ import com.smartfoxserver.v2.entities.variables.RoomVariable;
/*      */ import com.smartfoxserver.v2.entities.variables.VariableType;
/*      */ import com.smartfoxserver.v2.exceptions.SFSErrorCode;
/*      */ import com.smartfoxserver.v2.exceptions.SFSErrorData;
/*      */ import com.smartfoxserver.v2.exceptions.SFSJoinRoomException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSRoomException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSVariableException;
/*      */ import com.smartfoxserver.v2.extensions.ISFSExtension;
/*      */ import com.smartfoxserver.v2.util.IAdminHelper;
/*      */ import com.smartfoxserver.v2.util.IPlayerIdGenerator;
/*      */ import java.util.ArrayList;
/*      */ import java.util.Iterator;
/*      */ import java.util.List;
/*      */ import java.util.Map;
/*      */ import java.util.Set;
/*      */ import java.util.concurrent.ConcurrentHashMap;
/*      */ import java.util.concurrent.atomic.AtomicInteger;
/*      */ import java.util.concurrent.locks.Lock;
/*      */ import java.util.concurrent.locks.ReentrantLock;
/*      */ import org.slf4j.Logger;
/*      */ import org.slf4j.LoggerFactory;
/*      */ 
/*      */ public class SFSRoom
/*      */   implements Room
/*      */ {
/*  106 */   private static AtomicInteger autoID = new AtomicInteger(0);
/*      */   private int id;
/*      */   private String groupId;
/*      */   private String name;
/*      */   private String password;
/*      */   private boolean passwordProtected;
/*      */   private int maxUsers;
/*      */   private int maxSpectators;
/*      */   private int maxRoomVariablesAllowed;
/*      */   private User owner;
/*      */   private IUserManager userManager;
/*      */   private Zone zone;
/*      */   private volatile ISFSExtension extension;
/*      */   private boolean dynamic;
/*      */   private boolean game;
/*      */   private boolean hidden;
/*      */   private volatile boolean active;
/*      */   private SFSRoomRemoveMode autoRemoveMode;
/*      */   private IPlayerIdGenerator playerIdGenerator;
/*      */   private final Lock switchUserLock;
/*      */   private final Map<Object, Object> properties;
/*      */   private final Map<String, RoomVariable> variables;
/*      */   private Set<SFSRoomSettings> flags;
/*      */   private volatile boolean userWordsFilter;
/*      */   protected Logger logger;
/*  137 */   private boolean isGameFlagInited = false;
/*      */   private IAdminHelper adminHelper;
/*      */ 
/*      */   private static int getNewID()
/*      */   {
/*  147 */     return autoID.getAndIncrement();
/*      */   }
/*      */ 
/*      */   public SFSRoom(String name)
/*      */   {
/*  152 */     this(name, null);
/*      */   }
/*      */ 
/*      */   public SFSRoom(String name, Class<?> customPlayerIdGeneratorClass)
/*      */   {
/*  157 */     this.id = getNewID();
/*  158 */     this.name = name;
/*  159 */     this.active = false;
/*      */ 
/*  161 */     this.logger = LoggerFactory.getLogger(getClass());
/*  162 */     this.properties = new ConcurrentHashMap();
/*  163 */     this.variables = new ConcurrentHashMap();
/*  164 */     this.userManager = new SFSUserManager();
/*      */ 
/*  166 */     this.switchUserLock = new ReentrantLock();
/*      */   }
/*      */ 
/*      */   public int getId()
/*      */   {
/*  172 */     return this.id;
/*      */   }
/*      */ 
/*      */   public String getGroupId()
/*      */   {
/*  179 */     if ((this.groupId != null) && (this.groupId.length() > 0)) {
/*  180 */       return this.groupId;
/*      */     }
/*      */ 
/*  184 */     return "default";
/*      */   }
/*      */ 
/*      */   public void setGroupId(String groupId)
/*      */   {
/*  190 */     this.groupId = groupId;
/*      */   }
/*      */ 
/*      */   public String getName()
/*      */   {
/*  196 */     return this.name;
/*      */   }
/*      */ 
/*      */   public void setName(String name)
/*      */   {
/*  202 */     this.name = name;
/*      */   }
/*      */ 
/*      */   public String getPassword()
/*      */   {
/*  208 */     return this.password;
/*      */   }
/*      */ 
/*      */   public void setPassword(String password)
/*      */   {
/*  214 */     this.password = password;
/*      */ 
/*  216 */     if ((this.password != null) && (this.password.length() > 0))
/*  217 */       this.passwordProtected = true;
/*      */     else
/*  219 */       this.passwordProtected = false;
/*      */   }
/*      */ 
/*      */   public boolean isPasswordProtected()
/*      */   {
/*  225 */     return this.passwordProtected;
/*      */   }
/*      */ 
/*      */   public boolean isPublic()
/*      */   {
/*  232 */     return !this.passwordProtected;
/*      */   }
/*      */ 
/*      */   public int getMaxUsers()
/*      */   {
/*  238 */     return this.maxUsers;
/*      */   }
/*      */ 
/*      */   public void setMaxUsers(int maxUsers)
/*      */   {
/*  244 */     this.maxUsers = maxUsers;
/*      */ 
/*  249 */     if ((isGame()) && (this.playerIdGenerator != null))
/*  250 */       this.playerIdGenerator.onRoomResize();
/*      */   }
/*      */ 
/*      */   public int getMaxSpectators()
/*      */   {
/*  256 */     return this.maxSpectators;
/*      */   }
/*      */ 
/*      */   public void setMaxSpectators(int maxSpectators)
/*      */   {
/*  262 */     this.maxSpectators = maxSpectators;
/*      */   }
/*      */ 
/*      */   public User getOwner()
/*      */   {
/*  268 */     return this.owner;
/*      */   }
/*      */ 
/*      */   public void setOwner(User owner)
/*      */   {
/*  274 */     this.owner = owner;
/*      */   }
/*      */ 
/*      */   public IUserManager getUserManager()
/*      */   {
/*  279 */     return this.userManager;
/*      */   }
/*      */ 
/*      */   public void setUserManager(IUserManager userManager)
/*      */   {
/*  284 */     this.userManager = userManager;
/*      */   }
/*      */ 
/*      */   public Zone getZone()
/*      */   {
/*  290 */     return this.zone;
/*      */   }
/*      */ 
/*      */   public void setZone(Zone zone)
/*      */   {
/*  296 */     this.zone = zone;
/*      */ 
/*  298 */     instantiateRoomIdGenerator();
/*      */   }
/*      */ 
/*      */   public boolean isDynamic()
/*      */   {
/*  304 */     return this.dynamic;
/*      */   }
/*      */ 
/*      */   public void setDynamic(boolean dynamic)
/*      */   {
/*  310 */     this.dynamic = dynamic;
/*      */   }
/*      */ 
/*      */   public boolean isGame()
/*      */   {
/*  316 */     return this.game;
/*      */   }
/*      */ 
/*      */   public void setGame(boolean game, Class<? extends IPlayerIdGenerator> customPlayerIdGeneratorClass)
/*      */   {
/*  322 */     if (this.isGameFlagInited) {
/*  323 */       throw new IllegalStateException(toString() + ", isGame flag cannot be reset");
/*      */     }
/*      */ 
/*  329 */     this.game = game;
/*  330 */     this.isGameFlagInited = true;
/*      */ 
/*  339 */     if (this.game)
/*      */     {
/*      */       try
/*      */       {
/*  345 */         this.playerIdGenerator = ((IPlayerIdGenerator)customPlayerIdGeneratorClass.newInstance());
/*      */ 
/*  348 */         this.playerIdGenerator.setParentRoom(this);
/*  349 */         this.playerIdGenerator.init();
/*      */       }
/*      */       catch (InstantiationException err)
/*      */       {
/*  353 */         this.logger.warn(
/*  355 */           String.format(
/*  357 */           "Cannot instantiate Player ID Generator: %s, Reason: %s -- Room might not function correctly.", new Object[] { 
/*  358 */           customPlayerIdGeneratorClass, 
/*  359 */           err }));
/*      */       }
/*      */       catch (IllegalAccessException err)
/*      */       {
/*  365 */         this.logger.warn(
/*  367 */           String.format(
/*  369 */           "Illegal Access to Player ID Generator Class: %s, Reason: %s -- Room might not function correctly.", new Object[] { 
/*  370 */           customPlayerIdGeneratorClass, 
/*  371 */           err }));
/*      */       }
/*      */     }
/*      */   }
/*      */ 
/*      */   public void setGame(boolean game)
/*      */   {
/*  381 */     setGame(game, null);
/*      */   }
/*      */ 
/*      */   public boolean isHidden()
/*      */   {
/*  387 */     return this.hidden;
/*      */   }
/*      */ 
/*      */   public void setHidden(boolean hidden)
/*      */   {
/*  393 */     this.hidden = hidden;
/*      */   }
/*      */ 
/*      */   public synchronized boolean isActive()
/*      */   {
/*  400 */     return this.active;
/*      */   }
/*      */ 
/*      */   public synchronized void setActive(boolean flag)
/*      */   {
/*  407 */     this.active = flag;
/*      */   }
/*      */ 
/*      */   public SFSRoomRemoveMode getAutoRemoveMode()
/*      */   {
/*  413 */     return this.autoRemoveMode;
/*      */   }
/*      */ 
/*      */   public void setAutoRemoveMode(SFSRoomRemoveMode autoRemoveMode)
/*      */   {
/*  419 */     this.autoRemoveMode = autoRemoveMode;
/*      */   }
/*      */ 
/*      */   public List<User> getPlayersList()
/*      */   {
/*  426 */     List playerList = new ArrayList();
/*      */ 
/*  428 */     for (User user : this.userManager.getAllUsers())
/*      */     {
/*  430 */       if (user.isPlayer(this)) {
/*  431 */         playerList.add(user);
/*      */       }
/*      */     }
/*  434 */     return playerList;
/*      */   }
/*      */ 
/*      */   public Object getProperty(Object key)
/*      */   {
/*  441 */     return this.properties.get(key);
/*      */   }
/*      */ 
/*      */   public RoomSize getSize()
/*      */   {
/*  448 */     int uCount = 0;
/*  449 */     int sCount = 0;
/*      */ 
/*  451 */     if (this.game)
/*      */     {
/*  453 */       for (User user : this.userManager.getAllUsers())
/*      */       {
/*  455 */         if (user.isSpectator(this))
/*  456 */           sCount++;
/*      */         else {
/*  458 */           uCount++;
/*      */         }
/*      */       }
/*      */     }
/*      */     else
/*      */     {
/*  464 */       uCount = this.userManager.getUserCount();
/*      */     }
/*      */ 
/*  467 */     return new RoomSize(uCount, sCount);
/*      */   }
/*      */ 
/*      */   public void removeProperty(Object key)
/*      */   {
/*  474 */     this.properties.remove(key);
/*      */   }
/*      */ 
/*      */   public List<User> getSpectatorsList()
/*      */   {
/*  481 */     List specList = new ArrayList();
/*      */ 
/*  483 */     for (User user : this.userManager.getAllUsers())
/*      */     {
/*  485 */       if (user.isSpectator(this)) {
/*  486 */         specList.add(user);
/*      */       }
/*      */     }
/*  489 */     return specList;
/*      */   }
/*      */ 
/*      */   public User getUserById(int id)
/*      */   {
/*  496 */     return this.userManager.getUserById(id);
/*      */   }
/*      */ 
/*      */   public User getUserByName(String name)
/*      */   {
/*  503 */     return this.userManager.getUserByName(name);
/*      */   }
/*      */ 
/*      */   public User getUserBySession(ISession session)
/*      */   {
/*  510 */     return this.userManager.getUserBySession(session);
/*      */   }
/*      */ 
/*      */   public User getUserByPlayerId(int playerId)
/*      */   {
/*  517 */     User user = null;
/*      */ 
/*  519 */     for (User u : this.userManager.getAllUsers())
/*      */     {
/*  521 */       if (u.getPlayerId(this) != playerId)
/*      */         continue;
/*  523 */       user = u;
/*  524 */       break;
/*      */     }
/*      */ 
/*  528 */     return user;
/*      */   }
/*      */ 
/*      */   public List<User> getUserList()
/*      */   {
/*  535 */     return this.userManager.getAllUsers();
/*      */   }
/*      */ 
/*      */   public List<ISession> getSessionList()
/*      */   {
/*  542 */     return this.userManager.getAllSessions();
/*      */   }
/*      */ 
/*      */   public int getVariablesCount()
/*      */   {
/*  549 */     return this.variables.size();
/*      */   }
/*      */ 
/*      */   public RoomVariable getVariable(String varName)
/*      */   {
/*  556 */     return (RoomVariable)this.variables.get(varName);
/*      */   }
/*      */ 
/*      */   public List<RoomVariable> getVariables()
/*      */   {
/*  563 */     return new ArrayList(this.variables.values());
/*      */   }
/*      */ 
/*      */   public List<RoomVariable> getVariablesCreatedByUser(User user)
/*      */   {
/*  570 */     List varList = new ArrayList();
/*      */ 
/*  572 */     for (RoomVariable rVar : this.variables.values())
/*      */     {
/*  574 */       if (rVar.getOwner() == user) {
/*  575 */         varList.add(rVar);
/*      */       }
/*      */     }
/*  578 */     return varList;
/*      */   }
/*      */ 
/*      */   public boolean containsProperty(Object key)
/*      */   {
/*  585 */     return this.properties.containsKey(key);
/*      */   }
/*      */ 
/*      */   public void removeVariable(String varName)
/*      */   {
/*  592 */     this.variables.remove(varName);
/*      */ 
/*  594 */     if (this.logger.isDebugEnabled())
/*  595 */       this.logger.debug("RoomVar deleted: " + varName + " in " + this);
/*      */   }
/*      */ 
/*      */   public List<RoomVariable> removeVariablesCreatedByUser(User user)
/*      */   {
/*  602 */     List varList = getVariablesCreatedByUser(user);
/*      */ 
/*  605 */     for (RoomVariable rVar : varList)
/*      */     {
/*  607 */       removeVariable(rVar.getName());
/*      */ 
/*  614 */       rVar.setNull();
/*      */     }
/*      */ 
/*  617 */     return varList;
/*      */   }
/*      */ 
/*      */   public int getCapacity()
/*      */   {
/*  624 */     return this.maxUsers + this.maxSpectators;
/*      */   }
/*      */ 
/*      */   public void setCapacity(int maxUser, int maxSpectators)
/*      */   {
/*  631 */     this.maxUsers = maxUser;
/*  632 */     this.maxSpectators = maxSpectators;
/*      */   }
/*      */ 
/*      */   public void setMaxRoomVariablesAllowed(int max)
/*      */   {
/*  639 */     this.maxRoomVariablesAllowed = max;
/*      */   }
/*      */ 
/*      */   public int getMaxRoomVariablesAllowed()
/*      */   {
/*  646 */     return this.maxRoomVariablesAllowed;
/*      */   }
/*      */ 
/*      */   public void setFlags(Set<SFSRoomSettings> settings)
/*      */   {
/*  661 */     this.flags = settings;
/*      */   }
/*      */ 
/*      */   public boolean isFlagSet(SFSRoomSettings flag)
/*      */   {
/*  672 */     return this.flags.contains(flag);
/*      */   }
/*      */ 
/*      */   public void setFlag(SFSRoomSettings flag, boolean state)
/*      */   {
/*  684 */     if (state) {
/*  685 */       this.flags.add(flag);
/*      */     }
/*      */     else
/*      */     {
/*  689 */       this.flags.remove(flag);
/*      */     }
/*      */   }
/*      */ 
/*      */   public boolean isUseWordsFilter()
/*      */   {
/*  696 */     return this.userWordsFilter;
/*      */   }
/*      */ 
/*      */   public void setUseWordsFilter(boolean useWordsFilter)
/*      */   {
/*  703 */     this.userWordsFilter = useWordsFilter;
/*      */   }
/*      */ 
/*      */   public void setProperty(Object key, Object value)
/*      */   {
/*  710 */     this.properties.put(key, value);
/*      */   }
/*      */ 
/*      */   public void setVariables(List<RoomVariable> variables)
/*      */   {
/*  717 */     setVariables(variables, false);
/*      */   }
/*      */ 
/*      */   public void setVariables(List<RoomVariable> variables, boolean overrideOwnership)
/*      */   {
/*  724 */     for (RoomVariable var : variables)
/*      */     {
/*      */       try
/*      */       {
/*  728 */         setVariable(var);
/*      */       }
/*      */       catch (SFSVariableException e)
/*      */       {
/*  732 */         this.logger.warn(e.getMessage());
/*      */       }
/*      */     }
/*      */   }
/*      */ 
/*      */   public void setVariable(RoomVariable roomVariable)
/*      */     throws SFSVariableException
/*      */   {
/*  741 */     setVariable(roomVariable, false);
/*      */   }
/*      */ 
/*      */   public void setVariable(RoomVariable roomVariable, boolean overrideOwnership)
/*      */     throws SFSVariableException
/*      */   {
/*  760 */     if (this.maxRoomVariablesAllowed < 1) {
/*  761 */       throw new SFSVariableException("Room Variables are disabled: " + toString());
/*      */     }
/*  763 */     String varName = roomVariable.getName();
/*  764 */     RoomVariable oldVariable = (RoomVariable)this.variables.get(varName);
/*      */ 
/*  767 */     if (roomVariable.getType() == VariableType.NULL) {
/*  768 */       deleteVariable(oldVariable, roomVariable, overrideOwnership);
/*      */     }
/*  773 */     else if (oldVariable != null) {
/*  774 */       modifyVariable(oldVariable, roomVariable, overrideOwnership);
/*      */     }
/*      */     else
/*      */     {
/*  778 */       addVariable(roomVariable, overrideOwnership);
/*      */     }
/*      */   }
/*      */ 
/*      */   private void addVariable(RoomVariable var, boolean overrideOwnership) throws SFSVariableException
/*      */   {
/*  784 */     if (this.variables.size() >= this.maxRoomVariablesAllowed)
/*      */     {
/*  786 */       throw new SFSVariableException(
/*  788 */         String.format(
/*  790 */         "The max number of variables (%s) for this Room: %s was reached. Discarding variable: %s", new Object[] { 
/*  791 */         Integer.valueOf(this.maxRoomVariablesAllowed), 
/*  792 */         this.name, 
/*  793 */         var.getName() }));
/*      */     }
/*      */ 
/*  799 */     this.variables.put(var.getName(), var);
/*      */ 
/*  801 */     if (this.logger.isDebugEnabled())
/*  802 */       this.logger.debug(String.format("RoomVar created: %s in %s ", new Object[] { var, this }));
/*      */   }
/*      */ 
/*      */   private void modifyVariable(RoomVariable oldVariable, RoomVariable newVariable, boolean overrideOwnership) throws SFSVariableException
/*      */   {
/*  807 */     if (overrideOwnership) {
/*  808 */       overwriteVariable(oldVariable, newVariable);
/*      */     }
/*  813 */     else if (oldVariable.isPrivate())
/*      */     {
/*  815 */       if (oldVariable.getOwner() == newVariable.getOwner())
/*  816 */         overwriteVariable(oldVariable, newVariable);
/*      */       else
/*  818 */         throw new SFSVariableException(String.format("Variable: %s cannot be changed by user: %s", new Object[] { oldVariable, newVariable.getOwner() }));
/*      */     }
/*      */     else
/*  821 */       overwriteVariable(oldVariable, newVariable);
/*      */   }
/*      */ 
/*      */   private void overwriteVariable(RoomVariable oldRv, RoomVariable newRv)
/*      */   {
/*  828 */     if (oldRv.getOwner() == null) {
/*  829 */       newRv.setOwner(null);
/*      */     }
/*      */ 
/*  832 */     newRv.setHidden(oldRv.isHidden());
/*  833 */     newRv.setGlobal(oldRv.isGlobal());
/*      */ 
/*  835 */     this.variables.put(newRv.getName(), newRv);
/*      */ 
/*  837 */     if (this.logger.isDebugEnabled())
/*  838 */       this.logger.debug(String.format("RoomVar changed: %s in %s ", new Object[] { newRv, this }));
/*      */   }
/*      */ 
/*      */   private void deleteVariable(RoomVariable oldVariable, RoomVariable newVariable, boolean overrideOwnership) throws SFSVariableException
/*      */   {
/*  843 */     if (overrideOwnership) {
/*  844 */       removeVariable(oldVariable.getName());
/*      */     }
/*  848 */     else if (oldVariable.isPrivate())
/*      */     {
/*  850 */       if (oldVariable.getOwner() == newVariable.getOwner())
/*  851 */         removeVariable(oldVariable.getName());
/*      */       else
/*  853 */         throw new SFSVariableException("Variable: " + oldVariable + " cannot be deleted by user: " + newVariable.getOwner());
/*      */     }
/*      */     else
/*  856 */       removeVariable(oldVariable.getName());
/*      */   }
/*      */ 
/*      */   public boolean containsVariable(String varName)
/*      */   {
/*  865 */     return this.variables.containsKey(varName);
/*      */   }
/*      */ 
/*      */   public boolean containsUser(String name)
/*      */   {
/*  872 */     return this.userManager.containsName(name);
/*      */   }
/*      */ 
/*      */   public boolean containsUser(User user)
/*      */   {
/*  879 */     return this.userManager.containsUser(user);
/*      */   }
/*      */ 
/*      */   public void addUser(User user)
/*      */     throws SFSJoinRoomException
/*      */   {
/*  886 */     addUser(user, false);
/*      */   }
/*      */ 
/*      */   public void addUser(User user, boolean asSpectator)
/*      */     throws SFSJoinRoomException
/*      */   {
/*  894 */     if (this.userManager.containsId(user.getId()))
/*      */     {
/*  896 */       String message = String.format("User already joined: %s, Room: %s, Zone: %s", new Object[] { user, this, getZone() });
/*  897 */       SFSErrorData data = new SFSErrorData(SFSErrorCode.JOIN_ALREADY_JOINED);
/*  898 */       data.addParameter(this.name);
/*      */ 
/*  900 */       throw new SFSJoinRoomException(message, data);
/*      */     }
/*      */ 
/*  904 */     boolean okToAdd = false;
/*      */ 
/*  906 */     synchronized (this)
/*      */     {
/*  908 */       RoomSize roomSize = getSize();
/*      */ 
/*  910 */       if ((isGame()) && (asSpectator)) {
/*  911 */         okToAdd = roomSize.getSpectatorCount() < this.maxSpectators;
/*      */       }
/*      */       else {
/*  914 */         okToAdd = roomSize.getUserCount() < this.maxUsers;
/*      */       }
/*      */ 
/*  923 */       if (!okToAdd)
/*      */       {
/*  925 */         String message = String.format("Room is full: %s, Zone: %s - Can't add User: %s ", new Object[] { this.name, this.zone, user });
/*  926 */         SFSErrorData data = new SFSErrorData(SFSErrorCode.JOIN_ROOM_FULL);
/*  927 */         data.addParameter(this.name);
/*      */ 
/*  929 */         throw new SFSJoinRoomException(message, data);
/*      */       }
/*      */ 
/*  932 */       this.userManager.addUser(user);
/*      */     }
/*      */ 
/*  936 */     user.addJoinedRoom(this);
/*      */ 
/*  939 */     if (isGame())
/*      */     {
/*  941 */       if (asSpectator)
/*  942 */         user.setPlayerId(-1, this);
/*      */       else {
/*  944 */         user.setPlayerId(this.playerIdGenerator.getPlayerSlot(), this);
/*      */       }
/*      */     }
/*      */     else
/*      */     {
/*  949 */       user.setPlayerId(0, this);
/*      */     }
/*      */   }
/*      */ 
/*      */   public void removeUser(User user)
/*      */   {
/*  959 */     if (isGame()) {
/*  960 */       this.playerIdGenerator.freePlayerSlot(user.getPlayerId(this));
/*      */     }
/*  962 */     this.userManager.removeUser(user);
/*  963 */     user.removeJoinedRoom(this);
/*      */   }
/*      */ 
/*      */   public void switchPlayerToSpectator(User user)
/*      */     throws SFSRoomException
/*      */   {
/*  971 */     if (!isGame())
/*      */     {
/*  973 */       SFSErrorData errData = new SFSErrorData(SFSErrorCode.SWITCH_NOT_A_GAME_ROOM);
/*  974 */       errData.addParameter(this.name);
/*      */ 
/*  976 */       throw new SFSRoomException("Not supported in a non-game room", errData);
/*      */     }
/*      */ 
/*  980 */     if (!this.userManager.containsUser(user))
/*      */     {
/*  982 */       SFSErrorData errData = new SFSErrorData(SFSErrorCode.SWITCH_NOT_JOINED_IN_ROOM);
/*  983 */       errData.addParameter(this.name);
/*      */ 
/*  985 */       throw new SFSRoomException(String.format("%s is not joined in %s", new Object[] { user, this }));
/*      */     }
/*      */ 
/*  992 */     this.switchUserLock.lock();
/*      */     try
/*      */     {
/*  996 */       if (getSize().getSpectatorCount() < this.maxSpectators)
/*      */       {
/*  998 */         int currentPlayerId = user.getPlayerId(this);
/*      */ 
/* 1001 */         user.setPlayerId(-1, this);
/*      */ 
/* 1004 */         this.playerIdGenerator.freePlayerSlot(currentPlayerId);
/*      */       }
/*      */       else
/*      */       {
/* 1010 */         SFSErrorData errData = new SFSErrorData(SFSErrorCode.SWITCH_NO_SPECTATOR_SLOTS_AVAILABLE);
/* 1011 */         errData.addParameter(this.name);
/*      */ 
/* 1013 */         throw new SFSRoomException("All Spectators slots are already occupied!", errData);
/*      */       }
/*      */ 
/*      */     }
/*      */     finally
/*      */     {
/* 1019 */       this.switchUserLock.unlock(); } this.switchUserLock.unlock();
/*      */   }
/*      */ 
/*      */   public void switchSpectatorToPlayer(User user)
/*      */     throws SFSRoomException
/*      */   {
/* 1029 */     if (!isGame())
/*      */     {
/* 1031 */       SFSErrorData errData = new SFSErrorData(SFSErrorCode.SWITCH_NOT_A_GAME_ROOM);
/* 1032 */       errData.addParameter(this.name);
/*      */ 
/* 1034 */       throw new SFSRoomException("Not supported in a non-game room", errData);
/*      */     }
/*      */ 
/* 1038 */     if (!this.userManager.containsUser(user))
/*      */     {
/* 1040 */       SFSErrorData errData = new SFSErrorData(SFSErrorCode.SWITCH_NOT_JOINED_IN_ROOM);
/* 1041 */       errData.addParameter(this.name);
/*      */ 
/* 1043 */       throw new SFSRoomException(String.format("%s is not joined in %s", new Object[] { user, this }));
/*      */     }
/*      */ 
/* 1051 */     this.switchUserLock.lock();
/*      */     try
/*      */     {
/* 1055 */       if (getSize().getUserCount() < this.maxUsers)
/*      */       {
/* 1058 */         user.setPlayerId(this.playerIdGenerator.getPlayerSlot(), this);
/*      */       }
/*      */       else
/*      */       {
/* 1073 */         SFSErrorData errData = new SFSErrorData(SFSErrorCode.SWITCH_NO_PLAYER_SLOTS_AVAILABLE);
/* 1074 */         errData.addParameter(this.name);
/*      */ 
/* 1076 */         throw new SFSRoomException("All Player slots are already occupied!", errData);
/*      */       }
/*      */ 
/*      */     }
/*      */     finally
/*      */     {
/* 1082 */       this.switchUserLock.unlock(); } this.switchUserLock.unlock();
/*      */   }
/*      */ 
/*      */   public boolean isEmpty()
/*      */   {
/* 1090 */     return this.userManager.getUserCount() == 0;
/*      */   }
/*      */ 
/*      */   public boolean isFull()
/*      */   {
/* 1097 */     if (isGame()) {
/* 1098 */       return getSize().getUserCount() == this.maxUsers;
/*      */     }
/* 1100 */     return this.userManager.getUserCount() == this.maxUsers;
/*      */   }
/*      */ 
/*      */   public ISFSArray getUserListData()
/*      */   {
/* 1106 */     ISFSArray userListData = SFSArray.newInstance();
/*      */ 
/* 1109 */     for (User user : this.userManager.getAllUsers())
/*      */     {
/* 1111 */       ISFSArray userObj = SFSArray.newInstance();
/*      */ 
/* 1113 */       userObj.addInt(user.getId());
/* 1114 */       userObj.addUtfString(user.getName());
/* 1115 */       userObj.addShort(user.getPrivilegeId());
/* 1116 */       userObj.addShort((short)user.getPlayerId(this));
/* 1117 */       userObj.addSFSArray(user.getUserVariablesData());
/*      */ 
/* 1119 */       userListData.addSFSArray(userObj);
/*      */     }
/*      */ 
/* 1122 */     return userListData;
/*      */   }
/*      */ 
/*      */   public ISFSArray getRoomVariablesData(boolean globalsOnly)
/*      */   {
/* 1129 */     ISFSArray variablesData = SFSArray.newInstance();
/*      */ 
/* 1132 */     for (RoomVariable var : this.variables.values())
/*      */     {
/* 1135 */       if (var.isHidden())
/*      */       {
/*      */         continue;
/*      */       }
/* 1139 */       if ((globalsOnly) && (!var.isGlobal())) {
/*      */         continue;
/*      */       }
/* 1142 */       variablesData.addSFSArray(var.toSFSArray());
/*      */     }
/*      */ 
/* 1145 */     return variablesData;
/*      */   }
/*      */ 
/*      */   public String toString()
/*      */   {
/* 1151 */     return String.format("[ Room: %s, Id: %s, Group: %s, isGame: %s ]", new Object[] { this.name, Integer.valueOf(this.id), this.groupId, Boolean.valueOf(this.game) });
/*      */   }
/*      */ 
/*      */   public boolean equals(Object obj)
/*      */   {
/* 1157 */     if (!(obj instanceof Room)) {
/* 1158 */       return false;
/*      */     }
/* 1160 */     Room room = (Room)obj;
/* 1161 */     boolean isEqual = false;
/*      */ 
/* 1163 */     if (room.getId() == this.id) {
/* 1164 */       isEqual = true;
/*      */     }
/* 1166 */     return isEqual;
/*      */   }
/*      */ 
/*      */   public ISFSExtension getExtension()
/*      */   {
/* 1173 */     return this.extension;
/*      */   }
/*      */ 
/*      */   public void setExtension(ISFSExtension extension)
/*      */   {
/* 1179 */     this.extension = extension;
/*      */   }
/*      */ 
/*      */   public ISFSArray toSFSArray(boolean globalRoomVarsOnly)
/*      */   {
/* 1185 */     RoomSize roomSize = getSize();
/*      */ 
/* 1187 */     ISFSArray roomObj = SFSArray.newInstance();
/* 1188 */     roomObj.addInt(this.id);
/* 1189 */     roomObj.addUtfString(this.name);
/* 1190 */     roomObj.addUtfString(this.groupId);
/*      */ 
/* 1192 */     roomObj.addBool(isGame());
/* 1193 */     roomObj.addBool(isHidden());
/* 1194 */     roomObj.addBool(isPasswordProtected());
/*      */ 
/* 1196 */     roomObj.addShort((short)roomSize.getUserCount());
/* 1197 */     roomObj.addShort((short)this.maxUsers);
/*      */ 
/* 1200 */     roomObj.addSFSArray(getRoomVariablesData(globalRoomVarsOnly));
/*      */ 
/* 1202 */     if (isGame())
/*      */     {
/* 1204 */       roomObj.addShort((short)roomSize.getSpectatorCount());
/* 1205 */       roomObj.addShort((short)this.maxSpectators);
/*      */     }
/*      */ 
/* 1208 */     return roomObj;
/*      */   }
/*      */ 
/*      */   public String getDump()
/*      */   {
/* 1215 */     StringBuilder sb = new StringBuilder("/////////////// Room Dump ////////////////").append("\n");
/* 1216 */     sb.append("\tName: ").append(this.name).append("\n")
/* 1217 */       .append("\tId: ").append(this.id).append("\n")
/* 1218 */       .append("\tGroupId: ").append(this.groupId).append("\n")
/* 1219 */       .append("\tPassword: ").append(this.password).append("\n")
/* 1220 */       .append("\tOwner: ").append(this.owner == null ? "[[ SERVER ]]" : this.owner.toString()).append("\n")
/* 1221 */       .append("\tisDynamic: ").append(this.dynamic).append("\n")
/* 1222 */       .append("\tisGame: ").append(this.game).append("\n")
/* 1223 */       .append("\tisHidden: ").append(this.hidden).append("\n")
/* 1224 */       .append("\tsize: ").append(getSize()).append("\n")
/* 1225 */       .append("\tMaxUser: ").append(this.maxUsers).append("\n")
/* 1226 */       .append("\tMaxSpect: ").append(this.maxSpectators).append("\n")
/* 1227 */       .append("\tMaxVars: ").append(this.maxRoomVariablesAllowed).append("\n")
/* 1228 */       .append("\tRemoveMode: ").append(this.autoRemoveMode).append("\n")
/* 1229 */       .append("\tPlayerIdGen: ").append(this.playerIdGenerator).append("\n")
/* 1230 */       .append("\tSettings: ").append("\n");
/*      */ 
/* 1232 */     for (SFSRoomSettings setting : SFSRoomSettings.values())
/*      */     {
/* 1234 */       sb.append("\t\t").append(setting).append(": ").append(this.flags.contains(setting)).append("\n");
/*      */     }
/*      */ 
/* 1237 */     if (this.variables.size() > 0)
/*      */     {
/* 1239 */       sb.append("\tRoomVariables: ").append("\n");
/*      */ 
/* 1241 */       for (RoomVariable var : this.variables.values())
/*      */       {
/* 1243 */         sb.append("\t\t").append(var.toString()).append("\n");
/*      */       }
/*      */     }
/*      */ 
/* 1247 */     if (this.properties.size() > 0)
/*      */     {
/* 1249 */       sb.append("\tProperties: ").append("\n");
/*      */ 
/* 1251 */       for (??? = this.properties.keySet().iterator(); ???.hasNext(); ) { Object key = ???.next();
/*      */ 
/* 1253 */         sb.append("\t\t").append(key).append(": ").append(this.properties.get(key)).append("\n");
/*      */       }
/*      */     }
/*      */ 
/* 1257 */     if (this.extension != null)
/*      */     {
/* 1259 */       sb.append("\tExtension: ").append("\n");
/*      */ 
/* 1261 */       sb.append("\t\t").append("Name: ").append(this.extension.getName()).append("\n");
/* 1262 */       sb.append("\t\t").append("Class: ").append(this.extension.getExtensionFileName()).append("\n");
/* 1263 */       sb.append("\t\t").append("Type: ").append(this.extension.getType()).append("\n");
/* 1264 */       sb.append("\t\t").append("Props: ").append(this.extension.getPropertiesFileName()).append("\n");
/*      */     }
/*      */ 
/* 1280 */     sb.append("/////////////// End Dump /////////////////").append("\n");
/*      */ 
/* 1282 */     return sb.toString();
/*      */   }
/*      */ 
/*      */   public IAdminHelper getAdminHelper()
/*      */   {
/* 1287 */     return this.adminHelper;
/*      */   }
/*      */ 
/*      */   public void setAdminHelper(IAdminHelper helper)
/*      */   {
/* 1292 */     this.adminHelper = helper;
/*      */   }
/*      */ 
/*      */   private void instantiateRoomIdGenerator()
/*      */   {
/* 1302 */     String className = this.zone.getDefaultPlayerIdGeneratorClassName();
/*      */ 
/* 1304 */     if (className == null) {
/* 1305 */       className = "com.smartfoxserver.v2.util.DefaultPlayerIdGenerator";
/*      */     }
/*      */ 
/*      */     try
/*      */     {
/* 1311 */       Class theClass = Class.forName(className);
/* 1312 */       this.playerIdGenerator = ((IPlayerIdGenerator)theClass.newInstance());
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/* 1316 */       this.logger.error("Could not instantiate the IPlayerIdGenerator object. Room: " + this + ", class: " + className + ", err: " + e);
/*      */     }
/*      */   }
/*      */ 
/*      */   private void populateTransientFields()
/*      */   {
/* 1328 */     this.logger = LoggerFactory.getLogger(getClass());
/*      */ 
/* 1331 */     this.extension = null;
/*      */   }
/*      */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.SFSRoom
 * JD-Core Version:    0.6.0
 */