package com.smartfoxserver.v2.entities.invitation;

import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.exceptions.SFSInvitationException;

public abstract interface InvitationManager
{
  public abstract Invitation findById(int paramInt);

  public abstract void startInvitation(Invitation paramInvitation, InvitationCallback paramInvitationCallback);

  public abstract void suppressInvitation(Invitation paramInvitation);

  public abstract void onInvitationResult(Invitation paramInvitation, InvitationResponse paramInvitationResponse, ISFSObject paramISFSObject)
    throws SFSInvitationException;

  public abstract void onInvitationResult(int paramInt, InvitationResponse paramInvitationResponse, ISFSObject paramISFSObject)
    throws SFSInvitationException;

  public abstract int getMaxInvitationsPerUser();

  public abstract void setMaxInvitationsPerUser(int paramInt);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.invitation.InvitationManager
 * JD-Core Version:    0.6.0
 */