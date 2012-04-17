package com.smartfoxserver.v2.entities;

import com.smartfoxserver.bitswarm.sessions.ISession;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.managers.IUserManager;
import com.smartfoxserver.v2.entities.variables.RoomVariable;
import com.smartfoxserver.v2.exceptions.SFSJoinRoomException;
import com.smartfoxserver.v2.exceptions.SFSRoomException;
import com.smartfoxserver.v2.exceptions.SFSVariableException;
import com.smartfoxserver.v2.extensions.ISFSExtension;
import com.smartfoxserver.v2.util.IPlayerIdGenerator;
import java.util.List;
import java.util.Set;

public abstract interface Room
{
  public abstract int getId();

  public abstract String getGroupId();

  public abstract void setGroupId(String paramString);

  public abstract String getName();

  public abstract void setName(String paramString);

  public abstract String getPassword();

  public abstract void setPassword(String paramString);

  public abstract boolean isPasswordProtected();

  public abstract boolean isPublic();

  public abstract int getCapacity();

  public abstract void setCapacity(int paramInt1, int paramInt2);

  public abstract int getMaxUsers();

  public abstract void setMaxUsers(int paramInt);

  public abstract int getMaxSpectators();

  public abstract void setMaxSpectators(int paramInt);

  public abstract int getMaxRoomVariablesAllowed();

  public abstract void setMaxRoomVariablesAllowed(int paramInt);

  public abstract User getOwner();

  public abstract void setOwner(User paramUser);

  public abstract RoomSize getSize();

  public abstract IUserManager getUserManager();

  public abstract void setUserManager(IUserManager paramIUserManager);

  public abstract Zone getZone();

  public abstract void setZone(Zone paramZone);

  public abstract boolean isDynamic();

  public abstract boolean isGame();

  public abstract boolean isHidden();

  public abstract void setDynamic(boolean paramBoolean);

  public abstract void setGame(boolean paramBoolean);

  public abstract void setGame(boolean paramBoolean, Class<? extends IPlayerIdGenerator> paramClass);

  public abstract void setHidden(boolean paramBoolean);

  public abstract void setFlags(Set<SFSRoomSettings> paramSet);

  public abstract void setFlag(SFSRoomSettings paramSFSRoomSettings, boolean paramBoolean);

  public abstract boolean isFlagSet(SFSRoomSettings paramSFSRoomSettings);

  public abstract SFSRoomRemoveMode getAutoRemoveMode();

  public abstract void setAutoRemoveMode(SFSRoomRemoveMode paramSFSRoomRemoveMode);

  public abstract boolean isEmpty();

  public abstract boolean isFull();

  public abstract boolean isActive();

  public abstract void setActive(boolean paramBoolean);

  public abstract ISFSExtension getExtension();

  public abstract void setExtension(ISFSExtension paramISFSExtension);

  public abstract RoomVariable getVariable(String paramString);

  public abstract List<RoomVariable> getVariables();

  public abstract void setVariable(RoomVariable paramRoomVariable, boolean paramBoolean)
    throws SFSVariableException;

  public abstract void setVariable(RoomVariable paramRoomVariable)
    throws SFSVariableException;

  public abstract void setVariables(List<RoomVariable> paramList, boolean paramBoolean);

  public abstract void setVariables(List<RoomVariable> paramList);

  public abstract List<RoomVariable> getVariablesCreatedByUser(User paramUser);

  public abstract List<RoomVariable> removeVariablesCreatedByUser(User paramUser);

  public abstract void removeVariable(String paramString);

  public abstract boolean containsVariable(String paramString);

  public abstract int getVariablesCount();

  public abstract Object getProperty(Object paramObject);

  public abstract void setProperty(Object paramObject1, Object paramObject2);

  public abstract boolean containsProperty(Object paramObject);

  public abstract void removeProperty(Object paramObject);

  public abstract User getUserById(int paramInt);

  public abstract User getUserByName(String paramString);

  public abstract User getUserBySession(ISession paramISession);

  public abstract User getUserByPlayerId(int paramInt);

  public abstract List<User> getUserList();

  public abstract List<User> getPlayersList();

  public abstract List<User> getSpectatorsList();

  public abstract List<ISession> getSessionList();

  public abstract ISFSArray getUserListData();

  public abstract ISFSArray getRoomVariablesData(boolean paramBoolean);

  public abstract void addUser(User paramUser, boolean paramBoolean)
    throws SFSJoinRoomException;

  public abstract void addUser(User paramUser)
    throws SFSJoinRoomException;

  public abstract void removeUser(User paramUser);

  public abstract boolean containsUser(User paramUser);

  public abstract boolean containsUser(String paramString);

  public abstract ISFSArray toSFSArray(boolean paramBoolean);

  public abstract void switchPlayerToSpectator(User paramUser)
    throws SFSRoomException;

  public abstract void switchSpectatorToPlayer(User paramUser)
    throws SFSRoomException;

  public abstract boolean isUseWordsFilter();

  public abstract void setUseWordsFilter(boolean paramBoolean);

  public abstract String getDump();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.Room
 * JD-Core Version:    0.6.0
 */