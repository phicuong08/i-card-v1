package com.smartfoxserver.v2.protocol.binary;

public abstract interface IPacketCompressor
{
  public abstract byte[] compress(byte[] paramArrayOfByte)
    throws Exception;

  public abstract byte[] uncompress(byte[] paramArrayOfByte)
    throws Exception;
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.binary.IPacketCompressor
 * JD-Core Version:    0.6.0
 */