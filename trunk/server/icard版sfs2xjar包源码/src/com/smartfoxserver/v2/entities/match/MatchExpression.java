/*     */ package com.smartfoxserver.v2.entities.match;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ 
/*     */ public class MatchExpression
/*     */ {
/*     */   private final String varName;
/*     */   private final IMatcher condition;
/*     */   private final Object value;
/*  73 */   private LogicOperator logicOp = null;
/*  74 */   private MatchExpression parent = null;
/*  75 */   private MatchExpression next = null;
/*     */ 
/*     */   public MatchExpression(String varName, IMatcher condition, Object value)
/*     */   {
/*  79 */     this.varName = varName;
/*  80 */     this.condition = condition;
/*  81 */     this.value = value;
/*     */   }
/*     */ 
/*     */   private MatchExpression(String varName, IMatcher condition, Object value, LogicOperator logicOp, MatchExpression parent)
/*     */   {
/*  86 */     this.varName = varName;
/*  87 */     this.condition = condition;
/*  88 */     this.value = value;
/*  89 */     this.logicOp = logicOp;
/*  90 */     this.parent = parent;
/*     */   }
/*     */ 
/*     */   public MatchExpression and(String varName, IMatcher condition, Object value)
/*     */   {
/* 106 */     this.next = new MatchExpression(varName, condition, value, LogicOperator.AND, this);
/* 107 */     return this.next;
/*     */   }
/*     */ 
/*     */   public MatchExpression or(String varName, IMatcher condition, Object value)
/*     */   {
/* 123 */     this.next = new MatchExpression(varName, condition, value, LogicOperator.OR, this);
/* 124 */     return this.next;
/*     */   }
/*     */ 
/*     */   String getVarName()
/*     */   {
/* 133 */     return this.varName;
/*     */   }
/*     */ 
/*     */   IMatcher getCondition()
/*     */   {
/* 146 */     return this.condition;
/*     */   }
/*     */ 
/*     */   Object getValue()
/*     */   {
/* 155 */     return this.value;
/*     */   }
/*     */ 
/*     */   LogicOperator getLogicOp()
/*     */   {
/* 166 */     return this.logicOp;
/*     */   }
/*     */ 
/*     */   public String toString()
/*     */   {
/* 172 */     MatchExpression expr = rewind();
/*     */ 
/* 174 */     StringBuilder sb = new StringBuilder(expr.asString());
/*     */ 
/* 176 */     while (expr.hasNext())
/*     */     {
/* 178 */       expr = expr.next();
/* 179 */       sb.append(expr.asString());
/*     */     }
/*     */ 
/* 182 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   private String asString()
/*     */   {
/* 187 */     StringBuilder sb = new StringBuilder();
/*     */ 
/* 189 */     if (this.logicOp != null) {
/* 190 */       sb.append(" ").append(this.logicOp).append(" ");
/*     */     }
/* 192 */     sb.append("(");
/* 193 */     sb.append(this.varName).append(" ").append(this.condition.getSymbol()).append(" ").append((this.value instanceof String) ? "'" + this.value + "'" : this.value);
/* 194 */     sb.append(")");
/*     */ 
/* 196 */     return sb.toString();
/*     */   }
/*     */ 
/*     */   public boolean hasNext()
/*     */   {
/* 207 */     return this.next != null;
/*     */   }
/*     */ 
/*     */   public MatchExpression next()
/*     */   {
/* 217 */     return this.next;
/*     */   }
/*     */ 
/*     */   public MatchExpression rewind()
/*     */   {
/* 227 */     MatchExpression currNode = this;
/* 228 */     int c = 0;
/*     */ 
/* 231 */     while (currNode.parent != null)
/*     */     {
/* 233 */       currNode = currNode.parent;
/* 234 */       c++;
/*     */     }
/*     */ 
/* 240 */     return currNode;
/*     */   }
/*     */ 
/*     */   public static MatchExpression fromSFSArray(ISFSArray sfsa)
/*     */   {
/* 245 */     MatchExpression expression = null;
/*     */ 
/* 248 */     for (int i = 0; i < sfsa.size(); i++)
/*     */     {
/* 253 */       ISFSArray expData = sfsa.getSFSArray(i);
/* 254 */       if (expData.size() != 5) {
/* 255 */         throw new IllegalArgumentException("Malformed expression data: " + sfsa.getDump());
/*     */       }
/*     */ 
/* 258 */       LogicOperator logicOp = null;
/* 259 */       if (!expData.isNull(0)) {
/* 260 */         logicOp = LogicOperator.valueOf(expData.getUtfString(0));
/*     */       }
/*     */ 
/* 263 */       String varName = expData.getUtfString(1);
/*     */ 
/* 266 */       int matcherType = expData.getByte(2).byteValue();
/*     */ 
/* 269 */       IMatcher matcher = null;
/*     */ 
/* 271 */       String matchSymbol = expData.getUtfString(3);
/*     */ 
/* 273 */       if (matcherType == 0)
/* 274 */         matcher = BoolMatch.fromSymbol(matchSymbol);
/* 275 */       else if (matcherType == 1)
/* 276 */         matcher = NumberMatch.fromSymbol(matchSymbol);
/*     */       else {
/* 278 */         matcher = StringMatch.fromSymbol(matchSymbol);
/*     */       }
/*     */ 
/* 281 */       Object value = expData.getElementAt(4);
/*     */ 
/* 284 */       if (logicOp == null)
/*     */       {
/* 286 */         expression = new MatchExpression(varName, matcher, value);
/*     */       }
/* 293 */       else if (logicOp == LogicOperator.AND) {
/* 294 */         expression = expression.and(varName, matcher, value);
/*     */       }
/* 297 */       else if (logicOp == LogicOperator.OR) {
/* 298 */         expression = expression.or(varName, matcher, value);
/*     */       }
/*     */     }
/*     */ 
/* 302 */     return expression;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.MatchExpression
 * JD-Core Version:    0.6.0
 */