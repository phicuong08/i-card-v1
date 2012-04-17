package com.smartfoxserver.v2.db;

import com.smartfoxserver.bitswarm.service.IService;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import java.sql.Connection;
import java.sql.SQLException;

public abstract interface IDBManager extends IService
{
  public abstract boolean isActive();

  public abstract DBConfig getConfig();

  public abstract Connection getConnection()
    throws SQLException;

  public abstract ISFSArray executeQuery(String paramString, Object[] paramArrayOfObject)
    throws SQLException;

  public abstract ISFSArray executeQuery(String paramString)
    throws SQLException;

  public abstract void executeUpdate(String paramString, Object[] paramArrayOfObject)
    throws SQLException;

  public abstract void executeUpdate(String paramString)
    throws SQLException;
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.db.IDBManager
 * JD-Core Version:    0.6.0
 */