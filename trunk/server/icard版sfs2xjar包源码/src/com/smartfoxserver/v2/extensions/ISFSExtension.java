package com.smartfoxserver.v2.extensions;

import com.smartfoxserver.v2.core.ISFSEventListener;
import com.smartfoxserver.v2.core.SFSEventType;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.Zone;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.exceptions.SFSException;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

public abstract interface ISFSExtension
{
  public abstract void init();

  public abstract void destroy();

  public abstract String getName();

  public abstract void setName(String paramString);

  public abstract String getExtensionFileName();

  public abstract void setExtensionFileName(String paramString);

  public abstract String getPropertiesFileName();

  public abstract void setPropertiesFileName(String paramString)
    throws IOException;

  public abstract Properties getConfigProperties();

  public abstract boolean isActive();

  public abstract void setActive(boolean paramBoolean);

  public abstract void addEventListener(SFSEventType paramSFSEventType, ISFSEventListener paramISFSEventListener);

  public abstract void removeEventListener(SFSEventType paramSFSEventType, ISFSEventListener paramISFSEventListener);

  public abstract void setLevel(ExtensionLevel paramExtensionLevel);

  public abstract ExtensionLevel getLevel();

  public abstract ExtensionType getType();

  public abstract void setType(ExtensionType paramExtensionType);

  public abstract Zone getParentZone();

  public abstract void setParentZone(Zone paramZone);

  public abstract Room getParentRoom();

  public abstract void setParentRoom(Room paramRoom);

  public abstract ExtensionReloadMode getReloadMode();

  public abstract void setReloadMode(ExtensionReloadMode paramExtensionReloadMode);

  public abstract void handleClientRequest(String paramString, User paramUser, ISFSObject paramISFSObject)
    throws SFSException;

  public abstract Object handleInternalMessage(String paramString, Object paramObject);

  public abstract void send(String paramString, ISFSObject paramISFSObject, User paramUser, boolean paramBoolean);

  public abstract void send(String paramString, ISFSObject paramISFSObject, User paramUser);

  public abstract void send(String paramString, ISFSObject paramISFSObject, List<User> paramList, boolean paramBoolean);

  public abstract void send(String paramString, ISFSObject paramISFSObject, List<User> paramList);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.extensions.ISFSExtension
 * JD-Core Version:    0.6.0
 */