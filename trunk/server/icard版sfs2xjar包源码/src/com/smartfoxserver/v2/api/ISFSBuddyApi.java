package com.smartfoxserver.v2.api;

import com.smartfoxserver.v2.buddylist.BuddyList;
import com.smartfoxserver.v2.buddylist.BuddyVariable;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.Zone;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.exceptions.SFSBuddyListException;
import java.io.IOException;
import java.util.List;

public abstract interface ISFSBuddyApi
{
  public abstract ISFSBuddyResponseApi getResponseAPI();

  public abstract BuddyList initBuddyList(User paramUser, boolean paramBoolean)
    throws IOException;

  public abstract void goOnline(User paramUser, boolean paramBoolean1, boolean paramBoolean2)
    throws SFSBuddyListException;

  public abstract void addBuddy(Zone paramZone, String paramString1, String paramString2, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    throws SFSBuddyListException;

  public abstract void addBuddy(User paramUser, String paramString, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    throws SFSBuddyListException;

  public abstract void setBuddyVariables(User paramUser, List<BuddyVariable> paramList, boolean paramBoolean1, boolean paramBoolean2)
    throws SFSBuddyListException;

  public abstract void removeBuddy(User paramUser, String paramString, boolean paramBoolean1, boolean paramBoolean2);

  public abstract void removeBuddy(Zone paramZone, String paramString1, String paramString2, boolean paramBoolean1, boolean paramBoolean2);

  public abstract void blockBuddy(User paramUser, String paramString, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3);

  public abstract void sendBuddyMessage(User paramUser1, User paramUser2, String paramString, ISFSObject paramISFSObject)
    throws SFSBuddyListException;
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.ISFSBuddyApi
 * JD-Core Version:    0.6.0
 */