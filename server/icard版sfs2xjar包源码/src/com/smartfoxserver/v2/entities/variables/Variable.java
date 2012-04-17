package com.smartfoxserver.v2.entities.variables;

import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;

public abstract interface Variable extends Cloneable
{
  public abstract String getName();

  public abstract VariableType getType();

  public abstract Object getValue();

  public abstract Boolean getBoolValue();

  public abstract Integer getIntValue();

  public abstract Double getDoubleValue();

  public abstract String getStringValue();

  public abstract ISFSObject getSFSObjectValue();

  public abstract ISFSArray getSFSArrayValue();

  public abstract boolean isNull();

  public abstract ISFSArray toSFSArray();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.variables.Variable
 * JD-Core Version:    0.6.0
 */