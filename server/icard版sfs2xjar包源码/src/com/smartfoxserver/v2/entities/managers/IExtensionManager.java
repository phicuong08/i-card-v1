package com.smartfoxserver.v2.entities.managers;

import com.smartfoxserver.v2.config.ZoneSettings.ExtensionSettings;
import com.smartfoxserver.v2.core.ISFSEvent;
import com.smartfoxserver.v2.core.ISFSEventListener;
import com.smartfoxserver.v2.core.SFSEventType;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.Zone;
import com.smartfoxserver.v2.exceptions.SFSExtensionException;
import com.smartfoxserver.v2.extensions.ExtensionLevel;
import com.smartfoxserver.v2.extensions.ISFSExtension;
import java.util.List;

public abstract interface IExtensionManager
{
  public abstract void createExtension(ZoneSettings.ExtensionSettings paramExtensionSettings, ExtensionLevel paramExtensionLevel, Zone paramZone, Room paramRoom)
    throws SFSExtensionException;

  public abstract void destroyExtension(ISFSExtension paramISFSExtension);

  public abstract void addExtension(ISFSExtension paramISFSExtension);

  public abstract ISFSExtension getRoomExtension(Room paramRoom);

  public abstract ISFSExtension getZoneExtension(Zone paramZone);

  public abstract int getExtensionsCount();

  public abstract List<ISFSExtension> getExtensions();

  public abstract void init();

  public abstract void destroy();

  public abstract void activateAllExtensions();

  public abstract void deactivateAllExtensions();

  public abstract void reloadExtension(ISFSExtension paramISFSExtension);

  public abstract void reloadRoomExtension(String paramString, Room paramRoom);

  public abstract void reloadZoneExtension(String paramString, Zone paramZone);

  public abstract void addZoneEventListener(SFSEventType paramSFSEventType, ISFSEventListener paramISFSEventListener, Zone paramZone);

  public abstract void addRoomEventListener(SFSEventType paramSFSEventType, ISFSEventListener paramISFSEventListener, Room paramRoom);

  public abstract void removeZoneEventListener(SFSEventType paramSFSEventType, ISFSEventListener paramISFSEventListener, Zone paramZone);

  public abstract void removeRoomEventListener(SFSEventType paramSFSEventType, ISFSEventListener paramISFSEventListener, Room paramRoom);

  public abstract void removeListenerFromZone(ISFSEventListener paramISFSEventListener, Zone paramZone);

  public abstract void removeListenerFromRoom(ISFSEventListener paramISFSEventListener, Room paramRoom);

  public abstract void dispatchEvent(ISFSEvent paramISFSEvent, ExtensionLevel paramExtensionLevel);

  public abstract boolean isExtensionMonitorActive();

  public abstract void setExtensionMonitorActive(boolean paramBoolean);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.IExtensionManager
 * JD-Core Version:    0.6.0
 */