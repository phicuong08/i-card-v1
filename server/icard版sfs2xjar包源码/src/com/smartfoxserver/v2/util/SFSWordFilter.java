/*     */ package com.smartfoxserver.v2.util;
/*     */ 
/*     */ import com.smartfoxserver.v2.config.GlobalSettings;
/*     */ import com.smartfoxserver.v2.core.BaseCoreService;
/*     */ import com.smartfoxserver.v2.entities.User;
/*     */ import com.smartfoxserver.v2.entities.managers.BanMode;
/*     */ import com.smartfoxserver.v2.entities.managers.IBannedUserManager;
/*     */ import com.smartfoxserver.v2.exceptions.ExceptionMessageComposer;
/*     */ import com.smartfoxserver.v2.util.filters.FilteredMessage;
/*     */ import com.smartfoxserver.v2.util.filters.IWordFilterLogic;
/*     */ import com.smartfoxserver.v2.util.filters.SFSWordFilterLogic;
/*     */ import com.smartfoxserver.v2.util.filters.WordsFilterMode;
/*     */ import java.io.File;
/*     */ import java.io.IOException;
/*     */ import java.util.HashSet;
/*     */ import java.util.List;
/*     */ import java.util.Set;
/*     */ import java.util.concurrent.ConcurrentHashMap;
/*     */ import java.util.concurrent.ConcurrentMap;
/*     */ import java.util.regex.Matcher;
/*     */ import java.util.regex.Pattern;
/*     */ import org.apache.commons.io.FileUtils;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class SFSWordFilter extends BaseCoreService
/*     */   implements IWordFilter
/*     */ {
/*     */   private static final String PUNCTUATION = ",.;:-_ ";
/*     */   private final Logger logger;
/*     */   private final ConcurrentMap<String, Pattern> dictionary;
/*  42 */   private volatile int banDurationMinutes = 60;
/*  43 */   private volatile int kicksBeforeBan = 3;
/*  44 */   private volatile int kicksBeforeBanMinutes = 60;
/*     */ 
/*  46 */   private volatile int warningsBeforeKick = 3;
/*  47 */   private volatile int maxBadWordsPerMessage = -1;
/*  48 */   private volatile int secondsBeforeBanOrKick = 6;
/*  49 */   private volatile boolean useWarnings = false;
/*     */ 
/*  51 */   private BanMode banMode = BanMode.BY_NAME;
/*     */   private String wordsFile;
/*  53 */   private String warningMessage = "Please be polite and avoid swear words. If this continues you will be kicked and ultimately banned.";
/*  54 */   private String kickMessage = "You are being kicked, too many swear words.";
/*  55 */   private String banMessage = "You are being banned, too many swear words.";
/*  56 */   private String maskCharacter = "*";
/*  57 */   private WordsFilterMode filterMode = WordsFilterMode.BLACK_LIST;
/*     */   IBannedUserManager bannedUserManger;
/*     */   IWordFilterLogic filterLogic;
/*     */ 
/*     */   public SFSWordFilter(IBannedUserManager manager)
/*     */   {
/*  64 */     setName("SFSWordsFilter");
/*  65 */     this.logger = LoggerFactory.getLogger(getClass());
/*  66 */     this.dictionary = new ConcurrentHashMap();
/*  67 */     this.bannedUserManger = manager;
/*     */ 
/*  69 */     this.filterLogic = new SFSWordFilterLogic(this.bannedUserManger, this);
/*     */   }
/*     */ 
/*     */   public SFSWordFilter(IBannedUserManager manager, String wordsFile)
/*     */   {
/*  74 */     this(manager);
/*  75 */     this.wordsFile = wordsFile;
/*     */   }
/*     */ 
/*     */   public void init(Object o)
/*     */   {
/*  81 */     super.init(o);
/*     */     try
/*     */     {
/*  90 */       if (this.wordsFile != null)
/*  91 */         processWordsFile();
/*     */     }
/*     */     catch (IOException e)
/*     */     {
/*  95 */       ExceptionMessageComposer message = new ExceptionMessageComposer(e, GlobalSettings.FRIENDLY_LOGGING);
/*  96 */       message.setDescription("the specified words file was not found: " + this.wordsFile);
/*  97 */       message.setPossibleCauses("please double check that the file is really in the location specified in the configuration");
/*     */ 
/*  99 */       this.logger.warn(message.toString());
/*     */     }
/*     */   }
/*     */ 
/*     */   public void setActive(boolean flag)
/*     */   {
/* 106 */     this.active = flag;
/*     */   }
/*     */ 
/*     */   public void destroy(Object o)
/*     */   {
/* 113 */     super.destroy(o);
/*     */   }
/*     */ 
/*     */   public FilteredMessage apply(String message)
/*     */   {
/*     */     FilteredMessage filtered;

/* 126 */     if (this.filterMode == WordsFilterMode.BLACK_LIST) {
/* 127 */       filtered = applyBlackListFilter(message);
/*     */     }
/*     */     else {
/* 130 */       filtered = applyWhiteListFilter(message);
/*     */     }
/* 132 */     return filtered;
/*     */   }
/*     */ 
/*     */   public FilteredMessage apply(String message, User user)
/*     */   {
/* 143 */     FilteredMessage filtered = apply(message);
/*     */ 
/* 146 */     if (this.filterMode == WordsFilterMode.BLACK_LIST)
/*     */     {
/* 148 */       if (filtered.getOccurrences() > 0)
/*     */       {
/* 151 */         if ((this.maxBadWordsPerMessage > 0) && (filtered.getOccurrences() > this.maxBadWordsPerMessage)) {
/* 152 */           this.filterLogic.kickUser(user);
/*     */         }
/*     */         else
/*     */         {
/* 157 */           this.filterLogic.warnUser(user);
/*     */         }
/*     */       }
/*     */     }
/* 161 */     return filtered;
/*     */   }
/*     */ 
/*     */   public void addExpression(String word)
/*     */   {
/* 171 */     this.dictionary.putIfAbsent(word, Pattern.compile(word));
/*     */   }
/*     */ 
/*     */   public void clearExpressions()
/*     */   {
/* 181 */     this.dictionary.clear();
/*     */   }
/*     */ 
/*     */   public int getBanDurationMinutes()
/*     */   {
/* 187 */     return this.banDurationMinutes;
/*     */   }
/*     */ 
/*     */   public BanMode getBanMode()
/*     */   {
/* 193 */     return this.banMode;
/*     */   }
/*     */ 
/*     */   public WordsFilterMode getFilterMode()
/*     */   {
/* 199 */     return this.filterMode;
/*     */   }
/*     */ 
/*     */   public int getWarningsBeforeKick()
/*     */   {
/* 205 */     return this.warningsBeforeKick;
/*     */   }
/*     */ 
/*     */   public String getWordsFile()
/*     */   {
/* 211 */     return this.wordsFile;
/*     */   }
/*     */ 
/*     */   public void setWordsFile(String wordsFile)
/*     */   {
/* 217 */     this.wordsFile = wordsFile;
/*     */   }
/*     */ 
/*     */   public Set<String> getExpressionsList()
/*     */   {
/* 223 */     return new HashSet(this.dictionary.keySet());
/*     */   }
/*     */ 
/*     */   public int getKicksBeforeBan()
/*     */   {
/* 229 */     return this.kicksBeforeBan;
/*     */   }
/*     */ 
/*     */   public void removeExpression(String word)
/*     */   {
/* 235 */     this.dictionary.remove(word);
/*     */   }
/*     */ 
/*     */   public void setBanDurationMinutes(int minutes)
/*     */   {
/* 241 */     this.banDurationMinutes = minutes;
/*     */   }
/*     */ 
/*     */   public void setBanMode(BanMode banMode)
/*     */   {
/* 247 */     this.banMode = banMode;
/*     */   }
/*     */ 
/*     */   public void setFilterMode(WordsFilterMode filterMode)
/*     */   {
/* 253 */     this.filterMode = filterMode;
/*     */   }
/*     */ 
/*     */   public void setKicksBeforeBan(int kicks)
/*     */   {
/* 259 */     this.kicksBeforeBan = kicks;
/*     */   }
/*     */ 
/*     */   public void setWarningsBeforeKick(int warnings)
/*     */   {
/* 265 */     this.warningsBeforeKick = warnings;
/*     */   }
/*     */ 
/*     */   public IBannedUserManager getBannedUserManager()
/*     */   {
/* 271 */     return this.bannedUserManger;
/*     */   }
/*     */ 
/*     */   public void setBannedUserManager(IBannedUserManager manager)
/*     */   {
/* 277 */     this.bannedUserManger = manager;
/*     */   }
/*     */ 
/*     */   public String getMaskCharacter()
/*     */   {
/* 283 */     return this.maskCharacter;
/*     */   }
/*     */ 
/*     */   public void setMaskCharacter(String mask)
/*     */   {
/* 289 */     this.maskCharacter = mask;
/*     */   }
/*     */ 
/*     */   public int getMaxBadWordsPerMessage()
/*     */   {
/* 295 */     return this.maxBadWordsPerMessage;
/*     */   }
/*     */ 
/*     */   public void setMaxBadWordsPerMessage(int max)
/*     */   {
/* 301 */     this.maxBadWordsPerMessage = max;
/*     */   }
/*     */ 
/*     */   public int getKicksBeforeBanMinutes()
/*     */   {
/* 306 */     return this.kicksBeforeBanMinutes;
/*     */   }
/*     */ 
/*     */   public void setKicksBeforeBanMinutes(int kicksBeforeBanMinutes)
/*     */   {
/* 311 */     this.kicksBeforeBanMinutes = kicksBeforeBanMinutes;
/*     */   }
/*     */ 
/*     */   public String getKickMessage()
/*     */   {
/* 316 */     return this.kickMessage;
/*     */   }
/*     */ 
/*     */   public void setKickMessage(String kickMessage)
/*     */   {
/* 321 */     this.kickMessage = kickMessage;
/*     */   }
/*     */ 
/*     */   public String getBanMessage()
/*     */   {
/* 326 */     return this.banMessage;
/*     */   }
/*     */ 
/*     */   public void setBanMessage(String banMessage)
/*     */   {
/* 331 */     this.banMessage = banMessage;
/*     */   }
/*     */ 
/*     */   public IBannedUserManager getBannedUserManger()
/*     */   {
/* 336 */     return this.bannedUserManger;
/*     */   }
/*     */ 
/*     */   public void setBannedUserManger(IBannedUserManager bannedUserManger)
/*     */   {
/* 341 */     this.bannedUserManger = bannedUserManger;
/*     */   }
/*     */ 
/*     */   public int getSecondsBeforeBanOrKick()
/*     */   {
/* 346 */     return this.secondsBeforeBanOrKick;
/*     */   }
/*     */ 
/*     */   public void setSecondsBeforeBanOrKick(int secondsBeforeBanOrKick)
/*     */   {
/* 351 */     this.secondsBeforeBanOrKick = secondsBeforeBanOrKick;
/*     */   }
/*     */ 
/*     */   public String getWarningMessage()
/*     */   {
/* 357 */     return this.warningMessage;
/*     */   }
/*     */ 
/*     */   public void setWarningMessage(String message)
/*     */   {
/* 363 */     this.warningMessage = message;
/*     */   }
/*     */ 
/*     */   public boolean isUseWarnings()
/*     */   {
/* 370 */     return this.useWarnings;
/*     */   }
/*     */ 
/*     */   public void setUseWarnings(boolean value)
/*     */   {
/* 376 */     this.useWarnings = value;
/*     */   }
/*     */ 
/*     */   private void processWordsFile()
/*     */     throws IOException
/*     */   {
/* 385 */     File theWordFile = new File(this.wordsFile);
/* 386 */     List<String> textLines = FileUtils.readLines(theWordFile);
/*     */ 
/* 388 */     for (String expression : textLines)
/*     */     {
/* 390 */       addExpression(expression);
/*     */     }
/*     */   }
/*     */ 
/*     */   private FilteredMessage applyBlackListFilter(String message)
/*     */   {
/* 396 */     FilteredMessage filteredMessage = new FilteredMessage();
/*     */ 
/* 398 */     StringBuilder buffer = new StringBuilder(message);
/* 399 */     int occurrences = 0;
/*     */ 
/* 401 */     for (Pattern expression : this.dictionary.values())
/*     */     {
/* 403 */       Matcher patternMatcher = expression.matcher(buffer);
/*     */ 
/* 405 */       while (patternMatcher.find())
/*     */       {
/* 407 */         maskBadWord(buffer, patternMatcher.start(), patternMatcher.end());
/* 408 */         occurrences++;
/*     */       }
/*     */     }
/*     */ 
/* 412 */     filteredMessage.setMessage(buffer.toString());
/* 413 */     filteredMessage.setOccurrences(occurrences);
/*     */ 
/* 415 */     return filteredMessage;
/*     */   }
/*     */ 
/*     */   private void maskBadWord(StringBuilder str, int startPos, int endPos)
/*     */   {
/* 420 */     str.replace(startPos, endPos, getStringMask(endPos - startPos));
/*     */   }
/*     */ 
/*     */   private FilteredMessage applyWhiteListFilter(String message)
/*     */   {
/* 425 */     FilteredMessage filteredMessage = new FilteredMessage();
/* 426 */     FilteredMessage blackListed = applyBlackListFilter(message);
/*     */ 
/* 429 */     StringBuilder negativeVersion = new StringBuilder();
/*     */ 
/* 431 */     boolean prevCharWasBad = false;
/* 432 */     int occurences = 0;
/* 433 */     int pos = 0;
/*     */ 
/* 435 */     for (char ch : blackListed.getMessage().toCharArray())
/*     */     {
/* 438 */       if (ch == this.maskCharacter.charAt(0))
/*     */       {
/* 441 */         negativeVersion.append(message.charAt(pos));
/* 442 */         prevCharWasBad = false;
/*     */       }
/* 446 */       else if (",.;:-_ ".indexOf(ch) > -1)
/*     */       {
/* 448 */         negativeVersion.append(ch);
/* 449 */         prevCharWasBad = false;
/*     */       }
/*     */       else
/*     */       {
/* 455 */         negativeVersion.append(this.maskCharacter);
/*     */ 
/* 458 */         if (!prevCharWasBad)
/*     */         {
/* 460 */           occurences++;
/* 461 */           prevCharWasBad = true;
/*     */         }
/*     */       }
/*     */ 
/* 465 */       pos++;
/*     */     }
/*     */ 
/* 468 */     filteredMessage.setMessage(negativeVersion.toString());
/* 469 */     filteredMessage.setOccurrences(occurences);
/*     */ 
/* 471 */     return filteredMessage;
/*     */   }
/*     */ 
/*     */   private String getStringMask(int len)
/*     */   {
/* 476 */     StringBuilder buf = new StringBuilder();
/*     */ 
/* 478 */     for (int j = 0; j < len; j++) {
/* 479 */       buf.append(this.maskCharacter);
/*     */     }
/* 481 */     return buf.toString();
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.util.SFSWordFilter
 * JD-Core Version:    0.6.0
 */