package com.smartfoxserver.v2.core;

public abstract interface ISFSEventListener
{
  public abstract void handleServerEvent(ISFSEvent paramISFSEvent)
    throws Exception;
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.core.ISFSEventListener
 * JD-Core Version:    0.6.0
 */