/*     */ package com.smartfoxserver.v2.api.response;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.data.TransportType;
/*     */ import com.smartfoxserver.bitswarm.io.IResponse;
/*     */ import com.smartfoxserver.bitswarm.io.Response;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.v2.config.DefaultConstants;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.RoomSize;
/*     */ import com.smartfoxserver.v2.entities.SFSRoomSettings;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import com.smartfoxserver.v2.entities.variables.RoomVariable;
/*     */ import com.smartfoxserver.v2.entities.variables.UserVariable;
/*     */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*     */ import com.smartfoxserver.v2.exceptions.IErrorCode;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorData;
/*     */ import com.smartfoxserver.v2.exceptions.SFSException;
/*     */ import com.smartfoxserver.v2.util.IDisconnectionReason;
/*     */ import com.smartfoxserver.v2.util.IResponseThrottler;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Arrays;
/*     */ import java.util.Collection;
/*     */ import java.util.HashSet;
/*     */ import java.util.List;
/*     */ import java.util.Set;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSResponseApi
/*     */   implements ISFSResponseApi
/*     */ {
/*     */   private final Logger log;
/*  58 */   private final int SEARCH_RESULT_LIMIT = 50;
/*     */ 
/*     */   public SFSResponseApi()
/*     */   {
/*  62 */     this.log = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ 
/*     */   public void sendExtResponse(String cmdName, ISFSObject params, List<ISession> recipients, Room room, boolean sendUDP)
/*     */   {
/*  68 */     ISFSObject resObj = SFSObject.newInstance();
/*  69 */     resObj.putUtfString("c", cmdName);
/*  70 */     resObj.putSFSObject("p", params != null ? params : new SFSObject());
/*     */ 
/*  72 */     if (room != null) {
/*  73 */       resObj.putInt("r", room.getId());
/*     */     }
/*     */ 
/*  76 */     IResponse response = new Response();
/*  77 */     response.setId(SystemRequest.CallExtension.getId());
/*  78 */     response.setTargetController(DefaultConstants.CORE_EXTENSIONS_CONTROLLER_ID);
/*  79 */     response.setContent(resObj);
/*  80 */     response.setRecipients(recipients);
/*     */ 
/*  83 */     if (sendUDP) {
/*  84 */       response.setTransportType(TransportType.UDP);
/*     */     }
/*  86 */     response.write();
/*     */   }
/*     */ 
/*     */   public void sendPingPongResponse(ISession recipient)
/*     */   {
/*  93 */     IResponse response = new Response();
/*  94 */     response.setId(SystemRequest.PingPong.getId());
/*  95 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/*  96 */     response.setContent(new SFSObject());
/*  97 */     response.setRecipients(recipient);
/*     */ 
/*  99 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyRoomAdded(Room newRoom)
/*     */   {
/* 108 */     Collection recipients = newRoom.getZone().getSessionsListeningToGroup(newRoom.getGroupId());
/*     */ 
/* 111 */     ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 114 */     IResponse response = new Response();
/* 115 */     response.setId(SystemRequest.CreateRoom.getId());
/* 116 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 117 */     response.setContent(resObj);
/* 118 */     response.setRecipients(recipients);
/*     */ 
/* 120 */     resObj.putSFSArray("r", newRoom.toSFSArray(true));
/*     */ 
/* 123 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyRoomRemoved(Room room)
/*     */   {
/* 129 */     Collection recipients = room.getZone().getSessionsListeningToGroup(room.getGroupId());
/*     */ 
/* 131 */     if (recipients.size() > 0)
/*     */     {
/* 134 */       ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 137 */       IResponse response = new Response();
/* 138 */       response.setId(SystemRequest.OnRoomLost.getId());
/* 139 */       response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 140 */       response.setContent(resObj);
/* 141 */       response.setRecipients(recipients);
/*     */ 
/* 143 */       resObj.putInt("r", room.getId());
/*     */ 
/* 146 */       response.write();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void notifyJoinRoomSuccess(User recipient, Room joinedRoom)
/*     */   {
/* 154 */     ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 157 */     IResponse response = new Response();
/* 158 */     response.setId(SystemRequest.JoinRoom.getId());
/* 159 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 160 */     response.setContent(resObj);
/* 161 */     response.setRecipients(recipient.getSession());
/*     */ 
/* 164 */     resObj.putSFSArray("r", joinedRoom.toSFSArray(false));
/*     */ 
/* 167 */     resObj.putSFSArray("ul", joinedRoom.getUserListData());
/*     */ 
/* 171 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyUserExitRoom(User user, Room room, boolean sendToEveryOne)
/*     */   {
/* 177 */     List recipients = new ArrayList();
/*     */ 
/* 180 */     if (sendToEveryOne) {
/* 181 */       recipients.addAll(room.getSessionList());
/*     */     }
/*     */ 
/* 184 */     recipients.add(user.getSession());
/*     */ 
/* 187 */     ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 190 */     IResponse response = new Response();
/* 191 */     response.setId(SystemRequest.OnUserExitRoom.getId());
/* 192 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 193 */     response.setContent(resObj);
/* 194 */     response.setRecipients(recipients);
/*     */ 
/* 197 */     resObj.putInt("u", user.getId());
/* 198 */     resObj.putInt("r", room.getId());
/*     */ 
/* 201 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyUserLost(User user, List<Room> joinedRooms)
/*     */   {
/* 208 */     Set recipients = new HashSet();
/*     */ 
/* 210 */     for (Room room : joinedRooms)
/*     */     {
/* 212 */       if (room.isFlagSet(SFSRoomSettings.USER_EXIT_EVENT)) {
/* 213 */         recipients.addAll(room.getSessionList());
/*     */       }
/*     */     }
/* 216 */     if (recipients.size() > 0)
/*     */     {
/* 219 */       ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 222 */       Object response = new Response();
/* 223 */       ((IResponse)response).setId(SystemRequest.OnUserLost.getId());
/* 224 */       ((IResponse)response).setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 225 */       ((IResponse)response).setContent(resObj);
/* 226 */       ((IResponse)response).setRecipients(recipients);
/*     */ 
/* 229 */       resObj.putInt("u", user.getId());
/*     */ 
/* 232 */       ((IResponse)response).write();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void notifyUserCountChange(Zone zone, Room room)
/*     */   {
/* 244 */     if (!room.isFlagSet(SFSRoomSettings.USER_COUNT_CHANGE_EVENT)) {
/* 245 */       return;
/*     */     }
/* 247 */     String groupId = room.getGroupId();
/*     */ 
/* 255 */     Collection recipients = zone.getSessionsListeningToGroup(groupId);
/*     */ 
/* 257 */     if (recipients.size() > 0)
/*     */     {
/* 260 */       ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 263 */       RoomSize roomSize = room.getSize();
/* 264 */       resObj.putInt("r", room.getId());
/*     */ 
/* 267 */       resObj.putShort("uc", (short)roomSize.getUserCount());
/*     */ 
/* 270 */       if (room.isGame()) {
/* 271 */         resObj.putShort("sc", (short)roomSize.getSpectatorCount());
/*     */       }
/*     */ 
/* 274 */       IResponse response = new Response();
/* 275 */       response.setId(SystemRequest.OnRoomCountChange.getId());
/* 276 */       response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 277 */       response.setContent(resObj);
/* 278 */       response.setRecipients(recipients);
/*     */ 
/* 281 */       zone.getUCountThrottler().enqueueResponse(response);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void notifyUserEnterRoom(User user, Room room)
/*     */   {
/* 289 */     if (!room.isFlagSet(SFSRoomSettings.USER_ENTER_EVENT)) {
/* 290 */       return;
/*     */     }
/*     */ 
/* 293 */     List recipients = room.getSessionList();
/* 294 */     recipients.remove(user.getSession());
/*     */ 
/* 296 */     if (recipients.size() > 0)
/*     */     {
/* 299 */       ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 302 */       resObj.putInt("r", room.getId());
/* 303 */       resObj.putSFSArray("u", user.toSFSArray(room));
/*     */ 
/* 306 */       IResponse response = new Response();
/* 307 */       response.setId(SystemRequest.OnEnterRoom.getId());
/* 308 */       response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 309 */       response.setContent(resObj);
/* 310 */       response.setRecipients(recipients);
/*     */ 
/* 312 */       response.write();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void notifyRoomVariablesUpdate(Room targetRoom, List<RoomVariable> listOfChanges)
/*     */   {
/* 319 */     List roomRecipients = targetRoom.getSessionList();
/* 320 */     IResponse response = null;
/*     */ 
/* 323 */     ISFSObject roomResponseObj = SFSObject.newInstance();
/*     */ 
/* 325 */     ISFSArray roomVariablesData = SFSArray.newInstance();
/* 326 */     ISFSArray zoneVariablesData = SFSArray.newInstance();
/*     */ 
/* 328 */     for (RoomVariable var : listOfChanges)
/*     */     {
/* 331 */       if (var.isHidden()) {
/*     */         continue;
/*     */       }
/* 334 */       ISFSArray varData = var.toSFSArray();
/*     */ 
/* 337 */       if (var.isGlobal()) {
/* 338 */         zoneVariablesData.addSFSArray(varData);
/*     */       }
/*     */ 
/* 341 */       roomVariablesData.addSFSArray(varData);
/*     */     }
/*     */ 
/* 344 */     if (roomVariablesData.size() > 0)
/*     */     {
/* 347 */       roomResponseObj.putInt("r", targetRoom.getId());
/*     */ 
/* 349 */       roomResponseObj.putSFSArray("vl", roomVariablesData);
/*     */ 
/* 352 */       response = new Response();
/* 353 */       response.setId(SystemRequest.SetRoomVariables.getId());
/* 354 */       response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 355 */       response.setContent(roomResponseObj);
/* 356 */       response.setRecipients(roomRecipients);
/*     */ 
/* 358 */       this.log.info("Room Recipients: " + roomRecipients);
/*     */ 
/* 361 */       response.write();
/*     */     }
/*     */ 
/* 367 */     if (zoneVariablesData.size() > 0)
/*     */     {
/* 369 */       Zone zone = targetRoom.getZone();
/*     */ 
/* 372 */       Collection globalRecipients = zone.getSessionsListeningToGroup(targetRoom.getGroupId());
/*     */ 
/* 375 */       globalRecipients.removeAll(roomRecipients);
/*     */ 
/* 377 */       ISFSObject zoneResponseObj = SFSObject.newInstance();
/* 378 */       zoneResponseObj.putInt("r", targetRoom.getId());
/* 379 */       zoneResponseObj.putSFSArray("vl", zoneVariablesData);
/*     */ 
/* 382 */       response = new Response();
/* 383 */       response.setId(SystemRequest.SetRoomVariables.getId());
/* 384 */       response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 385 */       response.setContent(zoneResponseObj);
/* 386 */       response.setRecipients(globalRecipients);
/* 387 */       this.log.info("Global Recipients: " + globalRecipients);
/*     */ 
/* 389 */       response.write();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void notifyUserVariablesUpdate(User user, List<UserVariable> varList)
/*     */   {
/* 399 */     List allRooms = user.getJoinedRooms();
/* 400 */     Collection recipients = null;
/*     */ 
/* 406 */     if (allRooms.size() == 0)
/*     */     {
/* 408 */       recipients = Arrays.asList(new ISession[] { user.getSession() });
/*     */     }
/* 415 */     else if (allRooms.size() == 1)
/*     */     {
/* 417 */       if (user.getLastJoinedRoom().isFlagSet(SFSRoomSettings.USER_VARIABLES_UPDATE_EVENT)) {
/* 418 */         recipients = user.getLastJoinedRoom().getSessionList();
/*     */       }
/*     */ 
/*     */     }
/*     */     else
/*     */     {
/* 428 */       Set sessionSet = new HashSet();
/*     */ 
/* 430 */       for (Room room : allRooms)
/*     */       {
/* 432 */         if (room.isFlagSet(SFSRoomSettings.USER_VARIABLES_UPDATE_EVENT)) {
/* 433 */           sessionSet.addAll(room.getSessionList());
/*     */         }
/*     */       }
/* 436 */       recipients = sessionSet;
/*     */     }
/*     */ 
/* 441 */     if ((recipients != null) && (recipients.size() > 0))
/*     */     {
/* 444 */       ISFSObject responseObj = SFSObject.newInstance();
/*     */ 
/* 447 */       ISFSArray userVariablesData = SFSArray.newInstance();
/*     */ 
/* 449 */       for (UserVariable var : varList)
/*     */       {
/* 451 */         userVariablesData.addSFSArray(var.toSFSArray());
/*     */       }
/*     */ 
/* 454 */       responseObj.putSFSArray("vl", userVariablesData);
/* 455 */       responseObj.putInt("u", user.getId());
/*     */ 
/* 458 */       Object response = new Response();
/* 459 */       ((IResponse)response).setId(SystemRequest.SetUserVariables.getId());
/* 460 */       ((IResponse)response).setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 461 */       ((IResponse)response).setContent(responseObj);
/* 462 */       ((IResponse)response).setRecipients(recipients);
/*     */ 
/* 465 */       ((IResponse)response).write();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void notifyGroupSubscribeSuccess(User user, String groupId)
/*     */   {
/* 473 */     ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 476 */     resObj.putUtfString("g", groupId);
/*     */ 
/* 479 */     resObj.putSFSArray("rl", user.getZone().getRoomListData(Arrays.asList(new String[] { groupId })));
/*     */ 
/* 482 */     IResponse response = new Response();
/* 483 */     response.setId(SystemRequest.SubscribeRoomGroup.getId());
/* 484 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 485 */     response.setContent(resObj);
/* 486 */     response.setRecipients(user.getSession());
/*     */ 
/* 489 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyGroupUnsubscribeSuccess(User user, String groupId)
/*     */   {
/* 496 */     ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 499 */     resObj.putUtfString("g", groupId);
/*     */ 
/* 502 */     IResponse response = new Response();
/* 503 */     response.setId(SystemRequest.UnsubscribeRoomGroup.getId());
/* 504 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 505 */     response.setContent(resObj);
/* 506 */     response.setRecipients(user.getSession());
/*     */ 
/* 509 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyClientSideDisconnection(User user, IDisconnectionReason reason)
/*     */   {
/* 516 */     ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 519 */     resObj.putByte("dr", reason.getByteValue());
/*     */ 
/* 522 */     IResponse response = new Response();
/* 523 */     response.setId(SystemRequest.OnClientDisconnection.getId());
/* 524 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 525 */     response.setContent(resObj);
/* 526 */     response.setRecipients(user.getSession());
/*     */ 
/* 529 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyRoomNameChange(Room room)
/*     */   {
/* 536 */     ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 539 */     resObj.putInt("r", room.getId());
/* 540 */     resObj.putUtfString("n", room.getName());
/*     */ 
/* 542 */     Zone zone = room.getZone();
/*     */ 
/* 545 */     IResponse response = new Response();
/* 546 */     response.setId(SystemRequest.ChangeRoomName.getId());
/* 547 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 548 */     response.setContent(resObj);
/*     */ 
/* 551 */     response.setRecipients(zone.getSessionsListeningToGroup(room.getGroupId()));
/*     */ 
/* 554 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyRoomPasswordChange(Room room, User sender, boolean isStateChanged)
/*     */   {
/* 569 */     Zone zone = room.getZone();
/*     */ 
/* 572 */     Collection recipients = null;
/*     */ 
/* 575 */     if (isStateChanged) {
/* 576 */       recipients = zone.getSessionsListeningToGroup(room.getGroupId());
/*     */     }
/* 581 */     else if (sender != null) {
/* 582 */       recipients = Arrays.asList(new ISession[] { sender.getSession() });
/*     */     }
/*     */ 
/* 585 */     if (recipients != null)
/*     */     {
/* 588 */       ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 591 */       resObj.putInt("r", room.getId());
/* 592 */       resObj.putBool("p", room.isPasswordProtected());
/*     */ 
/* 595 */       IResponse response = new Response();
/* 596 */       response.setId(SystemRequest.ChangeRoomPassword.getId());
/* 597 */       response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 598 */       response.setContent(resObj);
/*     */ 
/* 601 */       response.setRecipients(recipients);
/*     */ 
/* 604 */       response.write();
/*     */     }
/*     */   }
/*     */ 
/*     */   public void notifyRoomCapacityChange(Room room)
/*     */   {
/* 612 */     ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 615 */     resObj.putInt("r", room.getId());
/* 616 */     resObj.putInt("u", room.getMaxUsers());
/* 617 */     resObj.putInt("s", room.getMaxSpectators());
/*     */ 
/* 619 */     Zone zone = room.getZone();
/*     */ 
/* 622 */     IResponse response = new Response();
/* 623 */     response.setId(SystemRequest.ChangeRoomCapacity.getId());
/* 624 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 625 */     response.setContent(resObj);
/*     */ 
/* 628 */     response.setRecipients(zone.getSessionsListeningToGroup(room.getGroupId()));
/*     */ 
/* 631 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyLogout(ISession recipient, String zoneName)
/*     */   {
/* 638 */     ISFSObject resObj = SFSObject.newInstance();
/* 639 */     resObj.putUtfString("zn", zoneName);
/*     */ 
/* 642 */     IResponse response = new Response();
/* 643 */     response.setId(SystemRequest.Logout.getId());
/* 644 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 645 */     response.setContent(resObj);
/*     */ 
/* 648 */     response.setRecipients(recipient);
/*     */ 
/* 651 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifySpectatorToPlayer(ISession recipient, Room room, int userId, int playerId)
/*     */   {
/* 658 */     ISFSObject resObj = SFSObject.newInstance();
/* 659 */     resObj.putInt("r", room.getId());
/* 660 */     resObj.putInt("u", userId);
/* 661 */     resObj.putShort("p", (short)playerId);
/*     */ 
/* 664 */     IResponse response = new Response();
/* 665 */     response.setId(SystemRequest.SpectatorToPlayer.getId());
/* 666 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 667 */     response.setContent(resObj);
/*     */ 
/* 670 */     response.setRecipients(room.getSessionList());
/*     */ 
/* 673 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyPlayerToSpectator(ISession recipient, Room room, int userId)
/*     */   {
/* 680 */     ISFSObject resObj = SFSObject.newInstance();
/* 681 */     resObj.putInt("r", room.getId());
/* 682 */     resObj.putInt("u", userId);
/*     */ 
/* 685 */     IResponse response = new Response();
/* 686 */     response.setId(SystemRequest.PlayerToSpectator.getId());
/* 687 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 688 */     response.setContent(resObj);
/*     */ 
/* 691 */     response.setRecipients(room.getSessionList());
/*     */ 
/* 694 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyFilteredRoomList(ISession recipient, Collection<Room> roomList)
/*     */   {
/* 701 */     int itemCount = roomList.size();
/* 702 */     if (itemCount > 50)
/*     */     {
/* 704 */       itemCount = 50;
/* 705 */       this.log.info(String.format("FindRooms request returned a too large result set: %s, the limit for a client request is: %s", new Object[] { Integer.valueOf(roomList.size()), Integer.valueOf(50) }));
/*     */     }
/*     */ 
/* 709 */     ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 711 */     ISFSArray roomListData = SFSArray.newInstance();
/*     */ 
/* 713 */     int cnt = 0;
/* 714 */     for (Room room : roomList)
/*     */     {
/* 716 */       if (cnt >= itemCount)
/*     */         break;
/* 718 */       roomListData.addSFSArray(room.toSFSArray(true));
/* 719 */       cnt++;
/*     */     }
/*     */ 
/* 725 */     resObj.putSFSArray("fr", roomListData);
/*     */ 
/* 728 */     IResponse response = new Response();
/* 729 */     response.setId(SystemRequest.FindRooms.getId());
/* 730 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 731 */     response.setContent(resObj);
/*     */ 
/* 734 */     response.setRecipients(recipient);
/*     */ 
/* 737 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyFilteredUserList(ISession recipient, Collection<User> userList)
/*     */   {
/* 744 */     int itemCount = userList.size();
/* 745 */     if (itemCount > 50)
/*     */     {
/* 747 */       itemCount = 50;
/* 748 */       this.log.info(String.format("FindRooms request returned a too large result set: %s, the limit for a client request is: %s", new Object[] { Integer.valueOf(userList.size()), Integer.valueOf(50) }));
/*     */     }
/*     */ 
/* 752 */     ISFSObject resObj = SFSObject.newInstance();
/* 753 */     ISFSArray userListData = SFSArray.newInstance();
/*     */ 
/* 755 */     int cnt = 0;
/* 756 */     for (User user : userList)
/*     */     {
/* 758 */       if (cnt >= itemCount)
/*     */         break;
/* 760 */       userListData.addSFSArray(user.toSFSArray());
/* 761 */       cnt++;
/*     */     }
/*     */ 
/* 768 */     resObj.putSFSArray("fu", userListData);
/*     */ 
/* 771 */     IResponse response = new Response();
/* 772 */     response.setId(SystemRequest.FindUsers.getId());
/* 773 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 774 */     response.setContent(resObj);
/*     */ 
/* 777 */     response.setRecipients(recipient);
/*     */ 
/* 780 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyRequestError(SFSException err, User recipient, SystemRequest requestType)
/*     */   {
/* 788 */     notifyRequestError(err.getErrorData(), recipient, requestType);
/*     */   }
/*     */ 
/*     */   public void notifyRequestError(SFSErrorData errData, User recipient, SystemRequest requestType)
/*     */   {
/* 794 */     if (recipient != null)
/*     */     {
/* 797 */       ISFSObject resObj = SFSObject.newInstance();
/*     */ 
/* 800 */       IResponse response = new Response();
/* 801 */       response.setId(requestType.getId());
/* 802 */       response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 803 */       response.setContent(resObj);
/* 804 */       response.setRecipients(recipient.getSession());
/*     */ 
/* 806 */       resObj.putShort("ec", errData.getCode().getId());
/* 807 */       resObj.putUtfStringArray("ep", errData.getParams());
/*     */ 
/* 809 */       response.write();
/*     */     }
/*     */     else
/*     */     {
/* 815 */       ExceptionMessageComposer composer = new ExceptionMessageComposer(new NullPointerException("Can't send error notification to client."));
/* 816 */       composer.setDescription("Attempting to send: " + errData.getCode() + " in response to: " + requestType);
/* 817 */       composer.setPossibleCauses("Recipient is NULL!");
/* 818 */       this.log.warn(composer.toString());
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.response.SFSResponseApi
 * JD-Core Version:    0.6.0
 */