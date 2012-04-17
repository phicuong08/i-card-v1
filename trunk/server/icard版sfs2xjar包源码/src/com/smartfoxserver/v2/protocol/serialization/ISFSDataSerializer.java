package com.smartfoxserver.v2.protocol.serialization;

import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSArray;
import com.smartfoxserver.v2.entities.data.SFSObject;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public abstract interface ISFSDataSerializer
{
  public abstract byte[] object2binary(ISFSObject paramISFSObject);

  public abstract byte[] array2binary(ISFSArray paramISFSArray);

  public abstract ISFSObject binary2object(byte[] paramArrayOfByte);

  public abstract ISFSArray binary2array(byte[] paramArrayOfByte);

  public abstract String object2json(Map<String, Object> paramMap);

  public abstract String array2json(List<Object> paramList);

  public abstract ISFSObject json2object(String paramString);

  public abstract ISFSArray json2array(String paramString);

  public abstract ISFSObject pojo2sfs(Object paramObject);

  public abstract Object sfs2pojo(ISFSObject paramISFSObject);

  public abstract SFSObject resultSet2object(ResultSet paramResultSet)
    throws SQLException;

  public abstract SFSArray resultSet2array(ResultSet paramResultSet)
    throws SQLException;
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.serialization.ISFSDataSerializer
 * JD-Core Version:    0.6.0
 */