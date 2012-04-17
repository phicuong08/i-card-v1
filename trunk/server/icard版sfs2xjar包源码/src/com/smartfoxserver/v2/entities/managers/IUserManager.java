package com.smartfoxserver.v2.entities.managers;

import com.smartfoxserver.bitswarm.sessions.ISession;
import com.smartfoxserver.v2.core.ICoreService;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.Zone;
import java.util.List;

public abstract interface IUserManager extends ICoreService
{
  public abstract User getUserByName(String paramString);

  public abstract User getUserById(int paramInt);

  public abstract User getUserBySession(ISession paramISession);

  public abstract List<User> getAllUsers();

  public abstract List<ISession> getAllSessions();

  public abstract void addUser(User paramUser);

  public abstract void removeUser(User paramUser);

  public abstract void removeUser(String paramString);

  public abstract void removeUser(int paramInt);

  public abstract void removeUser(ISession paramISession);

  public abstract void disconnectUser(User paramUser);

  public abstract void disconnectUser(String paramString);

  public abstract void disconnectUser(int paramInt);

  public abstract void disconnectUser(ISession paramISession);

  public abstract boolean containsId(int paramInt);

  public abstract boolean containsName(String paramString);

  public abstract boolean containsSessions(ISession paramISession);

  public abstract boolean containsUser(User paramUser);

  public abstract Zone getOwnerZone();

  public abstract void setOwnerZone(Zone paramZone);

  public abstract Room getOwnerRoom();

  public abstract void setOwnerRoom(Room paramRoom);

  public abstract int getUserCount();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.IUserManager
 * JD-Core Version:    0.6.0
 */