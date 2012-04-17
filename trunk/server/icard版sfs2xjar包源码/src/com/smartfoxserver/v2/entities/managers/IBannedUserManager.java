package com.smartfoxserver.v2.entities.managers;

import com.smartfoxserver.v2.core.ICoreService;
import com.smartfoxserver.v2.entities.BannedUser;
import com.smartfoxserver.v2.entities.User;
import java.util.List;

public abstract interface IBannedUserManager extends ICoreService
{
  public abstract boolean isAutoRemoveBan();

  public abstract void setAutoRemoveBan(boolean paramBoolean);

  public abstract boolean isPersistent();

  public abstract void setPersistent(boolean paramBoolean);

  public abstract void setPersistenceClass(String paramString);

  public abstract void kickUser(User paramUser1, User paramUser2, String paramString, int paramInt);

  public abstract void kickUser(User paramUser1, User paramUser2, String paramString, int paramInt, boolean paramBoolean);

  public abstract void banUser(User paramUser1, User paramUser2, int paramInt1, BanMode paramBanMode, String paramString1, String paramString2, int paramInt2);

  public abstract void banUser(String paramString1, String paramString2, int paramInt, BanMode paramBanMode, String paramString3);

  public abstract void banUser(String paramString1, String paramString2, int paramInt, BanMode paramBanMode, String paramString3, String paramString4);

  public abstract void sendWarningMessage(User paramUser1, User paramUser2, String paramString);

  public abstract int getKickCount(String paramString1, String paramString2, int paramInt);

  public abstract boolean isNameBanned(String paramString1, String paramString2);

  public abstract boolean isIpBanned(String paramString);

  public abstract void removeBannedUser(String paramString1, String paramString2, BanMode paramBanMode);

  public abstract List<BannedUser> getBannedUsersByIp();

  public abstract List<BannedUser> getBannedUsersByName(String paramString);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.IBannedUserManager
 * JD-Core Version:    0.6.0
 */