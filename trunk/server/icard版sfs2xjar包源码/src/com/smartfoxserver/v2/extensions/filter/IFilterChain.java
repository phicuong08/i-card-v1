package com.smartfoxserver.v2.extensions.filter;

import com.smartfoxserver.v2.core.ISFSEvent;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.exceptions.SFSException;

public abstract interface IFilterChain
{
  public abstract void addFilter(String paramString, SFSExtensionFilter paramSFSExtensionFilter);

  public abstract void remove(String paramString);

  public abstract FilterAction runRequestInChain(String paramString, User paramUser, ISFSObject paramISFSObject);

  public abstract FilterAction runEventInChain(ISFSEvent paramISFSEvent)
    throws SFSException;

  public abstract int size();

  public abstract void destroy();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.filter.IFilterChain
 * JD-Core Version:    0.6.0
 */