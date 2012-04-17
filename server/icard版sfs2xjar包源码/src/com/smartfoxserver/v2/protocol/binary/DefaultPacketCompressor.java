/*     */ package com.smartfoxserver.v2.protocol.binary;
/*     */ 
/*     */ import java.io.ByteArrayOutputStream;
/*     */ import java.util.zip.Deflater;
/*     */ import java.util.zip.Inflater;
/*     */ 
/*     */ public final class DefaultPacketCompressor
/*     */   implements IPacketCompressor
/*     */ {
/*  10 */   public final int MAX_SIZE_FOR_COMPRESSION = 1000000;
/*  11 */   private final int compressionBufferSize = 256;
/*     */ 
/*     */   public byte[] compress(byte[] data)
/*     */     throws Exception
/*     */   {
/*  34 */     if (data.length > 1000000) {
/*  35 */       return data;
/*     */     }
/*     */ 
/*  38 */     Deflater compressor = new Deflater();
/*     */ 
/*  52 */     compressor.setInput(data);
/*  53 */     compressor.finish();
/*     */ 
/*  59 */     ByteArrayOutputStream bos = new ByteArrayOutputStream(data.length);
/*     */ 
/*  62 */     byte[] buf = new byte[256];
/*  63 */     while (!compressor.finished())
/*     */     {
/*  65 */       int count = compressor.deflate(buf);
/*  66 */       bos.write(buf, 0, count);
/*     */     }
/*     */ 
/*  69 */     bos.close();
/*     */ 
/*  72 */     return bos.toByteArray();
/*     */   }
/*     */ 
/*     */   public byte[] uncompress(byte[] zipData)
/*     */     throws Exception
/*     */   {
/*  80 */     Inflater unzipper = new Inflater();
/*  81 */     unzipper.setInput(zipData);
/*     */ 
/*  84 */     ByteArrayOutputStream bos = new ByteArrayOutputStream(zipData.length);
/*     */ 
/*  87 */     byte[] buf = new byte[256];
/*     */ 
/*  90 */     while (!unzipper.finished())
/*     */     {
/*  92 */       int count = unzipper.inflate(buf);
/*  93 */       bos.write(buf, 0, count);
/*     */     }
/*     */ 
/*  97 */     bos.close();
/*     */ 
/* 100 */     return bos.toByteArray();
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.binary.DefaultPacketCompressor
 * JD-Core Version:    0.6.0
 */