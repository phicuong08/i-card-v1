package com.smartfoxserver.v2.entities;

import com.smartfoxserver.bitswarm.sessions.ISession;
import com.smartfoxserver.v2.buddylist.BuddyProperties;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.variables.UserVariable;
import com.smartfoxserver.v2.exceptions.SFSVariableException;
import com.smartfoxserver.v2.util.IDisconnectionReason;
import java.util.List;
import java.util.Map;

public abstract interface User
{
  public abstract int getId();

  public abstract ISession getSession();

  public abstract String getIpAddress();

  public abstract String getName();

  public abstract BuddyProperties getBuddyProperties();

  public abstract void setName(String paramString);

  public abstract boolean isLocal();

  public abstract boolean isNpc();

  public abstract long getLoginTime();

  public abstract void setLastLoginTime(long paramLong);

  public abstract Room getLastJoinedRoom();

  public abstract List<Room> getJoinedRooms();

  public abstract void addJoinedRoom(Room paramRoom);

  public abstract void removeJoinedRoom(Room paramRoom);

  public abstract boolean isJoinedInRoom(Room paramRoom);

  public abstract void addCreatedRoom(Room paramRoom);

  public abstract void removeCreatedRoom(Room paramRoom);

  public abstract List<Room> getCreatedRooms();

  public abstract void subscribeGroup(String paramString);

  public abstract void unsubscribeGroup(String paramString);

  public abstract List<String> getSubscribedGroups();

  public abstract boolean isSubscribedToGroup(String paramString);

  public abstract Zone getZone();

  public abstract void setZone(Zone paramZone);

  public abstract int getPlayerId();

  public abstract int getPlayerId(Room paramRoom);

  public abstract void setPlayerId(int paramInt, Room paramRoom);

  public abstract Map<Room, Integer> getPlayerIds();

  public abstract boolean isPlayer();

  public abstract boolean isSpectator();

  public abstract boolean isPlayer(Room paramRoom);

  public abstract boolean isSpectator(Room paramRoom);

  public abstract boolean isJoining();

  public abstract void setJoining(boolean paramBoolean);

  public abstract boolean isConnected();

  public abstract void setConnected(boolean paramBoolean);

  public abstract boolean isSuperUser();

  public abstract int getMaxAllowedVariables();

  public abstract void setMaxAllowedVariables(int paramInt);

  public abstract Object getProperty(Object paramObject);

  public abstract void setProperty(Object paramObject1, Object paramObject2);

  public abstract boolean containsProperty(Object paramObject);

  public abstract void removeProperty(Object paramObject);

  public abstract int getOwnedRoomsCount();

  public abstract boolean isBeingKicked();

  public abstract void setBeingKicked(boolean paramBoolean);

  public abstract short getPrivilegeId();

  public abstract void setPrivilegeId(short paramShort);

  public abstract UserVariable getVariable(String paramString);

  public abstract List<UserVariable> getVariables();

  public abstract void setVariable(UserVariable paramUserVariable)
    throws SFSVariableException;

  public abstract void setVariables(List<UserVariable> paramList)
    throws SFSVariableException;

  public abstract void removeVariable(String paramString);

  public abstract boolean containsVariable(String paramString);

  public abstract int getVariablesCount();

  public abstract int getBadWordsWarnings();

  public abstract void setBadWordsWarnings(int paramInt);

  public abstract int getFloodWarnings();

  public abstract void setFloodWarnings(int paramInt);

  public abstract long getLastRequestTime();

  public abstract void setLastRequestTime(long paramLong);

  public abstract void updateLastRequestTime();

  public abstract ISFSArray getUserVariablesData();

  public abstract ISFSArray toSFSArray(Room paramRoom);

  public abstract ISFSArray toSFSArray();

  public abstract void disconnect(IDisconnectionReason paramIDisconnectionReason);

  public abstract String getDump();

  public abstract int getReconnectionSeconds();

  public abstract void setReconnectionSeconds(int paramInt);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.User
 * JD-Core Version:    0.6.0
 */