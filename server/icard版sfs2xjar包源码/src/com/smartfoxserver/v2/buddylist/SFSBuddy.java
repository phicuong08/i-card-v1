/*     */ package com.smartfoxserver.v2.buddylist;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*     */ import java.util.List;
/*     */ 
/*     */ public class SFSBuddy
/*     */   implements Buddy
/*     */ {
/*     */   private final String name;
/*     */   private volatile boolean blocked;
/*     */   private volatile boolean temp;
/*     */   private BuddyList buddyList;
/*     */ 
/*     */   public SFSBuddy(String name)
/*     */   {
/*  73 */     this(name, false);
/*     */   }
/*     */ 
/*     */   public SFSBuddy(String name, boolean isTemp)
/*     */   {
/*  78 */     this.name = name;
/*  79 */     this.blocked = false;
/*  80 */     this.temp = isTemp;
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/*  86 */     return this.name;
/*     */   }
/*     */ 
/*     */   public BuddyList getParentBuddyList()
/*     */   {
/*  92 */     return this.buddyList;
/*     */   }
/*     */ 
/*     */   public void setParentBuddyList(BuddyList parentList)
/*     */   {
/*  98 */     if (this.buddyList != null) {
/*  99 */       throw new IllegalStateException("Parent BuddyList cannot be changed at runtime.");
/*     */     }
/* 101 */     this.buddyList = parentList;
/*     */   }
/*     */ 
/*     */   public String getState()
/*     */   {
/* 107 */     BuddyVariable bv = getVariable("$__BV_STATE__");
/* 108 */     return bv == null ? null : bv.getStringValue();
/*     */   }
/*     */ 
/*     */   public String getNickName()
/*     */   {
/* 114 */     BuddyVariable bv = getVariable("$__BV_NICKNAME__");
/* 115 */     return bv == null ? null : bv.getStringValue();
/*     */   }
/*     */ 
/*     */   public boolean hasVariables()
/*     */   {
/* 121 */     int varCount = 0;
/*     */ 
/* 123 */     User user = getRelatedUser();
/*     */ 
/* 125 */     if (user != null) {
/* 126 */       varCount = user.getBuddyProperties().getVariablesCount();
/*     */     }
/* 128 */     return varCount > 0;
/*     */   }
/*     */ 
/*     */   public BuddyVariable getVariable(String varName)
/*     */   {
/* 145 */     User user = getRelatedUser();
/* 146 */     BuddyVariable var = null;
/*     */ 
/* 149 */     if (user != null) {
/* 150 */       var = user.getBuddyProperties().getVariable(varName);
/*     */     }
/*     */     else
/*     */     {
/* 154 */       var = getParentBuddyList().getBuddyListManager().getOfflineBuddyVariable(this.name, varName);
/*     */     }
/* 156 */     return var;
/*     */   }
/*     */ 
/*     */   public List<BuddyVariable> getVariables()
/*     */   {
/* 162 */     User user = getRelatedUser();
/* 163 */     List variables = null;
/*     */ 
/* 166 */     if (user != null) {
/* 167 */       variables = user.getBuddyProperties().getVariables();
/*     */     }
/*     */     else
/*     */     {
/* 171 */       variables = getParentBuddyList().getBuddyListManager().getOfflineBuddyVariables(this.name);
/*     */     }
/* 173 */     return variables;
/*     */   }
/*     */ 
/*     */   public boolean isBlocked()
/*     */   {
/* 179 */     return this.blocked;
/*     */   }
/*     */ 
/*     */   public boolean isOnline()
/*     */   {
/* 188 */     boolean isOnline = true;
/* 189 */     User user = getRelatedUser();
/*     */ 
/* 191 */     if (user != null) {
/* 192 */       isOnline = user.getBuddyProperties().isOnline();
/*     */     }
/* 194 */     return isOnline;
/*     */   }
/*     */ 
/*     */   public boolean isTemp()
/*     */   {
/* 200 */     return this.temp;
/*     */   }
/*     */ 
/*     */   public void setIsTemp(boolean value)
/*     */   {
/* 206 */     this.temp = value;
/*     */   }
/*     */ 
/*     */   public void setBlocked(boolean value)
/*     */   {
/* 212 */     this.blocked = value;
/*     */   }
/*     */ 
/*     */   public void setVariable(BuddyVariable buddyVariable)
/*     */   {
/* 219 */     User user = getRelatedUser();
/*     */ 
/* 221 */     if (user != null)
/* 222 */       user.getBuddyProperties().setVariable(buddyVariable);
/*     */   }
/*     */ 
/*     */   public void setVariables(List<BuddyVariable> buddyVariables)
/*     */   {
/* 230 */     User user = getRelatedUser();
/*     */ 
/* 232 */     if (user != null)
/* 233 */       user.getBuddyProperties().setVariables(buddyVariables);
/*     */   }
/*     */ 
/*     */   public ISFSArray toSFSArray()
/*     */   {
/* 239 */     ISFSArray buddyData = new SFSArray();
/* 240 */     User relatedUser = getRelatedUser();
/*     */ 
/* 243 */     buddyData.addInt(relatedUser != null ? relatedUser.getId() : -1);
/*     */ 
/* 246 */     buddyData.addUtfString(this.name);
/*     */ 
/* 249 */     buddyData.addBool(isBlocked());
/*     */ 
/* 252 */     buddyData.addSFSArray(getBuddyVariablesData());
/*     */ 
/* 255 */     if (this.temp) {
/* 256 */       buddyData.addBool(true);
/*     */     }
/* 258 */     return buddyData;
/*     */   }
/*     */ 
/*     */   public ISFSArray getBuddyVariablesData()
/*     */   {
/* 264 */     ISFSArray variablesData = SFSArray.newInstance();
/*     */ 
/* 266 */     List vars = getVariables();
/* 267 */     if (vars != null)
/*     */     {
/* 269 */       for (BuddyVariable var : vars)
/*     */       {
/* 271 */         variablesData.addSFSArray(var.toSFSArray());
/*     */       }
/*     */     }
/*     */ 
/* 275 */     return variablesData;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 281 */     return String.format(
/* 283 */       "{ Buddy: %s, Blk: %s, Tmp: %s }", new Object[] { 
/* 284 */       this.name, 
/* 285 */       Boolean.valueOf(this.blocked), 
/* 286 */       Boolean.valueOf(this.temp) });
/*     */   }
/*     */ 
/*     */   private User getRelatedUser()
/*     */   {
/* 296 */     return this.buddyList.getBuddyListManager().getZone().getUserByName(this.name);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.SFSBuddy
 * JD-Core Version:    0.6.0
 */