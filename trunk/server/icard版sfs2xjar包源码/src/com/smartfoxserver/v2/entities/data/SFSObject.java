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
/*     */ import java.util.HashMap;
/*     */ import java.util.Iterator;
/*     */ import java.util.Map;
/*     */ import java.util.Map.Entry;
/*     */ import java.util.Set;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ 
/*     */ public class SFSObject
/*     */   implements ISFSObject
/*     */ {
/*     */   private Map<String, SFSDataWrapper> dataHolder;
/*     */   private ISFSDataSerializer serializer;
/*     */ 
/*     */   public static SFSObject newFromObject(Object o)
/*     */   {
/* 137 */     return (SFSObject)DefaultSFSDataSerializer.getInstance().pojo2sfs(o);
/*     */   }
/*     */ 
/*     */   public static SFSObject newFromBinaryData(byte[] bytes)
/*     */   {
/* 149 */     return (SFSObject)DefaultSFSDataSerializer.getInstance().binary2object(bytes);
/*     */   }
/*     */ 
/*     */   public static SFSObject newFromJsonData(String jsonStr)
/*     */   {
/* 188 */     return (SFSObject)DefaultSFSDataSerializer.getInstance().json2object(jsonStr);
/*     */   }
/*     */ 
/*     */   public static SFSObject newFromResultSet(ResultSet rset) throws SQLException
/*     */   {
/* 193 */     return DefaultSFSDataSerializer.getInstance().resultSet2object(rset);
/*     */   }
/*     */ 
/*     */   public static SFSObject newInstance()
/*     */   {
/* 202 */     return new SFSObject();
/*     */   }
/*     */ 
/*     */   public SFSObject()
/*     */   {
/* 207 */     this.dataHolder = new ConcurrentHashMap();
/* 208 */     this.serializer = DefaultSFSDataSerializer.getInstance();
/*     */   }
/*     */ 
/*     */   public Iterator<Map.Entry<String, SFSDataWrapper>> iterator()
/*     */   {
/* 213 */     return this.dataHolder.entrySet().iterator();
/*     */   }
/*     */ 
/*     */   public boolean containsKey(String key)
/*     */   {
/* 219 */     return this.dataHolder.containsKey(key);
/*     */   }
/*     */ 
/*     */   public boolean removeElement(String key)
/*     */   {
/* 224 */     return this.dataHolder.remove(key) != null;
/*     */   }
/*     */ 
/*     */   public int size()
/*     */   {
/* 229 */     return this.dataHolder.size();
/*     */   }
/*     */ 
/*     */   public byte[] toBinary()
/*     */   {
/* 234 */     return this.serializer.object2binary(this);
/*     */   }
/*     */ 
/*     */   public String toJson()
/*     */   {
/* 239 */     return this.serializer.object2json(flatten());
/*     */   }
/*     */ 
/*     */   public String getDump()
/*     */   {
/* 245 */     return DefaultObjectDumpFormatter.prettyPrintDump(dump());
/*     */   }
/*     */ 
/*     */   public String getDump(boolean noFormat)
/*     */   {
/* 250 */     if (!noFormat) {
/* 251 */       return dump();
/*     */     }
/* 253 */     return getDump();
/*     */   }
/*     */ 
/*     */   private String dump()
/*     */   {
/* 258 */     StringBuilder buffer = new StringBuilder();
/* 259 */     buffer.append('{');
/*     */ 
/* 261 */     for (String key : getKeys())
/*     */     {
/* 263 */       SFSDataWrapper wrapper = get(key);
/* 264 */       buffer.append("(")
/* 265 */         .append(wrapper.getTypeId().name().toLowerCase())
/* 266 */         .append(") ")
/* 267 */         .append(key)
/* 268 */         .append(": ");
/*     */ 
/* 270 */       if (wrapper.getTypeId() == SFSDataType.SFS_OBJECT) {
/* 271 */         buffer.append(((SFSObject)wrapper.getObject()).getDump(false));
/*     */       }
/* 273 */       else if (wrapper.getTypeId() == SFSDataType.SFS_ARRAY) {
/* 274 */         buffer.append(((SFSArray)wrapper.getObject()).getDump(false));
/*     */       }
/* 276 */       else if (wrapper.getTypeId() == SFSDataType.BYTE_ARRAY) {
/* 277 */         buffer.append(DefaultObjectDumpFormatter.prettyPrintByteArray((byte[])wrapper.getObject()));
/*     */       }
/* 279 */       else if (wrapper.getTypeId() == SFSDataType.CLASS) {
/* 280 */         buffer.append(wrapper.getObject().getClass().getName());
/*     */       }
/*     */       else {
/* 283 */         buffer.append(wrapper.getObject());
/*     */       }
/* 285 */       buffer.append(';');
/*     */     }
/*     */ 
/* 288 */     buffer.append('}');
/*     */ 
/* 290 */     return buffer.toString();
/*     */   }
/*     */ 
/*     */   public String getHexDump()
/*     */   {
/* 296 */     return ByteUtils.fullHexDump(toBinary());
/*     */   }
/*     */ 
/*     */   public boolean isNull(String key)
/*     */   {
/* 301 */     SFSDataWrapper wrapper = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 305 */     if (wrapper == null) {
/* 306 */       return false;
/*     */     }
/* 308 */     return wrapper.getTypeId() == SFSDataType.NULL;
/*     */   }
/*     */ 
/*     */   public SFSDataWrapper get(String key)
/*     */   {
/* 318 */     return (SFSDataWrapper)this.dataHolder.get(key);
/*     */   }
/*     */ 
/*     */   public Boolean getBool(String key)
/*     */   {
/* 323 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 325 */     if (o == null) {
/* 326 */       return null;
/*     */     }
/* 328 */     return (Boolean)o.getObject();
/*     */   }
/*     */ 
/*     */   public Collection<Boolean> getBoolArray(String key)
/*     */   {
/* 333 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 335 */     if (o == null) {
/* 336 */       return null;
/*     */     }
/* 338 */     return (Collection)o.getObject();
/*     */   }
/*     */ 
/*     */   public Byte getByte(String key)
/*     */   {
/* 343 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 345 */     if (o == null) {
/* 346 */       return null;
/*     */     }
/* 348 */     return (Byte)o.getObject();
/*     */   }
/*     */ 
/*     */   public byte[] getByteArray(String key)
/*     */   {
/* 353 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 355 */     if (o == null) {
/* 356 */       return null;
/*     */     }
/* 358 */     return (byte[])o.getObject();
/*     */   }
/*     */ 
/*     */   public Double getDouble(String key)
/*     */   {
/* 363 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 365 */     if (o == null) {
/* 366 */       return null;
/*     */     }
/* 368 */     return (Double)o.getObject();
/*     */   }
/*     */ 
/*     */   public Collection<Double> getDoubleArray(String key)
/*     */   {
/* 373 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 375 */     if (o == null) {
/* 376 */       return null;
/*     */     }
/* 378 */     return (Collection)o.getObject();
/*     */   }
/*     */ 
/*     */   public Float getFloat(String key)
/*     */   {
/* 383 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 385 */     if (o == null) {
/* 386 */       return null;
/*     */     }
/* 388 */     return (Float)o.getObject();
/*     */   }
/*     */ 
/*     */   public Collection<Float> getFloatArray(String key)
/*     */   {
/* 393 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 395 */     if (o == null) {
/* 396 */       return null;
/*     */     }
/* 398 */     return (Collection)o.getObject();
/*     */   }
/*     */ 
/*     */   public Integer getInt(String key)
/*     */   {
/* 403 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 405 */     if (o == null) {
/* 406 */       return null;
/*     */     }
/* 408 */     return (Integer)o.getObject();
/*     */   }
/*     */ 
/*     */   public Collection<Integer> getIntArray(String key)
/*     */   {
/* 413 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 415 */     if (o == null) {
/* 416 */       return null;
/*     */     }
/* 418 */     return (Collection)o.getObject();
/*     */   }
/*     */ 
/*     */   public Set<String> getKeys()
/*     */   {
/* 423 */     return this.dataHolder.keySet();
/*     */   }
/*     */ 
/*     */   public Long getLong(String key)
/*     */   {
/* 428 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 430 */     if (o == null) {
/* 431 */       return null;
/*     */     }
/* 433 */     return (Long)o.getObject();
/*     */   }
/*     */ 
/*     */   public Collection<Long> getLongArray(String key)
/*     */   {
/* 438 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 440 */     if (o == null) {
/* 441 */       return null;
/*     */     }
/* 443 */     return (Collection)o.getObject();
/*     */   }
/*     */ 
/*     */   public ISFSArray getSFSArray(String key)
/*     */   {
/* 448 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 450 */     if (o == null) {
/* 451 */       return null;
/*     */     }
/* 453 */     return (ISFSArray)o.getObject();
/*     */   }
/*     */ 
/*     */   public ISFSObject getSFSObject(String key)
/*     */   {
/* 458 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 460 */     if (o == null) {
/* 461 */       return null;
/*     */     }
/* 463 */     return (ISFSObject)o.getObject();
/*     */   }
/*     */ 
/*     */   public Short getShort(String key)
/*     */   {
/* 468 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 470 */     if (o == null) {
/* 471 */       return null;
/*     */     }
/* 473 */     return (Short)o.getObject();
/*     */   }
/*     */ 
/*     */   public Collection<Short> getShortArray(String key)
/*     */   {
/* 478 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 480 */     if (o == null) {
/* 481 */       return null;
/*     */     }
/* 483 */     return (Collection)o.getObject();
/*     */   }
/*     */ 
/*     */   public Integer getUnsignedByte(String key)
/*     */   {
/* 488 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 490 */     if (o == null) {
/* 491 */       return null;
/*     */     }
/* 493 */     return Integer.valueOf(DefaultSFSDataSerializer.getInstance().getUnsignedByte(((Byte)o.getObject()).byteValue()));
/*     */   }
/*     */ 
/*     */   public Collection<Integer> getUnsignedByteArray(String key)
/*     */   {
/* 498 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 500 */     if (o == null) {
/* 501 */       return null;
/*     */     }
/*     */ 
/* 506 */     DefaultSFSDataSerializer serializer = DefaultSFSDataSerializer.getInstance();
/* 507 */     Collection intCollection = new ArrayList();
/*     */ 
/* 509 */     for (byte b : (byte[])o.getObject())
/*     */     {
/* 511 */       intCollection.add(Integer.valueOf(serializer.getUnsignedByte(b)));
/*     */     }
/*     */ 
/* 514 */     return intCollection;
/*     */   }
/*     */ 
/*     */   public String getUtfString(String key)
/*     */   {
/* 520 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 522 */     if (o == null) {
/* 523 */       return null;
/*     */     }
/* 525 */     return (String)o.getObject();
/*     */   }
/*     */ 
/*     */   public Collection<String> getUtfStringArray(String key)
/*     */   {
/* 530 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 532 */     if (o == null) {
/* 533 */       return null;
/*     */     }
/* 535 */     return (Collection)o.getObject();
/*     */   }
/*     */ 
/*     */   public Object getClass(String key)
/*     */   {
/* 541 */     SFSDataWrapper o = (SFSDataWrapper)this.dataHolder.get(key);
/*     */ 
/* 543 */     if (o == null) {
/* 544 */       return null;
/*     */     }
/* 546 */     return o.getObject();
/*     */   }
/*     */ 
/*     */   public void putBool(String key, boolean value)
/*     */   {
/* 555 */     putObj(key, Boolean.valueOf(value), SFSDataType.BOOL);
/*     */   }
/*     */ 
/*     */   public void putBoolArray(String key, Collection<Boolean> value)
/*     */   {
/* 560 */     putObj(key, value, SFSDataType.BOOL_ARRAY);
/*     */   }
/*     */ 
/*     */   public void putByte(String key, byte value)
/*     */   {
/* 565 */     putObj(key, Byte.valueOf(value), SFSDataType.BYTE);
/*     */   }
/*     */ 
/*     */   public void putByteArray(String key, byte[] value)
/*     */   {
/* 570 */     putObj(key, value, SFSDataType.BYTE_ARRAY);
/*     */   }
/*     */ 
/*     */   public void putDouble(String key, double value)
/*     */   {
/* 575 */     putObj(key, Double.valueOf(value), SFSDataType.DOUBLE);
/*     */   }
/*     */ 
/*     */   public void putDoubleArray(String key, Collection<Double> value)
/*     */   {
/* 580 */     putObj(key, value, SFSDataType.DOUBLE_ARRAY);
/*     */   }
/*     */ 
/*     */   public void putFloat(String key, float value)
/*     */   {
/* 585 */     putObj(key, Float.valueOf(value), SFSDataType.FLOAT);
/*     */   }
/*     */ 
/*     */   public void putFloatArray(String key, Collection<Float> value)
/*     */   {
/* 590 */     putObj(key, value, SFSDataType.FLOAT_ARRAY);
/*     */   }
/*     */ 
/*     */   public void putInt(String key, int value)
/*     */   {
/* 595 */     putObj(key, Integer.valueOf(value), SFSDataType.INT);
/*     */   }
/*     */ 
/*     */   public void putIntArray(String key, Collection<Integer> value)
/*     */   {
/* 600 */     putObj(key, value, SFSDataType.INT_ARRAY);
/*     */   }
/*     */ 
/*     */   public void putLong(String key, long value)
/*     */   {
/* 605 */     putObj(key, Long.valueOf(value), SFSDataType.LONG);
/*     */   }
/*     */ 
/*     */   public void putLongArray(String key, Collection<Long> value)
/*     */   {
/* 610 */     putObj(key, value, SFSDataType.LONG_ARRAY);
/*     */   }
/*     */ 
/*     */   public void putNull(String key)
/*     */   {
/* 615 */     this.dataHolder.put(key, new SFSDataWrapper(SFSDataType.NULL, null));
/*     */   }
/*     */ 
/*     */   public void putSFSArray(String key, ISFSArray value)
/*     */   {
/* 620 */     putObj(key, value, SFSDataType.SFS_ARRAY);
/*     */   }
/*     */ 
/*     */   public void putSFSObject(String key, ISFSObject value)
/*     */   {
/* 625 */     putObj(key, value, SFSDataType.SFS_OBJECT);
/*     */   }
/*     */ 
/*     */   public void putShort(String key, short value)
/*     */   {
/* 630 */     putObj(key, Short.valueOf(value), SFSDataType.SHORT);
/*     */   }
/*     */ 
/*     */   public void putShortArray(String key, Collection<Short> value)
/*     */   {
/* 635 */     putObj(key, value, SFSDataType.SHORT_ARRAY);
/*     */   }
/*     */ 
/*     */   public void putUtfString(String key, String value)
/*     */   {
/* 640 */     putObj(key, value, SFSDataType.UTF_STRING);
/*     */   }
/*     */ 
/*     */   public void putUtfStringArray(String key, Collection<String> value)
/*     */   {
/* 645 */     putObj(key, value, SFSDataType.UTF_STRING_ARRAY);
/*     */   }
/*     */ 
/*     */   public void put(String key, SFSDataWrapper wrappedObject)
/*     */   {
/* 650 */     putObj(key, wrappedObject, null);
/*     */   }
/*     */ 
/*     */   public void putClass(String key, Object o)
/*     */   {
/* 656 */     putObj(key, o, SFSDataType.CLASS);
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 662 */     return "[SFSObject, size: " + size() + "]";
/*     */   }
/*     */ 
/*     */   private void putObj(String key, Object value, SFSDataType typeId)
/*     */   {
/* 672 */     if (key == null) {
/* 673 */       throw new IllegalArgumentException("SFSObject requires a non-null key for a 'put' operation!");
/*     */     }
/* 675 */     if (key.length() > 255) {
/* 676 */       throw new IllegalArgumentException("SFSObject keys must be less than 255 characters!");
/*     */     }
/* 678 */     if (value == null) {
/* 679 */       throw new IllegalArgumentException("SFSObject requires a non-null value! If you need to add a null use the putNull() method.");
/*     */     }
/* 681 */     if ((value instanceof SFSDataWrapper))
/* 682 */       this.dataHolder.put(key, (SFSDataWrapper)value);
/*     */     else
/* 684 */       this.dataHolder.put(key, new SFSDataWrapper(typeId, value));
/*     */   }
/*     */ 
/*     */   private Map<String, Object> flatten()
/*     */   {
/* 689 */     Map map = new HashMap();
/* 690 */     DefaultSFSDataSerializer.getInstance().flattenObject(map, this);
/*     */ 
/* 692 */     return map;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.data.SFSObject
 * JD-Core Version:    0.6.0
 */