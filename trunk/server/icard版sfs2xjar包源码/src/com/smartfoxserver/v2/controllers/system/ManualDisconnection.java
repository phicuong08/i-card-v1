/*    */ package com.smartfoxserver.v2.controllers.system;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.api.ISFSApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.Zone;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ 
/*    */ public class ManualDisconnection extends BaseControllerCommand
/*    */ {
/*    */   public ManualDisconnection()
/*    */   {
/* 14 */     super(SystemRequest.ManualDisconnection);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 20 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 27 */     User sender = this.api.getUserBySession(request.getSender());
/*    */ 
/* 29 */     Zone zone = sender.getZone();
/*    */ 
/* 31 */     if ((zone != null) && (zone.getUserReconnectionSeconds() > 0))
/*    */     {
/* 34 */       sender.setReconnectionSeconds(0);
/*    */     }
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.ManualDisconnection
 * JD-Core Version:    0.6.0
 */