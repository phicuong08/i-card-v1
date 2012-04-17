package com.smartfoxserver.v2.api;

import com.smartfoxserver.v2.api.response.ISFSGameResponseApi;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.Zone;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.invitation.Invitation;
import com.smartfoxserver.v2.entities.invitation.InvitationCallback;
import com.smartfoxserver.v2.entities.invitation.InvitationResponse;
import com.smartfoxserver.v2.entities.match.MatchExpression;
import com.smartfoxserver.v2.exceptions.SFSCreateRoomException;
import com.smartfoxserver.v2.exceptions.SFSJoinRoomException;
import com.smartfoxserver.v2.game.CreateSFSGameSettings;
import java.util.Collection;
import java.util.List;

public abstract interface ISFSGameApi
{
  public abstract ISFSGameResponseApi getResponseAPI();

  public abstract Room createGame(Zone paramZone, CreateSFSGameSettings paramCreateSFSGameSettings, User paramUser)
    throws SFSCreateRoomException;

  public abstract Room createGame(Zone paramZone, CreateSFSGameSettings paramCreateSFSGameSettings, User paramUser, boolean paramBoolean1, boolean paramBoolean2)
    throws SFSCreateRoomException;

  public abstract Room quickJoinGame(User paramUser, MatchExpression paramMatchExpression, Zone paramZone, String paramString)
    throws SFSJoinRoomException;

  public abstract Room quickJoinGame(User paramUser, MatchExpression paramMatchExpression, Zone paramZone, String paramString, Room paramRoom)
    throws SFSJoinRoomException;

  public abstract Room quickJoinGame(User paramUser, MatchExpression paramMatchExpression, Collection<Room> paramCollection, Room paramRoom)
    throws SFSJoinRoomException;

  public abstract void sendInvitation(Invitation paramInvitation, InvitationCallback paramInvitationCallback);

  public abstract void sendInvitation(User paramUser, List<User> paramList, int paramInt, InvitationCallback paramInvitationCallback, ISFSObject paramISFSObject);

  public abstract void replyToInvitation(User paramUser, int paramInt, InvitationResponse paramInvitationResponse, ISFSObject paramISFSObject, boolean paramBoolean);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.ISFSGameApi
 * JD-Core Version:    0.6.0
 */