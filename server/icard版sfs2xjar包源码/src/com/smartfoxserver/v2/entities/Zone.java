package com.smartfoxserver.v2.entities;

import com.smartfoxserver.bitswarm.sessions.ISession;
import com.smartfoxserver.v2.api.CreateRoomSettings;
import com.smartfoxserver.v2.buddylist.BuddyListManager;
import com.smartfoxserver.v2.db.IDBManager;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.managers.IUserManager;
import com.smartfoxserver.v2.entities.managers.IZoneManager;
import com.smartfoxserver.v2.exceptions.SFSCreateRoomException;
import com.smartfoxserver.v2.exceptions.SFSException;
import com.smartfoxserver.v2.exceptions.SFSLoginException;
import com.smartfoxserver.v2.exceptions.SFSRoomException;
import com.smartfoxserver.v2.exceptions.SFSTooManyRoomsException;
import com.smartfoxserver.v2.extensions.ISFSExtension;
import com.smartfoxserver.v2.security.PrivilegeManager;
import com.smartfoxserver.v2.util.IFloodFilter;
import com.smartfoxserver.v2.util.IResponseThrottler;
import com.smartfoxserver.v2.util.IWordFilter;
import java.util.Collection;
import java.util.List;
import java.util.Set;

public abstract interface Zone
{
  public abstract IUserManager getUserManager();

  public abstract boolean isActive();

  public abstract void setActive(boolean paramBoolean);

  public abstract void setId(int paramInt);

  public abstract String getName();

  public abstract int getId();

  public abstract int getMaxAllowedUsers();

  public abstract void setMaxAllowedUsers(int paramInt);

  public abstract int getMaxAllowedRooms();

  public abstract void setMaxAllowedRooms(int paramInt);

  public abstract int getMaxRoomsCreatedPerUserLimit();

  public abstract void setMaxRoomsCreatedPerUserLimit(int paramInt);

  public abstract int getMaxUserVariablesAllowed();

  public abstract void setMaxUserVariablesAllowed(int paramInt);

  public abstract int getMaxRoomVariablesAllowed();

  public abstract void setMaxRoomVariablesAllowed(int paramInt);

  public abstract int getMinRoomNameChars();

  public abstract void setMinRoomNameChars(int paramInt);

  public abstract int getMaxRoomNameChars();

  public abstract void setMaxRoomNameChars(int paramInt);

  public abstract int getUserCountChangeUpdateInterval();

  public abstract void setUserCountChangeUpdateInterval(int paramInt);

  public abstract int getMaxUserIdleTime();

  public abstract void setMaxUserIdleTime(int paramInt);

  public abstract boolean isCustomLogin();

  public abstract boolean isForceLogout();

  public abstract void setForceLogout(boolean paramBoolean);

  public abstract void setCustomLogin(boolean paramBoolean);

  public abstract boolean isGuestUserAllowed();

  public abstract void setGuestUserAllowed(boolean paramBoolean);

  public abstract boolean isFilterUserNames();

  public abstract void setFilterUserNames(boolean paramBoolean);

  public abstract boolean isFilterRoomNames();

  public abstract void setFilterRoomNames(boolean paramBoolean);

  public abstract boolean isFilterPrivateMessages();

  public abstract void setFilterPrivateMessages(boolean paramBoolean);

  public abstract boolean isFilterBuddyMessages();

  public abstract void setFilterBuddyMessages(boolean paramBoolean);

  public abstract int getUserReconnectionSeconds();

  public abstract void setUserReconnectionSeconds(int paramInt);

  public abstract String getGuestUserNamePrefix();

  public abstract void setGuestUserNamePrefix(String paramString);

  public abstract String getDefaultPlayerIdGeneratorClassName();

  public abstract void setDefaultPlayerIdGeneratorClassName(String paramString);

  public abstract List<String> getPublicGroups();

  public abstract void setPublicGroups(List<String> paramList);

  public abstract List<String> getGroups();

  public abstract List<String> getDefaultGroups();

  public abstract void setDefaultGroups(List<String> paramList);

  public abstract PrivilegeManager getPrivilegeManager();

  public abstract void setPrivilegeManager(PrivilegeManager paramPrivilegeManager);

  public abstract int getUserCount();

  public abstract Room createRoom(CreateRoomSettings paramCreateRoomSettings)
    throws SFSCreateRoomException;

  public abstract Room createRoom(CreateRoomSettings paramCreateRoomSettings, User paramUser)
    throws SFSCreateRoomException;

  public abstract boolean isClientAllowedToOverridRoomEvents();

  public abstract void setClientAllowedToOverridRoomEvents(boolean paramBoolean);

  public abstract void registerEventsForRoomGroup(String paramString, Set<SFSRoomEvents> paramSet);

  public abstract boolean isGroupEventSet(String paramString, SFSRoomEvents paramSFSRoomEvents);

  public abstract Set<SFSRoomEvents> getGroupEvents(String paramString);

  public abstract boolean containsGroup(String paramString);

  public abstract boolean containsPublicGroup(String paramString);

  public abstract Object getProperty(Object paramObject);

  public abstract void setProperty(Object paramObject1, Object paramObject2);

  public abstract boolean containsProperty(Object paramObject);

  public abstract void removeProperty(Object paramObject);

  public abstract IZoneManager getZoneManager();

  public abstract void setZoneManager(IZoneManager paramIZoneManager);

  public abstract List<Room> getRoomList();

  public abstract List<Room> getRoomListFromGroup(String paramString);

  public abstract Room getRoomById(int paramInt);

  public abstract Room getRoomByName(String paramString);

  public abstract void addRoom(Room paramRoom)
    throws SFSTooManyRoomsException;

  public abstract void removeRoom(Room paramRoom);

  public abstract void removeRoom(int paramInt);

  public abstract void removeRoom(String paramString);

  public abstract void checkAndRemove(Room paramRoom);

  public abstract void changeRoomName(Room paramRoom, String paramString)
    throws SFSRoomException;

  public abstract void changeRoomPasswordState(Room paramRoom, String paramString);

  public abstract void changeRoomCapacity(Room paramRoom, int paramInt1, int paramInt2);

  public abstract void validateUserName(String paramString)
    throws SFSException;

  public abstract User getUserById(int paramInt);

  public abstract User getUserByName(String paramString);

  public abstract User getUserBySession(ISession paramISession);

  public abstract Collection<User> getUsersInGroup(String paramString);

  public abstract Collection<ISession> getSessionsInGroup(String paramString);

  public abstract Collection<ISession> getSessionsListeningToGroup(String paramString);

  public abstract Collection<ISession> getSessionList();

  public abstract Collection<User> getUserList();

  public abstract void removeAllUsers();

  public abstract void removeUser(int paramInt);

  public abstract void removeUser(String paramString);

  public abstract void removeUser(ISession paramISession);

  public abstract void removeUser(User paramUser);

  public abstract void removeUserFromRoom(User paramUser, Room paramRoom);

  public abstract IResponseThrottler getUCountThrottler();

  public abstract IWordFilter getWordFilter();

  public abstract IFloodFilter getFloodFilter();

  public abstract ISFSExtension getExtension();

  public abstract void setExtension(ISFSExtension paramISFSExtension);

  public abstract IDBManager getDBManager();

  public abstract void setDBManager(IDBManager paramIDBManager);

  public abstract void addDisabledSystemEvent(String paramString);

  public abstract void removeDisabledSystemEvent(String paramString);

  public abstract boolean isSystemEventAllowed(String paramString);

  public abstract User login(ISession paramISession, String paramString1, String paramString2)
    throws SFSLoginException;

  public abstract User login(ISession paramISession, String paramString1, String paramString2, boolean paramBoolean)
    throws SFSLoginException;

  public abstract ISFSArray getRoomListData();

  public abstract ISFSArray getRoomListData(List<String> paramList);

  public abstract BuddyListManager getBuddyListManager();

  public abstract void setBuddyListManager(BuddyListManager paramBuddyListManager);

  public abstract String getDump();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.Zone
 * JD-Core Version:    0.6.0
 */