package com.smartfoxserver.v2.buddylist;

import com.smartfoxserver.bitswarm.service.IService;
import com.smartfoxserver.bitswarm.sessions.ISession;
import com.smartfoxserver.v2.buddylist.storage.BuddyStorage;
import com.smartfoxserver.v2.entities.Zone;
import com.smartfoxserver.v2.exceptions.SFSBuddyListException;
import java.io.IOException;
import java.util.List;

public abstract interface BuddyListManager extends IService
{
  public abstract Zone getZone();

  public abstract int getBuddyListMaxSize();

  public abstract void setBuddyListMaxSize(int paramInt);

  public abstract int getOfflineBuddyVariablesCacheSize();

  public abstract void setOfflineBuddyVariablesCacheSize(int paramInt);

  public abstract int getMaxBuddyVariables();

  public abstract void setMaxBuddyVariables(int paramInt);

  public abstract boolean isActive();

  public abstract void setActive(boolean paramBoolean);

  public abstract boolean allowOfflineBuddyVariables();

  public abstract void setAllowOfflineBuddyVariables(boolean paramBoolean);

  public abstract BuddyStorage getStorageHandler();

  public abstract void setStorageHandler(BuddyStorage paramBuddyStorage);

  public abstract Buddy addBuddy(String paramString1, String paramString2, boolean paramBoolean)
    throws SFSBuddyListException;

  public abstract Buddy removeBuddy(String paramString1, String paramString2);

  public abstract BuddyList getBuddyList(String paramString);

  public abstract void removeBuddyList(String paramString);

  public abstract BuddyList loadBuddyList(String paramString)
    throws IOException;

  public abstract void saveBuddyList(String paramString)
    throws IOException;

  public abstract void saveAll();

  public abstract List<BuddyVariable> getOfflineBuddyVariables(String paramString);

  public abstract List<BuddyVariable> getOfflineBuddyVariables(String paramString, boolean paramBoolean);

  public abstract BuddyVariable getOfflineBuddyVariable(String paramString1, String paramString2);

  public abstract List<ISession> getClientsWatchingBuddy(String paramString);

  public abstract List<ISession> getClientsWatchingBuddy(String paramString, boolean paramBoolean);

  public abstract List<String> getBuddyStates();

  public abstract void setBuddyStates(List<String> paramList);

  public abstract boolean getUseTempBuddies();

  public abstract void setUseTempBuddies(boolean paramBoolean);

  public abstract boolean getApplyBadWordsFilter();

  public abstract void setApplyBadWordsFilter(boolean paramBoolean);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.BuddyListManager
 * JD-Core Version:    0.6.0
 */