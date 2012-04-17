package com.smartfoxserver.v2.extensions;

public abstract interface IHandlerFactory
{
  public abstract void addHandler(String paramString, Class<?> paramClass);

  public abstract void removeHandler(String paramString);

  public abstract Object findHandler(String paramString)
    throws InstantiationException, IllegalAccessException;

  public abstract void clearAll();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.IHandlerFactory
 * JD-Core Version:    0.6.0
 */