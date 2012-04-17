package com.smartfoxserver.v2.entities.invitation;

import com.smartfoxserver.v2.entities.data.ISFSObject;

public abstract interface InvitationCallback
{
  public abstract void onAccepted(Invitation paramInvitation, ISFSObject paramISFSObject);

  public abstract void onRefused(Invitation paramInvitation, ISFSObject paramISFSObject);

  public abstract void onExpired(Invitation paramInvitation);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.invitation.InvitationCallback
 * JD-Core Version:    0.6.0
 */