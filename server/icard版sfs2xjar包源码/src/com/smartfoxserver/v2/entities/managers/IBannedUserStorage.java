package com.smartfoxserver.v2.entities.managers;

import java.io.IOException;

public abstract interface IBannedUserStorage
{
  public abstract void init();

  public abstract void destroy();

  public abstract BanUserData load()
    throws Exception;

  public abstract void save(BanUserData paramBanUserData)
    throws IOException;
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.IBannedUserStorage
 * JD-Core Version:    0.6.0
 */