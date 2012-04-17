/*     */ package com.smartfoxserver.v2.util.stats;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.core.BitSwarmEngine;
/*     */ import com.smartfoxserver.bitswarm.core.ISocketReader;
/*     */ import com.smartfoxserver.bitswarm.core.ISocketWriter;
/*     */ import java.util.ArrayList;
/*     */ import java.util.LinkedList;
/*     */ import java.util.List;
/*     */ 
/*     */ public class NetworkTrafficMeter
/*     */   implements INetworkTrafficMeter
/*     */ {
/*     */   public static final int DEFAULT_MONITORED_HOURS = 24;
/*     */   public static final int DEFAULT_SAMPLING_RATE_MINUTES = 1;
/*     */   private int monitoredHours;
/*     */   private int samplingRateMinutes;
/*     */   private int samplesPerHour;
/*  18 */   private volatile long maxTrafficValueEverSeen = 0L;
/*  19 */   private volatile long minTrafficValueEverSeen = 9223372036854775807L;
/*     */   private volatile long lastUpdateTime;
/*     */   private LinkedList<List<Long>> trafficDataByHour;
/*     */   private TrafficType trafficType;
/*     */ 
/*     */   public NetworkTrafficMeter(TrafficType type)
/*     */   {
/*  27 */     this(type, 24, 1);
/*     */   }
/*     */ 
/*     */   public NetworkTrafficMeter(TrafficType type, int monitoredHours, int samplingRateMinutes)
/*     */   {
/*  32 */     this.monitoredHours = monitoredHours;
/*  33 */     this.samplingRateMinutes = samplingRateMinutes;
/*  34 */     this.trafficType = type;
/*     */ 
/*  36 */     this.trafficDataByHour = new LinkedList();
/*  37 */     this.trafficDataByHour.add(new ArrayList());
/*  38 */     this.lastUpdateTime = System.currentTimeMillis();
/*     */ 
/*  41 */     this.samplesPerHour = (60 / this.samplingRateMinutes);
/*     */   }
/*     */ 
/*     */   public long getLastUpdateMillis()
/*     */   {
/*  47 */     return this.lastUpdateTime;
/*     */   }
/*     */ 
/*     */   public List<Long> getDataPoints()
/*     */   {
/*  53 */     return getDataPoints(0);
/*     */   }
/*     */ 
/*     */   public long getMaxTraffic()
/*     */   {
/*  59 */     return this.maxTrafficValueEverSeen;
/*     */   }
/*     */ 
/*     */   public long getMinTraffic()
/*     */   {
/*  66 */     return this.minTrafficValueEverSeen;
/*     */   }
/*     */ 
/*     */   public List<Long> getDataPoints(int howManyPoints)
/*     */   {
/*  72 */     List flatData = getFlatData();
/*     */ 
/*  75 */     if (howManyPoints < 1) {
/*  76 */       return flatData;
/*     */     }
/*     */ 
/*  79 */     if (howManyPoints > flatData.size()) {
/*  80 */       return flatData;
/*     */     }
/*  82 */     int steps = flatData.size() / howManyPoints;
/*  83 */     List selectedDataPoints = new ArrayList();
/*     */ 
/*  86 */     for (int i = 0; i < flatData.size(); i += steps) {
/*  87 */       selectedDataPoints.add((Long)flatData.get(i));
/*     */     }
/*  89 */     return selectedDataPoints;
/*     */   }
/*     */ 
/*     */   public int getMonitoredHours()
/*     */   {
/*  95 */     return this.monitoredHours;
/*     */   }
/*     */ 
/*     */   public int getSamplingRateMinutes()
/*     */   {
/* 101 */     return this.samplingRateMinutes;
/*     */   }
/*     */ 
/*     */   public long getTrafficAverage()
/*     */   {
/* 107 */     List values = new ArrayList();
/*     */ 
/* 109 */     synchronized (this.trafficDataByHour)
/*     */     {
/* 111 */       for (List samples : this.trafficDataByHour)
/*     */       {
/* 113 */         synchronized (samples)
/*     */         {
/* 115 */           values.add(Long.valueOf(getAverage(samples)));
/*     */         }
/*     */       }
/*     */     }
/*     */ 
/* 120 */     return getAverage(values);
/*     */   }
/*     */ 
/*     */   public void onTick()
/*     */   {
/* 126 */     int currHour = this.trafficDataByHour.size();
/* 127 */     List samples = (List)this.trafficDataByHour.get(currHour - 1);
/*     */     long trafficValue;
/*     */     long trafficValue;
/* 132 */     if (this.trafficType == TrafficType.INCOMING)
/* 133 */       trafficValue = BitSwarmEngine.getInstance().getSocketReader().getReadBytes() / 1024L;
/*     */     else {
/* 135 */       trafficValue = BitSwarmEngine.getInstance().getSocketWriter().getWrittenBytes() / 1024L;
/*     */     }
/* 137 */     if (trafficValue > this.maxTrafficValueEverSeen) {
/* 138 */       this.maxTrafficValueEverSeen = trafficValue;
/*     */     }
/* 140 */     if (trafficValue < this.minTrafficValueEverSeen) {
/* 141 */       this.minTrafficValueEverSeen = trafficValue;
/*     */     }
/* 143 */     synchronized (samples)
/*     */     {
/* 145 */       samples.add(Long.valueOf(trafficValue));
/*     */     }
/*     */ 
/* 149 */     if (samples.size() == this.samplesPerHour)
/*     */     {
/* 151 */       synchronized (this.trafficDataByHour)
/*     */       {
/* 154 */         if (this.trafficDataByHour.size() == this.monitoredHours) {
/* 155 */           this.trafficDataByHour.removeFirst();
/*     */         }
/*     */ 
/* 158 */         this.trafficDataByHour.add(new ArrayList());
/*     */       }
/*     */     }
/*     */ 
/* 162 */     this.lastUpdateTime = System.currentTimeMillis();
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 168 */     StringBuilder sb = new StringBuilder();
/* 169 */     synchronized (this.trafficDataByHour)
/*     */     {
/* 171 */       int hour = 1;
/*     */ 
/* 173 */       for (List samples : this.trafficDataByHour)
/*     */       {
/* 175 */         sb.append(hour++).append(" => ").append(samples.toString()).append("\n");
/*     */       }
/*     */     }
/*     */ 
/* 179 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   private long getAverage(List<Long> data)
/*     */   {
/* 188 */     if (data.size() == 0) {
/* 189 */       return 0L;
/*     */     }
/* 191 */     long tot = 0L;
/* 192 */     for (Long value : data) {
/* 193 */       tot += value.longValue();
/*     */     }
/* 195 */     return (int)tot / data.size();
/*     */   }
/*     */ 
/*     */   private List<Long> getFlatData()
/*     */   {
/* 203 */     List flatData = new ArrayList();
/*     */ 
/* 205 */     synchronized (this.trafficDataByHour)
/*     */     {
/* 207 */       for (List samples : this.trafficDataByHour)
/*     */       {
/* 209 */         synchronized (samples)
/*     */         {
/* 211 */           flatData.addAll(samples);
/*     */         }
/*     */       }
/*     */     }
/*     */ 
/* 216 */     return flatData;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.stats.NetworkTrafficMeter
 * JD-Core Version:    0.6.0
 */