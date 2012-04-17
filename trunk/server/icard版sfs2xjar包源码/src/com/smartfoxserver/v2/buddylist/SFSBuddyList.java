/*     */ package com.smartfoxserver.v2.buddylist;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*     */ import com.smartfoxserver.v2.exceptions.SFSBuddyListException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorCode;
/*     */ import com.smartfoxserver.v2.exceptions.SFSErrorData;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Collection;
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSBuddyList
/*     */   implements BuddyList
/*     */ {
/*     */   private final Logger log;
/*     */   private final String ownerName;
/*     */   private BuddyListManager buddyListManager;
/*     */   private final Map<String, Buddy> buddies;
/*     */   private final User owner;
/*     */ 
/*     */   public SFSBuddyList(String ownerName)
/*     */   {
/*  36 */     this(ownerName, null);
/*     */   }
/*     */ 
/*     */   public SFSBuddyList(String ownerName, BuddyListManager buddyListManager)
/*     */   {
/*  41 */     this.log = LoggerFactory.getLogger(getClass());
/*     */ 
/*  43 */     this.ownerName = ownerName;
/*  44 */     this.buddyListManager = buddyListManager;
/*  45 */     this.buddies = new ConcurrentHashMap();
/*  46 */     this.owner = buddyListManager.getZone().getUserByName(ownerName);
/*     */   }
/*     */ 
/*     */   public Buddy addBuddy(Buddy buddy)
/*     */     throws SFSBuddyListException
/*     */   {
/*  53 */     if (this.ownerName.equals(buddy.getName())) {
/*  54 */       throw new IllegalStateException(String.format("Cannot add yourself the BuddyList. %s, %s", new Object[] { this.owner, buddy }));
/*     */     }
/*     */ 
/*  57 */     if (!buddy.isTemp())
/*     */     {
/*  60 */       if (isFull())
/*     */       {
/*  62 */         SFSErrorData errData = new SFSErrorData(SFSErrorCode.BUDDY_LIST_FULL);
/*  63 */         errData.addParameter(String.valueOf(this.buddyListManager.getBuddyListMaxSize()));
/*     */ 
/*  65 */         throw new SFSBuddyListException("BuddyList is full. Current limit is set to: " + this.buddyListManager.getBuddyListMaxSize(), errData);
/*     */       }
/*     */ 
/*  75 */       Buddy previousBuddyItem = (Buddy)this.buddies.get(buddy.getName());
/*  76 */       if (previousBuddyItem != null)
/*     */       {
/*  82 */         if (previousBuddyItem.isTemp())
/*     */         {
/*  84 */           buddy = previousBuddyItem;
/*  85 */           buddy.setIsTemp(false);
/*     */         }
/*     */         else {
/*  88 */           throw new IllegalStateException("Buddy is already in the buddylist: " + buddy);
/*     */         }
/*     */ 
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/*  96 */     this.buddies.put(buddy.getName(), buddy);
/*     */ 
/*  98 */     if (this.log.isDebugEnabled()) {
/*  99 */       this.log.debug(String.format("Buddy: %s added to User: %s buddy-list.", new Object[] { buddy.getName(), this.owner.getName() }));
/*     */     }
/* 101 */     return buddy;
/*     */   }
/*     */ 
/*     */   public Buddy removeBuddy(String buddyName)
/*     */   {
/* 108 */     Buddy removedBuddy = null;
/*     */ 
/* 110 */     for (Iterator iter = this.buddies.values().iterator(); iter.hasNext(); )
/*     */     {
/* 112 */       Buddy item = (Buddy)iter.next();
/*     */ 
/* 114 */       if (!item.getName().equals(buddyName)) {
/*     */         continue;
/*     */       }
/* 117 */       iter.remove();
/*     */ 
/* 120 */       removedBuddy = item;
/*     */ 
/* 123 */       break;
/*     */     }
/*     */ 
/* 127 */     if (this.log.isDebugEnabled()) {
/* 128 */       this.log.debug(String.format("Removed buddy %s from %s buddylist", new Object[] { buddyName, this.owner }));
/*     */     }
/* 130 */     return removedBuddy;
/*     */   }
/*     */ 
/*     */   public boolean containsBuddy(String buddyName)
/*     */   {
/* 136 */     return this.buddies.containsKey(buddyName);
/*     */   }
/*     */ 
/*     */   public boolean isBuddyBlocked(String buddyName)
/*     */   {
/* 142 */     boolean res = false;
/* 143 */     Buddy buddy = (Buddy)this.buddies.get(buddyName);
/*     */ 
/* 145 */     if (buddy != null) {
/* 146 */       res = buddy.isBlocked();
/*     */     }
/* 148 */     return res;
/*     */   }
/*     */ 
/*     */   public int getSize()
/*     */   {
/* 157 */     int count = 0;
/* 158 */     for (Buddy item : this.buddies.values())
/*     */     {
/* 160 */       if (item.isTemp()) {
/* 161 */         count++;
/*     */       }
/*     */     }
/* 164 */     return getRuntimeSize() - count;
/*     */   }
/*     */ 
/*     */   public int getRuntimeSize()
/*     */   {
/* 173 */     return this.buddies.size();
/*     */   }
/*     */ 
/*     */   public boolean isEmpty()
/*     */   {
/* 179 */     return getSize() == 0;
/*     */   }
/*     */ 
/*     */   public boolean isFull()
/*     */   {
/* 185 */     return getSize() >= this.buddyListManager.getBuddyListMaxSize();
/*     */   }
/*     */ 
/*     */   public void clearAll()
/*     */   {
/* 192 */     this.buddies.clear();
/*     */   }
/*     */ 
/*     */   public Buddy getBuddy(String buddyName)
/*     */   {
/* 198 */     return (Buddy)this.buddies.get(buddyName);
/*     */   }
/*     */ 
/*     */   public List<Buddy> getBuddies()
/*     */   {
/* 205 */     return new ArrayList(this.buddies.values());
/*     */   }
/*     */ 
/*     */   public BuddyListManager getBuddyListManager()
/*     */   {
/* 211 */     return this.buddyListManager;
/*     */   }
/*     */ 
/*     */   public void setBuddyListManager(BuddyListManager buddyListManager)
/*     */   {
/* 217 */     if (this.buddyListManager != null) {
/* 218 */       throw new IllegalStateException("Cannot redefine BuddyManager in a BuddyList at runtime");
/*     */     }
/* 220 */     this.buddyListManager = buddyListManager;
/*     */   }
/*     */ 
/*     */   public String getOwnerName()
/*     */   {
/* 227 */     return this.ownerName;
/*     */   }
/*     */ 
/*     */   public User getOwner()
/*     */   {
/* 234 */     return this.owner;
/*     */   }
/*     */ 
/*     */   public ISFSArray toSFSArray()
/*     */   {
/* 240 */     ISFSArray buddyListData = new SFSArray();
/*     */ 
/* 242 */     for (Buddy buddy : this.buddies.values())
/*     */     {
/* 244 */       buddyListData.addSFSArray(buddy.toSFSArray());
/*     */     }
/*     */ 
/* 247 */     return buddyListData;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 253 */     return String.format(
/* 255 */       "[Owner: %s, Size: %s List: %s ]", new Object[] { 
/* 256 */       this.ownerName, 
/* 257 */       Integer.valueOf(this.buddies.size()), 
/* 258 */       this.buddies.toString() });
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.SFSBuddyList
 * JD-Core Version:    0.6.0
 */