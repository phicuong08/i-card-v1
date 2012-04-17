package com.smartfoxserver.v2.buddylist;

import com.smartfoxserver.v2.entities.data.ISFSArray;
import java.util.List;

public abstract interface Buddy
{
  public abstract String getName();

  public abstract String getState();

  public abstract String getNickName();

  public abstract boolean isBlocked();

  public abstract void setBlocked(boolean paramBoolean);

  public abstract boolean isTemp();

  public abstract void setIsTemp(boolean paramBoolean);

  public abstract boolean isOnline();

  public abstract BuddyList getParentBuddyList();

  public abstract void setParentBuddyList(BuddyList paramBuddyList);

  public abstract boolean hasVariables();

  public abstract BuddyVariable getVariable(String paramString);

  public abstract List<BuddyVariable> getVariables();

  public abstract void setVariable(BuddyVariable paramBuddyVariable);

  public abstract void setVariables(List<BuddyVariable> paramList);

  public abstract ISFSArray toSFSArray();

  public abstract ISFSArray getBuddyVariablesData();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.Buddy
 * JD-Core Version:    0.6.0
 */