/*     */ package com.smartfoxserver.v2.entities.match;
/*     */ 
/*     */ import com.smartfoxserver.v2.entities.data.ISFSArray;
/*     */ import com.smartfoxserver.v2.entities.data.ISFSObject;
/*     */ import com.smartfoxserver.v2.entities.data.SFSDataWrapper;
/*     */ import com.smartfoxserver.v2.entities.variables.UserVariable;
/*     */ import com.smartfoxserver.v2.entities.variables.Variable;
/*     */ import org.slf4j.Logger;
/*     */ import org.slf4j.LoggerFactory;
/*     */ 
/*     */ public class VariablesMatcher
/*     */   implements ExpressionMatcher
/*     */ {
/*     */   private static final String DOT_CHAR = ".";
/*  15 */   private final Logger log = LoggerFactory.getLogger(VariablesMatcher.class);
/*     */   private IProxyVariableResolver varProxy;
/*     */ 
/*     */   public IProxyVariableResolver getProxyVariableResolver()
/*     */   {
/*  21 */     return this.varProxy;
/*     */   }
/*     */ 
/*     */   public void setProxyVariableResolver(IProxyVariableResolver resolver)
/*     */   {
/*  27 */     this.varProxy = resolver;
/*     */   }
/*     */ 
/*     */   public boolean match(EntityWithVariables entity, MatchExpression expression)
/*     */   {
/*  38 */     if (expression == null) {
/*  39 */       return true;
/*     */     }
/*  41 */     boolean result = false;
/*  42 */     expression = expression.rewind();
/*     */ 
/*  45 */     result = checkCondition(entity, expression);
/*     */ 
/*  48 */     while (expression.hasNext())
/*     */     {
/*  50 */       expression = expression.next();
/*     */ 
/*  52 */       if (expression.getLogicOp() == LogicOperator.AND)
/*  53 */         result = (result) && (checkCondition(entity, expression));
/*     */       else {
/*  55 */         result = (result) || (checkCondition(entity, expression));
/*     */       }
/*     */     }
/*  58 */     return result;
/*     */   }
/*     */ 
/*     */   private boolean checkCondition(EntityWithVariables entity, MatchExpression expression)
/*     */   {
/*  63 */     boolean result = false;
/*  64 */     IMatcher condition = expression.getCondition();
/*  65 */     Object varValue = resolveVariable(entity, expression.getVarName());
/*     */ 
/*  68 */     if (varValue != null)
/*     */     {
/*  70 */       if ((condition instanceof BoolMatch)) {
/*  71 */         result = matchBoolean((Boolean)varValue, expression);
/*     */       }
/*  73 */       else if ((condition instanceof NumberMatch)) {
/*  74 */         result = matchNumber((Number)varValue, expression);
/*     */       }
/*  76 */       else if ((condition instanceof StringMatch)) {
/*  77 */         result = matchString((String)varValue, expression);
/*     */       }
/*     */       else {
/*  80 */         this.log.warn("Unkown match type: " + condition);
/*     */       }
/*     */     }
/*  83 */     return result;
/*     */   }
/*     */ 
/*     */   private boolean matchBoolean(Boolean boolValue, MatchExpression expression)
/*     */   {
/*  88 */     boolean result = false;
/*  89 */     IMatcher condition = expression.getCondition();
/*     */ 
/*  91 */     if (condition == BoolMatch.EQUALS) {
/*  92 */       result = boolValue.equals(expression.getValue());
/*     */     }
/*  94 */     else if (condition == BoolMatch.NOT_EQUALS) {
/*  95 */       result = !boolValue.equals(expression.getValue());
/*     */     }
/*  97 */     return result;
/*     */   }
/*     */ 
/*     */   private boolean matchNumber(Number numValue, MatchExpression expression)
/*     */   {
/* 102 */     boolean result = false;
/*     */ 
/* 104 */     IMatcher condition = expression.getCondition();
/* 105 */     double varValue = numValue.doubleValue();
/* 106 */     double matchValue = ((Number)expression.getValue()).doubleValue();
/*     */ 
/* 108 */     if (condition == NumberMatch.EQUALS) {
/* 109 */       result = varValue == matchValue;
/*     */     }
/* 111 */     else if (condition == NumberMatch.NOT_EQUALS) {
/* 112 */       result = varValue != matchValue;
/*     */     }
/* 114 */     else if (condition == NumberMatch.GREATER_THAN) {
/* 115 */       result = varValue > matchValue;
/*     */     }
/* 117 */     else if (condition == NumberMatch.LESS_THAN) {
/* 118 */       result = varValue < matchValue;
/*     */     }
/* 120 */     else if (condition == NumberMatch.GREATER_THAN_OR_EQUAL_TO) {
/* 121 */       result = varValue >= matchValue;
/*     */     }
/* 123 */     else if (condition == NumberMatch.LESS_THAN_OR_EQUAL_TO) {
/* 124 */       result = varValue <= matchValue;
/*     */     }
/* 126 */     return result;
/*     */   }
/*     */ 
/*     */   private boolean matchString(String strValue, MatchExpression expression)
/*     */   {
/* 131 */     boolean result = false;
/* 132 */     IMatcher condition = expression.getCondition();
/* 133 */     String matchValue = (String)expression.getValue();
/*     */ 
/* 135 */     if (condition == StringMatch.EQUALS) {
/* 136 */       result = strValue.equals(matchValue);
/*     */     }
/* 138 */     else if (condition == StringMatch.NOT_EQUALS) {
/* 139 */       result = !strValue.equals(matchValue);
/*     */     }
/* 141 */     else if (condition == StringMatch.CONTAINS) {
/* 142 */       result = strValue.indexOf(matchValue) > -1;
/*     */     }
/* 144 */     else if (condition == StringMatch.STARTS_WITH) {
/* 145 */       result = strValue.startsWith(matchValue);
/*     */     }
/* 147 */     else if (condition == StringMatch.ENDS_WITH) {
/* 148 */       result = strValue.endsWith(matchValue);
/*     */     }
/* 150 */     return result;
/*     */   }
/*     */ 
/*     */   private Object resolveVariable(EntityWithVariables entity, String varName)
/*     */   {
/* 163 */     if (varName.startsWith(".")) {
/* 164 */       throw new IllegalArgumentException("Illegal Variable name: " + varName + ", cannot start with a dot.");
/*     */     }
/* 166 */     if (varName.endsWith(".")) {
/* 167 */       throw new IllegalArgumentException("Illegal Variable name: " + varName + ", cannot end with a dot.");
/*     */     }
/* 169 */     if (varName.indexOf("..") != -1) {
/* 170 */       throw new IllegalArgumentException("Illegal Variable name: " + varName + ", two or more consecutive dots are not allowed.");
/*     */     }
/*     */ 
/* 173 */     Object subObject = null;
/*     */ 
/* 175 */     int dotPos = varName.indexOf(".");
/*     */ 
/* 178 */     if (dotPos == -1) {
/* 179 */       return resolveVariableValue(entity, varName);
/*     */     }
/*     */ 
/* 184 */     String[] varNameElements = varName.split("\\.");
/*     */ 
/* 186 */     UserVariable var = entity.getVariable(varNameElements[0]);
/* 187 */     if (var == null) {
/* 188 */       return null;
/*     */     }
/* 190 */     subObject = var.getValue();
/* 191 */     int pos = 1;
/*     */ 
/* 193 */     while (pos < varNameElements.length)
/*     */     {
/* 195 */       if (subObject == null) {
/* 196 */         return null;
/*     */       }
/* 198 */       if ((subObject instanceof ISFSObject))
/*     */       {
/* 200 */         SFSDataWrapper wrapper = ((ISFSObject)subObject).get(varNameElements[pos]);
/* 201 */         subObject = wrapper != null ? wrapper.getObject() : null;
/*     */       }
/* 204 */       else if ((subObject instanceof ISFSArray)) {
/* 205 */         subObject = ((ISFSArray)subObject).getElementAt(Integer.parseInt(varNameElements[pos]));
/*     */       }
/* 207 */       pos++;
/*     */     }
/*     */ 
/* 210 */     return subObject;
/*     */   }
/*     */ 
/*     */   private Object resolveVariableValue(EntityWithVariables entity, String varName)
/*     */   {
/* 215 */     Variable var = entity.getVariable(varName);
/* 216 */     Object value = null;
/*     */ 
/* 219 */     if (var != null) {
/* 220 */       value = var.getValue();
/*     */     }
/* 223 */     else if (this.varProxy != null) {
/* 224 */       value = this.varProxy.getValue(entity, varName);
/*     */     }
/* 226 */     return value;
/*     */   }
/*     */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.VariablesMatcher
 * JD-Core Version:    0.6.0
 */