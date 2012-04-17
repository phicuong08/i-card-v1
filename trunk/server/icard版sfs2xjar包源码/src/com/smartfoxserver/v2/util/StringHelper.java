/*    */ package com.smartfoxserver.v2.util;
/*    */ 
/*    */ import java.io.File;
/*    */ import java.io.IOException;
/*    */ import org.apache.commons.io.FileUtils;
/*    */ 
/*    */ public class StringHelper
/*    */ {
/*    */   private static final String ASCII_FOLDER = "config/ascii/";
/*    */   private static final String ASCII_EXT = ".txt";
/*    */ 
/*    */   public static void fillRight(StringBuilder sb, char c, int max)
/*    */   {
/* 15 */     sb.append(fillString(c, max));
/*    */   }
/*    */ 
/*    */   public static void fillLeft(StringBuilder sb, char c, int max)
/*    */   {
/* 20 */     sb.insert(0, fillString(c, max));
/*    */   }
/*    */ 
/*    */   private static String fillString(char c, int len)
/*    */   {
/* 25 */     StringBuilder sb = new StringBuilder();
/* 26 */     for (int i = 0; i < len; i++) {
/* 27 */       sb.append(c);
/*    */     }
/* 29 */     return sb.toString();
/*    */   }
/*    */ 
/*    */   public static String getAsciiMessage(String messageName)
/*    */   {
/* 34 */     String filePath = "config/ascii/" + messageName + ".txt";
/* 35 */     String asciiMessage = null;
/*    */     try
/*    */     {
/* 39 */       asciiMessage = FileUtils.readFileToString(new File(filePath));
/*    */     }
/*    */     catch (IOException localIOException)
/*    */     {
/*    */     }
/*    */ 
/* 46 */     return asciiMessage;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.StringHelper
 * JD-Core Version:    0.6.0
 */