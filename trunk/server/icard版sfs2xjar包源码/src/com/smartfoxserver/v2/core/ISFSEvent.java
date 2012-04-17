package com.smartfoxserver.v2.core;

public abstract interface ISFSEvent
{
  public abstract SFSEventType getType();

  public abstract Object getParameter(ISFSEventParam paramISFSEventParam);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.core.ISFSEvent
 * JD-Core Version:    0.6.0
 */