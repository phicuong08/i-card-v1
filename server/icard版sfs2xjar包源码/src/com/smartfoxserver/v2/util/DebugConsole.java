/*    */ package com.smartfoxserver.v2.util;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.core.BitSwarmEngine;
/*    */ import com.smartfoxserver.v2.SmartFoxServer;
/*    */ import com.smartfoxserver.v2.api.APIManager;
/*    */ import org.python.core.PyObject;
/*    */ import org.python.core.PySystemState;
/*    */ import org.python.util.PythonInterpreter;
/*    */ 
/*    */ public class DebugConsole
/*    */ {
/*    */   private PythonInterpreter runtime;
/*    */ 
/*    */   public DebugConsole()
/*    */   {
/* 15 */     PySystemState.initialize();
/* 16 */     this.runtime = new PythonInterpreter();
/*    */   }
/*    */ 
/*    */   public void init()
/*    */   {
/* 21 */     this.runtime.exec("import sys");
/* 22 */     this.runtime.exec("sys.path.append(r'lib/jconsole/')");
/* 23 */     this.runtime.exec("from console import main");
/*    */ 
/* 25 */     PyObject main = this.runtime.get("main");
/*    */ 
/* 28 */     this.runtime.set("sfs", SmartFoxServer.getInstance());
/* 29 */     this.runtime.set("eng", BitSwarmEngine.getInstance());
/* 30 */     this.runtime.set("api", SmartFoxServer.getInstance().getAPIManager().getSFSApi());
/* 31 */     this.runtime.set("um", SmartFoxServer.getInstance().getUserManager());
/* 32 */     this.runtime.set("zm", SmartFoxServer.getInstance().getZoneManager());
/* 33 */     this.runtime.set("xm", SmartFoxServer.getInstance().getExtensionManager());
/* 34 */     this.runtime.set("bum", SmartFoxServer.getInstance().getBannedUserManager());
/* 35 */     this.runtime.set("sm", SmartFoxServer.getInstance().getSessionManager());
/* 36 */     this.runtime.set("sm", SmartFoxServer.getInstance().getSessionManager());
/*    */ 
/* 38 */     main.__call__(this.runtime.getLocals());
/*    */ 
/* 40 */     this.runtime.exec("print('sfs\t\tSmartFoxServer instance');print('api\t\tSmartFoxServer API');print('sm\t\tSessionManager');print('um\t\tUserManager');print('zm\t\tZoneManager');print('xm\t\tExtensionManager');print('bum\t\tBannedUserManager');print('um\t\tUserManager');print('zm\t\tZoneManager');print('xm\t\tExtensionManager');print('eng\t\tBitSwarmEngine');");
/* 41 */     this.runtime.exec("print ''");
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.DebugConsole
 * JD-Core Version:    0.6.0
 */