/*     */ package com.smartfoxserver.v2.util;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.Room;
/*     */ import java.util.Arrays;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class DefaultPlayerIdGenerator
/*     */   implements IPlayerIdGenerator
/*     */ {
/*     */   private Room parentRoom;
/*     */   private volatile Boolean[] playerSlots;
/*     */   private final Logger logger;
/*     */ 
/*     */   public DefaultPlayerIdGenerator()
/*     */   {
/*  19 */     this.logger = LoggerFactory.getLogger(getClass());
/*     */   }
/*     */ 
/*     */   public void init()
/*     */   {
/*  26 */     this.playerSlots = new Boolean[this.parentRoom.getMaxUsers() + 1];
/*     */ 
/*  29 */     Arrays.fill(this.playerSlots, Boolean.FALSE);
/*     */   }
/*     */ 
/*     */   public int getPlayerSlot()
/*     */   {
/*  35 */     int playerId = 0;
/*     */ 
/*  37 */     synchronized (this.playerSlots)
/*     */     {
/*  39 */       for (int ii = 1; ii < this.playerSlots.length; ii++)
/*     */       {
/*  43 */         if (this.playerSlots[ii].booleanValue())
/*     */           continue;
/*  45 */         playerId = ii;
/*  46 */         this.playerSlots[ii] = Boolean.TRUE;
/*  47 */         break;
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/*  52 */     if (playerId < 1) {
/*  53 */       this.logger.warn("No player slot found in " + this.parentRoom);
/*     */     }
/*     */ 
/*  57 */     return playerId;
/*     */   }
/*     */ 
/*     */   public void freePlayerSlot(int playerId)
/*     */   {
/*  63 */     if (playerId == -1) {
/*  64 */       return;
/*     */     }
/*     */ 
/*  67 */     if (playerId >= this.playerSlots.length) {
/*  68 */       return;
/*     */     }
/*  70 */     synchronized (this.playerSlots)
/*     */     {
/*  72 */       this.playerSlots[playerId] = Boolean.FALSE;
/*     */     }
/*     */   }
/*     */ 
/*     */   public void onRoomResize()
/*     */   {
/*  80 */     Boolean[] newPlayerSlots = new Boolean[this.parentRoom.getMaxUsers() + 1];
/*     */ 
/*  83 */     synchronized (this.playerSlots)
/*     */     {
/*  85 */       for (int i = 1; i < newPlayerSlots.length; i++)
/*     */       {
/*  87 */         if (i < this.playerSlots.length)
/*  88 */           newPlayerSlots[i] = this.playerSlots[i];
/*     */         else {
/*  90 */           newPlayerSlots[i] = Boolean.FALSE;
/*     */         }
/*     */       }
/*     */     }
/*     */ 
/*  95 */     this.playerSlots = newPlayerSlots;
/*     */   }
/*     */ 
/*     */   public Room getParentRoom()
/*     */   {
/* 101 */     return this.parentRoom;
/*     */   }
/*     */ 
/*     */   public void setParentRoom(Room room)
/*     */   {
/* 107 */     this.parentRoom = room;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.DefaultPlayerIdGenerator
 * JD-Core Version:    0.6.0
 */