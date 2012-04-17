package com.smartfoxserver.v2.protocol.binary;

import com.smartfoxserver.bitswarm.sessions.ISession;

public abstract interface IPacketEncrypter
{
  public abstract byte[] encrypt(ISession paramISession, byte[] paramArrayOfByte);

  public abstract byte[] decrypt(ISession paramISession, byte[] paramArrayOfByte);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.protocol.binary.IPacketEncrypter
 * JD-Core Version:    0.6.0
 */