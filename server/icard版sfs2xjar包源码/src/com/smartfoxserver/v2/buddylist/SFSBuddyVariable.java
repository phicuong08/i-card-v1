/*     */ package com.smartfoxserver.v2.buddylist;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import com.smartfoxserver.v2.entities.variables.VariableType;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ 
/*     */ public class SFSBuddyVariable
/*     */   implements BuddyVariable
/*     */ {
/*     */   private static final String OFFLINE_PREFIX = "$";
/*     */   protected String name;
/*     */   protected Object value;
/*     */   protected VariableType type;
/*     */ 
/*     */   public static SFSBuddyVariable newFromSFSArray(ISFSArray array)
/*     */   {
/*  52 */     return new SFSBuddyVariable(
/*  53 */       array.getUtfString(0), 
/*  54 */       array.getElementAt(2));
/*     */   }
/*     */ 
/*     */   public SFSBuddyVariable(String name, Object value)
/*     */   {
/*  62 */     this.name = name;
/*  63 */     setValue(value);
/*     */   }
/*     */ 
/*     */   protected void setValueFromStringLiteral(VariableType type, String literal)
/*     */   {
/*  73 */     if (type == VariableType.NULL)
/*     */     {
/*  75 */       setNull();
/*     */     }
/*  77 */     else if (type == VariableType.BOOL)
/*     */     {
/*  79 */       setValue(Boolean.valueOf(Boolean.parseBoolean(literal)));
/*     */     }
/*  81 */     else if (type == VariableType.INT)
/*     */     {
/*  83 */       setValue(Integer.valueOf(Integer.parseInt(literal)));
/*     */     }
/*  85 */     else if (type == VariableType.DOUBLE)
/*     */     {
/*  87 */       setValue(Double.valueOf(Double.parseDouble(literal)));
/*     */     }
/*  89 */     else if (type == VariableType.STRING)
/*     */     {
/*  91 */       setValue(literal);
/*     */     }
/*  93 */     else if (type == VariableType.ARRAY)
/*     */     {
/*  95 */       setValue(SFSArray.newFromJsonData(literal));
/*     */     }
/*  97 */     else if (type == VariableType.OBJECT)
/*     */     {
/*  99 */       setValue(SFSObject.newFromJsonData(literal));
/*     */     }
/*     */   }
/*     */ 
/*     */   public boolean isOffline()
/*     */   {
/* 106 */     return this.name.startsWith("$");
/*     */   }
/*     */ 
/*     */   public VariableType getType()
/*     */   {
/* 112 */     return this.type;
/*     */   }
/*     */ 
/*     */   public Boolean getBoolValue()
/*     */   {
/* 118 */     return (Boolean)this.value;
/*     */   }
/*     */ 
/*     */   public Double getDoubleValue()
/*     */   {
/* 124 */     return (Double)this.value;
/*     */   }
/*     */ 
/*     */   public Integer getIntValue()
/*     */   {
/* 130 */     return (Integer)this.value;
/*     */   }
/*     */ 
/*     */   public String getName()
/*     */   {
/* 136 */     return this.name;
/*     */   }
/*     */ 
/*     */   public ISFSArray getSFSArrayValue()
/*     */   {
/* 142 */     return (ISFSArray)this.value;
/*     */   }
/*     */ 
/*     */   public ISFSObject getSFSObjectValue()
/*     */   {
/* 148 */     return (ISFSObject)this.value;
/*     */   }
/*     */ 
/*     */   public String getStringValue()
/*     */   {
/* 154 */     return (String)this.value;
/*     */   }
/*     */ 
/*     */   public Object getValue()
/*     */   {
/* 160 */     return this.value;
/*     */   }
/*     */ 
/*     */   public boolean isNull()
/*     */   {
/* 166 */     return this.type == VariableType.NULL;
/*     */   }
/*     */ 
/*     */   protected void setNull()
/*     */   {
/* 171 */     this.value = null;
/* 172 */     this.type = VariableType.NULL;
/*     */   }
/*     */ 
/*     */   protected void setValue(Boolean val)
/*     */   {
/* 177 */     this.type = VariableType.BOOL;
/* 178 */     this.value = val;
/*     */   }
/*     */ 
/*     */   protected void setValue(Double val)
/*     */   {
/* 183 */     this.type = VariableType.DOUBLE;
/* 184 */     this.value = val;
/*     */   }
/*     */ 
/*     */   protected void setValue(Integer val)
/*     */   {
/* 189 */     this.type = VariableType.INT;
/* 190 */     this.value = val;
/*     */   }
/*     */ 
/*     */   protected void setValue(ISFSArray val)
/*     */   {
/* 195 */     this.type = VariableType.ARRAY;
/* 196 */     this.value = val;
/*     */   }
/*     */ 
/*     */   protected void setValue(ISFSObject val)
/*     */   {
/* 201 */     this.type = VariableType.OBJECT;
/* 202 */     this.value = val;
/*     */   }
/*     */ 
/*     */   protected void setValue(Object val)
/*     */   {
/* 207 */     if (val == null) {
/* 208 */       this.type = VariableType.NULL;
/*     */     }
/* 210 */     else if ((val instanceof Boolean)) {
/* 211 */       setValue((Boolean)val);
/*     */     }
/* 213 */     else if ((val instanceof Byte)) {
/* 214 */       setValue(Integer.valueOf(((Byte)val).intValue()));
/*     */     }
/* 216 */     else if ((val instanceof Short)) {
/* 217 */       setValue(Integer.valueOf(((Short)val).intValue()));
/*     */     }
/* 219 */     else if ((val instanceof Integer)) {
/* 220 */       setValue((Integer)val);
/*     */     }
/* 222 */     else if ((val instanceof Long)) {
/* 223 */       setValue(Double.valueOf(((Long)val).doubleValue()));
/*     */     }
/* 225 */     else if ((val instanceof Float)) {
/* 226 */       setValue(Double.valueOf(((Float)val).doubleValue()));
/*     */     }
/* 228 */     else if ((val instanceof Double)) {
/* 229 */       setValue((Double)val);
/*     */     }
/* 231 */     else if ((val instanceof String)) {
/* 232 */       setValue((String)val);
/*     */     }
/* 234 */     else if ((val instanceof ISFSArray)) {
/* 235 */       setValue((ISFSArray)val);
/*     */     }
/* 237 */     else if ((val instanceof ISFSObject))
/* 238 */       setValue((ISFSObject)val);
/*     */   }
/*     */ 
/*     */   public ISFSArray toSFSArray()
/*     */   {
/* 243 */     ISFSArray sfsa = SFSArray.newInstance();
/*     */ 
/* 246 */     sfsa.addUtfString(this.name);
/*     */ 
/* 249 */     sfsa.addByte((byte)this.type.getId());
/*     */ 
/* 252 */     populateArrayWithValue(sfsa);
/*     */ 
/* 254 */     return sfsa;
/*     */   }
/*     */ 
/*     */   protected void populateArrayWithValue(ISFSArray sfsa)
/*     */   {
/* 264 */     switch ($SWITCH_TABLE$com$smartfoxserver$v2$entities$variables$VariableType()[this.type.ordinal()])
/*     */     {
/*     */     case 1:
/* 267 */       sfsa.addNull();
/* 268 */       break;
/*     */     case 2:
/* 271 */       sfsa.addBool(getBoolValue().booleanValue());
/* 272 */       break;
/*     */     case 3:
/* 275 */       sfsa.addInt(getIntValue().intValue());
/* 276 */       break;
/*     */     case 4:
/* 279 */       sfsa.addDouble(getDoubleValue().doubleValue());
/* 280 */       break;
/*     */     case 5:
/* 283 */       sfsa.addUtfString(getStringValue());
/* 284 */       break;
/*     */     case 6:
/* 287 */       sfsa.addSFSObject(getSFSObjectValue());
/* 288 */       break;
/*     */     case 7:
/* 291 */       sfsa.addSFSArray(getSFSArrayValue());
/*     */     }
/*     */   }
/*     */ 
/*     */   protected void setValue(String val)
/*     */   {
/* 298 */     this.type = VariableType.STRING;
/* 299 */     this.value = val;
/*     */   }
/*     */ 
/*     */   public Object clone()
/*     */   {
/*     */     try
/*     */     {
/* 311 */       return super.clone();
/*     */     }
/*     */     catch (CloneNotSupportedException e) {
/*     */     }
/* 315 */     throw new SFSRuntimeException("Clone Error! " + e.getMessage() + ", " + toString());
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 322 */     return String.format(
/* 324 */       "{ N: %s, T: %s, V: %s }", new Object[] { 
/* 325 */       this.name, 
/* 326 */       this.type, 
/* 327 */       this.value });
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.SFSBuddyVariable
 * JD-Core Version:    0.6.0
 */