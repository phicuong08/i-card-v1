/*    */ package com.smartfoxserver.v2.entities.managers;
/*    */ 
/*    */ import com.smartfoxserver.v2.entities.BannedUser;
/*    */ import java.io.Serializable;
/*    */ import java.util.Map;
/*    */ 
/*    */ public class BanUserData
/*    */   implements Serializable
/*    */ {
/*    */   private static final long serialVersionUID = -5727904595766376640L;
/*    */   private final Map<String, Map<String, BannedUser>> bannedUsersByNameAndZone;
/*    */   private final Map<String, BannedUser> bannedUsersByIp;
/*    */ 
/*    */   public BanUserData(Map<String, Map<String, BannedUser>> bannedUsersByNameAndZone, Map<String, BannedUser> bannedUsersByIp)
/*    */   {
/* 18 */     this.bannedUsersByNameAndZone = bannedUsersByNameAndZone;
/* 19 */     this.bannedUsersByIp = bannedUsersByIp;
/*    */   }
/*    */ 
/*    */   public Map<String, Map<String, BannedUser>> getBannedUsersByNameAndZone()
/*    */   {
/* 24 */     return this.bannedUsersByNameAndZone;
/*    */   }
/*    */ 
/*    */   public Map<String, BannedUser> getBannedUsersByIp()
/*    */   {
/* 29 */     return this.bannedUsersByIp;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.BanUserData
 * JD-Core Version:    0.6.0
 */