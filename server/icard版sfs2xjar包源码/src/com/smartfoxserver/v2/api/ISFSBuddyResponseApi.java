package com.smartfoxserver.v2.api;

import com.smartfoxserver.v2.buddylist.Buddy;
import com.smartfoxserver.v2.buddylist.BuddyList;
import com.smartfoxserver.v2.buddylist.BuddyOnlineState;
import com.smartfoxserver.v2.buddylist.BuddyVariable;
import com.smartfoxserver.v2.entities.User;
import java.util.List;

public abstract interface ISFSBuddyResponseApi
{
  public abstract void notifyBuddyListInited(BuddyList paramBuddyList);

  public abstract void notifyAddBuddy(Buddy paramBuddy, User paramUser);

  public abstract void notifyRemoveBuddy(String paramString, User paramUser);

  public abstract void notifyBuddyBlockStatus(String paramString, boolean paramBoolean, User paramUser);

  public abstract void notifyBuddyOnlineStateChange(User paramUser, BuddyOnlineState paramBuddyOnlineState);

  public abstract void notifyBuddyOnlineStateChange(User paramUser, BuddyOnlineState paramBuddyOnlineState, boolean paramBoolean);

  public abstract void notifyBuddyVariablesUpdate(User paramUser, List<BuddyVariable> paramList);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.ISFSBuddyResponseApi
 * JD-Core Version:    0.6.0
 */