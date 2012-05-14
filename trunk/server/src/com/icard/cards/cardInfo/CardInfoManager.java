package com.icard.cards.cardInfo;

import java.util.ArrayList;
import java.util.HashMap;

import com.icard.data.excel.ExcelReader;

public class CardInfoManager {
	private final static String CARD_FILE_PATH ="./card.xls";
	
	private static final String excel_color_all = "all";	//所有种族 
	private static final String excel_color_dps = "dps";
	private static final String excel_color_tank = "tank";
	private static final String excel_color_healer = "healer";
	private static final String excel_color_other = "other";
	
	private static int MIN_CARD_ID	=2000;	//最小的卡片id
	
	private static CardInfoManager mInstance =null;
	private HashMap<Integer, CardInfo> cardInfoMap =new HashMap<Integer, CardInfo>();
	private CardInfoManager(){	
	}
	public static CardInfoManager GetInstance(){
		if(mInstance ==null){
			mInstance = new CardInfoManager();
			mInstance.init();
		}
		return mInstance;
	}
	private void  init(){
		HashMap<String,ArrayList<HashMap<String,String>>> excelCardData = ExcelReader.loadFile(CARD_FILE_PATH);
		for(String sheetName : excelCardData.keySet() ){
			ArrayList<HashMap<String,String>> sheetData = excelCardData.get(sheetName);
			for(HashMap<String,String> rowData :sheetData){
				
			}
		}
	}
}
