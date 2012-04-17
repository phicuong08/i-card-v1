package com.smartfoxserver.v2.config;

import com.smartfoxserver.v2.exceptions.SFSException;
import java.io.IOException;
import java.util.List;

public abstract interface IConfigurator
{
  public abstract void loadConfiguration()
    throws Exception;

  public abstract List<ZoneSettings> loadZonesConfiguration()
    throws SFSException;

  public abstract void saveServerSettings(boolean paramBoolean)
    throws IOException;

  public abstract void saveZoneSettings(ZoneSettings paramZoneSettings, boolean paramBoolean)
    throws IOException;

  public abstract void saveZoneSettings(ZoneSettings paramZoneSettings, boolean paramBoolean, String paramString)
    throws IOException;

  public abstract CoreSettings getCoreSettings();

  public abstract ServerSettings getServerSettings();

  public abstract List<ZoneSettings> getZoneSettings();

  public abstract ZoneSettings getZoneSetting(String paramString);

  public abstract ZoneSettings getZoneSetting(int paramInt);

  public abstract void saveNewZoneSettings(ZoneSettings paramZoneSettings)
    throws IOException;

  public abstract void removeZoneSetting(String paramString)
    throws IOException;
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.config.IConfigurator
 * JD-Core Version:    0.6.0
 */