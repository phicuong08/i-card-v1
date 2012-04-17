/*    */ package com.smartfoxserver.v2.game;
/*    */ 
/*    */ import com.smartfoxserver.v2.SmartFoxServer;
/*    */ import com.smartfoxserver.v2.api.APIManager;
/*    */ import com.smartfoxserver.v2.api.ISFSApi;
/*    */ import com.smartfoxserver.v2.entities.Room;
/*    */ import com.smartfoxserver.v2.entities.invitation.InvitationCallback;
/*    */ import org.slf4j.Logger;
/*    */ import org.slf4j.LoggerFactory;
/*    */ 
/*    */ public abstract class BaseGameInvitationCallback
/*    */   implements InvitationCallback
/*    */ {
/*    */   private Room game;
/*    */   private boolean leaveLastJoinedRoom;
/*    */   protected final Logger log;
/*    */   protected final ISFSApi sfsAPI;
/*    */ 
/*    */   public BaseGameInvitationCallback(Room game, boolean leaveLastJoinedRoom)
/*    */   {
/* 33 */     this.game = game;
/* 34 */     this.leaveLastJoinedRoom = leaveLastJoinedRoom;
/* 35 */     this.log = LoggerFactory.getLogger(getClass());
/* 36 */     this.sfsAPI = SmartFoxServer.getInstance().getAPIManager().getSFSApi();
/*    */   }
/*    */ 
/*    */   protected Room getGame()
/*    */   {
/* 45 */     return this.game;
/*    */   }
/*    */ 
/*    */   protected boolean isLeaveLastJoindRoom()
/*    */   {
/* 54 */     return this.leaveLastJoinedRoom;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.game.BaseGameInvitationCallback
 * JD-Core Version:    0.6.0
 */