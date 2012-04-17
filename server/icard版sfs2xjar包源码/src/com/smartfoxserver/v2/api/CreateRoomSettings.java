/*     */ package com.smartfoxserver.v2.api;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.SFSRoomRemoveMode;
/*     */ import com.smartfoxserver.v2.entities.SFSRoomSettings;
/*     */ import com.smartfoxserver.v2.entities.variables.RoomVariable;
/*     */ import com.smartfoxserver.v2.util.IPlayerIdGenerator;
/*     */ import java.util.List;
/*     */ import java.util.Set;
/*     */ 
/*     */ public class CreateRoomSettings
/*     */ {
/* 124 */   private String name = null;
/* 125 */   private String groupId = "default";
/* 126 */   private String password = null;
/* 127 */   private int maxUsers = 20;
/* 128 */   private int maxSpectators = 0;
/* 129 */   private int maxVariablesAllowed = 5;
/*     */ 
/* 131 */   private boolean isDynamic = false;
/* 132 */   private boolean isGame = false;
/* 133 */   private boolean isHidden = false;
/* 134 */   private SFSRoomRemoveMode autoRemoveMode = SFSRoomRemoveMode.DEFAULT;
/*     */   private Set<SFSRoomSettings> roomSettings;
/*     */   private boolean useWordsFilter;
/*     */   private List<RoomVariable> roomVariables;
/*     */   private RoomExtensionSettings extension;
/*     */   private Class<? extends IPlayerIdGenerator> customPlayerIdGeneratorClass;
/*     */ 
/*     */   public String getName()
/*     */   {
/* 150 */     return this.name;
/*     */   }
/*     */ 
/*     */   public void setName(String name)
/*     */   {
/* 161 */     this.name = name;
/*     */   }
/*     */ 
/*     */   public String getGroupId()
/*     */   {
/* 170 */     return this.groupId;
/*     */   }
/*     */ 
/*     */   public void setGroupId(String groupId)
/*     */   {
/* 180 */     this.groupId = groupId;
/*     */   }
/*     */ 
/*     */   public String getPassword()
/*     */   {
/* 189 */     return this.password;
/*     */   }
/*     */ 
/*     */   public void setPassword(String password)
/*     */   {
/* 198 */     this.password = password;
/*     */   }
/*     */ 
/*     */   public int getMaxUsers()
/*     */   {
/* 207 */     return this.maxUsers;
/*     */   }
/*     */ 
/*     */   public void setMaxUsers(int maxUsers)
/*     */   {
/* 216 */     this.maxUsers = maxUsers;
/*     */   }
/*     */ 
/*     */   public int getMaxSpectators()
/*     */   {
/* 224 */     return this.maxSpectators;
/*     */   }
/*     */ 
/*     */   public void setMaxSpectators(int maxSpectators)
/*     */   {
/* 233 */     this.maxSpectators = maxSpectators;
/*     */   }
/*     */ 
/*     */   public boolean isDynamic()
/*     */   {
/* 242 */     return this.isDynamic;
/*     */   }
/*     */ 
/*     */   public void setDynamic(boolean isDynamic)
/*     */   {
/* 252 */     this.isDynamic = isDynamic;
/*     */   }
/*     */ 
/*     */   public boolean isGame()
/*     */   {
/* 261 */     return this.isGame;
/*     */   }
/*     */ 
/*     */   public void setGame(boolean isGame)
/*     */   {
/* 270 */     this.isGame = isGame;
/*     */   }
/*     */ 
/*     */   public boolean isHidden()
/*     */   {
/* 280 */     return this.isHidden;
/*     */   }
/*     */ 
/*     */   public void setHidden(boolean isHidden)
/*     */   {
/* 291 */     this.isHidden = isHidden;
/*     */   }
/*     */ 
/*     */   public SFSRoomRemoveMode getAutoRemoveMode()
/*     */   {
/* 301 */     return this.autoRemoveMode;
/*     */   }
/*     */ 
/*     */   public void setAutoRemoveMode(SFSRoomRemoveMode autoRemoveMode)
/*     */   {
/* 311 */     this.autoRemoveMode = autoRemoveMode;
/*     */   }
/*     */ 
/*     */   public Set<SFSRoomSettings> getRoomSettings()
/*     */   {
/* 323 */     return this.roomSettings;
/*     */   }
/*     */ 
/*     */   public void setRoomSettings(Set<SFSRoomSettings> roomSettings)
/*     */   {
/* 337 */     this.roomSettings = roomSettings;
/*     */   }
/*     */ 
/*     */   public boolean isUseWordsFilter()
/*     */   {
/* 347 */     return this.useWordsFilter;
/*     */   }
/*     */ 
/*     */   public void setUseWordsFilter(boolean useWordsFilter)
/*     */   {
/* 356 */     this.useWordsFilter = useWordsFilter;
/*     */   }
/*     */ 
/*     */   public List<RoomVariable> getRoomVariables()
/*     */   {
/* 366 */     return this.roomVariables;
/*     */   }
/*     */ 
/*     */   public void setRoomVariables(List<RoomVariable> roomVariables)
/*     */   {
/* 376 */     this.roomVariables = roomVariables;
/*     */   }
/*     */ 
/*     */   public RoomExtensionSettings getExtension()
/*     */   {
/* 388 */     return this.extension;
/*     */   }
/*     */ 
/*     */   public void setExtension(RoomExtensionSettings extension)
/*     */   {
/* 400 */     this.extension = extension;
/*     */   }
/*     */ 
/*     */   public int getMaxVariablesAllowed()
/*     */   {
/* 409 */     return this.maxVariablesAllowed;
/*     */   }
/*     */ 
/*     */   public void setMaxVariablesAllowed(int maxVariablesAllowed)
/*     */   {
/* 418 */     this.maxVariablesAllowed = maxVariablesAllowed;
/*     */   }
/*     */ 
/*     */   public Class<? extends IPlayerIdGenerator> getCustomPlayerIdGeneratorClass()
/*     */   {
/* 428 */     return this.customPlayerIdGeneratorClass;
/*     */   }
/*     */ 
/*     */   public void setCustomPlayerIdGeneratorClass(Class<? extends IPlayerIdGenerator> customPlayerIdGeneratorClass)
/*     */   {
/* 440 */     this.customPlayerIdGeneratorClass = customPlayerIdGeneratorClass;
/*     */   }
/*     */ 
/*     */   public static final class RoomExtensionSettings
/*     */   {
/*     */     private String id;
/*     */     private String className;
/*     */     private String propertiesFile;
/*     */ 
/*     */     public RoomExtensionSettings(String id, String className)
/*     */     {
/*  76 */       this.id = id;
/*  77 */       this.className = className;
/*     */     }
/*     */ 
/*     */     public String getId()
/*     */     {
/*  86 */       return this.id;
/*     */     }
/*     */ 
/*     */     public String getClassName()
/*     */     {
/*  95 */       return this.className;
/*     */     }
/*     */ 
/*     */     public void setPropertiesFile(String propertiesFile)
/*     */     {
/* 108 */       this.propertiesFile = propertiesFile;
/*     */     }
/*     */ 
/*     */     public String getPropertiesFile()
/*     */     {
/* 117 */       return this.propertiesFile;
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.CreateRoomSettings
 * JD-Core Version:    0.6.0
 */