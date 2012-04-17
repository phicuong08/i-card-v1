/*     */ package com.smartfoxserver.v2.api;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.response.ISFSGameResponseApi;
/*     */ import com.smartfoxserver.v2.api.response.ISFSResponseApi;
/*     */ import com.smartfoxserver.v2.api.response.SFSGameResponseApi;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.core.ISFSEventManager;
/*     */ import com.smartfoxserver.v2.core.SFSEvent;
/*     */ import com.smartfoxserver.v2.core.SFSEventParam;
/*     */ import com.smartfoxserver.v2.core.SFSEventType;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.invitation.Invitation;
/*     */ import com.smartfoxserver.v2.entities.invitation.InvitationCallback;
/*     */ import com.smartfoxserver.v2.entities.invitation.InvitationManager;
/*     */ import com.smartfoxserver.v2.entities.invitation.InvitationResponse;
/*     */ import com.smartfoxserver.v2.entities.invitation.SFSInvitation;
/*     */ import com.smartfoxserver.v2.entities.match.BoolMatch;
/*     */ import com.smartfoxserver.v2.entities.match.MatchExpression;
/*     */ import com.smartfoxserver.v2.entities.match.MatchingUtils;
/*     */ import com.smartfoxserver.v2.entities.variables.RoomVariable;
/*     */ import com.smartfoxserver.v2.entities.variables.SFSRoomVariable;
/*     */ import com.smartfoxserver.v2.exceptions.SFSCreateGameException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSCreateRoomException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorCode;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorData;
/*     */ import com.smartfoxserver.v2.exceptions.SFSInvitationException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSJoinRoomException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSQuickJoinGameException;
/*     */ import com.smartfoxserver.v2.game.CreateSFSGameSettings;
/*     */ import com.smartfoxserver.v2.game.SFSGame;
/*     */ import com.smartfoxserver.v2.game.SFSGameInvitationCallback;
/*     */ import com.smartfoxserver.v2.util.UsersUtil;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Collection;
/*     */ import java.util.HashMap;
/*     */ import java.util.HashSet;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import java.util.Set;
/*     */ import org.apache.commons.lang.RandomStringUtils;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSGameApi
/*     */   implements ISFSGameApi
/*     */ {
/*     */   private static final int GAME_PASSWORD_LEN = 16;
/*     */   protected final SmartFoxServer sfs;
/*     */   protected final Logger log;
/*     */   protected final ISFSApi sfsApi;
/*     */   protected final ISFSGameResponseApi responseApi;
/*     */ 
/*     */   public SFSGameApi(SmartFoxServer sfs)
/*     */   {
/*  66 */     this.sfs = sfs;
/*  67 */     this.log = LoggerFactory.getLogger(getClass());
/*  68 */     this.sfsApi = sfs.getAPIManager().getSFSApi();
/*  69 */     this.responseApi = new SFSGameResponseApi();
/*     */   }
/*     */ 
/*     */   public ISFSGameResponseApi getResponseAPI()
/*     */   {
/*  75 */     return this.responseApi;
/*     */   }
/*     */ 
/*     */   public Room createGame(Zone zone, CreateSFSGameSettings settings, User owner)
/*     */     throws SFSCreateRoomException
/*     */   {
/*  81 */     return createGame(zone, settings, owner, true, true);
/*     */   }
/*     */ 
/*     */   public Room createGame(Zone zone, CreateSFSGameSettings settings, User owner, boolean fireClientEvent, boolean fireServerEvent)
/*     */     throws SFSCreateRoomException
/*     */   {
/*  87 */     Room roomToLeave = null;
/*  88 */     SFSGame theGame = null;
/*     */ 
/*  93 */     validateSFSGameSettings(settings, owner);
/*     */ 
/* 100 */     if (settings.isLeaveLastJoinedRoom()) {
/* 101 */       roomToLeave = owner != null ? owner.getLastJoinedRoom() : null;
/*     */     }
/*     */ 
/* 104 */     if (!settings.isGamePublic()) {
/* 105 */       settings.setPassword(generateGamePassword());
/*     */     }
/*     */ 
/* 108 */     if (settings.isNotifyGameStartedViaRoomVariable())
/*     */     {
/* 110 */       List variables = settings.getRoomVariables();
/*     */ 
/* 112 */       if (variables == null)
/*     */       {
/* 114 */         variables = new ArrayList();
/* 115 */         settings.setRoomVariables(variables);
/*     */       }
/*     */ 
/* 118 */       RoomVariable varGameStarted = new SFSRoomVariable("$GS", Boolean.valueOf(false));
/* 119 */       varGameStarted.setGlobal(true);
/* 120 */       varGameStarted.setPrivate(true);
/* 121 */       varGameStarted.setOwner(null);
/*     */ 
/* 123 */       variables.add(varGameStarted);
/*     */     }
/*     */ 
/* 127 */     theGame = (SFSGame)this.sfsApi.createRoom(zone, settings, owner, true, 
/* 128 */       roomToLeave, fireClientEvent, fireServerEvent);
/*     */ 
/* 131 */     theGame.setPlayerMatchExpression(settings.getPlayerMatchExpression());
/* 132 */     theGame.setSpectatorMatchExpression(settings.getSpectatorMatchExpression());
/*     */ 
/* 135 */     theGame.setMinPlayersToStartGame(settings.getMinPlayersToStartGame());
/*     */ 
/* 138 */     theGame.setNotifyGameStarted(settings.isNotifyGameStartedViaRoomVariable());
/*     */ 
/* 143 */     if (!theGame.isPublic())
/*     */     {
/* 145 */       List invitedPlayers = settings.getInvitedPlayers();
/*     */ 
/* 148 */       populateInvitations(invitedPlayers, settings.getMinPlayersToStartGame(), settings.getSearchableRooms(), settings.getPlayerMatchExpression());
/*     */ 
/* 151 */       ISFSObject inivitationParams = settings.getInvitationParams();
/* 152 */       inviteFriendsInGame(theGame, invitedPlayers, settings.isLeaveLastJoinedRoom(), settings.getInvitationExpiryTime(), inivitationParams);
/*     */ 
/* 155 */       this.log.info(String.format("Game started: %s -- Invited people: %s", new Object[] { theGame, invitedPlayers }));
/*     */     }
/*     */ 
/* 158 */     return theGame;
/*     */   }
/*     */ 
/*     */   public Room quickJoinGame(User player, MatchExpression expression, Zone zone, String groupId)
/*     */     throws SFSJoinRoomException
/*     */   {
/* 164 */     return quickJoinGame(player, expression, zone, groupId, null);
/*     */   }
/*     */ 
/*     */   public Room quickJoinGame(User player, MatchExpression expression, Zone zone, String groupId, Room roomToLeave)
/*     */     throws SFSJoinRoomException
/*     */   {
/* 170 */     return quickJoinGame(player, expression, zone.getRoomListFromGroup(groupId), roomToLeave);
/*     */   }
/*     */ 
/*     */   public Room quickJoinGame(User player, MatchExpression expression, Collection<Room> searchableRooms, Room roomToLeave)
/*     */     throws SFSJoinRoomException
/*     */   {
/* 176 */     return quickJoinGame(player, expression, searchableRooms, roomToLeave, false);
/*     */   }
/*     */ 
/*     */   public void sendInvitation(Invitation invitation, InvitationCallback callBackHandler)
/*     */   {
/* 183 */     this.sfs.getInvitationManager().startInvitation(invitation, callBackHandler);
/*     */ 
/* 186 */     this.responseApi.notifyInivitation(invitation);
/*     */   }
/*     */ 
/*     */   public void sendInvitation(User inviter, List<User> invitees, int expirySeconds, InvitationCallback callBackHandler, ISFSObject params)
/*     */   {
/* 192 */     for (User invitee : invitees)
/*     */     {
/* 194 */       if (invitee == null)
/*     */         continue;
/* 196 */       Invitation invitation = new SFSInvitation(inviter, invitee, expirySeconds);
/* 197 */       invitation.setParams(params);
/* 198 */       this.sfs.getInvitationManager().startInvitation(invitation, callBackHandler);
/*     */ 
/* 201 */       this.responseApi.notifyInivitation(invitation);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void replyToInvitation(User invitedUser, int invitationId, InvitationResponse reply, ISFSObject params, boolean fireClientEvent)
/*     */   {
/*     */     try
/*     */     {
/* 211 */       this.sfs.getInvitationManager().onInvitationResult(invitationId, reply, params);
/*     */     }
/*     */     catch (SFSInvitationException e)
/*     */     {
/* 215 */       this.log.warn("Invitation Reply failure: " + e.getMessage());
/*     */ 
/* 217 */       if (fireClientEvent)
/* 218 */         this.sfsApi.getResponseAPI().notifyRequestError(e.getErrorData(), invitedUser, SystemRequest.InvitationReply);
/*     */     }
/*     */   }
/*     */ 
/*     */   private Room quickJoinGame(User player, MatchExpression expression, Collection<Room> searchableRooms, Room roomToLeave, boolean asSpectator)
/*     */     throws SFSJoinRoomException
/*     */   {
/* 231 */     if ((searchableRooms == null) || (searchableRooms.size() < 1)) {
/* 232 */       throw new IllegalArgumentException("No Room provided for searching.");
/*     */     }
/*     */ 
/* 235 */     MatchExpression basicFilter = new MatchExpression("${ISG}", BoolMatch.EQUALS, Boolean.valueOf(true)).and("${ISP}", BoolMatch.EQUALS, Boolean.valueOf(false)).and("${HFP}", BoolMatch.EQUALS, Boolean.valueOf(true));
/*     */ 
/* 238 */     Collection possibleRooms = this.sfsApi.findRooms(searchableRooms, basicFilter, 0);
/*     */ 
/* 241 */     possibleRooms = this.sfsApi.findRooms(possibleRooms, expression, 0);
/*     */ 
/* 246 */     StringBuilder debugSb = new StringBuilder("Rooms available for QuickJoin:\n");
/* 247 */     for (Room item : possibleRooms)
/*     */     {
/* 249 */       debugSb.append(String.format("%s => %s, %s%n", new Object[] { item.getName(), item.getVariables(), ((SFSGame)item).getPlayerMatchExpression() }));
/*     */     }
/* 251 */     if (this.log.isDebugEnabled()) {
/* 252 */       this.log.debug(debugSb.toString());
/*     */     }
/*     */ 
/* 260 */     Room theRoom = null;
/*     */ 
/* 262 */     for (Room candidateRoom : possibleRooms)
/*     */     {
/* 265 */       if ((candidateRoom instanceof SFSGame))
/*     */       {
/* 267 */         MatchExpression roomCriteria = ((SFSGame)candidateRoom).getPlayerMatchExpression();
/*     */ 
/* 269 */         if (!MatchingUtils.getInstance().matchUser(player, roomCriteria)) {
/*     */           continue;
/*     */         }
/* 272 */         theRoom = candidateRoom;
/* 273 */         break;
/*     */       }
/*     */ 
/* 281 */       theRoom = candidateRoom;
/* 282 */       break;
/*     */     }
/*     */ 
/* 287 */     if (theRoom != null)
/*     */     {
/* 289 */       this.sfsApi.joinRoom(player, theRoom, null, asSpectator, roomToLeave);
/* 290 */       return theRoom;
/*     */     }
/*     */ 
/* 294 */     String message = String.format("No Game Room was found for %s", new Object[] { player });
/* 295 */     SFSErrorData errData = new SFSErrorData(SFSErrorCode.JOIN_GAME_NOT_FOUND);
/*     */ 
/* 297 */     throw new SFSQuickJoinGameException(message, errData);
/*     */   }
/*     */ 
/*     */   private void validateSFSGameSettings(CreateSFSGameSettings settings, User owner)
/*     */     throws SFSCreateGameException
/*     */   {
/* 304 */     if (owner != null)
/*     */     {
/* 306 */       String alreadyRunningProcessName = (String)owner.getSession().getSystemProperty("InvitationProcessRunning");
/*     */ 
/* 308 */       if (alreadyRunningProcessName != null)
/*     */       {
/* 310 */         throw new SFSCreateGameException(String.format("%s is already running another invitation process for a game called: %s. A new one can be started once the previous is complete.", new Object[] { owner, alreadyRunningProcessName }));
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 315 */     if (!settings.isGamePublic())
/*     */     {
/* 317 */       int invitationCount = settings.getInvitedPlayers() != null ? settings.getInvitedPlayers().size() : 0;
/*     */ 
/* 321 */       if (invitationCount < settings.getMinPlayersToStartGame())
/*     */       {
/* 329 */         String errorMsg = null;
/*     */ 
/* 331 */         if ((settings.getSearchableRooms() == null) || (settings.getSearchableRooms().size() < 1)) {
/* 332 */           errorMsg = "no searchable rooms were provided";
/*     */         }
/* 334 */         if (errorMsg != null)
/*     */         {
/* 336 */           throw new SFSCreateGameException(String.format("Invited players (size = %s) are not enough to start the game (min = %s). Additionally %s", new Object[] { Integer.valueOf(invitationCount), Integer.valueOf(settings.getMinPlayersToStartGame()), errorMsg }));
/*     */         }
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 342 */     if (settings.getMinPlayersToStartGame() < 1) {
/* 343 */       throw new SFSCreateGameException("minPlayersToStartGame cannot be < 1");
/*     */     }
/* 345 */     if (settings.getMinPlayersToStartGame() > settings.getMaxUsers())
/*     */     {
/* 347 */       throw new SFSCreateGameException(String.format("Minimum amount of players (%s) can't be > maxUsers (%s).", new Object[] { Integer.valueOf(settings.getMinPlayersToStartGame()), Integer.valueOf(settings.getMaxUsers()) }));
/*     */     }
/*     */   }
/*     */ 
/*     */   private void populateInvitations(List<User> invitedPlayers, int minPlayersToStart, List<Room> searchableRooms, MatchExpression exp)
/*     */   {
/* 353 */     if (invitedPlayers.size() < minPlayersToStart)
/*     */     {
/* 356 */       int peopleToSearch = minPlayersToStart - invitedPlayers.size();
/*     */ 
/* 359 */       Set setOfPlayers = new HashSet(invitedPlayers);
/*     */ 
/* 364 */       Collection searchableUserList = null;
/*     */ 
/* 366 */       if (searchableRooms.size() == 1) {
/* 367 */         searchableUserList = ((Room)searchableRooms.get(0)).getUserList();
/*     */       }
/*     */       else
/*     */       {
/* 371 */         searchableUserList = new HashSet();
/*     */ 
/* 373 */         for (Room room : searchableRooms) {
/* 374 */           searchableUserList.addAll(room.getUserList());
/*     */         }
/*     */       }
/*     */ 
/* 378 */       List srcResult = this.sfsApi.findUsers(searchableUserList, exp, peopleToSearch);
/*     */ 
/* 380 */       if (this.log.isDebugEnabled())
/*     */       {
/* 382 */         if (srcResult.size() > 0)
/* 383 */           this.log.debug("Players matching the game were found and added to the invitation: " + srcResult);
/*     */         else {
/* 385 */           this.log.debug("No other Players matching the game were found.");
/*     */         }
/*     */       }
/*     */ 
/* 389 */       setOfPlayers.addAll(srcResult);
/*     */ 
/* 392 */       invitedPlayers.clear();
/* 393 */       invitedPlayers.addAll(setOfPlayers);
/*     */     }
/*     */   }
/*     */ 
/*     */   private void inviteFriendsInGame(SFSGame theGame, List<User> friends, boolean leaveLastJoinedRoom, int expiryTime, ISFSObject params)
/*     */   {
/* 399 */     User owner = theGame.getOwner();
/*     */ 
/* 404 */     if (friends.size() == 0)
/*     */     {
/* 406 */       Map evtParams = new HashMap();
/* 407 */       evtParams.put(SFSEventParam.ZONE, theGame.getZone());
/* 408 */       evtParams.put(SFSEventParam.ROOM, theGame);
/*     */ 
/* 410 */       this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.GAME_INVITATION_FAILURE, evtParams));
/*     */ 
/* 416 */       return;
/*     */     }
/*     */ 
/* 419 */     InvitationCallback callback = new SFSGameInvitationCallback(theGame, friends.size(), leaveLastJoinedRoom);
/*     */ 
/* 422 */     if (owner != null) {
/* 423 */       owner.getSession().setSystemProperty("InvitationProcessRunning", theGame.getName());
/*     */     }
/*     */ 
/* 428 */     User inviter = owner == null ? UsersUtil.getServerAdmin() : owner;
/*     */ 
/* 430 */     for (User friend : friends)
/*     */     {
/* 432 */       Invitation invitation = new SFSInvitation(inviter, friend, expiryTime, params);
/* 433 */       this.sfs.getInvitationManager().startInvitation(invitation, callback);
/*     */ 
/* 437 */       this.responseApi.notifyInivitation(invitation);
/*     */     }
/*     */   }
/*     */ 
/*     */   private String generateGamePassword()
/*     */   {
/* 443 */     return RandomStringUtils.randomAlphabetic(16) + System.currentTimeMillis();
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.SFSGameApi
 * JD-Core Version:    0.6.0
 */