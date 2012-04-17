package com.smartfoxserver.v2.util.filters;

import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.managers.IBannedUserManager;
import com.smartfoxserver.v2.util.IWordFilter;

public abstract interface IWordFilterLogic
{
  public abstract void warnUser(User paramUser);

  public abstract void kickUser(User paramUser);

  public abstract IBannedUserManager getBannedUserManger();

  public abstract IWordFilter getWordFilter();

  public abstract void setBannedUserManager(IBannedUserManager paramIBannedUserManager);

  public abstract void setWordFilter(IWordFilter paramIWordFilter);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.filters.IWordFilterLogic
 * JD-Core Version:    0.6.0
 */