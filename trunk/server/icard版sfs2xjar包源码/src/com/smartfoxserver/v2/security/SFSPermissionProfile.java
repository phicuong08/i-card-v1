/*    */ package com.smartfoxserver.v2.security;
/*    */ 
/*    */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*    */ import java.util.HashSet;
/*    */ import java.util.List;
/*    */ import java.util.Set;
/*    */ 
/*    */ public class SFSPermissionProfile
/*    */ {
/*    */   private short id;
/*    */   private String name;
/*    */   private Set<SystemRequest> deniedRequest;
/*    */   private Set<SystemPermission> permissionFlags;
/*    */ 
/*    */   public SFSPermissionProfile(short id, String name, List<SystemRequest> deniedRequests)
/*    */   {
/* 18 */     this(id, name, deniedRequests, null);
/*    */   }
/*    */ 
/*    */   public SFSPermissionProfile(short id, String name, List<SystemRequest> deniedRequests, List<SystemPermission> flags)
/*    */   {
/* 23 */     this.id = id;
/* 24 */     this.name = name;
/* 25 */     this.deniedRequest = new HashSet();
/* 26 */     this.permissionFlags = new HashSet();
/*    */ 
/* 28 */     if (deniedRequests != null) {
/* 29 */       this.deniedRequest.addAll(deniedRequests);
/*    */     }
/* 31 */     if (flags != null)
/* 32 */       this.permissionFlags.addAll(flags);
/*    */   }
/*    */ 
/*    */   public boolean isRequestAllowed(SystemRequest request)
/*    */   {
/* 37 */     return !this.deniedRequest.contains(request);
/*    */   }
/*    */ 
/*    */   public boolean isFlagSet(SystemPermission permission)
/*    */   {
/* 42 */     return this.permissionFlags.contains(permission);
/*    */   }
/*    */ 
/*    */   public short getId()
/*    */   {
/* 47 */     return this.id;
/*    */   }
/*    */ 
/*    */   public String getName()
/*    */   {
/* 52 */     return this.name;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.security.SFSPermissionProfile
 * JD-Core Version:    0.6.0
 */