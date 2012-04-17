package com.smartfoxserver.v2.buddylist.storage;

import com.smartfoxserver.v2.buddylist.BuddyList;
import com.smartfoxserver.v2.buddylist.BuddyListManager;
import com.smartfoxserver.v2.buddylist.BuddyVariable;
import com.smartfoxserver.v2.exceptions.SFSBuddyListNotFoundException;
import java.io.IOException;
import java.util.List;

public abstract interface BuddyStorage
{
  public abstract void init();

  public abstract void destroy();

  public abstract BuddyList loadList(String paramString)
    throws SFSBuddyListNotFoundException, IOException;

  public abstract void saveList(BuddyList paramBuddyList)
    throws IOException;

  public abstract List<BuddyVariable> getOfflineVariables(String paramString)
    throws IOException;

  public abstract BuddyListManager getBuddyListManager();

  public abstract void setBuddyListManager(BuddyListManager paramBuddyListManager);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.storage.BuddyStorage
 * JD-Core Version:    0.6.0
 */