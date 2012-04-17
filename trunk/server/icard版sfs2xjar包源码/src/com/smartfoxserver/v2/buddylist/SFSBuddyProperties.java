/*     */ package com.smartfoxserver.v2.buddylist;
/*     */ 
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ 
/*     */ public class SFSBuddyProperties
/*     */   implements BuddyProperties
/*     */ {
/*     */   private Map<String, BuddyVariable> variables;
/*  15 */   private volatile boolean updated = false;
/*  16 */   private volatile boolean inited = false;
/*     */ 
/*     */   public boolean isInited()
/*     */   {
/*  21 */     return this.inited;
/*     */   }
/*     */ 
/*     */   public void setInited()
/*     */   {
/*  27 */     if (this.inited) {
/*  28 */       throw new IllegalStateException("BuddyProperties already inited.");
/*     */     }
/*  30 */     this.inited = true;
/*     */   }
/*     */ 
/*     */   public boolean containsVariable(String varName)
/*     */   {
/*  36 */     if (this.variables == null) {
/*  37 */       return false;
/*     */     }
/*  39 */     return this.variables.containsKey(varName);
/*     */   }
/*     */ 
/*     */   public String getNickName()
/*     */   {
/*  45 */     if (this.variables == null) {
/*  46 */       return null;
/*     */     }
/*  48 */     return (String)getBuddyVariableValue("$__BV_NICKNAME__");
/*     */   }
/*     */ 
/*     */   public String getState()
/*     */   {
/*  55 */     if (this.variables == null) {
/*  56 */       return null;
/*     */     }
/*  58 */     return (String)getBuddyVariableValue("$__BV_STATE__");
/*     */   }
/*     */ 
/*     */   public boolean isOnline()
/*     */   {
/*  65 */     boolean result = true;
/*     */ 
/*  67 */     if (this.variables != null)
/*     */     {
/*  69 */       Boolean flag = (Boolean)getBuddyVariableValue("$__BV_ONLINE__");
/*     */ 
/*  71 */       if (flag != null) {
/*  72 */         result = flag.booleanValue();
/*     */       }
/*     */     }
/*  75 */     return result;
/*     */   }
/*     */ 
/*     */   private Object getBuddyVariableValue(String varName)
/*     */   {
/*  80 */     Object value = null;
/*  81 */     BuddyVariable var = (BuddyVariable)this.variables.get(varName);
/*     */ 
/*  83 */     if (var != null) {
/*  84 */       value = var.getValue();
/*     */     }
/*  86 */     return value;
/*     */   }
/*     */ 
/*     */   public BuddyVariable getVariable(String varName)
/*     */   {
/*  92 */     if (this.variables == null) {
/*  93 */       return null;
/*     */     }
/*  95 */     return (BuddyVariable)this.variables.get(varName);
/*     */   }
/*     */ 
/*     */   public List<BuddyVariable> getVariables()
/*     */   {
/* 101 */     if (this.variables == null) {
/* 102 */       return null;
/*     */     }
/* 104 */     return new ArrayList(this.variables.values());
/*     */   }
/*     */ 
/*     */   public int getVariablesCount()
/*     */   {
/* 110 */     if (this.variables == null) {
/* 111 */       return 0;
/*     */     }
/* 113 */     return this.variables.size();
/*     */   }
/*     */ 
/*     */   public void removeVariable(String varName)
/*     */   {
/* 120 */     if (this.variables != null)
/* 121 */       this.variables.remove(varName);
/*     */   }
/*     */ 
/*     */   public void setNickName(String buddyNickName)
/*     */   {
/* 127 */     setVariable(new SFSBuddyVariable("$__BV_NICKNAME__", buddyNickName));
/*     */   }
/*     */ 
/*     */   public void setOnline(boolean flag)
/*     */   {
/* 133 */     setVariable(new SFSBuddyVariable("$__BV_ONLINE__", Boolean.valueOf(flag)));
/*     */   }
/*     */ 
/*     */   public void setState(String state)
/*     */   {
/* 139 */     setVariable(new SFSBuddyVariable("$__BV_STATE__", state));
/*     */   }
/*     */ 
/*     */   public void setVariable(BuddyVariable buddyVariable)
/*     */   {
/* 145 */     lazyInit();
/* 146 */     this.variables.put(buddyVariable.getName(), buddyVariable);
/*     */   }
/*     */ 
/*     */   public void setVariables(List<BuddyVariable> buddyVariables)
/*     */   {
/* 152 */     if (buddyVariables != null)
/*     */     {
/* 154 */       lazyInit();
/*     */ 
/* 156 */       for (BuddyVariable bVar : buddyVariables)
/* 157 */         this.variables.put(bVar.getName(), bVar);
/*     */     }
/*     */   }
/*     */ 
/*     */   public boolean isChangedSinceLastSave()
/*     */   {
/* 164 */     return this.updated;
/*     */   }
/*     */ 
/*     */   public void setChangedSinceLastSave(boolean flag)
/*     */   {
/* 170 */     this.updated = flag;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 176 */     return this.variables.toString();
/*     */   }
/*     */ 
/*     */   private synchronized void lazyInit()
/*     */   {
/* 183 */     if (this.variables == null)
/* 184 */       this.variables = new ConcurrentHashMap();
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.SFSBuddyProperties
 * JD-Core Version:    0.6.0
 */