/*    */ package com.smartfoxserver.v2.api;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IResponse;
/*    */ import com.smartfoxserver.bitswarm.io.Response;
/*    */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*    */ import com.smartfoxserver.v2.config.DefaultConstants;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*    */ import com.smartfoxserver.v2.exceptions.IErrorCode;
/*    */ import com.smartfoxserver.v2.exceptions.SFSErrorCode;
/*    */ import com.smartfoxserver.v2.exceptions.SFSErrorData;
/*    */ import com.smartfoxserver.v2.exceptions.SFSLoginException;
/*    */ 
/*    */ public final class LoginErrorHandler
/*    */ {
/*    */   public void execute(ISession sender, SFSLoginException err)
/*    */   {
/* 20 */     ISFSObject resObj = SFSObject.newInstance();
/*    */ 
/* 23 */     if (err.getErrorData() == null)
/*    */     {
/* 25 */       SFSErrorData errData = new SFSErrorData(SFSErrorCode.GENERIC_ERROR);
/* 26 */       errData.addParameter("An unexpected error occurred, please check the server side logs");
/*    */ 
/* 28 */       err = new SFSLoginException(err.getMessage(), errData);
/*    */     }
/*    */ 
/* 32 */     IResponse response = new Response();
/* 33 */     response.setId(SystemRequest.Login.getId());
/* 34 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 35 */     response.setContent(resObj);
/* 36 */     response.setRecipients(sender);
/*    */ 
/* 39 */     resObj.putShort("ec", err.getErrorData().getCode().getId());
/* 40 */     resObj.putUtfStringArray("ep", err.getErrorData().getParams());
/*    */ 
/* 43 */     response.write();
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.LoginErrorHandler
 * JD-Core Version:    0.6.0
 */