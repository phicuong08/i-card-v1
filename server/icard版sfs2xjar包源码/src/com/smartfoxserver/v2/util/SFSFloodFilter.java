/*     */ package com.smartfoxserver.v2.util;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.core.BaseCoreService;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.managers.BanMode;
/*     */ import com.smartfoxserver.v2.entities.managers.IBannedUserManager;
/*     */ import com.smartfoxserver.v2.exceptions.SFSFloodingException;
/*     */ import com.smartfoxserver.v2.util.filters.RequestMonitor;
/*     */ import java.util.HashMap;
/*     */ import java.util.Map;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSFloodFilter extends BaseCoreService
/*     */   implements IFloodFilter
/*     */ {
/*     */   private final Map<SystemRequest, Integer> requestTable;
/*     */   private final IBannedUserManager banUserManager;
/*     */   private final Logger log;
/*  25 */   private volatile int banDurationMinutes = 60;
/*  26 */   private volatile int maxFloodingAttempts = 5;
/*  27 */   private volatile int secondsBeforeBan = 5;
/*  28 */   private volatile boolean logFloodingAttempts = false;
/*     */ 
/*  30 */   private BanMode banMode = BanMode.BY_NAME;
/*  31 */   private String banMessage = "You are being banned, too many flooding attempts.";
/*     */ 
/*     */   public SFSFloodFilter(IBannedUserManager manager)
/*     */   {
/*  35 */     super.setName(getClass().getName());
/*  36 */     this.log = LoggerFactory.getLogger(getClass().getName());
/*  37 */     this.banUserManager = manager;
/*     */ 
/*  39 */     this.requestTable = new ConcurrentHashMap();
/*     */ 
/*  42 */     this.requestTable.put(SystemRequest.PublicMessage, Integer.valueOf(50));
/*     */   }
/*     */ 
/*     */   public void filterRequest(SystemRequest reqType, User user)
/*     */     throws SFSFloodingException
/*     */   {
/*  48 */     if (!this.active) {
/*  49 */       return;
/*     */     }
/*  51 */     RequestMonitor monitor = (RequestMonitor)user.getSession().getSystemProperty("FloodFilterRequestTable");
/*     */ 
/*  61 */     if (monitor == null)
/*     */     {
/*  63 */       monitor = new RequestMonitor();
/*  64 */       user.getSession().setSystemProperty("FloodFilterRequestTable", monitor);
/*     */     }
/*     */ 
/*  68 */     Integer maxReqsPerSecond = (Integer)this.requestTable.get(reqType);
/*     */ 
/*  71 */     if (maxReqsPerSecond == null) {
/*  72 */       return;
/*     */     }
/*     */ 
/*  75 */     int userReqsPerSecond = monitor.updateRequest(reqType);
/*     */ 
/*  77 */     if (userReqsPerSecond >= maxReqsPerSecond.intValue())
/*     */     {
/*  79 */       boolean isFirstOccurrence = maxReqsPerSecond.intValue() - userReqsPerSecond == -1;
/*     */ 
/*  89 */       if (isFirstOccurrence)
/*     */       {
/*  91 */         int currentFloodWarns = user.getFloodWarnings() + 1;
/*  92 */         user.setFloodWarnings(currentFloodWarns);
/*     */ 
/*  94 */         if (this.logFloodingAttempts)
/*     */         {
/*  96 */           this.log.warn(
/*  98 */             String.format(
/* 100 */             "Flooding: %s , Request: %s, User warns: %s", new Object[] { 
/* 101 */             user, 
/* 102 */             reqType, 
/* 103 */             Integer.valueOf(currentFloodWarns) }));
/*     */         }
/*     */ 
/* 109 */         if (currentFloodWarns >= this.maxFloodingAttempts)
/*     */         {
/* 111 */           this.banUserManager.banUser(
/* 113 */             user, 
/* 114 */             UsersUtil.getServerModerator(), 
/* 115 */             this.banDurationMinutes, 
/* 116 */             this.banMode, 
/* 117 */             "flooding", 
/* 118 */             this.banMessage, 
/* 119 */             this.secondsBeforeBan);
/*     */         }
/*     */ 
/*     */       }
/*     */ 
/* 126 */       throw new SFSFloodingException();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void setActive(boolean flag)
/*     */   {
/* 133 */     this.active = flag;
/*     */   }
/*     */ 
/*     */   public void addRequestFilter(SystemRequest request, int reqPerSecond)
/*     */   {
/* 139 */     this.requestTable.put(request, Integer.valueOf(reqPerSecond));
/*     */   }
/*     */ 
/*     */   public Map<SystemRequest, Integer> getRequestTable()
/*     */   {
/* 146 */     return new HashMap(this.requestTable);
/*     */   }
/*     */ 
/*     */   public void clearAllFilters()
/*     */   {
/* 152 */     this.requestTable.clear();
/*     */   }
/*     */ 
/*     */   public boolean isRequestFiltered(SystemRequest request)
/*     */   {
/* 158 */     return this.requestTable.containsKey(request);
/*     */   }
/*     */ 
/*     */   public int getBanDurationMinutes()
/*     */   {
/* 164 */     return this.banDurationMinutes;
/*     */   }
/*     */ 
/*     */   public void setBanDurationMinutes(int banDurationMinutes)
/*     */   {
/* 170 */     this.banDurationMinutes = banDurationMinutes;
/*     */   }
/*     */ 
/*     */   public int getMaxFloodingAttempts()
/*     */   {
/* 176 */     return this.maxFloodingAttempts;
/*     */   }
/*     */ 
/*     */   public void setMaxFloodingAttempts(int maxFloodingAttempts)
/*     */   {
/* 182 */     this.maxFloodingAttempts = maxFloodingAttempts;
/*     */   }
/*     */ 
/*     */   public int getSecondsBeforeBan()
/*     */   {
/* 188 */     return this.secondsBeforeBan;
/*     */   }
/*     */ 
/*     */   public void setSecondsBeforeBan(int secondsBeforeBan)
/*     */   {
/* 194 */     this.secondsBeforeBan = secondsBeforeBan;
/*     */   }
/*     */ 
/*     */   public boolean isLogFloodingAttempts()
/*     */   {
/* 200 */     return this.logFloodingAttempts;
/*     */   }
/*     */ 
/*     */   public void setLogFloodingAttempts(boolean logFloodingAttempts)
/*     */   {
/* 206 */     this.logFloodingAttempts = logFloodingAttempts;
/*     */   }
/*     */ 
/*     */   public BanMode getBanMode()
/*     */   {
/* 212 */     return this.banMode;
/*     */   }
/*     */ 
/*     */   public void setBanMode(BanMode banMode)
/*     */   {
/* 218 */     this.banMode = banMode;
/*     */   }
/*     */ 
/*     */   public String getBanMessage()
/*     */   {
/* 224 */     return this.banMessage;
/*     */   }
/*     */ 
/*     */   public void setBanMessage(String banMessage)
/*     */   {
/* 230 */     this.banMessage = banMessage;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.SFSFloodFilter
 * JD-Core Version:    0.6.0
 */