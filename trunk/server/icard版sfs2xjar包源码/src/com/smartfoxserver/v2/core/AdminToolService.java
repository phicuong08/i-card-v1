/*     */ package com.smartfoxserver.v2.core;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.service.IService;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.buddylist.SFSBuddyListManager;
/*     */ import com.smartfoxserver.v2.entities.SFSZone;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.managers.IExtensionManager;
/*     */ import com.smartfoxserver.v2.entities.managers.IZoneManager;
/*     */ import com.smartfoxserver.v2.extensions.ExtensionLevel;
/*     */ import com.smartfoxserver.v2.extensions.ExtensionReloadMode;
/*     */ import com.smartfoxserver.v2.extensions.ExtensionType;
/*     */ import com.smartfoxserver.v2.extensions.ISFSExtension;
/*     */ import com.smartfoxserver.v2.extensions.SFSExtension;
/*     */ import java.util.ArrayList;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public final class AdminToolService
/*     */   implements IService
/*     */ {
/*     */   public static final String ZONE_NAME = "--=={{{ AdminZone }}}==--";
/*     */   private static final String EXT_NAME = "Admin";
/*  25 */   private final String name = "AdminToolService";
/*     */   private final Logger log;
/*     */   private SmartFoxServer sfs;
/*     */   private IExtensionManager extensionManager;
/*     */   private IZoneManager zoneManager;
/*     */   private ISFSExtension adminExtension;
/*     */   private Zone adminZone;
/*  33 */   private volatile boolean inited = false;
/*     */ 
/*     */   public AdminToolService()
/*     */   {
/*  37 */     this.log = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ 
/*     */   public void init(Object param)
/*     */   {
/*  43 */     if (this.inited) {
/*  44 */       throw new IllegalStateException("AdminToolService was already initialized!");
/*     */     }
/*  46 */     this.sfs = SmartFoxServer.getInstance();
/*  47 */     this.extensionManager = this.sfs.getExtensionManager();
/*  48 */     this.zoneManager = this.sfs.getZoneManager();
/*     */ 
/*  50 */     initializeAdminZone();
/*  51 */     this.log.info("AdminTool Service started");
/*     */   }
/*     */ 
/*     */   public void destroy(Object arg0)
/*     */   {
/*  57 */     this.adminExtension.setActive(false);
/*  58 */     this.adminZone.setActive(false);
/*     */ 
/*  60 */     this.adminExtension = null;
/*  61 */     this.adminZone = null;
/*     */   }
/*     */ 
/*     */   public void handleMessage(Object message)
/*     */   {
/*  67 */     throw new UnsupportedOperationException("This operation is not supported.");
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/*  73 */     return "AdminToolService";
/*     */   }
/*     */ 
/*     */   public void setName(String arg0)
/*     */   {
/*     */   }
/*     */ 
/*     */   private void initializeAdminZone()
/*     */   {
/*  85 */     this.adminZone = new SFSZone("--=={{{ AdminZone }}}==--");
/*  86 */     this.adminZone.setActive(true);
/*  87 */     this.adminZone.setCustomLogin(true);
/*  88 */     this.adminZone.setForceLogout(true);
/*  89 */     this.adminZone.setFilterUserNames(false);
/*  90 */     this.adminZone.setFilterRoomNames(false);
/*  91 */     this.adminZone.setGuestUserAllowed(false);
/*  92 */     this.adminZone.setMaxAllowedRooms(1);
/*  93 */     this.adminZone.setMaxAllowedUsers(1000);
/*  94 */     this.adminZone.setMaxUserVariablesAllowed(2);
/*  95 */     this.adminZone.setMaxRoomVariablesAllowed(0);
/*  96 */     this.adminZone.setMinRoomNameChars(0);
/*  97 */     this.adminZone.setMaxRoomNameChars(10);
/*  98 */     this.adminZone.setUserReconnectionSeconds(0);
/*  99 */     this.adminZone.setBuddyListManager(new SFSBuddyListManager(this.adminZone, false));
/* 100 */     this.adminZone.setFilterUserNames(false);
/* 101 */     this.adminZone.setFilterRoomNames(false);
/* 102 */     this.adminZone.setFilterPrivateMessages(false);
/*     */ 
/* 104 */     this.adminZone.setMaxUserIdleTime(999999999);
/* 105 */     this.adminZone.setDefaultGroups(new ArrayList());
/*     */     try
/*     */     {
/* 113 */       Class extClass = Class.forName("com.smartfoxserver.v2.admin.AdminExtension");
/*     */ 
/* 115 */       this.adminExtension = ((SFSExtension)extClass.newInstance());
/* 116 */       this.adminExtension.setActive(true);
/* 117 */       this.adminExtension.setLevel(ExtensionLevel.ZONE);
/* 118 */       this.adminExtension.setName("Admin");
/* 119 */       this.adminExtension.setParentZone(this.adminZone);
/* 120 */       this.adminExtension.setReloadMode(ExtensionReloadMode.NONE);
/* 121 */       this.adminExtension.setType(ExtensionType.JAVA);
/*     */     }
/*     */     catch (ClassNotFoundException e)
/*     */     {
/* 126 */       e.printStackTrace();
/*     */     }
/*     */     catch (InstantiationException e)
/*     */     {
/* 130 */       e.printStackTrace();
/*     */     }
/*     */     catch (IllegalAccessException e)
/*     */     {
/* 134 */       e.printStackTrace();
/*     */     }
/*     */ 
/* 137 */     this.extensionManager.addExtension(this.adminExtension);
/* 138 */     this.zoneManager.addZone(this.adminZone);
/*     */ 
/* 140 */     this.adminExtension.init();
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.core.AdminToolService
 * JD-Core Version:    0.6.0
 */