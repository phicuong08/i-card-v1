/*     */ package com.smartfoxserver.v2.buddylist;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import com.smartfoxserver.v2.exceptions.SFSBuddyListException;
/*     */ import java.util.List;
/*     */ 
/*     */ public class BuddyUtils
/*     */ {
/*     */   private static final String KEY_OWNER_NAME = "on";
/*     */   private static final String KEY_BLIST = "bl";
/*     */   private static final String KEY_BUDDY_NAME = "bn";
/*     */   private static final String KEY_BUDDY_BLOCKED = "bb";
/*     */   private static final String KEY_BUDDY_STATE = "bs";
/*     */   private static final String KEY_BUDDY_TEMP = "bt";
/*     */   private static final String KEY_BUDDY_VARS = "bvs";
/*     */ 
/*     */   public static BuddyVariable findVariable(List<BuddyVariable> vars, String varName)
/*     */   {
/*  27 */     for (BuddyVariable bv : vars)
/*     */     {
/*  29 */       if (bv.getName().equals(varName)) {
/*  30 */         return bv;
/*     */       }
/*     */     }
/*  33 */     return null;
/*     */   }
/*     */ 
/*     */   public static ISFSObject toSFSObject(BuddyList buddyList, boolean excludeTemporaryBuddies)
/*     */   {
/*  42 */     ISFSObject sfso = SFSObject.newInstance();
/*  43 */     ISFSArray sfsa = SFSArray.newInstance();
/*     */ 
/*  45 */     sfso.putUtfString("on", buddyList.getOwnerName());
/*  46 */     sfso.putSFSArray("bl", sfsa);
/*     */ 
/*  48 */     for (Buddy buddy : buddyList.getBuddies())
/*     */     {
/*  51 */       if ((excludeTemporaryBuddies) && (buddy.isTemp())) {
/*     */         continue;
/*     */       }
/*  54 */       sfsa.addSFSObject(encodeBuddy(buddy));
/*     */     }
/*     */ 
/*  57 */     return sfso;
/*     */   }
/*     */ 
/*     */   public static ISFSObject encodeBuddy(Buddy buddy)
/*     */   {
/*  65 */     ISFSObject buddyObj = SFSObject.newInstance();
/*     */ 
/*  67 */     buddyObj.putUtfString("bn", buddy.getName());
/*  68 */     buddyObj.putBool("bb", buddy.isBlocked());
/*  69 */     buddyObj.putBool("bt", buddy.isTemp());
/*  70 */     buddyObj.putUtfString("bs", buddy.getState());
/*     */ 
/*  72 */     if (buddy.hasVariables()) {
/*  73 */       buddyObj.putSFSArray("bvs", encodeBuddyVariables(buddy.getVariables()));
/*     */     }
/*  75 */     return buddyObj;
/*     */   }
/*     */ 
/*     */   public static ISFSArray encodeBuddyVariables(List<BuddyVariable> buddyVariables)
/*     */   {
/*  80 */     ISFSArray arr = SFSArray.newInstance();
/*     */ 
/*  82 */     for (BuddyVariable bVar : buddyVariables)
/*     */     {
/*  84 */       arr.addSFSArray(bVar.toSFSArray());
/*     */     }
/*     */ 
/*  87 */     return arr;
/*     */   }
/*     */ 
/*     */   public static BuddyList fromSFSObject(ISFSObject sfso)
/*     */     throws SFSBuddyListException
/*     */   {
/*  96 */     BuddyList buddyList = new SFSBuddyList(sfso.getUtfString("on"));
/*  97 */     ISFSArray bListData = sfso.getSFSArray("bl");
/*     */ 
/*  99 */     for (int i = 0; i < bListData.size(); i++)
/*     */     {
/* 101 */       buddyList.addBuddy(decodeBuddy(bListData.getSFSObject(i)));
/*     */     }
/*     */ 
/* 104 */     return buddyList;
/*     */   }
/*     */ 
/*     */   private static Buddy decodeBuddy(ISFSObject buddyObj)
/*     */   {
/* 109 */     Buddy buddy = new SFSBuddy(buddyObj.getUtfString("bn"), buddyObj.getBool("bt").booleanValue());
/*     */ 
/* 111 */     buddy.setBlocked(buddyObj.getBool("bb").booleanValue());
/*     */ 
/* 114 */     return buddy;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.BuddyUtils
 * JD-Core Version:    0.6.0
 */