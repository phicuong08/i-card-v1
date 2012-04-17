package com.smartfoxserver.v2.util;

public abstract interface IResponseThrottler
{
  public abstract void enqueueResponse(Object paramObject);

  public abstract void setInterval(int paramInt);

  public abstract int getInterval();

  public abstract String getName();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.IResponseThrottler
 * JD-Core Version:    0.6.0
 */