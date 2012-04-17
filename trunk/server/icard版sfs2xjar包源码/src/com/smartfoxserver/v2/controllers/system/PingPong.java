/*    */ package com.smartfoxserver.v2.controllers.system;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*    */ import com.smartfoxserver.v2.api.ISFSApi;
/*    */ import com.smartfoxserver.v2.api.response.ISFSResponseApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ 
/*    */ public class PingPong extends BaseControllerCommand
/*    */ {
/*    */   private static final String KEY_LAST_PING_TIME = "key_lastPingTime";
/*    */   private static final int MIN_PING_TIME = 900;
/*    */ 
/*    */   public PingPong()
/*    */   {
/* 16 */     super(SystemRequest.PingPong);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 22 */     boolean isOk = true;
/*    */ 
/* 24 */     ISession sender = request.getSender();
/* 25 */     Long lastPing = (Long)sender.getProperty("key_lastPingTime");
/* 26 */     long now = System.currentTimeMillis();
/*    */ 
/* 28 */     if (lastPing != null)
/*    */     {
/* 31 */       if (now - lastPing.longValue() < 900L) {
/* 32 */         isOk = false;
/*    */       }
/*    */ 
/*    */     }
/*    */ 
/* 37 */     return isOk;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 44 */     request.getSender().setProperty("key_lastPingTime", Long.valueOf(System.currentTimeMillis()));
/*    */ 
/* 47 */     this.api.getResponseAPI().sendPingPongResponse(request.getSender());
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.PingPong
 * JD-Core Version:    0.6.0
 */