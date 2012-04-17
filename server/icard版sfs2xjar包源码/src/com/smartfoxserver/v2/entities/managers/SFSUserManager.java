/*     */ package com.smartfoxserver.v2.entities.managers;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*     */ import com.smartfoxserver.bitswarm.sessions.ISessionManager;
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.api.APIManager;
/*     */ import com.smartfoxserver.v2.api.ISFSApi;
/*     */ import com.smartfoxserver.v2.core.BaseCoreService;
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import com.smartfoxserver.v2.util.ClientDisconnectionReason;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Collection;
/*     */ import java.util.List;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import java.util.concurrent.ConcurrentMap;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public final class SFSUserManager extends BaseCoreService
/*     */   implements IUserManager
/*     */ {
/*     */   private final ConcurrentMap<String, User> usersByName;
/*     */   private final ConcurrentMap<ISession, User> usersBySession;
/*     */   private final ConcurrentMap<Integer, User> usersById;
/*     */   private Room ownerRoom;
/*     */   private Zone ownerZone;
/*     */   private Logger logger;
/*     */ 
/*     */   public SFSUserManager()
/*     */   {
/*  34 */     this.logger = LoggerFactory.getLogger(getClass());
/*     */ 
/*  36 */     this.usersBySession = new ConcurrentHashMap();
/*  37 */     this.usersByName = new ConcurrentHashMap();
/*  38 */     this.usersById = new ConcurrentHashMap();
/*     */ 
/*  40 */     this.name = "UserManagerService";
/*  41 */     this.active = true;
/*     */   }
/*     */ 
/*     */   public void addUser(User user)
/*     */   {
/*  47 */     if (containsId(user.getId())) {
/*  48 */       throw new SFSRuntimeException("Can't add User: " + user.getName() + " - Already exists in Room: " + this.ownerRoom + ", Zone: " + this.ownerZone);
/*     */     }
/*  50 */     this.usersById.put(Integer.valueOf(user.getId()), user);
/*  51 */     this.usersByName.put(user.getName(), user);
/*  52 */     this.usersBySession.put(user.getSession(), user);
/*     */   }
/*     */ 
/*     */   public User getUserById(int id)
/*     */   {
/*  58 */     return (User)this.usersById.get(Integer.valueOf(id));
/*     */   }
/*     */ 
/*     */   public User getUserByName(String name)
/*     */   {
/*  64 */     return (User)this.usersByName.get(name);
/*     */   }
/*     */ 
/*     */   public User getUserBySession(ISession session)
/*     */   {
/*  70 */     return (User)this.usersBySession.get(session);
/*     */   }
/*     */ 
/*     */   public void removeUser(int userId)
/*     */   {
/*  76 */     User user = (User)this.usersById.get(Integer.valueOf(userId));
/*     */ 
/*  78 */     if (user == null)
/*  79 */       this.logger.warn("Can't remove user with ID: " + userId + ". User was not found.");
/*     */     else
/*  81 */       removeUser(user);
/*     */   }
/*     */ 
/*     */   public void removeUser(String name)
/*     */   {
/*  87 */     User user = (User)this.usersByName.get(name);
/*     */ 
/*  89 */     if (user == null)
/*  90 */       this.logger.warn("Can't remove user with name: " + name + ". User was not found.");
/*     */     else
/*  92 */       removeUser(user);
/*     */   }
/*     */ 
/*     */   public void removeUser(ISession session)
/*     */   {
/*  98 */     User user = (User)this.usersBySession.get(session);
/*     */ 
/* 100 */     if (user == null) {
/* 101 */       throw new SFSRuntimeException("Can't remove user with session: " + session + ". User was not found.");
/*     */     }
/* 103 */     removeUser(user);
/*     */   }
/*     */ 
/*     */   public void removeUser(User user)
/*     */   {
/* 110 */     this.usersById.remove(Integer.valueOf(user.getId()));
/* 111 */     this.usersByName.remove(user.getName());
/* 112 */     this.usersBySession.remove(user.getSession());
/*     */   }
/*     */ 
/*     */   public boolean containsId(int userId)
/*     */   {
/* 118 */     return this.usersById.containsKey(Integer.valueOf(userId));
/*     */   }
/*     */ 
/*     */   public boolean containsName(String name)
/*     */   {
/* 124 */     return this.usersByName.containsKey(name);
/*     */   }
/*     */ 
/*     */   public boolean containsSessions(ISession session)
/*     */   {
/* 130 */     return this.usersBySession.containsKey(session);
/*     */   }
/*     */ 
/*     */   public boolean containsUser(User user)
/*     */   {
/* 136 */     return this.usersById.containsValue(user);
/*     */   }
/*     */ 
/*     */   public Room getOwnerRoom()
/*     */   {
/* 141 */     return this.ownerRoom;
/*     */   }
/*     */ 
/*     */   public void setOwnerRoom(Room ownerRoom)
/*     */   {
/* 146 */     this.ownerRoom = ownerRoom;
/*     */   }
/*     */ 
/*     */   public Zone getOwnerZone()
/*     */   {
/* 151 */     return this.ownerZone;
/*     */   }
/*     */ 
/*     */   public void setOwnerZone(Zone ownerZone)
/*     */   {
/* 156 */     this.ownerZone = ownerZone;
/*     */   }
/*     */ 
/*     */   public List<User> getAllUsers()
/*     */   {
/* 162 */     return new ArrayList(this.usersById.values());
/*     */   }
/*     */ 
/*     */   public List<ISession> getAllSessions()
/*     */   {
/* 168 */     return new ArrayList(this.usersBySession.keySet());
/*     */   }
/*     */ 
/*     */   public int getUserCount()
/*     */   {
/* 174 */     return this.usersById.values().size();
/*     */   }
/*     */ 
/*     */   public void disconnectUser(int userId)
/*     */   {
/* 180 */     User user = (User)this.usersById.get(Integer.valueOf(userId));
/*     */ 
/* 182 */     if (user == null)
/* 183 */       this.logger.warn("Can't disconnect user with id: " + userId + ". User was not found.");
/*     */     else
/* 185 */       disconnectUser(user);
/*     */   }
/*     */ 
/*     */   public void disconnectUser(ISession session)
/*     */   {
/* 191 */     User user = (User)this.usersBySession.get(session);
/*     */ 
/* 193 */     if (user == null)
/* 194 */       this.logger.warn("Can't disconnect user with session: " + session + ". User was not found.");
/*     */     else
/* 196 */       disconnectUser(user);
/*     */   }
/*     */ 
/*     */   public void disconnectUser(String name)
/*     */   {
/* 202 */     User user = (User)this.usersByName.get(name);
/*     */ 
/* 204 */     if (user == null)
/* 205 */       this.logger.warn("Can't disconnect user with name: " + name + ". User was not found.");
/*     */     else
/* 207 */       disconnectUser(user);
/*     */   }
/*     */ 
/*     */   public void disconnectUser(User user)
/*     */   {
/* 220 */     removeUser(user);
/*     */   }
/*     */ 
/*     */   public void purgeOrphanedUsers()
/*     */   {
/* 229 */     ISessionManager mgr = SmartFoxServer.getInstance().getSessionManager();
/* 230 */     ISFSApi api = SmartFoxServer.getInstance().getAPIManager().getSFSApi();
/* 231 */     int tot = 0;
/*     */ 
/* 233 */     for (ISession session : this.usersBySession.keySet())
/*     */     {
/* 235 */       if (mgr.containsSession(session))
/*     */         continue;
/* 237 */       User evictable = (User)this.usersBySession.get(session);
/* 238 */       api.disconnectUser(evictable, ClientDisconnectionReason.KICK);
/* 239 */       tot++;
/*     */     }
/*     */ 
/* 243 */     this.logger.info("Evicted " + tot + " users.");
/*     */   }
/*     */ 
/*     */   private String getOwnerDetails()
/*     */   {
/* 251 */     StringBuilder sb = new StringBuilder();
/*     */ 
/* 253 */     if (this.ownerZone != null)
/*     */     {
/* 255 */       sb.append("Zone: ").append(this.ownerZone.getName());
/*     */     }
/* 258 */     else if (this.ownerRoom != null)
/*     */     {
/* 260 */       sb.append("Zone: ")
/* 261 */         .append(this.ownerRoom.getZone().getName())
/* 262 */         .append("Room: ")
/* 263 */         .append(this.ownerRoom.getName())
/* 264 */         .append(", Room Id: ")
/* 265 */         .append(this.ownerRoom.getId());
/*     */     }
/*     */ 
/* 268 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   private void populateTransientFields()
/*     */   {
/* 277 */     this.logger = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.SFSUserManager
 * JD-Core Version:    0.6.0
 */