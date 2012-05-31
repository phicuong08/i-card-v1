package com.icard.cards.cardInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.icard.data.excel.ExcelReader;

public class CardInfoManager {
	private final static String CARD_FILE_PATH ="./card.xls";
	
	private ArrayList<String> excel_sheet_fighters 	=new ArrayList<String>(); //盟军	
	private ArrayList<String> excel_sheet_weapons	=new ArrayList<String>(); //武器
	private ArrayList<String> excel_sheet_defines	=new ArrayList<String>(); //防具
	private ArrayList<String> excel_sheet_tasks		=new ArrayList<String>(); //任务
	private ArrayList<String> excel_sheet_skills	=new ArrayList<String>(); //技能
	private ArrayList<String> excel_sheet_heros		=new ArrayList<String>(); //英雄

	
	private static int MIN_CARD_ID	=2000;	//最小的卡片id
	
	private static CardInfoManager mInstance =null;
	private HashMap<Integer, CardInfo> cardInfoMap =new HashMap<Integer, CardInfo>();
	private CardInfoManager(){
		excel_sheet_fighters.add(CardInfo.race_dps_str);
		excel_sheet_fighters.add(CardInfo.race_tank_str);
		excel_sheet_fighters.add(CardInfo.race_healer_str);
		excel_sheet_fighters.add(CardInfo.race_other_str);
		
		excel_sheet_weapons.add("武器");
		excel_sheet_defines.add("防具");
		excel_sheet_tasks.add("任务");
		excel_sheet_skills.add("技能");
		excel_sheet_heros.add("英雄");
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
					int Id = Integer.parseInt(rowData.get("编号")); // 牌的id
					boolean IsHero	= false; //是否英雄
					String Name = rowData.get("名称");
					int Colour = CardInfo.getColorInt(sheetName); // 所属的种族（盟军，英雄有效）
					List<Integer> MatchColours = null; // 匹配的种族（对技能，武器，物品有效）
					int BaseCost = Integer.parseInt(rowData.get("费用")); // 最初始的上场花费（对盟军，技能有效）
					int BaseAttack = Integer.parseInt(rowData.get("攻击")); // 最初始的攻击力
					int BaseLife = Integer.parseInt(rowData.get("生命")); // 最初始的生命
					int BaseDefence = 0;//最初的防御
					int BaseUseOnceCost = 0; // 最初始的使用一次花费（对武器有效）
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
					int Id = Integer.parseInt(rowData.get("编号")); // 牌的id
					boolean IsHero	= false; //是否英雄
					String Name = rowData.get("名称");
					int Colour = -1; // 所属的种族（盟军，英雄有效）
					List<Integer> MatchColours = CardInfo.getColorIntList(rowData.get("种族")); // 匹配的种族（对技能，武器，物品有效）
					int BaseCost = Integer.parseInt(rowData.get("费用")); // 最初始的上场花费（对盟军，技能有效）
					int BaseAttack = Integer.parseInt(rowData.get("攻击")); // 最初始的攻击力
					int BaseLife = Integer.parseInt(rowData.get("生命")); // 最初始的生命
					int BaseDefence = Integer.parseInt(rowData.get("防御"));//最初的防御
					int BaseUseOnceCost = Integer.parseInt(rowData.get("使用费用"));// 最初始的使用一次花费（对武器有效）
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
					int Id = Integer.parseInt(rowData.get("编号")); // 牌的id
					boolean IsHero	= false; //是否英雄
					String Name = rowData.get("名称");
					int Colour = -1; // 所属的种族（盟军，英雄有效）
					List<Integer> MatchColours = CardInfo.getColorIntList(rowData.get("种族")); // 匹配的种族（对技能，武器，物品有效）
					int BaseCost = Integer.parseInt(rowData.get("费用")); // 最初始的上场花费（对盟军，技能有效）
					int BaseAttack = Integer.parseInt(rowData.get("攻击")); // 最初始的攻击力
					int BaseLife = Integer.parseInt(rowData.get("生命")); // 最初始的生命
					int BaseDefence = Integer.parseInt(rowData.get("防御"));//最初的防御
					int BaseUseOnceCost = Integer.parseInt(rowData.get("使用费用"));// 最初始的使用一次花费（对武器有效）
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
					int Id = Integer.parseInt(rowData.get("编号")); // 牌的id
					boolean IsHero	= false; //是否英雄
					String Name = rowData.get("名称");
					int Colour = -1; // 所属的种族（盟军，英雄有效）
					List<Integer> MatchColours = CardInfo.getColorIntList(rowData.get("种族")); // 匹配的种族（对技能，武器，物品有效）
					int BaseCost = -1; // 最初始的上场花费（对盟军，技能有效）
					int BaseAttack = -1; // 最初始的攻击力
					int BaseLife = -1; // 最初始的生命
					int BaseDefence = -1;//最初的防御
					int BaseUseOnceCost = -1;// 最初始的使用一次花费（对武器有效）
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
					int Id = Integer.parseInt(rowData.get("编号")); // 牌的id
					boolean IsHero	= false; //是否英雄
					String Name = rowData.get("名称");
					int Colour = -1; // 所属的种族（盟军，英雄有效）
					List<Integer> MatchColours = CardInfo.getColorIntList(rowData.get("种族")); // 匹配的种族（对技能，武器，物品有效）
					int BaseCost = Integer.parseInt(rowData.get("费用")); // 最初始的上场花费（对盟军，技能有效）
					int BaseAttack = -1; // 最初始的攻击力
					int BaseLife = -1; // 最初始的生命
					int BaseDefence = -1;//最初的防御
					int BaseUseOnceCost = -1;// 最初始的使用一次花费（对武器有效）
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
					int Id = Integer.parseInt(rowData.get("编号")); // 牌的id
					boolean IsHero	= true; //是否英雄
					String Name = rowData.get("名称");
					int Colour = CardInfo.getColorInt(sheetName); // 所属的种族（盟军，英雄有效）
					List<Integer> MatchColours = null; // 匹配的种族（对技能，武器，物品有效）
					int BaseCost = -1; // 最初始的上场花费（对盟军，技能有效）
					int BaseAttack = 0; // 最初始的攻击力
					int BaseLife = Integer.parseInt(rowData.get("血量")); // 最初始的生命
					int BaseDefence = 0;//最初的防御
					int BaseUseOnceCost = 0; // 最初始的使用一次花费（对武器有效）
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
