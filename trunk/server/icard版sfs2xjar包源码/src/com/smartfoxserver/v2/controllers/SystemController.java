/*     */ package com.smartfoxserver.v2.controllers;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.controllers.AbstractController;
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import java.util.HashMap;
/*     */ import java.util.Map;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SystemController extends AbstractController
/*     */ {
/*  17 */   private static final Map<Object, String> commandMap = new HashMap();
/*     */   private static final String commandPackage = "com.smartfoxserver.v2.controllers.system.";
/*     */   private static final String buddyPackage = "buddylist.";
/*     */   private static final String gamePackage = "game.";
/*     */   private final SmartFoxServer sfs;
/*     */   private final Logger logger;
/*     */   private Map<Object, IControllerCommand> commandCache;
/*  73 */   private boolean useCache = true;
/*     */ 
/*     */   static
/*     */   {
/*  25 */     commandMap.put(SystemRequest.Handshake.getId(), "com.smartfoxserver.v2.controllers.system.Handshake");
/*  26 */     commandMap.put(SystemRequest.Login.getId(), "com.smartfoxserver.v2.controllers.system.Login");
/*  27 */     commandMap.put(SystemRequest.Logout.getId(), "com.smartfoxserver.v2.controllers.system.Logout");
/*  28 */     commandMap.put(SystemRequest.JoinRoom.getId(), "com.smartfoxserver.v2.controllers.system.JoinRoom");
/*  29 */     commandMap.put(SystemRequest.AutoJoin.getId(), "com.smartfoxserver.v2.controllers.system.AutoJoin");
/*  30 */     commandMap.put(SystemRequest.CreateRoom.getId(), "com.smartfoxserver.v2.controllers.system.CreateRoom");
/*  31 */     commandMap.put(SystemRequest.GenericMessage.getId(), "com.smartfoxserver.v2.controllers.system.GenericMessage");
/*  32 */     commandMap.put(SystemRequest.ChangeRoomName.getId(), "com.smartfoxserver.v2.controllers.system.ChangeRoomName");
/*  33 */     commandMap.put(SystemRequest.ChangeRoomPassword.getId(), "com.smartfoxserver.v2.controllers.system.ChangeRoomPassword");
/*  34 */     commandMap.put(SystemRequest.ChangeRoomCapacity.getId(), "com.smartfoxserver.v2.controllers.system.ChangeRoomCapacity");
/*  35 */     commandMap.put(SystemRequest.ObjectMessage.getId(), "com.smartfoxserver.v2.controllers.system.SendObject");
/*  36 */     commandMap.put(SystemRequest.SetRoomVariables.getId(), "com.smartfoxserver.v2.controllers.system.SetRoomVariables");
/*  37 */     commandMap.put(SystemRequest.SetUserVariables.getId(), "com.smartfoxserver.v2.controllers.system.SetUserVariables");
/*  38 */     commandMap.put(SystemRequest.CallExtension.getId(), "com.smartfoxserver.v2.controllers.system.CallExtension");
/*  39 */     commandMap.put(SystemRequest.LeaveRoom.getId(), "com.smartfoxserver.v2.controllers.system.LeaveRoom");
/*  40 */     commandMap.put(SystemRequest.SubscribeRoomGroup.getId(), "com.smartfoxserver.v2.controllers.system.SubscribeRoomGroup");
/*  41 */     commandMap.put(SystemRequest.UnsubscribeRoomGroup.getId(), "com.smartfoxserver.v2.controllers.system.UnsubscribeRoomGroup");
/*  42 */     commandMap.put(SystemRequest.PlayerToSpectator.getId(), "com.smartfoxserver.v2.controllers.system.PlayerToSpectator");
/*  43 */     commandMap.put(SystemRequest.SpectatorToPlayer.getId(), "com.smartfoxserver.v2.controllers.system.SpectatorToPlayer");
/*  44 */     commandMap.put(SystemRequest.KickUser.getId(), "com.smartfoxserver.v2.controllers.system.KickUser");
/*  45 */     commandMap.put(SystemRequest.BanUser.getId(), "com.smartfoxserver.v2.controllers.system.BanUser");
/*  46 */     commandMap.put(SystemRequest.ManualDisconnection.getId(), "com.smartfoxserver.v2.controllers.system.ManualDisconnection");
/*  47 */     commandMap.put(SystemRequest.FindRooms.getId(), "com.smartfoxserver.v2.controllers.system.FindRooms");
/*  48 */     commandMap.put(SystemRequest.FindUsers.getId(), "com.smartfoxserver.v2.controllers.system.FindUsers");
/*  49 */     commandMap.put(SystemRequest.PingPong.getId(), "com.smartfoxserver.v2.controllers.system.PingPong");
/*     */ 
/*  52 */     commandMap.put(SystemRequest.InitBuddyList.getId(), "com.smartfoxserver.v2.controllers.system.buddylist.InitBuddyList");
/*  53 */     commandMap.put(SystemRequest.AddBuddy.getId(), "com.smartfoxserver.v2.controllers.system.buddylist.AddBuddy");
/*  54 */     commandMap.put(SystemRequest.BlockBuddy.getId(), "com.smartfoxserver.v2.controllers.system.buddylist.BlockBuddy");
/*  55 */     commandMap.put(SystemRequest.RemoveBuddy.getId(), "com.smartfoxserver.v2.controllers.system.buddylist.RemoveBuddy");
/*  56 */     commandMap.put(SystemRequest.SetBuddyVariables.getId(), "com.smartfoxserver.v2.controllers.system.buddylist.SetBuddyVariables");
/*  57 */     commandMap.put(SystemRequest.GoOnline.getId(), "com.smartfoxserver.v2.controllers.system.buddylist.GoOnline");
/*     */ 
/*  60 */     commandMap.put(SystemRequest.CreateSFSGame.getId(), "com.smartfoxserver.v2.controllers.system.game.CreateSFSGame");
/*  61 */     commandMap.put(SystemRequest.InviteUser.getId(), "com.smartfoxserver.v2.controllers.system.game.InviteUser");
/*  62 */     commandMap.put(SystemRequest.InvitationReply.getId(), "com.smartfoxserver.v2.controllers.system.game.InvitationReply");
/*  63 */     commandMap.put(SystemRequest.QuickJoinGame.getId(), "com.smartfoxserver.v2.controllers.system.game.QuickJoinGame");
/*     */   }
/*     */ 
/*     */   public SystemController()
/*     */   {
/*  77 */     this.sfs = SmartFoxServer.getInstance();
/*  78 */     this.logger = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ 
/*     */   public void init(Object o)
/*     */   {
/*  84 */     super.init(o);
/*  85 */     this.commandCache = new ConcurrentHashMap();
/*     */   }
/*     */ 
/*     */   public void destroy(Object o)
/*     */   {
/*  91 */     super.destroy(o);
/*     */   }
/*     */ 
/*     */   public void processRequest(IRequest request)
/*     */     throws Exception
/*     */   {
/*  98 */     if (this.logger.isDebugEnabled()) {
/*  99 */       this.logger.debug("{IN}: " + SystemRequest.fromId(request.getId()).toString());
/*     */     }
/* 101 */     IControllerCommand command = null;
/* 102 */     Object reqId = request.getId();
/*     */ 
/* 104 */     if (this.useCache)
/*     */     {
/* 106 */       command = (IControllerCommand)this.commandCache.get(reqId);
/*     */ 
/* 109 */       if (command == null)
/*     */       {
/* 111 */         command = getCommand(reqId);
/*     */       }
/*     */     }
/*     */     else {
/* 115 */       command = getCommand(reqId);
/*     */     }
/*     */ 
/* 121 */     if (command != null)
/*     */     {
/* 124 */       if (command.validate(request))
/*     */       {
/*     */         try
/*     */         {
/* 128 */           command.execute(request);
/*     */         }
/*     */         catch (SFSRuntimeException re)
/*     */         {
/* 132 */           String msg = re.getMessage();
/*     */ 
/* 134 */           if (msg != null)
/* 135 */             this.logger.warn(msg);
/*     */         }
/*     */       }
/*     */     }
/*     */   }
/*     */ 
/*     */   private IControllerCommand getCommand(Object reqId)
/*     */   {
/* 143 */     IControllerCommand command = null;
/* 144 */     String className = (String)commandMap.get(reqId);
/*     */ 
/* 146 */     if (className != null)
/*     */     {
/*     */       try
/*     */       {
/* 150 */         Class clazz = Class.forName(className);
/* 151 */         command = (IControllerCommand)clazz.newInstance();
/*     */       }
/*     */       catch (Exception err)
/*     */       {
/* 155 */         this.logger.error("Could not dynamically instantiate class: " + className + ", Error: " + err);
/*     */       }
/*     */     }
/*     */     else
/*     */     {
/* 160 */       this.logger.error("Cannot find a controller command for request ID: " + reqId);
/*     */     }
/*     */ 
/* 163 */     return command;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.SystemController
 * JD-Core Version:    0.6.0
 */