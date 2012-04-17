/*     */ package com.smartfoxserver.v2.security;
/*     */ 
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import java.io.PrintStream;
/*     */ import java.util.Map;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSPrivilegeManager
/*     */   implements PrivilegeManager
/*     */ {
/*     */   private final Map<Short, SFSPermissionProfile> privilegeProfiles;
/*     */   private final Logger log;
/*     */   private volatile boolean active;
/*     */ 
/*     */   public SFSPrivilegeManager()
/*     */   {
/*  21 */     this.log = LoggerFactory.getLogger(getClass());
/*  22 */     this.privilegeProfiles = new ConcurrentHashMap();
/*     */   }
/*     */ 
/*     */   public boolean isActive()
/*     */   {
/*  29 */     return this.active;
/*     */   }
/*     */ 
/*     */   public void setActive(boolean active)
/*     */   {
/*  36 */     this.active = active;
/*     */   }
/*     */ 
/*     */   public boolean containsPermissionProfile(short profileId)
/*     */   {
/*  43 */     return this.privilegeProfiles.containsKey(Short.valueOf(profileId));
/*     */   }
/*     */ 
/*     */   public boolean containsPermissionProfile(String profileName)
/*     */   {
/*  49 */     boolean found = false;
/*  50 */     Short id = findIdFromName(profileName);
/*     */ 
/*  52 */     if (id != null) {
/*  53 */       found = containsPermissionProfile(id.shortValue());
/*     */     }
/*  55 */     return found;
/*     */   }
/*     */ 
/*     */   public SFSPermissionProfile getPermissionProfile(short profileId)
/*     */   {
/*  61 */     return (SFSPermissionProfile)this.privilegeProfiles.get(Short.valueOf(profileId));
/*     */   }
/*     */ 
/*     */   public SFSPermissionProfile getPermissionProfile(String profileName)
/*     */   {
/*  67 */     Short id = findIdFromName(profileName);
/*     */ 
/*  69 */     if (id == null) {
/*  70 */       return null;
/*     */     }
/*  72 */     return (SFSPermissionProfile)this.privilegeProfiles.get(id);
/*     */   }
/*     */ 
/*     */   public void removePermissionProfile(short permId)
/*     */   {
/*  78 */     this.privilegeProfiles.remove(Short.valueOf(permId));
/*     */   }
/*     */ 
/*     */   public void removePermissionProfile(String profileName)
/*     */   {
/*  84 */     Short id = findIdFromName(profileName);
/*     */ 
/*  86 */     if (id != null)
/*  87 */       this.privilegeProfiles.remove(id);
/*     */   }
/*     */ 
/*     */   public void setPermissionProfile(SFSPermissionProfile profile)
/*     */   {
/*  93 */     if (this.privilegeProfiles.containsKey(Short.valueOf(profile.getId())))
/*     */     {
/*  95 */       this.log.warn("Profile with duplicate ID: " + profile.getId() + ", name: " + profile.getName() + " was not added to the manager");
/*  96 */       return;
/*     */     }
/*     */ 
/*  99 */     this.privilegeProfiles.put(Short.valueOf(profile.getId()), profile);
/*     */   }
/*     */ 
/*     */   public boolean isRequestAllowed(User user, SystemRequest request)
/*     */   {
/* 107 */     if (!isActive()) {
/* 108 */       return true;
/*     */     }
/* 110 */     boolean success = false;
/*     */ 
/* 112 */     SFSPermissionProfile profile = (SFSPermissionProfile)this.privilegeProfiles.get(Short.valueOf(user.getPrivilegeId()));
/*     */ 
/* 114 */     if (profile != null) {
/* 115 */       success = profile.isRequestAllowed(request);
/*     */     }
/* 117 */     return success;
/*     */   }
/*     */ 
/*     */   public boolean isFlagSet(User user, SystemPermission permission)
/*     */   {
/* 122 */     boolean success = false;
/*     */ 
/* 124 */     SFSPermissionProfile profile = (SFSPermissionProfile)this.privilegeProfiles.get(Short.valueOf(user.getPrivilegeId()));
/*     */ 
/* 126 */     if (profile != null) {
/* 127 */       success = profile.isFlagSet(permission);
/*     */     }
/* 129 */     return success;
/*     */   }
/*     */ 
/*     */   private Short findIdFromName(String name)
/*     */   {
/* 135 */     Short profileId = null;
/*     */ 
/* 137 */     for (SFSPermissionProfile profile : this.privilegeProfiles.values())
/*     */     {
/* 139 */       if (!profile.getName().equals(name))
/*     */         continue;
/* 141 */       profileId = Short.valueOf(profile.getId());
/* 142 */       break;
/*     */     }
/*     */ 
/* 146 */     return profileId;
/*     */   }
/*     */ 
/*     */   public void dump()
/*     */   {
/* 154 */     for (Short id : this.privilegeProfiles.keySet())
/*     */     {
/* 156 */       System.out.println(id + ":");
/* 157 */       SFSPermissionProfile profile = (SFSPermissionProfile)this.privilegeProfiles.get(id);
/*     */ 
/* 159 */       System.out.println("\tAllowed Sys Req:");
/*     */ 
/* 161 */       for (SystemRequest sysReq : SystemRequest.values())
/*     */       {
/* 163 */         if (profile.isRequestAllowed(sysReq)) {
/* 164 */           System.out.println("\t\t" + sysReq);
/*     */         }
/*     */       }
/* 167 */       System.out.println("\tPermission Flags:");
/*     */ 
/* 169 */       for (SystemPermission perm : SystemPermission.values())
/*     */       {
/* 171 */         if (profile.isFlagSet(perm))
/* 172 */           System.out.println("\t\t" + perm);
/*     */       }
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.security.SFSPrivilegeManager
 * JD-Core Version:    0.6.0
 */