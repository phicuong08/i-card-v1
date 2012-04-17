package com.smartfoxserver.v2.util.stats;

import java.util.List;

public abstract interface INetworkTrafficMeter
{
  public abstract int getMonitoredHours();

  public abstract int getSamplingRateMinutes();

  public abstract long getTrafficAverage();

  public abstract long getMaxTraffic();

  public abstract long getMinTraffic();

  public abstract List<Long> getDataPoints();

  public abstract List<Long> getDataPoints(int paramInt);

  public abstract long getLastUpdateMillis();

  public abstract void onTick();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.stats.INetworkTrafficMeter
 * JD-Core Version:    0.6.0
 */