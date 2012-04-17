/*    */ package com.smartfoxserver.v2.util;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*    */ import com.smartfoxserver.bitswarm.sessions.Session;
/*    */ import com.smartfoxserver.bitswarm.sessions.SessionType;
/*    */ import com.smartfoxserver.v2.entities.Room;
/*    */ import com.smartfoxserver.v2.entities.SFSUser;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ 
/*    */ public class UsersUtil
/*    */ {
/*    */   private static User fakeAdminUser;
/*    */   private static User fakeModUser;
/* 20 */   private static volatile boolean isInited = false;
/*    */ 
/*    */   public static boolean usersSeeEachOthers(User sender, User recipient)
/*    */   {
/* 24 */     boolean seeEachOthers = false;
/*    */ 
/* 26 */     for (Room room : recipient.getJoinedRooms())
/*    */     {
/* 28 */       if (!room.containsUser(sender))
/*    */         continue;
/* 30 */       seeEachOthers = true;
/* 31 */       break;
/*    */     }
/*    */ 
/* 35 */     return seeEachOthers;
/*    */   }
/*    */ 
/*    */   public static User getServerAdmin()
/*    */   {
/* 40 */     if (!isInited) {
/* 41 */       initialize();
/*    */     }
/* 43 */     return fakeAdminUser;
/*    */   }
/*    */ 
/*    */   public static User getServerModerator()
/*    */   {
/* 48 */     if (!isInited) {
/* 49 */       initialize();
/*    */     }
/* 51 */     return fakeModUser;
/*    */   }
/*    */ 
/*    */   public static boolean isAllowedToPerformNewSearch(User user)
/*    */   {
/* 56 */     boolean ok = false;
/*    */ 
/* 58 */     Long lastSearchTime = (Long)user.getSession().getSystemProperty("LastSearchTime");
/*    */ 
/* 61 */     if (lastSearchTime == null) {
/* 62 */       ok = true;
/*    */     }
/* 68 */     else if (System.currentTimeMillis() - lastSearchTime.longValue() > 1000L) {
/* 69 */       ok = true;
/*    */     }
/*    */ 
/* 73 */     if (ok) {
/* 74 */       user.getSession().setSystemProperty("LastSearchTime", Long.valueOf(System.currentTimeMillis()));
/*    */     }
/* 76 */     return ok;
/*    */   }
/*    */ 
/*    */   private static synchronized void initialize()
/*    */   {
/* 81 */     ISession modSession = new Session();
/* 82 */     modSession.setType(SessionType.VOID);
/*    */ 
/* 84 */     fakeModUser = new SFSUser("{Server.Mod}", modSession);
/*    */ 
/* 86 */     ISession dmnSession = new Session();
/* 87 */     dmnSession.setType(SessionType.VOID);
/*    */ 
/* 89 */     fakeAdminUser = new SFSUser("{Server.Admin}", dmnSession);
/*    */ 
/* 91 */     isInited = true;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.UsersUtil
 * JD-Core Version:    0.6.0
 */