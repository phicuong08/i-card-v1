package com.smartfoxserver.v2.api.response;

import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.invitation.Invitation;
import com.smartfoxserver.v2.entities.invitation.InvitationResponse;

public abstract interface ISFSGameResponseApi
{
  public abstract void notifyInivitation(Invitation paramInvitation);

  public abstract void notifyInvitationResponse(Invitation paramInvitation, InvitationResponse paramInvitationResponse, ISFSObject paramISFSObject);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.response.ISFSGameResponseApi
 * JD-Core Version:    0.6.0
 */