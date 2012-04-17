package com.smartfoxserver.v2.core;

public abstract interface ISFSEventDispatcher
{
  public abstract void addEventListener(SFSEventType paramSFSEventType, ISFSEventListener paramISFSEventListener);

  public abstract boolean hasEventListener(SFSEventType paramSFSEventType);

  public abstract void removeEventListener(SFSEventType paramSFSEventType, ISFSEventListener paramISFSEventListener);

  public abstract void dispatchEvent(ISFSEvent paramISFSEvent);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.core.ISFSEventDispatcher
 * JD-Core Version:    0.6.0
 */