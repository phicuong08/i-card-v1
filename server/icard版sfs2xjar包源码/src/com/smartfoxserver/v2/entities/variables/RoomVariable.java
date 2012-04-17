package com.smartfoxserver.v2.entities.variables;

import com.smartfoxserver.v2.entities.User;

public abstract interface RoomVariable extends UserVariable
{
  public abstract boolean isPrivate();

  public abstract boolean isPersistent();

  public abstract boolean isGlobal();

  public abstract void setPrivate(boolean paramBoolean);

  public abstract void setPersistent(boolean paramBoolean);

  public abstract void setGlobal(boolean paramBoolean);

  public abstract User getOwner();

  public abstract void setOwner(User paramUser);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.variables.RoomVariable
 * JD-Core Version:    0.6.0
 */