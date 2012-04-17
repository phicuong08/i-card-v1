package com.smartfoxserver.v2.entities;

public abstract interface Email
{
  public abstract String getFromAddress();

  public abstract String getToAddress();

  public abstract String getSubject();

  public abstract String getMessage();

  public abstract int getPriority();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.Email
 * JD-Core Version:    0.6.0
 */