/*     */ package com.smartfoxserver.v2.entities.invitation;
/*     */ 
/*     */ import com.smartfoxserver.v2.SmartFoxServer;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.managers.IUserManager;
/*     */ import java.util.concurrent.atomic.AtomicInteger;
/*     */ 
/*     */ public class SFSInvitation
/*     */   implements Invitation
/*     */ {
/*  31 */   private static final AtomicInteger idGenerator = new AtomicInteger(0);
/*     */   private final int id;
/*     */   private final User inviter;
/*     */   private final User invitee;
/*     */   private final long expiryTime;
/*     */   private final int secondsForAnswer;
/*     */   private ISFSObject params;
/*     */   private InvitationCallback callback;
/*     */ 
/*     */   public static Invitation fromSFSArray(ISFSArray sfsa)
/*     */   {
/*  44 */     Invitation invitation = new SFSInvitation(
/*  46 */       SmartFoxServer.getInstance().getUserManager().getUserById(sfsa.getInt(0).intValue()), 
/*  47 */       SmartFoxServer.getInstance().getUserManager().getUserById(sfsa.getInt(1).intValue()), 
/*  48 */       sfsa.getShort(2).shortValue(), 
/*  49 */       sfsa.size() == 4 ? sfsa.getSFSObject(3) : null);
/*     */ 
/*  52 */     return invitation;
/*     */   }
/*     */ 
/*     */   public SFSInvitation(User inviter, User invitee, int secondsForAnswer)
/*     */   {
/*  57 */     this(inviter, invitee, secondsForAnswer, null);
/*     */   }
/*     */ 
/*     */   public SFSInvitation(User inviter, User invitee, int secondsForAnswer, ISFSObject params)
/*     */   {
/*  62 */     this.id = nextUniqueId();
/*  63 */     this.inviter = inviter;
/*  64 */     this.invitee = invitee;
/*  65 */     this.params = params;
/*  66 */     this.secondsForAnswer = secondsForAnswer;
/*     */ 
/*  68 */     this.expiryTime = (System.currentTimeMillis() + 1000 * secondsForAnswer);
/*     */   }
/*     */ 
/*     */   public int getId()
/*     */   {
/*  76 */     return this.id;
/*     */   }
/*     */ 
/*     */   public ISFSObject getParams()
/*     */   {
/*  82 */     return this.params;
/*     */   }
/*     */ 
/*     */   public void setParams(ISFSObject params)
/*     */   {
/*  88 */     this.params = params;
/*     */   }
/*     */ 
/*     */   public User getInviter()
/*     */   {
/*  94 */     return this.inviter;
/*     */   }
/*     */ 
/*     */   public User getInvitee()
/*     */   {
/* 100 */     return this.invitee;
/*     */   }
/*     */ 
/*     */   public int getExpiryTime()
/*     */   {
/* 106 */     return (int)this.expiryTime / 1000;
/*     */   }
/*     */ 
/*     */   public boolean isExpired()
/*     */   {
/* 112 */     return System.currentTimeMillis() > this.expiryTime;
/*     */   }
/*     */ 
/*     */   public int getSecondsForAnswer()
/*     */   {
/* 118 */     return this.secondsForAnswer;
/*     */   }
/*     */ 
/*     */   public InvitationCallback getCallback()
/*     */   {
/* 124 */     return this.callback;
/*     */   }
/*     */ 
/*     */   public void setCallback(InvitationCallback callback)
/*     */   {
/* 130 */     this.callback = callback;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 136 */     return String.format("{ Invitation: %s, From: %s To: %s }", new Object[] { Integer.valueOf(this.id), String.valueOf(this.inviter.getName()), String.valueOf(this.invitee.getName()) });
/*     */   }
/*     */ 
/*     */   private static int nextUniqueId()
/*     */   {
/* 146 */     return idGenerator.getAndIncrement();
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.invitation.SFSInvitation
 * JD-Core Version:    0.6.0
 */