/*     */ package com.smartfoxserver.v2.controllers.system.game;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.CreateRoomSettings;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.api.ISFSGameApi;
/*     */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.controllers.system.CreateRoom;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.match.MatchExpression;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*     */ import com.smartfoxserver.v2.game.CreateSFSGameSettings;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Collection;
/*     */ import java.util.List;
/*     */ import org.slf4j.Logger;
/*     */ 
/*     */ public class CreateSFSGame extends BaseControllerCommand
/*     */ {
/*     */   public static final String KEY_IS_PUBLIC = "gip";
/*     */   public static final String KEY_MIN_PLAYERS = "gmp";
/*     */   public static final String KEY_INVITED_PLAYERS = "ginp";
/*     */   public static final String KEY_SEARCHABLE_ROOMS = "gsr";
/*     */   public static final String KEY_PLAYER_MATCH_EXP = "gpme";
/*     */   public static final String KEY_SPECTATOR_MATCH_EXP = "gsme";
/*     */   public static final String KEY_INVITATION_EXPIRY = "gie";
/*     */   public static final String KEY_LEAVE_ROOM = "glr";
/*     */   public static final String KEY_NOTIFY_GAME_STARTED = "gns";
/*     */   public static final String KEY_INVITATION_PARAMS = "ip";
/*     */   private static final int MAX_CLIENT_INVITATIONS = 16;
/*     */   private static final int MIN_EXPIRY_TIME_SECONDS = 5;
/*     */   private static final int MAX_EXPIRY_TIME_SECONDS = 300;
/*     */   private CreateRoom createRoomRequest;
/*     */ 
/*     */   public CreateSFSGame()
/*     */   {
/*  41 */     super(SystemRequest.CreateSFSGame);
/*  42 */     this.createRoomRequest = new CreateRoom();
/*     */   }
/*     */ 
/*     */   public boolean validate(IRequest request)
/*     */     throws SFSRequestValidationException
/*     */   {
/*  48 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/*  51 */     this.createRoomRequest.validate(request);
/*     */ 
/*  53 */     if (sfso.isNull("gip")) {
/*  54 */       throw new SFSRequestValidationException("isPublic flag is missing");
/*     */     }
/*  56 */     if (sfso.isNull("gmp")) {
/*  57 */       throw new SFSRequestValidationException("minPlayersToStartGame value is missing");
/*     */     }
/*  59 */     if (sfso.isNull("glr")) {
/*  60 */       throw new SFSRequestValidationException("leaveLastJoinedRoom flag is missing");
/*     */     }
/*  62 */     if (sfso.isNull("gns")) {
/*  63 */       throw new SFSRequestValidationException("notifyGameStarted flag is missing");
/*     */     }
/*  65 */     return true;
/*     */   }
/*     */ 
/*     */   public void execute(IRequest request)
/*     */     throws Exception
/*     */   {
/*  76 */     CreateSFSGameSettings gameSettings = CreateSFSGameSettings.newFromRoomSettings((CreateRoomSettings)this.createRoomRequest.preProcess(request));
/*     */ 
/*  79 */     User user = this.api.getUserBySession(request.getSender());
/*     */ 
/*  81 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/*  83 */     gameSettings.setGamePublic(sfso.getBool("gip").booleanValue());
/*  84 */     gameSettings.setMinPlayersToStartGame(sfso.getShort("gmp").shortValue());
/*  85 */     gameSettings.setLeaveLastJoinedRoom(sfso.getBool("glr").booleanValue());
/*  86 */     gameSettings.setNotifyGameStartedViaRoomVariable(sfso.getBool("gns").booleanValue());
/*  87 */     gameSettings.setInvitationExpiryTime(sfso.getShort("gie").shortValue());
/*  88 */     gameSettings.setInvitationParams(sfso.getSFSObject("ip"));
/*     */ 
/*  90 */     if (sfso.containsKey("gpme")) {
/*  91 */       gameSettings.setPlayerMatchExpression(MatchExpression.fromSFSArray(sfso.getSFSArray("gpme")));
/*     */     }
/*  93 */     if (sfso.containsKey("gsme")) {
/*  94 */       gameSettings.setSpectatorMatchExpression(MatchExpression.fromSFSArray(sfso.getSFSArray("gsme")));
/*     */     }
/*     */ 
/*  97 */     if ((gameSettings.getInvitationExpiryTime() < 5) || (gameSettings.getInvitationExpiryTime() > 300))
/*     */     {
/*  99 */       throw new IllegalArgumentException(
/* 101 */         String.format(
/* 103 */         "CreateGame Error: %s. Invalid invitationExpiryTime: %s. Valid range is %s - %s seconds.", new Object[] { 
/* 104 */         gameSettings.getName(), 
/* 105 */         Integer.valueOf(gameSettings.getInvitationExpiryTime()), 
/* 106 */         Integer.valueOf(5), 
/* 107 */         Integer.valueOf(300) }));
/*     */     }
/*     */ 
/* 112 */     List invitedPlayers = null;
/* 113 */     List searchableRooms = null;
/*     */ 
/* 116 */     if (!gameSettings.isGamePublic())
/*     */     {
/* 119 */       invitedPlayers = getListOfInvitedPlayers(user, sfso.getIntArray("ginp"));
/*     */ 
/* 121 */       if (invitedPlayers.size() > 16)
/*     */       {
/* 123 */         throw new IllegalArgumentException(
/* 125 */           String.format(
/* 127 */           "CreateGame Error: %s. Too many invited players: %s. Max allowed from client request: %s", new Object[] { 
/* 128 */           gameSettings.getName(), 
/* 129 */           Integer.valueOf(invitedPlayers.size()), 
/* 130 */           Integer.valueOf(16) }));
/*     */       }
/*     */ 
/* 136 */       searchableRooms = getListOfSearchableRooms(user, sfso.getUtfStringArray("gsr"));
/*     */ 
/* 138 */       gameSettings.setInvitedPlayers(invitedPlayers);
/* 139 */       gameSettings.setSearchableRooms(searchableRooms);
/*     */     }
/*     */ 
/* 142 */     this.sfs.getAPIManager().getGameApi().createGame(
/* 144 */       user.getZone(), 
/* 145 */       gameSettings, 
/* 146 */       user);
/*     */   }
/*     */ 
/*     */   private List<User> getListOfInvitedPlayers(User inviter, Collection<Integer> userIds)
/*     */   {
/* 154 */     List invitedPlayers = null;
/* 155 */     List refusedPlayers = null;
/* 156 */     Zone zone = inviter.getZone();
/*     */ 
/* 158 */     if (userIds != null)
/*     */     {
/* 160 */       invitedPlayers = new ArrayList();
/* 161 */       refusedPlayers = new ArrayList();
/*     */ 
/* 163 */       for (Integer ii : userIds)
/*     */       {
/* 165 */         User usr = this.api.getUserById(ii.intValue());
/* 166 */         if (usr == null)
/*     */           continue;
/* 168 */         if (usr.getZone() != zone)
/*     */         {
/* 170 */           refusedPlayers.add(usr);
/*     */         }
/*     */         else
/*     */         {
/* 174 */           if (invitedPlayers.size() > 16)
/*     */           {
/* 176 */             refusedPlayers.add(usr);
/* 177 */             break;
/*     */           }
/*     */ 
/* 180 */           invitedPlayers.add(usr);
/*     */         }
/*     */ 
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 188 */     if (refusedPlayers.size() > 0)
/*     */     {
/* 190 */       this.logger.warn(
/* 192 */         String.format(
/* 194 */         "Player invitations were refused: %s, invited players must be in the same Zone ( %s ) of the inviter ( %s ) and the number of invited player cannot exceed: %s", new Object[] { 
/* 195 */         refusedPlayers.toString(), 
/* 196 */         zone.getName(), 
/* 197 */         inviter.getName(), 
/* 198 */         Integer.valueOf(16) }));
/*     */     }
/*     */ 
/* 203 */     return invitedPlayers;
/*     */   }
/*     */ 
/*     */   private List<Room> getListOfSearchableRooms(User inviter, Collection<String> groupIds)
/*     */   {
/* 208 */     List searchableRooms = new ArrayList();
/* 209 */     Zone zone = inviter.getZone();
/*     */ 
/* 212 */     if (groupIds == null) {
/* 213 */       return searchableRooms;
/*     */     }
/* 215 */     for (String groupId : groupIds)
/*     */     {
/* 217 */       if (zone.containsPublicGroup(groupId)) {
/* 218 */         searchableRooms.addAll(zone.getRoomListFromGroup(groupId));
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 224 */     return searchableRooms;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.game.CreateSFSGame
 * JD-Core Version:    0.6.0
 */