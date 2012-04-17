package com.smartfoxserver.v2.entities.managers;

import com.smartfoxserver.v2.config.ZoneSettings;
import com.smartfoxserver.v2.config.ZoneSettings.RoomSettings;
import com.smartfoxserver.v2.core.ICoreService;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.Zone;
import com.smartfoxserver.v2.exceptions.SFSException;
import java.util.List;

public abstract interface IZoneManager extends ICoreService
{
  public abstract List<Zone> getZoneList();

  public abstract Zone getZoneByName(String paramString);

  public abstract Zone getZoneById(int paramInt);

  public abstract void initializeZones()
    throws SFSException;

  public abstract void addZone(Zone paramZone);

  public abstract Zone createZone(ZoneSettings paramZoneSettings)
    throws SFSException;

  public abstract Room createRoom(Zone paramZone, ZoneSettings.RoomSettings paramRoomSettings)
    throws SFSException;

  public abstract void toggleZone(String paramString, boolean paramBoolean);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.IZoneManager
 * JD-Core Version:    0.6.0
 */