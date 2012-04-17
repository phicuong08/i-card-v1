/*    */ package com.smartfoxserver.v2.db;
/*    */ 
/*    */ public class DBConfig
/*    */ {
/*    */   public static final String POOL_ACTION_FAIL = "FAIL";
/*    */   public static final String POOL_ACTION_BLOCK = "BLOCK";
/*    */   public static final String POOL_ACTION_GROW = "GROW";
/* 18 */   public boolean active = false;
/*    */   public String driverName;
/*    */   public String connectionString;
/*    */   public String userName;
/*    */   public String password;
/*    */   public String testSql;
/* 46 */   public int maxActiveConnections = 10;
/*    */ 
/* 49 */   public int maxIdleConnections = 10;
/*    */ 
/* 60 */   public String exhaustedPoolAction = "FAIL";
/*    */ 
/* 63 */   public int blockTime = 3000;
/*    */ 
/*    */   public DBConfig()
/*    */   {
/* 70 */     this.driverName = "";
/* 71 */     this.connectionString = "";
/* 72 */     this.userName = "";
/* 73 */     this.password = "";
/* 74 */     this.testSql = "";
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.db.DBConfig
 * JD-Core Version:    0.6.0
 */