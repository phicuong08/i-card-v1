package com.smartfoxserver.v2.http;

import com.smartfoxserver.bitswarm.service.IService;
import org.mortbay.jetty.Connector;

public abstract interface IHttpServer extends IService
{
  public abstract void start()
    throws Exception;

  public abstract void stop()
    throws Exception;

  public abstract void restart()
    throws Exception;

  public abstract void setAttribute(String paramString, Object paramObject);

  public abstract Object getAttribute(String paramString);

  public abstract Connector getConnector(int paramInt);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.http.IHttpServer
 * JD-Core Version:    0.6.0
 */