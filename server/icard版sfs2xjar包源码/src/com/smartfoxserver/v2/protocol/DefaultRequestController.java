/*    */ package com.smartfoxserver.v2.protocol;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.controllers.AbstractController;
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.bitswarm.io.IResponse;
/*    */ import com.smartfoxserver.bitswarm.io.Response;
/*    */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*    */ import java.io.PrintStream;
/*    */ import java.util.ArrayList;
/*    */ import java.util.Arrays;
/*    */ import java.util.List;
/*    */ 
/*    */ public class DefaultRequestController extends AbstractController
/*    */ {
/*    */   public void processRequest(IRequest request)
/*    */     throws Exception
/*    */   {
/* 26 */     ISFSObject reqObj = (SFSObject)request.getContent();
/* 27 */     int reqId = ((Short)request.getId()).shortValue();
/*    */ 
/* 29 */     System.out.println("Got a request! ID: " + reqId);
/*    */ 
/* 32 */     switch (reqId)
/*    */     {
/*    */     case 1:
/* 35 */       handleReqOne(request);
/* 36 */       break;
/*    */     }
/*    */   }
/*    */ 
/*    */   private void handleReqOne(IRequest request)
/*    */   {
/* 46 */     ISFSObject responseObj = SFSObject.newInstance();
/* 47 */     responseObj.putIntArray("123", Arrays.asList(new Integer[] { Integer.valueOf(1), Integer.valueOf(2), Integer.valueOf(3) }));
/* 48 */     responseObj.putUtfString("res", "Hello to you!");
/*    */ 
/* 51 */     sendResponse(1, request.getSender(), responseObj);
/*    */   }
/*    */ 
/*    */   private void sendResponse(short actionId, Object recipients, ISFSObject responseObject)
/*    */   {
/* 62 */     List recipientList = null;
/*    */ 
/* 65 */     if ((recipients instanceof List)) {
/* 66 */       recipientList = (List)recipients;
/* 67 */     } else if ((recipients instanceof ISession))
/*    */     {
/* 69 */       recipientList = new ArrayList();
/* 70 */       recipientList.add((ISession)recipients);
/*    */     }
/*    */     else {
/* 73 */       throw new IllegalArgumentException("Wrong recipients argument in sendResponse!");
/*    */     }
/*    */ 
/* 76 */     IResponse response = new Response();
/* 77 */     response.setId(this.id);
/* 78 */     response.setRecipients(recipientList);
/*    */ 
/* 81 */     ISFSObject fullObj = SFSObject.newInstance();
/* 82 */     fullObj.putByte("id", 1);
/* 83 */     fullObj.putShort("a", actionId);
/* 84 */     fullObj.putSFSObject("p", responseObject);
/*    */ 
/* 86 */     response.setContent(fullObj);
/* 87 */     response.write();
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.DefaultRequestController
 * JD-Core Version:    0.6.0
 */