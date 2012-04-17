/*     */ package com.smartfoxserver.v2.buddylist;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.ISFSBuddyApi;
/*     */ import com.smartfoxserver.v2.api.ISFSBuddyResponseApi;
/*     */ import com.smartfoxserver.v2.buddylist.cache.BuddyVariablesCache;
/*     */ import com.smartfoxserver.v2.buddylist.cache.SimpleVariableCache;
/*     */ import com.smartfoxserver.v2.buddylist.storage.BuddyStorage;
/*     */ import com.smartfoxserver.v2.core.ISFSEvent;
/*     */ import com.smartfoxserver.v2.core.ISFSEventListener;
/*     */ import com.smartfoxserver.v2.core.ISFSEventManager;
/*     */ import com.smartfoxserver.v2.core.SFSEventParam;
/*     */ import com.smartfoxserver.v2.core.SFSEventType;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.exceptions.SFSBuddyListException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSBuddyListNotFoundException;
/*     */ import java.io.IOException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSBuddyListManager
/*     */   implements BuddyListManager
/*     */ {
/*     */   private static final int DEFAULT_VAR_CACHE_SIZE = 500;
/*     */   private final Logger log;
/*     */   private final Zone zone;
/*     */   private final String serviceName;
/*     */   private boolean active;
/*     */   private boolean offlineBuddyVariables;
/*     */   private boolean useTempBuddies;
/*     */   private boolean useBadWordsFilter;
/*  42 */   private int maxListSize = 30;
/*  43 */   private int maxVariables = 5;
/*  44 */   private int bvCacheSize = 500;
/*     */   private BuddyStorage buddyStorage;
/*     */   private final Map<String, BuddyList> buddyLists;
/*     */   private final BuddyVariablesCache offlineVarsCache;
/*     */   private final UserExitEventHandler userExitEventHandler;
/*     */   private final SmartFoxServer sfs;
/*     */   private final ISFSBuddyApi buddyApi;
/*     */   private List<String> buddyStates;
/*     */ 
/*     */   public SFSBuddyListManager(Zone parentZone, boolean isActive)
/*     */   {
/*  94 */     this.log = LoggerFactory.getLogger(getClass());
/*  95 */     this.sfs = SmartFoxServer.getInstance();
/*  96 */     this.buddyApi = this.sfs.getAPIManager().getBuddyApi();
/*  97 */     this.zone = parentZone;
/*  98 */     this.serviceName = ("BuddyListManager-" + this.zone.getName());
/*  99 */     this.active = isActive;
/*     */ 
/* 101 */     this.userExitEventHandler = new UserExitEventHandler(null);
/*     */ 
/* 103 */     this.buddyLists = new ConcurrentHashMap();
/* 104 */     this.offlineVarsCache = new SimpleVariableCache(this.bvCacheSize);
/*     */   }
/*     */ 
/*     */   public void init(Object o)
/*     */   {
/* 113 */     if (this.active)
/*     */     {
/* 116 */       this.buddyStorage.setBuddyListManager(this);
/* 117 */       this.buddyStorage.init();
/*     */ 
/* 120 */       this.sfs.getEventManager().addEventListener(SFSEventType.USER_DISCONNECT, this.userExitEventHandler);
/* 121 */       this.sfs.getEventManager().addEventListener(SFSEventType.USER_LOGOUT, this.userExitEventHandler);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void destroy(Object o)
/*     */   {
/* 132 */     if (this.active)
/*     */     {
/* 135 */       this.sfs.getEventManager().removeEventListener(SFSEventType.USER_DISCONNECT, this.userExitEventHandler);
/* 136 */       this.sfs.getEventManager().removeEventListener(SFSEventType.USER_LOGOUT, this.userExitEventHandler);
/*     */ 
/* 138 */       saveAll();
/* 139 */       this.buddyStorage.destroy();
/*     */     }
/*     */   }
/*     */ 
/*     */   public boolean allowOfflineBuddyVariables()
/*     */   {
/* 149 */     return this.offlineBuddyVariables;
/*     */   }
/*     */ 
/*     */   public void setAllowOfflineBuddyVariables(boolean value)
/*     */   {
/* 155 */     this.offlineBuddyVariables = value;
/*     */   }
/*     */ 
/*     */   public Buddy addBuddy(String ownerName, String buddyName, boolean isTemp)
/*     */     throws SFSBuddyListException
/*     */   {
/* 164 */     BuddyList buddyList = (BuddyList)this.buddyLists.get(ownerName);
/*     */ 
/* 166 */     if (buddyList != null)
/*     */     {
/* 168 */       Buddy buddy = new SFSBuddy(buddyName, isTemp);
/* 169 */       buddy.setParentBuddyList(buddyList);
/*     */ 
/* 171 */       buddy = buddyList.addBuddy(buddy);
/*     */ 
/* 173 */       return buddy;
/*     */     }
/*     */ 
/* 181 */     throw new SFSBuddyListException("Cannot add Buddy to " + ownerName + " BuddyList. The BuddyList was not loaded first.");
/*     */   }
/*     */ 
/*     */   public BuddyList getBuddyList(String ownerName)
/*     */   {
/* 192 */     return (BuddyList)this.buddyLists.get(ownerName);
/*     */   }
/*     */ 
/*     */   public int getBuddyListMaxSize()
/*     */   {
/* 201 */     return this.maxListSize;
/*     */   }
/*     */ 
/*     */   public int getMaxBuddyVariables()
/*     */   {
/* 210 */     return this.maxVariables;
/*     */   }
/*     */ 
/*     */   public BuddyStorage getStorageHandler()
/*     */   {
/* 219 */     return this.buddyStorage;
/*     */   }
/*     */ 
/*     */   public Zone getZone()
/*     */   {
/* 228 */     return this.zone;
/*     */   }
/*     */ 
/*     */   public boolean isActive()
/*     */   {
/* 237 */     return this.active;
/*     */   }
/*     */ 
/*     */   public BuddyList loadBuddyList(String ownerName)
/*     */     throws IOException
/*     */   {
/* 246 */     BuddyList buddyList = null;
/*     */     try
/*     */     {
/* 251 */       buddyList = this.buddyStorage.loadList(ownerName);
/*     */     }
/*     */     catch (SFSBuddyListNotFoundException notFoundErr)
/*     */     {
/* 261 */       buddyList = new SFSBuddyList(ownerName, this);
/*     */     }
/*     */ 
/* 265 */     this.buddyLists.put(ownerName, buddyList);
/*     */ 
/* 267 */     if (this.log.isDebugEnabled()) {
/* 268 */       this.log.debug("BuddyList inited: " + buddyList);
/*     */     }
/* 270 */     return buddyList;
/*     */   }
/*     */ 
/*     */   public Buddy removeBuddy(String ownerName, String buddyName)
/*     */   {
/* 279 */     BuddyList buddyList = (BuddyList)this.buddyLists.get(ownerName);
/* 280 */     Buddy buddy = null;
/*     */ 
/* 282 */     if (buddyList != null) {
/* 283 */       buddy = buddyList.removeBuddy(buddyName);
/*     */     }
/* 285 */     return buddy;
/*     */   }
/*     */ 
/*     */   public void removeBuddyList(String ownerName)
/*     */   {
/* 296 */     this.buddyLists.remove(ownerName);
/*     */   }
/*     */ 
/*     */   public void saveAll()
/*     */   {
/* 305 */     if (!isActive()) {
/* 306 */       return;
/*     */     }
/* 308 */     List erroneousList = new ArrayList();
/*     */ 
/* 310 */     for (BuddyList buddyList : this.buddyLists.values())
/*     */     {
/*     */       try
/*     */       {
/* 314 */         saveBuddyList(buddyList);
/*     */       }
/*     */       catch (IOException e)
/*     */       {
/* 318 */         erroneousList.add(buddyList.getOwnerName());
/*     */       }
/*     */     }
/*     */ 
/* 322 */     if (erroneousList.size() > 0)
/* 323 */       this.log.warn("There were errors during BuddyList saveAll(). The following lists were not saved: " + erroneousList);
/*     */   }
/*     */ 
/*     */   public void saveBuddyList(String ownerName)
/*     */     throws IOException
/*     */   {
/* 332 */     BuddyList buddyList = (BuddyList)this.buddyLists.get(ownerName);
/*     */ 
/* 334 */     if (buddyList != null) {
/* 335 */       saveBuddyList(buddyList);
/*     */     }
/* 338 */     else if (this.log.isDebugEnabled())
/* 339 */       this.log.debug("Skipping BuddyList save request. No BuddyList available for: " + ownerName);
/*     */   }
/*     */ 
/*     */   public List<String> getBuddyStates()
/*     */   {
/* 349 */     return this.buddyStates;
/*     */   }
/*     */ 
/*     */   public void setBuddyStates(List<String> states)
/*     */   {
/* 355 */     this.buddyStates = states;
/*     */   }
/*     */ 
/*     */   public boolean getApplyBadWordsFilter()
/*     */   {
/* 364 */     return this.useBadWordsFilter;
/*     */   }
/*     */ 
/*     */   public void setApplyBadWordsFilter(boolean value)
/*     */   {
/* 370 */     this.useBadWordsFilter = value;
/*     */   }
/*     */ 
/*     */   private void saveBuddyList(BuddyList buddyList)
/*     */     throws IOException
/*     */   {
/* 382 */     if (!isActive()) {
/* 383 */       return;
/*     */     }
/* 385 */     User owner = buddyList.getOwner();
/*     */ 
/* 387 */     if ((owner != null) && (owner.getBuddyProperties().isChangedSinceLastSave()))
/*     */     {
/* 390 */       this.buddyStorage.saveList(buddyList);
/*     */ 
/* 393 */       owner.getBuddyProperties().setChangedSinceLastSave(false);
/*     */     }
/*     */   }
/*     */ 
/*     */   public BuddyVariable getOfflineBuddyVariable(String ownerName, String varName)
/*     */   {
/* 401 */     BuddyVariable var = null;
/* 402 */     List varList = getOfflineBuddyVariables(ownerName);
/*     */ 
/* 405 */     if (varList != null) {
/* 406 */       var = BuddyUtils.findVariable(varList, varName);
/*     */     }
/* 408 */     return var;
/*     */   }
/*     */ 
/*     */   public List<BuddyVariable> getOfflineBuddyVariables(String ownerName)
/*     */   {
/* 417 */     return getOfflineBuddyVariables(ownerName, false);
/*     */   }
/*     */ 
/*     */   public List<BuddyVariable> getOfflineBuddyVariables(String ownerName, boolean bypassCache)
/*     */   {
/* 424 */     List varList = bypassCache ? null : this.offlineVarsCache.getVariables(ownerName);
/*     */ 
/* 427 */     if (varList == null)
/*     */     {
/*     */       try
/*     */       {
/* 432 */         varList = this.buddyStorage.getOfflineVariables(ownerName);
/*     */ 
/* 435 */         if (varList != null)
/* 436 */           this.offlineVarsCache.addVariables(ownerName, varList);
/*     */       }
/*     */       catch (IOException e)
/*     */       {
/* 440 */         this.log.info("Unexpected I/O error while accessing offline variables for buddy: " + ownerName + ", " + this.zone);
/*     */       }
/*     */     }
/*     */ 
/* 444 */     return varList;
/*     */   }
/*     */ 
/*     */   public void setActive(boolean value)
/*     */   {
/* 450 */     this.active = value;
/*     */   }
/*     */ 
/*     */   public void setBuddyListMaxSize(int maxSize)
/*     */   {
/* 457 */     if (maxSize < 1) {
/* 458 */       maxSize = 1;
/*     */     }
/* 460 */     this.maxListSize = maxSize;
/*     */   }
/*     */ 
/*     */   public void setMaxBuddyVariables(int maxVariables)
/*     */   {
/* 467 */     if (maxVariables < 0) {
/* 468 */       maxVariables = 0;
/*     */     }
/* 470 */     this.maxVariables = maxVariables;
/*     */   }
/*     */ 
/*     */   public int getOfflineBuddyVariablesCacheSize()
/*     */   {
/* 479 */     return this.offlineVarsCache.getSize();
/*     */   }
/*     */ 
/*     */   public void setOfflineBuddyVariablesCacheSize(int size)
/*     */   {
/* 485 */     this.offlineVarsCache.setSize(size);
/*     */   }
/*     */ 
/*     */   public void setStorageHandler(BuddyStorage buddyStorage)
/*     */   {
/* 491 */     if (this.buddyStorage != null) {
/* 492 */       throw new IllegalStateException("A Storage Buddy already exists: " + this.buddyStorage);
/*     */     }
/* 494 */     this.buddyStorage = buddyStorage;
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/* 500 */     return this.serviceName;
/*     */   }
/*     */ 
/*     */   public void handleMessage(Object arg0)
/*     */   {
/* 506 */     throw new UnsupportedOperationException("Method not available");
/*     */   }
/*     */ 
/*     */   public void setName(String arg0)
/*     */   {
/* 512 */     throw new UnsupportedOperationException("Method not available");
/*     */   }
/*     */ 
/*     */   public boolean getUseTempBuddies()
/*     */   {
/* 521 */     return this.useTempBuddies;
/*     */   }
/*     */ 
/*     */   public void setUseTempBuddies(boolean value)
/*     */   {
/* 527 */     this.useTempBuddies = value;
/*     */   }
/*     */ 
/*     */   public List<ISession> getClientsWatchingBuddy(String buddyName)
/*     */   {
/* 538 */     return getClientsWatchingBuddy(buddyName, false);
/*     */   }
/*     */ 
/*     */   public List<ISession> getClientsWatchingBuddy(String buddyName, boolean onlineUsersOnly)
/*     */   {
/* 545 */     List theClients = new ArrayList();
/*     */ 
/* 547 */     for (BuddyList bList : this.buddyLists.values())
/*     */     {
/* 549 */       Buddy buddy = bList.getBuddy(buddyName);
/*     */ 
/* 554 */       if (buddy == null)
/*     */         continue;
/* 556 */       User owner = bList.getOwner();
/*     */ 
/* 558 */       if (owner == null)
/*     */         continue;
/* 560 */       boolean addUserToList = (!onlineUsersOnly) || (owner.getBuddyProperties().isOnline());
/*     */ 
/* 562 */       if (addUserToList) {
/* 563 */         theClients.add(owner.getSession());
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 568 */     return theClients;
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
/*  64 */       User user = (User)event.getParameter(SFSEventParam.USER);
/*     */ 
/*  66 */       if ((user != null) && (SFSBuddyListManager.this.isActive()))
/*     */       {
/*  68 */         String userName = user.getName();
/*     */         try
/*     */         {
/*  73 */           SFSBuddyListManager.this.saveBuddyList(userName);
/*     */ 
/*  76 */           SFSBuddyListManager.this.buddyApi.getResponseAPI().notifyBuddyOnlineStateChange(user, BuddyOnlineState.LEFT_THE_SERVER, true);
/*     */ 
/*  81 */           SFSBuddyListManager.this.buddyLists.remove(userName);
/*     */         }
/*     */         catch (IOException e)
/*     */         {
/*  86 */           SFSBuddyListManager.this.log.warn("Failed saving buddy list for User on exit: " + user + ", Error: " + e);
/*     */         }
/*     */       }
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.SFSBuddyListManager
 * JD-Core Version:    0.6.0
 */