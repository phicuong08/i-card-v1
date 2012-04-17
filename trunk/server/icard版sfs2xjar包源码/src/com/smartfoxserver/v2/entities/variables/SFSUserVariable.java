/*     */ package com.smartfoxserver.v2.entities.variables;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ 
/*     */ public class SFSUserVariable
/*     */   implements UserVariable
/*     */ {
/*     */   protected String name;
/*     */   protected volatile Object value;
/*     */   protected VariableType type;
/*     */   protected volatile boolean hidden;
/*     */ 
/*     */   public static SFSUserVariable newInstance(String name, Object value)
/*     */   {
/*  41 */     return new SFSUserVariable(name, value);
/*     */   }
/*     */ 
/*     */   public static SFSUserVariable newFromStringLiteral(String name, String type, String literal)
/*     */   {
/*  46 */     return new SFSUserVariable(name, type, literal);
/*     */   }
/*     */ 
/*     */   public static SFSUserVariable newFromSFSArray(ISFSArray array)
/*     */   {
/*  63 */     return new SFSUserVariable(
/*  64 */       array.getUtfString(0), 
/*  65 */       array.getElementAt(2));
/*     */   }
/*     */ 
/*     */   public SFSUserVariable(String name, Object value)
/*     */   {
/*  79 */     this(name, value, false);
/*     */   }
/*     */ 
/*     */   public SFSUserVariable(String name, Object value, boolean isHidden)
/*     */   {
/*  91 */     this(name);
/*  92 */     setValue(value);
/*  93 */     this.hidden = isHidden;
/*     */   }
/*     */ 
/*     */   protected SFSUserVariable(String name)
/*     */   {
/* 100 */     this.name = name;
/* 101 */     this.hidden = false;
/*     */   }
/*     */ 
/*     */   protected SFSUserVariable(String name, VariableType type, String literal)
/*     */   {
/* 106 */     this(name);
/* 107 */     setValueFromStringLiteral(type, literal);
/*     */   }
/*     */ 
/*     */   protected SFSUserVariable(String name, String type, String literal)
/*     */   {
/* 113 */     this(name, VariableType.fromString(type), literal);
/*     */   }
/*     */ 
/*     */   public boolean isHidden()
/*     */   {
/* 122 */     return this.hidden;
/*     */   }
/*     */ 
/*     */   public void setHidden(boolean flag)
/*     */   {
/* 129 */     this.hidden = flag;
/*     */   }
/*     */ 
/*     */   protected void setValueFromStringLiteral(VariableType type, String literal)
/*     */   {
/* 137 */     if (type == VariableType.NULL)
/*     */     {
/* 139 */       setNull();
/*     */     }
/* 141 */     else if (type == VariableType.BOOL)
/*     */     {
/* 143 */       setValue(Boolean.valueOf(Boolean.parseBoolean(literal)));
/*     */     }
/* 145 */     else if (type == VariableType.INT)
/*     */     {
/* 147 */       setValue(Integer.valueOf(Integer.parseInt(literal)));
/*     */     }
/* 149 */     else if (type == VariableType.DOUBLE)
/*     */     {
/* 151 */       setValue(Double.valueOf(Double.parseDouble(literal)));
/*     */     }
/* 153 */     else if (type == VariableType.STRING)
/*     */     {
/* 155 */       setValue(literal);
/*     */     }
/* 157 */     else if (type == VariableType.ARRAY)
/*     */     {
/* 159 */       setValue(SFSArray.newFromJsonData(literal));
/*     */     }
/* 161 */     else if (type == VariableType.OBJECT)
/*     */     {
/* 163 */       setValue(SFSObject.newFromJsonData(literal));
/*     */     }
/*     */   }
/*     */ 
/*     */   public VariableType getType()
/*     */   {
/* 171 */     return this.type;
/*     */   }
/*     */ 
/*     */   public Boolean getBoolValue()
/*     */   {
/* 178 */     return (Boolean)this.value;
/*     */   }
/*     */ 
/*     */   public Double getDoubleValue()
/*     */   {
/* 185 */     return (Double)this.value;
/*     */   }
/*     */ 
/*     */   public Integer getIntValue()
/*     */   {
/* 192 */     return (Integer)this.value;
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/* 199 */     return this.name;
/*     */   }
/*     */ 
/*     */   public ISFSArray getSFSArrayValue()
/*     */   {
/* 206 */     return (ISFSArray)this.value;
/*     */   }
/*     */ 
/*     */   public ISFSObject getSFSObjectValue()
/*     */   {
/* 213 */     return (ISFSObject)this.value;
/*     */   }
/*     */ 
/*     */   public String getStringValue()
/*     */   {
/* 220 */     return (String)this.value;
/*     */   }
/*     */ 
/*     */   public Object getValue()
/*     */   {
/* 227 */     return this.value;
/*     */   }
/*     */ 
/*     */   public boolean isNull()
/*     */   {
/* 234 */     return this.type == VariableType.NULL;
/*     */   }
/*     */ 
/*     */   public void setNull()
/*     */   {
/* 240 */     this.value = null;
/* 241 */     this.type = VariableType.NULL;
/*     */   }
/*     */ 
/*     */   protected void setValue(Boolean val)
/*     */   {
/* 246 */     this.type = VariableType.BOOL;
/* 247 */     this.value = val;
/*     */   }
/*     */ 
/*     */   protected void setValue(Double val)
/*     */   {
/* 252 */     this.type = VariableType.DOUBLE;
/* 253 */     this.value = val;
/*     */   }
/*     */ 
/*     */   protected void setValue(Integer val)
/*     */   {
/* 258 */     this.type = VariableType.INT;
/* 259 */     this.value = val;
/*     */   }
/*     */ 
/*     */   protected void setValue(ISFSArray val)
/*     */   {
/* 264 */     this.type = VariableType.ARRAY;
/* 265 */     this.value = val;
/*     */   }
/*     */ 
/*     */   protected void setValue(ISFSObject val)
/*     */   {
/* 270 */     this.type = VariableType.OBJECT;
/* 271 */     this.value = val;
/*     */   }
/*     */ 
/*     */   protected void setValue(Object val)
/*     */   {
/* 276 */     if (val == null) {
/* 277 */       this.type = VariableType.NULL;
/*     */     }
/* 279 */     else if ((val instanceof Boolean)) {
/* 280 */       setValue((Boolean)val);
/*     */     }
/* 282 */     else if ((val instanceof Byte)) {
/* 283 */       setValue(Integer.valueOf(((Byte)val).intValue()));
/*     */     }
/* 285 */     else if ((val instanceof Short)) {
/* 286 */       setValue(Integer.valueOf(((Short)val).intValue()));
/*     */     }
/* 288 */     else if ((val instanceof Integer)) {
/* 289 */       setValue((Integer)val);
/*     */     }
/* 291 */     else if ((val instanceof Long)) {
/* 292 */       setValue(Double.valueOf(((Long)val).doubleValue()));
/*     */     }
/* 294 */     else if ((val instanceof Float)) {
/* 295 */       setValue(Double.valueOf(((Float)val).doubleValue()));
/*     */     }
/* 297 */     else if ((val instanceof Double)) {
/* 298 */       setValue((Double)val);
/*     */     }
/* 300 */     else if ((val instanceof String)) {
/* 301 */       setValue((String)val);
/*     */     }
/* 303 */     else if ((val instanceof ISFSArray)) {
/* 304 */       setValue((ISFSArray)val);
/*     */     }
/* 306 */     else if ((val instanceof ISFSObject))
/* 307 */       setValue((ISFSObject)val);
/*     */   }
/*     */ 
/*     */   public ISFSArray toSFSArray()
/*     */   {
/* 312 */     ISFSArray sfsa = SFSArray.newInstance();
/*     */ 
/* 315 */     sfsa.addUtfString(this.name);
/*     */ 
/* 318 */     sfsa.addByte((byte)this.type.getId());
/*     */ 
/* 321 */     populateArrayWithValue(sfsa);
/*     */ 
/* 323 */     return sfsa;
/*     */   }
/*     */ 
/*     */   protected void populateArrayWithValue(ISFSArray sfsa)
/*     */   {
/* 333 */     switch ($SWITCH_TABLE$com$smartfoxserver$v2$entities$variables$VariableType()[this.type.ordinal()])
/*     */     {
/*     */     case 1:
/* 336 */       sfsa.addNull();
/* 337 */       break;
/*     */     case 2:
/* 340 */       sfsa.addBool(getBoolValue().booleanValue());
/* 341 */       break;
/*     */     case 3:
/* 344 */       sfsa.addInt(getIntValue().intValue());
/* 345 */       break;
/*     */     case 4:
/* 348 */       sfsa.addDouble(getDoubleValue().doubleValue());
/* 349 */       break;
/*     */     case 5:
/* 352 */       sfsa.addUtfString(getStringValue());
/* 353 */       break;
/*     */     case 6:
/* 356 */       sfsa.addSFSObject(getSFSObjectValue());
/* 357 */       break;
/*     */     case 7:
/* 360 */       sfsa.addSFSArray(getSFSArrayValue());
/*     */     }
/*     */   }
/*     */ 
/*     */   protected void setValue(String val)
/*     */   {
/* 367 */     this.type = VariableType.STRING;
/* 368 */     this.value = val;
/*     */   }
/*     */ 
/*     */   public Object clone()
/*     */   {
/*     */     try
/*     */     {
/* 380 */       return super.clone();
/*     */     }
/*     */     catch (CloneNotSupportedException e) {
/*     */     }
/* 384 */     throw new SFSRuntimeException("Clone Error! " + e.getMessage() + ", " + toString());
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 391 */     return String.format(
/* 393 */       "{ N: %s, T: %s, V: %s, H: %s }", new Object[] { 
/* 394 */       this.name, 
/* 395 */       this.type, 
/* 396 */       this.value, 
/* 397 */       Boolean.valueOf(this.hidden) });
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.variables.SFSUserVariable
 * JD-Core Version:    0.6.0
 */