/*    */ package com.smartfoxserver.v2.util;
/*    */ 
/*    */ import java.io.BufferedInputStream;
/*    */ import java.io.ByteArrayOutputStream;
/*    */ import java.io.FileNotFoundException;
/*    */ import java.io.IOException;
/*    */ import java.io.InputStream;
/*    */ 
/*    */ public class ResourcesUtil
/*    */ {
/*    */   public static String readTextData(String resourceName)
/*    */     throws IOException
/*    */   {
/* 13 */     return new String(readBinaryData(resourceName));
/*    */   }
/*    */ 
/*    */   public static byte[] readBinaryData(String resourceName) throws IOException
/*    */   {
/* 18 */     byte[] byteData = (byte[])null;
/* 19 */     InputStream is = ResourcesUtil.class.getClassLoader().getResourceAsStream(resourceName);
/*    */ 
/* 21 */     if (is == null) {
/* 22 */       throw new FileNotFoundException("Resource '" + resourceName + "' was not found");
/*    */     }
/* 24 */     BufferedInputStream bis = null;
/* 25 */     ByteArrayOutputStream baos = null;
/*    */     try
/*    */     {
/* 29 */       baos = new ByteArrayOutputStream();
/* 30 */       bis = new BufferedInputStream(is);
/*    */       int read;
/* 34 */       while ((read = bis.read()) != -1)
/*    */       {

/* 35 */         baos.write(read);
/*    */       }
/*    */     }
/*    */     finally
/*    */     {
/*    */       try
/*    */       {
/* 42 */         if (bis != null) {
/* 43 */           bis.close();
/*    */         }
/* 45 */         if (baos != null)
/* 46 */           baos.close();
/*    */       }
/*    */       catch (Exception localException) {
/*    */       }
/* 50 */       byteData = baos.toByteArray();
/*    */     }
/*    */ 
/* 53 */     return byteData;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.ResourcesUtil
 * JD-Core Version:    0.6.0
 */