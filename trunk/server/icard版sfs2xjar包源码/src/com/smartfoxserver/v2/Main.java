/*    */ package com.smartfoxserver.v2;
/*    */ 
/*    */ public class Main
/*    */ {
/*    */   public static void main(String[] args)
/*    */   {
/* 12 */     boolean clusterMode = false;
/* 13 */     boolean useConsole = false;
/*    */ 
/* 15 */     if (args.length > 0)
/*    */     {
/* 18 */       clusterMode = args[0].equalsIgnoreCase("cluster");
/*    */ 
/* 21 */       useConsole = (args.length > 1) && (args[1].equalsIgnoreCase("console"));
/*    */     }
/*    */ 
/* 24 */     SmartFoxServer sfs2X = SmartFoxServer.getInstance();
/* 25 */     sfs2X.setClustered(clusterMode);
/*    */ 
/* 28 */     if (useConsole) {
/* 29 */       sfs2X.startDebugConsole();
/*    */     }
/* 31 */     sfs2X.start();
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.Main
 * JD-Core Version:    0.6.0
 */