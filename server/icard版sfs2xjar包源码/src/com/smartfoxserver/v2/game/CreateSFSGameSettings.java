/*     */ package com.smartfoxserver.v2.game;
/*     */ 
/*     */ import com.smartfoxserver.v2.api.CreateRoomSettings;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.match.MatchExpression;
/*     */ import java.util.List;
/*     */ 
/*     */ public class CreateSFSGameSettings extends CreateRoomSettings
/*     */ {
/*     */   private boolean gamePublic;
/*     */   private int minPlayersToStartGame;
/*     */   private List<User> invitedPlayers;
/*     */   private List<Room> searchableRooms;
/*     */   private boolean leaveLastJoinedRoom;
/*     */   private MatchExpression playerMatchExpression;
/*     */   private MatchExpression spectatorMatchExpression;
/*     */   private int invitationExpiryTime;
/*     */   private boolean notifyGameStartedViaRoomVariable;
/*     */   private ISFSObject invitationParams;
/*     */ 
/*     */   public static CreateSFSGameSettings newFromRoomSettings(CreateRoomSettings rSettings)
/*     */   {
/*  89 */     CreateSFSGameSettings gameSettings = new CreateSFSGameSettings();
/*     */ 
/*  91 */     gameSettings.setAutoRemoveMode(rSettings.getAutoRemoveMode());
/*  92 */     gameSettings.setUseWordsFilter(rSettings.isUseWordsFilter());
/*  93 */     gameSettings.setCustomPlayerIdGeneratorClass(rSettings.getCustomPlayerIdGeneratorClass());
/*  94 */     gameSettings.setDynamic(rSettings.isDynamic());
/*  95 */     gameSettings.setExtension(rSettings.getExtension());
/*  96 */     gameSettings.setGroupId(rSettings.getGroupId());
/*  97 */     gameSettings.setHidden(rSettings.isHidden());
/*  98 */     gameSettings.setMaxSpectators(rSettings.getMaxSpectators());
/*  99 */     gameSettings.setMaxUsers(rSettings.getMaxUsers());
/* 100 */     gameSettings.setMaxVariablesAllowed(rSettings.getMaxVariablesAllowed());
/* 101 */     gameSettings.setName(rSettings.getName());
/*     */ 
/* 103 */     gameSettings.setRoomSettings(rSettings.getRoomSettings());
/* 104 */     gameSettings.setRoomVariables(rSettings.getRoomVariables());
/*     */ 
/* 106 */     return gameSettings;
/*     */   }
/*     */ 
/*     */   public CreateSFSGameSettings()
/*     */   {
/* 112 */     this.leaveLastJoinedRoom = true;
/* 113 */     this.invitationExpiryTime = 10;
/* 114 */     this.notifyGameStartedViaRoomVariable = false;
/*     */ 
/* 117 */     setGame(true);
/*     */   }
/*     */ 
/*     */   public boolean isGamePublic()
/*     */   {
/* 126 */     return this.gamePublic;
/*     */   }
/*     */ 
/*     */   public void setGamePublic(boolean isGamePublic)
/*     */   {
/* 131 */     this.gamePublic = isGamePublic;
/*     */   }
/*     */ 
/*     */   public int getMinPlayersToStartGame()
/*     */   {
/* 140 */     return this.minPlayersToStartGame;
/*     */   }
/*     */ 
/*     */   public void setMinPlayersToStartGame(int minPlayersToStartGame)
/*     */   {
/* 145 */     this.minPlayersToStartGame = minPlayersToStartGame;
/*     */   }
/*     */ 
/*     */   public List<User> getInvitedPlayers()
/*     */   {
/* 156 */     return this.invitedPlayers;
/*     */   }
/*     */ 
/*     */   public void setInvitedPlayers(List<User> invitedPlayers)
/*     */   {
/* 165 */     this.invitedPlayers = invitedPlayers;
/*     */   }
/*     */ 
/*     */   public List<Room> getSearchableRooms()
/*     */   {
/* 177 */     return this.searchableRooms;
/*     */   }
/*     */ 
/*     */   public void setSearchableRooms(List<Room> searchableRooms)
/*     */   {
/* 187 */     this.searchableRooms = searchableRooms;
/*     */   }
/*     */ 
/*     */   public boolean isLeaveLastJoinedRoom()
/*     */   {
/* 196 */     return this.leaveLastJoinedRoom;
/*     */   }
/*     */ 
/*     */   public void setLeaveLastJoinedRoom(boolean leaveLastJoinedRoom)
/*     */   {
/* 201 */     this.leaveLastJoinedRoom = leaveLastJoinedRoom;
/*     */   }
/*     */ 
/*     */   public MatchExpression getPlayerMatchExpression()
/*     */   {
/* 217 */     return this.playerMatchExpression;
/*     */   }
/*     */ 
/*     */   public void setPlayerMatchExpression(MatchExpression playerMatchExpression)
/*     */   {
/* 234 */     this.playerMatchExpression = playerMatchExpression;
/*     */   }
/*     */ 
/*     */   public MatchExpression getSpectatorMatchExpression()
/*     */   {
/* 246 */     return this.spectatorMatchExpression;
/*     */   }
/*     */ 
/*     */   public void setSpectatorMatchExpression(MatchExpression spectatorMatchExpression)
/*     */   {
/* 258 */     this.spectatorMatchExpression = spectatorMatchExpression;
/*     */   }
/*     */ 
/*     */   public int getInvitationExpiryTime()
/*     */   {
/* 268 */     return this.invitationExpiryTime;
/*     */   }
/*     */ 
/*     */   public void setInvitationExpiryTime(int invitationExpiryTime)
/*     */   {
/* 280 */     this.invitationExpiryTime = invitationExpiryTime;
/*     */   }
/*     */ 
/*     */   public boolean isNotifyGameStartedViaRoomVariable()
/*     */   {
/* 291 */     return this.notifyGameStartedViaRoomVariable;
/*     */   }
/*     */ 
/*     */   public void setNotifyGameStartedViaRoomVariable(boolean notifyGameStartedWithRoomVariable)
/*     */   {
/* 296 */     this.notifyGameStartedViaRoomVariable = notifyGameStartedWithRoomVariable;
/*     */   }
/*     */ 
/*     */   public ISFSObject getInvitationParams()
/*     */   {
/* 306 */     return this.invitationParams;
/*     */   }
/*     */ 
/*     */   public void setInvitationParams(ISFSObject invitationParams)
/*     */   {
/* 317 */     this.invitationParams = invitationParams;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.game.CreateSFSGameSettings
 * JD-Core Version:    0.6.0
 */