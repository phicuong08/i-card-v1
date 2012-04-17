/*     */ package com.smartfoxserver.v2.exceptions;
/*     */ 
/*     */ import com.smartfoxserver.bitswarm.util.Logging;
/*     */ import java.util.ArrayList;
/*     */ import java.util.List;
/*     */ 
/*     */ public class ExceptionMessageComposer
/*     */ {
/*  10 */   private static final String NEW_LINE = System.getProperty("line.separator");
/*  11 */   public static volatile boolean globalPrintStackTrace = true;
/*  12 */   public static volatile boolean useExtendedMessages = true;
/*     */   private String mainErrorMessage;
/*     */   private String exceptionType;
/*     */   private String description;
/*     */   private String possibleCauses;
/*     */   private String stackTrace;
/*     */   private List<String> additionalInfos;
/*     */   private StringBuilder buf;
/*     */ 
/*     */   public ExceptionMessageComposer(Throwable t)
/*     */   {
/*  25 */     this(t, globalPrintStackTrace);
/*     */   }
/*     */ 
/*     */   public ExceptionMessageComposer(Throwable t, boolean printStackTrace)
/*     */   {
/*  30 */     this.mainErrorMessage = t.getMessage();
/*     */ 
/*  32 */     if (this.mainErrorMessage == null) {
/*  33 */       this.mainErrorMessage = "*** Null ***";
/*     */     }
/*  35 */     this.exceptionType = t.getClass().getName();
/*     */ 
/*  37 */     this.buf = new StringBuilder();
/*     */ 
/*  39 */     if (printStackTrace)
/*  40 */       setStackTrace(t);
/*     */   }
/*     */ 
/*     */   public void setDescription(String description)
/*     */   {
/*  45 */     this.description = description;
/*     */   }
/*     */ 
/*     */   public void setPossibleCauses(String possibleCauses)
/*     */   {
/*  50 */     this.possibleCauses = possibleCauses;
/*     */   }
/*     */ 
/*     */   private void setStackTrace(Throwable t)
/*     */   {
/*  55 */     this.stackTrace = Logging.formatStackTrace(t.getStackTrace());
/*     */   }
/*     */ 
/*     */   public void addInfo(String infoMessage)
/*     */   {
/*  60 */     if (this.additionalInfos == null) {
/*  61 */       this.additionalInfos = new ArrayList();
/*     */     }
/*  63 */     this.additionalInfos.add(infoMessage);
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/*  69 */     if (!useExtendedMessages)
/*     */     {
/*  71 */       this.buf.append(this.exceptionType).append(" ").append(this.mainErrorMessage);
/*  72 */       return this.buf.toString();
/*     */     }
/*     */ 
/*  75 */     this.buf.append(NEW_LINE);
/*  76 */     this.buf.append("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::").append(NEW_LINE);
/*  77 */     this.buf.append("Exception: ").append(this.exceptionType).append(NEW_LINE);
/*  78 */     this.buf.append("Message: ").append(this.mainErrorMessage).append(NEW_LINE);
/*     */ 
/*  80 */     if (this.description != null) {
/*  81 */       this.buf.append("Description: ").append(this.description).append(NEW_LINE);
/*     */     }
/*  83 */     if (this.possibleCauses != null) {
/*  84 */       this.buf.append("Possible Causes: ").append(this.possibleCauses).append(NEW_LINE);
/*     */     }
/*  86 */     if (this.additionalInfos != null)
/*     */     {
/*  88 */       for (String info : this.additionalInfos)
/*     */       {
/*  90 */         this.buf.append(info).append(NEW_LINE);
/*     */       }
/*     */     }
/*     */ 
/*  94 */     if (this.stackTrace != null)
/*     */     {
/*  96 */       this.buf.append("+--- --- ---+").append(NEW_LINE);
/*  97 */       this.buf.append("Stack Trace:").append(NEW_LINE);
/*  98 */       this.buf.append("+--- --- ---+").append(NEW_LINE);
/*     */ 
/* 100 */       this.buf.append(this.stackTrace);
/* 101 */       this.buf.append("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::").append(NEW_LINE);
/*     */     }
/*     */     else {
/* 104 */       this.buf.append("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::").append(NEW_LINE);
/*     */     }
/* 106 */     return this.buf.toString();
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.ExceptionMessageComposer
 * JD-Core Version:    0.6.0
 */