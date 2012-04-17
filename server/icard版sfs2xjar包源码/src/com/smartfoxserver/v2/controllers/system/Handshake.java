/*     */ package com.smartfoxserver.v2.controllers.system;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.bitswarm.io.IResponse;
/*     */ import com.smartfoxserver.bitswarm.io.Response;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISessionManager;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.config.CoreSettings;
/*     */ import com.smartfoxserver.v2.config.DefaultConstants;
/*     */ import com.smartfoxserver.v2.config.IConfigurator;
/*     */ import com.smartfoxserver.v2.config.ServerSettings;
/*     */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import com.smartfoxserver.v2.entities.managers.IUserManager;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorCode;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*     */ import com.smartfoxserver.v2.util.CryptoUtils;
/*     */ import java.util.Arrays;
/*     */ import java.util.List;
/*     */ import org.slf4j.Logger;
/*     */ 
/*     */ public class Handshake extends BaseControllerCommand
/*     */ {
/*     */   public static final String KEY_BIN_FLAG = "bin";
/*     */   public static final String KEY_API = "api";
/*     */   public static final String KEY_TOKEN = "tk";
/*     */   public static final String KEY_COMPRESSION_THRESHOLD = "ct";
/*     */   public static final String KEY_RECONNECTION_TOKEN = "rt";
/*     */   public static final String KEY_CLIENT_TYPE = "cl";
/*     */   public static final String KEY_MAX_MESSAGE_SIZE = "ms";
/*     */ 
/*     */   public Handshake()
/*     */   {
/*  34 */     super(SystemRequest.Handshake);
/*     */   }
/*     */ 
/*     */   public void execute(IRequest request)
/*     */     throws Exception
/*     */   {
/*  40 */     ISession sender = request.getSender();
/*     */ 
/*  42 */     ISFSObject reqObj = (ISFSObject)request.getContent();
/*  43 */     String apiVersionStr = reqObj.getUtfString("api");
/*  44 */     String reconnectionToken = reqObj.getUtfString("rt");
/*  45 */     ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/*  48 */     if (!isApiVersionOk(apiVersionStr))
/*     */     {
/*  54 */       List errorParams = Arrays.asList(new String[] { apiVersionStr, formatVersionNumber(this.sfs.getMinClientApiVersion()) });
/*     */ 
/*  56 */       resObj.putShort("ec", SFSErrorCode.HANDSHAKE_API_OBSOLETE.getId());
/*  57 */       resObj.putUtfStringArray("ep", errorParams);
/*     */     }
/*     */     else
/*     */     {
/*  63 */       String sessionToken = null;
/*     */ 
/*  66 */       if (reconnectionToken != null)
/*     */       {
/*  68 */         ISession resumedSession = this.sfs.getSessionManager().reconnectSession(sender, reconnectionToken);
/*     */ 
/*  71 */         if (resumedSession == null) {
/*  72 */           return;
/*     */         }
/*     */ 
/*  75 */         sender = resumedSession;
/*  76 */         sessionToken = sender.getHashId();
/*     */ 
/*  79 */         User user = this.sfs.getUserManager().getUserBySession(sender);
/*     */ 
/*  81 */         if (user == null) {
/*  82 */           this.logger.warn("User not found at reconnection time. " + sender);
/*     */         }
/*     */         else {
/*  85 */           user.updateLastRequestTime();
/*  86 */           this.logger.info("Reconnected USER: " + user + ", logged: " + sender.isLoggedIn());
/*     */         }
/*     */ 
/*     */       }
/*     */       else
/*     */       {
/*  94 */         sessionToken = CryptoUtils.getUniqueSessionToken(sender);
/*     */       }
/*     */ 
/* 105 */       sender.setSystemProperty("ClientType", reqObj.containsKey("cl") ? reqObj.getUtfString("cl") : "Unknown");
/*     */ 
/* 107 */       sender.setHashId(sessionToken);
/* 108 */       resObj.putUtfString("tk", sessionToken);
/* 109 */       resObj.putInt("ct", this.sfs.getConfigurator().getServerSettings().protocolCompressionThreshold);
/* 110 */       resObj.putInt("ms", this.sfs.getConfigurator().getCoreSettings().maxIncomingRequestSize);
/*     */     }
/*     */ 
/* 113 */     IResponse response = new Response();
/* 114 */     response.setId(Short.valueOf(getId()));
/* 115 */     response.setRecipients(sender);
/* 116 */     response.setContent(resObj);
/* 117 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/*     */ 
/* 119 */     response.write();
/*     */   }
/*     */ 
/*     */   private String formatVersionNumber(int ver)
/*     */   {
/* 124 */     String unformatted = String.valueOf(ver);
/* 125 */     int additionalZeros = 3 - unformatted.length();
/*     */ 
/* 127 */     StringBuffer sb = new StringBuffer();
/*     */ 
/* 130 */     if (additionalZeros > 0)
/*     */     {
/* 132 */       for (int j = 0; j < additionalZeros; j++) {
/* 133 */         sb.append('0');
/*     */       }
/*     */     }
/*     */ 
/* 137 */     sb.append(unformatted);
/*     */ 
/* 140 */     int bottomPos = sb.length() - 1;
/* 141 */     sb.insert(bottomPos, '.');
/* 142 */     bottomPos--;
/* 143 */     sb.insert(bottomPos, '.');
/*     */ 
/* 145 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public boolean validate(IRequest request)
/*     */     throws SFSRequestValidationException
/*     */   {
/* 151 */     ISFSObject reqObj = (ISFSObject)request.getContent();
/* 152 */     ISession sender = request.getSender();
/*     */ 
/* 155 */     if (!reqObj.containsKey("api")) {
/* 156 */       throw new SFSRequestValidationException("Missing 'api' flag in Handshake Request. Sender: " + sender);
/*     */     }
/*     */ 
/* 162 */     return true;
/*     */   }
/*     */ 
/*     */   private boolean isApiVersionOk(String apiVersionStr)
/*     */   {
/* 167 */     boolean ok = false;
/*     */ 
/* 170 */     apiVersionStr = apiVersionStr.replace(".", "");
/*     */ 
/* 172 */     int apiVersionNumber = -1;
/*     */     try
/*     */     {
/* 176 */       apiVersionNumber = Integer.parseInt(apiVersionStr);
/*     */     }
/*     */     catch (NumberFormatException localNumberFormatException) {
/*     */     }
/* 180 */     if (apiVersionNumber >= this.sfs.getMinClientApiVersion()) {
/* 181 */       ok = true;
/*     */     }
/* 183 */     return ok;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.Handshake
 * JD-Core Version:    0.6.0
 */