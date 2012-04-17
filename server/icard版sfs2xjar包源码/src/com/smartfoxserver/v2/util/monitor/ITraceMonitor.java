package com.smartfoxserver.v2.util.monitor;

import com.smartfoxserver.bitswarm.service.IService;

public abstract interface ITraceMonitor extends IService
{
  public abstract void handleTraceMessage(TraceMessage paramTraceMessage);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.monitor.ITraceMonitor
 * JD-Core Version:    0.6.0
 */