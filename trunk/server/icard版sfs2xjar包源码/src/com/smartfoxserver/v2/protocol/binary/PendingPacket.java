/*    */ package com.smartfoxserver.v2.protocol.binary;
/*    */ 
/*    */ public class PendingPacket
/*    */ {
/*    */   private PacketHeader header;
/*    */   private Object buffer;
/*    */ 
/*    */   public PendingPacket(PacketHeader header)
/*    */   {
/* 11 */     this.header = header;
/*    */   }
/*    */ 
/*    */   public PacketHeader getHeader()
/*    */   {
/* 16 */     return this.header;
/*    */   }
/*    */ 
/*    */   public Object getBuffer()
/*    */   {
/* 21 */     return this.buffer;
/*    */   }
/*    */ 
/*    */   public void setBuffer(Object buffer)
/*    */   {
/* 26 */     this.buffer = buffer;
/*    */   }
/*    */ 
/*    */   public String toString()
/*    */   {
/* 32 */     return this.header.toString() + this.buffer.toString();
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.binary.PendingPacket
 * JD-Core Version:    0.6.0
 */