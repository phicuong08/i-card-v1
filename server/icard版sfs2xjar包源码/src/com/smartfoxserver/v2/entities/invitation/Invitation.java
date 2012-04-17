package com.smartfoxserver.v2.entities.invitation;

import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;

public abstract interface Invitation
{
  public abstract int getId();

  public abstract User getInviter();

  public abstract User getInvitee();

  public abstract boolean isExpired();

  public abstract int getExpiryTime();

  public abstract int getSecondsForAnswer();

  public abstract InvitationCallback getCallback();

  public abstract void setCallback(InvitationCallback paramInvitationCallback);

  public abstract ISFSObject getParams();

  public abstract void setParams(ISFSObject paramISFSObject);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.invitation.Invitation
 * JD-Core Version:    0.6.0
 */