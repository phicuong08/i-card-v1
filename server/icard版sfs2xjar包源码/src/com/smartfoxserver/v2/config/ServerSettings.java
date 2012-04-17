/*     */ package com.smartfoxserver.v2.config;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import com.smartfoxserver.v2.util.IAdminHelper;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ 
/*     */ public class ServerSettings
/*     */ {
/*     */   public transient IAdminHelper adminHelper;
/*  15 */   public volatile List<SocketAddress> socketAddresses = new ArrayList();
/*     */ 
/*  17 */   public volatile IpFilterSettings ipFilter = new IpFilterSettings();
/*  18 */   public volatile FlashCrossDomainPolicySettings flashCrossdomainPolicy = new FlashCrossDomainPolicySettings();
/*     */ 
/*  20 */   public volatile int systemControllerThreadPoolSize = 1;
/*  21 */   public volatile int extensionControllerThreadPoolSize = 1;
/*  22 */   public volatile int systemControllerRequestQueueSize = 10000;
/*  23 */   public volatile int extensionControllerRequestQueueSize = 10000;
/*  24 */   public volatile int schedulerThreadPoolSize = 1;
/*  25 */   public volatile int protocolCompressionThreshold = 300;
/*     */   public String protocolMode;
/*  29 */   public boolean useBinaryProtocol = true;
/*     */ 
/*  32 */   public RemoteAdminSettings remoteAdmin = new RemoteAdminSettings();
/*  33 */   public BannedUserManagerSettings bannedUserManager = new BannedUserManagerSettings();
/*     */ 
/*  35 */   public MailerSettings mailer = new MailerSettings();
/*  36 */   public WebServerSettings webServer = new WebServerSettings();
/*     */ 
/*  38 */   public volatile boolean startExtensionFileMonitor = false;
/*  39 */   public volatile boolean useDebugMode = false;
/*  40 */   public volatile boolean extensionRemoteDebug = true;
/*  41 */   public volatile boolean useFriendlyExceptions = true;
/*     */   public int sessionMaxIdleTime;
/*     */   public int userMaxIdleTime;
/*  44 */   public String licenseCode = "";
/*  45 */   public String licenseEmails = "";
/*     */ 
/*     */   public ISFSObject toSFSObject()
/*     */   {
/* 124 */     ISFSObject sfsObj = SFSObject.newInstance();
/*     */ 
/* 126 */     return sfsObj;
/*     */   }
/*     */ 
/*     */   public static ServerSettings fromSFSObject(ISFSObject sfsObj)
/*     */   {
/* 131 */     ServerSettings settings = new ServerSettings();
/*     */ 
/* 133 */     return settings;
/*     */   }
/*     */ 
/*     */   public static final class AdminUser
/*     */   {
/*     */     public volatile String login;
/*     */     public volatile String password;
/*     */   }
/*     */ 
/*     */   public static final class BannedUserManagerSettings
/*     */   {
/* 115 */     public boolean isAutoRemove = true;
/* 116 */     public boolean isPersistent = true;
/* 117 */     public String customPersistenceClass = null;
/*     */   }
/*     */ 
/*     */   public static final class FlashCrossDomainPolicySettings
/*     */   {
/*  68 */     public volatile boolean useMasterSocketPolicy = false;
/*  69 */     public volatile String policyXmlFile = "crossdomain.xml";
/*     */   }
/*     */ 
/*     */   public static final class IpFilterSettings
/*     */   {
/*  61 */     public List<String> addressBlackList = new ArrayList();
/*  62 */     public List<String> addressWhiteList = new ArrayList();
/*  63 */     public volatile int maxConnectionsPerAddress = 5;
/*     */   }
/*     */ 
/*     */   public static final class MailerSettings
/*     */   {
/* 105 */     public volatile boolean isActive = true;
/* 106 */     public volatile String mailHost = "";
/* 107 */     public volatile String mailUser = "";
/* 108 */     public volatile String mailPass = "";
/* 109 */     public volatile int smtpPort = 25;
/* 110 */     public volatile int workerThreads = 1;
/*     */   }
/*     */ 
/*     */   public static final class RemoteAdminSettings
/*     */   {
/*  90 */     public List<ServerSettings.AdminUser> administrators = new ArrayList();
/*  91 */     public List<String> allowedRemoteAddresses = new ArrayList();
/*  92 */     public int adminTcpPort = 9933;
/*     */   }
/*     */ 
/*     */   public static final class SocketAddress
/*     */   {
/*     */     public static final String TYPE_UDP = "UDP";
/*     */     public static final String TYPE_TCP = "TCP";
/*  54 */     public volatile String address = "127.0.0.1";
/*  55 */     public volatile int port = 9339;
/*  56 */     public volatile String type = "TCP";
/*     */   }
/*     */ 
/*     */   public static final class WebServerSettings
/*     */   {
/*  97 */     public volatile boolean isActive = true;
/*  98 */     public volatile String cfgFile = "jetty/cfg/jetty.xml";
/*  99 */     public volatile int blueBoxPollingTimeout = 26;
/* 100 */     public volatile int blueBoxMsgQueueSize = 40;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.config.ServerSettings
 * JD-Core Version:    0.6.0
 */