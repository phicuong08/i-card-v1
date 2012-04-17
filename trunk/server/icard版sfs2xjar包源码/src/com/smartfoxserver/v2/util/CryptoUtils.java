/*    */ package com.smartfoxserver.v2.util;
/*    */ 
/*    */ import com.smartfoxserver.bitswarm.sessions.ISession;
/*    */ import java.util.Random;
/*    */ 
/*    */ public class CryptoUtils
/*    */ {
/*    */   private static final String DELIMITER = "__";
/*    */ 
/*    */   public static String getClientPassword(ISession session, String clearPass)
/*    */   {
/* 13 */     return MD5.getInstance().getHash(session.getHashId() + clearPass);
/*    */   }
/*    */ 
/*    */   public static String getMD5Hash(String str)
/*    */   {
/* 18 */     return MD5.getInstance().getHash(str);
/*    */   }
/*    */ 
/*    */   public static String getUniqueSessionToken(ISession session)
/*    */   {
/* 33 */     Random rnd = new Random();
/* 34 */     String key = session.getFullIpAddress() + "__" + String.valueOf(rnd.nextInt());
/*    */ 
/* 36 */     return MD5.getInstance().getHash(key);
/*    */   }
/*    */ 
/*    */   public static String getHexFileName(String name)
/*    */   {
/* 47 */     StringBuilder sb = new StringBuilder();
/*    */ 
/* 49 */     char[] c = name.toCharArray();
/*    */ 
/* 51 */     for (int i = 0; i < c.length; i++)
/*    */     {
/* 53 */       sb.append(Integer.toHexString(c[i]));
/*    */     }
/*    */ 
/* 56 */     return sb.toString();
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.CryptoUtils
 * JD-Core Version:    0.6.0
 */