package com.smartfoxserver.v2.entities.managers;

import com.smartfoxserver.v2.core.ICoreService;
import com.smartfoxserver.v2.exceptions.SFSException;

public abstract interface ILSManager extends ICoreService
{
  public abstract Object execute(String paramString, Object paramObject)
    throws SFSException;
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.ILSManager
 * JD-Core Version:    0.6.0
 */