package com.smartfoxserver.v2.extensions;

import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;

public abstract interface IClientRequestHandler
{
  public abstract void handleClientRequest(User paramUser, ISFSObject paramISFSObject);

  public abstract void setParentExtension(SFSExtension paramSFSExtension);

  public abstract SFSExtension getParentExtension();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.IClientRequestHandler
 * JD-Core Version:    0.6.0
 */