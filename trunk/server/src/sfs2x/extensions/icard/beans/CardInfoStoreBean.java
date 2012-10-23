package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.HashMap;

import com.icard.data.excel.ExcelReader;

public class CardInfoStoreBean {
	private final static String CARD_FILE_PATH ="extensions/ICard/card.xls";
	private static int MIN_CARD_ID	=2000;	//��С�Ŀ�Ƭid
	
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
				int Id = Integer.parseInt(rowData.get("���")); // �Ƶ�id
				int BaseCost = (rowData.get("����")==null||rowData.get("����").isEmpty())?0:Integer.parseInt(rowData.get("����")); // ���ʼ���ϳ����ѣ����˾���������Ч��
				int BaseAttack = (rowData.get("����")==null||rowData.get("����").isEmpty())?0:Integer.parseInt(rowData.get("����")); // ���ʼ�Ĺ�����
				int BaseHp = (rowData.get("����")==null||rowData.get("����").isEmpty())?0:Integer.parseInt(rowData.get("����")); // ���ʼ������
				int BaseDefence = (rowData.get("����")==null||rowData.get("����").isEmpty())?0:Integer.parseInt(rowData.get("����"));//����ķ���
				int BaseUseCost = (rowData.get("ʹ�÷���")==null||rowData.get("ʹ�÷���").isEmpty())?0:Integer.parseInt(rowData.get("ʹ�÷���"));// ���ʼ��ʹ��һ�λ��ѣ���������Ч��
				int mpMax = (rowData.get("���ħ��")==null||rowData.get("���ħ��").isEmpty())?0:Integer.parseInt(rowData.get("���ħ��"));// 
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
