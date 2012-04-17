/*     */ package com.smartfoxserver.v2.entities.managers;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.bitswarm.util.scheduling.Task;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.core.BaseCoreService;
/*     */ import com.smartfoxserver.v2.entities.BannedUser;
/*     */ import com.smartfoxserver.v2.entities.SFSBannedUser;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import com.smartfoxserver.v2.util.ClientDisconnectionReason;
/*     */ import com.smartfoxserver.v2.util.IDisconnectionReason;
/*     */ import com.smartfoxserver.v2.util.IWordFilter;
/*     */ import com.smartfoxserver.v2.util.TaskScheduler;
/*     */ import com.smartfoxserver.v2.util.UsersUtil;
/*     */ import java.io.FileNotFoundException;
/*     */ import java.io.IOException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Arrays;
/*     */ import java.util.Collection;
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import java.util.Map.Entry;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import java.util.concurrent.TimeUnit;
/*     */ import org.mortbay.log.Log;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public final class SFSBannedUserManager extends BaseCoreService
/*     */   implements IBannedUserManager
/*     */ {
/* 218 */   private static String STORAGE_DEFAULT_CLASS = "com.smartfoxserver.v2.entities.managers.SFSBannedUserStorage";
/*     */   private static final int KICK_TIMER_CLEANER_TASK_INTERVAL = 12;
/*     */   private static final long KICK_TIMER_MAX_LENGTH = 86400000L;
/*     */   private static final int BAN_AUTOSAVE_INTERVAL = 1;
/*     */   private static final int BAN_EXPIRER_TASK_INTERVAL = 2;
/*     */   private final Map<String, Map<String, List<Long>>> kickHistoryByZone;
/*     */   private Map<String, Map<String, BannedUser>> bannedUsersByNameAndZone;
/*     */   private Map<String, BannedUser> bannedUsersByIp;
/*     */   private SmartFoxServer sfs;
/*     */   private final Runnable kickHistoryCleanerTask;
/*     */   private final Runnable banExpirerTask;
/*     */   private final Runnable banAutoSaverTask;
/*     */   private final Thread shutDownHandler;
/*     */   private final Logger logger;
/*     */   private boolean autoRemoveBan;
/*     */   private boolean persistent;
/*     */   private IBannedUserStorage storage;
/*     */ 
/*     */   public SFSBannedUserManager()
/*     */   {
/* 245 */     this.logger = LoggerFactory.getLogger(SFSBannedUserManager.class);
/*     */ 
/* 248 */     this.kickHistoryByZone = new ConcurrentHashMap();
/*     */ 
/* 250 */     this.kickHistoryCleanerTask = new KickHistoryCleanerTask(null);
/* 251 */     this.banExpirerTask = new BanExpirerTask(null);
/* 252 */     this.banAutoSaverTask = new BanDataAutoSaveTask(null);
/* 253 */     this.shutDownHandler = new ShutDownHandler(null);
/*     */ 
/* 255 */     this.autoRemoveBan = false;
/* 256 */     this.persistent = false;
/*     */   }
/*     */ 
/*     */   public void init(Object o)
/*     */   {
/* 262 */     super.init(o);
/*     */     try
/*     */     {
/* 271 */       Class clazz = Class.forName(STORAGE_DEFAULT_CLASS);
/* 272 */       this.storage = ((IBannedUserStorage)clazz.newInstance());
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 276 */       ExceptionMessageComposer composer = new ExceptionMessageComposer(e);
/* 277 */       composer.setDescription("the specified persistence class for the BannedUserManager cannot be found or instantiated");
/* 278 */       composer.setPossibleCauses("double check the fully qualified class name and make sure it implements the IBannedUserPersister interface.");
/*     */ 
/* 280 */       this.logger.error(composer.toString());
/*     */     }
/*     */ 
/* 284 */     this.storage.init();
/*     */     try
/*     */     {
/* 289 */       BanUserData storageData = this.storage.load();
/* 290 */       this.bannedUsersByIp = storageData.getBannedUsersByIp();
/* 291 */       this.bannedUsersByNameAndZone = storageData.getBannedUsersByNameAndZone();
/*     */ 
/* 293 */       this.logger.info("BanUser data loaded: " + getTotalRecords() + " records.");
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 298 */       this.bannedUsersByIp = new ConcurrentHashMap();
/* 299 */       this.bannedUsersByNameAndZone = new ConcurrentHashMap();
/*     */ 
/* 301 */       if ((e instanceof FileNotFoundException)) {
/* 302 */         this.logger.info("No BannedUser data available, starting with a clean DB.");
/*     */       }
/*     */       else {
/* 305 */         this.logger.warn("Failure loading the BannedUser DB: " + e);
/*     */       }
/*     */     }
/* 308 */     this.sfs = SmartFoxServer.getInstance();
/*     */ 
/* 313 */     this.sfs.getTaskScheduler().scheduleAtFixedRate(
/* 315 */       this.kickHistoryCleanerTask, 
/* 316 */       12, 
/* 317 */       12, 
/* 318 */       TimeUnit.HOURS);
/*     */ 
/* 324 */     this.sfs.getTaskScheduler().scheduleAtFixedRate(
/* 326 */       this.banExpirerTask, 
/* 327 */       2, 
/* 328 */       2, 
/* 329 */       TimeUnit.HOURS);
/*     */ 
/* 335 */     this.sfs.getTaskScheduler().scheduleAtFixedRate(
/* 337 */       this.banAutoSaverTask, 
/* 338 */       1, 
/* 339 */       1, 
/* 340 */       TimeUnit.HOURS);
/*     */ 
/* 344 */     Runtime.getRuntime().addShutdownHook(this.shutDownHandler);
/*     */   }
/*     */ 
/*     */   public void destroy(Object o)
/*     */   {
/* 350 */     super.destroy(o);
/* 351 */     this.storage.destroy();
/*     */   }
/*     */ 
/*     */   public void kickUser(User userToKick, User modUser, String kickMessage, int delaySeconds)
/*     */   {
/* 357 */     kickUser(userToKick, modUser, kickMessage, delaySeconds, false);
/*     */   }
/*     */ 
/*     */   public void kickUser(User userToKick, User modUser, String kickMessage, int delaySeconds, boolean isBan)
/*     */   {
/* 364 */     if (userToKick.isBeingKicked()) {
/* 365 */       return;
/*     */     }
/*     */ 
/* 368 */     userToKick.setBeingKicked(true);
/*     */ 
/* 370 */     IDisconnectionReason disconnectionReason = isBan ? ClientDisconnectionReason.BAN : ClientDisconnectionReason.KICK;
/*     */ 
/* 373 */     addUserToKickHistory(userToKick);
/*     */ 
/* 376 */     userToKick.setReconnectionSeconds(0);
/*     */ 
/* 379 */     if (delaySeconds <= 0)
/*     */     {
/* 381 */       userToKick.disconnect(disconnectionReason);
/* 382 */       return;
/*     */     }
/*     */ 
/* 386 */     if ((kickMessage == null) || (kickMessage.length() == 0)) {
/* 387 */       kickMessage = userToKick.getZone().getWordFilter().getKickMessage();
/*     */     }
/*     */ 
/* 390 */     modUser = modUser == null ? UsersUtil.getServerModerator() : modUser;
/*     */ 
/* 392 */     this.sfs.getAPIManager().getSFSApi().sendModeratorMessage(
/* 394 */       modUser, 
/* 395 */       kickMessage, 
/* 396 */       null, 
/* 397 */       Arrays.asList(new ISession[] { 
/* 397 */       userToKick.getSession() }));
/*     */ 
/* 401 */     Task kickTask = new Task("kickTask");
/* 402 */     kickTask.getParameters().put("user", userToKick);
/*     */ 
/* 405 */     this.sfs.getTaskScheduler().schedule(
/* 407 */       new KickTaskRunner(userToKick, disconnectionReason), 
/* 408 */       delaySeconds, 
/* 409 */       TimeUnit.SECONDS);
/*     */   }
/*     */ 
/*     */   public void banUser(User userToBan, User modUser, int durationMinutes, BanMode mode, String reason, String banMessage, int delaySeconds)
/*     */   {
/* 420 */     modUser = modUser == null ? UsersUtil.getServerModerator() : modUser;
/* 421 */     BannedUser bannedUser = new SFSBannedUser(userToBan, durationMinutes, mode, reason, modUser.getName());
/*     */ 
/* 424 */     addBannedUser(bannedUser);
/*     */ 
/* 427 */     if ((banMessage == null) || (banMessage.length() == 0)) {
/* 428 */       banMessage = userToBan.getZone().getWordFilter().getBanMessage();
/*     */     }
/*     */ 
/* 431 */     kickUser(userToBan, modUser, banMessage, delaySeconds, true);
/*     */ 
/* 433 */     String msg = String.format("User: %s is banned. Reason: %s", new Object[] { userToBan.getName(), reason });
/* 434 */     this.logger.info(msg);
/*     */   }
/*     */ 
/*     */   public void banUser(String userName, String zoneName, int durationMinutes, BanMode mode, String reason, String adminName)
/*     */   {
/* 443 */     BannedUser bannedUser = new SFSBannedUser(userName, zoneName, durationMinutes, mode, reason, adminName);
/* 444 */     addBannedUser(bannedUser);
/*     */   }
/*     */ 
/*     */   public void banUser(String userName, String zoneName, int durationMinutes, BanMode mode, String reason)
/*     */   {
/* 450 */     banUser(userName, zoneName, durationMinutes, mode, reason, null);
/*     */   }
/*     */ 
/*     */   private void addBannedUser(BannedUser banned)
/*     */   {
/* 455 */     String zoneName = banned.getZoneName();
/* 456 */     BanMode mode = banned.getMode();
/*     */ 
/* 458 */     String banKey = null;
/* 459 */     Map bannedUsersMap = null;
/*     */ 
/* 462 */     if (mode == BanMode.BY_ADDRESS)
/*     */     {
/* 464 */       banKey = banned.getIpAddress();
/* 465 */       bannedUsersMap = this.bannedUsersByIp;
/*     */     }
/*     */     else
/*     */     {
/* 471 */       banKey = banned.getName();
/* 472 */       Map bannedUsersByName = null;
/*     */ 
/* 477 */       synchronized (this)
/*     */       {
/* 479 */         bannedUsersByName = (Map)this.bannedUsersByNameAndZone.get(zoneName);
/*     */ 
/* 481 */         if (bannedUsersByName == null)
/*     */         {
/* 483 */           bannedUsersByName = new ConcurrentHashMap();
/* 484 */           this.bannedUsersByNameAndZone.put(zoneName, bannedUsersByName);
/*     */         }
/*     */       }
/*     */ 
/* 488 */       bannedUsersMap = bannedUsersByName;
/*     */     }
/*     */ 
/* 492 */     bannedUsersMap.put(banKey, banned);
/*     */   }
/*     */ 
/*     */   public int getKickCount(String name, String zoneName, int rangeInSeconds)
/*     */   {
/* 506 */     int kickCount = 0;
/* 507 */     long timeRangeMillis = rangeInSeconds * 1000;
/* 508 */     long rangeCheck = System.currentTimeMillis() - timeRangeMillis;
/*     */ 
/* 510 */     Map kickHistory = (Map)this.kickHistoryByZone.get(zoneName);
/*     */ 
/* 512 */     if (kickHistory != null)
/*     */     {
/* 514 */       List kickTimeList = (List)kickHistory.get(name);
/*     */ 
/* 516 */       if ((kickTimeList != null) && (kickTimeList.size() > 0))
/*     */       {
/* 518 */         for (Iterator localIterator = kickTimeList.iterator(); localIterator.hasNext(); ) { long kickTime = ((Long)localIterator.next()).longValue();
/*     */ 
/* 520 */           if (kickTime > rangeCheck) {
/* 521 */             kickCount++;
/*     */           }
/*     */         }
/*     */       }
/*     */     }
/* 526 */     return kickCount;
/*     */   }
/*     */ 
/*     */   public boolean isIpBanned(String ipAddress)
/*     */   {
/* 532 */     boolean isBanned = false;
/* 533 */     BannedUser bUser = (BannedUser)this.bannedUsersByIp.get(ipAddress);
/*     */ 
/* 535 */     if ((bUser != null) && (!bUser.isExpired())) {
/* 536 */       isBanned = true;
/*     */     }
/* 538 */     return isBanned;
/*     */   }
/*     */ 
/*     */   public boolean isNameBanned(String userName, String zoneName)
/*     */   {
/* 544 */     Map bannedUsersByName = (Map)this.bannedUsersByNameAndZone.get(zoneName);
/* 545 */     boolean isBanned = false;
/*     */ 
/* 547 */     if (bannedUsersByName != null)
/*     */     {
/* 549 */       BannedUser bUser = (BannedUser)bannedUsersByName.get(userName);
/*     */ 
/* 551 */       if ((bUser != null) && (!bUser.isExpired())) {
/* 552 */         isBanned = true;
/*     */       }
/*     */     }
/* 555 */     return isBanned;
/*     */   }
/*     */ 
/*     */   public void removeBannedUser(String id, String zoneName, BanMode mode)
/*     */   {
/* 564 */     if (mode == BanMode.BY_ADDRESS) {
/* 565 */       this.bannedUsersByIp.remove(id);
/*     */     }
/*     */     else
/*     */     {
/* 569 */       Map bannedUsersByName = (Map)this.bannedUsersByNameAndZone.get(zoneName);
/*     */ 
/* 571 */       if (bannedUsersByName != null)
/* 572 */         bannedUsersByName.remove(id);
/*     */     }
/*     */   }
/*     */ 
/*     */   public List<BannedUser> getBannedUsersByIp()
/*     */   {
/* 579 */     return new ArrayList(this.bannedUsersByIp.values());
/*     */   }
/*     */ 
/*     */   public List<BannedUser> getBannedUsersByName(String zoneName)
/*     */   {
/* 585 */     Map bannedUsersByName = (Map)this.bannedUsersByNameAndZone.get(zoneName);
/* 586 */     List theList = new ArrayList();
/*     */ 
/* 588 */     if (bannedUsersByName != null) {
/* 589 */       theList.addAll(bannedUsersByName.values());
/*     */     }
/* 591 */     return theList;
/*     */   }
/*     */ 
/*     */   public boolean isAutoRemoveBan()
/*     */   {
/* 598 */     return this.autoRemoveBan;
/*     */   }
/*     */ 
/*     */   public boolean isPersistent()
/*     */   {
/* 604 */     return this.persistent;
/*     */   }
/*     */ 
/*     */   public void setAutoRemoveBan(boolean flag)
/*     */   {
/* 610 */     this.autoRemoveBan = flag;
/*     */   }
/*     */ 
/*     */   public void setPersistent(boolean flag)
/*     */   {
/* 616 */     this.persistent = flag;
/*     */   }
/*     */ 
/*     */   public void setPersistenceClass(String className)
/*     */   {
/* 622 */     if (this.active) {
/* 623 */       throw new SFSRuntimeException("Cannot change the BannedUserManager persistence class at runtime! Please change it in the configuration and restart the server.");
/*     */     }
/* 625 */     if ((className != null) && (className.length() > 0))
/* 626 */       STORAGE_DEFAULT_CLASS = className;
/*     */   }
/*     */ 
/*     */   public void sendWarningMessage(User recipient, User senderMod, String message)
/*     */   {
/* 632 */     if (senderMod == null) {
/* 633 */       senderMod = UsersUtil.getServerModerator();
/*     */     }
/* 635 */     this.sfs.getAPIManager().getSFSApi().sendModeratorMessage(
/* 637 */       senderMod, 
/* 638 */       message, 
/* 639 */       null, 
/* 640 */       Arrays.asList(new ISession[] { 
/* 640 */       recipient.getSession() }));
/*     */   }
/*     */ 
/*     */   private void addUserToKickHistory(User user)
/*     */   {
/* 649 */     String zoneName = user.getZone().getName();
/* 650 */     Map kickHistory = (Map)this.kickHistoryByZone.get(zoneName);
/*     */ 
/* 656 */     if (kickHistory == null)
/*     */     {
/* 658 */       kickHistory = new ConcurrentHashMap();
/* 659 */       this.kickHistoryByZone.put(zoneName, kickHistory);
/*     */     }
/*     */ 
/* 662 */     List kickTimeList = (List)kickHistory.get(user.getName());
/*     */ 
/* 665 */     if (kickTimeList == null)
/*     */     {
/* 667 */       kickTimeList = new ArrayList();
/* 668 */       kickHistory.put(user.getName(), kickTimeList);
/*     */     }
/*     */ 
/* 672 */     synchronized (kickTimeList)
/*     */     {
/* 674 */       kickTimeList.add(Long.valueOf(System.currentTimeMillis()));
/*     */     }
/*     */   }
/*     */ 
/*     */   private int getTotalRecords()
/*     */   {
/* 680 */     int tot = this.bannedUsersByIp.size();
/*     */ 
/* 682 */     for (Map map : this.bannedUsersByNameAndZone.values())
/*     */     {
/* 684 */       tot += map.size();
/*     */     }
/*     */ 
/* 687 */     return tot;
/*     */   }
/*     */ 
/*     */   private final class BanDataAutoSaveTask
/*     */     implements Runnable
/*     */   {
/*     */     private BanDataAutoSaveTask()
/*     */     {
/*     */     }
/*     */ 
/*     */     public void run()
/*     */     {
/*     */       try
/*     */       {
/* 161 */         long t1 = System.currentTimeMillis();
/* 162 */         SFSBannedUserManager.this.storage.save(new BanUserData(SFSBannedUserManager.this.bannedUsersByNameAndZone, SFSBannedUserManager.this.bannedUsersByIp));
/*     */ 
/* 164 */         if (SFSBannedUserManager.this.logger.isDebugEnabled())
/* 165 */           SFSBannedUserManager.this.logger.debug("Ban User data autosave done in " + (System.currentTimeMillis() - t1) + "ms.");
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/* 169 */         Log.warn("Banned User Data auto-save failed: " + e);
/*     */       }
/*     */     }
/*     */   }
/*     */ 
/*     */   private final class BanExpirerTask
/*     */     implements Runnable
/*     */   {
/*     */     private BanExpirerTask()
/*     */     {
/*     */     }
/*     */ 
/*     */     public void run()
/*     */     {
/*     */       try
/*     */       {
/*  96 */         if (SFSBannedUserManager.this.logger.isDebugEnabled()) {
/*  97 */           SFSBannedUserManager.this.logger.debug("BanExpirer running");
/*     */         }
/*     */ 
/* 100 */         cleanExpiredBanByIP();
/* 101 */         cleanExpiredBanByName();
/*     */       }
/*     */       catch (Exception err)
/*     */       {
/* 105 */         Log.warn("Problem in BanExpirer iteration: " + err);
/*     */       }
/*     */     }
/*     */ 
/*     */     private void cleanExpiredBanByIP()
/*     */     {
/* 111 */       int removedItems = expirerLoop(SFSBannedUserManager.this.bannedUsersByIp);
/*     */ 
/* 113 */       if (removedItems > 0)
/* 114 */         SFSBannedUserManager.this.logger.debug("Removed " + removedItems + " expired banned users by IP");
/*     */     }
/*     */ 
/*     */     private void cleanExpiredBanByName()
/*     */     {
/* 119 */       int removedItems = 0;
/*     */ 
/* 121 */       for (Map bannedUsersByZone : SFSBannedUserManager.this.bannedUsersByNameAndZone.values())
/*     */       {
/* 123 */         removedItems += expirerLoop(bannedUsersByZone);
/*     */       }
/*     */ 
/* 126 */       if (removedItems > 0)
/* 127 */         SFSBannedUserManager.this.logger.debug("Removed " + removedItems + " expired banned users by name ");
/*     */     }
/*     */ 
/*     */     private int expirerLoop(Map<String, BannedUser> data)
/*     */     {
/* 132 */       int count = 0;
/*     */ 
/* 134 */       for (Map.Entry entry : data.entrySet())
/*     */       {
/* 136 */         BannedUser bUser = (BannedUser)entry.getValue();
/*     */ 
/* 139 */         if (!bUser.isExpired())
/*     */           continue;
/* 141 */         data.remove(entry.getKey());
/* 142 */         count++;
/*     */       }
/*     */ 
/* 146 */       return count;
/*     */     }
/*     */   }
/*     */ 
/*     */   private final class KickHistoryCleanerTask
/*     */     implements Runnable
/*     */   {
/*     */     private KickHistoryCleanerTask()
/*     */     {
/*     */     }
/*     */ 
/*     */     public void run()
/*     */     {
/*  40 */       if (SFSBannedUserManager.this.logger.isDebugEnabled()) {
/*  41 */         SFSBannedUserManager.this.logger.debug("KickCleanerTask running");
/*     */       }
/*     */ 
/*     */       try
/*     */       {
/*  47 */         long timeRange = System.currentTimeMillis() - 86400000L;
/*     */ 
/*  49 */         for (Iterator iterByZone = SFSBannedUserManager.this.kickHistoryByZone.values().iterator(); iterByZone.hasNext(); )
/*     */         {
/*  51 */           Map kickHistory = (Map)iterByZone.next();
/*     */ 
/*  53 */           for (Iterator iter = kickHistory.values().iterator(); iter.hasNext(); )
/*     */           {
/*  55 */             List kickTimeList = (List)iter.next();
/*     */ 
/*  57 */             if (kickTimeList.size() <= 0) {
/*     */               continue;
/*     */             }
/*  60 */             synchronized (kickTimeList)
/*     */             {
/*  62 */               for (Iterator iter2 = kickTimeList.iterator(); iter2.hasNext(); )
/*     */               {
/*  64 */                 long kickTime = ((Long)iter2.next()).longValue();
/*     */ 
/*  67 */                 if (kickTime < timeRange) {
/*  68 */                   iter2.remove();
/*     */                 }
/*     */               }
/*     */ 
/*  72 */               if (kickTimeList.size() == 0) {
/*  73 */                 iter.remove();
/*     */               }
/*     */             }
/*     */           }
/*     */         }
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/*  81 */         SFSBannedUserManager.this.logger.warn("Unexpected exception: " + e);
/*     */       }
/*     */     }
/*     */   }
/*     */ 
/*     */   static final class KickTaskRunner
/*     */     implements Runnable
/*     */   {
/*     */     private final User target;
/*     */     private final IDisconnectionReason reason;
/*     */ 
/*     */     public KickTaskRunner(User target, IDisconnectionReason reason)
/*     */     {
/* 206 */       this.target = target;
/* 207 */       this.reason = reason;
/*     */     }
/*     */ 
/*     */     public void run()
/*     */     {
/* 213 */       if (this.target != null)
/* 214 */         this.target.disconnect(this.reason);
/*     */     }
/*     */   }
/*     */ 
/*     */   private final class ShutDownHandler extends Thread
/*     */   {
/*     */     private ShutDownHandler()
/*     */     {
/*     */     }
/*     */ 
/*     */     public void run()
/*     */     {
/*     */       try
/*     */       {
/* 181 */         SFSBannedUserManager.this.storage.save(new BanUserData(SFSBannedUserManager.this.bannedUsersByNameAndZone, SFSBannedUserManager.this.bannedUsersByIp));
/* 182 */         SFSBannedUserManager.this.logger.info("BanUser data saved.");
/*     */       }
/*     */       catch (IOException e)
/*     */       {
/* 186 */         SFSBannedUserManager.this.logger.warn("Failed saving BanUserData on server quit: " + e);
/*     */       }
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.SFSBannedUserManager
 * JD-Core Version:    0.6.0
 */