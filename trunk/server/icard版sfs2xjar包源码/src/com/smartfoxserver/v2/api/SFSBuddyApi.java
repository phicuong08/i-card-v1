/*     */ package com.smartfoxserver.v2.api;
/*     */ 
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.response.ISFSResponseApi;
/*     */ import com.smartfoxserver.v2.api.response.SFSBuddyResponseApi;
/*     */ import com.smartfoxserver.v2.buddylist.Buddy;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyList;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyListManager;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyOnlineState;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyProperties;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyVariable;
/*     */ import com.smartfoxserver.v2.buddylist.SFSBuddyEventParam;
/*     */ import com.smartfoxserver.v2.buddylist.SFSBuddyVariable;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.core.ISFSEventManager;
/*     */ import com.smartfoxserver.v2.core.SFSEvent;
/*     */ import com.smartfoxserver.v2.core.SFSEventParam;
/*     */ import com.smartfoxserver.v2.core.SFSEventType;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.exceptions.SFSBuddyListException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorCode;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorData;
/*     */ import java.io.IOException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Arrays;
/*     */ import java.util.HashMap;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSBuddyApi
/*     */   implements ISFSBuddyApi
/*     */ {
/*     */   protected final SmartFoxServer sfs;
/*     */   protected final Logger log;
/*     */   protected final ISFSBuddyResponseApi responseAPI;
/*     */   protected final ISFSApi sfsApi;
/*     */ 
/*     */   public SFSBuddyApi(SmartFoxServer sfs)
/*     */   {
/*  45 */     this.sfs = sfs;
/*     */ 
/*  47 */     this.log = LoggerFactory.getLogger(getClass());
/*  48 */     this.responseAPI = new SFSBuddyResponseApi();
/*  49 */     this.sfsApi = sfs.getAPIManager().getSFSApi();
/*     */   }
/*     */ 
/*     */   public ISFSBuddyResponseApi getResponseAPI()
/*     */   {
/*  56 */     return this.responseAPI;
/*     */   }
/*     */ 
/*     */   public BuddyList initBuddyList(User user, boolean fireServerEvent)
/*     */     throws IOException
/*     */   {
/*  64 */     BuddyListManager manager = user.getZone().getBuddyListManager();
/*     */ 
/*  67 */     checkBuddyManagerIsActive(manager, user);
/*     */ 
/*  70 */     user.updateLastRequestTime();
/*     */ 
/*  72 */     BuddyList buddyList = null;
/*     */     try
/*     */     {
/*  77 */       buddyList = manager.loadBuddyList(user.getName());
/*     */ 
/*  80 */       user.getBuddyProperties().setInited();
/*     */ 
/*  83 */       this.responseAPI.notifyBuddyListInited(buddyList);
/*     */ 
/*  86 */       if (user.getBuddyProperties().isOnline()) {
/*  87 */         this.responseAPI.notifyBuddyOnlineStateChange(user, BuddyOnlineState.ONLINE, true);
/*     */       }
/*     */ 
/*     */       try
/*     */       {
/*  92 */         initializeBuddyState(user);
/*     */       }
/*     */       catch (SFSBuddyListException e)
/*     */       {
/*  96 */         this.log.warn("Was not able to initalized the BUDDY_STATE variable: " + e);
/*     */       }
/*     */ 
/* 100 */       if (fireServerEvent)
/*     */       {
/* 103 */         Map evtParams = new HashMap();
/* 104 */         evtParams.put(SFSEventParam.ZONE, user.getZone());
/* 105 */         evtParams.put(SFSEventParam.USER, user);
/* 106 */         evtParams.put(SFSBuddyEventParam.BUDDY_LIST, buddyList);
/*     */ 
/* 108 */         this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.BUDDY_LIST_INIT, evtParams));
/*     */       }
/*     */ 
/*     */     }
/*     */     catch (IOException ioErr)
/*     */     {
/* 115 */       SFSErrorData errData = new SFSErrorData(SFSErrorCode.BUDDY_LIST_LOAD_FAILURE);
/* 116 */       errData.addParameter(ioErr.getMessage());
/*     */ 
/* 118 */       SFSBuddyListException err = new SFSBuddyListException("BuddyList load error", errData);
/* 119 */       this.sfsApi.getResponseAPI().notifyRequestError(err, user, SystemRequest.InitBuddyList);
/*     */ 
/* 122 */       throw ioErr;
/*     */     }
/*     */ 
/* 125 */     return buddyList;
/*     */   }
/*     */ 
/*     */   public void goOnline(User user, boolean online, boolean fireServerEvent)
/*     */   {
/* 133 */     BuddyListManager manager = user.getZone().getBuddyListManager();
/* 134 */     checkBuddyManagerIsActive(manager, user);
/*     */ 
/* 136 */     BuddyProperties props = user.getBuddyProperties();
/* 137 */     checkBuddyIsInited(props);
/*     */ 
/* 140 */     if (props.isOnline() != online)
/*     */     {
/* 142 */       props.setOnline(online);
/* 143 */       props.setChangedSinceLastSave(true);
/* 144 */       user.updateLastRequestTime();
/*     */ 
/* 146 */       if (this.log.isDebugEnabled()) {
/* 147 */         this.log.debug(String.format("User %s goes %s", new Object[] { user.getName(), online ? "ONLINE" : "OFFLINE" }));
/*     */       }
/*     */ 
/* 150 */       this.responseAPI.notifyBuddyOnlineStateChange(user, online ? BuddyOnlineState.ONLINE : BuddyOnlineState.OFFLINE);
/*     */ 
/* 153 */       if (fireServerEvent)
/*     */       {
/* 156 */         Map evtParams = new HashMap();
/* 157 */         evtParams.put(SFSEventParam.ZONE, user.getZone());
/* 158 */         evtParams.put(SFSEventParam.USER, user);
/* 159 */         evtParams.put(SFSBuddyEventParam.BUDDY_IS_ONLINE, Boolean.valueOf(online));
/*     */ 
/* 161 */         this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.BUDDY_ONLINE_STATE_UPDATE, evtParams));
/*     */       }
/*     */     }
/*     */     else {
/* 165 */       this.log.info(String.format("Buddy online state is already: %s, %s ", new Object[] { Boolean.valueOf(online), user }));
/*     */     }
/*     */   }
/*     */ 
/*     */   public void addBuddy(User owner, String buddyName, boolean isTemp, boolean fireClientEvent, boolean fireServerEvent)
/*     */     throws SFSBuddyListException
/*     */   {
/* 173 */     BuddyListManager manager = owner.getZone().getBuddyListManager();
/* 174 */     checkBuddyManagerIsActive(manager, owner);
/*     */ 
/* 177 */     owner.updateLastRequestTime();
/*     */     try
/*     */     {
/* 181 */       Buddy buddy = manager.addBuddy(owner.getName(), buddyName, isTemp);
/* 182 */       owner.getBuddyProperties().setChangedSinceLastSave(true);
/*     */ 
/* 185 */       if (fireClientEvent) {
/* 186 */         this.responseAPI.notifyAddBuddy(buddy, owner);
/*     */       }
/*     */ 
/* 189 */       if (fireServerEvent)
/*     */       {
/* 192 */         Map evtParams = new HashMap();
/* 193 */         evtParams.put(SFSEventParam.ZONE, owner.getZone());
/* 194 */         evtParams.put(SFSEventParam.USER, owner);
/* 195 */         evtParams.put(SFSBuddyEventParam.BUDDY, buddy);
/*     */ 
/* 197 */         this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.BUDDY_ADD, evtParams));
/*     */       }
/*     */ 
/*     */     }
/*     */     catch (SFSBuddyListException buddyErr)
/*     */     {
/* 204 */       if (fireClientEvent) {
/* 205 */         this.sfsApi.getResponseAPI().notifyRequestError(buddyErr, owner, SystemRequest.AddBuddy);
/*     */       }
/*     */ 
/* 208 */       throw buddyErr;
/*     */     }
/*     */   }
/*     */ 
/*     */   public void addBuddy(Zone zone, String ownerName, String buddyName, boolean isTemp, boolean fireClientEvent, boolean fireServerEvent)
/*     */     throws SFSBuddyListException
/*     */   {
/* 219 */     throw new UnsupportedOperationException("Not yet implemented!");
/*     */   }
/*     */ 
/*     */   public void removeBuddy(User owner, String buddyName, boolean fireClientEvent, boolean fireServerEvent)
/*     */   {
/* 240 */     BuddyListManager manager = owner.getZone().getBuddyListManager();
/* 241 */     checkBuddyManagerIsActive(manager, owner);
/*     */ 
/* 243 */     BuddyProperties props = owner.getBuddyProperties();
/* 244 */     checkBuddyIsInited(props);
/*     */ 
/* 246 */     Buddy removedBuddy = manager.removeBuddy(owner.getName(), buddyName);
/*     */ 
/* 249 */     owner.updateLastRequestTime();
/*     */ 
/* 251 */     if (removedBuddy != null)
/*     */     {
/* 253 */       props.setChangedSinceLastSave(true);
/*     */ 
/* 256 */       if (fireClientEvent) {
/* 257 */         this.responseAPI.notifyRemoveBuddy(removedBuddy.getName(), owner);
/*     */       }
/*     */ 
/* 260 */       if (fireServerEvent)
/*     */       {
/* 262 */         Map evtParams = new HashMap();
/* 263 */         evtParams.put(SFSEventParam.ZONE, owner.getZone());
/* 264 */         evtParams.put(SFSEventParam.USER, owner);
/* 265 */         evtParams.put(SFSBuddyEventParam.BUDDY, removedBuddy);
/*     */ 
/* 267 */         this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.BUDDY_REMOVE, evtParams));
/*     */       }
/*     */ 
/*     */     }
/*     */     else
/*     */     {
/* 274 */       this.log.info(
/* 276 */         String.format(
/* 278 */         "RemoveBuddy error: %s is not present in %s buddy list", new Object[] { 
/* 279 */         buddyName, 
/* 280 */         owner.getName() }));
/*     */     }
/*     */   }
/*     */ 
/*     */   public void removeBuddy(Zone zone, String ownerName, String buddyName, boolean fireClientEvent, boolean fireServerEvent)
/*     */   {
/*     */   }
/*     */ 
/*     */   public void blockBuddy(User owner, String buddyName, boolean isBlocked, boolean fireClientEvent, boolean fireServerEvent)
/*     */   {
/* 313 */     BuddyListManager buddyListManager = owner.getZone().getBuddyListManager();
/* 314 */     checkBuddyManagerIsActive(buddyListManager, owner);
/*     */ 
/* 316 */     BuddyProperties props = owner.getBuddyProperties();
/* 317 */     checkBuddyIsInited(props);
/*     */ 
/* 319 */     BuddyList bList = buddyListManager.getBuddyList(owner.getName());
/* 320 */     boolean error = false;
/*     */ 
/* 323 */     owner.updateLastRequestTime();
/*     */ 
/* 325 */     if (bList != null)
/*     */     {
/* 327 */       Buddy buddy = bList.getBuddy(buddyName);
/*     */ 
/* 329 */       if (buddy != null)
/*     */       {
/* 332 */         buddy.setBlocked(isBlocked);
/*     */ 
/* 334 */         if (this.log.isDebugEnabled()) {
/* 335 */           this.log.debug(String.format("Buddy %s was %s in %s buddylist", new Object[] { buddy.getName(), isBlocked ? "blocked" : "unblocked", owner.getName() }));
/*     */         }
/*     */ 
/* 338 */         owner.getBuddyProperties().setChangedSinceLastSave(true);
/*     */ 
/* 340 */         if (fireClientEvent) {
/* 341 */           this.responseAPI.notifyBuddyBlockStatus(buddy.getName(), buddy.isBlocked(), owner);
/*     */         }
/* 343 */         if (fireServerEvent)
/*     */         {
/* 346 */           Map evtParams = new HashMap();
/* 347 */           evtParams.put(SFSEventParam.ZONE, owner.getZone());
/* 348 */           evtParams.put(SFSEventParam.USER, owner);
/* 349 */           evtParams.put(SFSBuddyEventParam.BUDDY, buddy);
/*     */ 
/* 351 */           this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.BUDDY_BLOCK, evtParams));
/*     */         }
/*     */       }
/*     */       else
/*     */       {
/* 356 */         error = true;
/*     */       }
/*     */     }
/*     */     else
/*     */     {
/* 361 */       error = true;
/*     */     }
/* 363 */     if (error)
/* 364 */       this.log.info(String.format("BlockBuddy failure. Buddy: %s is not present in %s BuddyList", new Object[] { buddyName, owner.getName() }));
/*     */   }
/*     */ 
/*     */   public void setBuddyVariables(User owner, List<BuddyVariable> buddyVariables, boolean fireClientEvent, boolean fireServerEvent)
/*     */     throws SFSBuddyListException
/*     */   {
/* 374 */     BuddyListManager manager = owner.getZone().getBuddyListManager();
/* 375 */     checkBuddyManagerIsActive(manager, owner);
/*     */ 
/* 377 */     BuddyProperties props = owner.getBuddyProperties();
/* 378 */     checkBuddyIsInited(props);
/*     */ 
/* 380 */     int maxAllowedVariables = owner.getZone().getBuddyListManager().getMaxBuddyVariables();
/*     */ 
/* 382 */     List listOfChanges = new ArrayList();
/*     */ 
/* 385 */     for (BuddyVariable bVar : buddyVariables)
/*     */     {
/* 387 */       BuddyVariable oldVar = props.getVariable(bVar.getName());
/*     */ 
/* 390 */       if (oldVar == null)
/*     */       {
/* 393 */         if (props.getVariablesCount() < maxAllowedVariables)
/*     */         {
/* 395 */           props.setVariable(bVar);
/* 396 */           listOfChanges.add(bVar);
/*     */         }
/*     */         else
/*     */         {
/* 402 */           this.log.warn(
/* 404 */             String.format(
/* 406 */             "Max number of BuddyVariables (%) was reached for User: %s, Discarding variable: %s", new Object[] { 
/* 407 */             Integer.valueOf(maxAllowedVariables), 
/* 408 */             owner.getName(), 
/* 409 */             bVar }));
/*     */         }
/*     */ 
/*     */       }
/*     */       else
/*     */       {
/* 418 */         props.setVariable(bVar);
/* 419 */         listOfChanges.add(bVar);
/*     */       }
/*     */     }
/*     */ 
/* 423 */     if (listOfChanges.size() > 0) {
/* 424 */       owner.getBuddyProperties().setChangedSinceLastSave(true);
/*     */     }
/*     */ 
/* 427 */     owner.updateLastRequestTime();
/*     */ 
/* 430 */     if (fireClientEvent) {
/* 431 */       this.responseAPI.notifyBuddyVariablesUpdate(owner, listOfChanges);
/*     */     }
/*     */ 
/* 434 */     if (fireServerEvent)
/*     */     {
/* 437 */       Map evtParams = new HashMap();
/* 438 */       evtParams.put(SFSEventParam.ZONE, owner.getZone());
/* 439 */       evtParams.put(SFSEventParam.USER, owner);
/* 440 */       evtParams.put(SFSEventParam.VARIABLES, listOfChanges);
/*     */ 
/* 442 */       this.sfs.getEventManager().dispatchEvent(new SFSEvent(SFSEventType.BUDDY_VARIABLES_UPDATE, evtParams));
/*     */     }
/*     */   }
/*     */ 
/*     */   public void sendBuddyMessage(User sender, User recipient, String message, ISFSObject params)
/*     */     throws SFSBuddyListException
/*     */   {
/* 454 */     this.sfs.getAPIManager().getSFSApi().sendBuddyMessage(sender, recipient, message, params);
/*     */   }
/*     */ 
/*     */   private void checkBuddyManagerIsActive(BuddyListManager manager, User sender)
/*     */   {
/* 463 */     if (!manager.isActive())
/*     */     {
/* 465 */       throw new IllegalStateException(
/* 467 */         String.format("BuddyList operation failure. BuddyListManager is not active. Zone: %s, Sender: %s", new Object[] { sender.getZone(), sender }));
/*     */     }
/*     */   }
/*     */ 
/*     */   private void checkBuddyIsInited(BuddyProperties props)
/*     */   {
/* 474 */     if (!props.isInited())
/* 475 */       throw new IllegalStateException("The BuddyList is not initialized. Please call initBuddyList() first or use the InitBuddyListRequest from client side.");
/*     */   }
/*     */ 
/*     */   private void initializeBuddyState(User user)
/*     */     throws SFSBuddyListException
/*     */   {
/* 487 */     BuddyListManager manager = user.getZone().getBuddyListManager();
/*     */ 
/* 489 */     if ((manager.getBuddyStates() != null) && (manager.getBuddyStates().size() > 0))
/*     */     {
/* 491 */       BuddyVariable buddyState = user.getBuddyProperties().getVariable("$__BV_STATE__");
/*     */ 
/* 493 */       if (buddyState == null)
/*     */       {
/* 495 */         setBuddyVariables(
/* 497 */           user, 
/* 498 */           Arrays.asList(new BuddyVariable[] { 
/* 500 */           new SFSBuddyVariable(
/* 502 */           "$__BV_STATE__", 
/* 503 */           manager.getBuddyStates().get(0)) }), 
/* 506 */           true, 
/* 507 */           false);
/*     */       }
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.SFSBuddyApi
 * JD-Core Version:    0.6.0
 */