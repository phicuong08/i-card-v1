/*     */ package com.smartfoxserver.v2.controllers.system;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.GenericMessageType;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.api.ISFSBuddyApi;
/*     */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*     */ import com.smartfoxserver.v2.controllers.SuperUserSendMode;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Collection;
/*     */ import java.util.List;
/*     */ 
/*     */ public class GenericMessage extends BaseControllerCommand
/*     */ {
/*     */   public static final String KEY_ROOM_ID = "r";
/*     */   public static final String KEY_USER_ID = "u";
/*     */   public static final String KEY_MESSAGE = "m";
/*     */   public static final String KEY_MESSAGE_TYPE = "t";
/*     */   public static final String KEY_RECIPIENT = "rc";
/*     */   public static final String KEY_RECIPIENT_MODE = "rm";
/*     */   public static final String KEY_SENDER_DATA = "sd";
/*     */   public static final String KEY_XTRA_PARAMS = "p";
/*     */ 
/*     */   public GenericMessage()
/*     */   {
/*  62 */     super(SystemRequest.GenericMessage);
/*     */   }
/*     */ 
/*     */   public boolean validate(IRequest request)
/*     */     throws SFSRequestValidationException
/*     */   {
/*  68 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/*  71 */     Byte messageType = sfso.getByte("t");
/*  72 */     if (messageType == null) {
/*  73 */       throw new SFSRequestValidationException("Missing message type");
/*     */     }
/*  75 */     GenericMessageType type = GenericMessageType.fromId(messageType.byteValue());
/*     */ 
/*  77 */     if (type == null) {
/*  78 */       throw new SFSRequestValidationException("Unrecognized message type");
/*     */     }
/*  80 */     switch (type)
/*     */     {
/*     */     case ADMING_MSG:
/*  83 */       validatePublicMessage(request);
/*  84 */       break;
/*     */     case BUDDY_MSG:
/*  87 */       validatePrivateMessage(request);
/*  88 */       break;
/*     */     case PRIVATE_MSG:
/*  91 */       validateObjectMessage(request);
/*  92 */       break;
/*     */     case PUBLIC_MSG:
/*  95 */       validateBuddyMessage(request);
/*  96 */       break;
/*     */     case MODERATOR_MSG:
/*     */     case OBJECT_MSG:
/*     */     default:
/* 100 */       validateSuperUserMessage(request);
/*     */     }
/*     */ 
/* 103 */     return true;
/*     */   }
/*     */ 
/*     */   public void execute(IRequest request)
/*     */     throws Exception
/*     */   {
/* 109 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/* 112 */     Byte messageType = sfso.getByte("t");
/* 113 */     GenericMessageType type = GenericMessageType.fromId(messageType.byteValue());
/*     */ 
/* 115 */     switch (type)
/*     */     {
/*     */     case ADMING_MSG:
/* 118 */       executePublicMessage(request);
/* 119 */       break;
/*     */     case BUDDY_MSG:
/* 122 */       executePrivateMessage(request);
/* 123 */       break;
/*     */     case PRIVATE_MSG:
/* 126 */       executeObjectMessage(request);
/* 127 */       break;
/*     */     case PUBLIC_MSG:
/* 130 */       executeBuddyMessage(request);
/* 131 */       break;
/*     */     case MODERATOR_MSG:
/*     */     case OBJECT_MSG:
/*     */     default:
/* 135 */       executeSuperUserMessage(request, type);
/*     */     }
/*     */   }
/*     */ 
/*     */   private void validatePublicMessage(IRequest request)
/*     */     throws SFSRequestValidationException
/*     */   {
/* 148 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/* 150 */     if (!sfso.containsKey("r")) {
/* 151 */       throw new SFSRequestValidationException("Missing Target Room id");
/*     */     }
/* 153 */     if (!sfso.containsKey("m"))
/* 154 */       throw new SFSRequestValidationException("Missing message data");
/*     */   }
/*     */ 
/*     */   private void validatePrivateMessage(IRequest request) throws SFSRequestValidationException
/*     */   {
/* 159 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/* 161 */     if (!sfso.containsKey("rc")) {
/* 162 */       throw new SFSRequestValidationException("Missing recipient id");
/*     */     }
/* 164 */     if (!sfso.containsKey("m"))
/* 165 */       throw new SFSRequestValidationException("Missing message data");
/*     */   }
/*     */ 
/*     */   private void validateBuddyMessage(IRequest request) throws SFSRequestValidationException
/*     */   {
/* 170 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/* 172 */     if (!sfso.containsKey("rc")) {
/* 173 */       throw new SFSRequestValidationException("Missing target buddy");
/*     */     }
/* 175 */     if (!sfso.containsKey("m"))
/* 176 */       throw new SFSRequestValidationException("Missing message data");
/*     */   }
/*     */ 
/*     */   private void validateSuperUserMessage(IRequest request) throws SFSRequestValidationException
/*     */   {
/* 181 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/* 183 */     if (!sfso.containsKey("rm")) {
/* 184 */       throw new SFSRequestValidationException("Missing recipient mode");
/*     */     }
/* 186 */     if (!sfso.containsKey("m"))
/* 187 */       throw new SFSRequestValidationException("Missing message data");
/*     */   }
/*     */ 
/*     */   private void validateObjectMessage(IRequest request) throws SFSRequestValidationException
/*     */   {
/* 192 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/* 194 */     if (!sfso.containsKey("r")) {
/* 195 */       throw new SFSRequestValidationException("Missing Target Room id");
/*     */     }
/* 197 */     if (!sfso.containsKey("p"))
/* 198 */       throw new SFSRequestValidationException("Missing object message");
/*     */   }
/*     */ 
/*     */   private void executePublicMessage(IRequest request)
/*     */     throws Exception
/*     */   {
/* 204 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/* 207 */     User user = checkRequestPermissions(request, SystemRequest.PublicMessage);
/* 208 */     Zone zone = user.getZone();
/*     */ 
/* 211 */     user.updateLastRequestTime();
/*     */ 
/* 214 */     this.api.sendPublicMessage(
/* 216 */       zone.getRoomById(sfso.getInt("r").intValue()), 
/* 217 */       zone.getUserBySession(request.getSender()), 
/* 218 */       sfso.getUtfString("m"), 
/* 219 */       sfso.getSFSObject("p"));
/*     */   }
/*     */ 
/*     */   private void executePrivateMessage(IRequest request)
/*     */     throws Exception
/*     */   {
/* 225 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/* 228 */     User sender = checkRequestPermissions(request, SystemRequest.PrivateMessage);
/* 229 */     User recipient = this.api.getUserById(sfso.getInt("rc").intValue());
/*     */ 
/* 231 */     if (recipient == null) {
/* 232 */       throw new IllegalArgumentException("Private Message recipient is not available. Recipient ID: " + sfso.getInt("rc"));
/*     */     }
/*     */ 
/* 235 */     sender.updateLastRequestTime();
/*     */ 
/* 238 */     this.api.sendPrivateMessage(
/* 240 */       sender, 
/* 241 */       recipient, 
/* 242 */       sfso.getUtfString("m"), 
/* 243 */       sfso.getSFSObject("p"));
/*     */   }
/*     */ 
/*     */   private void executeBuddyMessage(IRequest request)
/*     */     throws Exception
/*     */   {
/* 249 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/* 252 */     User sender = checkRequestPermissions(request, SystemRequest.BuddyMessage);
/* 253 */     User recipient = this.api.getUserById(sfso.getInt("rc").intValue());
/*     */ 
/* 255 */     if (recipient == null) {
/* 256 */       throw new IllegalArgumentException("Private Message recipient is not available. Recipient ID: " + sfso.getInt("rc"));
/*     */     }
/*     */ 
/* 259 */     sender.updateLastRequestTime();
/*     */ 
/* 262 */     this.sfs.getAPIManager().getBuddyApi().sendBuddyMessage(
/* 264 */       sender, 
/* 265 */       recipient, 
/* 266 */       sfso.getUtfString("m"), 
/* 267 */       sfso.getSFSObject("p"));
/*     */   }
/*     */ 
/*     */   private void executeSuperUserMessage(IRequest request, GenericMessageType type)
/*     */     throws Exception
/*     */   {
/* 273 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/* 276 */     User sender = checkRequestPermissions(request, SystemRequest.ModeratorMessage);
/*     */ 
/* 278 */     SuperUserSendMode sendMode = SuperUserSendMode.fromId(sfso.getInt("rm").intValue());
/*     */ 
/* 280 */     if (sendMode == null) {
/* 281 */       throw new IllegalArgumentException("SendMode not recognized: " + sfso.getInt("rm"));
/*     */     }
/* 283 */     Collection recipients = getMessageRecipients(sendMode, sender, sfso);
/*     */ 
/* 286 */     if (type == GenericMessageType.MODERATOR_MSG)
/*     */     {
/* 288 */       this.api.sendModeratorMessage(
/* 290 */         sender, 
/* 291 */         sfso.getUtfString("m"), 
/* 292 */         sfso.getSFSObject("p"), 
/* 293 */         recipients);
/*     */     }
/*     */     else
/*     */     {
/* 300 */       this.api.sendAdminMessage(
/* 302 */         sender, 
/* 303 */         sfso.getUtfString("m"), 
/* 304 */         sfso.getSFSObject("p"), 
/* 305 */         recipients);
/*     */     }
/*     */   }
/*     */ 
/*     */   private void executeObjectMessage(IRequest request)
/*     */     throws Exception
/*     */   {
/* 312 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/* 315 */     User user = checkRequestPermissions(request, SystemRequest.ObjectMessage);
/* 316 */     Zone zone = user.getZone();
/* 317 */     Room targetRoom = zone.getRoomById(sfso.getInt("r").intValue());
/*     */ 
/* 319 */     if (targetRoom == null) {
/* 320 */       throw new IllegalArgumentException("Room with Id: " + sfso.getInt("r") + ", is not found.");
/*     */     }
/*     */ 
/* 323 */     user.updateLastRequestTime();
/*     */ 
/* 326 */     Collection recipientIds = sfso.getIntArray("rc");
/* 327 */     List recipients = null;
/*     */ 
/* 330 */     if (recipientIds != null)
/*     */     {
/* 333 */       if (recipientIds.size() > targetRoom.getCapacity())
/*     */       {
/* 335 */         throw new IllegalArgumentException(
/* 337 */           String.format(
/* 339 */           "Number of Object Message recipients (%s) is bigger than Room capacity (%s)", new Object[] { 
/* 340 */           Integer.valueOf(recipientIds.size()), 
/* 341 */           Integer.valueOf(targetRoom.getCapacity()) }));
/*     */       }
/*     */ 
/* 346 */       recipients = new ArrayList();
/*     */ 
/* 349 */       for (Integer userId : recipientIds)
/*     */       {
/* 351 */         if (userId == null)
/*     */           continue;
/* 353 */         User targetUser = zone.getUserById(userId.intValue());
/* 354 */         if (targetUser != null) {
/* 355 */           recipients.add(targetUser);
/*     */         }
/*     */ 
/*     */       }
/*     */ 
/*     */     }
/*     */     else
/*     */     {
/* 363 */       recipients = targetRoom.getUserList();
/* 364 */       recipients.remove(user);
/*     */     }
/*     */ 
/* 368 */     this.api.sendObjectMessage(
/* 370 */       targetRoom, 
/* 371 */       user, 
/* 372 */       sfso.getSFSObject("p"), 
/* 373 */       recipients);
/*     */   }
/*     */ 
/*     */   private Collection<ISession> getMessageRecipients(SuperUserSendMode mode, User sender, ISFSObject params)
/*     */   {
/* 379 */     Collection recipients = null;
/*     */ 
/* 382 */     switch (mode)
/*     */     {
/*     */     case TO_GROUP:
/* 385 */       recipients = new ArrayList();
/* 386 */       User user = this.api.getUserById(params.getInt("rc").intValue());
/* 387 */       if (user == null) break;
/* 388 */       recipients.add(user.getSession());
/* 389 */       break;
/*     */     case TO_ROOM:
/* 392 */       Room room = sender.getZone().getRoomById(params.getInt("rc").intValue());
/* 393 */       if (room != null)
/* 394 */         recipients = room.getSessionList();
/*     */       else
/* 396 */         recipients = new ArrayList();
/* 397 */       break;
/*     */     case TO_USER:
/* 400 */       String groupId = params.getUtfString("rc");
/* 401 */       Zone zone = sender.getZone();
/* 402 */       if (zone.containsGroup(groupId))
/* 403 */         recipients = zone.getSessionsInGroup(groupId);
/*     */       else
/* 405 */         recipients = new ArrayList();
/* 406 */       break;
/*     */     default:
/* 409 */       recipients = sender.getZone().getSessionList();
/*     */     }
/*     */ 
/* 412 */     return recipients;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.GenericMessage
 * JD-Core Version:    0.6.0
 */