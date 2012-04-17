package com.smartfoxserver.v2.buddylist;

import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.exceptions.SFSBuddyListException;
import java.util.List;

public abstract interface BuddyList
{
  public abstract String getOwnerName();

  public abstract User getOwner();

  public abstract BuddyListManager getBuddyListManager();

  public abstract void setBuddyListManager(BuddyListManager paramBuddyListManager);

  public abstract Buddy getBuddy(String paramString);

  public abstract List<Buddy> getBuddies();

  public abstract Buddy addBuddy(Buddy paramBuddy)
    throws SFSBuddyListException;

  public abstract Buddy removeBuddy(String paramString);

  public abstract boolean containsBuddy(String paramString);

  public abstract int getSize();

  public abstract int getRuntimeSize();

  public abstract boolean isFull();

  public abstract boolean isEmpty();

  public abstract boolean isBuddyBlocked(String paramString);

  public abstract void clearAll();

  public abstract ISFSArray toSFSArray();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.BuddyList
 * JD-Core Version:    0.6.0
 */