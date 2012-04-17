package com.smartfoxserver.v2.util;

import com.smartfoxserver.v2.entities.Room;

public abstract interface IPlayerIdGenerator
{
  public abstract void init();

  public abstract int getPlayerSlot();

  public abstract void freePlayerSlot(int paramInt);

  public abstract void onRoomResize();

  public abstract void setParentRoom(Room paramRoom);

  public abstract Room getParentRoom();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.IPlayerIdGenerator
 * JD-Core Version:    0.6.0
 */