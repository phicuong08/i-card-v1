package com.smartfoxserver.v2.util.stats;

import java.util.List;

public abstract interface ITrafficMeter
{
  public abstract int getMonitoredHours();

  public abstract int getSamplingRateMinutes();

  public abstract int getTrafficAverage();

  public abstract int getTrafficAverage(int paramInt);

  public abstract int getMaxTraffic();

  public abstract int getMinTraffic();

  public abstract List<Integer> getDataPoints();

  public abstract List<Integer> getDataPoints(int paramInt);

  public abstract long getLastUpdateMillis();

  public abstract void onTick();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.stats.ITrafficMeter
 * JD-Core Version:    0.6.0
 */