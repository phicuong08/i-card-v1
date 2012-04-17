/*    */ package com.smartfoxserver.v2.exceptions;
/*    */ 
/*    */ import java.util.ArrayList;
/*    */ import java.util.List;
/*    */ 
/*    */ public class SFSErrorData
/*    */ {
/*    */   IErrorCode code;
/*    */   List<String> params;
/*    */ 
/*    */   public SFSErrorData(IErrorCode code)
/*    */   {
/* 13 */     this.code = code;
/* 14 */     this.params = new ArrayList();
/*    */   }
/*    */ 
/*    */   public IErrorCode getCode()
/*    */   {
/* 19 */     return this.code;
/*    */   }
/*    */ 
/*    */   public void setCode(IErrorCode code)
/*    */   {
/* 24 */     this.code = code;
/*    */   }
/*    */ 
/*    */   public List<String> getParams()
/*    */   {
/* 29 */     return this.params;
/*    */   }
/*    */ 
/*    */   public void setParams(List<String> params)
/*    */   {
/* 34 */     this.params = params;
/*    */   }
/*    */ 
/*    */   public void addParameter(String parameter)
/*    */   {
/* 39 */     this.params.add(parameter);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.exceptions.SFSErrorData
 * JD-Core Version:    0.6.0
 */