/*    */ package com.smartfoxserver.v2.util;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ import org.slf4j.Logger;
/*    */ import org.slf4j.LoggerFactory;
/*    */ 
/*    */ public class SFSRestart extends Thread
/*    */ {
/*    */   private static final String LINUX_LAUNCHER = "./sfs2x.sh";
/*    */   private static final String OSX_LAUNCHER = "./sfs2x.sh";
/*    */   private static final String WIN_LAUNCHER = "sfs2x.bat";
/*    */   private final Logger log;
/*    */   private boolean isWindows;
/*    */   private boolean isOSX;
/* 16 */   private boolean isLinux = false;
/*    */ 
/*    */   public SFSRestart()
/*    */   {
/* 20 */     setName(":::SFSRestarter:::");
/* 21 */     this.log = LoggerFactory.getLogger(SFSRestart.class);
/*    */ 
/* 23 */     String osName = System.getProperty("os.name");
/* 24 */     if (osName.toLowerCase().indexOf("linux") != -1)
/* 25 */       this.isLinux = true;
/* 26 */     else if (osName.toLowerCase().indexOf("mac os x") != -1)
/* 27 */       this.isOSX = true;
/* 28 */     else if (osName.toLowerCase().indexOf("windows") != -1)
/* 29 */       this.isWindows = true;
/*    */     else
/* 31 */       throw new IllegalStateException("Restart failure: operating system not supported: " + osName);
/*    */   }
/*    */ 
/*    */   public void run()
/*    */   {
/*    */     try
/*    */     {
/* 38 */       String restartCmd = null;
/* 39 */       if (this.isWindows)
/* 40 */         restartCmd = "sfs2x.bat";
/* 41 */       else if (this.isLinux)
/* 42 */         restartCmd = "./sfs2x.sh";
/* 43 */       else if (this.isOSX) {
/* 44 */         restartCmd = "./sfs2x.sh";
/*    */       }
/*    */ 
/* 49 */       String[] cmds = restartCmd.split("\\,");
/* 50 */       List command = new ArrayList();
/* 51 */       for (String cmd : cmds) {
/* 52 */         command.add(cmd);
/*    */       }
/* 54 */       ProcessBuilder builder = new ProcessBuilder(command);
/* 55 */       Process proc = builder.start();
/* 56 */       this.log.info("Process restarted: " + proc);
/*    */ 
/* 59 */       Thread.sleep(4000L);
/*    */ 
/* 62 */       System.exit(-2);
/*    */     }
/*    */     catch (Exception e)
/*    */     {
/* 66 */       this.log.error("Restart exception: " + e);
/*    */     }
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.SFSRestart
 * JD-Core Version:    0.6.0
 */