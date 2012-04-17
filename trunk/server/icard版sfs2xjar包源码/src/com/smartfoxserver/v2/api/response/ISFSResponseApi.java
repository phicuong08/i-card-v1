package com.smartfoxserver.v2.api.response;

import com.smartfoxserver.bitswarm.sessions.ISession;
import com.smartfoxserver.v2.controllers.SystemRequest;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.Zone;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.variables.RoomVariable;
import com.smartfoxserver.v2.entities.variables.UserVariable;
import com.smartfoxserver.v2.exceptions.SFSErrorData;
import com.smartfoxserver.v2.exceptions.SFSException;
import com.smartfoxserver.v2.util.IDisconnectionReason;
import java.util.Collection;
import java.util.List;

public abstract interface ISFSResponseApi
{
  public abstract void sendExtResponse(String paramString, ISFSObject paramISFSObject, List<ISession> paramList, Room paramRoom, boolean paramBoolean);

  public abstract void sendPingPongResponse(ISession paramISession);

  public abstract void notifyRoomAdded(Room paramRoom);

  public abstract void notifyRoomRemoved(Room paramRoom);

  public abstract void notifyJoinRoomSuccess(User paramUser, Room paramRoom);

  public abstract void notifyUserExitRoom(User paramUser, Room paramRoom, boolean paramBoolean);

  public abstract void notifyUserLost(User paramUser, List<Room> paramList);

  public abstract void notifyUserCountChange(Zone paramZone, Room paramRoom);

  public abstract void notifyUserEnterRoom(User paramUser, Room paramRoom);

  public abstract void notifyRoomVariablesUpdate(Room paramRoom, List<RoomVariable> paramList);

  public abstract void notifyUserVariablesUpdate(User paramUser, List<UserVariable> paramList);

  public abstract void notifyGroupSubscribeSuccess(User paramUser, String paramString);

  public abstract void notifyGroupUnsubscribeSuccess(User paramUser, String paramString);

  public abstract void notifyClientSideDisconnection(User paramUser, IDisconnectionReason paramIDisconnectionReason);

  public abstract void notifyRoomNameChange(Room paramRoom);

  public abstract void notifyRoomPasswordChange(Room paramRoom, User paramUser, boolean paramBoolean);

  public abstract void notifyRoomCapacityChange(Room paramRoom);

  public abstract void notifyLogout(ISession paramISession, String paramString);

  public abstract void notifySpectatorToPlayer(ISession paramISession, Room paramRoom, int paramInt1, int paramInt2);

  public abstract void notifyPlayerToSpectator(ISession paramISession, Room paramRoom, int paramInt);

  public abstract void notifyFilteredRoomList(ISession paramISession, Collection<Room> paramCollection);

  public abstract void notifyFilteredUserList(ISession paramISession, Collection<User> paramCollection);

  public abstract void notifyRequestError(SFSErrorData paramSFSErrorData, User paramUser, SystemRequest paramSystemRequest);

  public abstract void notifyRequestError(SFSException paramSFSException, User paramUser, SystemRequest paramSystemRequest);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.response.ISFSResponseApi
 * JD-Core Version:    0.6.0
 */