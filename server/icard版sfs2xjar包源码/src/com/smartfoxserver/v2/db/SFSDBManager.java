/*     */ package com.smartfoxserver.v2.db;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*     */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*     */ import java.sql.Connection;
/*     */ import java.sql.DriverManager;
/*     */ import java.sql.PreparedStatement;
/*     */ import java.sql.ResultSet;
/*     */ import java.sql.SQLException;
/*     */ import org.apache.commons.dbcp.ConnectionFactory;
/*     */ import org.apache.commons.dbcp.DriverManagerConnectionFactory;
/*     */ import org.apache.commons.dbcp.PoolableConnectionFactory;
/*     */ import org.apache.commons.dbcp.PoolingDriver;
/*     */ import org.apache.commons.pool.ObjectPool;
/*     */ import org.apache.commons.pool.impl.GenericObjectPool;
/*     */ import org.apache.commons.pool.impl.GenericObjectPool.Config;
/*     */ import org.slf4j.Logger;
/*     */ 
/*     */ public class SFSDBManager extends BaseDBManager
/*     */ {
/*     */   private static final String JDBC_APACHE_COMMONS_DBCP = "jdbc:apache:commons:dbcp:";
/*     */ 
/*     */   public SFSDBManager(DBConfig config)
/*     */   {
/*  47 */     super(config);
/*     */   }
/*     */ 
/*     */   public void init(Object o)
/*     */   {
/*  53 */     super.init(o);
/*     */ 
/*  56 */     if (!this.config.active) {
/*  57 */       return;
/*     */     }
/*     */     try
/*     */     {
/*  61 */       setupDriver();
/*  62 */       this.active = true;
/*     */ 
/*  64 */       if ((this.config.testSql != null) && (this.config.testSql.length() > 0))
/*  65 */         testSQLStatement();
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/*  69 */       ExceptionMessageComposer message = new ExceptionMessageComposer(e);
/*  70 */       message.setDescription("The initialization of the DBManager has failed.");
/*  71 */       message.setPossibleCauses("if the database driver is not 'seen' int the server classpath the setup fails.");
/*  72 */       message.addInfo("Make sure to deploy the driver .jar file in the extensions/__lib__/ folder and restart the Server.");
/*     */ 
/*  74 */       this.log.error(message.toString());
/*     */     }
/*     */   }
/*     */ 
/*     */   public void destroy(Object o)
/*     */   {
/*  82 */     super.destroy(o);
/*     */     try
/*     */     {
/*  87 */       PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
/*  88 */       driver.closePool(this.name);
/*     */     }
/*     */     catch (SQLException sqle)
/*     */     {
/*  92 */       this.log.warn(
/*  94 */         String.format(
/*  96 */         "Failed shutting down DBManager: %s, Reason: %s", new Object[] { 
/*  97 */         this.name, 
/*  98 */         sqle.toString() }));
/*     */     }
/*     */   }
/*     */ 
/*     */   public Connection getConnection()
/*     */     throws SQLException
/*     */   {
/* 111 */     checkState();
/*     */ 
/* 113 */     return DriverManager.getConnection("jdbc:apache:commons:dbcp:" + this.name);
/*     */   }
/*     */ 
/*     */   public ISFSArray executeQuery(String sql)
/*     */     throws SQLException
/*     */   {
/* 122 */     return executeQuery(sql, null);
/*     */   }
/*     */ 
/*     */   public ISFSArray executeQuery(String sql, Object[] params)
/*     */     throws SQLException
/*     */   {
/* 131 */     checkState();
/*     */ 
/* 133 */     ISFSArray sfsa = null;
/* 134 */     Connection conn = null;
/* 135 */     PreparedStatement stmt = null;
/*     */     try
/*     */     {
/* 139 */       conn = getConnection();
/* 140 */       stmt = conn.prepareStatement(sql);
/*     */ 
/* 143 */       if (params != null)
/*     */       {
/* 145 */         int index = 1;
/* 146 */         for (Object o : params) {
/* 147 */           stmt.setObject(index++, o);
/*     */         }
/*     */       }
/* 150 */       if (this.log.isDebugEnabled()) {
/* 151 */         this.log.debug("ExecuteQuery SQL: " + stmt.toString());
/*     */       }
/* 153 */       ResultSet resultSet = stmt.executeQuery();
/*     */ 
/* 155 */       if (resultSet != null) {
/* 156 */         sfsa = SFSArray.newFromResultSet(resultSet);
/*     */       }
/*     */ 
/*     */     }
/*     */     finally
/*     */     {
/* 162 */       if (stmt != null) {
/* 163 */         stmt.close();
/*     */       }
/* 165 */       if (conn != null) {
/* 166 */         conn.close();
/*     */       }
/*     */     }
/* 169 */     return sfsa;
/*     */   }
/*     */ 
/*     */   public void executeUpdate(String sql)
/*     */     throws SQLException
/*     */   {
/* 178 */     executeUpdate(sql, null);
/*     */   }
/*     */ 
/*     */   public void executeUpdate(String sql, Object[] params)
/*     */     throws SQLException
/*     */   {
/* 187 */     checkState();
/*     */ 
/* 189 */     Connection conn = null;
/* 190 */     PreparedStatement stmt = null;
/*     */     try
/*     */     {
/* 194 */       conn = getConnection();
/* 195 */       stmt = conn.prepareStatement(sql);
/*     */ 
/* 198 */       if (params != null)
/*     */       {
/* 200 */         int index = 1;
/* 201 */         for (Object o : params) {
/* 202 */           stmt.setObject(index++, o);
/*     */         }
/*     */       }
/* 205 */       if (this.log.isDebugEnabled()) {
/* 206 */         this.log.debug("ExecuteUpdate SQL: " + stmt.toString());
/*     */       }
/* 208 */       stmt.executeUpdate();
/*     */     }
/*     */     finally
/*     */     {
/* 213 */       if (stmt != null) {
/* 214 */         stmt.close();
/*     */       }
/* 216 */       if (conn != null)
/* 217 */         conn.close();
/*     */     }
/*     */   }
/*     */ 
/*     */   public int getActiveConnections()
/*     */   {
/* 227 */     if (!isActive()) {
/* 228 */       return 0;
/*     */     }
/*     */ 
/* 231 */     int value = -1;
/*     */     try
/*     */     {
/* 235 */       PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
/* 236 */       ObjectPool connectionPool = driver.getConnectionPool(this.name);
/* 237 */       value = connectionPool.getNumActive();
/*     */     }
/*     */     catch (SQLException e)
/*     */     {
/* 241 */       this.log.info(e.toString());
/*     */     }
/*     */ 
/* 244 */     return value;
/*     */   }
/*     */ 
/*     */   public int getIdleConnections()
/*     */   {
/* 253 */     if (!isActive()) {
/* 254 */       return 0;
/*     */     }
/*     */ 
/* 257 */     int value = -1;
/*     */     try
/*     */     {
/* 261 */       PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
/* 262 */       ObjectPool connectionPool = driver.getConnectionPool(this.name);
/* 263 */       value = connectionPool.getNumIdle();
/*     */     }
/*     */     catch (SQLException e)
/*     */     {
/* 267 */       this.log.info(e.toString());
/*     */     }
/*     */ 
/* 270 */     return value;
/*     */   }
/*     */ 
/*     */   private void checkState()
/*     */     throws SQLException
/*     */   {
/* 280 */     if (!this.active)
/* 281 */       throw new SQLException("The DBManager is NOT active in this Zone. SQL Query failed. Please activate it the DBManager from the AdminTool");
/*     */   }
/*     */ 
/*     */   private void setupDriver()
/*     */     throws Exception
/*     */   {
/* 287 */     Class.forName(this.config.driverName);
/*     */ 
/* 290 */     GenericObjectPool.Config cfg = new GenericObjectPool.Config();
/*     */ 
/* 292 */     cfg.maxActive = this.config.maxActiveConnections;
/* 293 */     cfg.maxIdle = this.config.maxIdleConnections;
/* 294 */     cfg.testOnBorrow = true;
/* 295 */     cfg.testOnReturn = true;
/*     */ 
/* 297 */     if (this.config.exhaustedPoolAction == "GROW") {
/* 298 */       cfg.whenExhaustedAction = 2;
/*     */     }
/* 300 */     else if (this.config.exhaustedPoolAction == "FAIL") {
/* 301 */       cfg.whenExhaustedAction = 0;
/*     */     }
/* 303 */     else if (this.config.exhaustedPoolAction == "BLOCK")
/*     */     {
/* 305 */       cfg.whenExhaustedAction = 1;
/* 306 */       cfg.maxWait = this.config.blockTime;
/*     */     }
/*     */ 
/* 310 */     ObjectPool connectionPool = new GenericObjectPool(null, cfg);
/*     */ 
/* 313 */     ConnectionFactory connectionFactory = new DriverManagerConnectionFactory(
/* 315 */       this.config.connectionString, 
/* 316 */       this.config.userName, 
/* 317 */       this.config.password);
/*     */ 
/* 321 */     new PoolableConnectionFactory(connectionFactory, connectionPool, null, null, false, true);
/*     */ 
/* 324 */     PoolingDriver driver = new PoolingDriver();
/*     */ 
/* 327 */     driver.registerPool(this.name, connectionPool);
/*     */   }
/*     */ 
/*     */   private void testSQLStatement()
/*     */   {
/*     */     try
/*     */     {
/* 334 */       executeQuery(this.config.testSql);
/*     */     }
/*     */     catch (SQLException sqle)
/*     */     {
/* 339 */       ExceptionMessageComposer message = new ExceptionMessageComposer(sqle, false);
/* 340 */       message.setDescription("The DBManager Test SQL failed");
/* 341 */       message.addInfo("Please double check your SQL code and make sure that Database server is running.");
/*     */ 
/* 343 */       this.log.error(message.toString());
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.db.SFSDBManager
 * JD-Core Version:    0.6.0
 */