/*     */ package com.smartfoxserver.v2.api.response;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.io.IResponse;
/*     */ import com.smartfoxserver.bitswarm.io.Response;
/*     */ import com.smartfoxserver.v2.api.ISFSBuddyResponseApi;
/*     */ import com.smartfoxserver.v2.buddylist.Buddy;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyList;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyListManager;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyOnlineState;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyProperties;
/*     */ import com.smartfoxserver.v2.buddylist.BuddyVariable;
/*     */ import com.smartfoxserver.v2.config.DefaultConstants;
/*     */ import com.smartfoxserver.v2.controllers.SystemRequest;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.Zone;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.SFSObject;
/*     */ import java.util.List;
/*     */ 
/*     */ public class SFSBuddyResponseApi
/*     */   implements ISFSBuddyResponseApi
/*     */ {
/*     */   public void notifyBuddyListInited(BuddyList buddyList)
/*     */   {
/*  32 */     User owner = buddyList.getOwner();
/*     */ 
/*  35 */     ISFSObject resObj = new SFSObject();
/*     */ 
/*  38 */     resObj.putSFSArray("bl", buddyList.toSFSArray());
/*     */ 
/*  41 */     List buddyStates = buddyList.getBuddyListManager().getBuddyStates();
/*  42 */     if ((buddyStates != null) && (buddyStates.size() > 0)) {
/*  43 */       resObj.putUtfStringArray("bs", buddyStates);
/*     */     }
/*     */ 
/*  46 */     ISFSArray myBuddyVariables = new SFSArray();
/*  47 */     resObj.putSFSArray("mv", myBuddyVariables);
/*     */ 
/*  49 */     List vars = buddyList.getOwner().getBuddyProperties().getVariables();
/*     */ 
/*  51 */     if (vars != null)
/*     */     {
/*  53 */       for (BuddyVariable bVar : vars)
/*     */       {
/*  55 */         myBuddyVariables.addSFSArray(bVar.toSFSArray());
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/*  60 */     IResponse response = new Response();
/*  61 */     response.setId(SystemRequest.InitBuddyList.getId());
/*  62 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/*  63 */     response.setContent(resObj);
/*  64 */     response.setRecipients(owner.getSession());
/*     */ 
/*  67 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyAddBuddy(Buddy buddy, User recipient)
/*     */   {
/*  74 */     ISFSObject resObj = new SFSObject();
/*     */ 
/*  77 */     resObj.putSFSArray("bn", buddy.toSFSArray());
/*     */ 
/*  80 */     IResponse response = new Response();
/*  81 */     response.setId(SystemRequest.AddBuddy.getId());
/*  82 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/*  83 */     response.setContent(resObj);
/*  84 */     response.setRecipients(recipient.getSession());
/*     */ 
/*  87 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyRemoveBuddy(String buddyName, User recipient)
/*     */   {
/*  94 */     ISFSObject resObj = new SFSObject();
/*     */ 
/*  97 */     resObj.putUtfString("bn", buddyName);
/*     */ 
/* 100 */     IResponse response = new Response();
/* 101 */     response.setId(SystemRequest.RemoveBuddy.getId());
/* 102 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 103 */     response.setContent(resObj);
/* 104 */     response.setRecipients(recipient.getSession());
/*     */ 
/* 107 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyBuddyBlockStatus(String buddyName, boolean blocked, User recipient)
/*     */   {
/* 114 */     ISFSObject resObj = new SFSObject();
/*     */ 
/* 117 */     resObj.putUtfString("bn", buddyName);
/* 118 */     resObj.putBool("bs", blocked);
/*     */ 
/* 121 */     IResponse response = new Response();
/* 122 */     response.setId(SystemRequest.BlockBuddy.getId());
/* 123 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 124 */     response.setContent(resObj);
/* 125 */     response.setRecipients(recipient.getSession());
/*     */ 
/* 128 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyBuddyOnlineStateChange(User user, BuddyOnlineState state)
/*     */   {
/* 134 */     notifyBuddyOnlineStateChange(user, state, false);
/*     */   }
/*     */ 
/*     */   public void notifyBuddyOnlineStateChange(User user, BuddyOnlineState state, boolean excludeUser)
/*     */   {
/* 140 */     String buddyName = user.getName();
/*     */ 
/* 143 */     List recipients = user.getZone().getBuddyListManager().getClientsWatchingBuddy(buddyName);
/*     */ 
/* 146 */     if (!excludeUser) {
/* 147 */       recipients.add(user.getSession());
/*     */     }
/*     */ 
/* 150 */     if (recipients.size() == 0) {
/* 151 */       return;
/*     */     }
/*     */ 
/* 154 */     ISFSObject resObj = new SFSObject();
/*     */ 
/* 157 */     resObj.putUtfString("bn", buddyName);
/* 158 */     resObj.putByte("o", (byte)state.ordinal());
/* 159 */     resObj.putInt("bi", state == BuddyOnlineState.ONLINE ? user.getId() : -1);
/*     */ 
/* 162 */     IResponse response = new Response();
/* 163 */     response.setId(SystemRequest.GoOnline.getId());
/* 164 */     response.setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 165 */     response.setContent(resObj);
/* 166 */     response.setRecipients(recipients);
/*     */ 
/* 169 */     response.write();
/*     */   }
/*     */ 
/*     */   public void notifyBuddyVariablesUpdate(User user, List<BuddyVariable> vars)
/*     */   {
/* 176 */     String buddyName = user.getName();
/*     */ 
/* 179 */     List recipients = user.getZone().getBuddyListManager().getClientsWatchingBuddy(buddyName);
/*     */ 
/* 182 */     recipients.add(user.getSession());
/*     */ 
/* 185 */     ISFSArray buddyVarsData = new SFSArray();
/*     */ 
/* 187 */     for (BuddyVariable var : vars)
/*     */     {
/* 189 */       buddyVarsData.addSFSArray(var.toSFSArray());
/*     */     }
/*     */ 
/* 193 */     ISFSObject resObj = new SFSObject();
/*     */ 
/* 196 */     resObj.putUtfString("bn", buddyName);
/* 197 */     resObj.putSFSArray("bv", buddyVarsData);
/*     */ 
/* 200 */     Object response = new Response();
/* 201 */     ((IResponse)response).setId(SystemRequest.SetBuddyVariables.getId());
/* 202 */     ((IResponse)response).setTargetController(DefaultConstants.CORE_SYSTEM_CONTROLLER_ID);
/* 203 */     ((IResponse)response).setContent(resObj);
/* 204 */     ((IResponse)response).setRecipients(recipients);
/*     */ 
/* 207 */     ((IResponse)response).write();
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.api.response.SFSBuddyResponseApi
 * JD-Core Version:    0.6.0
 */