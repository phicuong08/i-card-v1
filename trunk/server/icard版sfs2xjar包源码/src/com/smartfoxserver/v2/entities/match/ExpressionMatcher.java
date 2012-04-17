package com.smartfoxserver.v2.entities.match;

abstract interface ExpressionMatcher
{
  public abstract boolean match(EntityWithVariables paramEntityWithVariables, MatchExpression paramMatchExpression);

  public abstract IProxyVariableResolver getProxyVariableResolver();

  public abstract void setProxyVariableResolver(IProxyVariableResolver paramIProxyVariableResolver);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.ExpressionMatcher
 * JD-Core Version:    0.6.0
 */