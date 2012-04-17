package com.smartfoxserver.v2.extensions.filter;

import com.smartfoxserver.v2.core.ISFSEvent;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.exceptions.SFSException;
import com.smartfoxserver.v2.extensions.SFSExtension;

public abstract interface IFilter
{
  public abstract void init(SFSExtension paramSFSExtension);

  public abstract void destroy();

  public abstract FilterAction handleClientRequest(String paramString, User paramUser, ISFSObject paramISFSObject)
    throws SFSException;

  public abstract FilterAction handleServerEvent(ISFSEvent paramISFSEvent)
    throws SFSException;
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.filter.IFilter
 * JD-Core Version:    0.6.0
 */