package com.smartfoxserver.v2.entities.match;

import com.smartfoxserver.v2.entities.variables.UserVariable;
import java.util.Collection;

abstract interface EntityWithVariables
{
  public abstract UserVariable getVariable(String paramString);

  public abstract Collection<? extends UserVariable> getVariables();

  public abstract Object getEntity();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.EntityWithVariables
 * JD-Core Version:    0.6.0
 */