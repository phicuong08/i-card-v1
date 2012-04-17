package com.smartfoxserver.v2.core;

import com.smartfoxserver.bitswarm.service.IService;

public abstract interface ISFSEventManager extends ISFSEventDispatcher, IService
{
  public abstract void setThreadPoolSize(int paramInt);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.core.ISFSEventManager
 * JD-Core Version:    0.6.0
 */