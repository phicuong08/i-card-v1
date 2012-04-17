package com.smartfoxserver.v2.extensions;

import com.smartfoxserver.v2.core.ISFSEvent;
import com.smartfoxserver.v2.exceptions.SFSException;

public abstract interface IServerEventHandler
{
  public abstract void handleServerEvent(ISFSEvent paramISFSEvent)
    throws SFSException;

  public abstract void setParentExtension(SFSExtension paramSFSExtension);

  public abstract SFSExtension getParentExtension();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.IServerEventHandler
 * JD-Core Version:    0.6.0
 */