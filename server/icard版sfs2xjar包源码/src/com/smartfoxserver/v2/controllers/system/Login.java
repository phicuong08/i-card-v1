/*     */ package com.smartfoxserver.v2.controllers.system;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.core.ISFSEventManager;
/*     */ import com.smartfoxserver.v2.core.SFSEventParam;
/*     */ import com.smartfoxserver.v2.core.SFSEventSysParam;
/*     */ import com.smartfoxserver.v2.core.SFSEventType;
/*     */ import com.smartfoxserver.v2.core.SFSSystemEvent;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import com.smartfoxserver.v2.entities.managers.IZoneManager;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*     */ import java.util.HashMap;
/*     */ import java.util.Map;
/*     */ 
/*     */ public class Login extends BaseControllerCommand
/*     */ {
/*     */   public static final String KEY_USERNAME = "un";
/*     */   public static final String KEY_PASSWORD = "pw";
/*     */   public static final String KEY_ZONENAME = "zn";
/*     */   public static final String KEY_PARAMS = "p";
/*     */   public static final String KEY_PRIVILEGE_ID = "pi";
/*     */   public static final String KEY_ID = "id";
/*     */   public static final String KEY_ROOMLIST = "rl";
/*     */   public static final String KEY_RECONNECTION_SECONDS = "rs";
/*     */ 
/*     */   public Login()
/*     */   {
/*  34 */     super(SystemRequest.Login);
/*     */   }
/*     */ 
/*     */   public boolean validate(IRequest request)
/*     */     throws SFSRequestValidationException
/*     */   {
/*  40 */     boolean res = true;
/*  41 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/*  44 */     if ((!sfso.containsKey("un")) || 
/*  45 */       (!sfso.containsKey("pw")) || 
/*  46 */       (!sfso.containsKey("zn")))
/*     */     {
/*  48 */       throw new SFSRequestValidationException("Bad Login Request. Essential parameters are missing. Client API is probably fake.");
/*     */     }
/*     */ 
/*  51 */     Zone zone = this.sfs.getZoneManager().getZoneByName(sfso.getUtfString("zn"));
/*     */ 
/*  70 */     if ((zone != null) && (zone.isCustomLogin()))
/*     */     {
/*  73 */       Map sysParams = new HashMap();
/*  74 */       sysParams.put(SFSEventSysParam.NEXT_COMMAND, Login.class);
/*  75 */       sysParams.put(SFSEventSysParam.REQUEST_OBJ, request);
/*     */ 
/*  78 */       Map userParams = new HashMap();
/*     */ 
/*  81 */       userParams.put(SFSEventParam.ZONE, zone);
/*  82 */       userParams.put(SFSEventParam.SESSION, request.getSender());
/*  83 */       userParams.put(SFSEventParam.LOGIN_NAME, sfso.getUtfString("un"));
/*  84 */       userParams.put(SFSEventParam.LOGIN_PASSWORD, sfso.getUtfString("pw"));
/*  85 */       userParams.put(SFSEventParam.LOGIN_IN_DATA, sfso.getSFSObject("p"));
/*     */ 
/*  93 */       ISFSObject paramsOut = SFSObject.newInstance();
/*  94 */       request.setAttribute("$FS_REQUEST_LOGIN_DATA_OUT", paramsOut);
/*  95 */       userParams.put(SFSEventParam.LOGIN_OUT_DATA, paramsOut);
/*     */ 
/*  98 */       this.sfs.getEventManager().dispatchEvent(new SFSSystemEvent(SFSEventType.USER_LOGIN, userParams, sysParams));
/*     */ 
/* 101 */       res = false;
/*     */     }
/*     */ 
/* 104 */     return res;
/*     */   }
/*     */ 
/*     */   public void execute(IRequest request)
/*     */     throws Exception
/*     */   {
/* 111 */     ISFSObject reqObj = (ISFSObject)request.getContent();
/*     */ 
/* 113 */     String zoneName = reqObj.getUtfString("zn");
/* 114 */     String userName = reqObj.getUtfString("un");
/* 115 */     String password = reqObj.getUtfString("pw");
/*     */ 
/* 122 */     ISFSObject params = (ISFSObject)request.getAttribute("$FS_REQUEST_LOGIN_DATA_OUT");
/*     */ 
/* 128 */     if (params != null)
/*     */     {
/* 130 */       String newUserName = params.getUtfString("$FS_NEW_LOGIN_NAME");
/* 131 */       if (newUserName != null) {
/* 132 */         userName = newUserName;
/*     */       }
/*     */     }
/*     */ 
/* 136 */     this.api.login(request.getSender(), userName, password, zoneName, params, true);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.Login
 * JD-Core Version:    0.6.0
 */