package com.smartfoxserver.v2.entities.managers;

import com.smartfoxserver.v2.core.ICoreService;
import com.smartfoxserver.v2.util.stats.INetworkTrafficMeter;

public abstract interface IStatsManager extends ICoreService
{
  public abstract long getTotalOutBytes();

  public abstract long getTotalInBytes();

  public abstract long getTotalOutPackets();

  public abstract long getTotalInPackets();

  public abstract long getTotalOutgoingDroppedPackets();

  public abstract long getTotalIncomingDroppedPackets();

  public abstract INetworkTrafficMeter getIncomingTrafficMeter();

  public abstract INetworkTrafficMeter getOutgoingTrafficMeter();

  public abstract ConnectionStats getSessionStats();

  public abstract ConnectionStats getUserStats();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.IStatsManager
 * JD-Core Version:    0.6.0
 */