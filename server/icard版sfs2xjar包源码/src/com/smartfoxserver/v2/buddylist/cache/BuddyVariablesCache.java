package com.smartfoxserver.v2.buddylist.cache;

import com.smartfoxserver.v2.buddylist.BuddyVariable;
import java.util.List;

public abstract interface BuddyVariablesCache
{
  public abstract int getSize();

  public abstract void setSize(int paramInt);

  public abstract void addVariables(String paramString, List<BuddyVariable> paramList);

  public abstract List<BuddyVariable> getVariables(String paramString);

  public abstract void removeVariables(String paramString);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.cache.BuddyVariablesCache
 * JD-Core Version:    0.6.0
 */