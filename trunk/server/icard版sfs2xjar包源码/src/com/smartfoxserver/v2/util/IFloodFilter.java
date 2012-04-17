package com.smartfoxserver.v2.util;

import com.smartfoxserver.v2.controllers.SystemRequest;
import com.smartfoxserver.v2.core.ICoreService;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.managers.BanMode;
import com.smartfoxserver.v2.exceptions.SFSFloodingException;
import java.util.Map;

public abstract interface IFloodFilter extends ICoreService
{
  public abstract void setActive(boolean paramBoolean);

  public abstract void filterRequest(SystemRequest paramSystemRequest, User paramUser)
    throws SFSFloodingException;

  public abstract void addRequestFilter(SystemRequest paramSystemRequest, int paramInt);

  public abstract boolean isRequestFiltered(SystemRequest paramSystemRequest);

  public abstract void clearAllFilters();

  public abstract Map<SystemRequest, Integer> getRequestTable();

  public abstract int getBanDurationMinutes();

  public abstract void setBanDurationMinutes(int paramInt);

  public abstract int getMaxFloodingAttempts();

  public abstract void setMaxFloodingAttempts(int paramInt);

  public abstract int getSecondsBeforeBan();

  public abstract void setSecondsBeforeBan(int paramInt);

  public abstract boolean isLogFloodingAttempts();

  public abstract void setLogFloodingAttempts(boolean paramBoolean);

  public abstract BanMode getBanMode();

  public abstract void setBanMode(BanMode paramBanMode);

  public abstract String getBanMessage();

  public abstract void setBanMessage(String paramString);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.IFloodFilter
 * JD-Core Version:    0.6.0
 */