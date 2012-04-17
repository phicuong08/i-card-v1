/*     */ package com.smartfoxserver.v2;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.clustering.IClusterManager;
/*     */ import com.smartfoxserver.bitswarm.config.ControllerConfig;
/*     */ import com.smartfoxserver.bitswarm.config.EngineConfiguration;
/*     */ import com.smartfoxserver.bitswarm.config.SocketConfig;
/*     */ import com.smartfoxserver.bitswarm.core.BitSwarmEngine;
/*     */ import com.smartfoxserver.bitswarm.core.ISocketAcceptor;
/*     */ import com.smartfoxserver.bitswarm.core.security.IConnectionFilter;
/*     */ import com.smartfoxserver.bitswarm.data.BindableSocket;
/*     */ import com.smartfoxserver.bitswarm.data.BufferType;
/*     */ import com.smartfoxserver.bitswarm.data.TransportType;
/*     */ import com.smartfoxserver.bitswarm.events.IEvent;
/*     */ import com.smartfoxserver.bitswarm.events.IEventListener;
/*     */ import com.smartfoxserver.bitswarm.service.IService;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISessionManager;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.config.CoreSettings;
/*     */ import com.smartfoxserver.v2.config.DefaultConstants;
/*     */ import com.smartfoxserver.v2.config.IConfigurator;
/*     */ import com.smartfoxserver.v2.config.SFSConfigurator;
/*     */ import com.smartfoxserver.v2.config.ServerSettings;
/*     */ import com.smartfoxserver.v2.config.ServerSettings.BannedUserManagerSettings;
/*     */ import com.smartfoxserver.v2.config.ServerSettings.FlashCrossDomainPolicySettings;
/*     */ import com.smartfoxserver.v2.config.ServerSettings.IpFilterSettings;
/*     */ import com.smartfoxserver.v2.config.ServerSettings.MailerSettings;
/*     */ import com.smartfoxserver.v2.config.ServerSettings.SocketAddress;
/*     */ import com.smartfoxserver.v2.config.ServerSettings.WebServerSettings;
/*     */ import com.smartfoxserver.v2.core.AdminToolService;
/*     */ import com.smartfoxserver.v2.core.ISFSEventManager;
/*     */ import com.smartfoxserver.v2.core.SFSEvent;
/*     */ import com.smartfoxserver.v2.core.SFSEventManager;
/*     */ import com.smartfoxserver.v2.core.SFSEventParam;
/*     */ import com.smartfoxserver.v2.core.SFSEventType;
/*     */ import com.smartfoxserver.v2.core.SFSShutdownHook;
/*     */ import com.smartfoxserver.v2.core.ServerState;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.invitation.InvitationManager;
/*     */ import com.smartfoxserver.v2.entities.invitation.SFSInvitationManager;
/*     */ import com.smartfoxserver.v2.entities.managers.IBannedUserManager;
/*     */ import com.smartfoxserver.v2.entities.managers.IExtensionManager;
/*     */ import com.smartfoxserver.v2.entities.managers.ILSManager;
/*     */ import com.smartfoxserver.v2.entities.managers.IMailerService;
/*     */ import com.smartfoxserver.v2.entities.managers.IStatsManager;
/*     */ import com.smartfoxserver.v2.entities.managers.IUserManager;
/*     */ import com.smartfoxserver.v2.entities.managers.IZoneManager;
/*     */ import com.smartfoxserver.v2.entities.managers.SFSBannedUserManager;
/*     */ import com.smartfoxserver.v2.entities.managers.SFSExtensionManager;
/*     */ import com.smartfoxserver.v2.entities.managers.SFSPostOffice;
/*     */ import com.smartfoxserver.v2.entities.managers.SFSStatsManager;
/*     */ import com.smartfoxserver.v2.entities.managers.SFSUserManager;
/*     */ import com.smartfoxserver.v2.entities.managers.SFSZoneManager;
/*     */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*     */ import com.smartfoxserver.v2.exceptions.SFSException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import com.smartfoxserver.v2.http.IHttpServer;
/*     */ import com.smartfoxserver.v2.http.SFSHttpServer;
/*     */ import com.smartfoxserver.v2.util.ClientDisconnectionReason;
/*     */ import com.smartfoxserver.v2.util.DebugConsole;
/*     */ import com.smartfoxserver.v2.util.FlashMasterSocketPolicyLoader;
/*     */ import com.smartfoxserver.v2.util.SFSRestart;
/*     */ import com.smartfoxserver.v2.util.ServerUptime;
/*     */ import com.smartfoxserver.v2.util.StringHelper;
/*     */ import com.smartfoxserver.v2.util.TaskScheduler;
/*     */ import com.smartfoxserver.v2.util.monitor.ITraceMonitor;
/*     */ import com.smartfoxserver.v2.util.monitor.TraceMessageMonitor;
/*     */ import gotoandplay.utils.defrag.DFResLoader;
/*     */ import java.io.FileInputStream;
/*     */ import java.io.FileNotFoundException;
/*     */ import java.io.IOException;
/*     */ import java.net.BindException;
/*     */ import java.nio.ByteBuffer;
/*     */ import java.util.HashMap;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import java.util.concurrent.atomic.AtomicInteger;
/*     */ import org.apache.log4j.PropertyConfigurator;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public final class SmartFoxServer
/*     */ {
/* 101 */   private final String version = "2.0.1";
/* 102 */   private static SmartFoxServer _instance = null;
/* 103 */   private static AtomicInteger restartCounter = new AtomicInteger(0);
/*     */   private final BitSwarmEngine bitSwarmEngine;
/*     */   private final Logger log;
/*     */   private APIManager apiManager;
/* 109 */   private volatile ServerState state = ServerState.STARTING;
/* 110 */   private volatile boolean initialized = false;
/* 111 */   private volatile boolean started = false;
/*     */   private volatile long serverStartTime;
/* 113 */   private volatile boolean isRebooting = false;
/* 114 */   private volatile boolean isHalting = false;
/*     */   private final IConfigurator sfsConfigurator;
/*     */   private IEventListener bitSwarmEventListener;
/*     */   private TaskScheduler taskScheduler;
/*     */   private IService adminToolService;
/*     */   private IMailerService mailService;
/*     */   private ITraceMonitor traceMonitor;
/* 123 */   private boolean clustered = false;
/*     */   private final ISFSEventManager eventManager;
/*     */   private IZoneManager zoneManager;
/*     */   private InvitationManager invitationManager;
/*     */   private ILSManager lsManager;
/*     */   private IStatsManager statsManager;
/*     */   private IUserManager userManager;
/*     */   private IExtensionManager extensionManager;
/*     */   private IBannedUserManager bannedUserManger;
/*     */   public IHttpServer httpServer;
/*     */   private DebugConsole debugConsole;
/*     */   private SFSException zoneInitError;
/*     */ 
/*     */   public static SmartFoxServer getInstance()
/*     */   {
/* 145 */     if (_instance == null) {
/* 146 */       _instance = new SmartFoxServer();
/*     */     }
/* 148 */     return _instance;
/*     */   }
/*     */ 
/*     */   private SmartFoxServer()
/*     */   {
/* 153 */     this.bitSwarmEngine = BitSwarmEngine.getInstance();
/* 154 */     this.sfsConfigurator = new SFSConfigurator();
/*     */ 
/* 156 */     this.log = LoggerFactory.getLogger(getClass());
/*     */ 
/* 158 */     this.bitSwarmEventListener = new BitSwarmEventListener();
/*     */ 
/* 160 */     this.eventManager = new SFSEventManager();
/* 161 */     this.zoneManager = new SFSZoneManager();
/*     */ 
/* 164 */     if (this.userManager == null) {
/* 165 */       this.userManager = new SFSUserManager();
/*     */     }
/* 167 */     this.extensionManager = new SFSExtensionManager();
/* 168 */     this.bannedUserManger = new SFSBannedUserManager();
/* 169 */     this.statsManager = new SFSStatsManager();
/*     */ 
/* 177 */     this.taskScheduler = new TaskScheduler(1);
/*     */   }
/*     */ 
/*     */   public String getVersion()
/*     */   {
/* 182 */     return "2.0.1";
/*     */   }
/*     */ 
/*     */   public void start()
/*     */   {
/* 191 */     if (!this.initialized) {
/* 192 */       initialize();
/*     */     }
/*     */ 
/*     */     try
/*     */     {
/* 197 */       this.sfsConfigurator.loadConfiguration();
/*     */       try
/*     */       {
/* 202 */         this.lsManager.execute("boot", null);
/* 203 */         this.lsManager.execute("dump", null);
/*     */       }
/*     */       catch (SFSException e)
/*     */       {
/* 207 */         this.log.warn(e.toString());
/*     */       }
/*     */ 
/* 211 */       configureServer();
/*     */ 
/* 214 */       configureBitSwarm();
/*     */ 
/* 217 */       this.traceMonitor = new TraceMessageMonitor();
/*     */       try
/*     */       {
/* 227 */         this.zoneManager.initializeZones();
/*     */       }
/*     */       catch (SFSException err)
/*     */       {
/* 231 */         this.zoneInitError = err;
/*     */       }
/*     */ 
/* 235 */       this.adminToolService = new AdminToolService();
/* 236 */       this.adminToolService.init(null);
/*     */ 
/* 239 */       if (this.sfsConfigurator.getServerSettings().webServer.isActive)
/*     */       {
/* 241 */         this.httpServer = new SFSHttpServer();
/* 242 */         this.httpServer.init(this.sfsConfigurator.getServerSettings().webServer.cfgFile);
/* 243 */         this.httpServer.start();
/*     */       }
/*     */ 
/* 247 */       if (this.sfsConfigurator.getServerSettings().mailer.isActive)
/*     */       {
/* 249 */         this.mailService = new SFSPostOffice();
/* 250 */         this.mailService.init(this.sfsConfigurator.getServerSettings().mailer);
/*     */       }
/*     */ 
/* 255 */       this.bitSwarmEngine.start("SmartFoxServer 2X");
/*     */     }
/*     */     catch (FileNotFoundException e)
/*     */     {
/* 262 */       ExceptionMessageComposer msg = new ExceptionMessageComposer(e);
/* 263 */       msg.setDescription("There has been a problem loading the server configuration. The server cannot start.");
/* 264 */       msg.setPossibleCauses("Make sure that core.xml and server.xml files exist in your config/ folder.");
/*     */ 
/* 266 */       this.log.error(msg.toString());
/*     */     }
/*     */     catch (BindException e)
/*     */     {
/* 271 */       ExceptionMessageComposer msg = new ExceptionMessageComposer(e);
/* 272 */       msg.setDescription("The specified TCP port cannot be bound to the configured IP address.");
/* 273 */       msg.setPossibleCauses("Probably you are running another instance of SFS2X. Please double check using the AdminTool.");
/* 274 */       msg.addInfo("Start a new browser page at http://<your-sfs-domain>/admin/");
/* 275 */       msg.addInfo("If the problem persists, email us the content of this error message to support[at]smartfoxserver.com");
/* 276 */       this.log.error(msg.toString());
/*     */     }
/*     */     catch (SFSException e)
/*     */     {
/* 281 */       ExceptionMessageComposer msg = new ExceptionMessageComposer(e);
/* 282 */       msg.setDescription("An error occurred during the Server boot, preventing it to start.");
/*     */ 
/* 284 */       this.log.error(msg.toString());
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 290 */       ExceptionMessageComposer msg = new ExceptionMessageComposer(e);
/* 291 */       msg.setDescription("Unexpected error during Server boot. The server cannot start.");
/* 292 */       msg.addInfo("Solution: Please email us the content of this error message, including the stack trace to support[at]smartfoxserver.com");
/*     */ 
/* 294 */       this.log.error(msg.toString());
/*     */     }
/*     */   }
/*     */ 
/*     */   public boolean isClustered()
/*     */   {
/* 300 */     return this.clustered;
/*     */   }
/*     */ 
/*     */   public void setClustered(boolean value)
/*     */   {
/* 305 */     if (this.initialized) {
/* 306 */       throw new IllegalStateException("Server already initialized, cannot change the cluster mode!");
/*     */     }
/* 308 */     this.clustered = value;
/*     */   }
/*     */ 
/*     */   public int getRestartCount()
/*     */   {
/* 313 */     return restartCounter.get();
/*     */   }
/*     */ 
/*     */   public synchronized void restart()
/*     */   {
/* 319 */     if (this.isRebooting) {
/* 320 */       return;
/*     */     }
/* 322 */     this.isRebooting = true;
/*     */ 
/* 324 */     this.log.warn("*** SERVER RESTARTING ***");
/*     */     try
/*     */     {
/* 328 */       this.httpServer.destroy(null);
/*     */ 
/* 331 */       this.bitSwarmEngine.shutDownSequence();
/* 332 */       this.started = false;
/*     */ 
/* 335 */       Thread restarter = new SFSRestart();
/* 336 */       restarter.start();
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 340 */       this.log.error("Restart Failure: " + e);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void halt()
/*     */   {
/* 347 */     if (this.isHalting) {
/* 348 */       return;
/*     */     }
/* 350 */     this.isHalting = true;
/*     */ 
/* 352 */     this.log.warn("*** SERVER HALTING ***");
/*     */     try
/*     */     {
/* 355 */       Thread stopper = new Thread(new Runnable()
/*     */       {
/* 357 */         int countDown = 3;
/*     */ 
/*     */         public void run()
/*     */         {
/* 362 */           while (this.countDown > 0)
/*     */           {
/* 364 */             SmartFoxServer.this.log.warn("Server Halt in " + this.countDown-- + " seconds...");
/*     */             try {
/* 366 */               Thread.sleep(1000L);
/*     */             } catch (InterruptedException localInterruptedException) {
/*     */             }
/*     */           }
/* 370 */           System.exit(0);
/*     */         }
/*     */       });
/* 374 */       stopper.start();
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 378 */       this.log.error("Halt Failure: " + e);
/*     */     }
/*     */   }
/*     */ 
/*     */   public boolean isStarted()
/*     */   {
/* 384 */     return this.started;
/*     */   }
/*     */ 
/*     */   public boolean isProcessControlAllowed()
/*     */   {
/* 397 */     String osName = System.getProperty("os.name");
/*     */ 
/* 402 */     return (osName.toLowerCase().indexOf("linux") != -1) || 
/* 401 */       (osName.toLowerCase().indexOf("mac os x") != -1) || 
/* 402 */       (osName.toLowerCase().indexOf("windows") != -1);
/*     */   }
/*     */ 
/*     */   public ITraceMonitor getTraceMonitor()
/*     */   {
/* 411 */     return this.traceMonitor;
/*     */   }
/*     */ 
/*     */   public IMailerService getMailService()
/*     */   {
/* 416 */     return this.mailService;
/*     */   }
/*     */ 
/*     */   public TaskScheduler getTaskScheduler()
/*     */   {
/* 421 */     return this.taskScheduler;
/*     */   }
/*     */ 
/*     */   public ISFSEventManager getEventManager()
/*     */   {
/* 426 */     return this.eventManager;
/*     */   }
/*     */ 
/*     */   public IZoneManager getZoneManager()
/*     */   {
/* 431 */     return this.zoneManager;
/*     */   }
/*     */ 
/*     */   public IExtensionManager getExtensionManager()
/*     */   {
/* 436 */     return this.extensionManager;
/*     */   }
/*     */ 
/*     */   public IBannedUserManager getBannedUserManager()
/*     */   {
/* 441 */     return this.bannedUserManger;
/*     */   }
/*     */ 
/*     */   public InvitationManager getInvitationManager()
/*     */   {
/* 446 */     return this.invitationManager;
/*     */   }
/*     */ 
/*     */   public IUserManager getUserManager()
/*     */   {
/* 451 */     return this.userManager;
/*     */   }
/*     */ 
/*     */   public ISessionManager getSessionManager()
/*     */   {
/* 456 */     return this.bitSwarmEngine.getSessionManager();
/*     */   }
/*     */ 
/*     */   public ServerState getState()
/*     */   {
/* 461 */     return this.state;
/*     */   }
/*     */ 
/*     */   public IConfigurator getConfigurator()
/*     */   {
/* 466 */     return this.sfsConfigurator;
/*     */   }
/*     */ 
/*     */   public int getMinClientApiVersion()
/*     */   {
/* 471 */     return 60;
/*     */   }
/*     */ 
/*     */   public APIManager getAPIManager()
/*     */   {
/* 476 */     return this.apiManager;
/*     */   }
/*     */ 
/*     */   public ILSManager getLSManager()
/*     */   {
/* 481 */     return this.lsManager;
/*     */   }
/*     */ 
/*     */   public IStatsManager getStatsManager()
/*     */   {
/* 486 */     return this.statsManager;
/*     */   }
/*     */ 
/*     */   public IHttpServer getHttpServer()
/*     */   {
/* 491 */     return this.httpServer;
/*     */   }
/*     */ 
/*     */   public ServerUptime getUptime()
/*     */   {
/* 496 */     if (this.serverStartTime == 0L) {
/* 497 */       throw new IllegalStateException("Server not ready yet, cannot provide uptime!");
/*     */     }
/* 499 */     return new ServerUptime(System.currentTimeMillis() - this.serverStartTime);
/*     */   }
/*     */ 
/*     */   public void startDebugConsole()
/*     */   {
/* 504 */     if (this.debugConsole != null) {
/* 505 */       throw new IllegalStateException("A DebugConsole was already created.");
/*     */     }
/* 507 */     this.debugConsole = new DebugConsole();
/*     */   }
/*     */ 
/*     */   private void initialize()
/*     */   {
/* 519 */     if (this.initialized) {
/* 520 */       throw new IllegalStateException("SmartFoxServer engine already initialized!");
/*     */     }
/*     */ 
/* 523 */     PropertyConfigurator.configure("config/log4j.properties");
/*     */ 
/* 525 */     this.log.info("Boot sequence starts..." + (this.clustered ? " (cluster-mode)" : ""));
/*     */ 
/* 528 */     String bootMessage = StringHelper.getAsciiMessage("boot");
/* 529 */     if (bootMessage != null) {
/* 530 */       this.log.info(bootMessage);
/*     */     }
/*     */ 
/* 533 */     initLMService();
/* 534 */     this.lsManager.init(this.log);
/*     */ 
/* 537 */     Runtime.getRuntime().addShutdownHook(new SFSShutdownHook());
/*     */ 
/* 540 */     this.apiManager = new APIManager();
/* 541 */     this.apiManager.init(null);
/*     */ 
/* 563 */     this.bitSwarmEngine.addEventListener("serverStarted", this.bitSwarmEventListener);
/* 564 */     this.bitSwarmEngine.addEventListener("sessionAdded", this.bitSwarmEventListener);
/* 565 */     this.bitSwarmEngine.addEventListener("sessionLost", this.bitSwarmEventListener);
/* 566 */     this.bitSwarmEngine.addEventListener("sessionIdle", this.bitSwarmEventListener);
/*     */ 
/* 569 */     this.bitSwarmEngine.addEventListener("packetDropped", this.bitSwarmEventListener);
/*     */ 
/* 571 */     this.bitSwarmEngine.addEventListener("sessionReconnectionTry", this.bitSwarmEventListener);
/* 572 */     this.bitSwarmEngine.addEventListener("sessionReconnectionSuccess", this.bitSwarmEventListener);
/*     */ 
/* 575 */     this.initialized = true;
/*     */   }
/*     */ 
/*     */   private void initLMService()
/*     */   {
/* 590 */     Class lsClazz = null;
/* 591 */     String target = "lib/Lib/sfs2x-lms.jar";
/*     */     try
/*     */     {
/* 595 */       if (isFrag(target))
/*     */       {
/* 597 */         DFResLoader dloader = new DFResLoader(SmartFoxServer.class.getClassLoader());
/* 598 */         dloader.init(new FileInputStream(target));
/* 599 */         lsClazz = dloader.loadClass("sfs.lms.LMService");
/*     */       }
/*     */       else
/*     */       {
/* 615 */         throw new SFSException("Unable to initialize LMSService");
/*     */       }
/*     */ 
/* 618 */       this.lsManager = ((ILSManager)lsClazz.newInstance());
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 623 */       ExceptionMessageComposer msg = new ExceptionMessageComposer(e);
/* 624 */       msg.setDescription("Fatal error -> Boot failure.");
/* 625 */       msg.addInfo("Please report the issue to the online SmartFoxServer support.");
/*     */ 
/* 627 */       this.log.error(msg.toString());
/*     */     }
/*     */   }
/*     */ 
/*     */   private boolean isFrag(String who)
/*     */   {
/* 639 */     boolean res = false;
/* 640 */     int ZH = 1347093252;
/*     */     try
/*     */     {
/* 644 */       FileInputStream fis = new FileInputStream(who);
/* 645 */       byte[] header = new byte[4];
/* 646 */       fis.read(header);
/* 647 */       ByteBuffer bb = ByteBuffer.wrap(header);
/* 648 */       res = bb.getInt() != ZH;
/*     */     }
/*     */     catch (IOException localIOException) {
/*     */     }
/* 652 */     return res;
/*     */   }
/*     */ 
/*     */   private void configureServer()
/*     */   {
/* 660 */     ServerSettings settings = this.sfsConfigurator.getServerSettings();
/*     */ 
/* 663 */     this.taskScheduler.resizeThreadPool(settings.schedulerThreadPoolSize);
/*     */ 
/* 666 */     this.bannedUserManger.setAutoRemoveBan(settings.bannedUserManager.isAutoRemove);
/* 667 */     this.bannedUserManger.setName("BannedUserManager");
/* 668 */     this.bannedUserManger.setPersistent(settings.bannedUserManager.isPersistent);
/* 669 */     this.bannedUserManger.setPersistenceClass(settings.bannedUserManager.customPersistenceClass);
/* 670 */     this.bannedUserManger.init(null);
/*     */ 
/* 673 */     this.extensionManager.setExtensionMonitorActive(settings.startExtensionFileMonitor);
/*     */ 
/* 676 */     ExceptionMessageComposer.globalPrintStackTrace = settings.useDebugMode;
/* 677 */     ExceptionMessageComposer.useExtendedMessages = settings.useFriendlyExceptions;
/*     */ 
/* 680 */     this.invitationManager = new SFSInvitationManager();
/* 681 */     ((IService)this.invitationManager).init(null);
/*     */   }
/*     */ 
/*     */   private void configureBitSwarm()
/*     */   {
/* 689 */     EngineConfiguration engineConfiguration = new EngineConfiguration();
/*     */ 
/* 691 */     CoreSettings coreSettings = this.sfsConfigurator.getCoreSettings();
/* 692 */     ServerSettings sfsSettings = this.sfsConfigurator.getServerSettings();
/*     */ 
/* 695 */     for (ServerSettings.SocketAddress addr : sfsSettings.socketAddresses)
/*     */     {
/* 697 */       engineConfiguration.addBindableAddress(new SocketConfig(addr.address, addr.port, TransportType.fromName(addr.type)));
/*     */     }
/*     */ 
/* 701 */     engineConfiguration.addController(
/* 703 */       new ControllerConfig(
/* 705 */       coreSettings.systemControllerClass, 
/* 706 */       DefaultConstants.CORE_SYSTEM_CONTROLLER_ID, 
/* 707 */       sfsSettings.systemControllerThreadPoolSize, 
/* 708 */       sfsSettings.systemControllerRequestQueueSize));
/*     */ 
/* 713 */     engineConfiguration.addController(
/* 715 */       new ControllerConfig(
/* 717 */       coreSettings.extensionControllerClass, 
/* 718 */       DefaultConstants.CORE_EXTENSIONS_CONTROLLER_ID, 
/* 719 */       sfsSettings.extensionControllerThreadPoolSize, 
/* 720 */       sfsSettings.extensionControllerRequestQueueSize));
/*     */ 
/* 725 */     engineConfiguration.setDefaultMaxSessionIdleTime(sfsSettings.sessionMaxIdleTime);
/*     */     try
/*     */     {
/* 730 */       engineConfiguration.setDefaultMaxLoggedInSessionIdleTime(sfsSettings.userMaxIdleTime);
/*     */     }
/*     */     catch (IllegalArgumentException err)
/*     */     {
/* 734 */       engineConfiguration.setDefaultMaxLoggedInSessionIdleTime(sfsSettings.sessionMaxIdleTime + 60);
/*     */ 
/* 736 */       ExceptionMessageComposer msg = new ExceptionMessageComposer(err);
/* 737 */       msg.setDescription("Make sure that userMaxIdleTime > socketIdleTime");
/* 738 */       msg.addInfo("The problem was temporarily fixed by setting userMaxIdleTime as: " + engineConfiguration.getDefaultMaxLoggedInSessionIdleTime());
/* 739 */       msg.addInfo("Please review your server.xml file and fix the problem.");
/*     */ 
/* 741 */       this.log.warn(msg.toString());
/*     */ 
/* 743 */       engineConfiguration.setDefaultMaxLoggedInSessionIdleTime(sfsSettings.sessionMaxIdleTime + 60);
/*     */     }
/*     */ 
/* 754 */     sfsSettings.useBinaryProtocol = true;
/* 755 */     if (sfsSettings.useBinaryProtocol)
/* 756 */       engineConfiguration.setIoHandlerClass("com.smartfoxserver.v2.protocol.SFSIoHandler");
/*     */     else {
/* 758 */       engineConfiguration.setIoHandlerClass("com.smartfoxserver.v2.protocol.SFSTxtIoHandler");
/*     */     }
/*     */ 
/* 761 */     engineConfiguration.setReadBufferType(coreSettings.readBufferType.equalsIgnoreCase("direct") ? BufferType.DIRECT : BufferType.HEAP);
/* 762 */     engineConfiguration.setWriteBufferType(coreSettings.readBufferType.equalsIgnoreCase("direct") ? BufferType.DIRECT : BufferType.HEAP);
/* 763 */     engineConfiguration.setReadMaxBufferSize(coreSettings.maxReadBufferSize);
/* 764 */     engineConfiguration.setWriteMaxBufferSize(coreSettings.maxWriteBufferSize);
/*     */ 
/* 766 */     engineConfiguration.setMaxIncomingRequestSize(coreSettings.maxIncomingRequestSize);
/* 767 */     engineConfiguration.setSessionPacketQueueMaxSize(coreSettings.sessionPacketQueueSize);
/* 768 */     engineConfiguration.setNagleAlgorithm(!coreSettings.tcpNoDelay);
/* 769 */     engineConfiguration.setPacketDebug(coreSettings.packetDebug);
/*     */ 
/* 772 */     engineConfiguration.setAcceptorThreadPoolSize(coreSettings.socketAcceptorThreadPoolSize);
/* 773 */     engineConfiguration.setReaderThreadPoolSize(coreSettings.socketReaderThreadPoolSize);
/* 774 */     engineConfiguration.setWriterThreadPoolSize(coreSettings.socketWriterThreadPoolSize);
/*     */ 
/* 777 */     engineConfiguration.setFlashCrossdomainPolicyEnabled(sfsSettings.flashCrossdomainPolicy.useMasterSocketPolicy);
/*     */ 
/* 779 */     if (engineConfiguration.isFlashCrossdomainPolicyEnabled())
/*     */     {
/* 781 */       String crossdomainFile = "config/" + sfsSettings.flashCrossdomainPolicy.policyXmlFile;
/*     */       try
/*     */       {
/* 785 */         String crossdomainXml = new FlashMasterSocketPolicyLoader().loadPolicy(crossdomainFile);
/* 786 */         engineConfiguration.setFlashCrossdomainPolicyXml(crossdomainXml);
/*     */       }
/*     */       catch (IOException e)
/*     */       {
/* 790 */         ExceptionMessageComposer msg = new ExceptionMessageComposer(e);
/* 791 */         msg.setDescription("could not load the specified Flash crossdomain policy file: " + crossdomainFile);
/* 792 */         msg.setPossibleCauses("make sure to put the specified file in the expcted location");
/* 793 */         msg.addInfo("More infos: more details on Flash crossdomain files are found at http://www.adobe.com/devnet/flashplayer/articles/fplayer9_security_04.html");
/*     */ 
/* 795 */         this.log.warn(msg.toString());
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 800 */     engineConfiguration.setMaxConnectionsFromSameIp(99999);
/*     */ 
/* 803 */     engineConfiguration.setClustered(this.clustered);
/*     */ 
/* 806 */     this.bitSwarmEngine.setConfiguration(engineConfiguration);
/*     */   }
/*     */ 
/*     */   private void onSocketEngineStart()
/*     */   {
/* 818 */     for (String blockedIp : this.sfsConfigurator.getServerSettings().ipFilter.addressBlackList)
/*     */     {
/* 820 */       this.bitSwarmEngine.getSocketAcceptor().getConnectionFilter().addBannedAddress(blockedIp);
/*     */     }
/*     */ 
/* 823 */     for (String allowedIp : this.sfsConfigurator.getServerSettings().ipFilter.addressWhiteList)
/*     */     {
/* 825 */       this.bitSwarmEngine.getSocketAcceptor().getConnectionFilter().addWhiteListAddress(allowedIp);
/*     */     }
/*     */ 
/* 829 */     this.bitSwarmEngine.getSocketAcceptor().getConnectionFilter().setMaxConnectionsPerIp(this.sfsConfigurator.getServerSettings().ipFilter.maxConnectionsPerAddress);
/*     */ 
/* 831 */     List<BindableSocket> sockets = this.bitSwarmEngine.getSocketAcceptor().getBoundSockets();
/* 832 */     String message = "Listening Sockets: ";
/*     */ 
/* 834 */     for (BindableSocket socket : sockets) {
/* 835 */       message = message + socket.toString() + " ";
/*     */     }
/* 837 */     this.log.info(message);
/*     */ 
/* 840 */     String asciiArt_ServerReadyMessage = StringHelper.getAsciiMessage("ready");
/* 841 */     if (asciiArt_ServerReadyMessage != null)
/*     */     {
/* 843 */       String text = String.format(
/* 845 */         "%s[ %s ] %s\n", new Object[] { 
/* 846 */         asciiArt_ServerReadyMessage, 
/* 847 */         "2.0.1", 
/* 848 */         this.clustered ? " - Node Id: " + this.bitSwarmEngine.getClusterManager().getLocalNodeName() : "" });
/*     */ 
/* 851 */       this.log.info(text);
/*     */     }
/*     */ 
/* 855 */     this.statsManager.init(null);
/*     */ 
/* 858 */     this.log.info("SmartFoxServer 2X (2.0.1) READY!");
/*     */ 
/* 860 */     if (this.zoneInitError != null)
/*     */     {
/* 862 */       ExceptionMessageComposer composer = new ExceptionMessageComposer(this.zoneInitError);
/* 863 */       composer.setDescription("There were startup errors during the Zone Setup");
/* 864 */       composer.addInfo("Please connect via the AdminTool and correct the problem");
/* 865 */       this.log.warn(composer.toString());
/*     */     }
/*     */ 
/* 869 */     this.serverStartTime = System.currentTimeMillis();
/* 870 */     this.started = true;
/*     */ 
/* 873 */     if (this.debugConsole != null) {
/* 874 */       this.debugConsole.init();
/*     */     }
/*     */ 
/* 877 */     this.eventManager.dispatchEvent(new SFSEvent(SFSEventType.SERVER_READY));
/*     */   }
/*     */ 
/*     */   private void onSessionClosed(ISession session)
/*     */   {
/* 901 */     this.apiManager.getSFSApi().disconnect(session);
/* 902 */     this.log.debug(this.userManager.getAllUsers().toString());
/*     */   }
/*     */ 
/*     */   private void onSessionIdle(ISession idleSession)
/*     */   {
/* 907 */     User user = getUserManager().getUserBySession(idleSession);
/*     */ 
/* 909 */     if (user == null) {
/* 910 */       throw new SFSRuntimeException("IdleSession event ignored, cannot find any User for Session: " + idleSession);
/*     */     }
/*     */ 
/* 913 */     this.apiManager.getSFSApi().disconnectUser(user, ClientDisconnectionReason.IDLE);
/*     */   }
/*     */ 
/*     */   private void onSessionReconnectionTry(ISession session)
/*     */   {
/* 918 */     User user = getUserManager().getUserBySession(session);
/*     */ 
/* 920 */     if (user == null) {
/* 921 */       throw new SFSRuntimeException("-Unexpected- Cannot find any User for Session: " + session);
/*     */     }
/*     */ 
/* 924 */     Map evtParams = new HashMap();
/* 925 */     evtParams.put(SFSEventParam.ZONE, user.getZone());
/* 926 */     evtParams.put(SFSEventParam.USER, user);
/*     */ 
/* 928 */     this.eventManager.dispatchEvent(new SFSEvent(SFSEventType.USER_RECONNECTION_TRY, evtParams));
/*     */   }
/*     */ 
/*     */   private void onSessionReconnectionSuccess(ISession session)
/*     */   {
/* 933 */     User user = getUserManager().getUserBySession(session);
/*     */ 
/* 935 */     if (user == null) {
/* 936 */       throw new SFSRuntimeException("-Unexpected- Cannot find any User for Session: " + session);
/*     */     }
/*     */ 
/* 939 */     Map evtParams = new HashMap();
/* 940 */     evtParams.put(SFSEventParam.ZONE, user.getZone());
/* 941 */     evtParams.put(SFSEventParam.USER, user);
/*     */ 
/* 943 */     this.eventManager.dispatchEvent(new SFSEvent(SFSEventType.USER_RECONNECTION_SUCCESS, evtParams));
/*     */   }
/*     */ 
/*     */   private class BitSwarmEventListener implements IEventListener
/*     */   {
/*     */     private BitSwarmEventListener()
/*     */     {
/*     */     }
/*     */ 
/*     */     public void handleEvent(IEvent event)
/*     */     {
/* 954 */       String evtName = event.getName();
/*     */ 
/* 957 */       if (evtName.equals("serverStarted")) {
/* 958 */         SmartFoxServer.this.onSocketEngineStart();
/*     */       }
/* 961 */       else if (evtName.equals("sessionLost"))
/*     */       {
/* 963 */         ISession session = (ISession)event.getParameter("session");
/*     */ 
/* 965 */         if (session == null) {
/* 966 */           throw new SFSRuntimeException("UNEXPECTED: Session was lost, but session object is NULL!");
/*     */         }
/* 968 */         SmartFoxServer.this.onSessionClosed(session);
/*     */       }
/* 972 */       else if (evtName.equals("sessionIdle")) {
/* 973 */         SmartFoxServer.this.onSessionIdle((ISession)event.getParameter("session"));
/*     */       }
/* 976 */       else if (evtName.equals("sessionReconnectionTry")) {
/* 977 */         SmartFoxServer.this.onSessionReconnectionTry((ISession)event.getParameter("session"));
/*     */       }
/* 980 */       else if (evtName.equals("sessionReconnectionSuccess")) {
/* 981 */         SmartFoxServer.this.onSessionReconnectionSuccess((ISession)event.getParameter("session"));
/*     */       }
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.SmartFoxServer
 * JD-Core Version:    0.6.0
 */