/*    */ package com.smartfoxserver.v2.util;
/*    */ 
/*    */ import java.io.File;
/*    */ import java.io.IOException;
/*    */ import org.apache.commons.io.FileUtils;
/*    */ 
/*    */ public final class FlashMasterSocketPolicyLoader
/*    */ {
/*    */   public String loadPolicy(String fileName)
/*    */     throws IOException
/*    */   {
/* 12 */     return FileUtils.readFileToString(new File(fileName));
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.FlashMasterSocketPolicyLoader
 * JD-Core Version:    0.6.0
 */