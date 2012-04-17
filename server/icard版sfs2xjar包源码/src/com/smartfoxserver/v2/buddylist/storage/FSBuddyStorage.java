/*     */ package com.smartfoxserver.v2.buddylist.storage;
/*     */ 
/*     */ import com.smartfoxserver.v2.buddylist.Buddy;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyList;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyListManager;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyProperties;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyVariable;
/*     */ import com.smartfoxserver.v2.buddylist.SFSBuddy;
/*     */ import com.smartfoxserver.v2.buddylist.SFSBuddyList;
/*     */ import com.smartfoxserver.v2.buddylist.SFSBuddyVariable;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import com.smartfoxserver.v2.exceptions.SFSBuddyListException;
/*     */ import com.smartfoxserver.v2.exceptions.SFSBuddyListNotFoundException;
/*     */ import com.smartfoxserver.v2.util.CryptoUtils;
/*     */ import java.io.File;
/*     */ import java.io.IOException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ import org.apache.commons.io.FileUtils;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class FSBuddyStorage
/*     */   implements BuddyStorage
/*     */ {
/*     */   private static final String BL_ROOT_FOLDER = "buddylists/";
/*     */   private static final String KEY_LIST_OWNER = "lo";
/*     */   private static final String KEY_MY_VARIABLES = "mv";
/*     */   private static final String KEY_BUDDY_LIST = "bl";
/*     */   private static final String KEY_BUDDY_NAME = "bn";
/*     */   private static final String KEY_BUDDY_BLOCK = "bb";
/*     */   private final Logger log;
/*     */   private BuddyListManager buddyListManager;
/*     */   private String blistFolderName;
/*  49 */   private boolean inited = false;
/*     */ 
/*     */   public FSBuddyStorage()
/*     */   {
/*  53 */     this.log = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ 
/*     */   public void init()
/*     */   {
/*     */     try
/*     */     {
/*  61 */       checkFolderStructure();
/*  62 */       this.inited = true;
/*     */     }
/*     */     catch (IOException ioErr)
/*     */     {
/*  66 */       this.log.warn("Was not able to initialize BuddyStorage: " + ioErr);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void destroy()
/*     */   {
/*     */   }
/*     */ 
/*     */   public BuddyList loadList(String ownerName)
/*     */     throws SFSBuddyListNotFoundException, IOException
/*     */   {
/*  82 */     checkInited();
/*     */ 
/*  85 */     String targetFileName = this.blistFolderName + "/" + CryptoUtils.getHexFileName(ownerName);
/*  86 */     File targetFile = new File(targetFileName);
/*     */ 
/*  88 */     if (!targetFile.isFile()) {
/*  89 */       throw new SFSBuddyListNotFoundException("BuddyList not found for: " + ownerName);
/*     */     }
/*     */ 
/*  92 */     ISFSObject serializedBuddyList = SFSObject.newFromBinaryData(FileUtils.readFileToByteArray(targetFile));
/*     */ 
/*  95 */     BuddyList buddyList = new SFSBuddyList(serializedBuddyList.getUtfString("lo"), this.buddyListManager);
/*     */ 
/*  98 */     ISFSArray buddyArray = serializedBuddyList.getSFSArray("bl");
/*     */ 
/* 100 */     for (int i = 0; i < buddyArray.size(); i++)
/*     */     {
/* 102 */       ISFSObject buddyItem = buddyArray.getSFSObject(i);
/* 103 */       Buddy buddy = new SFSBuddy(buddyItem.getUtfString("bn"));
/* 104 */       buddy.setParentBuddyList(buddyList);
/*     */ 
/* 106 */       buddy.setBlocked(buddyItem.getBool("bb").booleanValue());
/*     */       try
/*     */       {
/* 118 */         buddyList.addBuddy(buddy);
/*     */       }
/*     */       catch (SFSBuddyListException localSFSBuddyListException)
/*     */       {
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 128 */     return buddyList;
/*     */   }
/*     */ 
/*     */   public void saveList(BuddyList buddyList)
/*     */     throws IOException
/*     */   {
/* 152 */     checkInited();
/*     */ 
/* 154 */     ISFSObject serializedBuddyList = SFSObject.newInstance();
/* 155 */     ISFSArray buddyArray = SFSArray.newInstance();
/* 156 */     ISFSArray buddyVarsArray = SFSArray.newInstance();
/*     */     ISFSObject buddyObj;
/* 159 */     for (Buddy buddy : buddyList.getBuddies())
/*     */     {
/* 162 */       if (buddy.isTemp()) {
/*     */         continue;
/*     */       }
/* 165 */       buddyObj = SFSObject.newInstance();
/* 166 */       buddyObj.putUtfString("bn", buddy.getName());
/* 167 */       buddyObj.putBool("bb", buddy.isBlocked());
/*     */ 
/* 169 */       buddyArray.addSFSObject(buddyObj);
/*     */     }
/*     */ 
/* 173 */     if (this.buddyListManager.allowOfflineBuddyVariables())
/*     */     {
/* 175 */       List myBuddyVars = buddyList.getOwner().getBuddyProperties().getVariables();
/*     */ 
/* 177 */       if (myBuddyVars != null)
/*     */       {
/* 179 */         for (BuddyVariable bv : myBuddyVars)
/*     */         {
/* 181 */           if (bv.isOffline()) {
/* 182 */             buddyVarsArray.addSFSArray(bv.toSFSArray());
/*     */           }
/*     */         }
/*     */       }
/*     */     }
/* 187 */     serializedBuddyList.putUtfString("lo", buddyList.getOwnerName());
/* 188 */     serializedBuddyList.putSFSArray("bl", buddyArray);
/* 189 */     serializedBuddyList.putSFSArray("mv", buddyVarsArray);
/*     */ 
/* 192 */     String fileName = CryptoUtils.getHexFileName(buddyList.getOwnerName());
/* 193 */     byte[] data = serializedBuddyList.toBinary();
/*     */ 
/* 197 */     FileUtils.writeByteArrayToFile(
/* 199 */       new File(this.blistFolderName + "/" + fileName), 
/* 200 */       data);
/*     */ 
/* 203 */     if (this.log.isDebugEnabled())
/* 204 */       this.log.debug("BuddyList saved: " + buddyList.getOwnerName() + ", " + data.length + " bytes written.");
/*     */   }
/*     */ 
/*     */   public List<BuddyVariable> getOfflineVariables(String buddyName)
/*     */     throws IOException
/*     */   {
/* 210 */     checkInited();
/*     */ 
/* 212 */     List offlineBuddyVars = null;
/*     */ 
/* 215 */     if (this.buddyListManager.allowOfflineBuddyVariables())
/*     */     {
/* 218 */       String targetFileName = this.blistFolderName + "/" + CryptoUtils.getHexFileName(buddyName);
/* 219 */       File targetFile = new File(targetFileName);
/*     */ 
/* 221 */       if (targetFile.isFile())
/*     */       {
/* 224 */         ISFSObject serializedBuddyList = SFSObject.newFromBinaryData(FileUtils.readFileToByteArray(targetFile));
/* 225 */         offlineBuddyVars = rebuildBuddyVariables(serializedBuddyList);
/*     */       }
/*     */     }
/*     */ 
/* 229 */     return offlineBuddyVars;
/*     */   }
/*     */ 
/*     */   public BuddyListManager getBuddyListManager()
/*     */   {
/* 235 */     return this.buddyListManager;
/*     */   }
/*     */ 
/*     */   public void setBuddyListManager(BuddyListManager buddyListManager)
/*     */   {
/* 241 */     if (this.buddyListManager != null) {
/* 242 */       throw new IllegalStateException("Can't re-assign buddyListManager.");
/*     */     }
/* 244 */     this.buddyListManager = buddyListManager;
/*     */   }
/*     */ 
/*     */   private void checkFolderStructure()
/*     */     throws IOException
/*     */   {
/* 252 */     this.blistFolderName = ("data/buddylists/" + this.buddyListManager.getZone().getName());
/* 253 */     File targetFolder = new File(this.blistFolderName);
/*     */ 
/* 256 */     if (!targetFolder.isDirectory())
/* 257 */       FileUtils.forceMkdir(targetFolder);
/*     */   }
/*     */ 
/*     */   private void checkInited()
/*     */   {
/* 262 */     if (!this.inited)
/* 263 */       throw new IllegalStateException("BuddyStorage class cannot operate correctly because initialization failed: " + this.buddyListManager.getZone());
/*     */   }
/*     */ 
/*     */   private List<BuddyVariable> rebuildBuddyVariables(ISFSObject serializedBuddyList)
/*     */   {
/* 268 */     List buddyVariables = new ArrayList();
/*     */ 
/* 270 */     ISFSArray varItems = serializedBuddyList.getSFSArray("mv");
/*     */ 
/* 273 */     for (int i = 0; i < varItems.size(); i++)
/*     */     {
/* 275 */       buddyVariables.add(SFSBuddyVariable.newFromSFSArray(varItems.getSFSArray(i)));
/*     */     }
/*     */ 
/* 278 */     return buddyVariables;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.buddylist.storage.FSBuddyStorage
 * JD-Core Version:    0.6.0
 */