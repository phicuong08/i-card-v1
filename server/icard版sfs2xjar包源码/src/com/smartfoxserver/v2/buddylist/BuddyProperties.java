package com.smartfoxserver.v2.buddylist;

import java.util.List;

public abstract interface BuddyProperties
{
  public abstract boolean isOnline();

  public abstract void setOnline(boolean paramBoolean);

  public abstract String getState();

  public abstract void setState(String paramString);

  public abstract String getNickName();

  public abstract void setNickName(String paramString);

  public abstract BuddyVariable getVariable(String paramString);

  public abstract List<BuddyVariable> getVariables();

  public abstract void setVariable(BuddyVariable paramBuddyVariable);

  public abstract void setVariables(List<BuddyVariable> paramList);

  public abstract void removeVariable(String paramString);

  public abstract boolean containsVariable(String paramString);

  public abstract int getVariablesCount();

  public abstract boolean isChangedSinceLastSave();

  public abstract void setChangedSinceLastSave(boolean paramBoolean);

  public abstract boolean isInited();

  public abstract void setInited();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.BuddyProperties
 * JD-Core Version:    0.6.0
 */