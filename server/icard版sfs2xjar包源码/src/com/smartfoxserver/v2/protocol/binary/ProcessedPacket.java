/*    */ package com.smartfoxserver.v2.protocol.binary;
/*    */ 
/*    */ public class ProcessedPacket
/*    */ {
/*    */   private byte[] data;
/*    */   private PacketReadState state;
/*    */ 
/*    */   public ProcessedPacket(PacketReadState state, byte[] data)
/*    */   {
/* 10 */     this.state = state;
/* 11 */     this.data = data;
/*    */   }
/*    */ 
/*    */   public byte[] getData()
/*    */   {
/* 16 */     return this.data;
/*    */   }
/*    */ 
/*    */   public PacketReadState getState()
/*    */   {
/* 21 */     return this.state;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.binary.ProcessedPacket
 * JD-Core Version:    0.6.0
 */