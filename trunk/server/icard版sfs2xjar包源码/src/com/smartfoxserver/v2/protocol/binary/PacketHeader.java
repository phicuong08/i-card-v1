/*    */ package com.smartfoxserver.v2.protocol.binary;
/*    */ 
/*    */ public class PacketHeader
/*    */ {
/*  5 */   private int expectedLen = -1;
/*    */   private final boolean binary;
/*    */   private final boolean compressed;
/*    */   private final boolean encrypted;
/*    */   private final boolean blueBoxed;
/*    */   private final boolean bigSized;
/*    */ 
/*    */   public PacketHeader(boolean binary, boolean encrypted, boolean compressed, boolean blueBoxed, boolean bigSized)
/*    */   {
/* 19 */     this.binary = binary;
/* 20 */     this.compressed = compressed;
/* 21 */     this.encrypted = encrypted;
/* 22 */     this.blueBoxed = blueBoxed;
/* 23 */     this.bigSized = bigSized;
/*    */   }
/*    */ 
/*    */   public int getExpectedLen()
/*    */   {
/* 28 */     return this.expectedLen;
/*    */   }
/*    */ 
/*    */   public void setExpectedLen(int len)
/*    */   {
/* 33 */     this.expectedLen = len;
/*    */   }
/*    */ 
/*    */   public boolean isBinary()
/*    */   {
/* 38 */     return this.binary;
/*    */   }
/*    */ 
/*    */   public boolean isCompressed()
/*    */   {
/* 43 */     return this.compressed;
/*    */   }
/*    */ 
/*    */   public boolean isEncrypted()
/*    */   {
/* 48 */     return this.encrypted;
/*    */   }
/*    */ 
/*    */   public boolean isBlueBoxed()
/*    */   {
/* 53 */     return this.blueBoxed;
/*    */   }
/*    */ 
/*    */   public boolean isBigSized()
/*    */   {
/* 58 */     return this.bigSized;
/*    */   }
/*    */ 
/*    */   public String toString()
/*    */   {
/* 64 */     StringBuilder buf = new StringBuilder();
/*    */ 
/* 66 */     buf.append("\n---------------------------------------------\n");
/* 67 */     buf.append("Binary:  \t" + isBinary() + "\n");
/* 68 */     buf.append("Compressed:\t" + isCompressed() + "\n");
/* 69 */     buf.append("Encrypted:\t" + isEncrypted() + "\n");
/* 70 */     buf.append("BlueBoxed:\t" + isBlueBoxed() + "\n");
/* 71 */     buf.append("BigSized:\t" + isBigSized() + "\n");
/* 72 */     buf.append("---------------------------------------------\n");
/*    */ 
/* 74 */     return buf.toString();
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.binary.PacketHeader
 * JD-Core Version:    0.6.0
 */