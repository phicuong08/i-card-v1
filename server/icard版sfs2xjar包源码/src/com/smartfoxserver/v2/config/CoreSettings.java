/*    */ package com.smartfoxserver.v2.config;
/*    */ 
/*    */ public final class CoreSettings
/*    */ {
/*  5 */   public String systemControllerClass = "com.smartfoxserver.v2.controllers.SystemController";
/*  6 */   public String extensionControllerClass = "com.smartfoxserver.v2.controllers.ExtensionController";
/*  7 */   public String ioHandlerClass = "com.smartfoxserver.v2.protocol.SFSIoHandler";
/*  8 */   public String sessionManagerClass = "com.smartfoxserver.bitswarm.sessions.DefaultSessionManager";
/*  9 */   public String packetQueuePolicyClass = "com.smartfoxserver.bitswarm.sessions.DefaultPacketQueuePolicy";
/* 10 */   public String readBufferType = "HEAP";
/* 11 */   public String writeBufferType = "HEAP";
/* 12 */   public int maxIncomingRequestSize = 4096;
/* 13 */   public int maxReadBufferSize = 1024;
/* 14 */   public int maxWriteBufferSize = 32768;
/* 15 */   public int socketAcceptorThreadPoolSize = 1;
/* 16 */   public int socketReaderThreadPoolSize = 1;
/* 17 */   public int socketWriterThreadPoolSize = 1;
/* 18 */   public int sessionPacketQueueSize = 120;
/* 19 */   public boolean tcpNoDelay = false;
/* 20 */   public boolean packetDebug = false;
/* 21 */   public int bbMaxLogFiles = 10;
/* 22 */   public int bbMaxLogFileSize = 1000000;
/* 23 */   public boolean bbDebugMode = false;
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.config.CoreSettings
 * JD-Core Version:    0.6.0
 */