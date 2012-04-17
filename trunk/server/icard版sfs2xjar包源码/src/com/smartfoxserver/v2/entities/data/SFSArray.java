/*     */ package com.smartfoxserver.v2.entities.data;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.util.ByteUtils;
/*     */ import com.smartfoxserver.v2.protocol.serialization.DefaultObjectDumpFormatter;
/*     */ import com.smartfoxserver.v2.protocol.serialization.DefaultSFSDataSerializer;
/*     */ import com.smartfoxserver.v2.protocol.serialization.ISFSDataSerializer;
/*     */ import java.sql.ResultSet;
/*     */ import java.sql.SQLException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Collection;
/*     */ import java.util.Iterator;
/*     */ import java.util.List;
/*     */ 
/*     */ public class SFSArray
/*     */   implements ISFSArray
/*     */ {
/*     */   private ISFSDataSerializer serializer;
/*     */   private List<SFSDataWrapper> dataHolder;
/*     */ 
/*     */   public SFSArray()
/*     */   {
/*  83 */     this.dataHolder = new ArrayList();
/*  84 */     this.serializer = DefaultSFSDataSerializer.getInstance();
/*     */   }
/*     */ 
/*     */   public static SFSArray newFromBinaryData(byte[] bytes)
/*     */   {
/* 103 */     return (SFSArray)DefaultSFSDataSerializer.getInstance().binary2array(bytes);
/*     */   }
/*     */ 
/*     */   public static SFSArray newFromResultSet(ResultSet rset) throws SQLException
/*     */   {
/* 108 */     return DefaultSFSDataSerializer.getInstance().resultSet2array(rset);
/*     */   }
/*     */ 
/*     */   public static SFSArray newFromJsonData(String jsonStr)
/*     */   {
/* 147 */     return (SFSArray)DefaultSFSDataSerializer.getInstance().json2array(jsonStr);
/*     */   }
/*     */ 
/*     */   public static SFSArray newInstance()
/*     */   {
/* 156 */     return new SFSArray();
/*     */   }
/*     */ 
/*     */   public String getDump()
/*     */   {
/* 161 */     return DefaultObjectDumpFormatter.prettyPrintDump(dump());
/*     */   }
/*     */ 
/*     */   public String getDump(boolean noFormat)
/*     */   {
/* 166 */     if (!noFormat) {
/* 167 */       return dump();
/*     */     }
/* 169 */     return getDump();
/*     */   }
/*     */ 
/*     */   private String dump()
/*     */   {
/* 174 */     StringBuilder sb = new StringBuilder();
/* 175 */     sb.append('{');
/* 176 */     Object objDump = null;
/*     */ 
/* 178 */     for (Iterator iter = this.dataHolder.iterator(); iter.hasNext(); )
/*     */     {
/* 180 */       SFSDataWrapper wrappedObject = (SFSDataWrapper)iter.next();
/*     */ 
/* 182 */       if (wrappedObject.getTypeId() == SFSDataType.SFS_OBJECT) {
/* 183 */         objDump = ((ISFSObject)wrappedObject.getObject()).getDump(false);
/*     */       }
/* 185 */       else if (wrappedObject.getTypeId() == SFSDataType.SFS_ARRAY) {
/* 186 */         objDump = ((ISFSArray)wrappedObject.getObject()).getDump(false);
/*     */       }
/* 188 */       else if (wrappedObject.getTypeId() == SFSDataType.BYTE_ARRAY) {
/* 189 */         objDump = DefaultObjectDumpFormatter.prettyPrintByteArray((byte[])wrappedObject.getObject());
/*     */       }
/* 191 */       else if (wrappedObject.getTypeId() == SFSDataType.CLASS) {
/* 192 */         objDump = wrappedObject.getObject().getClass().getName();
/*     */       }
/*     */       else {
/* 195 */         objDump = wrappedObject.getObject();
/*     */       }
/* 197 */       sb.append(" (")
/* 198 */         .append(wrappedObject.getTypeId().name().toLowerCase())
/* 199 */         .append(") ")
/* 200 */         .append(objDump)
/* 201 */         .append(';');
/*     */     }
/*     */ 
/* 204 */     if (size() > 0) {
/* 205 */       sb.delete(sb.length() - 1, sb.length());
/*     */     }
/* 207 */     sb.append('}');
/*     */ 
/* 209 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public String getHexDump()
/*     */   {
/* 214 */     return ByteUtils.fullHexDump(toBinary());
/*     */   }
/*     */ 
/*     */   public byte[] toBinary()
/*     */   {
/* 219 */     return this.serializer.array2binary(this);
/*     */   }
/*     */ 
/*     */   public String toJson()
/*     */   {
/* 224 */     return DefaultSFSDataSerializer.getInstance().array2json(flatten());
/*     */   }
/*     */ 
/*     */   public boolean isNull(int index)
/*     */   {
/* 235 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/*     */ 
/* 237 */     if (wrapper == null) {
/* 238 */       return false;
/*     */     }
/* 240 */     return wrapper.getTypeId() == SFSDataType.NULL;
/*     */   }
/*     */ 
/*     */   public Boolean getBool(int index)
/*     */   {
/* 245 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 246 */     return wrapper != null ? (Boolean)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Byte getByte(int index)
/*     */   {
/* 251 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 252 */     return wrapper != null ? (Byte)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Integer getUnsignedByte(int index)
/*     */   {
/* 258 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 259 */     return wrapper != null ? Integer.valueOf(DefaultSFSDataSerializer.getInstance().getUnsignedByte(((Byte)wrapper.getObject()).byteValue())) : null;
/*     */   }
/*     */ 
/*     */   public Short getShort(int index)
/*     */   {
/* 265 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 266 */     return wrapper != null ? (Short)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Integer getInt(int index)
/*     */   {
/* 271 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 272 */     return wrapper != null ? (Integer)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Long getLong(int index)
/*     */   {
/* 277 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 278 */     return wrapper != null ? (Long)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Float getFloat(int index)
/*     */   {
/* 283 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 284 */     return wrapper != null ? (Float)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Double getDouble(int index)
/*     */   {
/* 289 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 290 */     return wrapper != null ? (Double)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public String getUtfString(int index)
/*     */   {
/* 295 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 296 */     return wrapper != null ? (String)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Collection<Boolean> getBoolArray(int index)
/*     */   {
/* 301 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 302 */     return wrapper != null ? (Collection)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public byte[] getByteArray(int index)
/*     */   {
/* 307 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 308 */     return wrapper != null ? (byte[])wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Collection<Integer> getUnsignedByteArray(int index)
/*     */   {
/* 314 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/*     */ 
/* 316 */     if (wrapper == null) {
/* 317 */       return null;
/*     */     }
/*     */ 
/* 320 */     DefaultSFSDataSerializer serializer = DefaultSFSDataSerializer.getInstance();
/* 321 */     Collection intCollection = new ArrayList();
/*     */ 
/* 323 */     for (byte b : (byte[])wrapper.getObject())
/*     */     {
/* 325 */       intCollection.add(Integer.valueOf(serializer.getUnsignedByte(b)));
/*     */     }
/*     */ 
/* 328 */     return intCollection;
/*     */   }
/*     */ 
/*     */   public Collection<Short> getShortArray(int index)
/*     */   {
/* 335 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 336 */     return wrapper != null ? (Collection)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Collection<Integer> getIntArray(int index)
/*     */   {
/* 341 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 342 */     return wrapper != null ? (Collection)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Collection<Long> getLongArray(int index)
/*     */   {
/* 347 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 348 */     return wrapper != null ? (Collection)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Collection<Float> getFloatArray(int index)
/*     */   {
/* 353 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 354 */     return wrapper != null ? (Collection)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Collection<Double> getDoubleArray(int index)
/*     */   {
/* 359 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 360 */     return wrapper != null ? (Collection)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Collection<String> getUtfStringArray(int index)
/*     */   {
/* 365 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 366 */     return wrapper != null ? (Collection)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public ISFSArray getSFSArray(int index)
/*     */   {
/* 371 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 372 */     return wrapper != null ? (ISFSArray)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public ISFSObject getSFSObject(int index)
/*     */   {
/* 377 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 378 */     return wrapper != null ? (ISFSObject)wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public Object getClass(int index)
/*     */   {
/* 384 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/* 385 */     return wrapper != null ? wrapper.getObject() : null;
/*     */   }
/*     */ 
/*     */   public void addBool(boolean value)
/*     */   {
/* 396 */     addObject(Boolean.valueOf(value), SFSDataType.BOOL);
/*     */   }
/*     */ 
/*     */   public void addBoolArray(Collection<Boolean> value)
/*     */   {
/* 401 */     addObject(value, SFSDataType.BOOL_ARRAY);
/*     */   }
/*     */ 
/*     */   public void addByte(byte value)
/*     */   {
/* 406 */     addObject(Byte.valueOf(value), SFSDataType.BYTE);
/*     */   }
/*     */ 
/*     */   public void addByteArray(byte[] value)
/*     */   {
/* 411 */     addObject(value, SFSDataType.BYTE_ARRAY);
/*     */   }
/*     */ 
/*     */   public void addDouble(double value)
/*     */   {
/* 416 */     addObject(Double.valueOf(value), SFSDataType.DOUBLE);
/*     */   }
/*     */ 
/*     */   public void addDoubleArray(Collection<Double> value)
/*     */   {
/* 421 */     addObject(value, SFSDataType.DOUBLE_ARRAY);
/*     */   }
/*     */ 
/*     */   public void addFloat(float value)
/*     */   {
/* 426 */     addObject(Float.valueOf(value), SFSDataType.FLOAT);
/*     */   }
/*     */ 
/*     */   public void addFloatArray(Collection<Float> value)
/*     */   {
/* 431 */     addObject(value, SFSDataType.FLOAT_ARRAY);
/*     */   }
/*     */ 
/*     */   public void addInt(int value)
/*     */   {
/* 436 */     addObject(Integer.valueOf(value), SFSDataType.INT);
/*     */   }
/*     */ 
/*     */   public void addIntArray(Collection<Integer> value)
/*     */   {
/* 441 */     addObject(value, SFSDataType.INT_ARRAY);
/*     */   }
/*     */ 
/*     */   public void addLong(long value)
/*     */   {
/* 446 */     addObject(Long.valueOf(value), SFSDataType.LONG);
/*     */   }
/*     */ 
/*     */   public void addLongArray(Collection<Long> value)
/*     */   {
/* 451 */     addObject(value, SFSDataType.LONG_ARRAY);
/*     */   }
/*     */ 
/*     */   public void addNull()
/*     */   {
/* 456 */     addObject(null, SFSDataType.NULL);
/*     */   }
/*     */ 
/*     */   public void addSFSArray(ISFSArray value)
/*     */   {
/* 461 */     addObject(value, SFSDataType.SFS_ARRAY);
/*     */   }
/*     */ 
/*     */   public void addSFSObject(ISFSObject value)
/*     */   {
/* 466 */     addObject(value, SFSDataType.SFS_OBJECT);
/*     */   }
/*     */ 
/*     */   public void addShort(short value)
/*     */   {
/* 471 */     addObject(Short.valueOf(value), SFSDataType.SHORT);
/*     */   }
/*     */ 
/*     */   public void addShortArray(Collection<Short> value)
/*     */   {
/* 476 */     addObject(value, SFSDataType.SHORT_ARRAY);
/*     */   }
/*     */ 
/*     */   public void addUtfString(String value)
/*     */   {
/* 481 */     addObject(value, SFSDataType.UTF_STRING);
/*     */   }
/*     */ 
/*     */   public void addUtfStringArray(Collection<String> value)
/*     */   {
/* 486 */     addObject(value, SFSDataType.UTF_STRING_ARRAY);
/*     */   }
/*     */ 
/*     */   public void addClass(Object o)
/*     */   {
/* 492 */     addObject(o, SFSDataType.CLASS);
/*     */   }
/*     */ 
/*     */   public void add(SFSDataWrapper wrappedObject)
/*     */   {
/* 497 */     this.dataHolder.add(wrappedObject);
/*     */   }
/*     */ 
/*     */   public boolean contains(Object obj)
/*     */   {
/* 505 */     if (((obj instanceof ISFSArray)) || ((obj instanceof ISFSObject))) {
/* 506 */       throw new UnsupportedOperationException("ISFSArray and ISFSObject are not supported by this method.");
/*     */     }
/* 508 */     boolean found = false;
/*     */ 
/* 510 */     for (Iterator iter = this.dataHolder.iterator(); iter.hasNext(); )
/*     */     {
/* 512 */       Object item = ((SFSDataWrapper)iter.next()).getObject();
/*     */ 
/* 514 */       if (!item.equals(obj))
/*     */         continue;
/* 516 */       found = true;
/* 517 */       break;
/*     */     }
/*     */ 
/* 521 */     return found;
/*     */   }
/*     */ 
/*     */   public Object getElementAt(int index)
/*     */   {
/* 527 */     Object item = null;
/*     */ 
/* 529 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(index);
/*     */ 
/* 531 */     if (wrapper != null);
/* 532 */     item = wrapper.getObject();
/*     */ 
/* 534 */     return item;
/*     */   }
/*     */ 
/*     */   public Iterator<SFSDataWrapper> iterator()
/*     */   {
/* 539 */     return this.dataHolder.iterator();
/*     */   }
/*     */ 
/*     */   public void removeElementAt(int index)
/*     */   {
/* 544 */     this.dataHolder.remove(index);
/*     */   }
/*     */ 
/*     */   public int size()
/*     */   {
/* 549 */     return this.dataHolder.size();
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 555 */     return "[SFSArray, size: " + size() + "]";
/*     */   }
/*     */ 
/*     */   private void addObject(Object value, SFSDataType typeId)
/*     */   {
/* 565 */     this.dataHolder.add(new SFSDataWrapper(typeId, value));
/*     */   }
/*     */ 
/*     */   private List<Object> flatten()
/*     */   {
/* 571 */     List list = new ArrayList();
/* 572 */     DefaultSFSDataSerializer.getInstance().flattenArray(list, this);
/*     */ 
/* 574 */     return list;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.data.SFSArray
 * JD-Core Version:    0.6.0
 */