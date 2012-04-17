/*     */ package com.smartfoxserver.v2.controllers;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.exceptions.SFSFloodingException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import com.smartfoxserver.v2.security.PrivilegeManager;
/*     */ import com.smartfoxserver.v2.security.SystemPermission;
/*     */ import com.smartfoxserver.v2.util.IFloodFilter;
/*     */ import java.util.Arrays;
/*     */ import java.util.List;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public abstract class BaseControllerCommand
/*     */   implements IControllerCommand
/*     */ {
/*     */   public static final String KEY_ERROR_CODE = "ec";
/*     */   public static final String KEY_ERROR_PARAMS = "ep";
/*     */   protected final Logger logger;
/*     */   protected final SmartFoxServer sfs;
/*     */   protected final ISFSApi api;
/*     */   private short id;
/*     */   private final SystemRequest requestType;
/*  36 */   private final List<SystemRequest> superUserRequest = Arrays.asList(new SystemRequest[] { 
/*  35 */     SystemRequest.ModeratorMessage, 
/*  36 */     SystemRequest.AdminMessage });
/*     */ 
/*     */   public BaseControllerCommand(SystemRequest request)
/*     */   {
/*  41 */     this.logger = LoggerFactory.getLogger(getClass());
/*  42 */     this.sfs = SmartFoxServer.getInstance();
/*  43 */     this.api = this.sfs.getAPIManager().getSFSApi();
/*  44 */     this.id = ((Short)request.getId()).shortValue();
/*  45 */     this.requestType = request;
/*     */   }
/*     */ 
/*     */   public Object preProcess(IRequest request)
/*     */     throws Exception
/*     */   {
/*  55 */     return null;
/*     */   }
/*     */ 
/*     */   public short getId()
/*     */   {
/*  60 */     return this.id;
/*     */   }
/*     */ 
/*     */   public SystemRequest getRequestType()
/*     */   {
/*  65 */     return this.requestType;
/*     */   }
/*     */ 
/*     */   protected User checkSuperUser(IRequest request)
/*     */   {
/*  70 */     SystemRequest requestType = SystemRequest.fromId(Short.valueOf(this.id));
/*  71 */     User sender = this.api.getUserBySession(request.getSender());
/*     */ 
/*  73 */     if (sender == null)
/*     */     {
/*  75 */       throw new SFSRuntimeException(
/*  77 */         String.format("System Request rejected: %s, Client is not logged in: ", new Object[] { request.getSender() }));
/*     */     }
/*     */ 
/*  81 */     if (!sender.isSuperUser())
/*     */     {
/*  83 */       throw new SFSRuntimeException(
/*  85 */         String.format("System Request rejected: requester user must be SuperUser. Request: %s, User: %s", new Object[] { requestType, sender }));
/*     */     }
/*     */ 
/*  89 */     return sender;
/*     */   }
/*     */ 
/*     */   protected User checkRequestPermissions(IRequest request, SystemRequest requestType)
/*     */   {
/* 101 */     User sender = this.api.getUserBySession(request.getSender());
/*     */ 
/* 104 */     if (sender == null)
/*     */     {
/* 106 */       throw new SFSRuntimeException(
/* 108 */         String.format("System Request rejected: %s, Client is not logged in. ", new Object[] { request.getSender() }));
/*     */     }
/*     */ 
/* 113 */     if (sender.isBeingKicked())
/*     */     {
/* 115 */       throw new SFSRuntimeException(
/* 117 */         String.format("System Request rejected: %s, Client is marked for kicking. ", new Object[] { sender }));
/*     */     }
/*     */ 
/* 121 */     Zone zone = sender.getZone();
/*     */     try
/*     */     {
/* 128 */       zone.getFloodFilter().filterRequest(requestType, sender);
/*     */     }
/*     */     catch (SFSFloodingException floodErr)
/*     */     {
/* 132 */       throw new SFSRuntimeException();
/*     */     }
/*     */ 
/* 135 */     boolean isValid = false;
/*     */ 
/* 138 */     if (this.superUserRequest.contains(requestType)) {
/* 139 */       isValid = zone.getPrivilegeManager().isFlagSet(sender, SystemPermission.SuperUser);
/*     */     }
/*     */     else
/*     */     {
/* 143 */       isValid = zone.getPrivilegeManager().isRequestAllowed(sender, requestType);
/*     */     }
/* 145 */     if (!isValid)
/*     */     {
/* 147 */       throw new SFSRuntimeException(
/* 149 */         String.format("System Request rejected: insufficient privileges. Request: %s, User: %s", new Object[] { requestType, sender }));
/*     */     }
/*     */ 
/* 153 */     return sender;
/*     */   }
/*     */ 
/*     */   protected User checkRequestPermissions(IRequest request)
/*     */   {
/* 163 */     return checkRequestPermissions(request, SystemRequest.fromId(Short.valueOf(this.id)));
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.BaseControllerCommand
 * JD-Core Version:    0.6.0
 */