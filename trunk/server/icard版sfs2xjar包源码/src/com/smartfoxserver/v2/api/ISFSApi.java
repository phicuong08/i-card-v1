package com.smartfoxserver.v2.api;

import com.smartfoxserver.bitswarm.sessions.ISession;
import com.smartfoxserver.v2.api.response.ISFSResponseApi;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.Zone;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.managers.BanMode;
import com.smartfoxserver.v2.entities.match.MatchExpression;
import com.smartfoxserver.v2.entities.variables.RoomVariable;
import com.smartfoxserver.v2.entities.variables.UserVariable;
import com.smartfoxserver.v2.exceptions.SFSBuddyListException;
import com.smartfoxserver.v2.exceptions.SFSCreateRoomException;
import com.smartfoxserver.v2.exceptions.SFSJoinRoomException;
import com.smartfoxserver.v2.exceptions.SFSLoginException;
import com.smartfoxserver.v2.exceptions.SFSRoomException;
import com.smartfoxserver.v2.util.IDisconnectionReason;
import java.util.Collection;
import java.util.List;

public abstract interface ISFSApi
{
  public abstract ISFSResponseApi getResponseAPI();

  public abstract boolean checkSecurePassword(ISession paramISession, String paramString1, String paramString2);

  public abstract User login(ISession paramISession, String paramString1, String paramString2, String paramString3, ISFSObject paramISFSObject);

  public abstract User login(ISession paramISession, String paramString1, String paramString2, String paramString3, ISFSObject paramISFSObject, boolean paramBoolean);

  public abstract void logout(User paramUser);

  public abstract User createNPC(String paramString, Zone paramZone, boolean paramBoolean)
    throws SFSLoginException;

  public abstract void kickUser(User paramUser1, User paramUser2, String paramString, int paramInt);

  public abstract void banUser(User paramUser1, User paramUser2, String paramString, BanMode paramBanMode, int paramInt1, int paramInt2);

  public abstract void disconnectUser(User paramUser);

  public abstract void disconnectUser(User paramUser, IDisconnectionReason paramIDisconnectionReason);

  public abstract void disconnect(ISession paramISession);

  public abstract Room createRoom(Zone paramZone, CreateRoomSettings paramCreateRoomSettings, User paramUser)
    throws SFSCreateRoomException;

  public abstract Room createRoom(Zone paramZone, CreateRoomSettings paramCreateRoomSettings, User paramUser, boolean paramBoolean, Room paramRoom)
    throws SFSCreateRoomException;

  public abstract Room createRoom(Zone paramZone, CreateRoomSettings paramCreateRoomSettings, User paramUser, boolean paramBoolean1, Room paramRoom, boolean paramBoolean2, boolean paramBoolean3)
    throws SFSCreateRoomException;

  public abstract List<User> findUsers(Collection<User> paramCollection, MatchExpression paramMatchExpression, int paramInt);

  public abstract List<Room> findRooms(Collection<Room> paramCollection, MatchExpression paramMatchExpression, int paramInt);

  public abstract User getUserById(int paramInt);

  public abstract User getUserByName(String paramString);

  public abstract User getUserBySession(ISession paramISession);

  public abstract void joinRoom(User paramUser, Room paramRoom)
    throws SFSJoinRoomException;

  public abstract void joinRoom(User paramUser, Room paramRoom1, String paramString, boolean paramBoolean, Room paramRoom2)
    throws SFSJoinRoomException;

  public abstract void joinRoom(User paramUser, Room paramRoom1, String paramString, boolean paramBoolean1, Room paramRoom2, boolean paramBoolean2, boolean paramBoolean3)
    throws SFSJoinRoomException;

  public abstract void leaveRoom(User paramUser, Room paramRoom);

  public abstract void leaveRoom(User paramUser, Room paramRoom, boolean paramBoolean1, boolean paramBoolean2);

  public abstract void removeRoom(Room paramRoom);

  public abstract void removeRoom(Room paramRoom, boolean paramBoolean1, boolean paramBoolean2);

  public abstract void sendPublicMessage(Room paramRoom, User paramUser, String paramString, ISFSObject paramISFSObject);

  public abstract void sendPrivateMessage(User paramUser1, User paramUser2, String paramString, ISFSObject paramISFSObject);

  public abstract void sendBuddyMessage(User paramUser1, User paramUser2, String paramString, ISFSObject paramISFSObject)
    throws SFSBuddyListException;

  public abstract void sendModeratorMessage(User paramUser, String paramString, ISFSObject paramISFSObject, Collection<ISession> paramCollection);

  public abstract void sendAdminMessage(User paramUser, String paramString, ISFSObject paramISFSObject, Collection<ISession> paramCollection);

  public abstract void sendObjectMessage(Room paramRoom, User paramUser, ISFSObject paramISFSObject, Collection<User> paramCollection);

  public abstract void sendExtensionResponse(String paramString, ISFSObject paramISFSObject, List<User> paramList, Room paramRoom, boolean paramBoolean);

  public abstract void sendExtensionResponse(String paramString, ISFSObject paramISFSObject, User paramUser, Room paramRoom, boolean paramBoolean);

  public abstract void setRoomVariables(User paramUser, Room paramRoom, List<RoomVariable> paramList);

  public abstract void setRoomVariables(User paramUser, Room paramRoom, List<RoomVariable> paramList, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3);

  public abstract void setUserVariables(User paramUser, List<UserVariable> paramList);

  public abstract void setUserVariables(User paramUser, List<UserVariable> paramList, boolean paramBoolean1, boolean paramBoolean2);

  public abstract void changeRoomName(User paramUser, Room paramRoom, String paramString)
    throws SFSRoomException;

  public abstract void changeRoomPassword(User paramUser, Room paramRoom, String paramString)
    throws SFSRoomException;

  public abstract void changeRoomCapacity(User paramUser, Room paramRoom, int paramInt1, int paramInt2)
    throws SFSRoomException;

  public abstract void subscribeRoomGroup(User paramUser, String paramString);

  public abstract void unsubscribeRoomGroup(User paramUser, String paramString);

  public abstract void spectatorToPlayer(User paramUser, Room paramRoom, boolean paramBoolean1, boolean paramBoolean2)
    throws SFSRoomException;

  public abstract void playerToSpectator(User paramUser, Room paramRoom, boolean paramBoolean1, boolean paramBoolean2)
    throws SFSRoomException;
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.ISFSApi
 * JD-Core Version:    0.6.0
 */