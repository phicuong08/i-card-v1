package com.icard.cards.cardInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.icard.data.excel.ExcelReader;

public class CardInfoManager {
	private final static String CARD_FILE_PATH ="./card.xls";
	
	private ArrayList<String> excel_sheet_fighters 	=new ArrayList<String>(); //�˾�	
	private ArrayList<String> excel_sheet_weapons	=new ArrayList<String>(); //����
	private ArrayList<String> excel_sheet_defines	=new ArrayList<String>(); //����
	private ArrayList<String> excel_sheet_tasks		=new ArrayList<String>(); //����
	private ArrayList<String> excel_sheet_skills	=new ArrayList<String>(); //����
	private ArrayList<String> excel_sheet_heros		=new ArrayList<String>(); //Ӣ��

	
	private static int MIN_CARD_ID	=2000;	//��С�Ŀ�Ƭid
	
	private static CardInfoManager mInstance =null;
	private HashMap<Integer, CardInfo> cardInfoMap =new HashMap<Integer, CardInfo>();
	private CardInfoManager(){
		excel_sheet_fighters.add(CardInfo.race_dps_str);
		excel_sheet_fighters.add(CardInfo.race_tank_str);
		excel_sheet_fighters.add(CardInfo.race_healer_str);
		excel_sheet_fighters.add(CardInfo.race_other_str);
		
		excel_sheet_weapons.add("����");
		excel_sheet_defines.add("����");
		excel_sheet_tasks.add("����");
		excel_sheet_skills.add("����");
		excel_sheet_heros.add("Ӣ��");
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
		loadFighters(excelCardData);
		loadWeapons(excelCardData);
		loadDefines(excelCardData);
		loadTasks(excelCardData);
		loadSkills(excelCardData);
		loadHeros(excelCardData);
	}
	private void loadFighters(HashMap<String,ArrayList<HashMap<String,String>>> excelCardData){
		for(String sheetName : excelCardData.keySet() ){
			if(excel_sheet_fighters.contains(sheetName)){
				ArrayList<HashMap<String,String>> sheetData = excelCardData.get(sheetName);
				for(HashMap<String,String> rowData :sheetData){
					int Id = Integer.parseInt(rowData.get("���")); // �Ƶ�id
					boolean IsHero	= false; //�Ƿ�Ӣ��
					String Name = rowData.get("����");
					int Colour = CardInfo.getColorInt(sheetName); // ���������壨�˾���Ӣ����Ч��
					List<Integer> MatchColours = null; // ƥ������壨�Լ��ܣ���������Ʒ��Ч��
					int BaseCost = Integer.parseInt(rowData.get("����")); // ���ʼ���ϳ����ѣ����˾���������Ч��
					int BaseAttack = Integer.parseInt(rowData.get("����")); // ���ʼ�Ĺ�����
					int BaseLife = Integer.parseInt(rowData.get("����")); // ���ʼ������
					int BaseDefence = 0;//����ķ���
					int BaseUseOnceCost = 0; // ���ʼ��ʹ��һ�λ��ѣ���������Ч��
					if(Id>=MIN_CARD_ID){
						CardInfo cardInfo = new CardInfo(Id,  IsHero,   Name,   Colour,
								  						MatchColours,   BaseCost,   BaseAttack,
								  						BaseLife,  BaseDefence,BaseUseOnceCost);
						cardInfoMap.put(Id, cardInfo);
					}
				}
			}
		}
	}
	private void loadWeapons(HashMap<String,ArrayList<HashMap<String,String>>> excelCardData){
		for(String sheetName : excelCardData.keySet() ){
			if(excel_sheet_weapons.contains(sheetName)){
				ArrayList<HashMap<String,String>> sheetData = excelCardData.get(sheetName);
				for(HashMap<String,String> rowData :sheetData){
					int Id = Integer.parseInt(rowData.get("���")); // �Ƶ�id
					boolean IsHero	= false; //�Ƿ�Ӣ��
					String Name = rowData.get("����");
					int Colour = -1; // ���������壨�˾���Ӣ����Ч��
					List<Integer> MatchColours = CardInfo.getColorIntList(rowData.get("����")); // ƥ������壨�Լ��ܣ���������Ʒ��Ч��
					int BaseCost = Integer.parseInt(rowData.get("����")); // ���ʼ���ϳ����ѣ����˾���������Ч��
					int BaseAttack = Integer.parseInt(rowData.get("����")); // ���ʼ�Ĺ�����
					int BaseLife = Integer.parseInt(rowData.get("����")); // ���ʼ������
					int BaseDefence = Integer.parseInt(rowData.get("����"));//����ķ���
					int BaseUseOnceCost = Integer.parseInt(rowData.get("ʹ�÷���"));// ���ʼ��ʹ��һ�λ��ѣ���������Ч��
					if(Id>=MIN_CARD_ID){
						CardInfo cardInfo = new CardInfo(Id,  IsHero,   Name,   Colour,
								  						MatchColours,   BaseCost,   BaseAttack,
								  						BaseLife,  BaseDefence,BaseUseOnceCost);
						cardInfoMap.put(Id, cardInfo);
					}
				}
			}
		}
	}
	private void loadDefines(HashMap<String,ArrayList<HashMap<String,String>>> excelCardData){
		for(String sheetName : excelCardData.keySet() ){
			if(excel_sheet_defines.contains(sheetName)){
				ArrayList<HashMap<String,String>> sheetData = excelCardData.get(sheetName);
				for(HashMap<String,String> rowData :sheetData){
					int Id = Integer.parseInt(rowData.get("���")); // �Ƶ�id
					boolean IsHero	= false; //�Ƿ�Ӣ��
					String Name = rowData.get("����");
					int Colour = -1; // ���������壨�˾���Ӣ����Ч��
					List<Integer> MatchColours = CardInfo.getColorIntList(rowData.get("����")); // ƥ������壨�Լ��ܣ���������Ʒ��Ч��
					int BaseCost = Integer.parseInt(rowData.get("����")); // ���ʼ���ϳ����ѣ����˾���������Ч��
					int BaseAttack = Integer.parseInt(rowData.get("����")); // ���ʼ�Ĺ�����
					int BaseLife = Integer.parseInt(rowData.get("����")); // ���ʼ������
					int BaseDefence = Integer.parseInt(rowData.get("����"));//����ķ���
					int BaseUseOnceCost = Integer.parseInt(rowData.get("ʹ�÷���"));// ���ʼ��ʹ��һ�λ��ѣ���������Ч��
					if(Id>=MIN_CARD_ID){
						CardInfo cardInfo = new CardInfo(Id,  IsHero,   Name,   Colour,
								  						MatchColours,   BaseCost,   BaseAttack,
								  						BaseLife,  BaseDefence,BaseUseOnceCost);
						cardInfoMap.put(Id, cardInfo);
					}
				}
			}
		}
	}
	private void loadTasks(HashMap<String,ArrayList<HashMap<String,String>>> excelCardData){
		for(String sheetName : excelCardData.keySet() ){
			if(excel_sheet_tasks.contains(sheetName)){
				ArrayList<HashMap<String,String>> sheetData = excelCardData.get(sheetName);
				for(HashMap<String,String> rowData :sheetData){
					int Id = Integer.parseInt(rowData.get("���")); // �Ƶ�id
					boolean IsHero	= false; //�Ƿ�Ӣ��
					String Name = rowData.get("����");
					int Colour = -1; // ���������壨�˾���Ӣ����Ч��
					List<Integer> MatchColours = CardInfo.getColorIntList(rowData.get("����")); // ƥ������壨�Լ��ܣ���������Ʒ��Ч��
					int BaseCost = -1; // ���ʼ���ϳ����ѣ����˾���������Ч��
					int BaseAttack = -1; // ���ʼ�Ĺ�����
					int BaseLife = -1; // ���ʼ������
					int BaseDefence = -1;//����ķ���
					int BaseUseOnceCost = -1;// ���ʼ��ʹ��һ�λ��ѣ���������Ч��
					if(Id>=MIN_CARD_ID){
						CardInfo cardInfo = new CardInfo(Id,  IsHero,   Name,   Colour,
								  						MatchColours,   BaseCost,   BaseAttack,
								  						BaseLife,  BaseDefence,BaseUseOnceCost);
						cardInfoMap.put(Id, cardInfo);
					}
				}
			}
		}
	}
	private void loadSkills(HashMap<String,ArrayList<HashMap<String,String>>> excelCardData){
		for(String sheetName : excelCardData.keySet() ){
			if(excel_sheet_skills.contains(sheetName)){
				ArrayList<HashMap<String,String>> sheetData = excelCardData.get(sheetName);
				for(HashMap<String,String> rowData :sheetData){
					int Id = Integer.parseInt(rowData.get("���")); // �Ƶ�id
					boolean IsHero	= false; //�Ƿ�Ӣ��
					String Name = rowData.get("����");
					int Colour = -1; // ���������壨�˾���Ӣ����Ч��
					List<Integer> MatchColours = CardInfo.getColorIntList(rowData.get("����")); // ƥ������壨�Լ��ܣ���������Ʒ��Ч��
					int BaseCost = Integer.parseInt(rowData.get("����")); // ���ʼ���ϳ����ѣ����˾���������Ч��
					int BaseAttack = -1; // ���ʼ�Ĺ�����
					int BaseLife = -1; // ���ʼ������
					int BaseDefence = -1;//����ķ���
					int BaseUseOnceCost = -1;// ���ʼ��ʹ��һ�λ��ѣ���������Ч��
					if(Id>=MIN_CARD_ID){
						CardInfo cardInfo = new CardInfo(Id,  IsHero,   Name,   Colour,
								  						MatchColours,   BaseCost,   BaseAttack,
								  						BaseLife,  BaseDefence,BaseUseOnceCost);
						cardInfoMap.put(Id, cardInfo);
					}
				}
			}
		}
	}
	private void loadHeros(HashMap<String,ArrayList<HashMap<String,String>>> excelCardData){
		for(String sheetName : excelCardData.keySet() ){
			if(excel_sheet_heros.contains(sheetName)){
				ArrayList<HashMap<String,String>> sheetData = excelCardData.get(sheetName);
				for(HashMap<String,String> rowData :sheetData){
					int Id = Integer.parseInt(rowData.get("���")); // �Ƶ�id
					boolean IsHero	= true; //�Ƿ�Ӣ��
					String Name = rowData.get("����");
					int Colour = CardInfo.getColorInt(sheetName); // ���������壨�˾���Ӣ����Ч��
					List<Integer> MatchColours = null; // ƥ������壨�Լ��ܣ���������Ʒ��Ч��
					int BaseCost = -1; // ���ʼ���ϳ����ѣ����˾���������Ч��
					int BaseAttack = 0; // ���ʼ�Ĺ�����
					int BaseLife = Integer.parseInt(rowData.get("Ѫ��")); // ���ʼ������
					int BaseDefence = 0;//����ķ���
					int BaseUseOnceCost = 0; // ���ʼ��ʹ��һ�λ��ѣ���������Ч��
					if(Id>=MIN_CARD_ID){
						CardInfo cardInfo = new CardInfo(Id,  IsHero,   Name,   Colour,
								  						MatchColours,   BaseCost,   BaseAttack,
								  						BaseLife,  BaseDefence,BaseUseOnceCost);
						cardInfoMap.put(Id, cardInfo);
					}
				}
			}
		}
	}
	public HashMap<Integer, CardInfo> getCardInfoMap() {
		return cardInfoMap;
	}
}
