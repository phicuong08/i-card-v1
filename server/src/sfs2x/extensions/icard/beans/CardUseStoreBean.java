package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.icard.data.excel.ExcelReader;

public class CardUseStoreBean {
	private final static String CARD_FILE_PATH ="extensions/ICard/useCard.xls";
	private static int MIN_CARD_ID	=2000;	//最小的卡片id
	
	private static CardUseStoreBean mInstance =null;
	private HashMap<Integer, CardUseBean> _useInfoMap =new HashMap<Integer, CardUseBean>();
	private CardUseStoreBean(){
	}
	
	public static CardUseStoreBean GetInstance(){
		if(mInstance ==null){
			mInstance = new CardUseStoreBean();
			mInstance.init();
		}
		return mInstance;
	}
	private void  init(){
		HashMap<String,ArrayList<HashMap<String,String>>> excelCardData = ExcelReader.loadFile(CARD_FILE_PATH);
		loadUseCardExcel(excelCardData);
	}
	private void loadUseCardExcel(HashMap<String,ArrayList<HashMap<String,String>>> excelCardData){
		for(String sheetName : excelCardData.keySet() ){
			
			ArrayList<HashMap<String,String>> sheetData = excelCardData.get(sheetName);
			for(HashMap<String,String> rowData :sheetData){
				int Id = Integer.parseInt(rowData.get("ID")); // 牌的id
			
				int cost = (rowData.get("cost")==null||rowData.get("cost").isEmpty())?0:Integer.parseInt(rowData.get("cost")); // 
				int targetNum = (rowData.get("targetNum")==null||rowData.get("targetNum").isEmpty())?0:Integer.parseInt(rowData.get("targetNum")); 
				int myHero = (rowData.get("myHero")==null||rowData.get("myHero").isEmpty())?0:Integer.parseInt(rowData.get("myHero")); // 
				int mySoldier = (rowData.get("mySoldier")==null||rowData.get("mySoldier").isEmpty())?0:Integer.parseInt(rowData.get("mySoldier"));//
				int yourHero = (rowData.get("yourHero")==null||rowData.get("yourHero").isEmpty())?0:Integer.parseInt(rowData.get("yourHero")); // 
				int yourSoldier = (rowData.get("yourSoldier")==null||rowData.get("yourSoldier").isEmpty())?0:Integer.parseInt(rowData.get("yourSoldier"));//

				CardUseBean cardUse = new CardUseBean(Id,  cost,targetNum, myHero,mySoldier,
							  						yourHero, yourSoldier);
					_useInfoMap.put(Id, cardUse);
			}
			
		}
	}
	public HashMap<Integer, CardUseBean> getCardUseMap() {
		return _useInfoMap;
	}
	public CardUseBean getCardUse(int cardID){
		return _useInfoMap.get(cardID);
	}
}
