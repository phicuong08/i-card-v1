/*     */ package com.smartfoxserver.v2.controllers.system;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.io.IRequest;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.CreateRoomSettings;
/*     */ import com.smartfoxserver.v2.api.CreateRoomSettings.RoomExtensionSettings;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.controllers.BaseControllerCommand;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.SFSRoomRemoveMode;
/*     */ import com.smartfoxserver.v2.entities.SFSRoomSettings;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.managers.IUserManager;
/*     */ import com.smartfoxserver.v2.entities.variables.RoomVariable;
/*     */ import com.smartfoxserver.v2.entities.variables.SFSRoomVariable;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Collections;
/*     */ import java.util.EnumSet;
/*     */ import java.util.List;
/*     */ import java.util.Set;
/*     */ import org.slf4j.Logger;
/*     */ 
/*     */ public class CreateRoom extends BaseControllerCommand
/*     */ {
/*     */   public static final String KEY_ROOM = "r";
/*     */   public static final String KEY_NAME = "n";
/*     */   public static final String KEY_GROUP_ID = "g";
/*     */   public static final String KEY_PASSWORD = "p";
/*     */   public static final String KEY_ISGAME = "ig";
/*     */   public static final String KEY_MAXUSERS = "mu";
/*     */   public static final String KEY_MAXSPECTATORS = "ms";
/*     */   public static final String KEY_MAXVARS = "mv";
/*     */   public static final String KEY_ROOMVARS = "rv";
/*     */   public static final String KEY_PERMISSIONS = "pm";
/*     */   public static final String KEY_EVENTS = "ev";
/*     */   public static final String KEY_EXTID = "xn";
/*     */   public static final String KEY_EXTCLASS = "xc";
/*     */   public static final String KEY_EXTPROP = "xp";
/*     */   public static final String KEY_AUTO_JOIN = "aj";
/*     */   public static final String KEY_ROOM_TO_LEAVE = "rl";
/*     */ 
/*     */   public CreateRoom()
/*     */   {
/*  47 */     super(SystemRequest.CreateRoom);
/*     */   }
/*     */ 
/*     */   public boolean validate(IRequest request)
/*     */     throws SFSRequestValidationException
/*     */   {
/*  53 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/*  55 */     if (sfso.isNull("n")) {
/*  56 */       throw new SFSRequestValidationException("Room name is missing");
/*     */     }
/*  58 */     if (sfso.isNull("mu")) {
/*  59 */       throw new SFSRequestValidationException("MaxUsers param is missing");
/*     */     }
/*  61 */     if (sfso.isNull("aj")) {
/*  62 */       throw new SFSRequestValidationException("AutoJoine param is missing");
/*     */     }
/*  64 */     validateGroupId(request.getSender(), sfso.getUtfString("g"));
/*     */ 
/*  66 */     return true;
/*     */   }
/*     */ 
/*     */   public Object preProcess(IRequest request)
/*     */     throws Exception
/*     */   {
/*  73 */     User user = checkRequestPermissions(request);
/*     */ 
/*  76 */     ISFSObject sfso = (ISFSObject)request.getContent();
/*     */ 
/*  78 */     String name = sfso.getUtfString("n");
/*  79 */     String groupId = sfso.getUtfString("g");
/*  80 */     String pass = sfso.getUtfString("p");
/*  81 */     boolean isGame = sfso.isNull("ig") ? false : sfso.getBool("ig").booleanValue();
/*  82 */     int maxUsers = sfso.getShort("mu").shortValue();
/*  83 */     int maxSpect = sfso.isNull("ms") ? 0 : sfso.getShort("ms").shortValue();
/*  84 */     int maxVars = sfso.isNull("mv") ? 0 : sfso.getShort("mv").shortValue();
/*     */ 
/*  87 */     Set roomFlags = null;
/*  88 */     List permissions = (List)sfso.getBoolArray("pm");
/*  89 */     List events = (List)sfso.getBoolArray("ev");
/*     */ 
/*  92 */     if ((permissions != null) && (permissions.size() == 4))
/*     */     {
/*  94 */       roomFlags = Collections.synchronizedSet(EnumSet.noneOf(SFSRoomSettings.class));
/*     */ 
/*  96 */       if (((Boolean)permissions.get(0)).booleanValue()) {
/*  97 */         roomFlags.add(SFSRoomSettings.ROOM_NAME_CHANGE);
/*     */       }
/*  99 */       if (((Boolean)permissions.get(1)).booleanValue()) {
/* 100 */         roomFlags.add(SFSRoomSettings.PASSWORD_STATE_CHANGE);
/*     */       }
/* 102 */       if (((Boolean)permissions.get(2)).booleanValue()) {
/* 103 */         roomFlags.add(SFSRoomSettings.PUBLIC_MESSAGES);
/*     */       }
/* 105 */       if (((Boolean)permissions.get(3)).booleanValue()) {
/* 106 */         roomFlags.add(SFSRoomSettings.CAPACITY_CHANGE);
/*     */       }
/*     */ 
/*     */     }
/*     */     else
/*     */     {
/* 112 */       roomFlags = Collections.synchronizedSet(EnumSet.of(SFSRoomSettings.PUBLIC_MESSAGES));
/*     */     }
/*     */ 
/* 116 */     if ((events != null) && (events.size() == 4))
/*     */     {
/* 118 */       if (((Boolean)events.get(0)).booleanValue()) {
/* 119 */         roomFlags.add(SFSRoomSettings.USER_ENTER_EVENT);
/*     */       }
/* 121 */       if (((Boolean)events.get(1)).booleanValue()) {
/* 122 */         roomFlags.add(SFSRoomSettings.USER_EXIT_EVENT);
/*     */       }
/* 124 */       if (((Boolean)events.get(2)).booleanValue()) {
/* 125 */         roomFlags.add(SFSRoomSettings.USER_COUNT_CHANGE_EVENT);
/*     */       }
/* 127 */       if (((Boolean)events.get(3)).booleanValue()) {
/* 128 */         roomFlags.add(SFSRoomSettings.USER_VARIABLES_UPDATE_EVENT);
/*     */       }
/*     */ 
/*     */     }
/*     */     else
/*     */     {
/* 134 */       roomFlags.add(SFSRoomSettings.USER_ENTER_EVENT);
/* 135 */       roomFlags.add(SFSRoomSettings.USER_EXIT_EVENT);
/* 136 */       roomFlags.add(SFSRoomSettings.USER_VARIABLES_UPDATE_EVENT);
/* 137 */       roomFlags.add(SFSRoomSettings.USER_COUNT_CHANGE_EVENT);
/*     */     }
/*     */ 
/* 141 */     CreateRoomSettings params = new CreateRoomSettings();
/* 142 */     params.setName(name);
/* 143 */     params.setGroupId(groupId);
/* 144 */     params.setPassword(pass);
/* 145 */     params.setGame(isGame);
/* 146 */     params.setMaxUsers(maxUsers);
/* 147 */     params.setMaxSpectators(maxSpect);
/* 148 */     params.setMaxVariablesAllowed(maxVars);
/* 149 */     params.setRoomSettings(roomFlags);
/* 150 */     params.setDynamic(true);
/* 151 */     params.setAutoRemoveMode(SFSRoomRemoveMode.DEFAULT);
/*     */ 
/* 154 */     ISFSArray varArray = sfso.getSFSArray("rv");
/* 155 */     if (varArray != null)
/*     */     {
/* 157 */       List roomVariables = processRoomVariables(request.getSender(), varArray);
/*     */ 
/* 160 */       if (maxVars > roomVariables.size()) {
/* 161 */         maxVars = roomVariables.size();
/*     */       }
/* 163 */       params.setRoomVariables(roomVariables);
/*     */     }
/*     */ 
/* 167 */     if ((!sfso.isNull("xn")) && (!sfso.isNull("xc")))
/*     */     {
/* 169 */       CreateRoomSettings.RoomExtensionSettings extension = new CreateRoomSettings.RoomExtensionSettings(
/* 170 */         sfso.getUtfString("xn"), 
/* 171 */         sfso.getUtfString("xc"));
/*     */ 
/* 174 */       if (sfso.containsKey("xp")) {
/* 175 */         extension.setPropertiesFile(sfso.getUtfString("xp"));
/*     */       }
/* 177 */       params.setExtension(extension);
/*     */     }
/*     */ 
/* 188 */     user.updateLastRequestTime();
/*     */ 
/* 190 */     return params;
/*     */   }
/*     */ 
/*     */   public void execute(IRequest request)
/*     */     throws Exception
/*     */   {
/* 196 */     ISFSObject sfso = (ISFSObject)request.getContent();
/* 197 */     CreateRoomSettings params = (CreateRoomSettings)preProcess(request);
/* 198 */     User user = this.api.getUserBySession(request.getSender());
/*     */ 
/* 200 */     Room roomToLeave = null;
/* 201 */     if (sfso.containsKey("rl")) {
/* 202 */       roomToLeave = user.getZone().getRoomById(sfso.getInt("rl").intValue());
/*     */     }
/*     */ 
/* 205 */     Room newRoom = this.api.createRoom(
/* 207 */       user.getZone(), 
/* 208 */       params, 
/* 209 */       user, 
/* 210 */       sfso.getBool("aj").booleanValue(), 
/* 211 */       roomToLeave);
/*     */ 
/* 214 */     if (this.logger.isDebugEnabled())
/* 215 */       this.logger.debug(newRoom.getDump());
/*     */   }
/*     */ 
/*     */   private void validateGroupId(ISession session, String groupId)
/*     */     throws SFSRequestValidationException
/*     */   {
/* 224 */     User sender = this.sfs.getUserManager().getUserBySession(session);
/*     */ 
/* 227 */     if (sender == null) {
/* 228 */       throw new SFSRequestValidationException("User not found! Session: " + session);
/*     */     }
/*     */ 
/* 231 */     if (!sender.getZone().containsPublicGroup(groupId))
/* 232 */       throw new SFSRequestValidationException("Requested groupId is not available: " + groupId);
/*     */   }
/*     */ 
/*     */   private List<RoomVariable> processRoomVariables(ISession session, ISFSArray varArray)
/*     */   {
/* 241 */     User sender = this.sfs.getUserManager().getUserBySession(session);
/*     */ 
/* 244 */     if (sender == null) {
/* 245 */       throw new SFSRuntimeException("Room Creation failed. The requester session is not a User. Session: " + session);
/*     */     }
/* 247 */     int maxRoomVars = sender.getZone().getMaxRoomVariablesAllowed();
/* 248 */     List roomVars = new ArrayList();
/*     */ 
/* 251 */     int loopEnd = varArray.size() < maxRoomVars ? varArray.size() : maxRoomVars;
/*     */ 
/* 259 */     for (int j = 0; j < loopEnd; j++)
/*     */     {
/* 261 */       roomVars.add(SFSRoomVariable.newFromSFSArray(varArray.getSFSArray(j)));
/*     */     }
/*     */ 
/* 264 */     return roomVars;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.system.CreateRoom
 * JD-Core Version:    0.6.0
 */