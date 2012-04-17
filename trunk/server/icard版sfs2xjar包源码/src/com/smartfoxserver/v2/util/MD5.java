/*    */ package com.smartfoxserver.v2.util;
/*    */ 
/*    */ import java.security.MessageDigest;
/*    */ import java.security.NoSuchAlgorithmException;
/*    */ import org.slf4j.Logger;
/*    */ import org.slf4j.LoggerFactory;
/*    */ 
/*    */ public final class MD5
/*    */ {
/* 11 */   private static MD5 _instance = new MD5();
/*    */   private MessageDigest messageDigest;
/*    */   private final Logger log;
/*    */ 
/*    */   private MD5()
/*    */   {
/* 21 */     this.log = LoggerFactory.getLogger(getClass());
/*    */     try
/*    */     {
/* 26 */       this.messageDigest = MessageDigest.getInstance("MD5");
/*    */     }
/*    */     catch (NoSuchAlgorithmException e)
/*    */     {
/* 30 */       this.log.error("Could not instantiate the MD5 Message Digest!");
/*    */     }
/*    */   }
/*    */ 
/*    */   public static MD5 getInstance()
/*    */   {
/* 41 */     return _instance;
/*    */   }
/*    */ 
/*    */   public synchronized String getHash(String s)
/*    */   {
/* 53 */     byte[] data = s.getBytes();
/*    */ 
/* 55 */     this.messageDigest.update(data);
/*    */ 
/* 57 */     return toHexString(this.messageDigest.digest());
/*    */   }
/*    */ 
/*    */   private String toHexString(byte[] byteData)
/*    */   {
/* 68 */     StringBuffer sb = new StringBuffer();
/*    */ 
/* 71 */     for (int i = 0; i < byteData.length; i++)
/*    */     {
/* 73 */       String hex = Integer.toHexString(byteData[i] & 0xFF);
/* 74 */       if (hex.length() == 1) {
/* 75 */         hex = "0" + hex;
/*    */       }
/* 77 */       sb.append(hex);
/*    */     }
/*    */ 
/* 80 */     return sb.toString();
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.MD5
 * JD-Core Version:    0.6.0
 */