package com.smartfoxserver.v2.security;

import com.smartfoxserver.v2.controllers.SystemRequest;
import com.smartfoxserver.v2.entities.User;

public abstract interface PrivilegeManager
{
  public abstract boolean isActive();

  public abstract void setActive(boolean paramBoolean);

  public abstract void setPermissionProfile(SFSPermissionProfile paramSFSPermissionProfile);

  public abstract void removePermissionProfile(short paramShort);

  public abstract void removePermissionProfile(String paramString);

  public abstract boolean containsPermissionProfile(short paramShort);

  public abstract boolean containsPermissionProfile(String paramString);

  public abstract SFSPermissionProfile getPermissionProfile(short paramShort);

  public abstract SFSPermissionProfile getPermissionProfile(String paramString);

  public abstract boolean isRequestAllowed(User paramUser, SystemRequest paramSystemRequest);

  public abstract boolean isFlagSet(User paramUser, SystemPermission paramSystemPermission);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.security.PrivilegeManager
 * JD-Core Version:    0.6.0
 */