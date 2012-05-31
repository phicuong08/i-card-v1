package com.icard.cards.cardInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.icard.data.excel.ExcelReader;

public class CardInfoStoreBean {
	private final static String CARD_FILE_PATH ="./card.xls";
	
	private static int MIN_CARD_ID	=2000;	//��С�Ŀ�Ƭid
	
	private static CardInfoManager mInstance =null;
	private HashMap<Integer, CardInfoBean> _cardInfoMap =new HashMap<Integer, CardInfoBean>();
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
		loadCardExcel(excelCardData);
	}
	private void loadCardExcel(HashMap<String,ArrayList<HashMap<String,String>>> excelCardData){
		for(String sheetName : excelCardData.keySet() ){
			
			ArrayList<HashMap<String,String>> sheetData = excelCardData.get(sheetName);
			for(HashMap<String,String> rowData :sheetData){
				int Id = Integer.parseInt(rowData.get("���")); // �Ƶ�id
			
				int BaseCost = Integer.parseInt(rowData.get("����")); // ���ʼ���ϳ����ѣ����˾���������Ч��
				int BaseAttack = Integer.parseInt(rowData.get("����")); // ���ʼ�Ĺ�����
				int BaseHp = Integer.parseInt(rowData.get("����")); // ���ʼ������
				int BaseDefence = Integer.parseInt(rowData.get("����"));//����ķ���
				int BaseUseCost = Integer.parseInt(rowData.get("ʹ�÷���"));// ���ʼ��ʹ��һ�λ��ѣ���������Ч��
				if(Id>=MIN_CARD_ID){
					CardInfoBean cardInfo = new CardInfoBean(Id,  BaseCost,   BaseAttack,
							  						BaseHp,  BaseDefence,BaseUseOnceCost);
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
