/*    */ package com.smartfoxserver.v2.api;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.service.IService;
/*    */ import com.smartfoxserver.v2.SmartFoxServer;
/*    */ 
/*    */ public class APIManager
/*    */   implements IService
/*    */ {
/*  8 */   private final String serviceName = "APIManager";
/*    */   private SmartFoxServer sfs;
/*    */   private ISFSApi sfsApi;
/*    */   private ISFSBuddyApi buddyApi;
/*    */   private ISFSGameApi gameApi;
/*    */ 
/*    */   public void init(Object o)
/*    */   {
/* 24 */     this.sfs = SmartFoxServer.getInstance();
/* 25 */     this.sfsApi = new SFSApi(this.sfs);
/* 26 */     this.buddyApi = new SFSBuddyApi(this.sfs);
/* 27 */     this.gameApi = new SFSGameApi(this.sfs);
/*    */   }
/*    */ 
/*    */   public ISFSApi getSFSApi()
/*    */   {
/* 32 */     return this.sfsApi;
/*    */   }
			
		   public void setSFSApi(ISFSApi api)
/*    */   {
/* 32 */     this.sfsApi = api;
/*    */   }
/*    */ 
/*    */   public ISFSBuddyApi getBuddyApi()
/*    */   {
/* 37 */     return this.buddyApi;
/*    */   }
/*    */ 
/*    */   public ISFSGameApi getGameApi()
/*    */   {
/* 42 */     return this.gameApi;
/*    */   }
/*    */ 
/*    */   public void destroy(Object arg0)
/*    */   {
/*    */   }
/*    */ 
/*    */   public String getName()
/*    */   {
/* 54 */     return "APIManager";
/*    */   }
/*    */ 
/*    */   public void handleMessage(Object msg)
/*    */   {
/* 60 */     throw new UnsupportedOperationException("Not supported");
/*    */   }
/*    */ 
/*    */   public void setName(String arg0)
/*    */   {
/* 66 */     throw new UnsupportedOperationException("Not supported");
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.APIManager
 * JD-Core Version:    0.6.0
 */