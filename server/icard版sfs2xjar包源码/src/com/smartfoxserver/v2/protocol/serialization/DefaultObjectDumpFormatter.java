/*    */ package com.smartfoxserver.v2.protocol.serialization;
/*    */ 
/*    */ import java.util.Arrays;
/*    */ 
/*    */ public class DefaultObjectDumpFormatter
/*    */ {
/*    */   public static final char TOKEN_INDENT_OPEN = '{';
/*    */   public static final char TOKEN_INDENT_CLOSE = '}';
/*    */   public static final char TOKEN_DIVIDER = ';';
/*    */ 
/*    */   public static String prettyPrintByteArray(byte[] bytes)
/*    */   {
/* 14 */     if (bytes == null) {
/* 15 */       return "Null";
/*    */     }
/* 17 */     return String.format("Byte[%s]", new Object[] { Integer.valueOf(bytes.length) });
/*    */   }
/*    */ 
/*    */   public static String prettyPrintDump(String rawDump)
/*    */   {
/* 22 */     StringBuilder buf = new StringBuilder();
/* 23 */     int indentPos = 0;
/*    */ 
/* 25 */     for (int i = 0; i < rawDump.length(); i++)
/*    */     {
/* 27 */       char ch = rawDump.charAt(i);
/*    */ 
/* 29 */       if (ch == '{')
/*    */       {
/* 31 */         indentPos++;
/* 32 */         buf.append("\n").append(getFormatTabs(indentPos));
/*    */       }
/* 35 */       else if (ch == '}')
/*    */       {
/* 37 */         indentPos--;
/* 38 */         if (indentPos < 0) {
/* 39 */           throw new IllegalStateException("Argh! The indentPos is negative. TOKENS ARE NOT BALANCED!");
/*    */         }
/* 41 */         buf.append("\n").append(getFormatTabs(indentPos));
/*    */       }
/* 44 */       else if (ch == ';')
/*    */       {
/* 46 */         buf.append("\n").append(getFormatTabs(indentPos));
/*    */       }
/*    */       else
/*    */       {
/* 51 */         buf.append(ch);
/*    */       }
/*    */     }
/*    */ 
/* 55 */     if (indentPos != 0) {
/* 56 */       throw new IllegalStateException("Argh! The indentPos is not == 0. TOKENS ARE NOT BALANCED!");
/*    */     }
/* 58 */     return buf.toString();
/*    */   }
/*    */ 
/*    */   private static String getFormatTabs(int howMany)
/*    */   {
/* 67 */     return strFill('\t', howMany);
/*    */   }
/*    */ 
/*    */   private static String strFill(char c, int howMany)
/*    */   {
/* 75 */     char[] chars = new char[howMany];
/* 76 */     Arrays.fill(chars, c);
/*    */ 
/* 78 */     return new String(chars);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.serialization.DefaultObjectDumpFormatter
 * JD-Core Version:    0.6.0
 */