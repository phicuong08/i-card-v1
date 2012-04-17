/*    */ package com.smartfoxserver.v2.config;
/*    */ 
/*    */ public final class DefaultConstants
/*    */ {
/*    */   public static final String LOG_LINE_SEPARATOR = "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::";
/*    */   public static final String CONFIG_FOLDER = "config/";
/*    */   public static final String LIB_FOLDER = "lib/";
/*    */   public static final String EXTENSION_FOLDER = "extensions/";
/*    */   public static final String EXTENSION_DEFAULT_CFG_FILE = "config.properties";
/*    */   public static final String LOG4J_PROPERTIES = "config/log4j.properties";
/*    */   public static final String CORE_CFG_FILE = "config/core.xml";
/*    */   public static final String SERVER_CFG_FILE = "config/server.xml";
/*    */   public static final String ZONES_FOLDER = "zones/";
/*    */   public static final String ZONE_FILE_EXTENSION = ".zone.xml";
/*    */   public static final String ZONE_DEFAULT_GROUP = "default";
/*    */   public static final int ZONE_TRAFFIC_METER_UPDATE_INTERVAL = 5;
/*    */   public static final String ASCII_ART_SERVER_READY = "config/ascii-ready.txt";
/*    */   public static final String LMSERVICE_FILE = "Lib/sfs2x-lms.jar";
/*    */   public static final String LMSERVICE = "sfs.lms.LMService";
/*    */   public static final int CLIENT_API_MIN_REQUESTED_VERSION = 60;
/*    */   public static final String CORE_SYSTEM_CONTROLLER_CLASS = "com.smartfoxserver.v2.controllers.SystemController";
/* 30 */   public static final Byte CORE_SYSTEM_CONTROLLER_ID = new Byte(0);
/*    */   public static final String CORE_EXTENSION_CONTROLLER_CLASS = "com.smartfoxserver.v2.controllers.ExtensionController";
/* 32 */   public static final Byte CORE_EXTENSIONS_CONTROLLER_ID = new Byte(1);
/*    */   public static final String CORE_IO_HANDLER_CLASS = "com.smartfoxserver.v2.protocol.SFSIoHandler";
/*    */   public static final String CORE_IO_TXT_HANDLER_CLASS = "com.smartfoxserver.v2.protocol.SFSTxtIoHandler";
/*    */   public static final String CORE_SESSION_MANAGER_CLASS = "com.smartfoxserver.bitswarm.sessions.DefaultSessionManager";
/*    */   public static final String CORE_PACKET_QUEUE_POLICY_CLASS = "com.smartfoxserver.bitswarm.sessions.DefaultPacketQueuePolicy";
/*    */   public static final String CORE_DEFAULT_PLAYER_ID_GENERATOR_CLASS = "com.smartfoxserver.v2.util.DefaultPlayerIdGenerator";
/*    */   public static final String CORE_READ_BUFFER_TYPE = "HEAP";
/*    */   public static final String CORE_WRITE_BUFFER_TYPE = "HEAP";
/*    */   public static final int CORE_MAX_INCOMING_REQUEST_SIZE = 4096;
/*    */   public static final int CORE_MAX_READ_BUFFER_SIZE = 1024;
/*    */   public static final int CORE_MAX_WRITE_BUFFER_SIZE = 32768;
/*    */   public static final int CORE_SESSION_QUEUE_SIZE = 120;
/*    */   public static final int CORE_SOCKET_ACCEPTOR_THREAD_POOL_SIZE = 1;
/*    */   public static final int CORE_SOCKET_READER_THREAD_POOL_SIZE = 1;
/*    */   public static final int CORE_SOCKET_WRITER_THREAD_POOL_SIZE = 1;
/*    */   public static final int CORE_MAX_CONNECTIONS_FROM_SAME_IP = 3;
/*    */   public static final boolean CORE_TCP_NO_DELAY = false;
/*    */   public static final String USP_LAST_SEARCH_TIME = "LastSearchTime";
/*    */   public static final String USP_INVITATION_PROCESS_RUNNING = "InvitationProcessRunning";
/*    */   public static final String USP_UDP_PORT = "UDPPort";
/*    */   public static final String USP_FLOOD_FILTER_REQ_TABLE = "FloodFilterRequestTable";
/*    */   public static final String BOOT_LOG_FOLDER = "logs/boot/";
/*    */   public static final String BOOT_BASE_FILENAME = "boot_";
/*    */   public static final String BOOT_LOG_FILE_EXTENSION = ".log";
/*    */   public static final long BOOT_LOG_MAXSIZE = 500000000L;
/*    */   public static final int BOOT_LOG_MAX_DAYS = 5;
/*    */   public static final String BOOT_LOGGING_LEVEL = "INFO";
/*    */   public static final int ADOBE_MASTER_SOCKET_POLICY_SERVER_PORT = 843;
/*    */   public static final int MIN_TIME_BETWEEN_CLIENT_SEARCHES = 1000;
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.config.DefaultConstants
 * JD-Core Version:    0.6.0
 */