package com.smartfoxserver.v2.util;

import com.smartfoxserver.v2.core.ICoreService;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.managers.BanMode;
import com.smartfoxserver.v2.entities.managers.IBannedUserManager;
import com.smartfoxserver.v2.util.filters.FilteredMessage;
import com.smartfoxserver.v2.util.filters.WordsFilterMode;
import java.util.Set;

public abstract interface IWordFilter extends ICoreService
{
  public abstract IBannedUserManager getBannedUserManager();

  public abstract void setBannedUserManager(IBannedUserManager paramIBannedUserManager);

  public abstract Set<String> getExpressionsList();

  public abstract void addExpression(String paramString);

  public abstract void removeExpression(String paramString);

  public abstract void clearExpressions();

  public abstract String getMaskCharacter();

  public abstract void setMaskCharacter(String paramString);

  public abstract int getWarningsBeforeKick();

  public abstract void setWarningsBeforeKick(int paramInt);

  public abstract String getWarningMessage();

  public abstract void setWarningMessage(String paramString);

  public abstract int getKicksBeforeBan();

  public abstract void setKicksBeforeBan(int paramInt);

  public abstract int getKicksBeforeBanMinutes();

  public abstract void setKicksBeforeBanMinutes(int paramInt);

  public abstract int getBanDurationMinutes();

  public abstract void setBanDurationMinutes(int paramInt);

  public abstract BanMode getBanMode();

  public abstract void setBanMode(BanMode paramBanMode);

  public abstract int getMaxBadWordsPerMessage();

  public abstract void setMaxBadWordsPerMessage(int paramInt);

  public abstract String getWordsFile();

  public abstract void setWordsFile(String paramString);

  public abstract WordsFilterMode getFilterMode();

  public abstract void setFilterMode(WordsFilterMode paramWordsFilterMode);

  public abstract String getKickMessage();

  public abstract void setKickMessage(String paramString);

  public abstract String getBanMessage();

  public abstract void setBanMessage(String paramString);

  public abstract int getSecondsBeforeBanOrKick();

  public abstract void setSecondsBeforeBanOrKick(int paramInt);

  public abstract IBannedUserManager getBannedUserManger();

  public abstract void setBannedUserManger(IBannedUserManager paramIBannedUserManager);

  public abstract boolean isUseWarnings();

  public abstract void setUseWarnings(boolean paramBoolean);

  public abstract FilteredMessage apply(String paramString);

  public abstract FilteredMessage apply(String paramString, User paramUser);

  public abstract void setActive(boolean paramBoolean);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.IWordFilter
 * JD-Core Version:    0.6.0
 */