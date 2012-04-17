/*      */ package com.smartfoxserver.v2.api;
/*      */ 
/*      */ import com.smartfoxserver.bitswarm.io.IResponse;
/*      */ import com.smartfoxserver.bitswarm.io.Response;
/*      */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*      */ import com.smartfoxserver.bitswarm.sessions.ISessionManager;
/*      */ import com.smartfoxserver.v2.SmartFoxServer;
/*      */ import com.smartfoxserver.v2.api.response.ISFSResponseApi;
/*      */ import com.smartfoxserver.v2.api.response.SFSResponseApi;
/*      */ import com.smartfoxserver.v2.buddylist.Buddy;
/*      */ import com.smartfoxserver.v2.buddylist.BuddyList;
/*      */ import com.smartfoxserver.v2.buddylist.BuddyListManager;
/*      */ import com.smartfoxserver.v2.buddylist.BuddyProperties;
/*      */ import com.smartfoxserver.v2.config.DefaultConstants;
/*      */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*      */ import com.smartfoxserver.v2.core.ISFSEventManager;
/*      */ import com.smartfoxserver.v2.core.SFSEvent;
/*      */ import com.smartfoxserver.v2.core.SFSEventParam;
/*      */ import com.smartfoxserver.v2.core.SFSEventType;
/*      */ import com.smartfoxserver.v2.entities.Room;
/*      */ import com.smartfoxserver.v2.entities.SFSRoomSettings;
/*      */ import com.smartfoxserver.v2.entities.User;
/*      */ import com.smartfoxserver.v2.entities.Zone;
/*      */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*      */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*      */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*      */ import com.smartfoxserver.v2.entities.managers.BanMode;
/*      */ import com.smartfoxserver.v2.entities.managers.IBannedUserManager;
/*      */ import com.smartfoxserver.v2.entities.managers.IUserManager;
/*      */ import com.smartfoxserver.v2.entities.managers.IZoneManager;
/*      */ import com.smartfoxserver.v2.entities.match.MatchExpression;
/*      */ import com.smartfoxserver.v2.entities.match.MatchingUtils;
/*      */ import com.smartfoxserver.v2.entities.variables.RoomVariable;
/*      */ import com.smartfoxserver.v2.entities.variables.UserVariable;
/*      */ import com.smartfoxserver.v2.exceptions.SFSBuddyListException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSCreateRoomException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSErrorCode;
/*      */ import com.smartfoxserver.v2.exceptions.SFSErrorData;
/*      */ import com.smartfoxserver.v2.exceptions.SFSException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSJoinRoomException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSLoginException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSRoomException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSVariableException;
/*      */ import com.smartfoxserver.v2.game.SFSGame;
/*      */ import com.smartfoxserver.v2.security.IPermissionProfile;
/*      */ import com.smartfoxserver.v2.util.ClientDisconnectionReason;
/*      */ import com.smartfoxserver.v2.util.CryptoUtils;
/*      */ import com.smartfoxserver.v2.util.IDisconnectionReason;
/*      */ import com.smartfoxserver.v2.util.IWordFilter;
/*      */ import com.smartfoxserver.v2.util.UsersUtil;
/*      */ import com.smartfoxserver.v2.util.filters.FilteredMessage;
/*      */ import java.io.IOException;
/*      */ import java.util.ArrayList;
/*      */ import java.util.Arrays;
/*      */ import java.util.Collection;
/*      */ import java.util.HashMap;
/*      */ import java.util.List;
/*      */ import java.util.Map;
/*      */ import org.slf4j.Logger;
/*      */ import org.slf4j.LoggerFactory;
/*      */ 
/*      */ public class SFSApi
/*      */   implements ISFSApi
/*      */ {
/*      */   protected final SmartFoxServer sfs;
/*      */   protected final Logger log;
/*      */   protected IUserManager globalUserManager;
/*      */   private final LoginErrorHandler loginErrorHandler;
/*      */   private final MatchingUtils matcher;
/*      */   protected final ISFSResponseApi responseAPI;
/*      */ 
/*      */   public SFSApi(SmartFoxServer sfs)
/*      */   {
/*   87 */     this.log = LoggerFactory.getLogger(getClass());
/*   88 */     this.sfs = sfs;
/*   89 */     this.globalUserManager = sfs.getUserManager();
/*   90 */     this.loginErrorHandler = new LoginErrorHandler();
/*   91 */     this.matcher = MatchingUtils.getInstance();
/*   92 */     this.responseAPI = new SFSResponseApi();
/*      */   }
/*      */ 
/*      */   public ISFSResponseApi getResponseAPI()
/*      */   {
/*   99 */     return this.responseAPI;
/*      */   }
/*      */ 
/*      */   public User getUserById(int userId)
/*      */   {
/*  106 */     return this.globalUserManager.getUserById(userId);
/*      */   }
/*      */ 
/*      */   public User getUserByName(String name)
/*      */   {
/*  113 */     return this.globalUserManager.getUserByName(name);
/*      */   }
/*      */ 
/*      */   public User getUserBySession(ISession session)
/*      */   {
/*  120 */     return this.globalUserManager.getUserBySession(session);
/*      */   }
/*      */ 
/*      */   public void kickUser(User userToKick, User modUser, String kickMessage, int delaySeconds)
/*      */   {
/*  127 */     this.log.info("Kicking user: " + userToKick);
/*  128 */     this.sfs.getBannedUserManager().kickUser(userToKick, modUser, kickMessage, delaySeconds);
/*      */   }
/*      */ 
/*      */   public void banUser(User userToBan, User modUser, String banMessage, BanMode mode, int durationMinutes, int delaySeconds)
/*      */   {
/*  135 */     this.sfs.getBannedUserManager().banUser(
/*  137 */       userToBan, 
/*  138 */       modUser, 
/*  139 */       durationMinutes, 
/*  140 */       mode, 
/*  141 */       "", 
/*  142 */       banMessage, 
/*  143 */       delaySeconds);
/*      */   }
/*      */ 
/*      */   public List<Room> findRooms(Collection<Room> roomList, MatchExpression expression, int limit)
/*      */   {
/*  151 */     return this.matcher.matchRooms(roomList, expression, limit);
/*      */   }
/*      */ 
/*      */   public List<User> findUsers(Collection<User> userList, MatchExpression expression, int limit)
/*      */   {
/*  158 */     return this.matcher.matchUsers(userList, expression, limit);
/*      */   }
/*      */ 
/*      */   public void disconnect(ISession session)
/*      */   {
/*  168 */     if (session == null) {
/*  169 */       throw new SFSRuntimeException("Unexpected, cannot disconnect session. Session object is null.");
/*      */     }
/*  171 */     User lostUser = this.globalUserManager.getUserBySession(session);
/*      */ 
/*  174 */     if (lostUser != null) {
/*  175 */       disconnectUser(lostUser);
/*      */     }
/*  183 */     else if (session.isConnected())
/*      */     {
/*      */       try
/*      */       {
/*  187 */         session.close();
/*      */       }
/*      */       catch (IOException err)
/*      */       {
/*  191 */         throw new SFSRuntimeException(err);
/*      */       }
/*      */     }
/*      */   }
/*      */ 
/*      */   public void disconnectUser(User user, IDisconnectionReason reason)
/*      */   {
/*  206 */     user.getSession().setSystemProperty("disconnectionReason", reason);
/*  207 */     this.responseAPI.notifyClientSideDisconnection(user, reason);
/*      */   }
/*      */ 
/*      */   public void disconnectUser(User user)
/*      */   {
/*  218 */     if (user == null) {
/*  219 */       throw new SFSRuntimeException("Cannot disconnect user, User object is null."); } ISession session = user.getSession();
/*  222 */     Zone zone = user.getZone();
/*      */ 
/*  225 */     List<Room> joinedRooms = user.getJoinedRooms();
/*      */ 
/*  228 */     Map playerIds = user.getPlayerIds();
/*      */     Object disconnectionReason;
/*      */     Room r;
/*      */     boolean goodToGo;
/*      */     Map evtParams;

/*      */     try { if (session.isConnected()) {
/*  234 */         session.close();
/*      */       }
/*  236 */       user.setConnected(false);
/*      */     }
/*      */     catch (IOException err)
/*      */     {
/*  240 */       throw new SFSRuntimeException(err);
/*      */     }
/*      */     finally
/*      */     {
/*  245 */       if (zone != null) {
/*  246 */         zone.removeUser(user);
/*      */       }
/*      */ 
/*  249 */       this.globalUserManager.removeUser(user);
/*      */ 
/*  252 */       this.responseAPI.notifyUserLost(user, joinedRooms);
/*      */ 
/*  255 */       user.setConnected(false);
/*      */ 
/*  262 */       for (Room r : joinedRooms)
/*      */       {
/*  264 */         boolean goodToGo = (r != null) && (r.isActive());
/*      */ 
/*  266 */         if (!goodToGo) {
/*      */           continue;
/*      */         }
/*  269 */         this.responseAPI.notifyUserCountChange(zone, r);
/*      */ 
/*  272 */         this.responseAPI.notifyRoomVariablesUpdate(r, r.removeVariablesCreatedByUser(user));
/*      */       }
/*      */ 
/*  277 */       Map evtParams = new HashMap();
/*  278 */       evtParams.put(SFSEventParam.ZONE, zone);
/*  279 */       evtParams.put(SFSEventParam.USER, user);
/*  280 */       evtParams.put(SFSEventParam.JOINED_ROOMS, joinedRooms);
/*  281 */       evtParams.put(SFSEventParam.PLAYER_IDS_BY_ROOM, playerIds);
/*      */ 
/*  283 */       disconnectionReason = (IDisconnectionReason)user.getSession().getSystemProperty("disconnectionReason");
/*  284 */       evtParams.put(SFSEventParam.DISCONNECTION_REASON, disconnectionReason == null ? ClientDisconnectionReason.UNKNOWN : disconnectionReason);
/*      */ 
/*  287 */       this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.USER_DISCONNECT, evtParams));
/*      */ 
/*  300 */       for (Room r : user.getCreatedRooms())
/*      */       {
/*  303 */         if ((r != null) && (!joinedRooms.contains(r))) {
/*  304 */           zone.checkAndRemove(r);
/*      */         }
/*      */       }
/*      */ 
/*  308 */       this.log.info("User disconnected: " + user);
/*      */     }
/*      */   }
/*      */ 
/*      */   public void removeRoom(Room room)
/*      */   {
/*  316 */     removeRoom(room, true, true);
/*      */   }
/*      */ 
/*      */   public void removeRoom(Room room, boolean fireClientEvent, boolean fireServerEvent)
/*      */   {
/*  324 */     room.getZone().removeRoom(room);
/*      */ 
/*  327 */     if (fireClientEvent) {
/*  328 */       this.responseAPI.notifyRoomRemoved(room);
/*      */     }
/*      */ 
/*  331 */     if (fireServerEvent)
/*      */     {
/*  333 */       Map evtParams = new HashMap();
/*  334 */       evtParams.put(SFSEventParam.ZONE, room.getZone());
/*  335 */       evtParams.put(SFSEventParam.ROOM, room);
/*      */ 
/*  337 */       this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.ROOM_REMOVED, evtParams));
/*      */     }
/*      */   }
/*      */ 
/*      */   public boolean checkSecurePassword(ISession session, String originalPass, String encryptedPass)
/*      */   {
/*  346 */     if ((originalPass == null) || (originalPass.length() < 1)) {
/*  347 */       return false;
/*      */     }
/*  349 */     if ((encryptedPass == null) || (encryptedPass.length() < 1)) {
/*  350 */       return false;
/*      */     }
/*      */ 
/*  354 */     return encryptedPass.equalsIgnoreCase(CryptoUtils.getClientPassword(session, originalPass));
/*      */   }
/*      */ 
/*      */   public User login(ISession sender, String name, String pass, String zoneName, ISFSObject paramsOut)
/*      */   {
/*  361 */     return login(sender, name, pass, zoneName, paramsOut, false);
/*      */   }
/*      */ 
/*      */   public User login(ISession sender, String name, String pass, String zoneName, ISFSObject paramsOut, boolean forceLogout)
/*      */   {
/*  368 */     ISFSObject resObj = SFSObject.newInstance();
/*  369 */     User user = null;
/*      */ 
/*  372 */     IResponse response = new Response();
/*  373 */     response.setId(SystemRequest.Login.getId());
/*  374 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/*  375 */     response.setContent(resObj);
/*  376 */     response.setRecipients(sender);
/*      */ 
/*  378 */     Zone zone = this.sfs.getZoneManager().getZoneByName(zoneName);
/*      */ 
/*  381 */     if (zone == null)
/*      */     {
/*  383 */       resObj.putShort("ec", SFSErrorCode.LOGIN_BAD_ZONENAME.getId());
/*  384 */       resObj.putUtfStringArray("ep", Arrays.asList(new String[] { zoneName }));
/*      */ 
/*  387 */       response.write();
/*      */ 
/*  390 */       this.log.info("Bad login request, Zone: " + zoneName + " does not exist. Requested by: " + sender);
/*      */ 
/*  393 */       return null;
/*      */     }
/*      */ 
/*      */     try
/*      */     {
/*  410 */       user = zone.login(sender, name, pass, forceLogout);
/*  411 */       user.setConnected(true);
/*      */ 
/*  414 */       sender.setLoggedIn(true);
/*      */ 
/*  424 */       user.subscribeGroup("default");
/*      */ 
/*  433 */       IPermissionProfile profile = (IPermissionProfile)sender.getProperty("$permission");
/*  434 */       if (profile != null) {
/*  435 */         user.setPrivilegeId(profile.getId());
/*      */       }
/*  437 */       this.log.info("Login in, " + zone.toString() + ", " + user.toString());
/*      */ 
/*  440 */       if (user.isNpc()) {
/*  441 */         return user;
/*      */       }
/*      */ 
/*  444 */       user.updateLastRequestTime();
/*      */ 
/*  447 */       resObj.putInt("id", user.getId());
/*      */ 
/*  450 */       resObj.putUtfString("zn", zone.getName());
/*      */ 
/*  453 */       resObj.putUtfString("un", user.getName());
/*      */ 
/*  456 */       resObj.putShort("rs", (short)zone.getUserReconnectionSeconds());
/*      */ 
/*  459 */       resObj.putShort("pi", user.getPrivilegeId());
/*      */ 
/*  462 */       resObj.putSFSArray("rl", zone.getRoomListData());
/*      */ 
/*  465 */       if ((paramsOut != null) && (paramsOut.size() > 0)) {
/*  466 */         resObj.putSFSObject("p", paramsOut);
/*      */       }
/*      */ 
/*  469 */       response.write();
/*      */ 
/*  478 */       Map evtParams = new HashMap();
/*  479 */       evtParams.put(SFSEventParam.ZONE, zone);
/*  480 */       evtParams.put(SFSEventParam.USER, user);
/*      */ 
/*  482 */       this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.USER_JOIN_ZONE, evtParams));
/*      */     }
/*      */     catch (SFSLoginException err)
/*      */     {
/*  492 */       this.log.info("Login error: " + err.getMessage() + ". Requested by: " + sender);
/*  493 */       this.loginErrorHandler.execute(sender, err);
/*      */     }
/*      */ 
/*  496 */     return user;
/*      */   }
/*      */ 
/*      */   public void logout(User user)
/*      */   {
/*  503 */     if (user == null) {
/*  504 */       throw new SFSRuntimeException("Cannot logout null user.");
/*      */     }
/*  506 */     Zone zone = user.getZone();
/*      */ 
/*  509 */     List joinedRooms = user.getJoinedRooms();
/*      */ 
/*  512 */     Map playerIds = user.getPlayerIds();
/*      */ 
/*  515 */     user.setConnected(false);
/*      */ 
/*  518 */     zone.removeUser(user);
/*      */ 
/*  521 */     this.globalUserManager.removeUser(user);
/*      */ 
/*  524 */     user.getSession().setLoggedIn(false);
/*      */ 
/*  528 */     this.responseAPI.notifyUserLost(user, joinedRooms);
/*      */ 
/*  535 */     for (Room r : joinedRooms)
/*      */     {
/*  537 */       boolean goodToGo = (r != null) && (r.isActive());
/*      */ 
/*  539 */       if (!goodToGo) {
/*      */         continue;
/*      */       }
/*  542 */       this.responseAPI.notifyUserCountChange(zone, r);
/*      */ 
/*  545 */       this.responseAPI.notifyRoomVariablesUpdate(r, r.removeVariablesCreatedByUser(user));
/*      */     }
/*      */ 
/*  550 */     for (Room r : user.getCreatedRooms())
/*      */     {
/*  553 */       if ((r != null) && (!joinedRooms.contains(r))) {
/*  554 */         zone.checkAndRemove(r);
/*      */       }
/*      */     }
/*      */ 
/*  558 */     this.responseAPI.notifyLogout(user.getSession(), zone.getName());
/*      */ 
/*  561 */     Map evtParams = new HashMap();
/*  562 */     evtParams.put(SFSEventParam.ZONE, zone);
/*  563 */     evtParams.put(SFSEventParam.USER, user);
/*  564 */     evtParams.put(SFSEventParam.JOINED_ROOMS, joinedRooms);
/*  565 */     evtParams.put(SFSEventParam.PLAYER_IDS_BY_ROOM, playerIds);
/*      */ 
/*  567 */     this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.USER_LOGOUT, evtParams));
/*      */ 
/*  570 */     this.log.info("User logout: " + user);
/*      */   }
/*      */ 
/*      */   public User createNPC(String userName, Zone zone, boolean forceLogin)
/*      */     throws SFSLoginException
/*      */   {
/*  578 */     ISession socketLessSession = this.sfs.getSessionManager().createConnectionlessSession();
/*      */ 
/*  581 */     User npcUser = zone.login(socketLessSession, userName, null);
/*      */ 
/*  583 */     npcUser.setConnected(true);
/*  584 */     socketLessSession.setLoggedIn(true);
/*      */ 
/*  586 */     return npcUser;
/*      */   }
/*      */ 
/*      */   public Room createRoom(Zone zone, CreateRoomSettings params, User owner)
/*      */     throws SFSCreateRoomException
/*      */   {
/*  593 */     return createRoom(zone, params, owner, false, null, true, true);
/*      */   }
/*      */ 
/*      */   public Room createRoom(Zone zone, CreateRoomSettings params, User owner, boolean joinIt, Room roomToLeave)
/*      */     throws SFSCreateRoomException
/*      */   {
/*  600 */     return createRoom(zone, params, owner, joinIt, roomToLeave, true, true);
/*      */   }
/*      */ 
/*      */   public Room createRoom(Zone zone, CreateRoomSettings params, User owner, boolean joinIt, Room roomToLeave, boolean fireClientEvent, boolean fireServerEvent)
/*      */     throws SFSCreateRoomException
/*      */   {
/*  613 */     Room theRoom = null;
/*      */     try
/*      */     {
/*  618 */       String groupId = params.getGroupId();
/*  619 */       if ((groupId == null) || (groupId.length() == 0)) {
/*  620 */         params.setGroupId("default");
/*      */       }
/*      */ 
/*  623 */       theRoom = zone.createRoom(params, owner);
/*      */ 
/*  626 */       if (owner != null)
/*      */       {
/*  628 */         owner.addCreatedRoom(theRoom);
/*      */ 
/*  631 */         owner.updateLastRequestTime();
/*      */       }
/*      */ 
/*  634 */       this.log.info("Room created: " + theRoom);
/*      */ 
/*  636 */       if (fireClientEvent) {
/*  637 */         this.responseAPI.notifyRoomAdded(theRoom);
/*      */       }
/*      */ 
/*  640 */       if (fireServerEvent)
/*      */       {
/*  642 */         Map eventParams = new HashMap();
/*  643 */         eventParams.put(SFSEventParam.ZONE, zone);
/*  644 */         eventParams.put(SFSEventParam.ROOM, theRoom);
/*      */ 
/*  646 */         this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.ROOM_ADDED, eventParams));
/*      */       }
/*      */ 
/*      */     }
/*      */     catch (SFSCreateRoomException err)
/*      */     {
/*  653 */       if (fireClientEvent) {
/*  654 */         this.responseAPI.notifyRequestError(err, owner, SystemRequest.CreateRoom);
/*      */       }
/*  656 */       String message = String.format("Room creation error. %s, %s, %s", new Object[] { err.getMessage(), zone, owner });
/*  657 */       throw new SFSCreateRoomException(message);
/*      */     }
/*      */ 
/*  661 */     if ((theRoom != null) && (owner != null) && (joinIt))
/*      */     {
/*      */       try
/*      */       {
/*  665 */         joinRoom(owner, theRoom, theRoom.getPassword(), false, roomToLeave, true, true);
/*      */       }
/*      */       catch (SFSJoinRoomException e)
/*      */       {
/*  669 */         this.log.warn("Unable to join the just created Room: " + theRoom + ", reason: " + e.getMessage());
/*      */       }
/*      */     }
/*      */ 
/*  673 */     return theRoom;
/*      */   }
/*      */ 
/*      */   public void joinRoom(User user, Room room)
/*      */     throws SFSJoinRoomException
/*      */   {
/*  680 */     joinRoom(user, room, "", false, user.getLastJoinedRoom());
/*      */   }
/*      */ 
/*      */   public void joinRoom(User user, Room roomToJoin, String password, boolean asSpectator, Room roomToLeave)
/*      */     throws SFSJoinRoomException
/*      */   {
/*  691 */     joinRoom(user, roomToJoin, password, asSpectator, roomToLeave, true, true);
/*      */   }
/*      */ 
/*      */   public void joinRoom(User user, Room roomToJoin, String password, boolean asSpectator, Room roomToLeave, boolean fireClientEvent, boolean fireServerEvent)
/*      */     throws SFSJoinRoomException
/*      */   {
/*      */     try
/*      */     {
/*  710 */       if (user.isJoining()) {
/*  711 */         throw new SFSRuntimeException("Join request discarded. User is already in a join transaction: " + user);
/*      */       }
/*      */ 
/*  714 */       user.setJoining(true);
/*      */ 
/*  722 */       if (roomToJoin == null) {
/*  723 */         throw new SFSJoinRoomException("Requested room doesn't exist", new SFSErrorData(SFSErrorCode.JOIN_BAD_ROOM));
/*      */       }
/*      */ 
/*  728 */       if (!roomToJoin.isActive())
/*      */       {
/*  730 */         String message = String.format("Room is currently locked, %s", new Object[] { roomToJoin });
/*  731 */         SFSErrorData errData = new SFSErrorData(SFSErrorCode.JOIN_ROOM_LOCKED);
/*  732 */         errData.addParameter(roomToJoin.getName());
/*      */ 
/*  734 */         throw new SFSJoinRoomException(message, errData);
/*      */       }
/*      */ 
/*  740 */       boolean isSFSGame = roomToJoin instanceof SFSGame;
/*      */ 
/*  742 */       if (isSFSGame)
/*      */       {
/*      */         try
/*      */         {
/*  746 */           checkSFSGameAccess((SFSGame)roomToJoin, user, asSpectator);
/*      */         }
/*      */         catch (SFSRoomException e)
/*      */         {
/*  750 */           throw new SFSJoinRoomException(e.getMessage(), e.getErrorData());
/*      */         }
/*      */       }
/*      */ 
/*  754 */       boolean doorIsOpen = true;
/*  755 */       if (roomToJoin.isPasswordProtected()) {
/*  756 */         doorIsOpen = roomToJoin.getPassword().equals(password);
/*      */       }
/*      */ 
/*  759 */       if (!doorIsOpen)
/*      */       {
/*  761 */         String message = String.format("Room password is wrong, %s", new Object[] { roomToJoin });
/*  762 */         SFSErrorData data = new SFSErrorData(SFSErrorCode.JOIN_BAD_PASSWORD);
/*  763 */         data.addParameter(roomToJoin.getName());
/*      */ 
/*  765 */         throw new SFSJoinRoomException(message, data);
/*      */       }
/*      */ 
/*  769 */       roomToJoin.addUser(user, asSpectator);
/*      */ 
/*  772 */       user.updateLastRequestTime();
/*      */ 
/*  775 */       if (fireClientEvent)
/*      */       {
/*  778 */         this.responseAPI.notifyJoinRoomSuccess(user, roomToJoin);
/*      */ 
/*  781 */         this.responseAPI.notifyUserEnterRoom(user, roomToJoin);
/*      */ 
/*  784 */         this.responseAPI.notifyUserCountChange(user.getZone(), roomToJoin);
/*      */       }
/*      */ 
/*  788 */       if (fireServerEvent)
/*      */       {
/*  790 */         Map evtParams = new HashMap();
/*  791 */         evtParams.put(SFSEventParam.ZONE, user.getZone());
/*  792 */         evtParams.put(SFSEventParam.ROOM, roomToJoin);
/*  793 */         evtParams.put(SFSEventParam.USER, user);
/*      */ 
/*  795 */         this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.USER_JOIN_ROOM, evtParams));
/*      */       }
/*      */ 
/*  799 */       if (roomToLeave != null) {
/*  800 */         leaveRoom(user, roomToLeave);
/*      */       }
/*      */     }
/*      */     catch (SFSJoinRoomException err)
/*      */     {
/*  805 */       if (fireClientEvent) {
/*  806 */         this.responseAPI.notifyRequestError(err, user, SystemRequest.JoinRoom);
/*      */       }
/*      */ 
/*  809 */       String message = String.format("Join Error - %s", new Object[] { err.getMessage() });
/*  810 */       throw new SFSJoinRoomException(message);
/*      */     }
/*      */     finally
/*      */     {
/*  816 */       user.setJoining(false);
/*      */     }
/*      */   }
/*      */ 
/*      */   public void leaveRoom(User user, Room room)
/*      */   {
/*  824 */     leaveRoom(user, room, true, true);
/*      */   }
/*      */ 
/*      */   public void leaveRoom(User user, Room room, boolean fireClientEvent, boolean fireServerEvent)
/*      */   {
/*  834 */     if (room == null)
/*      */     {
/*  836 */       room = user.getLastJoinedRoom();
/*      */ 
/*  838 */       if (room == null) {
/*  839 */         throw new SFSRuntimeException("LeaveRoom failed: user is not joined in any room. " + user);
/*      */       }
/*      */     }
/*      */ 
/*  843 */     int playerId = user.getPlayerId(room);
/*      */ 
/*  846 */     user.getZone().removeUserFromRoom(user, room);
/*      */ 
/*  849 */     user.updateLastRequestTime();
/*      */ 
/*  852 */     if (fireClientEvent) {
/*  853 */       this.responseAPI.notifyUserExitRoom(user, room, room.isFlagSet(SFSRoomSettings.USER_EXIT_EVENT));
/*      */     }
/*      */ 
/*  860 */     boolean goodToGo = (room != null) && (room.isActive());
/*      */ 
/*  862 */     if (goodToGo)
/*      */     {
/*  865 */       this.responseAPI.notifyUserCountChange(user.getZone(), room);
/*      */ 
/*  868 */       this.responseAPI.notifyRoomVariablesUpdate(room, room.removeVariablesCreatedByUser(user));
/*      */     }
/*      */ 
/*  872 */     if (fireServerEvent)
/*      */     {
/*  874 */       Map evtParams = new HashMap();
/*  875 */       evtParams.put(SFSEventParam.ZONE, user.getZone());
/*  876 */       evtParams.put(SFSEventParam.ROOM, room);
/*  877 */       evtParams.put(SFSEventParam.USER, user);
/*  878 */       evtParams.put(SFSEventParam.PLAYER_ID, Integer.valueOf(playerId));
/*      */ 
/*  880 */       this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.USER_LEAVE_ROOM, evtParams));
/*      */     }
/*      */   }
/*      */ 
/*      */   public void sendPublicMessage(Room targetRoom, User sender, String message, ISFSObject params)
/*      */   {
/*  888 */     if (targetRoom == null) {
/*  889 */       throw new IllegalArgumentException("The target Room is null");
/*      */     }
/*  891 */     if (!sender.isJoinedInRoom(targetRoom)) {
/*  892 */       throw new IllegalStateException("Sender " + sender + " is not joined the target room " + targetRoom);
/*      */     }
/*  894 */     if (!targetRoom.isFlagSet(SFSRoomSettings.PUBLIC_MESSAGES)) {
/*  895 */       throw new IllegalArgumentException("Room does not support public messages: " + targetRoom + ", Requested by: " + sender);
/*      */     }
/*      */ 
/*  898 */     if (message.length() == 0)
/*      */     {
/*  900 */       this.log.info("Empty public message request (len == 0) discarded");
/*  901 */       return;
/*      */     }
/*      */ 
/*  908 */     Map evtParams = new HashMap();
/*  909 */     evtParams.put(SFSEventParam.ZONE, sender.getZone());
/*  910 */     evtParams.put(SFSEventParam.ROOM, targetRoom);
/*  911 */     evtParams.put(SFSEventParam.USER, sender);
/*  912 */     evtParams.put(SFSEventParam.MESSAGE, message);
/*      */ 
/*  914 */     this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.PUBLIC_MESSAGE, evtParams));
/*      */ 
/*  916 */     Zone zone = sender.getZone();
/*      */ 
/*  921 */     if ((zone.getWordFilter().isActive()) && (targetRoom.isUseWordsFilter()))
/*      */     {
/*  923 */       FilteredMessage filtered = targetRoom.getZone().getWordFilter().apply(message, sender);
/*      */ 
/*  928 */       if (filtered == null)
/*  929 */         message = "";
/*      */       else {
/*  931 */         message = filtered.getMessage();
/*      */       }
/*      */     }
/*      */ 
/*  935 */     List recipients = targetRoom.getSessionList();
/*      */ 
/*  938 */     sendGenericMessage(GenericMessageType.PUBLIC_MSG, sender, targetRoom.getId(), message, params, recipients);
/*      */   }
/*      */ 
/*      */   public void sendPrivateMessage(User sender, User recipient, String message, ISFSObject params)
/*      */   {
/*  947 */     if (sender == null) {
/*  948 */       throw new IllegalArgumentException("PM sender is null.");
/*      */     }
/*  950 */     if (recipient == null) {
/*  951 */       throw new IllegalArgumentException("PM recipient is null");
/*      */     }
/*  953 */     if (sender == recipient) {
/*  954 */       throw new IllegalStateException("PM sender and receiver are the same. Why?");
/*      */     }
/*      */ 
/*  968 */     if (message.length() == 0)
/*      */     {
/*  970 */       this.log.info("Empty private message request (len == 0) discarded");
/*  971 */       return;
/*      */     }
/*      */ 
/*  974 */     Zone zone = sender.getZone();
/*      */ 
/*  980 */     Map evtParams = new HashMap();
/*  981 */     evtParams.put(SFSEventParam.ZONE, zone);
/*  982 */     evtParams.put(SFSEventParam.USER, sender);
/*  983 */     evtParams.put(SFSEventParam.RECIPIENT, recipient);
/*  984 */     evtParams.put(SFSEventParam.MESSAGE, message);
/*      */ 
/*  986 */     this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.PRIVATE_MESSAGE, evtParams));
/*      */ 
/*  989 */     if ((zone.getWordFilter().isActive()) && (zone.isFilterPrivateMessages()))
/*      */     {
/*  991 */       FilteredMessage filtered = zone.getWordFilter().apply(message, sender);
/*      */ 
/*  996 */       if (filtered == null)
/*  997 */         message = "";
/*      */       else {
/*  999 */         message = filtered.getMessage();
/*      */       }
/*      */ 
/*      */     }
/*      */ 
/* 1006 */     ISFSArray senderData = null;
/* 1007 */     if (!UsersUtil.usersSeeEachOthers(sender, recipient)) {
/* 1008 */       senderData = sender.toSFSArray(sender.getLastJoinedRoom());
/*      */     }
/*      */ 
/* 1011 */     sendGenericMessage(
/* 1013 */       GenericMessageType.PRIVATE_MSG, 
/* 1014 */       sender, 
/* 1015 */       -1, 
/* 1016 */       message, 
/* 1017 */       params, 
/* 1018 */       Arrays.asList(new ISession[] { 
/* 1018 */       recipient.getSession(), sender.getSession() }), 
/* 1019 */       senderData);
/*      */   }
/*      */ 
/*      */   public void sendBuddyMessage(User sender, User recipient, String message, ISFSObject params)
/*      */     throws SFSBuddyListException
/*      */   {
/* 1028 */     if (sender == null) {
/* 1029 */       throw new IllegalArgumentException("BuddyMessage sender is null.");
/*      */     }
/* 1031 */     if (recipient == null) {
/* 1032 */       throw new IllegalArgumentException("BuddyMessage recipient is null");
/*      */     }
/* 1034 */     if (sender == recipient) {
/* 1035 */       throw new IllegalStateException("BuddyMessage sender and receiver are the same. Why?");
/*      */     }
/* 1037 */     String senderName = sender.getName();
/* 1038 */     String recipientName = recipient.getName();
/*      */ 
/* 1040 */     BuddyListManager manager = sender.getZone().getBuddyListManager();
/*      */ 
/* 1042 */     BuddyList senderBuddyList = manager.getBuddyList(senderName);
/* 1043 */     Buddy recipientBuddy = senderBuddyList.getBuddy(recipientName);
/* 1044 */     BuddyList recipientBuddyList = manager.getBuddyList(recipientName);
/* 1045 */     Buddy senderBuddy = recipientBuddyList != null ? recipientBuddyList.getBuddy(senderName) : null;
/*      */ 
/* 1048 */     boolean recipientIsInSenderList = recipientBuddy != null;
/*      */ 
/* 1051 */     boolean recipientIsNotBlockedInSenderList = !recipientBuddy.isBlocked();
/*      */ 
/* 1054 */     boolean senderIsNotBlockedInRecipientList = !senderBuddy.isBlocked();
/*      */ 
/* 1057 */     boolean recipientIsOnline = recipient.getBuddyProperties().isOnline();
/*      */ 
/* 1059 */     Zone zone = sender.getZone();
/*      */ 
/* 1065 */     Map evtParams = new HashMap();
/* 1066 */     evtParams.put(SFSEventParam.ZONE, zone);
/* 1067 */     evtParams.put(SFSEventParam.USER, sender);
/* 1068 */     evtParams.put(SFSEventParam.RECIPIENT, recipient);
/* 1069 */     evtParams.put(SFSEventParam.MESSAGE, message);
/*      */ 
/* 1071 */     this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.BUDDY_MESSAGE, evtParams));
/*      */ 
/* 1075 */     if ((zone.getWordFilter().isActive()) && (zone.isFilterPrivateMessages()))
/*      */     {
/* 1077 */       FilteredMessage filtered = zone.getWordFilter().apply(message, sender);
/*      */ 
/* 1082 */       if (filtered == null)
/* 1083 */         message = "";
/*      */       else {
/* 1085 */         message = filtered.getMessage();
/*      */       }
/*      */     }
/*      */ 
/* 1089 */     boolean goodToGo = (recipientIsInSenderList) && 
/* 1090 */       (recipientIsNotBlockedInSenderList) && 
/* 1091 */       (senderIsNotBlockedInRecipientList) && 
/* 1092 */       (recipientIsOnline);
/*      */ 
/* 1094 */     if (goodToGo)
/*      */     {
/* 1097 */       if (manager.getUseTempBuddies())
/*      */       {
/* 1102 */         if (senderBuddy == null)
/*      */         {
/* 1105 */           if (recipientBuddyList != null)
/*      */           {
/* 1108 */             this.sfs.getAPIManager().getBuddyApi().addBuddy(recipient, senderName, true, true, false);
/*      */           }
/*      */         }
/*      */ 
/*      */       }
/*      */ 
/* 1114 */       sendGenericMessage(
/* 1116 */         GenericMessageType.BUDDY_MSG, 
/* 1117 */         sender, 
/* 1118 */         -1, 
/* 1119 */         message, 
/* 1120 */         params, 
/* 1121 */         Arrays.asList(new ISession[] { 
/* 1121 */         recipient.getSession(), sender.getSession() }));
/*      */     }
/*      */     else
/*      */     {
/* 1127 */       String errorMessage = null;
/*      */ 
/* 1129 */       if (!recipientIsInSenderList) {
/* 1130 */         errorMessage = String.format("Recipient %s is not found in sender's list: %s", new Object[] { recipientName, senderName });
/*      */       }
/* 1132 */       else if (!recipientIsNotBlockedInSenderList) {
/* 1133 */         errorMessage = String.format("Recipient %s is blocked in sender's list: %s", new Object[] { recipientName, senderName });
/*      */       }
/* 1135 */       else if (!senderIsNotBlockedInRecipientList) {
/* 1136 */         errorMessage = String.format("Sender %s is blocked in recipient's list: %s", new Object[] { senderName, recipientName });
/*      */       }
/* 1138 */       else if (!recipientIsOnline) {
/* 1139 */         errorMessage = String.format("Recipient %s is not online", new Object[] { recipientName });
/*      */       }
/*      */ 
/* 1142 */       if (errorMessage == null) {
/* 1143 */         errorMessage = "Unexpected error";
/*      */       }
/* 1145 */       throw new SFSBuddyListException(errorMessage);
/*      */     }
/*      */   }
/*      */ 
/*      */   public void sendModeratorMessage(User sender, String message, ISFSObject params, Collection<ISession> recipients)
/*      */   {
/* 1153 */     sendSuperUserMessage(GenericMessageType.MODERATOR_MSG, sender, message, params, recipients);
/*      */   }
/*      */ 
/*      */   public void sendAdminMessage(User sender, String message, ISFSObject params, Collection<ISession> recipients)
/*      */   {
/* 1160 */     sendSuperUserMessage(GenericMessageType.ADMING_MSG, sender, message, params, recipients);
/*      */   }
/*      */ 
/*      */   private void sendSuperUserMessage(GenericMessageType type, User sender, String message, ISFSObject params, Collection<ISession> recipients)
/*      */   {
/* 1165 */     if (recipients.size() == 0) {
/* 1166 */       throw new IllegalStateException("Mod Message discarded. No recipients");
/*      */     }
/*      */ 
/* 1169 */     if (message.length() == 0) {
/* 1170 */       throw new IllegalStateException("Mod Message discarded. Empty message");
/*      */     }
/*      */ 
/* 1173 */     if (sender == null)
/*      */     {
/* 1175 */       switch (type)
/*      */       {
/*      */       case OBJECT_MSG:
/* 1178 */         sender = UsersUtil.getServerAdmin();
/* 1179 */         break;
/*      */       default:
/* 1182 */         sender = UsersUtil.getServerModerator();
/*      */       }
/*      */ 
/*      */     }
/*      */ 
/* 1192 */     sendGenericMessage(
/* 1194 */       type, 
/* 1195 */       sender, 
/* 1196 */       -1, 
/* 1197 */       message, 
/* 1198 */       params, 
/* 1199 */       recipients, 
/* 1200 */       sender.toSFSArray(null));
/*      */   }
/*      */ 
/*      */   public void sendObjectMessage(Room targetRoom, User sender, ISFSObject message, Collection<User> recipients)
/*      */   {
/* 1208 */     if (targetRoom == null) {
/* 1209 */       throw new IllegalArgumentException("The target Room is null");
/*      */     }
/* 1211 */     if (!sender.isJoinedInRoom(targetRoom)) {
/* 1212 */       throw new IllegalStateException("Sender " + sender + " is not joined the target room " + targetRoom);
/*      */     }
/*      */ 
/* 1216 */     List recipientList = null;
/*      */ 
/* 1219 */     if (recipients == null)
/*      */     {
/* 1221 */       recipientList = targetRoom.getSessionList();
/* 1222 */       recipientList.remove(sender.getSession());
/*      */     }
/*      */     else
/*      */     {
/* 1228 */       recipientList = new ArrayList();
/*      */ 
/* 1231 */       for (User user : recipients)
/*      */       {
/* 1233 */         if (targetRoom.containsUser(user)) {
/* 1234 */           recipientList.add(user.getSession());
/*      */         }
/*      */       }
/*      */     }
/*      */ 
/* 1239 */     sendGenericMessage(GenericMessageType.OBJECT_MSG, sender, targetRoom.getId(), null, message, recipientList);
/*      */   }
/*      */ 
/*      */   public void sendExtensionResponse(String cmdName, ISFSObject params, List<User> recipients, Room room, boolean useUDP)
/*      */   {
/* 1246 */     List sessions = new ArrayList();
/*      */ 
/* 1248 */     for (User user : recipients) {
/* 1249 */       sessions.add(user.getSession());
/*      */     }
/* 1251 */     this.responseAPI.sendExtResponse(cmdName, params, sessions, room, useUDP);
/*      */   }
/*      */ 
/*      */   public void sendExtensionResponse(String cmdName, ISFSObject params, User recipient, Room room, boolean useUDP)
/*      */   {
/* 1257 */     this.responseAPI.sendExtResponse(cmdName, params, Arrays.asList(new ISession[] { recipient.getSession() }), room, useUDP);
/*      */   }
/*      */ 
/*      */   public void setRoomVariables(User user, Room targetRoom, List<RoomVariable> variables)
/*      */   {
/* 1277 */     setRoomVariables(user, targetRoom, variables, true, true, false);
/*      */   }
/*      */ 
/*      */   public void setRoomVariables(User user, Room targetRoom, List<RoomVariable> variables, boolean fireClientEvent, boolean fireServerEvent, boolean overrideOwnership)
/*      */   {
/* 1284 */     if (targetRoom == null) {
/* 1285 */       throw new SFSRuntimeException("The target Room is null!");
/*      */     }
/* 1287 */     if (variables == null) {
/* 1288 */       throw new SFSRuntimeException("Missing variables list!");
/*      */     }
/*      */ 
/* 1294 */     List listOfChanges = new ArrayList();
/*      */ 
/* 1296 */     for (RoomVariable var : variables)
/*      */     {
/*      */       try
/*      */       {
/* 1300 */         targetRoom.setVariable(var, overrideOwnership);
/* 1301 */         listOfChanges.add(var);
/*      */       }
/*      */       catch (SFSVariableException e)
/*      */       {
/* 1305 */         this.log.warn(e.getMessage());
/*      */       }
/*      */ 
/*      */     }
/*      */ 
/* 1310 */     if (user != null) {
/* 1311 */       user.updateLastRequestTime();
/*      */     }
/*      */ 
/* 1314 */     if ((listOfChanges.size() > 0) && (fireClientEvent)) {
/* 1315 */       this.responseAPI.notifyRoomVariablesUpdate(targetRoom, listOfChanges);
/*      */     }
/*      */ 
/* 1318 */     if ((listOfChanges.size() > 0) && (fireServerEvent))
/*      */     {
/* 1320 */       Map evtParams = new HashMap();
/* 1321 */       evtParams.put(SFSEventParam.ZONE, targetRoom.getZone());
/* 1322 */       evtParams.put(SFSEventParam.ROOM, targetRoom);
/* 1323 */       evtParams.put(SFSEventParam.USER, user);
/* 1324 */       evtParams.put(SFSEventParam.VARIABLES, listOfChanges);
/*      */ 
/* 1326 */       this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.ROOM_VARIABLES_UPDATE, evtParams));
/*      */     }
/*      */   }
/*      */ 
/*      */   public void setUserVariables(User owner, List<UserVariable> variables)
/*      */   {
/* 1334 */     setUserVariables(owner, variables, true, true);
/*      */   }
/*      */ 
/*      */   public void setUserVariables(User owner, List<UserVariable> variables, boolean fireClientEvent, boolean fireServerEvent)
/*      */   {
/* 1341 */     if (owner == null) {
/* 1342 */       throw new SFSRuntimeException("The User is null!");
/*      */     }
/* 1344 */     if (variables == null) {
/* 1345 */       throw new SFSRuntimeException("Missing variables list!");
/*      */     }
/* 1347 */     List listOfChanges = new ArrayList();
/*      */ 
/* 1349 */     for (UserVariable var : variables)
/*      */     {
/*      */       try
/*      */       {
/* 1353 */         owner.setVariable(var);
/*      */ 
/* 1356 */         if (!var.isHidden())
/* 1357 */           listOfChanges.add(var);
/*      */       }
/*      */       catch (SFSVariableException e)
/*      */       {
/* 1361 */         this.log.warn(e.getMessage());
/*      */       }
/*      */     }
/*      */ 
/* 1365 */     owner.updateLastRequestTime();
/*      */ 
/* 1368 */     if ((listOfChanges.size() > 0) && (fireClientEvent)) {
/* 1369 */       this.responseAPI.notifyUserVariablesUpdate(owner, listOfChanges);
/*      */     }
/*      */ 
/* 1372 */     if ((listOfChanges.size() > 0) && (fireServerEvent))
/*      */     {
/* 1374 */       Map evtParams = new HashMap();
/* 1375 */       evtParams.put(SFSEventParam.ZONE, owner.getZone());
/* 1376 */       evtParams.put(SFSEventParam.USER, owner);
/* 1377 */       evtParams.put(SFSEventParam.VARIABLES, listOfChanges);
/*      */ 
/* 1379 */       this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.USER_VARIABLES_UPDATE, evtParams));
/*      */     }
/*      */   }
/*      */ 
/*      */   public void changeRoomName(User owner, Room targetRoom, String newName)
/*      */     throws SFSRoomException
/*      */   {
/* 1388 */     if (targetRoom.isFlagSet(SFSRoomSettings.ROOM_NAME_CHANGE))
/*      */     {
/*      */       try
/*      */       {
/* 1392 */         if (canUserChangeAttributesInThisRoom(owner, targetRoom))
/*      */         {
/* 1395 */           targetRoom.getZone().changeRoomName(targetRoom, newName);
/*      */ 
/* 1398 */           this.responseAPI.notifyRoomNameChange(targetRoom);
/*      */ 
/* 1400 */           if (owner == null) return; owner.updateLastRequestTime(); return;
/*      */         }
/*      */ 
/* 1407 */         SFSErrorData errorData = new SFSErrorData(SFSErrorCode.ROOM_NAME_CHANGE_PERMISSION_ERR);
/* 1408 */         errorData.addParameter(targetRoom.getName());
/*      */ 
/* 1410 */         String message = String.format("Room name change not permitted. Room: %s, User: %s", new Object[] { targetRoom, owner });
/* 1411 */         throw new SFSRoomException(message, errorData);
/*      */       }
/*      */       catch (SFSRoomException err)
/*      */       {
/* 1417 */         if (owner != null) {
/* 1418 */           this.responseAPI.notifyRequestError(err, owner, SystemRequest.ChangeRoomName);
/*      */         }
/*      */ 
/* 1421 */         throw err;
/*      */       }
/*      */ 
/*      */     }
/*      */     else
/*      */     {
/* 1432 */       throw new SFSRoomException(
/* 1434 */         String.format(
/* 1436 */         "Attempt to change name to a Room that doesn't support it. %s, %s", new Object[] { 
/* 1437 */         targetRoom, 
/* 1438 */         owner }));
/*      */     }
/*      */   }
/*      */ 
/*      */   public void changeRoomPassword(User owner, Room targetRoom, String newPassword)
/*      */     throws SFSRoomException
/*      */   {
/* 1449 */     if (targetRoom.isFlagSet(SFSRoomSettings.PASSWORD_STATE_CHANGE))
/*      */     {
/*      */       try
/*      */       {
/* 1453 */         if (canUserChangeAttributesInThisRoom(owner, targetRoom))
/*      */         {
/* 1456 */           boolean previousState = targetRoom.isPasswordProtected();
/*      */ 
/* 1459 */           targetRoom.getZone().changeRoomPasswordState(targetRoom, newPassword);
/*      */ 
/* 1461 */           boolean newState = targetRoom.isPasswordProtected();
/*      */ 
/* 1464 */           this.responseAPI.notifyRoomPasswordChange(targetRoom, owner, previousState ^ newState);
/*      */ 
/* 1466 */           if (owner == null) return; owner.updateLastRequestTime(); return;
/*      */         }
/*      */ 
/* 1472 */         SFSErrorData errorData = new SFSErrorData(SFSErrorCode.ROOM_PASS_CHANGE_PERMISSION_ERR);
/* 1473 */         errorData.addParameter(targetRoom.getName());
/*      */ 
/* 1475 */         String message = String.format("Room password change not permitted. Room: %s, User: %s", new Object[] { targetRoom, owner });
/* 1476 */         throw new SFSRoomException(message, errorData);
/*      */       }
/*      */       catch (SFSRoomException err)
/*      */       {
/* 1482 */         if (owner != null) {
/* 1483 */           this.responseAPI.notifyRequestError(err, owner, SystemRequest.ChangeRoomPassword);
/*      */         }
/*      */ 
/* 1486 */         throw err;
/*      */       }
/*      */ 
/*      */     }
/*      */     else
/*      */     {
/* 1498 */       throw new SFSRoomException(
/* 1500 */         String.format(
/* 1502 */         "Attempt to change password to a Room that doesn't support it. %s, %s", new Object[] { 
/* 1503 */         targetRoom, 
/* 1504 */         owner }));
/*      */     }
/*      */   }
/*      */ 
/*      */   public void changeRoomCapacity(User owner, Room targetRoom, int maxUsers, int maxSpectators)
/*      */     throws SFSRoomException
/*      */   {
/* 1515 */     if (targetRoom.isFlagSet(SFSRoomSettings.CAPACITY_CHANGE))
/*      */     {
/*      */       try
/*      */       {
/* 1519 */         if (canUserChangeAttributesInThisRoom(owner, targetRoom))
/*      */         {
/* 1521 */           Zone zone = targetRoom.getZone();
/*      */ 
/* 1523 */           if (maxUsers > 0) {
/* 1524 */             zone.changeRoomCapacity(targetRoom, maxUsers, maxSpectators);
/*      */           }
/*      */ 
/* 1527 */           this.responseAPI.notifyRoomCapacityChange(targetRoom);
/*      */ 
/* 1529 */           if (owner == null) return; owner.updateLastRequestTime(); return;
/*      */         }
/*      */ 
/* 1535 */         SFSErrorData errorData = new SFSErrorData(SFSErrorCode.ROOM_CAPACITY_CHANGE_PERMISSION_ERR);
/* 1536 */         errorData.addParameter(targetRoom.getName());
/*      */ 
/* 1538 */         String message = String.format("Room capacity change not allowed. Room: %s, User: %s", new Object[] { targetRoom, owner });
/* 1539 */         throw new SFSRoomException(message, errorData);
/*      */       }
/*      */       catch (SFSRoomException err)
/*      */       {
/* 1545 */         if (owner != null) {
/* 1546 */           this.responseAPI.notifyRequestError(err, owner, SystemRequest.ChangeRoomCapacity);
/*      */         }
/*      */ 
/* 1549 */         throw err;
/*      */       }
/*      */ 
/*      */     }
/*      */     else
/*      */     {
/* 1556 */       throw new SFSRoomException(
/* 1558 */         String.format(
/* 1560 */         "Attempt to change capacity in a Room that doesn't support it. %s, %s", new Object[] { 
/* 1561 */         targetRoom, 
/* 1562 */         owner }));
/*      */     }
/*      */   }
/*      */ 
/*      */   private boolean canUserChangeAttributesInThisRoom(User user, Room targetRoom)
/*      */   {
/* 1579 */     if (user == null) {
/* 1580 */       return true;
/*      */     }
/*      */ 
/* 1583 */     if (user == targetRoom.getOwner()) {
/* 1584 */       return true;
/*      */     }
/*      */ 
/* 1588 */     return user.isSuperUser();
/*      */   }
/*      */ 
/*      */   public void subscribeRoomGroup(User user, String groupId)
/*      */   {
/* 1597 */     Zone zone = user.getZone();
/*      */     try
/*      */     {
/* 1602 */       if ((zone.containsGroup(groupId)) || (zone.containsPublicGroup(groupId)))
/*      */       {
/* 1604 */         if (!user.isSubscribedToGroup(groupId))
/*      */         {
/* 1606 */           user.subscribeGroup(groupId);
/* 1607 */           this.responseAPI.notifyGroupSubscribeSuccess(user, groupId);
/*      */         }
/*      */         else
/*      */         {
/* 1613 */           SFSErrorData errData = new SFSErrorData(SFSErrorCode.SUBSCRIBE_GROUP_ALREADY_SUBSCRIBED);
/* 1614 */           errData.addParameter(groupId);
/*      */ 
/* 1616 */           throw new SFSException(
/* 1618 */             String.format("User: %s is already subscribed to group: %s", new Object[] { user.getName(), groupId }), 
/* 1619 */             errData);
/*      */         }
/*      */ 
/*      */       }
/*      */       else
/*      */       {
/* 1627 */         SFSErrorData errData = new SFSErrorData(SFSErrorCode.SUBSCRIBE_GROUP_NOT_FOUND);
/* 1628 */         errData.addParameter(groupId);
/*      */ 
/* 1630 */         throw new SFSException(
/* 1632 */           String.format("User: %s is request subscription to non-existing group: %s", new Object[] { user.getName(), groupId }), 
/* 1633 */           errData);
/*      */       }
/*      */ 
/*      */     }
/*      */     catch (SFSException err)
/*      */     {
/* 1639 */       this.responseAPI.notifyRequestError(err, user, SystemRequest.SubscribeRoomGroup);
/*      */     }
/*      */   }
/*      */ 
/*      */   public void unsubscribeRoomGroup(User user, String groupId)
/*      */   {
/* 1647 */     Zone zone = user.getZone();
/*      */     try
/*      */     {
/* 1651 */       if ((zone.containsGroup(groupId)) || (zone.containsPublicGroup(groupId)))
/*      */       {
/* 1653 */         if (user.isSubscribedToGroup(groupId))
/*      */         {
/* 1655 */           user.unsubscribeGroup(groupId);
/* 1656 */           this.responseAPI.notifyGroupUnsubscribeSuccess(user, groupId);
/*      */         }
/*      */         else
/*      */         {
/* 1662 */           SFSErrorData errData = new SFSErrorData(SFSErrorCode.UNSUBSCRIBE_GROUP_NOT_SUBSCRIBED);
/* 1663 */           errData.addParameter(groupId);
/*      */ 
/* 1665 */           throw new SFSException(
/* 1667 */             String.format("Can't unsubscribe user: %s from group: %s. Group is not subscribed.", new Object[] { user.getName(), groupId }), 
/* 1668 */             errData);
/*      */         }
/*      */ 
/*      */       }
/*      */       else
/*      */       {
/* 1676 */         SFSErrorData errData = new SFSErrorData(SFSErrorCode.SUBSCRIBE_GROUP_NOT_FOUND);
/* 1677 */         errData.addParameter(groupId);
/*      */ 
/* 1679 */         throw new SFSException(
/* 1681 */           String.format("Can't unsubscribe user: %s from group: %s. Group doesn't exist", new Object[] { user.getName(), groupId }), 
/* 1682 */           errData);
/*      */       }
/*      */ 
/*      */     }
/*      */     catch (SFSException err)
/*      */     {
/* 1690 */       this.responseAPI.notifyRequestError(err, user, SystemRequest.SubscribeRoomGroup);
/*      */     }
/*      */   }
/*      */ 
/*      */   private void sendGenericMessage(GenericMessageType type, User sender, int targetRoomId, String message, ISFSObject params, Collection<ISession> recipients, ISFSArray senderData)
/*      */   {
/* 1724 */     if (sender != null) {
/* 1725 */       sender.updateLastRequestTime();
/*      */     }
/*      */ 
/* 1728 */     ISFSObject resObj = SFSObject.newInstance();
/*      */ 
/* 1731 */     IResponse response = new Response();
/* 1732 */     response.setId(SystemRequest.GenericMessage.getId());
/* 1733 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 1734 */     response.setContent(resObj);
/* 1735 */     response.setRecipients(recipients);
/*      */ 
/* 1737 */     resObj.putByte("t", (byte)type.getId());
/* 1738 */     resObj.putInt("r", targetRoomId);
/*      */ 
/* 1740 */     resObj.putInt("u", sender.getId());
/*      */ 
/* 1743 */     if (message != null) {
/* 1744 */       resObj.putUtfString("m", message);
/*      */     }
/* 1746 */     if (params != null) {
/* 1747 */       resObj.putSFSObject("p", params);
/*      */     }
/* 1749 */     if (senderData != null) {
/* 1750 */       resObj.putSFSArray("sd", senderData);
/*      */     }
/* 1752 */     response.write();
/*      */   }
/*      */ 
/*      */   private void sendGenericMessage(GenericMessageType type, User sender, int targetRoomId, String message, ISFSObject params, Collection<ISession> recipients)
/*      */   {
/* 1762 */     sendGenericMessage(type, sender, targetRoomId, message, params, recipients, null);
/*      */   }
/*      */ 
/*      */   public void spectatorToPlayer(User user, Room targetRoom, boolean fireClientEvent, boolean fireServerEvent) throws SFSRoomException
/*      */   {
/* 1767 */     if (targetRoom == null) {
/* 1768 */       throw new IllegalArgumentException("A target room was not specified (null)");
/*      */     }
/* 1770 */     if (user == null) {
/* 1771 */       throw new IllegalArgumentException("A user was not specified (null)");
/*      */     }
/*      */ 
/* 1774 */     user.updateLastRequestTime();
/*      */     try
/*      */     {
/* 1779 */       if ((targetRoom instanceof SFSGame)) {
/* 1780 */         checkSFSGameAccess((SFSGame)targetRoom, user, false);
/*      */       }
/*      */ 
/* 1783 */       targetRoom.switchSpectatorToPlayer(user);
/*      */ 
/* 1786 */       if (fireClientEvent)
/*      */       {
/* 1789 */         this.responseAPI.notifySpectatorToPlayer(user.getSession(), targetRoom, user.getId(), user.getPlayerId(targetRoom));
/*      */ 
/* 1792 */         this.responseAPI.notifyUserCountChange(user.getZone(), targetRoom);
/*      */       }
/*      */ 
/* 1796 */       if (fireServerEvent)
/*      */       {
/* 1798 */         Map evtParams = new HashMap();
/* 1799 */         evtParams.put(SFSEventParam.ZONE, user.getZone());
/* 1800 */         evtParams.put(SFSEventParam.ROOM, targetRoom);
/* 1801 */         evtParams.put(SFSEventParam.USER, user);
/* 1802 */         evtParams.put(SFSEventParam.PLAYER_ID, Integer.valueOf(user.getPlayerId(targetRoom)));
/*      */ 
/* 1804 */         this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.SPECTATOR_TO_PLAYER, evtParams));
/*      */       }
/*      */ 
/*      */     }
/*      */     catch (SFSRoomException err)
/*      */     {
/* 1810 */       if (fireClientEvent) {
/* 1811 */         this.responseAPI.notifyRequestError(err, user, SystemRequest.SpectatorToPlayer);
/*      */       }
/*      */ 
/* 1814 */       String message = String.format("SpectatorToPlayer Error - %s", new Object[] { err.getMessage() });
/* 1815 */       throw new SFSRoomException(message, err.getErrorData());
/*      */     }
/*      */   }
/*      */ 
/*      */   public void playerToSpectator(User user, Room targetRoom, boolean fireClientEvent, boolean fireServerEvent)
/*      */     throws SFSRoomException
/*      */   {
/* 1823 */     if (targetRoom == null) {
/* 1824 */       throw new IllegalArgumentException("A target room was not specified (null)");
/*      */     }
/* 1826 */     if (user == null) {
/* 1827 */       throw new IllegalArgumentException("A user was not specified (null)");
/*      */     }
/*      */ 
/* 1830 */     user.updateLastRequestTime();
/*      */     try
/*      */     {
/* 1835 */       if ((targetRoom instanceof SFSGame)) {
/* 1836 */         checkSFSGameAccess((SFSGame)targetRoom, user, true);
/*      */       }
/*      */ 
/* 1839 */       targetRoom.switchPlayerToSpectator(user);
/*      */ 
/* 1842 */       if (fireClientEvent)
/*      */       {
/* 1845 */         this.responseAPI.notifyPlayerToSpectator(user.getSession(), targetRoom, user.getId());
/*      */ 
/* 1848 */         this.responseAPI.notifyUserCountChange(user.getZone(), targetRoom);
/*      */       }
/*      */ 
/* 1852 */       if (fireServerEvent)
/*      */       {
/* 1854 */         Map evtParams = new HashMap();
/* 1855 */         evtParams.put(SFSEventParam.ZONE, user.getZone());
/* 1856 */         evtParams.put(SFSEventParam.ROOM, targetRoom);
/* 1857 */         evtParams.put(SFSEventParam.USER, user);
/*      */ 
/* 1859 */         this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.PLAYER_TO_SPECTATOR, evtParams));
/*      */       }
/*      */ 
/*      */     }
/*      */     catch (SFSRoomException err)
/*      */     {
/* 1865 */       if (fireClientEvent) {
/* 1866 */         this.responseAPI.notifyRequestError(err, user, SystemRequest.PlayerToSpectator);
/*      */       }
/*      */ 
/* 1869 */       String message = String.format("PlayerToSpectator Error - %s", new Object[] { err.getMessage() });
/* 1870 */       throw new SFSRoomException(message, err.getErrorData());
/*      */     }
/*      */   }
/*      */ 
/*      */   private void checkSFSGameAccess(SFSGame gameRoom, User user, boolean asSpectator)
/*      */     throws SFSRoomException
/*      */   {
/* 1888 */     MatchExpression expression = null;
/*      */ 
/* 1891 */     if (asSpectator) {
/* 1892 */       expression = gameRoom.getSpectatorMatchExpression();
/*      */     }
/* 1901 */     else if (gameRoom.isPublic()) {
/* 1902 */       expression = gameRoom.getPlayerMatchExpression();
/*      */     }
/*      */ 
/* 1905 */     if (expression == null) {
/* 1906 */       return;
/*      */     }
/*      */ 
/* 1909 */     if (!this.matcher.matchUser(user, expression))
/*      */     {
/* 1911 */       String message = String.format("User does not match the MatchExpression of the Game Room: %s", new Object[] { expression });
/* 1912 */       SFSErrorData errData = new SFSErrorData(SFSErrorCode.JOIN_GAME_ACCESS_DENIED);
/* 1913 */       errData.addParameter(gameRoom.getName());
/*      */ 
/* 1915 */       throw new SFSRoomException(message, errData);
/*      */     }
/*      */   }
/*      */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.SFSApi
 * JD-Core Version:    0.6.0
 */