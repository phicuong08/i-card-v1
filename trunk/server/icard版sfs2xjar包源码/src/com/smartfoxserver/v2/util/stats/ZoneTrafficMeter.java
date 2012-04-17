/*     */ package com.smartfoxserver.v2.util.stats;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import java.util.ArrayList;
/*     */ import java.util.LinkedList;
/*     */ import java.util.List;
/*     */ 
/*     */ public class ZoneTrafficMeter
/*     */   implements ITrafficMeter
/*     */ {
/*     */   private static final int DEFAULT_MONITORED_HOURS = 24;
/*     */   private static final int DEFAULT_SAMPLING_RATE_MINUTES = 5;
/*     */   private int monitoredHours;
/*     */   private int samplingRateMinutes;
/*     */   private int samplesPerHour;
/*  18 */   private int maxTrafficValueEverSeen = 0;
/*  19 */   private int minTrafficValueEverSeen = 2147483647;
/*     */   private volatile long lastUpdateTime;
/*     */   private final Zone zone;
/*     */   LinkedList<List<Integer>> trafficDataByHour;
/*     */ 
/*     */   public ZoneTrafficMeter(Zone zone)
/*     */   {
/*  28 */     this(zone, 24, 5);
/*     */   }
/*     */ 
/*     */   public ZoneTrafficMeter(Zone zone, int monitoredHours, int samplingRateMinutes)
/*     */   {
/*  33 */     this.zone = zone;
/*  34 */     this.monitoredHours = monitoredHours;
/*  35 */     this.samplingRateMinutes = samplingRateMinutes;
/*     */ 
/*  37 */     this.trafficDataByHour = new LinkedList();
/*  38 */     this.trafficDataByHour.add(new ArrayList());
/*  39 */     this.lastUpdateTime = System.currentTimeMillis();
/*     */ 
/*  42 */     this.samplesPerHour = (60 / this.samplingRateMinutes);
/*     */   }
/*     */ 
/*     */   public long getLastUpdateMillis()
/*     */   {
/*  48 */     return this.lastUpdateTime;
/*     */   }
/*     */ 
/*     */   public List<Integer> getDataPoints()
/*     */   {
/*  54 */     return getDataPoints(0);
/*     */   }
/*     */ 
/*     */   public List<Integer> getDataPoints(int howManyPoints)
/*     */   {
/*  60 */     List flatData = getFlatData();
/*     */ 
/*  63 */     if (howManyPoints < 1) {
/*  64 */       return flatData;
/*     */     }
/*     */ 
/*  67 */     if (howManyPoints > flatData.size()) {
/*  68 */       return flatData;
/*     */     }
/*  70 */     int steps = flatData.size() / howManyPoints;
/*  71 */     List selectedDataPoints = new ArrayList();
/*     */ 
/*  74 */     for (int i = 0; i < flatData.size(); i += steps) {
/*  75 */       selectedDataPoints.add((Integer)flatData.get(i));
/*     */     }
/*  77 */     return selectedDataPoints;
/*     */   }
/*     */ 
/*     */   public int getMaxTraffic()
/*     */   {
/*  85 */     return this.maxTrafficValueEverSeen;
/*     */   }
/*     */ 
/*     */   public int getMinTraffic()
/*     */   {
/*  91 */     return this.minTrafficValueEverSeen;
/*     */   }
/*     */ 
/*     */   public int getMonitoredHours()
/*     */   {
/*  97 */     return this.monitoredHours;
/*     */   }
/*     */ 
/*     */   public int getSamplingRateMinutes()
/*     */   {
/* 103 */     return this.samplingRateMinutes;
/*     */   }
/*     */ 
/*     */   public int getTrafficAverage()
/*     */   {
/* 110 */     List values = new ArrayList();
/*     */ 
/* 112 */     synchronized (this.trafficDataByHour)
/*     */     {
/* 114 */       for (List samples : this.trafficDataByHour)
/*     */       {
/* 116 */         synchronized (samples)
/*     */         {
/* 118 */           values.add(Integer.valueOf(getAverage(samples)));
/*     */         }
/*     */       }
/*     */     }
/*     */ 
/* 123 */     return getAverage(values);
/*     */   }
/*     */ 
/*     */   public int getTrafficAverage(int previousHours)
/*     */   {
/* 129 */     throw new UnsupportedOperationException("Not implemented yet");
/*     */   }
/*     */ 
/*     */   public void onTick()
/*     */   {
/* 135 */     int currHour = this.trafficDataByHour.size();
/* 136 */     List samples = (List)this.trafficDataByHour.get(currHour - 1);
/*     */ 
/* 140 */     int userCountNow = this.zone.getUserCount();
/*     */ 
/* 142 */     if (userCountNow > this.maxTrafficValueEverSeen) {
/* 143 */       this.maxTrafficValueEverSeen = userCountNow;
/*     */     }
/* 145 */     if (userCountNow < this.minTrafficValueEverSeen) {
/* 146 */       this.minTrafficValueEverSeen = userCountNow;
/*     */     }
/* 148 */     synchronized (samples)
/*     */     {
/* 150 */       samples.add(Integer.valueOf(userCountNow));
/*     */     }
/*     */ 
/* 154 */     if (samples.size() == this.samplesPerHour)
/*     */     {
/* 156 */       synchronized (this.trafficDataByHour)
/*     */       {
/* 159 */         if (this.trafficDataByHour.size() == this.monitoredHours) {
/* 160 */           this.trafficDataByHour.removeFirst();
/*     */         }
/*     */ 
/* 163 */         this.trafficDataByHour.add(new ArrayList());
/*     */       }
/*     */     }
/*     */ 
/* 167 */     this.lastUpdateTime = System.currentTimeMillis();
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 173 */     StringBuilder sb = new StringBuilder();
/* 174 */     synchronized (this.trafficDataByHour)
/*     */     {
/* 176 */       int hour = 1;
/*     */ 
/* 178 */       for (List samples : this.trafficDataByHour)
/*     */       {
/* 180 */         sb.append(hour++).append(" => ").append(samples.toString()).append("\n");
/*     */       }
/*     */     }
/*     */ 
/* 184 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   private int getAverage(List<Integer> data)
/*     */   {
/* 193 */     if (data.size() == 0) {
/* 194 */       return 0;
/*     */     }
/* 196 */     long tot = 0L;
/* 197 */     for (Integer value : data) {
/* 198 */       tot += value.intValue();
/*     */     }
/* 200 */     return (int)tot / data.size();
/*     */   }
/*     */ 
/*     */   private List<Integer> getFlatData()
/*     */   {
/* 208 */     List flatData = new ArrayList();
/*     */ 
/* 210 */     synchronized (this.trafficDataByHour)
/*     */     {
/* 212 */       for (List samples : this.trafficDataByHour)
/*     */       {
/* 214 */         synchronized (samples)
/*     */         {
/* 216 */           flatData.addAll(samples);
/*     */         }
/*     */       }
/*     */     }
/*     */ 
/* 221 */     return flatData;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.stats.ZoneTrafficMeter
 * JD-Core Version:    0.6.0
 */