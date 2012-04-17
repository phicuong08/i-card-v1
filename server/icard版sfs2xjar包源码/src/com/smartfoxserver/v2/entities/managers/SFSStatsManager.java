/*     */ package com.smartfoxserver.v2.entities.managers;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.core.BitSwarmEngine;
/*     */ import com.smartfoxserver.bitswarm.core.ISocketReader;
/*     */ import com.smartfoxserver.bitswarm.core.ISocketWriter;
/*     */ import com.smartfoxserver.bitswarm.io.IOHandler;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISessionManager;
/*     */ import com.smartfoxserver.bitswarm.sessions.SessionType;
/*     */ import com.smartfoxserver.bitswarm.sessions.bluebox.IBBClient;
/*     */ import com.smartfoxserver.bitswarm.sessions.bluebox.IBBConnectionManager;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.http.IHttpServer;
/*     */ import com.smartfoxserver.v2.util.TaskScheduler;
/*     */ import com.smartfoxserver.v2.util.stats.INetworkTrafficMeter;
/*     */ import com.smartfoxserver.v2.util.stats.NetworkTrafficMeter;
/*     */ import com.smartfoxserver.v2.util.stats.TrafficType;
/*     */ import java.util.List;
/*     */ import java.util.concurrent.TimeUnit;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSStatsManager
/*     */   implements IStatsManager
/*     */ {
/*     */   private INetworkTrafficMeter inMeter;
/*     */   private INetworkTrafficMeter outMeter;
/*     */   private BitSwarmEngine engine;
/*     */   private SmartFoxServer sfs;
/*     */   private NetworkStatsExecutor statsExecutor;
/*     */   private IBBConnectionManager bbConnectionManager;
/*     */ 
/*     */   public void init(Object o)
/*     */   {
/*  61 */     this.engine = BitSwarmEngine.getInstance();
/*  62 */     this.sfs = SmartFoxServer.getInstance();
/*  63 */     this.inMeter = new NetworkTrafficMeter(TrafficType.INCOMING);
/*  64 */     this.outMeter = new NetworkTrafficMeter(TrafficType.OUTGOING);
/*  65 */     this.statsExecutor = new NetworkStatsExecutor();
/*     */ 
/*  72 */     IHttpServer httpServer = this.sfs.getHttpServer();
/*  73 */     if (httpServer == null)
/*  74 */       this.bbConnectionManager = new DummyBBConnectionManager(null);
/*     */     else {
/*  76 */       this.bbConnectionManager = ((IBBConnectionManager)httpServer.getAttribute("connectionManagerInstance"));
/*     */     }
/*  78 */     this.sfs.getTaskScheduler().scheduleAtFixedRate(
/*  80 */       this.statsExecutor, 
/*  81 */       0, 
/*  82 */       1, 
/*  83 */       TimeUnit.MINUTES);
/*     */   }
/*     */ 
/*     */   public void destroy(Object o)
/*     */   {
/*     */   }
/*     */ 
/*     */   public long getTotalInPackets()
/*     */   {
/*  96 */     return this.engine.getSocketReader().getReadPackets() + this.bbConnectionManager.getReadPackets();
/*     */   }
/*     */ 
/*     */   public long getTotalOutPackets()
/*     */   {
/* 102 */     return this.engine.getSocketWriter().getWrittenPackets() + this.bbConnectionManager.getWrittenPackets();
/*     */   }
/*     */ 
/*     */   public long getTotalInBytes()
/*     */   {
/* 108 */     return this.engine.getSocketReader().getReadBytes() + this.bbConnectionManager.getReadBytes();
/*     */   }
/*     */ 
/*     */   public long getTotalOutBytes()
/*     */   {
/* 114 */     return this.engine.getSocketWriter().getWrittenBytes() + this.bbConnectionManager.getWrittenBytes();
/*     */   }
/*     */ 
/*     */   public long getTotalOutgoingDroppedPackets()
/*     */   {
/* 120 */     return this.engine.getSocketWriter().getDroppedPacketsCount();
/*     */   }
/*     */ 
/*     */   public INetworkTrafficMeter getIncomingTrafficMeter()
/*     */   {
/* 126 */     return this.inMeter;
/*     */   }
/*     */ 
/*     */   public INetworkTrafficMeter getOutgoingTrafficMeter()
/*     */   {
/* 132 */     return this.outMeter;
/*     */   }
/*     */ 
/*     */   public long getTotalIncomingDroppedPackets()
/*     */   {
/* 138 */     return this.engine.getSocketReader().getIOHandler().getIncomingDroppedPackets();
/*     */   }
/*     */ 
/*     */   public ConnectionStats getSessionStats()
/*     */   {
/* 150 */     List allSessions = this.sfs.getSessionManager().getAllLocalSessions();
/*     */ 
/* 152 */     int socketCount = 0;
/* 153 */     int npcCount = 0;
/* 154 */     int bboxCount = 0;
/*     */ 
/* 156 */     for (ISession session : allSessions)
/*     */     {
/* 162 */       if (session.getType() == SessionType.BLUEBOX) {
/* 163 */         bboxCount++;
/*     */       }
/*     */       else {
/* 166 */         socketCount++;
/*     */       }
/*     */     }
/* 169 */     return new ConnectionStats(socketCount, npcCount, bboxCount);
/*     */   }
/*     */ 
/*     */   public ConnectionStats getUserStats()
/*     */   {
/* 176 */     List allUsers = this.sfs.getUserManager().getAllUsers();
/*     */ 
/* 178 */     int socketCount = 0;
/* 179 */     int npcCount = 0;
/* 180 */     int bboxCount = 0;
/*     */ 
/* 182 */     for (User user : allUsers)
/*     */     {
/* 185 */       if (!user.isLocal()) {
/*     */         continue;
/*     */       }
/* 188 */       if (user.isNpc()) {
/* 189 */         npcCount++;
/*     */       }
/* 191 */       else if (user.getSession().getType() == SessionType.BLUEBOX) {
/* 192 */         bboxCount++;
/*     */       }
/*     */       else {
/* 195 */         socketCount++;
/*     */       }
/*     */     }
/* 198 */     return new ConnectionStats(socketCount, npcCount, bboxCount);
/*     */   }
/*     */ 
/*     */   public boolean isActive()
/*     */   {
/* 205 */     return true;
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/* 211 */     return "StatsManager Service";
/*     */   }
/*     */ 
/*     */   public void handleMessage(Object message)
/*     */   {
/* 217 */     throw new UnsupportedOperationException("Not available");
/*     */   }
/*     */ 
/*     */   public void setName(String name)
/*     */   {
/* 223 */     throw new UnsupportedOperationException("Not available");
/*     */   }
/*     */ 
/*     */   private static final class DummyBBConnectionManager
/*     */     implements IBBConnectionManager
/*     */   {
/*     */     public void addClient(String sessionId, IBBClient client)
/*     */     {
/*     */     }
/*     */ 
/*     */     public void addReadPacket(int packetSize)
/*     */     {
/*     */     }
/*     */ 
/*     */     public void addWrittenPacket(int packetSize)
/*     */     {
/*     */     }
/*     */ 
/*     */     public List<IBBClient> getAllClients()
/*     */     {
/* 251 */       return null;
/*     */     }
/*     */ 
/*     */     public IBBClient getClient(String sessionId)
/*     */     {
/* 257 */       return null;
/*     */     }
/*     */ 
/*     */     public int getClientCount()
/*     */     {
/* 264 */       return 0;
/*     */     }
/*     */ 
/*     */     public long getReadBytes()
/*     */     {
/* 271 */       return 0L;
/*     */     }
/*     */ 
/*     */     public long getReadPackets()
/*     */     {
/* 277 */       return 0L;
/*     */     }
/*     */ 
/*     */     public long getWrittenBytes()
/*     */     {
/* 283 */       return 0L;
/*     */     }
/*     */ 
/*     */     public long getWrittenPackets()
/*     */     {
/* 289 */       return 0L;
/*     */     }
/*     */ 
/*     */     public void handleClientDisconnection(IBBClient client)
/*     */     {
/*     */     }
/*     */ 
/*     */     public void init()
/*     */     {
/*     */     }
/*     */ 
/*     */     public void removeClient(String sessionId)
/*     */     {
/*     */     }
/*     */ 
/*     */     public void removeClients(List<String> clients)
/*     */     {
/*     */     }
/*     */   }
/*     */ 
/*     */   private class NetworkStatsExecutor
/*     */     implements Runnable
/*     */   {
/*  40 */     private final Logger log = LoggerFactory.getLogger(NetworkStatsExecutor.class);
/*     */ 
/*     */     public NetworkStatsExecutor()
/*     */     {
/*     */     }
/*     */ 
/*     */     public void run() {
/*     */       try {
/*  48 */         SFSStatsManager.this.inMeter.onTick();
/*  49 */         SFSStatsManager.this.outMeter.onTick();
/*     */       }
/*     */       catch (Exception e)
/*     */       {
/*  53 */         this.log.warn("Unexpected exception: " + e + ". NetworkStatsExecutor will resume on next call.");
/*     */       }
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.SFSStatsManager
 * JD-Core Version:    0.6.0
 */