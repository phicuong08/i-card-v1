package com.smartfoxserver.v2.entities.variables;

public abstract interface UserVariable extends Variable
{
  public abstract void setHidden(boolean paramBoolean);

  public abstract boolean isHidden();

  public abstract void setNull();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.variables.UserVariable
 * JD-Core Version:    0.6.0
 */