package com.smartfoxserver.v2.entities;

import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.managers.BanMode;

public abstract interface BannedUser
{
  public abstract long getBanTimeMillis();

  public abstract int getBanDurationMinutes();

  public abstract String getName();

  public abstract String getZoneName();

  public abstract String getIpAddress();

  public abstract BanMode getMode();

  public abstract String getReason();

  public abstract String getAdminName();

  public abstract boolean isExpired();

  public abstract ISFSArray toSFSArray();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.BannedUser
 * JD-Core Version:    0.6.0
 */