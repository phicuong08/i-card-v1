/*    */ package com.smartfoxserver.v2.util.filters;
/*    */ 
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.Zone;
/*    */ import com.smartfoxserver.v2.entities.managers.IBannedUserManager;
/*    */ import com.smartfoxserver.v2.util.IWordFilter;
/*    */ import com.smartfoxserver.v2.util.UsersUtil;
/*    */ 
/*    */ public class SFSWordFilterLogic
/*    */   implements IWordFilterLogic
/*    */ {
/*    */   private static final String BANNING_REASON = "Swearing";
/*    */   private final IBannedUserManager bannedUserManger;
/*    */   private final IWordFilter wordFilter;
/*    */ 
/*    */   public SFSWordFilterLogic(IBannedUserManager manager, IWordFilter filter)
/*    */   {
/* 17 */     this.bannedUserManger = manager;
/* 18 */     this.wordFilter = filter;
/*    */   }
/*    */ 
/*    */   public IBannedUserManager getBannedUserManger()
/*    */   {
/* 23 */     return this.bannedUserManger;
/*    */   }
/*    */ 
/*    */   public IWordFilter getWordFilter()
/*    */   {
/* 28 */     return this.wordFilter;
/*    */   }
/*    */ 
/*    */   public void setBannedUserManager(IBannedUserManager manager)
/*    */   {
/* 34 */     throw new UnsupportedOperationException();
/*    */   }
/*    */ 
/*    */   public void setWordFilter(IWordFilter filter)
/*    */   {
/* 40 */     throw new UnsupportedOperationException();
/*    */   }
/*    */ 
/*    */   public void kickUser(User user)
/*    */   {
/* 46 */     int kickCount = this.bannedUserManger.getKickCount(user.getName(), user.getZone().getName(), this.wordFilter.getBanDurationMinutes() * 60);
/* 47 */     kickCount++;
/*    */ 
/* 50 */     if (kickCount > this.wordFilter.getKicksBeforeBan())
/*    */     {
/* 52 */       this.bannedUserManger.banUser(
/* 54 */         user, 
/* 55 */         UsersUtil.getServerModerator(), 
/* 56 */         this.wordFilter.getBanDurationMinutes(), 
/* 57 */         this.wordFilter.getBanMode(), 
/* 58 */         "Swearing", 
/* 59 */         this.wordFilter.getBanMessage(), 
/* 60 */         this.wordFilter.getSecondsBeforeBanOrKick());
/*    */     }
/*    */     else
/*    */     {
/* 67 */       this.bannedUserManger.kickUser(
/* 69 */         user, 
/* 70 */         UsersUtil.getServerModerator(), 
/* 71 */         this.wordFilter.getKickMessage(), 
/* 72 */         this.wordFilter.getSecondsBeforeBanOrKick());
/*    */     }
/*    */   }
/*    */ 
/*    */   public void warnUser(User user)
/*    */   {
/* 80 */     int warnings = user.getBadWordsWarnings() + 1;
/*    */ 
/* 83 */     if (warnings > this.wordFilter.getWarningsBeforeKick())
/*    */     {
/* 86 */       warnings = 0;
/*    */ 
/* 89 */       kickUser(user);
/*    */     }
/* 93 */     else if (this.wordFilter.isUseWarnings()) {
/* 94 */       this.bannedUserManger.sendWarningMessage(user, null, this.wordFilter.getWarningMessage());
/*    */     }
/*    */ 
/* 97 */     user.setBadWordsWarnings(warnings);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.filters.SFSWordFilterLogic
 * JD-Core Version:    0.6.0
 */