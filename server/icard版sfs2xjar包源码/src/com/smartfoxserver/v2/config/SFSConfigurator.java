/*     */ package com.smartfoxserver.v2.config;
/*     */ 
/*     */ import com.smartfoxserver.v2.db.DBConfig;
/*     */ import com.smartfoxserver.v2.exceptions.SFSException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSRuntimeException;
/*     */ import com.thoughtworks.xstream.XStream;
/*     */ import com.thoughtworks.xstream.io.xml.DomDriver;
/*     */ import java.io.File;
/*     */ import java.io.FileInputStream;
/*     */ import java.io.FileNotFoundException;
/*     */ import java.io.FileOutputStream;
/*     */ import java.io.IOException;
/*     */ import java.io.OutputStream;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import org.apache.commons.io.FileUtils;
/*     */ import org.apache.commons.io.FilenameUtils;
/*     */ import org.joda.time.DateTime;
/*     */ import org.joda.time.format.DateTimeFormat;
/*     */ import org.joda.time.format.DateTimeFormatter;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public final class SFSConfigurator
/*     */   implements IConfigurator
/*     */ {
/*  28 */   private final String BACKUP_FOLDER = "_backups";
/*     */   private volatile CoreSettings coreSettings;
/*     */   private volatile ServerSettings serverSettings;
/*     */   private volatile List<ZoneSettings> zonesSettings;
/*     */   private final Logger log;
/*     */ 
/*     */   public SFSConfigurator()
/*     */   {
/*  38 */     this.log = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ 
/*     */   public void loadConfiguration()
/*     */     throws FileNotFoundException
/*     */   {
/*  44 */     this.coreSettings = loadCoreSettings();
/*  45 */     this.serverSettings = loadServerSettings();
/*     */   }
/*     */ 
/*     */   public CoreSettings getCoreSettings()
/*     */   {
/*  50 */     return this.coreSettings;
/*     */   }
/*     */ 
/*     */   public synchronized ServerSettings getServerSettings()
/*     */   {
/*  55 */     return this.serverSettings;
/*     */   }
/*     */ 
/*     */   public synchronized List<ZoneSettings> getZoneSettings()
/*     */   {
/*  60 */     return this.zonesSettings;
/*     */   }
/*     */ 
/*     */   public synchronized ZoneSettings getZoneSetting(String zoneName)
/*     */   {
/*  66 */     if (this.zonesSettings == null) {
/*  67 */       throw new IllegalStateException("No Zone configuration has been loaded yet!");
/*     */     }
/*  69 */     ZoneSettings settings = null;
/*     */ 
/*  71 */     for (ZoneSettings item : this.zonesSettings)
/*     */     {
/*  73 */       if (!item.name.equals(zoneName))
/*     */         continue;
/*  75 */       settings = item;
/*  76 */       break;
/*     */     }
/*     */ 
/*  80 */     return settings;
/*     */   }
/*     */ 
/*     */   public synchronized ZoneSettings getZoneSetting(int id)
/*     */   {
/*  86 */     if (this.zonesSettings == null) {
/*  87 */       throw new IllegalStateException("No Zone configuration has been loaded yet!");
/*     */     }
/*  89 */     ZoneSettings settings = null;
/*     */ 
/*  91 */     for (ZoneSettings item : this.zonesSettings)
/*     */     {
/*  93 */       if (item.getId() != id)
/*     */         continue;
/*  95 */       settings = item;
/*  96 */       break;
/*     */     }
/*     */ 
/* 100 */     return settings;
/*     */   }
/*     */ 
/*     */   public synchronized void removeZoneSetting(String name)
/*     */     throws IOException
/*     */   {
/* 106 */     ZoneSettings settings = getZoneSetting(name);
/*     */ 
/* 108 */     if (settings != null)
/*     */     {
/* 110 */       String path = FilenameUtils.concat("zones/", settings.name + ".zone.xml");
/*     */ 
/* 113 */       makeBackup(path);
/*     */ 
/* 116 */       FileUtils.forceDelete(new File(path));
/*     */ 
/* 119 */       this.zonesSettings.remove(settings);
/*     */     }
/*     */   }
/*     */ 
/*     */   public synchronized List<ZoneSettings> loadZonesConfiguration() throws SFSException
/*     */   {
/* 125 */     this.zonesSettings = new ArrayList();
/* 126 */     List zoneDefinitionFiles = getZoneDefinitionFiles("zones/");
/*     */ 
/* 128 */     for (File file : zoneDefinitionFiles)
/*     */     {
/*     */       try
/*     */       {
/* 133 */         FileInputStream inStream = new FileInputStream(file);
/*     */ 
/* 136 */         this.log.info("Loading: " + file.toString());
/* 137 */         this.zonesSettings.add((ZoneSettings)getZonesXStreamDefinitions().fromXML(inStream));
/*     */       }
/*     */       catch (FileNotFoundException e)
/*     */       {
/* 143 */         throw new SFSRuntimeException("Could not locate Zone definition file: " + file.getAbsolutePath());
/*     */       }
/*     */     }
/*     */ 
/* 147 */     return this.zonesSettings;
/*     */   }
/*     */ 
/*     */   public synchronized void saveServerSettings(boolean makeBackup)
/*     */     throws IOException
/*     */   {
/* 153 */     if (makeBackup) {
/* 154 */       makeBackup("config/server.xml");
/*     */     }
/* 156 */     OutputStream outStream = new FileOutputStream("config/server.xml");
/* 157 */     getServerXStreamDefinitions().toXML(this.serverSettings, outStream);
/*     */   }
/*     */ 
/*     */   public synchronized void saveZoneSettings(ZoneSettings settings, boolean makeBackup)
/*     */     throws IOException
/*     */   {
/* 163 */     String filePath = FilenameUtils.concat("zones/", settings.name + ".zone.xml");
/*     */ 
/* 165 */     if (makeBackup) {
/* 166 */       makeBackup(filePath);
/*     */     }
/*     */ 
/* 169 */     OutputStream outStream = new FileOutputStream(filePath);
/* 170 */     getZonesXStreamDefinitions().toXML(settings, outStream);
/*     */   }
/*     */ 
/*     */   public synchronized void saveNewZoneSettings(ZoneSettings settings)
/*     */     throws IOException
/*     */   {
/* 180 */     if (getZoneSetting(settings.name) != null) {
/* 181 */       throw new IllegalArgumentException("Save request failed. The new Zone name is already in use: " + settings.name);
/*     */     }
/*     */ 
/* 184 */     saveZoneSettings(settings, false);
/*     */ 
/* 187 */     this.zonesSettings.add(settings);
/*     */   }
/*     */ 
/*     */   public synchronized void saveZoneSettings(ZoneSettings zoneSettings, boolean makeBackup, String oldZoneName)
/*     */     throws IOException
/*     */   {
/* 196 */     String newFilePath = FilenameUtils.concat("zones/", zoneSettings.name + ".zone.xml");
/* 197 */     String oldFilePath = FilenameUtils.concat("zones/", oldZoneName + ".zone.xml");
/*     */ 
/* 199 */     if (makeBackup) {
/* 200 */       makeBackup(oldFilePath);
/*     */     }
/* 202 */     OutputStream outStream = new FileOutputStream(newFilePath);
/* 203 */     getZonesXStreamDefinitions().toXML(zoneSettings, outStream);
/*     */ 
/* 206 */     FileUtils.forceDelete(new File(oldFilePath));
/*     */   }
/*     */ 
/*     */   private CoreSettings loadCoreSettings()
/*     */     throws FileNotFoundException
/*     */   {
/* 215 */     FileInputStream inStream = new FileInputStream("config/core.xml");
/*     */ 
/* 217 */     XStream xstream = new XStream();
/* 218 */     xstream.alias("coreSettings", CoreSettings.class);
/*     */ 
/* 220 */     return (CoreSettings)xstream.fromXML(inStream);
/*     */   }
/*     */ 
/*     */   private ServerSettings loadServerSettings()
/*     */     throws FileNotFoundException
/*     */   {
/* 226 */     FileInputStream inStream = new FileInputStream("config/server.xml");
/*     */ 
/* 229 */     return (ServerSettings)getServerXStreamDefinitions().fromXML(inStream);
/*     */   }
/*     */ 
/*     */   private XStream getServerXStreamDefinitions()
/*     */   {
/* 234 */     XStream xstream = new XStream();
/* 235 */     xstream.alias("serverSettings", ServerSettings.class);
/*     */ 
/* 237 */     xstream.alias("socket", ServerSettings.SocketAddress.class);
/* 238 */     xstream.useAttributeFor(ServerSettings.SocketAddress.class, "address");
/* 239 */     xstream.useAttributeFor(ServerSettings.SocketAddress.class, "port");
/* 240 */     xstream.useAttributeFor(ServerSettings.SocketAddress.class, "type");
/*     */ 
/* 242 */     xstream.alias("ipFilter", ServerSettings.IpFilterSettings.class);
/* 243 */     xstream.alias("flashCrossdomainPolicy", ServerSettings.FlashCrossDomainPolicySettings.class);
/*     */ 
/* 245 */     xstream.alias("remoteAdmin", ServerSettings.RemoteAdminSettings.class);
/* 246 */     xstream.alias("adminUser", ServerSettings.AdminUser.class);
/* 247 */     xstream.alias("mailer", ServerSettings.MailerSettings.class);
/* 248 */     xstream.alias("webServer", ServerSettings.WebServerSettings.class);
/* 249 */     xstream.alias("bannedUserManager", ServerSettings.BannedUserManagerSettings.class);
/*     */ 
/* 251 */     return xstream;
/*     */   }
/*     */ 
/*     */   private XStream getZonesXStreamDefinitions()
/*     */   {
/* 256 */     XStream xstream = new XStream(new DomDriver());
/*     */ 
/* 258 */     xstream.alias("zone", ZoneSettings.class);
/* 259 */     xstream.aliasField("applyWordsFilterToUserName", ZoneSettings.class, "isFilterUserNames");
/* 260 */     xstream.aliasField("applyWordsFilterToRoomName", ZoneSettings.class, "isFilterRoomNames");
/* 261 */     xstream.aliasField("applyWordsFilterToPrivateMessages", ZoneSettings.class, "isFilterPrivateMessages");
/* 262 */     xstream.alias("wordsFilter", ZoneSettings.WordFilterSettings.class);
/* 263 */     xstream.useAttributeFor(ZoneSettings.WordFilterSettings.class, "isActive");
/* 264 */     xstream.aliasAttribute(ZoneSettings.WordFilterSettings.class, "isActive", "active");
/* 265 */     xstream.alias("floodFilter", ZoneSettings.FloodFilterSettings.class);
/* 266 */     xstream.useAttributeFor(ZoneSettings.FloodFilterSettings.class, "isActive");
/* 267 */     xstream.aliasAttribute(ZoneSettings.FloodFilterSettings.class, "isActive", "active");
/* 268 */     xstream.alias("requestFilter", ZoneSettings.RequestFilterSettings.class);
/*     */ 
/* 270 */     xstream.alias("roomEvents", ZoneSettings.RoomEventsSettings.class);
/*     */ 
/* 272 */     xstream.alias("registerEvent", ZoneSettings.RegisteredRoomEvents.class);
/* 273 */     xstream.useAttributeFor(ZoneSettings.RegisteredRoomEvents.class, "groupId");
/*     */ 
/* 276 */     xstream.alias("extension", ZoneSettings.ExtensionSettings.class);
/* 277 */     xstream.alias("room", ZoneSettings.RoomSettings.class);
/* 278 */     xstream.alias("permissions", ZoneSettings.RoomPermissions.class);
/*     */ 
/* 280 */     xstream.alias("badWordsFilter", ZoneSettings.BadWordsFilterSettings.class);
/* 281 */     xstream.useAttributeFor(ZoneSettings.BadWordsFilterSettings.class, "isActive");
/* 282 */     xstream.alias("variable", ZoneSettings.RoomVariableDefinition.class);
/*     */ 
/* 285 */     xstream.alias("privilegeManager", ZoneSettings.PrivilegeManagerSettings.class);
/* 286 */     xstream.useAttributeFor(ZoneSettings.PrivilegeManagerSettings.class, "active");
/* 287 */     xstream.alias("profile", ZoneSettings.PermissionProfile.class);
/* 288 */     xstream.useAttributeFor(ZoneSettings.PermissionProfile.class, "id");
/*     */ 
/* 291 */     xstream.alias("buddyList", ZoneSettings.BuddyListSettings.class);
/* 292 */     xstream.useAttributeFor(ZoneSettings.BuddyListSettings.class, "active");
/*     */ 
/* 295 */     xstream.alias("databaseManager", DBConfig.class);
/* 296 */     xstream.useAttributeFor(DBConfig.class, "active");
/*     */ 
/* 298 */     return xstream;
/*     */   }
/*     */ 
/*     */   private List<File> getZoneDefinitionFiles(String path) throws SFSException
/*     */   {
/* 303 */     List files = new ArrayList();
/*     */ 
/* 305 */     File currDir = new File(path);
/* 306 */     if (currDir.isDirectory())
/*     */     {
/* 308 */       for (File f : currDir.listFiles())
/*     */       {
/* 310 */         if (f.getName().endsWith(".zone.xml")) {
/* 311 */           files.add(f);
/*     */         }
/*     */       }
/*     */ 
/*     */     }
/*     */     else
/*     */     {
/* 318 */       throw new SFSException("Invalid zones definition folder: " + currDir);
/*     */     }
/*     */ 
/* 321 */     return files;
/*     */   }
/*     */ 
/*     */   private void makeBackup(String filePath)
/*     */     throws IOException
/*     */   {
/* 330 */     String basePath = FilenameUtils.getPath(filePath);
/*     */ 
/* 333 */     String backupBasePath = FilenameUtils.concat(basePath, "_backups");
/*     */ 
/* 335 */     DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd-HH-mm-ss");
/* 336 */     String backupId = new DateTime().toString(fmt);
/*     */ 
/* 338 */     String backupFileName = FilenameUtils.concat(
/* 340 */       backupBasePath, 
/* 341 */       backupId + "__" + FilenameUtils.getName(filePath));
/*     */ 
/* 344 */     File sourceFile = new File(filePath);
/* 345 */     File backupFile = new File(backupFileName);
/* 346 */     File backupDir = new File(backupBasePath);
/*     */ 
/* 355 */     if (!backupDir.isDirectory()) {
/* 356 */       FileUtils.forceMkdir(backupDir);
/*     */     }
/*     */ 
/* 359 */     FileUtils.copyFile(sourceFile, backupFile);
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.config.SFSConfigurator
 * JD-Core Version:    0.6.0
 */