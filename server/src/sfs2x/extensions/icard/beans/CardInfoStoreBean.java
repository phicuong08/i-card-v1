package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.HashMap;

import com.icard.data.excel.ExcelReader;

public class CardInfoStoreBean {
	private final static String CARD_FILE_PATH ="extensions/ICard/card.xls";
	private static int MIN_CARD_ID	=2000;	//最小的卡片id
	
	private static CardInfoStoreBean mInstance =null;
	private HashMap<Integer, CardInfoBean> _cardInfoMap =new HashMap<Integer, CardInfoBean>();
	private CardInfoStoreBean(){
	}
	
	public static CardInfoStoreBean GetInstance(){
		if(mInstance ==null){
			mInstance = new CardInfoStoreBean();
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
				int Id = Integer.parseInt(rowData.get("编号")); // 牌的id
				int BaseCost = (rowData.get("费用")==null||rowData.get("费用").isEmpty())?0:Integer.parseInt(rowData.get("费用")); // 最初始的上场花费（对盟军，技能有效）
				int BaseAttack = (rowData.get("攻击")==null||rowData.get("攻击").isEmpty())?0:Integer.parseInt(rowData.get("攻击")); // 最初始的攻击力
				int BaseHp = (rowData.get("生命")==null||rowData.get("生命").isEmpty())?0:Integer.parseInt(rowData.get("生命")); // 最初始的生命
				int BaseDefence = (rowData.get("防御")==null||rowData.get("防御").isEmpty())?0:Integer.parseInt(rowData.get("防御"));//最初的防御
				int BaseUseCost = (rowData.get("使用费用")==null||rowData.get("使用费用").isEmpty())?0:Integer.parseInt(rowData.get("使用费用"));// 最初始的使用一次花费（对武器有效）
				int mpMax = (rowData.get("最大魔力")==null||rowData.get("最大魔力").isEmpty())?0:Integer.parseInt(rowData.get("最大魔力"));// 
				if(Id>=MIN_CARD_ID){
					CardInfoBean cardInfo = new CardInfoBean(Id,  BaseCost,   BaseAttack,
							  						BaseHp,  BaseDefence,BaseUseCost,mpMax);
					_cardInfoMap.put(Id, cardInfo);
				}

			}
			
		}
	}
	public HashMap<Integer, CardInfoBean> getCardInfoMap() {
		return _cardInfoMap;
	}
	public CardInfoBean getCardInfo(int cardID){
		return _cardInfoMap.get(cardID);
	}
}
