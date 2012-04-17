/*    */ package com.smartfoxserver.v2.db;
/*    */ 
/*    */ import com.smartfoxserver.v2.entities.Zone;
/*    */ import java.util.concurrent.atomic.AtomicInteger;
/*    */ import org.slf4j.Logger;
/*    */ import org.slf4j.LoggerFactory;
/*    */ 
/*    */ abstract class BaseDBManager
/*    */   implements IDBManager
/*    */ {
/* 12 */   private static final AtomicInteger autoId = new AtomicInteger();
/*    */   protected Zone parentZone;
/* 15 */   protected boolean active = false;
/*    */   protected final DBConfig config;
/*    */   protected final String name;
/*    */   protected final Logger log;
/*    */ 
/*    */   public BaseDBManager(DBConfig config)
/*    */   {
/* 23 */     this.log = LoggerFactory.getLogger(getClass());
/* 24 */     this.config = config;
/* 25 */     this.name = ("DBManager-" + autoId.incrementAndGet());
/*    */   }
/*    */ 
/*    */   public void init(Object o)
/*    */   {
/* 32 */     if ((o != null) && ((o instanceof Zone))) {
/* 33 */       this.parentZone = ((Zone)o);
/*    */     }
/*    */ 
/* 36 */     if (this.config == null)
/* 37 */       throw new IllegalStateException("DBManager was not configured! Please make sure to pass a non-null DBConfig to the constructor.");
/*    */   }
/*    */ 
/*    */   public void destroy(Object o)
/*    */   {
/*    */   }
/*    */ 
/*    */   public String getName()
/*    */   {
/* 49 */     return this.name;
/*    */   }
/*    */ 
/*    */   public void setName(String name)
/*    */   {
/* 55 */     throw new UnsupportedOperationException("Sorry, operation is not supported in this class. The name is auto-generated.");
/*    */   }
/*    */ 
/*    */   public void handleMessage(Object arg0)
/*    */   {
/* 61 */     throw new UnsupportedOperationException("Sorry, operation is not supported in this class.");
/*    */   }
/*    */ 
/*    */   public DBConfig getConfig()
/*    */   {
/* 67 */     return this.config;
/*    */   }
/*    */ 
/*    */   public boolean isActive()
/*    */   {
/* 73 */     return this.active;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.db.BaseDBManager
 * JD-Core Version:    0.6.0
 */