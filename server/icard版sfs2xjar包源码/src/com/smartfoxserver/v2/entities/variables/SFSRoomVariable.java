/*     */ package com.smartfoxserver.v2.entities.variables;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ 
/*     */ public class SFSRoomVariable extends SFSUserVariable
/*     */   implements RoomVariable
/*     */ {
/*     */   private volatile boolean _private;
/*     */   private volatile boolean _persistent;
/*     */   private volatile boolean _global;
/*     */   private User _owner;
/*     */ 
/*     */   private SFSRoomVariable(String name)
/*     */   {
/*  43 */     super(name);
/*     */   }
/*     */ 
/*     */   private SFSRoomVariable(String name, String type, String literal)
/*     */   {
/*  48 */     super(name, VariableType.fromString(type), literal);
/*     */   }
/*     */ 
/*     */   public SFSRoomVariable(String name, Object value)
/*     */   {
/*  59 */     this(name, value, false, false, false);
/*     */   }
/*     */ 
/*     */   public SFSRoomVariable(String name, Object value, boolean isPrivate, boolean isPersistent, boolean isGlobal)
/*     */   {
/*  73 */     super(name, value);
/*  74 */     this._private = isPrivate;
/*  75 */     this._persistent = isPersistent;
/*  76 */     this._global = isGlobal;
/*     */   }
/*     */ 
/*     */   public static SFSRoomVariable newFromStringLiteral(String name, String type, String literal)
/*     */   {
/*  81 */     return new SFSRoomVariable(name, type, literal);
/*     */   }
/*     */ 
/*     */   public static SFSRoomVariable newFromSFSArray(ISFSArray array)
/*     */   {
/*  98 */     return new SFSRoomVariable(
/* 100 */       array.getUtfString(0), 
/* 101 */       array.getElementAt(2), 
/* 102 */       array.getBool(3).booleanValue(), 
/* 103 */       array.getBool(4).booleanValue(), 
/* 104 */       false);
/*     */   }
/*     */ 
/*     */   public boolean isGlobal()
/*     */   {
/* 114 */     return this._global;
/*     */   }
/*     */ 
/*     */   public boolean isPersistent()
/*     */   {
/* 123 */     return this._persistent;
/*     */   }
/*     */ 
/*     */   public boolean isPrivate()
/*     */   {
/* 132 */     return this._private;
/*     */   }
/*     */ 
/*     */   public void setGlobal(boolean flag)
/*     */   {
/* 141 */     this._global = flag;
/*     */   }
/*     */ 
/*     */   public void setPersistent(boolean flag)
/*     */   {
/* 150 */     this._persistent = flag;
/*     */   }
/*     */ 
/*     */   public void setPrivate(boolean flag)
/*     */   {
/* 159 */     this._private = flag;
/*     */   }
/*     */ 
/*     */   public User getOwner()
/*     */   {
/* 168 */     return this._owner;
/*     */   }
/*     */ 
/*     */   public void setOwner(User user)
/*     */   {
/* 177 */     this._owner = user;
/*     */   }
/*     */ 
/*     */   public ISFSArray toSFSArray()
/*     */   {
/* 184 */     ISFSArray sfsa = super.toSFSArray();
/*     */ 
/* 187 */     sfsa.addBool(isPrivate());
/*     */ 
/* 190 */     sfsa.addBool(isPersistent());
/*     */ 
/* 192 */     return sfsa;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 198 */     return String.format(
/* 200 */       "{ N: %s, T: %s, V: %s, Pr: %s, Ps: %s, G: %s, H: %s, Owner: %s }", new Object[] { 
/* 201 */       this.name, 
/* 202 */       this.type, 
/* 203 */       this.value, 
/* 204 */       Boolean.valueOf(this._private), 
/* 205 */       Boolean.valueOf(this._persistent), 
/* 206 */       Boolean.valueOf(this._global), 
/* 207 */       Boolean.valueOf(isHidden()), 
/* 208 */       this._owner == null ? "<Server>" : this._owner.toString() });
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.variables.SFSRoomVariable
 * JD-Core Version:    0.6.0
 */