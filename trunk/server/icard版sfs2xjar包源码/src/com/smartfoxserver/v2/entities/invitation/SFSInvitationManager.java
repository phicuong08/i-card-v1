/*     */ package com.smartfoxserver.v2.entities.invitation;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.service.IService;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.core.ISFSEvent;
/*     */ import com.smartfoxserver.v2.core.ISFSEventListener;
/*     */ import com.smartfoxserver.v2.core.ISFSEventManager;
/*     */ import com.smartfoxserver.v2.core.SFSEventParam;
/*     */ import com.smartfoxserver.v2.core.SFSEventType;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorCode;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorData;
/*     */ import com.smartfoxserver.v2.exceptions.SFSInvitationException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import com.smartfoxserver.v2.util.TaskScheduler;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Collection;
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import java.util.concurrent.TimeUnit;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSInvitationManager
/*     */   implements IService, InvitationManager
/*     */ {
/*     */   private static final int INVITATION_CLEANER_INTERVAL = 3;
/*     */   private final String serviceName;
/*     */   private final SmartFoxServer sfs;
/*     */   private final Logger log;
/*     */   private final ISFSEventListener userEventListener;
/*     */   private final Map<Integer, Invitation> invitationsById;
/*     */   private final Map<User, List<Invitation>> invitationsByOwner;
/*  37 */   private int maxInvitationsPerUser = 16;
/*     */ 
/*     */   public SFSInvitationManager()
/*     */   {
/*  54 */     this.serviceName = "SFSInvitationManager";
/*  55 */     this.sfs = SmartFoxServer.getInstance();
/*  56 */     this.log = LoggerFactory.getLogger(getClass());
/*     */ 
/*  58 */     this.invitationsById = new ConcurrentHashMap();
/*  59 */     this.invitationsByOwner = new ConcurrentHashMap();
/*     */ 
/*  61 */     this.userEventListener = new UserExitEventHandler(null);
/*     */   }
/*     */ 
/*     */   public void init(Object o)
/*     */   {
/*  68 */     this.sfs.getEventManager().addEventListener(SFSEventType.USER_DISCONNECT, this.userEventListener);
/*  69 */     this.sfs.getEventManager().addEventListener(SFSEventType.USER_LOGOUT, this.userEventListener);
/*     */ 
/*  72 */     this.sfs.getTaskScheduler().scheduleAtFixedRate(
/*  74 */       new Runnable()
/*     */     {
/*     */       public void run()
/*     */       {
/*     */         try
/*     */         {
/*  81 */           SFSInvitationManager.this.cleanExpiredInvitations();
/*     */         }
/*     */         catch (Exception e)
/*     */         {
/*  87 */           SFSInvitationManager.this.log.warn("Error trapped in CleanExpiredInvitation: " + e);
/*  88 */           e.printStackTrace();
/*     */         }
/*     */       }
/*     */     }
/*     */     , 0, 
/*  93 */       3, 
/*  94 */       TimeUnit.SECONDS);
/*     */   }
/*     */ 
/*     */   public void destroy(Object o)
/*     */   {
/* 102 */     this.sfs.getEventManager().removeEventListener(SFSEventType.USER_DISCONNECT, this.userEventListener);
/* 103 */     this.sfs.getEventManager().removeEventListener(SFSEventType.USER_LOGOUT, this.userEventListener);
/*     */ 
/* 106 */     this.invitationsById.clear();
/* 107 */     this.invitationsByOwner.clear();
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/* 113 */     return this.serviceName;
/*     */   }
/*     */ 
/*     */   public void setName(String name)
/*     */   {
/* 119 */     throw new UnsupportedOperationException("Method not supported.");
/*     */   }
/*     */ 
/*     */   public void handleMessage(Object o)
/*     */   {
/* 125 */     throw new UnsupportedOperationException("Method not supported.");
/*     */   }
/*     */ 
/*     */   public Invitation findById(int id)
/*     */   {
/* 131 */     return (Invitation)this.invitationsById.get(Integer.valueOf(id));
/*     */   }
/*     */ 
/*     */   public int getMaxInvitationsPerUser()
/*     */   {
/* 137 */     return this.maxInvitationsPerUser;
/*     */   }
/*     */ 
/*     */   public void setMaxInvitationsPerUser(int value)
/*     */   {
/* 143 */     this.maxInvitationsPerUser = value;
/*     */   }
/*     */ 
/*     */   public void startInvitation(Invitation invitation, InvitationCallback callBack)
/*     */   {
/* 150 */     if (invitation == null) {
/* 151 */       throw new NullPointerException("Invitation object is null. Please provide a valid object.");
/*     */     }
/* 153 */     if (callBack == null) {
/* 154 */       throw new NullPointerException("Callback object is null. Please provide a valid object.");
/*     */     }
/* 156 */     if ((invitation.getInviter() == null) || (invitation.getInvitee() == null)) {
/* 157 */       throw new IllegalArgumentException("Both Inviter and Invitee must be non-null User objects.");
/*     */     }
/* 159 */     User inviter = invitation.getInviter();
/*     */ 
/* 162 */     List userInvitationList = (List)this.invitationsByOwner.get(inviter);
/*     */ 
/* 165 */     synchronized (this.invitationsByOwner)
/*     */     {
/* 167 */       if (userInvitationList == null)
/*     */       {
/* 169 */         userInvitationList = new ArrayList();
/* 170 */         this.invitationsByOwner.put(inviter, userInvitationList);
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 175 */     if (userInvitationList.size() < this.maxInvitationsPerUser)
/*     */     {
/* 177 */       this.invitationsById.put(Integer.valueOf(invitation.getId()), invitation);
/*     */ 
/* 179 */       synchronized (userInvitationList)
/*     */       {
/* 181 */         userInvitationList.add(invitation);
/*     */       }
/*     */ 
/* 185 */       invitation.setCallback(callBack);
/*     */ 
/* 187 */       this.log.debug("Invitation: " + invitation + " started.");
/*     */     }
/*     */     else
/*     */     {
/* 193 */       throw new SFSRuntimeException("The user: " + inviter + " is already running the max allowed number of invitations = " + this.maxInvitationsPerUser);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void suppressInvitation(Invitation invitation)
/*     */   {
/* 201 */     throw new UnsupportedOperationException("This feature will be available in future implementations.");
/*     */   }
/*     */ 
/*     */   public void onInvitationResult(int invitationId, InvitationResponse result, ISFSObject params)
/*     */     throws SFSInvitationException
/*     */   {
/* 207 */     Invitation invitation = findById(invitationId);
/*     */ 
/* 210 */     if (invitation == null)
/*     */     {
/* 212 */       throw new SFSInvitationException(
/* 214 */         String.format(
/* 216 */         "Invitation result discarded. Invitation is not managed. ID: %s, Result: %s", new Object[] { 
/* 217 */         Integer.valueOf(invitationId), 
/* 218 */         result }), 
/* 220 */         new SFSErrorData(SFSErrorCode.INVITATION_NOT_VALID));
/*     */     }
/*     */ 
/* 225 */     onInvitationResult(invitation, result, params);
/*     */   }
/*     */ 
/*     */   public void onInvitationResult(Invitation invitation, InvitationResponse result, ISFSObject params)
/*     */     throws SFSInvitationException
/*     */   {
/* 232 */     String errorMsg = null;
/*     */ 
/* 234 */     if (!this.invitationsById.containsKey(Integer.valueOf(invitation.getId()))) {
/* 235 */       errorMsg = "Invitation is not managed (maybe removed?)";
/*     */     }
/* 237 */     if (invitation.getCallback() == null) {
/* 238 */       errorMsg = "Invitation no longer valid.";
/*     */     }
/* 240 */     if (invitation.isExpired()) {
/* 241 */       errorMsg = "Invitation is expired.";
/*     */     }
/*     */ 
/* 244 */     if (errorMsg != null) {
/* 245 */       throw new SFSInvitationException(errorMsg, new SFSErrorData(SFSErrorCode.INVITATION_NOT_VALID));
/*     */     }
/*     */ 
/* 248 */     if (result == InvitationResponse.ACCEPT)
/* 249 */       handleAcceptedInvitation(invitation, params);
/*     */     else
/* 251 */       handleRefusedInvitation(invitation, params);
/*     */   }
/*     */ 
/*     */   private void cleanExpiredInvitations()
/*     */   {
/* 261 */     for (Iterator iter = this.invitationsById.values().iterator(); iter.hasNext(); )
/*     */     {
/* 263 */       Invitation invitation = (Invitation)iter.next();
/*     */ 
/* 265 */       if (!invitation.isExpired()) {
/*     */         continue;
/*     */       }
/* 268 */       iter.remove();
/*     */ 
/* 271 */       removeInvitation(invitation);
/*     */ 
/* 274 */       if (invitation.getCallback() != null)
/* 275 */         invitation.getCallback().onExpired(invitation);
/*     */     }
/*     */   }
/*     */ 
/*     */   private void handleAcceptedInvitation(Invitation invitation, ISFSObject params)
/*     */   {
/* 283 */     removeInvitation(invitation);
/*     */ 
/* 286 */     InvitationCallback callback = invitation.getCallback();
/*     */ 
/* 288 */     if (callback != null)
/* 289 */       callback.onAccepted(invitation, params);
/*     */   }
/*     */ 
/*     */   private void handleRefusedInvitation(Invitation invitation, ISFSObject params)
/*     */   {
/* 295 */     removeInvitation(invitation);
/*     */ 
/* 298 */     InvitationCallback callback = invitation.getCallback();
/*     */ 
/* 300 */     if (callback != null)
/* 301 */       callback.onRefused(invitation, params);
/*     */   }
/*     */ 
/*     */   private void handleInviterDisconnected(User inviter)
/*     */   {
/* 308 */     List invitationList = (List)this.invitationsByOwner.remove(inviter);
/*     */ 
/* 311 */     if (invitationList != null)
/*     */     {
/* 313 */       for (Invitation invitation : invitationList)
/*     */       {
/* 315 */         this.invitationsById.remove(Integer.valueOf(invitation.getId()));
/*     */       }
/*     */ 
/* 318 */       this.log.debug("Removed " + invitationList.size() + " invitations for user: " + inviter);
/*     */     }
/*     */   }
/*     */ 
/*     */   private void removeInvitation(Invitation invitation)
/*     */   {
/* 329 */     this.invitationsById.remove(Integer.valueOf(invitation.getId()));
/* 330 */     List invitationList = (List)this.invitationsByOwner.get(invitation.getInviter());
/*     */ 
/* 333 */     if (invitationList != null)
/*     */     {
/* 335 */       synchronized (invitationList)
/*     */       {
/* 337 */         invitationList.remove(invitation);
/*     */       }
/*     */     }
/*     */ 
/* 341 */     this.log.debug("Removed invitation: " + invitation);
/*     */   }
/*     */ 
/*     */   private final class UserExitEventHandler
/*     */     implements ISFSEventListener
/*     */   {
/*     */     private UserExitEventHandler()
/*     */     {
/*     */     }
/*     */ 
/*     */     public void handleServerEvent(ISFSEvent event)
/*     */       throws Exception
/*     */     {
/*  48 */       SFSInvitationManager.this.handleInviterDisconnected((User)event.getParameter(SFSEventParam.USER));
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.invitation.SFSInvitationManager
 * JD-Core Version:    0.6.0
 */