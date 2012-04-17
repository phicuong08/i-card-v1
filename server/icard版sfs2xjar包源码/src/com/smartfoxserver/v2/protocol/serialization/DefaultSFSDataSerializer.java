/*      */ package com.smartfoxserver.v2.protocol.serialization;
/*      */ 
/*      */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*      */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*      */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*      */ import com.smartfoxserver.v2.entities.data.SFSDataType;
/*      */ import com.smartfoxserver.v2.entities.data.SFSDataWrapper;
/*      */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*      */ import com.smartfoxserver.v2.exceptions.SFSCodecException;
/*      */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*      */ import java.io.BufferedInputStream;
/*      */ import java.io.IOException;
/*      */ import java.io.InputStream;
/*      */ import java.lang.reflect.Array;
/*      */ import java.lang.reflect.Field;
/*      */ import java.lang.reflect.Method;
/*      */ import java.lang.reflect.Modifier;
/*      */ import java.nio.ByteBuffer;
/*      */ import java.sql.Blob;
/*      */ import java.sql.Date;
/*      */ import java.sql.ResultSet;
/*      */ import java.sql.ResultSetMetaData;
/*      */ import java.sql.SQLException;
/*      */ import java.sql.Timestamp;
/*      */ import java.util.ArrayDeque;
/*      */ import java.util.ArrayList;
/*      */ import java.util.Collection;
/*      */ import java.util.HashMap;
/*      */ import java.util.HashSet;
/*      */ import java.util.Iterator;
/*      */ import java.util.LinkedHashSet;
/*      */ import java.util.LinkedList;
/*      */ import java.util.List;
/*      */ import java.util.Map;
/*      */ import java.util.Map.Entry;
/*      */ import java.util.PriorityQueue;
/*      */ import java.util.Set;
/*      */ import java.util.TreeSet;
/*      */ import java.util.Vector;
/*      */ import java.util.concurrent.ConcurrentLinkedQueue;
/*      */ import java.util.concurrent.CopyOnWriteArrayList;
/*      */ import java.util.concurrent.CopyOnWriteArraySet;
/*      */ import java.util.concurrent.DelayQueue;
/*      */ import java.util.concurrent.LinkedBlockingDeque;
/*      */ import java.util.concurrent.LinkedBlockingQueue;
/*      */ import java.util.concurrent.PriorityBlockingQueue;
/*      */ import net.sf.json.JSONArray;
/*      */ import net.sf.json.JSONObject;
/*      */ import org.apache.commons.io.IOUtils;
/*      */ import org.apache.commons.lang.StringUtils;
/*      */ import org.slf4j.Logger;
/*      */ import org.slf4j.LoggerFactory;
/*      */ 
/*      */ public class DefaultSFSDataSerializer
/*      */   implements ISFSDataSerializer
/*      */ {
/*      */   private static final String CLASS_MARKER_KEY = "$C";
/*      */   private static final String CLASS_FIELDS_KEY = "$F";
/*      */   private static final String FIELD_NAME_KEY = "N";
/*      */   private static final String FIELD_VALUE_KEY = "V";
/*   63 */   private static DefaultSFSDataSerializer instance = new DefaultSFSDataSerializer();
/*   64 */   private static int BUFFER_CHUNK_SIZE = 512;
/*      */   private final Logger logger;
/*      */ 
/*      */   public static DefaultSFSDataSerializer getInstance()
/*      */   {
/*   69 */     return instance;
/*      */   }
/*      */ 
/*      */   private DefaultSFSDataSerializer()
/*      */   {
/*   74 */     this.logger = LoggerFactory.getLogger(getClass());
/*      */   }
/*      */ 
/*      */   public int getUnsignedByte(byte b)
/*      */   {
/*   80 */     return 0xFF & b;
/*      */   }
/*      */ 
/*      */   public String array2json(List<Object> array)
/*      */   {
/*   85 */     return JSONArray.fromObject(array).toString();
/*      */   }
/*      */ 
/*      */   public ISFSArray binary2array(byte[] data)
/*      */   {
/*   95 */     if (data.length < 3) {
/*   96 */       throw new IllegalStateException("Can't decode an SFSArray. Byte data is insufficient. Size: " + data.length + " bytes");
/*      */     }
/*   98 */     ByteBuffer buffer = ByteBuffer.allocate(data.length);
/*   99 */     buffer.put(data);
/*  100 */     buffer.flip();
/*      */ 
/*  102 */     return decodeSFSArray(buffer);
/*      */   }
/*      */ 
/*      */   private ISFSArray decodeSFSArray(ByteBuffer buffer)
/*      */   {
/*  107 */     ISFSArray sfsArray = SFSArray.newInstance();
/*      */ 
/*  110 */     byte headerBuffer = buffer.get();
/*      */ 
/*  113 */     if (headerBuffer != SFSDataType.SFS_ARRAY.getTypeID()) {
/*  114 */       throw new IllegalStateException("Invalid SFSDataType. Expected: " + SFSDataType.SFS_ARRAY.getTypeID() + ", found: " + headerBuffer);
/*      */     }
/*      */ 
/*  117 */     short size = buffer.getShort();
/*      */ 
/*  120 */     if (size < 0) {
/*  121 */       throw new IllegalStateException("Can't decode SFSArray. Size is negative = " + size);
/*      */     }
/*      */ 
/*      */     try
/*      */     {
/*  130 */       for (int i = 0; i < size; i++)
/*      */       {
/*  133 */         SFSDataWrapper decodedObject = decodeObject(buffer);
/*      */ 
/*  136 */         if (decodedObject != null)
/*  137 */           sfsArray.add(decodedObject);
/*      */         else {
/*  139 */           throw new IllegalStateException("Could not decode SFSArray item at index: " + i);
/*      */         }
/*      */       }
/*      */ 
/*      */     }
/*      */     catch (SFSCodecException codecError)
/*      */     {
/*  146 */       throw new IllegalArgumentException(codecError.getMessage());
/*      */     }
/*      */ 
/*  149 */     return sfsArray;
/*      */   }
/*      */ 
/*      */   public ISFSObject binary2object(byte[] data)
/*      */   {
/*  161 */     if (data.length < 3) {
/*  162 */       throw new IllegalStateException("Can't decode an SFSObject. Byte data is insufficient. Size: " + data.length + " bytes");
/*      */     }
/*  164 */     ByteBuffer buffer = ByteBuffer.allocate(data.length);
/*  165 */     buffer.put(data);
/*  166 */     buffer.flip();
/*      */ 
/*  168 */     return decodeSFSObject(buffer);
/*      */   }
/*      */ 
/*      */   private ISFSObject decodeSFSObject(ByteBuffer buffer)
/*      */   {
/*  173 */     ISFSObject sfsObject = SFSObject.newInstance();
/*      */ 
/*  176 */     byte headerBuffer = buffer.get();
/*      */ 
/*  179 */     if (headerBuffer != SFSDataType.SFS_OBJECT.getTypeID()) {
/*  180 */       throw new IllegalStateException("Invalid SFSDataType. Expected: " + SFSDataType.SFS_OBJECT.getTypeID() + ", found: " + headerBuffer);
/*      */     }
/*      */ 
/*  183 */     short size = buffer.getShort();
/*      */ 
/*  186 */     if (size < 0) {
/*  187 */       throw new IllegalStateException("Can't decode SFSObject. Size is negative = " + size);
/*      */     }
/*      */ 
/*      */     try
/*      */     {
/*  196 */       for (int i = 0; i < size; i++)
/*      */       {
/*  199 */         short keySize = buffer.getShort();
/*      */ 
/*  202 */         if ((keySize < 0) || (keySize > 255)) {
/*  203 */           throw new IllegalStateException("Invalid SFSObject key length. Found = " + keySize);
/*      */         }
/*  205 */         byte[] keyData = new byte[keySize];
/*  206 */         buffer.get(keyData, 0, keyData.length);
/*  207 */         String key = new String(keyData);
/*      */ 
/*  210 */         SFSDataWrapper decodedObject = decodeObject(buffer);
/*      */ 
/*  213 */         if (decodedObject != null)
/*  214 */           sfsObject.put(key, decodedObject);
/*      */         else {
/*  216 */           throw new IllegalStateException("Could not decode value for key: " + keyData);
/*      */         }
/*      */       }
/*      */ 
/*      */     }
/*      */     catch (SFSCodecException codecError)
/*      */     {
/*  223 */       throw new IllegalArgumentException(codecError.getMessage());
/*      */     }
/*      */ 
/*  228 */     return sfsObject;
/*      */   }
/*      */ 
/*      */   public ISFSArray json2array(String jsonStr)
/*      */   {
/*  238 */     if (jsonStr.length() < 2) {
/*  239 */       throw new IllegalStateException("Can't decode SFSObject. JSON String is too short. Len: " + jsonStr.length());
/*      */     }
/*  241 */     JSONArray jsa = JSONArray.fromObject(jsonStr);
/*      */ 
/*  243 */     return decodeSFSArray(jsa);
/*      */   }
/*      */ 
/*      */   private ISFSArray decodeSFSArray(JSONArray jsa)
/*      */   {
/*  248 */     ISFSArray sfsArray = SFSArray.newInstance();
/*      */ 
/*  250 */     for (Iterator iter = jsa.iterator(); iter.hasNext(); )
/*      */     {
/*  252 */       Object value = iter.next();
/*  253 */       SFSDataWrapper decodedObject = decodeJsonObject(value);
/*      */ 
/*  256 */       if (decodedObject != null)
/*  257 */         sfsArray.add(decodedObject);
/*      */       else {
/*  259 */         throw new IllegalStateException("(json2sfarray) Could not decode value for object: " + value);
/*      */       }
/*      */     }
/*  262 */     return sfsArray;
/*      */   }
/*      */ 
/*      */   public ISFSObject json2object(String jsonStr)
/*      */   {
/*  272 */     if (jsonStr.length() < 2) {
/*  273 */       throw new IllegalStateException("Can't decode SFSObject. JSON String is too short. Len: " + jsonStr.length());
/*      */     }
/*      */ 
/*  276 */     JSONObject jso = JSONObject.fromObject(jsonStr);
/*      */ 
/*  279 */     return decodeSFSObject(jso);
/*      */   }
/*      */ 
/*      */   private ISFSObject decodeSFSObject(JSONObject jso)
/*      */   {
/*  286 */     ISFSObject sfsObject = SFSObject.newInstance();
/*      */ 
/*  288 */     for (Iterator localIterator = jso.keySet().iterator(); localIterator.hasNext(); ) { Object key = localIterator.next();
/*      */ 
/*  290 */       Object value = jso.get(key);
/*      */ 
/*  292 */       SFSDataWrapper decodedObject = decodeJsonObject(value);
/*      */ 
/*  295 */       if (decodedObject != null)
/*  296 */         sfsObject.put((String)key, decodedObject);
/*      */       else {
/*  298 */         throw new IllegalStateException("(json2sfsobj) Could not decode value for key: " + key);
/*      */       }
/*      */     }
/*  301 */     return sfsObject;
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper decodeJsonObject(Object o)
/*      */   {
/*  310 */     if ((o instanceof Integer)) {
/*  311 */       return new SFSDataWrapper(SFSDataType.INT, o);
/*      */     }
/*      */ 
/*  314 */     if ((o instanceof Long)) {
/*  315 */       return new SFSDataWrapper(SFSDataType.LONG, o);
/*      */     }
/*      */ 
/*  318 */     if ((o instanceof Double)) {
/*  319 */       return new SFSDataWrapper(SFSDataType.DOUBLE, o);
/*      */     }
/*      */ 
/*  322 */     if ((o instanceof Boolean)) {
/*  323 */       return new SFSDataWrapper(SFSDataType.BOOL, o);
/*      */     }
/*      */ 
/*  326 */     if ((o instanceof String)) {
/*  327 */       return new SFSDataWrapper(SFSDataType.UTF_STRING, o);
/*      */     }
/*      */ 
/*  330 */     if ((o instanceof JSONObject))
/*      */     {
/*  332 */       JSONObject jso = (JSONObject)o;
/*      */ 
/*  334 */       if (jso.isNullObject()) {
/*  335 */         return new SFSDataWrapper(SFSDataType.NULL, o);
/*      */       }
/*      */ 
/*  338 */       return new SFSDataWrapper(SFSDataType.SFS_OBJECT, decodeSFSObject(jso));
/*      */     }
/*      */ 
/*  343 */     if ((o instanceof JSONArray))
/*      */     {
/*  345 */       return new SFSDataWrapper(SFSDataType.SFS_ARRAY, decodeSFSArray((JSONArray)o));
/*      */     }
/*      */ 
/*  351 */     throw new IllegalArgumentException(
/*  353 */       String.format(
/*  355 */       "Unrecognized DataType while converting JSONObject 2 SFSObject. Object: %s, Type: %s", new Object[] { 
/*  356 */       o, 
/*  357 */       o == null ? "null" : o.getClass() }));
/*      */   }
/*      */ 
/*      */   public SFSObject resultSet2object(ResultSet rset)
/*      */     throws SQLException
/*      */   {
/*  370 */     ResultSetMetaData metaData = rset.getMetaData();
/*  371 */     SFSObject sfso = new SFSObject();
/*      */ 
/*  373 */     if (rset.isBeforeFirst()) {
/*  374 */       rset.next();
/*      */     }
/*  376 */     for (int col = 1; col <= metaData.getColumnCount(); col++)
/*      */     {
/*  378 */       String colName = metaData.getColumnName(col);
/*  379 */       int type = metaData.getColumnType(col);
/*      */ 
/*  382 */       Object rawDataObj = rset.getObject(col);
/*  383 */       if (rawDataObj == null) {
/*      */         continue;
/*      */       }
/*  386 */       if (type == 0) {
/*  387 */         sfso.putNull(colName);
/*      */       }
/*  389 */       else if (type == 16) {
/*  390 */         sfso.putBool(colName, rset.getBoolean(col));
/*      */       }
/*  392 */       else if (type == 91) {
/*  393 */         sfso.putLong(colName, rset.getDate(col).getTime());
/*      */       }
/*  395 */       else if ((type == 6) || (type == 3) || (type == 8) || (type == 7)) {
/*  396 */         sfso.putDouble(colName, rset.getDouble(col));
/*      */       }
/*  398 */       else if ((type == 4) || (type == -6) || (type == 5)) {
/*  399 */         sfso.putInt(colName, rset.getInt(col));
/*      */       }
/*  401 */       else if ((type == -1) || (type == 12) || (type == 1)) {
/*  402 */         sfso.putUtfString(colName, rset.getString(col));
/*      */       }
/*  404 */       else if ((type == -9) || (type == -16) || (type == -15)) {
/*  405 */         sfso.putUtfString(colName, rset.getNString(col));
/*      */       }
/*  407 */       else if (type == 93) {
/*  408 */         sfso.putLong(colName, rset.getTimestamp(col).getTime());
/*      */       }
/*  411 */       else if (type == -5) {
/*  412 */         sfso.putLong(colName, rset.getLong(col));
/*      */       }
/*  415 */       else if (type == -4)
/*      */       {
/*  417 */         byte[] binData = getBlobData(colName, rset.getBinaryStream(col));
/*      */ 
/*  419 */         if (binData != null) {
/*  420 */           sfso.putByteArray(colName, binData);
/*      */         }
/*      */       }
/*  423 */       else if (type == 2004)
/*      */       {
/*  425 */         Blob blob = rset.getBlob(col);
/*  426 */         sfso.putByteArray(colName, blob.getBytes(0L, (int)blob.length()));
/*      */       }
/*      */       else
/*      */       {
/*  431 */         this.logger.info("Skipping Unsupported SQL TYPE: " + type + ", Column:" + colName);
/*      */       }
/*      */     }
/*      */ 
/*  435 */     return sfso;
/*      */   }
/*      */ 
/*      */   private byte[] getBlobData(String colName, InputStream stream)
/*      */   {
/*  440 */     BufferedInputStream bis = new BufferedInputStream(stream);
/*  441 */     byte[] bytes = (byte[])null;
/*      */     try
/*      */     {
/*  445 */       bytes = new byte[bis.available()];
/*  446 */       bis.read(bytes);
/*      */     }
/*      */     catch (IOException ex)
/*      */     {
/*  451 */       this.logger.warn("SFSObject serialize error. Failed reading BLOB data for column: " + colName);
/*      */     }
/*      */     finally
/*      */     {
/*  456 */       IOUtils.closeQuietly(bis);
/*      */     }
/*      */ 
/*  459 */     return bytes;
/*      */   }
/*      */ 
/*      */   public SFSArray resultSet2array(ResultSet rset)
/*      */     throws SQLException
/*      */   {
/*  468 */     SFSArray sfsa = new SFSArray();
/*      */ 
/*  470 */     while (rset.next())
/*      */     {
/*  472 */       sfsa.addSFSObject(resultSet2object(rset));
/*      */     }
/*      */ 
/*  475 */     return sfsa;
/*      */   }
/*      */ 
/*      */   public byte[] object2binary(ISFSObject object)
/*      */   {
/*  485 */     ByteBuffer buffer = ByteBuffer.allocate(BUFFER_CHUNK_SIZE);
/*  486 */     buffer.put((byte)SFSDataType.SFS_OBJECT.getTypeID());
/*  487 */     buffer.putShort((short)object.size());
/*      */ 
/*  489 */     return obj2bin(object, buffer);
/*      */   }
/*      */ 
/*      */   private byte[] obj2bin(ISFSObject object, ByteBuffer buffer)
/*      */   {
/*  494 */     Set keys = object.getKeys();
/*      */ 
/*  497 */     for (String key : keys)
/*      */     {
/*  499 */       SFSDataWrapper wrapper = object.get(key);
/*  500 */       Object dataObj = wrapper.getObject();
/*      */ 
/*  503 */       buffer = encodeSFSObjectKey(buffer, key);
/*      */ 
/*  506 */       buffer = encodeObject(buffer, wrapper.getTypeId(), dataObj);
/*      */     }
/*      */ 
/*  511 */     int pos = buffer.position();
/*      */ 
/*  514 */     byte[] result = new byte[pos];
/*  515 */     buffer.flip();
/*      */ 
/*  518 */     buffer.get(result, 0, pos);
/*      */ 
/*  521 */     return result;
/*      */   }
/*      */ 
/*      */   public byte[] array2binary(ISFSArray array)
/*      */   {
/*  532 */     ByteBuffer buffer = ByteBuffer.allocate(BUFFER_CHUNK_SIZE);
/*  533 */     buffer.put((byte)SFSDataType.SFS_ARRAY.getTypeID());
/*  534 */     buffer.putShort((short)array.size());
/*      */ 
/*  536 */     return arr2bin(array, buffer);
/*      */   }
/*      */ 
/*      */   private byte[] arr2bin(ISFSArray array, ByteBuffer buffer)
/*      */   {
/*  541 */     Iterator iter = array.iterator();
/*      */ 
/*  544 */     while (iter.hasNext())
/*      */     {
/*  546 */       SFSDataWrapper wrapper = (SFSDataWrapper)iter.next();
/*  547 */       Object dataObj = wrapper.getObject();
/*      */ 
/*  550 */       buffer = encodeObject(buffer, wrapper.getTypeId(), dataObj);
/*      */     }
/*      */ 
/*  554 */     int pos = buffer.position();
/*      */ 
/*  557 */     byte[] result = new byte[pos];
/*  558 */     buffer.flip();
/*      */ 
/*  561 */     buffer.get(result, 0, pos);
/*      */ 
/*  564 */     return result;
/*      */   }
/*      */ 
/*      */   public String object2json(Map<String, Object> map)
/*      */   {
/*  574 */     return JSONObject.fromObject(map).toString();
/*      */   }
/*      */ 
/*      */   public void flattenObject(Map<String, Object> map, SFSObject sfsObj)
/*      */   {
/*  579 */     for (Iterator it = sfsObj.iterator(); it.hasNext(); )
/*      */     {
/*  581 */       Map.Entry entry = (Map.Entry)it.next();
/*      */ 
/*  583 */       String key = (String)entry.getKey();
/*  584 */       SFSDataWrapper value = (SFSDataWrapper)entry.getValue();
/*      */ 
/*  587 */       if (value.getTypeId() == SFSDataType.SFS_OBJECT)
/*      */       {
/*  590 */         Map newMap = new HashMap();
/*      */ 
/*  593 */         map.put(key, newMap);
/*      */ 
/*  596 */         flattenObject(newMap, (SFSObject)value.getObject());
/*      */       }
/*  600 */       else if (value.getTypeId() == SFSDataType.SFS_ARRAY)
/*      */       {
/*  602 */         List newList = new ArrayList();
/*  603 */         map.put(key, newList);
/*  604 */         flattenArray(newList, (SFSArray)value.getObject());
/*      */       }
/*      */       else
/*      */       {
/*  610 */         map.put(key, value.getObject());
/*      */       }
/*      */     }
/*      */   }
/*      */ 
/*      */   public void flattenArray(List<Object> array, SFSArray sfsArray)
/*      */   {
/*  617 */     for (Iterator it = sfsArray.iterator(); it.hasNext(); )
/*      */     {
/*  619 */       SFSDataWrapper value = (SFSDataWrapper)it.next();
/*      */ 
/*  622 */       if (value.getTypeId() == SFSDataType.SFS_OBJECT)
/*      */       {
/*  625 */         Map newMap = new HashMap();
/*      */ 
/*  628 */         array.add(newMap);
/*      */ 
/*  631 */         flattenObject(newMap, (SFSObject)value.getObject());
/*      */       }
/*  635 */       else if (value.getTypeId() == SFSDataType.SFS_ARRAY)
/*      */       {
/*  637 */         List newList = new ArrayList();
/*  638 */         array.add(newList);
/*  639 */         flattenArray(newList, (SFSArray)value.getObject());
/*      */       }
/*      */       else
/*      */       {
/*  645 */         array.add(value.getObject());
/*      */       }
/*      */     }
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper decodeObject(ByteBuffer buffer)
/*      */     throws SFSCodecException
/*      */   {
/*  655 */     SFSDataWrapper decodedObject = null;
/*      */ 
/*  658 */     byte headerByte = buffer.get();
/*      */ 
/*  660 */     if (headerByte == SFSDataType.NULL.getTypeID()) {
/*  661 */       decodedObject = binDecode_NULL(buffer);
/*      */     }
/*  663 */     else if (headerByte == SFSDataType.BOOL.getTypeID()) {
/*  664 */       decodedObject = binDecode_BOOL(buffer);
/*      */     }
/*  666 */     else if (headerByte == SFSDataType.BOOL_ARRAY.getTypeID()) {
/*  667 */       decodedObject = binDecode_BOOL_ARRAY(buffer);
/*      */     }
/*  669 */     else if (headerByte == SFSDataType.BYTE.getTypeID()) {
/*  670 */       decodedObject = binDecode_BYTE(buffer);
/*      */     }
/*  672 */     else if (headerByte == SFSDataType.BYTE_ARRAY.getTypeID()) {
/*  673 */       decodedObject = binDecode_BYTE_ARRAY(buffer);
/*      */     }
/*  675 */     else if (headerByte == SFSDataType.SHORT.getTypeID()) {
/*  676 */       decodedObject = binDecode_SHORT(buffer);
/*      */     }
/*  678 */     else if (headerByte == SFSDataType.SHORT_ARRAY.getTypeID()) {
/*  679 */       decodedObject = binDecode_SHORT_ARRAY(buffer);
/*      */     }
/*  681 */     else if (headerByte == SFSDataType.INT.getTypeID()) {
/*  682 */       decodedObject = binDecode_INT(buffer);
/*      */     }
/*  684 */     else if (headerByte == SFSDataType.INT_ARRAY.getTypeID()) {
/*  685 */       decodedObject = binDecode_INT_ARRAY(buffer);
/*      */     }
/*  687 */     else if (headerByte == SFSDataType.LONG.getTypeID()) {
/*  688 */       decodedObject = binDecode_LONG(buffer);
/*      */     }
/*  690 */     else if (headerByte == SFSDataType.LONG_ARRAY.getTypeID()) {
/*  691 */       decodedObject = binDecode_LONG_ARRAY(buffer);
/*      */     }
/*  693 */     else if (headerByte == SFSDataType.FLOAT.getTypeID()) {
/*  694 */       decodedObject = binDecode_FLOAT(buffer);
/*      */     }
/*  696 */     else if (headerByte == SFSDataType.FLOAT_ARRAY.getTypeID()) {
/*  697 */       decodedObject = binDecode_FLOAT_ARRAY(buffer);
/*      */     }
/*  699 */     else if (headerByte == SFSDataType.DOUBLE.getTypeID()) {
/*  700 */       decodedObject = binDecode_DOUBLE(buffer);
/*      */     }
/*  702 */     else if (headerByte == SFSDataType.DOUBLE_ARRAY.getTypeID()) {
/*  703 */       decodedObject = binDecode_DOUBLE_ARRAY(buffer);
/*      */     }
/*  705 */     else if (headerByte == SFSDataType.UTF_STRING.getTypeID()) {
/*  706 */       decodedObject = binDecode_UTF_STRING(buffer);
/*      */     }
/*  708 */     else if (headerByte == SFSDataType.UTF_STRING_ARRAY.getTypeID()) {
/*  709 */       decodedObject = binDecode_UTF_STRING_ARRAY(buffer);
/*      */     }
/*  711 */     else if (headerByte == SFSDataType.SFS_ARRAY.getTypeID())
/*      */     {
/*  714 */       buffer.position(buffer.position() - 1);
/*      */ 
/*  716 */       decodedObject = new SFSDataWrapper(SFSDataType.SFS_ARRAY, decodeSFSArray(buffer));
/*      */     }
/*  719 */     else if (headerByte == SFSDataType.SFS_OBJECT.getTypeID())
/*      */     {
/*  722 */       buffer.position(buffer.position() - 1);
/*      */ 
/*  727 */       ISFSObject sfsObj = decodeSFSObject(buffer);
/*  728 */       SFSDataType type = SFSDataType.SFS_OBJECT;
/*  729 */       Object finalSfsObj = sfsObj;
/*      */ 
/*  731 */       if ((sfsObj.containsKey("$C")) && (sfsObj.containsKey("$F")))
/*      */       {
/*  733 */         type = SFSDataType.CLASS;
/*  734 */         finalSfsObj = sfs2pojo(sfsObj);
/*      */       }
/*      */ 
/*  737 */       decodedObject = new SFSDataWrapper(type, finalSfsObj);
/*      */     }
/*      */     else
/*      */     {
/*  742 */       throw new SFSCodecException("Unknow SFSDataType ID: " + headerByte);
/*      */     }
/*  744 */     return decodedObject;
/*      */   }
/*      */ 
/*      */   private ByteBuffer encodeObject(ByteBuffer buffer, SFSDataType typeId, Object object)
/*      */   {
/*  751 */     switch (typeId)
/*      */     {
/*      */     case BOOL:
/*  754 */       buffer = binEncode_NULL(buffer);
/*  755 */       break;
/*      */     case BOOL_ARRAY:
/*  758 */       buffer = binEncode_BOOL(buffer, (Boolean)object);
/*  759 */       break;
/*      */     case BYTE:
/*  762 */       buffer = binEncode_BYTE(buffer, (Byte)object);
/*  763 */       break;
/*      */     case BYTE_ARRAY:
/*  766 */       buffer = binEncode_SHORT(buffer, (Short)object);
/*  767 */       break;
/*      */     case CLASS:
/*  770 */       buffer = binEncode_INT(buffer, (Integer)object);
/*  771 */       break;
/*      */     case DOUBLE:
/*  774 */       buffer = binEncode_LONG(buffer, (Long)object);
/*  775 */       break;
/*      */     case DOUBLE_ARRAY:
/*  778 */       buffer = binEncode_FLOAT(buffer, (Float)object);
/*  779 */       break;
/*      */     case FLOAT:
/*  782 */       buffer = binEncode_DOUBLE(buffer, (Double)object);
/*  783 */       break;
/*      */     case FLOAT_ARRAY:
/*  786 */       buffer = binEncode_UTF_STRING(buffer, (String)object);
/*  787 */       break;
/*      */     case INT:
/*  790 */       buffer = binEncode_BOOL_ARRAY(buffer, (Collection)object);
/*  791 */       break;
/*      */     case INT_ARRAY:
/*  794 */       buffer = binEncode_BYTE_ARRAY(buffer, (byte[])object);
/*  795 */       break;
/*      */     case LONG:
/*  798 */       buffer = binEncode_SHORT_ARRAY(buffer, (Collection)object);
/*  799 */       break;
/*      */     case LONG_ARRAY:
/*  802 */       buffer = binEncode_INT_ARRAY(buffer, (Collection)object);
/*  803 */       break;
/*      */     case NULL:
/*  806 */       buffer = binEncode_LONG_ARRAY(buffer, (Collection)object);
/*  807 */       break;
/*      */     case SFS_ARRAY:
/*  810 */       buffer = binEncode_FLOAT_ARRAY(buffer, (Collection)object);
/*  811 */       break;
/*      */     case SFS_OBJECT:
/*  814 */       buffer = binEncode_DOUBLE_ARRAY(buffer, (Collection)object);
/*  815 */       break;
/*      */     case SHORT:
/*  818 */       buffer = binEncode_UTF_STRING_ARRAY(buffer, (Collection)object);
/*  819 */       break;
/*      */     case SHORT_ARRAY:
/*  823 */       buffer = addData(buffer, array2binary((SFSArray)object));
/*  824 */       break;
/*      */     case UTF_STRING:
/*  828 */       buffer = addData(buffer, object2binary((SFSObject)object));
/*  829 */       break;
/*      */     case UTF_STRING_ARRAY:
/*  832 */       buffer = addData(buffer, object2binary(pojo2sfs(object)));
/*  833 */       break;
/*      */     default:
/*  836 */       throw new IllegalArgumentException("Unrecognized type in SFSObject serialization: " + typeId);
/*      */     }
/*      */ 
/*  839 */     return buffer;
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_NULL(ByteBuffer buffer)
/*      */   {
/*  853 */     return new SFSDataWrapper(SFSDataType.NULL, null);
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_BOOL(ByteBuffer buffer) throws SFSCodecException
/*      */   {
/*  858 */     byte boolByte = buffer.get();
/*  859 */     Boolean bool = null;
/*      */ 
/*  861 */     if (boolByte == 0)
/*  862 */       bool = new Boolean(false);
/*  863 */     else if (boolByte == 1)
/*  864 */       bool = new Boolean(true);
/*      */     else {
/*  866 */       throw new SFSCodecException("Error decoding Bool type. Illegal value: " + bool);
/*      */     }
/*  868 */     return new SFSDataWrapper(SFSDataType.BOOL, bool);
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_BYTE(ByteBuffer buffer)
/*      */   {
/*  873 */     byte boolByte = buffer.get();
/*      */ 
/*  875 */     return new SFSDataWrapper(SFSDataType.BYTE, Byte.valueOf(boolByte));
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_SHORT(ByteBuffer buffer)
/*      */   {
/*  880 */     short shortValue = buffer.getShort();
/*      */ 
/*  882 */     return new SFSDataWrapper(SFSDataType.SHORT, Short.valueOf(shortValue));
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_INT(ByteBuffer buffer)
/*      */   {
/*  887 */     int intValue = buffer.getInt();
/*      */ 
/*  889 */     return new SFSDataWrapper(SFSDataType.INT, Integer.valueOf(intValue));
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_LONG(ByteBuffer buffer)
/*      */   {
/*  894 */     long longValue = buffer.getLong();
/*      */ 
/*  896 */     return new SFSDataWrapper(SFSDataType.LONG, Long.valueOf(longValue));
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_FLOAT(ByteBuffer buffer)
/*      */   {
/*  901 */     float floatValue = buffer.getFloat();
/*      */ 
/*  903 */     return new SFSDataWrapper(SFSDataType.FLOAT, Float.valueOf(floatValue));
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_DOUBLE(ByteBuffer buffer)
/*      */   {
/*  908 */     double doubleValue = buffer.getDouble();
/*      */ 
/*  910 */     return new SFSDataWrapper(SFSDataType.DOUBLE, Double.valueOf(doubleValue));
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_UTF_STRING(ByteBuffer buffer)
/*      */     throws SFSCodecException
/*      */   {
/*  916 */     short strLen = buffer.getShort();
/*      */ 
/*  918 */     if (strLen < 0) {
/*  919 */       throw new SFSCodecException("Error decoding UtfString. Negative size: " + strLen);
/*      */     }
/*      */ 
/*  922 */     byte[] strData = new byte[strLen];
/*  923 */     buffer.get(strData, 0, strLen);
/*      */ 
/*  937 */     String decodedString = new String(strData);
/*  938 */     return new SFSDataWrapper(SFSDataType.UTF_STRING, decodedString);
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_BOOL_ARRAY(ByteBuffer buffer) throws SFSCodecException
/*      */   {
/*  943 */     short arraySize = getTypeArraySize(buffer);
/*  944 */     List array = new ArrayList();
/*      */ 
/*  946 */     for (int j = 0; j < arraySize; j++)
/*      */     {
/*  948 */       byte boolData = buffer.get();
/*      */ 
/*  950 */       if (boolData == 0)
/*  951 */         array.add(Boolean.valueOf(false));
/*  952 */       else if (boolData == 1) {
/*  953 */         array.add(Boolean.valueOf(true));
/*      */       }
/*      */       else
/*      */       {
/*  957 */         throw new SFSCodecException("Error decoding BoolArray. Invalid bool value: " + boolData);
/*      */       }
/*      */     }
/*      */ 
/*  961 */     return new SFSDataWrapper(SFSDataType.BOOL_ARRAY, array);
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_BYTE_ARRAY(ByteBuffer buffer)
/*      */     throws SFSCodecException
/*      */   {
/*  973 */     int arraySize = buffer.getInt();
/*      */ 
/*  975 */     if (arraySize < 0) {
/*  976 */       throw new SFSCodecException("Error decoding typed array size. Negative size: " + arraySize);
/*      */     }
/*  978 */     byte[] byteData = new byte[arraySize];
/*      */ 
/*  981 */     buffer.get(byteData, 0, arraySize);
/*      */ 
/*  983 */     return new SFSDataWrapper(SFSDataType.BYTE_ARRAY, byteData);
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_SHORT_ARRAY(ByteBuffer buffer) throws SFSCodecException
/*      */   {
/*  988 */     short arraySize = getTypeArraySize(buffer);
/*  989 */     List array = new ArrayList();
/*      */ 
/*  991 */     for (int j = 0; j < arraySize; j++)
/*      */     {
/*  993 */       short shortValue = buffer.getShort();
/*  994 */       array.add(Short.valueOf(shortValue));
/*      */     }
/*      */ 
/*  997 */     return new SFSDataWrapper(SFSDataType.SHORT_ARRAY, array);
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_INT_ARRAY(ByteBuffer buffer) throws SFSCodecException
/*      */   {
/* 1002 */     short arraySize = getTypeArraySize(buffer);
/* 1003 */     List array = new ArrayList();
/*      */ 
/* 1005 */     for (int j = 0; j < arraySize; j++)
/*      */     {
/* 1007 */       int intValue = buffer.getInt();
/* 1008 */       array.add(Integer.valueOf(intValue));
/*      */     }
/*      */ 
/* 1011 */     return new SFSDataWrapper(SFSDataType.INT_ARRAY, array);
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_LONG_ARRAY(ByteBuffer buffer) throws SFSCodecException
/*      */   {
/* 1016 */     short arraySize = getTypeArraySize(buffer);
/* 1017 */     List array = new ArrayList();
/*      */ 
/* 1019 */     for (int j = 0; j < arraySize; j++)
/*      */     {
/* 1021 */       long longValue = buffer.getLong();
/* 1022 */       array.add(Long.valueOf(longValue));
/*      */     }
/*      */ 
/* 1025 */     return new SFSDataWrapper(SFSDataType.LONG_ARRAY, array);
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_FLOAT_ARRAY(ByteBuffer buffer) throws SFSCodecException
/*      */   {
/* 1030 */     short arraySize = getTypeArraySize(buffer);
/* 1031 */     List array = new ArrayList();
/*      */ 
/* 1033 */     for (int j = 0; j < arraySize; j++)
/*      */     {
/* 1035 */       float floatValue = buffer.getFloat();
/* 1036 */       array.add(Float.valueOf(floatValue));
/*      */     }
/*      */ 
/* 1039 */     return new SFSDataWrapper(SFSDataType.FLOAT_ARRAY, array);
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_DOUBLE_ARRAY(ByteBuffer buffer) throws SFSCodecException
/*      */   {
/* 1044 */     short arraySize = getTypeArraySize(buffer);
/* 1045 */     List array = new ArrayList();
/*      */ 
/* 1047 */     for (int j = 0; j < arraySize; j++)
/*      */     {
/* 1049 */       double doubleValue = buffer.getDouble();
/* 1050 */       array.add(Double.valueOf(doubleValue));
/*      */     }
/*      */ 
/* 1053 */     return new SFSDataWrapper(SFSDataType.DOUBLE_ARRAY, array);
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper binDecode_UTF_STRING_ARRAY(ByteBuffer buffer) throws SFSCodecException
/*      */   {
/* 1058 */     short arraySize = getTypeArraySize(buffer);
/* 1059 */     List array = new ArrayList();
/*      */ 
/* 1061 */     for (int j = 0; j < arraySize; j++)
/*      */     {
/* 1063 */       short strLen = buffer.getShort();
/*      */ 
/* 1065 */       if (strLen < 0) {
/* 1066 */         throw new SFSCodecException("Error decoding UtfStringArray element. Element has negative size: " + strLen);
/*      */       }
/*      */ 
/* 1069 */       byte[] strData = new byte[strLen];
/* 1070 */       buffer.get(strData, 0, strLen);
/*      */ 
/* 1072 */       array.add(new String(strData));
/*      */     }
/*      */ 
/* 1075 */     return new SFSDataWrapper(SFSDataType.UTF_STRING_ARRAY, array);
/*      */   }
/*      */ 
/*      */   private short getTypeArraySize(ByteBuffer buffer) throws SFSCodecException
/*      */   {
/* 1080 */     short arraySize = buffer.getShort();
/*      */ 
/* 1082 */     if (arraySize < 0) {
/* 1083 */       throw new SFSCodecException("Error decoding typed array size. Negative size: " + arraySize);
/*      */     }
/* 1085 */     return arraySize;
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_NULL(ByteBuffer buffer)
/*      */   {
/* 1098 */     return addData(buffer, new byte[1]);
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_BOOL(ByteBuffer buffer, Boolean value)
/*      */   {
/* 1103 */     byte[] data = new byte[2];
/* 1104 */     data[0] = (byte)SFSDataType.BOOL.getTypeID();
/* 1105 */     data[1] = (value.booleanValue() ? 1 : 0);
/*      */ 
/* 1107 */     return addData(buffer, data);
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_BYTE(ByteBuffer buffer, Byte value)
/*      */   {
/* 1112 */     byte[] data = new byte[2];
/* 1113 */     data[0] = (byte)SFSDataType.BYTE.getTypeID();
/* 1114 */     data[1] = value.byteValue();
/*      */ 
/* 1116 */     return addData(buffer, data);
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_SHORT(ByteBuffer buffer, Short value)
/*      */   {
/* 1121 */     ByteBuffer buf = ByteBuffer.allocate(3);
/* 1122 */     buf.put((byte)SFSDataType.SHORT.getTypeID());
/* 1123 */     buf.putShort(value.shortValue());
/*      */ 
/* 1125 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_INT(ByteBuffer buffer, Integer value)
/*      */   {
/* 1130 */     ByteBuffer buf = ByteBuffer.allocate(5);
/* 1131 */     buf.put((byte)SFSDataType.INT.getTypeID());
/* 1132 */     buf.putInt(value.intValue());
/*      */ 
/* 1134 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_LONG(ByteBuffer buffer, Long value)
/*      */   {
/* 1139 */     ByteBuffer buf = ByteBuffer.allocate(9);
/* 1140 */     buf.put((byte)SFSDataType.LONG.getTypeID());
/* 1141 */     buf.putLong(value.longValue());
/*      */ 
/* 1143 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_FLOAT(ByteBuffer buffer, Float value)
/*      */   {
/* 1148 */     ByteBuffer buf = ByteBuffer.allocate(5);
/* 1149 */     buf.put((byte)SFSDataType.FLOAT.getTypeID());
/* 1150 */     buf.putFloat(value.floatValue());
/*      */ 
/* 1152 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_DOUBLE(ByteBuffer buffer, Double value)
/*      */   {
/* 1157 */     ByteBuffer buf = ByteBuffer.allocate(9);
/* 1158 */     buf.put((byte)SFSDataType.DOUBLE.getTypeID());
/* 1159 */     buf.putDouble(value.doubleValue());
/*      */ 
/* 1161 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_UTF_STRING(ByteBuffer buffer, String value)
/*      */   {
/* 1166 */     byte[] stringBytes = value.getBytes();
/* 1167 */     ByteBuffer buf = ByteBuffer.allocate(3 + stringBytes.length);
/* 1168 */     buf.put((byte)SFSDataType.UTF_STRING.getTypeID());
/* 1169 */     buf.putShort((short)stringBytes.length);
/* 1170 */     buf.put(stringBytes);
/*      */ 
/* 1172 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_BOOL_ARRAY(ByteBuffer buffer, Collection<Boolean> value)
/*      */   {
/* 1177 */     ByteBuffer buf = ByteBuffer.allocate(3 + value.size());
/* 1178 */     buf.put((byte)SFSDataType.BOOL_ARRAY.getTypeID());
/* 1179 */     buf.putShort((short)value.size());
/*      */ 
/* 1181 */     for (Iterator localIterator = value.iterator(); localIterator.hasNext(); ) { boolean b = ((Boolean)localIterator.next()).booleanValue();
/*      */ 
/* 1183 */       buf.put(b ? 1 : 0);
/*      */     }
/*      */ 
/* 1186 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_BYTE_ARRAY(ByteBuffer buffer, byte[] value)
/*      */   {
/* 1198 */     ByteBuffer buf = ByteBuffer.allocate(5 + value.length);
/* 1199 */     buf.put((byte)SFSDataType.BYTE_ARRAY.getTypeID());
/* 1200 */     buf.putInt(value.length);
/*      */ 
/* 1203 */     buf.put(value);
/*      */ 
/* 1205 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_SHORT_ARRAY(ByteBuffer buffer, Collection<Short> value)
/*      */   {
/* 1210 */     ByteBuffer buf = ByteBuffer.allocate(3 + 2 * value.size());
/* 1211 */     buf.put((byte)SFSDataType.SHORT_ARRAY.getTypeID());
/* 1212 */     buf.putShort((short)value.size());
/*      */ 
/* 1214 */     for (Iterator localIterator = value.iterator(); localIterator.hasNext(); ) { short item = ((Short)localIterator.next()).shortValue();
/*      */ 
/* 1216 */       buf.putShort(item);
/*      */     }
/*      */ 
/* 1219 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_INT_ARRAY(ByteBuffer buffer, Collection<Integer> value)
/*      */   {
/* 1224 */     ByteBuffer buf = ByteBuffer.allocate(3 + 4 * value.size());
/* 1225 */     buf.put((byte)SFSDataType.INT_ARRAY.getTypeID());
/* 1226 */     buf.putShort((short)value.size());
/*      */ 
/* 1228 */     for (Iterator localIterator = value.iterator(); localIterator.hasNext(); ) { int item = ((Integer)localIterator.next()).intValue();
/*      */ 
/* 1230 */       buf.putInt(item);
/*      */     }
/*      */ 
/* 1233 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_LONG_ARRAY(ByteBuffer buffer, Collection<Long> value)
/*      */   {
/* 1238 */     ByteBuffer buf = ByteBuffer.allocate(3 + 8 * value.size());
/* 1239 */     buf.put((byte)SFSDataType.LONG_ARRAY.getTypeID());
/* 1240 */     buf.putShort((short)value.size());
/*      */ 
/* 1242 */     for (Iterator localIterator = value.iterator(); localIterator.hasNext(); ) { long item = ((Long)localIterator.next()).longValue();
/*      */ 
/* 1244 */       buf.putLong(item);
/*      */     }
/*      */ 
/* 1247 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_FLOAT_ARRAY(ByteBuffer buffer, Collection<Float> value)
/*      */   {
/* 1252 */     ByteBuffer buf = ByteBuffer.allocate(3 + 4 * value.size());
/* 1253 */     buf.put((byte)SFSDataType.FLOAT_ARRAY.getTypeID());
/* 1254 */     buf.putShort((short)value.size());
/*      */ 
/* 1256 */     for (Iterator localIterator = value.iterator(); localIterator.hasNext(); ) { float item = ((Float)localIterator.next()).floatValue();
/*      */ 
/* 1258 */       buf.putFloat(item);
/*      */     }
/*      */ 
/* 1261 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_DOUBLE_ARRAY(ByteBuffer buffer, Collection<Double> value)
/*      */   {
/* 1266 */     ByteBuffer buf = ByteBuffer.allocate(3 + 8 * value.size());
/* 1267 */     buf.put((byte)SFSDataType.DOUBLE_ARRAY.getTypeID());
/* 1268 */     buf.putShort((short)value.size());
/*      */ 
/* 1270 */     for (Iterator localIterator = value.iterator(); localIterator.hasNext(); ) { double item = ((Double)localIterator.next()).doubleValue();
/*      */ 
/* 1272 */       buf.putDouble(item);
/*      */     }
/*      */ 
/* 1275 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer binEncode_UTF_STRING_ARRAY(ByteBuffer buffer, Collection<String> value)
/*      */   {
/* 1282 */     int stringDataLen = 0;
/*      */ 
/* 1285 */     byte[][] binStrings = new byte[value.size()][];
/* 1286 */     int count = 0;
/*      */ 
/* 1289 */     for (String item : value)
/*      */     {
/* 1291 */       binStr = item.getBytes();
/* 1292 */       binStrings[(count++)] = binStr;
/* 1293 */       stringDataLen += 2 + binStr.length;
/*      */     }
/*      */ 
/* 1297 */     ByteBuffer buf = ByteBuffer.allocate(3 + stringDataLen);
/* 1298 */     buf.put((byte)SFSDataType.UTF_STRING_ARRAY.getTypeID());
/* 1299 */     buf.putShort((short)value.size());
/*      */     byte[][] arrayOfByte2;
/* 1301 */     byte[] arrayOfByte1 = (arrayOfByte2 = binStrings).length; for (byte[] binStr = 0; binStr < arrayOfByte1; binStr++) { byte[] binItem = arrayOfByte2[binStr];
/*      */ 
/* 1303 */       buf.putShort((short)binItem.length);
/* 1304 */       buf.put(binItem);
/*      */     }
/*      */ 
/* 1307 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer encodeSFSObjectKey(ByteBuffer buffer, String value)
/*      */   {
/* 1316 */     ByteBuffer buf = ByteBuffer.allocate(2 + value.length());
/* 1317 */     buf.putShort((short)value.length());
/* 1318 */     buf.put(value.getBytes());
/*      */ 
/* 1320 */     return addData(buffer, buf.array());
/*      */   }
/*      */ 
/*      */   private ByteBuffer addData(ByteBuffer buffer, byte[] newData)
/*      */   {
/* 1329 */     if (buffer.remaining() < newData.length)
/*      */     {
/* 1331 */       int newSize = BUFFER_CHUNK_SIZE;
/*      */ 
/* 1334 */       if (newSize < newData.length) {
/* 1335 */         newSize = newData.length;
/*      */       }
/* 1337 */       ByteBuffer newBuffer = ByteBuffer.allocate(buffer.capacity() + newSize);
/* 1338 */       buffer.flip();
/* 1339 */       newBuffer.put(buffer);
/*      */ 
/* 1342 */       buffer = newBuffer;
/*      */     }
/*      */ 
/* 1349 */     buffer.put(newData);
/*      */ 
/* 1351 */     return buffer;
/*      */   }
/*      */ 
/*      */   public ISFSObject pojo2sfs(Object pojo)
/*      */   {
/* 1389 */     ISFSObject sfsObj = SFSObject.newInstance();
/*      */     try
/*      */     {
/* 1393 */       convertPojo(pojo, sfsObj);
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/* 1397 */       throw new SFSRuntimeException(e);
/*      */     }
/*      */ 
/* 1401 */     return sfsObj;
/*      */   }
/*      */ 
/*      */   private void convertPojo(Object pojo, ISFSObject sfsObj) throws Exception
/*      */   {
/* 1406 */     Class pojoClazz = pojo.getClass();
/* 1407 */     String classFullName = pojoClazz.getCanonicalName();
/*      */ 
/* 1409 */     if (classFullName == null) {
/* 1410 */       throw new IllegalArgumentException("Anonymous classes cannot be serialized!");
/*      */     }
/* 1412 */     if (!(pojo instanceof SerializableSFSType)) {
/* 1413 */       throw new IllegalStateException("Cannot serialize object: " + pojo + ", type: " + classFullName + " -- It doesn't implement the SerializableSFSType interface");
/*      */     }
/* 1415 */     ISFSArray fieldList = SFSArray.newInstance();
/*      */ 
/* 1418 */     sfsObj.putUtfString("$C", classFullName);
/* 1419 */     sfsObj.putSFSArray("$F", fieldList);
/*      */ 
/* 1422 */     for (Field field : pojoClazz.getDeclaredFields())
/*      */     {
/*      */       try
/*      */       {
/* 1427 */         int modifiers = field.getModifiers();
/*      */ 
/* 1430 */         if ((Modifier.isTransient(modifiers)) || (Modifier.isStatic(modifiers))) {
/*      */           continue;
/*      */         }
/* 1433 */         String fieldName = field.getName();
/* 1434 */         Object fieldValue = null;
/*      */ 
/* 1437 */         if (Modifier.isPublic(modifiers)) {
/* 1438 */           fieldValue = field.get(pojo);
/*      */         }
/*      */         else
/*      */         {
/* 1448 */           fieldValue = readValueFromGetter(fieldName, field.getType().getSimpleName(), pojo);
/*      */         }
/*      */ 
/* 1452 */         ISFSObject fieldDescriptor = SFSObject.newInstance();
/*      */ 
/* 1455 */         fieldDescriptor.putUtfString("N", fieldName);
/*      */ 
/* 1458 */         fieldDescriptor.put("V", wrapPojoField(fieldValue));
/*      */ 
/* 1461 */         fieldList.addSFSObject(fieldDescriptor);
/*      */       }
/*      */       catch (NoSuchMethodException err)
/*      */       {
/* 1465 */         this.logger.info("-- No public getter -- Serializer skipping private field: " + field.getName() + ", from class: " + pojoClazz);
/* 1466 */         err.printStackTrace();
/*      */       }
/*      */     }
/*      */   }
/*      */ 
/*      */   private Object readValueFromGetter(String fieldName, String type, Object pojo) throws Exception
/*      */   {
/* 1473 */     Object value = null;
/* 1474 */     boolean isBool = type.equalsIgnoreCase("boolean");
/*      */ 
/* 1479 */     String getterName = "get" + StringUtils.capitalize(fieldName);
/*      */ 
/* 1482 */     Method getterMethod = pojo.getClass().getMethod(getterName, new Class[0]);
/* 1483 */     value = getterMethod.invoke(pojo, new Object[0]);
/*      */ 
/* 1486 */     return value;
/*      */   }
/*      */ 
/*      */   private SFSDataWrapper wrapPojoField(Object value)
/*      */   {
/* 1492 */     if (value == null)
/*      */     {
/* 1494 */       return new SFSDataWrapper(SFSDataType.NULL, null);
/*      */     }
/*      */ 
/* 1497 */     SFSDataWrapper wrapper = null;
/*      */ 
/* 1501 */     if ((value instanceof Boolean))
/*      */     {
/* 1503 */       wrapper = new SFSDataWrapper(SFSDataType.BOOL, value);
/*      */     }
/* 1506 */     else if ((value instanceof Byte))
/*      */     {
/* 1508 */       wrapper = new SFSDataWrapper(SFSDataType.BYTE, value);
/*      */     }
/* 1511 */     else if ((value instanceof Short))
/*      */     {
/* 1513 */       wrapper = new SFSDataWrapper(SFSDataType.SHORT, value);
/*      */     }
/* 1516 */     else if ((value instanceof Integer))
/*      */     {
/* 1518 */       wrapper = new SFSDataWrapper(SFSDataType.INT, value);
/*      */     }
/* 1521 */     else if ((value instanceof Long))
/*      */     {
/* 1523 */       wrapper = new SFSDataWrapper(SFSDataType.LONG, value);
/*      */     }
/* 1526 */     else if ((value instanceof Float))
/*      */     {
/* 1528 */       wrapper = new SFSDataWrapper(SFSDataType.FLOAT, value);
/*      */     }
/* 1531 */     else if ((value instanceof Double))
/*      */     {
/* 1533 */       wrapper = new SFSDataWrapper(SFSDataType.DOUBLE, value);
/*      */     }
/* 1536 */     else if ((value instanceof String))
/*      */     {
/* 1538 */       wrapper = new SFSDataWrapper(SFSDataType.UTF_STRING, value);
/*      */     }
/* 1542 */     else if (value.getClass().isArray())
/*      */     {
/* 1545 */       wrapper = new SFSDataWrapper(SFSDataType.SFS_ARRAY, unrollArray((Object[])value));
/*      */     }
/* 1549 */     else if ((value instanceof Collection))
/*      */     {
/* 1552 */       wrapper = new SFSDataWrapper(SFSDataType.SFS_ARRAY, unrollCollection((Collection)value));
/*      */     }
/* 1556 */     else if ((value instanceof Map))
/*      */     {
/* 1559 */       wrapper = new SFSDataWrapper(SFSDataType.SFS_OBJECT, unrollMap((Map)value));
/*      */     }
/* 1562 */     else if ((value instanceof SerializableSFSType))
/*      */     {
/* 1565 */       wrapper = new SFSDataWrapper(SFSDataType.SFS_OBJECT, pojo2sfs(value));
/*      */     }
/*      */ 
/* 1568 */     return wrapper;
/*      */   }
/*      */ 
/*      */   private ISFSArray unrollArray(Object[] arr)
/*      */   {
/* 1573 */     ISFSArray array = SFSArray.newInstance();
/*      */ 
/* 1575 */     for (Object item : arr)
/*      */     {
/* 1577 */       array.add(wrapPojoField(item));
/*      */     }
/*      */ 
/* 1580 */     return array;
/*      */   }
/*      */ 
/*      */   private ISFSArray unrollCollection(Collection collection)
/*      */   {
/* 1585 */     ISFSArray array = SFSArray.newInstance();
/*      */ 
/* 1587 */     for (Iterator localIterator = collection.iterator(); localIterator.hasNext(); ) { Object item = localIterator.next();
/*      */ 
/* 1589 */       array.add(wrapPojoField(item));
/*      */     }
/*      */ 
/* 1592 */     return array;
/*      */   }
/*      */ 
/*      */   private ISFSObject unrollMap(Map map)
/*      */   {
/* 1597 */     ISFSObject sfsObj = SFSObject.newInstance();
/* 1598 */     Set entries = map.entrySet();
/*      */ 
/* 1600 */     for (Iterator iter = entries.iterator(); iter.hasNext(); )
/*      */     {
/* 1602 */       Map.Entry item = (Map.Entry)iter.next();
/* 1603 */       Object key = item.getKey();
/*      */ 
/* 1605 */       if (!(key instanceof String))
/*      */         continue;
/* 1607 */       sfsObj.put((String)key, wrapPojoField(item.getValue()));
/*      */     }
/*      */ 
/* 1611 */     return sfsObj;
/*      */   }
/*      */ 
/*      */   public Object sfs2pojo(ISFSObject sfsObj)
/*      */   {
/* 1624 */     Object pojo = null;
/*      */ 
/* 1626 */     if ((!sfsObj.containsKey("$C")) && (!sfsObj.containsKey("$F"))) {
/* 1627 */       throw new SFSRuntimeException("The SFSObject passed does not represent any serialized class.");
/*      */     }
/*      */     try
/*      */     {
/* 1631 */       String className = sfsObj.getUtfString("$C");
/* 1632 */       Class theClass = Class.forName(className);
/* 1633 */       pojo = theClass.newInstance();
/*      */ 
/* 1635 */       if (!(pojo instanceof SerializableSFSType)) {
/* 1636 */         throw new IllegalStateException("Cannot deserialize object: " + pojo + ", type: " + className + " -- It doesn't implement the SerializableSFSType interface");
/*      */       }
/* 1638 */       convertSFSObject(sfsObj.getSFSArray("$F"), pojo);
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/* 1643 */       throw new SFSRuntimeException(e);
/*      */     }
/*      */ 
/* 1646 */     return pojo;
/*      */   }
/*      */ 
/*      */   private void convertSFSObject(ISFSArray fieldList, Object pojo)
/*      */     throws Exception
/*      */   {
/* 1653 */     for (int j = 0; j < fieldList.size(); j++)
/*      */     {
/* 1655 */       ISFSObject fieldDescriptor = fieldList.getSFSObject(j);
/* 1656 */       String fieldName = fieldDescriptor.getUtfString("N");
/* 1657 */       Object fieldValue = unwrapPojoField(fieldDescriptor.get("V"));
/*      */ 
/* 1659 */       setObjectField(pojo, fieldName, fieldValue);
/*      */     }
/*      */   }
/*      */ 
/*      */   private void setObjectField(Object pojo, String fieldName, Object fieldValue)
/*      */     throws Exception
/*      */   {
/* 1669 */     Class pojoClass = pojo.getClass();
/* 1670 */     Field field = pojoClass.getDeclaredField(fieldName);
/* 1671 */     int fieldModifier = field.getModifiers();
/*      */ 
/* 1674 */     if (Modifier.isTransient(fieldModifier)) {
/* 1675 */       return;
/*      */     }
/*      */ 
/* 1678 */     boolean isArray = field.getType().isArray();
/* 1679 */     if (isArray)
/*      */     {
/* 1681 */       if (!(fieldValue instanceof Collection)) {
/* 1682 */         throw new SFSRuntimeException("Problem during SFSObject => POJO conversion. Found array field in POJO: " + fieldName + ", but data is not a Collection!");
/*      */       }
/*      */ 
/* 1685 */       Collection collection = (Collection)fieldValue;
/* 1686 */       fieldValue = collection.toArray();
/* 1687 */       int arraySize = collection.size();
/*      */ 
/* 1694 */       Object typedArray = Array.newInstance(field.getType().getComponentType(), arraySize);
/* 1695 */       System.arraycopy(fieldValue, 0, typedArray, 0, arraySize);
/*      */ 
/* 1697 */       fieldValue = typedArray;
/*      */     }
/* 1701 */     else if ((fieldValue instanceof Collection))
/*      */     {
/* 1703 */       Collection collection = (Collection)fieldValue;
/* 1704 */       String fieldClass = field.getType().getSimpleName();
/*      */ 
/* 1708 */       if ((fieldClass.equals("ArrayList")) || (fieldClass.equals("List"))) {
/* 1709 */         fieldValue = new ArrayList(collection);
/*      */       }
/* 1711 */       if (fieldClass.equals("CopyOnWriteArrayList")) {
/* 1712 */         fieldValue = new CopyOnWriteArrayList(collection);
/*      */       }
/* 1714 */       else if (fieldClass.equals("LinkedList")) {
/* 1715 */         fieldValue = new LinkedList(collection);
/*      */       }
/* 1717 */       else if (fieldClass.equals("Vector")) {
/* 1718 */         fieldValue = new Vector(collection);
/*      */       }
/* 1721 */       else if ((fieldClass.equals("Set")) || (fieldClass.equals("HashSet"))) {
/* 1722 */         fieldValue = new HashSet(collection);
/*      */       }
/* 1724 */       else if (fieldClass.equals("LinkedHashSet")) {
/* 1725 */         fieldValue = new LinkedHashSet(collection);
/*      */       }
/* 1727 */       else if (fieldClass.equals("TreeSet")) {
/* 1728 */         fieldValue = new TreeSet(collection);
/*      */       }
/* 1730 */       else if (fieldClass.equals("CopyOnWriteArraySet")) {
/* 1731 */         fieldValue = new CopyOnWriteArraySet(collection);
/*      */       }
/* 1734 */       else if ((fieldClass.equals("Queue")) || (fieldClass.equals("PriorityQueue"))) {
/* 1735 */         fieldValue = new PriorityQueue(collection);
/*      */       }
/* 1737 */       else if ((fieldClass.equals("BlockingQueue")) || (fieldClass.equals("LinkedBlockingQueue"))) {
/* 1738 */         fieldValue = new LinkedBlockingQueue(collection);
/*      */       }
/* 1740 */       else if (fieldClass.equals("PriorityBlockingQueue")) {
/* 1741 */         fieldValue = new PriorityBlockingQueue(collection);
/*      */       }
/* 1743 */       else if (fieldClass.equals("ConcurrentLinkedQueue")) {
/* 1744 */         fieldValue = new ConcurrentLinkedQueue(collection);
/*      */       }
/* 1746 */       else if (fieldClass.equals("DelayQueue")) {
/* 1747 */         fieldValue = new DelayQueue(collection);
/*      */       }
/* 1750 */       else if ((fieldClass.equals("Deque")) || (fieldClass.equals("ArrayDeque"))) {
/* 1751 */         fieldValue = new ArrayDeque(collection);
/*      */       }
/* 1753 */       else if (fieldClass.equals("LinkedBlockingDeque")) {
/* 1754 */         fieldValue = new LinkedBlockingDeque(collection);
/*      */       }
/*      */ 
/*      */     }
/*      */ 
/* 1760 */     if (Modifier.isPublic(fieldModifier))
/* 1761 */       field.set(pojo, fieldValue);
/*      */     else
/* 1763 */       writeValueFromSetter(field, pojo, fieldValue);
/*      */   }
/*      */ 
/*      */   private void writeValueFromSetter(Field field, Object pojo, Object fieldValue) throws Exception
/*      */   {
/* 1768 */     String setterName = "set" + StringUtils.capitalize(field.getName());
/*      */     try
/*      */     {
/* 1774 */       Method setterMethod = pojo.getClass().getMethod(setterName, new Class[] { field.getType() });
/* 1775 */       setterMethod.invoke(pojo, new Object[] { fieldValue });
/*      */     }
/*      */     catch (NoSuchMethodException e)
/*      */     {
/* 1780 */       this.logger.info("-- No public setter -- Serializer skipping private field: " + field.getName() + ", from class: " + pojo.getClass().getName());
/*      */     }
/*      */   }
/*      */ 
/*      */   private Object unwrapPojoField(SFSDataWrapper wrapper)
/*      */   {
/* 1787 */     Object obj = null;
/*      */ 
/* 1789 */     SFSDataType type = wrapper.getTypeId();
/*      */ 
/* 1792 */     if (type.getTypeID() <= SFSDataType.UTF_STRING.getTypeID())
/*      */     {
/* 1794 */       obj = wrapper.getObject();
/*      */     }
/* 1797 */     else if (type == SFSDataType.SFS_ARRAY)
/*      */     {
/* 1799 */       obj = rebuildArray((ISFSArray)wrapper.getObject());
/*      */     }
/* 1802 */     else if (type == SFSDataType.SFS_OBJECT)
/*      */     {
/* 1817 */       obj = rebuildMap((ISFSObject)wrapper.getObject());
/*      */     }
/* 1820 */     else if (type == SFSDataType.CLASS)
/*      */     {
/* 1822 */       obj = wrapper.getObject();
/*      */     }
/*      */ 
/* 1825 */     return obj;
/*      */   }
/*      */ 
/*      */   private Object rebuildArray(ISFSArray sfsArray)
/*      */   {
/* 1834 */     Collection collection = new ArrayList();
/*      */ 
/* 1836 */     for (Iterator iter = sfsArray.iterator(); iter.hasNext(); )
/*      */     {
/* 1838 */       Object item = unwrapPojoField((SFSDataWrapper)iter.next());
/* 1839 */       collection.add(item);
/*      */     }
/*      */ 
/* 1842 */     return collection;
/*      */   }
/*      */ 
/*      */   private Object rebuildMap(ISFSObject sfsObj)
/*      */   {
/* 1847 */     Map map = new HashMap();
/*      */ 
/* 1849 */     for (String key : sfsObj.getKeys())
/*      */     {
/* 1851 */       SFSDataWrapper wrapper = sfsObj.get(key);
/* 1852 */       map.put(key, unwrapPojoField(wrapper));
/*      */     }
/*      */ 
/* 1855 */     return map;
/*      */   }
/*      */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.serialization.DefaultSFSDataSerializer
 * JD-Core Version:    0.6.0
 */