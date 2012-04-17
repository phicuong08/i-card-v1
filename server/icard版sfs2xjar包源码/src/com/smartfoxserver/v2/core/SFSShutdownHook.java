/*    */ package com.smartfoxserver.v2.core;
/*    */ 
/*    */ import org.slf4j.Logger;
/*    */ import org.slf4j.LoggerFactory;
/*    */ 
/*    */ public class SFSShutdownHook extends Thread
/*    */ {
/*    */   private final Logger log;
/*    */ 
/*    */   public SFSShutdownHook()
/*    */   {
/* 12 */     super("SFS2X ShutdownHook");
/* 13 */     this.log = LoggerFactory.getLogger(getClass());
/*    */   }
/*    */ 
/*    */   public void run()
/*    */   {
/* 19 */     this.log.warn("SFS2X is shutting down. The process may take a few seconds...");
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.core.SFSShutdownHook
 * JD-Core Version:    0.6.0
 */