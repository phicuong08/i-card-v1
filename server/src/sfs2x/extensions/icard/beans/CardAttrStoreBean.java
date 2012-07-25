package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

import com.icard.data.excel.ExcelReader;

public class CardAttrStoreBean {
	private final static int MAX_ATTR_NUM=5;
	private final static String CARD_FILE_PATH ="extensions/ICard/cardAttr.xls";

	
	private static CardAttrStoreBean mInstance =null;
	private HashMap<Integer, CardAttrBean> _attrInfoMap =new HashMap<Integer, CardAttrBean>();
	private CardAttrStoreBean(){
	}
	
	public static CardAttrStoreBean GetInstance(){
		if(mInstance ==null){
			mInstance = new CardAttrStoreBean();
			mInstance.init();
		}
		return mInstance;
	}
	private void  init(){
		HashMap<String,ArrayList<HashMap<String,String>>> excelCardData = ExcelReader.loadFile(CARD_FILE_PATH);
		loadCardExcel(excelCardData);
	}
	private void loadCardExcel(HashMap<String,ArrayList<HashMap<String,String>>> excelCardData){
		for(String sheetName : excelCardData.keySet() ){
			
			ArrayList<HashMap<String,String>> sheetData = excelCardData.get(sheetName);
			for(HashMap<String,String> rowData :sheetData){
				
				int Id = Integer.parseInt(rowData.get("ID")); // ÅÆµÄid
				CardAttrBean attrBean = new CardAttrBean(id);
				for(int i=0;i<MAX_ATTR_NUM;i++){
					String fieldName = "BUF" + i;
					String attrVal = (rowData.get(fieldName)==null||rowData.get(fieldName).isEmpty())?"":rowData.get(fieldName); // 
					attrBean.AddAttr(attrVal);
				}
				_abilityInfoMap.put(id, attrBean);
			}
		}
	}
	public CardAttrBean getCardAttr(int cardID){
		return _abilityInfoMap.get(cardID);
	}

	private int ParseLoopInfo(String loop){
		if(loop.equals("LOOP_ONE"))
			return CardAttrBean.LOOP_ONE;
		else if(loop.equals("LOOP_ALL"))
			return CardAttrBean.LOOP_ALL;
		else if(loop.equals("LOOP_MY"))
			return CardAttrBean.LOOP_MY;
		return 	CardAttrBean.LOOP_ONE;
	}

	

}
