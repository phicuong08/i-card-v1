/*    */ package com.smartfoxserver.v2.buddylist.cache;
/*    */ 
/*    */ import com.smartfoxserver.v2.buddylist.BuddyVariable;
/*    */ import java.util.Collections;
/*    */ import java.util.List;
/*    */ import java.util.Map;
/*    */ import java.util.concurrent.ConcurrentHashMap;
/*    */ 
/*    */ public class SimpleVariableCache
/*    */   implements BuddyVariablesCache
/*    */ {
/*    */   private final Map<String, List<BuddyVariable>> cache;
/*    */   private final Map<Long, String> cacheHistory;
/*    */   private volatile int size;
/*    */ 
/*    */   public SimpleVariableCache(int size)
/*    */   {
/* 26 */     if (size < 0) {
/* 27 */       size = 100;
/*    */     }
/* 29 */     this.cache = new ConcurrentHashMap();
/* 30 */     this.cacheHistory = new ConcurrentHashMap();
/*    */ 
/* 32 */     this.size = size;
/*    */   }
/*    */ 
/*    */   public void addVariables(String ownerName, List<BuddyVariable> variables)
/*    */   {
/* 40 */     if (this.cache.size() >= this.size) {
/* 41 */       createRoom();
/*    */     }
/* 43 */     this.cache.put(ownerName, variables);
/* 44 */     this.cacheHistory.put(Long.valueOf(System.nanoTime()), ownerName);
/*    */   }
/*    */ 
/*    */   private void createRoom()
/*    */   {
/* 53 */     long olderTime = ((Long)Collections.min(this.cacheHistory.keySet())).longValue();
/* 54 */     String olderItem = (String)this.cacheHistory.remove(Long.valueOf(olderTime));
/* 55 */     removeVariables(olderItem);
/*    */   }
/*    */ 
/*    */   public int getSize()
/*    */   {
/* 62 */     return this.size;
/*    */   }
/*    */ 
/*    */   public List<BuddyVariable> getVariables(String ownerName)
/*    */   {
/* 68 */     return (List)this.cache.get(ownerName);
/*    */   }
/*    */ 
/*    */   public void removeVariables(String ownerName)
/*    */   {
/* 74 */     this.cache.remove(ownerName);
/*    */   }
/*    */ 
/*    */   public void setSize(int size)
/*    */   {
/* 80 */     if (size < this.size) {
/* 81 */       throw new IllegalArgumentException("BuddyVariablesCache implementation does not support cache shrinking");
/*    */     }
/* 83 */     this.size = size;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.cache.SimpleVariableCache
 * JD-Core Version:    0.6.0
 */