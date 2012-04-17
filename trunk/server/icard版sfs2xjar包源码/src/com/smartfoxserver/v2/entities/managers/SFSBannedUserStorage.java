/*     */ package com.smartfoxserver.v2.entities.managers;
/*     */ 
/*     */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*     */ import java.io.File;
/*     */ import java.io.FileInputStream;
/*     */ import java.io.FileOutputStream;
/*     */ import java.io.IOException;
/*     */ import java.io.ObjectInputStream;
/*     */ import java.io.ObjectOutputStream;
/*     */ import org.apache.commons.io.FileUtils;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSBannedUserStorage
/*     */   implements IBannedUserStorage
/*     */ {
/*     */   private static final String DATA_FOLDER = "bannedusers/";
/*     */   private static final String DATA_FILE = "users.bin";
/*     */   private final Logger log;
/*  23 */   private volatile boolean isProperlyInited = false;
/*     */ 
/*     */   public SFSBannedUserStorage()
/*     */   {
/*  27 */     this.log = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ 
/*     */   public void init()
/*     */   {
/*     */     try
/*     */     {
/*  35 */       checkFolderStructure();
/*  36 */       this.isProperlyInited = true;
/*  37 */       this.log.info("BanUserStorage initialized");
/*     */     }
/*     */     catch (IOException err)
/*     */     {
/*  41 */       ExceptionMessageComposer emc = new ExceptionMessageComposer(err);
/*  42 */       emc.setDescription("Unable to initialize the Banned User Manage storage.");
/*     */ 
/*  44 */       File fullPath = new File("data/bannedusers/");
/*  45 */       String thePath = fullPath != null ? fullPath.getAbsolutePath() : "Unable to obtain path. Your installation might be corrupted.";
/*  46 */       emc.setPossibleCauses("Write permissions are probably not available in: " + thePath);
/*     */ 
/*  48 */       if (fullPath == null) {
/*  49 */         emc.addInfo("An additional problem was found: SFS2X is not able to determine the absolute path of the storage folder. Should be {your-sfs-folder}/data/bannedusers/");
/*     */       }
/*  51 */       this.log.warn(emc.toString());
/*     */     }
/*     */   }
/*     */ 
/*     */   public void destroy()
/*     */   {
/*     */   }
/*     */ 
/*     */   public BanUserData load() throws Exception
/*     */   {
/*  61 */     checkInited();
/*     */ 
/*  63 */     String dataFile = "data/bannedusers/users.bin";
/*  64 */     FileInputStream fileInStream = new FileInputStream(dataFile);
/*  65 */     ObjectInputStream objInStream = new ObjectInputStream(fileInStream);
/*     */ 
/*  67 */     BanUserData banUserData = (BanUserData)objInStream.readObject();
/*  68 */     objInStream.close();
/*     */ 
/*  70 */     return banUserData;
/*     */   }
/*     */ 
/*     */   public synchronized void save(BanUserData data)
/*     */     throws IOException
/*     */   {
/*  76 */     checkInited();
/*     */ 
/*  78 */     String dataFile = "data/bannedusers/users.bin";
/*  79 */     FileOutputStream fileOStream = new FileOutputStream(dataFile);
/*  80 */     ObjectOutputStream oStream = new ObjectOutputStream(fileOStream);
/*     */ 
/*  82 */     oStream.writeObject(data);
/*  83 */     oStream.flush();
/*  84 */     oStream.close();
/*     */   }
/*     */ 
/*     */   private void checkFolderStructure()
/*     */     throws IOException
/*     */   {
/*  91 */     String folderName = "data/bannedusers/";
/*  92 */     File targetFolder = new File(folderName);
/*     */ 
/*  95 */     if (!targetFolder.isDirectory())
/*  96 */       FileUtils.forceMkdir(targetFolder);
/*     */   }
/*     */ 
/*     */   private void checkInited()
/*     */   {
/* 101 */     if (!this.isProperlyInited)
/* 102 */       throw new IllegalStateException("Banned User storage class cannot operate correctly because initialization failed. Please check your startup logs. ");
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.SFSBannedUserStorage
 * JD-Core Version:    0.6.0
 */