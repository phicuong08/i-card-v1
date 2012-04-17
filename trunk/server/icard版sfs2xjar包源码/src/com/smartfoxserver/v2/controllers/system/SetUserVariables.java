/*    */ package com.smartfoxserver.v2.controllers.system;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.io.IRequest;
/*    */ import com.smartfoxserver.v2.api.ISFSApi;
/*    */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*    */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*    */ import com.smartfoxserver.v2.entities.variables.SFSUserVariable;
/*    */ import com.smartfoxserver.v2.entities.variables.UserVariable;
/*    */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ 
/*    */ public class SetUserVariables extends BaseControllerCommand
/*    */ {
/*    */   public static final String KEY_VAR_LIST = "vl";
/*    */   public static final String KEY_USER = "u";
/*    */ 
/*    */   public SetUserVariables()
/*    */   {
/* 23 */     super(SystemRequest.SetUserVariables);
/*    */   }
/*    */ 
/*    */   public boolean validate(IRequest request)
/*    */     throws SFSRequestValidationException
/*    */   {
/* 29 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 31 */     if (!sfso.containsKey("vl")) {
/* 32 */       throw new SFSRequestValidationException("Missing variables list");
/*    */     }
/* 34 */     return true;
/*    */   }
/*    */ 
/*    */   public void execute(IRequest request)
/*    */     throws Exception
/*    */   {
/* 40 */     List userVars = new ArrayList();
/* 41 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*    */ 
/* 44 */     User user = checkRequestPermissions(request);
/*    */ 
/* 47 */     ISFSArray varListData = sfso.getSFSArray("vl");
/*    */ 
/* 53 */     for (int j = 0; j < varListData.size(); j++)
/*    */     {
/* 55 */       UserVariable uVar = SFSUserVariable.newFromSFSArray(varListData.getSFSArray(j));
/*    */ 
/* 58 */       UserVariable targetVar = user.getVariable(uVar.getName());
/* 59 */       if ((targetVar != null) && (targetVar.isHidden())) {
/*    */         continue;
/*    */       }
/* 62 */       userVars.add(uVar);
/*    */     }
/*    */ 
/* 65 */     this.api.setUserVariables(user, userVars);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.SetUserVariables
 * JD-Core Version:    0.6.0
 */