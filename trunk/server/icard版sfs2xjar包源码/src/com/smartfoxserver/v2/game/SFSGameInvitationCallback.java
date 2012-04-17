/*     */ package com.smartfoxserver.v2.game;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.core.ISFSEventManager;
/*     */ import com.smartfoxserver.v2.core.SFSEvent;
/*     */ import com.smartfoxserver.v2.core.SFSEventParam;
/*     */ import com.smartfoxserver.v2.core.SFSEventType;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.invitation.Invitation;
/*     */ import com.smartfoxserver.v2.exceptions.SFSJoinRoomException;
/*     */ import java.util.HashMap;
/*     */ import java.util.Map;
/*     */ import java.util.concurrent.atomic.AtomicInteger;
/*     */ import org.slf4j.Logger;
/*     */ 
/*     */ public class SFSGameInvitationCallback extends BaseGameInvitationCallback
/*     */ {
/*     */   private final AtomicInteger responseCount;
/*     */   private final int invitedPlayersCount;
/*     */   private final SmartFoxServer sfs;
/*     */ 
/*     */   public SFSGameInvitationCallback(Room game, int invitedPlayersCount, boolean leaveLastJoinedRoom)
/*     */   {
/*  27 */     super(game, leaveLastJoinedRoom);
/*  28 */     this.sfs = SmartFoxServer.getInstance();
/*  29 */     this.invitedPlayersCount = invitedPlayersCount;
/*  30 */     this.responseCount = new AtomicInteger(0);
/*     */   }
/*     */ 
/*     */   public void onAccepted(Invitation invObj, ISFSObject params)
/*     */   {
/*  36 */     User user = invObj.getInvitee();
/*  37 */     Room roomToLeave = null;
/*     */ 
/*  43 */     Integer roomToLeavedIdFromClient = null;
/*  44 */     if (params != null) {
/*  45 */       roomToLeavedIdFromClient = params.getInt("$rl");
/*     */     }
/*     */ 
/*  48 */     if (isLeaveLastJoindRoom()) {
/*  49 */       roomToLeave = user.getLastJoinedRoom();
/*     */     }
/*  52 */     else if (roomToLeavedIdFromClient != null) {
/*  53 */       roomToLeave = user.getZone().getRoomById(roomToLeavedIdFromClient.intValue());
/*     */     }
/*     */ 
/*     */     try
/*     */     {
/*  58 */       this.sfsAPI.joinRoom(invObj.getInvitee(), getGame(), getGame().getPassword(), false, roomToLeave);
/*  59 */       this.log.info("USER ROOMS: " + invObj.getInvitee().getName() + ", " + invObj.getInvitee().getJoinedRooms());
/*     */     }
/*     */     catch (SFSJoinRoomException joinErr)
/*     */     {
/*  65 */       this.log.warn(
/*  67 */         String.format(
/*  69 */         "Invitee %s accepted invitation but failed joining %s, %s", new Object[] { 
/*  70 */         invObj.getInvitee(), 
/*  71 */         getGame(), 
/*  72 */         joinErr }));
/*     */     }
/*     */     finally
/*     */     {
/*  79 */       checkForInvitationCycleComplete();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void onRefused(Invitation invObj, ISFSObject params)
/*     */   {
/*  86 */     this.log.info(String.format("Invitation refused by %s for game %s", new Object[] { invObj.getInvitee(), getGame() }));
/*  87 */     checkForInvitationCycleComplete();
/*     */   }
/*     */ 
/*     */   public void onExpired(Invitation invObj)
/*     */   {
/*  93 */     this.log.info(String.format("Invitation expired for %s, Game: %s", new Object[] { invObj.getInvitee(), getGame() }));
/*  94 */     checkForInvitationCycleComplete();
/*     */   }
/*     */ 
/*     */   private void checkForInvitationCycleComplete()
/*     */   {
/*  99 */     int count = this.responseCount.incrementAndGet();
/* 100 */     SFSGame game = (SFSGame)getGame();
/*     */ 
/* 103 */     if (count == this.invitedPlayersCount)
/*     */     {
/* 106 */       User owner = game.getOwner();
/*     */ 
/* 108 */       if (owner != null) {
/* 109 */         owner.getSession().removeSystemProperty("InvitationProcessRunning");
/*     */       }
/*     */ 
/* 112 */       boolean goodToGo = (game.isActive()) && (game.isGameStarted());
/*     */ 
/* 114 */       Map evtParams = new HashMap();
/* 115 */       evtParams.put(SFSEventParam.ZONE, game.getZone());
/* 116 */       evtParams.put(SFSEventParam.ROOM, game);
/*     */ 
/* 119 */       if (goodToGo) {
/* 120 */         this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.GAME_INVITATION_SUCCESS, evtParams));
/*     */       }
/*     */       else
/*     */       {
/* 124 */         this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.GAME_INVITATION_FAILURE, evtParams));
/*     */       }
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.game.SFSGameInvitationCallback
 * JD-Core Version:    0.6.0
 */