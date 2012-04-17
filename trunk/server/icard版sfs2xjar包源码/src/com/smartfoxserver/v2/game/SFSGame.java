/*     */ package com.smartfoxserver.v2.game;
/*     */ 
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.entities.RoomSize;
/*     */ import com.smartfoxserver.v2.entities.SFSRoom;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.match.MatchExpression;
/*     */ import com.smartfoxserver.v2.entities.variables.RoomVariable;
/*     */ import com.smartfoxserver.v2.entities.variables.SFSRoomVariable;
/*     */ import com.smartfoxserver.v2.exceptions.SFSJoinRoomException;
/*     */ import java.util.Arrays;
/*     */ 
/*     */ public class SFSGame extends SFSRoom
/*     */ {
/*     */   private MatchExpression playerMatchExpression;
/*     */   private MatchExpression spectatorMatchExpression;
/*     */   private int minPlayersToStartGame;
/*     */   private boolean leaveLastRoomOnJoin;
/*     */   private boolean notifyGameStarted;
/*     */   private boolean gameStateChanged;
/*     */ 
/*     */   public SFSGame(String name)
/*     */   {
/*  68 */     super(name);
/*  69 */     this.leaveLastRoomOnJoin = true;
/*  70 */     this.notifyGameStarted = false;
/*  71 */     this.gameStateChanged = false;
/*     */   }
/*     */ 
/*     */   public MatchExpression getPlayerMatchExpression()
/*     */   {
/*  83 */     return this.playerMatchExpression;
/*     */   }
/*     */ 
/*     */   public int getMinPlayersToStartGame()
/*     */   {
/*  92 */     return this.minPlayersToStartGame;
/*     */   }
/*     */ 
/*     */   public void setPlayerMatchExpression(MatchExpression exp)
/*     */   {
/* 103 */     if (this.playerMatchExpression != null) {
/* 104 */       throw new IllegalStateException("UserMatchExpression can't be modified at runtime");
/*     */     }
/* 106 */     this.playerMatchExpression = exp;
/*     */   }
/*     */ 
/*     */   public MatchExpression getSpectatorMatchExpression()
/*     */   {
/* 118 */     return this.spectatorMatchExpression;
/*     */   }
/*     */ 
/*     */   public void setSpectatorMatchExpression(MatchExpression spectatorMatchExpression)
/*     */   {
/* 129 */     if (this.spectatorMatchExpression != null) {
/* 130 */       throw new IllegalStateException("UserMatchExpression can't be modified at runtime");
/*     */     }
/* 132 */     this.spectatorMatchExpression = spectatorMatchExpression;
/*     */   }
/*     */ 
/*     */   public void setMinPlayersToStartGame(int min)
/*     */   {
/* 143 */     this.minPlayersToStartGame = min;
/*     */   }
/*     */ 
/*     */   public boolean isLeaveLastRoomOnJoin()
/*     */   {
/* 152 */     return this.leaveLastRoomOnJoin;
/*     */   }
/*     */ 
/*     */   public void setLeaveLastRoomOnJoin(boolean leaveLastRoomOnJoin)
/*     */   {
/* 157 */     this.leaveLastRoomOnJoin = leaveLastRoomOnJoin;
/*     */   }
/*     */ 
/*     */   public boolean isNotifyGameStarted()
/*     */   {
/* 168 */     return this.notifyGameStarted;
/*     */   }
/*     */ 
/*     */   public void setNotifyGameStarted(boolean notifyGameStarted)
/*     */   {
/* 173 */     this.notifyGameStarted = notifyGameStarted;
/*     */   }
/*     */ 
/*     */   public boolean isGameStarted()
/*     */   {
/* 182 */     return getSize().getUserCount() >= this.minPlayersToStartGame;
/*     */   }
/*     */ 
/*     */   public boolean isGameStateChanged()
/*     */   {
/* 193 */     return this.gameStateChanged;
/*     */   }
/*     */ 
/*     */   public void addUser(User user, boolean asSpectator)
/*     */     throws SFSJoinRoomException
/*     */   {
/* 200 */     boolean oldGameStarted = isGameStarted();
/*     */ 
/* 203 */     super.addUser(user, asSpectator);
/*     */ 
/* 206 */     boolean newGameStarted = isGameStarted();
/* 207 */     this.gameStateChanged = (newGameStarted ^ oldGameStarted);
/*     */ 
/* 210 */     notifyGameStartedUpdate(this.gameStateChanged, newGameStarted);
/*     */   }
/*     */ 
/*     */   public void removeUser(User user)
/*     */   {
/* 217 */     boolean oldGameStarted = isGameStarted();
/*     */ 
/* 220 */     super.removeUser(user);
/*     */ 
/* 223 */     boolean newGameStarted = isGameStarted();
/* 224 */     this.gameStateChanged = (newGameStarted ^ oldGameStarted);
/*     */ 
/* 227 */     notifyGameStartedUpdate(this.gameStateChanged, newGameStarted);
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 233 */     return String.format("[ SFSGame: %s, Id: %s, Group: %s, public: %s, minPlayers: %s ]", new Object[] { getName(), Integer.valueOf(getId()), getGroupId(), Boolean.valueOf(isPublic()), Integer.valueOf(this.minPlayersToStartGame) });
/*     */   }
/*     */ 
/*     */   private void notifyGameStartedUpdate(boolean gameStateChanged, boolean gameStarted)
/*     */   {
/* 243 */     if ((this.notifyGameStarted) && (gameStateChanged))
/*     */     {
/* 245 */       ISFSApi api = SmartFoxServer.getInstance().getAPIManager().getSFSApi();
/* 246 */       RoomVariable varGameStarted = new SFSRoomVariable("$GS", Boolean.valueOf(gameStarted));
/* 247 */       varGameStarted.setGlobal(true);
/* 248 */       varGameStarted.setPrivate(true);
/*     */ 
/* 251 */       api.setRoomVariables(null, this, Arrays.asList(new RoomVariable[] { varGameStarted }));
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.game.SFSGame
 * JD-Core Version:    0.6.0
 */