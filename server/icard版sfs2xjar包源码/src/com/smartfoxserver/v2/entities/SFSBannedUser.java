/*     */ package com.smartfoxserver.v2.entities;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*     */ import com.smartfoxserver.v2.entities.managers.BanMode;
/*     */ import java.io.Serializable;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSBannedUser
/*     */   implements BannedUser, Serializable
/*     */ {
/*     */   private static final long serialVersionUID = -8591228575994508738L;
/*     */   private final long banTimeMillis;
/*     */   private final int banDurationMinutes;
/*     */   private final long banDurationMillis;
/*     */   private final String name;
/*     */   private String ipAddress;
/*     */   private final BanMode mode;
/*     */   private final String reason;
/*     */   private final String zoneName;
/*     */   private final String adminName;
/*     */ 
/*     */   public SFSBannedUser(User user, int durationMinutes, BanMode mode, String reason, String adminName)
/*     */   {
/*  29 */     this(user.getName(), user.getZone().getName(), durationMinutes, mode, reason, adminName);
/*  30 */     this.ipAddress = user.getIpAddress();
/*     */   }
/*     */ 
/*     */   public SFSBannedUser(User user, int durationMinutes, BanMode mode)
/*     */   {
/*  35 */     this(user, durationMinutes, mode, null, null);
/*  36 */     this.ipAddress = user.getIpAddress();
/*     */   }
/*     */ 
/*     */   public SFSBannedUser(String userName, String zoneName, int durationMinutes, BanMode mode, String reason, String adminName)
/*     */   {
/*  41 */     this.banTimeMillis = System.currentTimeMillis();
/*     */ 
/*  48 */     if (durationMinutes < 1)
/*     */     {
/*  50 */       LoggerFactory.getLogger(getClass()).warn("Invalid ban duration: " + durationMinutes + ", Automatically converted to 24hrs.");
/*  51 */       durationMinutes = 1440;
/*     */     }
/*     */ 
/*  54 */     this.banDurationMinutes = durationMinutes;
/*  55 */     this.banDurationMillis = (this.banDurationMinutes * 60L * 1000L);
/*  56 */     this.name = userName;
/*  57 */     this.ipAddress = null;
/*  58 */     this.mode = mode;
/*  59 */     this.zoneName = zoneName;
/*  60 */     this.adminName = (adminName != null ? adminName : "[Server]");
/*  61 */     this.reason = (reason != null ? reason : "{Unknown}");
/*     */   }
/*     */ 
/*     */   public SFSBannedUser(String userName, String zoneName, int durationMinutes, BanMode mode)
/*     */   {
/*  66 */     this(userName, zoneName, durationMinutes, mode, null, null);
/*     */   }
/*     */ 
/*     */   public String getZoneName()
/*     */   {
/*  72 */     return this.zoneName;
/*     */   }
/*     */ 
/*     */   public long getBanTimeMillis()
/*     */   {
/*  78 */     return this.banTimeMillis;
/*     */   }
/*     */ 
/*     */   public String getIpAddress()
/*     */   {
/*  84 */     return this.ipAddress;
/*     */   }
/*     */ 
/*     */   public BanMode getMode()
/*     */   {
/*  90 */     return this.mode;
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/*  96 */     return this.name;
/*     */   }
/*     */ 
/*     */   public String getReason()
/*     */   {
/* 102 */     return this.reason;
/*     */   }
/*     */ 
/*     */   public String getAdminName()
/*     */   {
/* 108 */     return this.adminName;
/*     */   }
/*     */ 
/*     */   public int getBanDurationMinutes()
/*     */   {
/* 114 */     return this.banDurationMinutes;
/*     */   }
/*     */ 
/*     */   public boolean isExpired()
/*     */   {
/* 120 */     return System.currentTimeMillis() > this.banTimeMillis + this.banDurationMillis;
/*     */   }
/*     */ 
/*     */   public ISFSArray toSFSArray()
/*     */   {
/* 126 */     ISFSArray sfsa = new SFSArray();
/* 127 */     sfsa.addUtfString(this.name);
/* 128 */     sfsa.addUtfString(this.zoneName == null ? "" : this.zoneName);
/* 129 */     sfsa.addUtfString(this.mode.toString());
/* 130 */     sfsa.addUtfString(this.reason == null ? "" : this.reason);
/* 131 */     sfsa.addUtfString(this.adminName == null ? "" : this.adminName);
/* 132 */     sfsa.addUtfString(this.ipAddress == null ? "" : this.ipAddress);
/* 133 */     sfsa.addLong(this.banTimeMillis);
/* 134 */     sfsa.addLong(this.banDurationMillis);
/*     */ 
/* 136 */     return sfsa;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 142 */     return String.format("BannedUser [name: %s, ip: %s, mode: %s, reason: %s]", new Object[] { this.name, this.ipAddress, this.mode, this.reason });
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.SFSBannedUser
 * JD-Core Version:    0.6.0
 */