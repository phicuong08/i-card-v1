/*   */ package com.smartfoxserver.v2.protocol.binary;
/*   */ 
/*   */ public enum PacketReadState
/*   */ {
/* 5 */   WAIT_NEW_PACKET, 
/* 6 */   WAIT_DATA_SIZE, 
/* 7 */   WAIT_DATA_SIZE_FRAGMENT, 
/* 8 */   WAIT_DATA;
/*   */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.binary.PacketReadState
 * JD-Core Version:    0.6.0
 */