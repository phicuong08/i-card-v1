package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.icard.data.excel.ExcelReader;

public class CardAbilityStoreBean {
	private final static String CARD_FILE_PATH ="extensions/ICard/cardAbility.xls";

	
	private static CardAbilityStoreBean mInstance =null;
	private HashMap<Integer, CardAbilityBean> _abilityInfoMap =new HashMap<Integer, CardAbilityBean>();
	private CardAbilityStoreBean(){
	}
	
	public static CardAbilityStoreBean GetInstance(){
		if(mInstance ==null){
			mInstance = new CardAbilityStoreBean();
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
				int Id = Integer.parseInt(rowData.get("ID")); // �Ƶ�id
				String whenInfo = (rowData.get("WHEN")==null||rowData.get("WHEN").isEmpty())?"":rowData.get("WHEN"); // 
				String whatInfo = (rowData.get("WHAT")==null||rowData.get("WHAT").isEmpty())?"":rowData.get("WHAT"); //
				int val = (rowData.get("VAL")==null||rowData.get("VAL").isEmpty())?"":rowData.get("VAL"); //
				String op = (rowData.get("OP")==null||rowData.get("OP").isEmpty())?"":rowData.get("OP");//
				AddAbilityInfo(Id,whenInfo,whatInfo,val,op);
			}
		}
	}

	public Vector<CardAbilityBean> getCardAbility(int cardID){
		Vector<CardAbilityBean> vec = new Vector<CardAbilityBean>();
		int pos=0;
		do{
			CardAbilityBean ability = _abilityInfoMap.get(cardID*10+pos);
			if(ability==null)
				break;
			vec.add(ability);
			pos++;	
		}
		return vec;
	}
	private void AddAbilityInfo(int id,String whenInfo,String whatInfo,int val,String op){
		CardAbilityBean ability = new CardAbilityBean(Id,  ParseWhenInfo(whenInfo),ParseWhatInfo(whatInfo),
						  						val,  ParseOpInfo(op));
		_abilityInfoMap.put(Id, ability);
	}
	private int ParseOpInfo(String op){
		if(op=="OP_OR")
			return CardAbilityBean.OP_OR;
		else if(op=="OP_AND")
			return CardAbilityBean.OP_AND;
		return 	CardAbilityBean.OP_OR;
	}
	private int ParseWhatInfo(String whatInfo){
		if(whatInfo=="BUF_ATK_UNABLE")
			return CardAbilityBean.BUF_ATK_UNABLE;
		else if(whatInfo=="BUF_ATK_ADD")
			return CardAbilityBean.BUF_ATK_ADD;
		else if(whatInfo=="BUF_ATK_DIST")
			return CardAbilityBean.BUF_ATK_DIST;
		else if(whatInfo=="BUF_DAMAGE_UNSTOP")
			return CardAbilityBean.BUF_DAMAGE_UNSTOP;
		else if(whatInfo=="BUF_DEF_UNABLE")
			return CardAbilityBean.BUF_DEF_UNABLE;
		else if(whatInfo=="BUF_DIST_WEAPON_ATK_ADD")
			return CardAbilityBean.BUF_DIST_WEAPON_ATK_ADD;
		else if(whatInfo=="BUF_GUIDE")
			return CardAbilityBean.BUF_GUIDE;			
		else if(whatInfo=="BUF_HIDDEN")
			return CardAbilityBean.BUF_HIDDEN;
		else if(whatInfo=="BUF_POINT_UNABLE")
			return CardAbilityBean.BUF_POINT_UNABLE;
		else if(whatInfo=="BUF_SHIELD")
			return CardAbilityBean.BUF_SHIELD;
		else if(whatInfo=="BUF_UNABLE")
			return CardAbilityBean.BUF_UNABLE;
		else if(whatInfo=="BUF_COST_ADD")
			return CardAbilityBean.BUF_COST_ADD;	
		else if(whatInfo=="DO_KILL_SKILL")
			return CardAbilityBean.DO_KILL_SKILL;
		else if(whatInfo=="DO_DEAD")
			return CardAbilityBean.DO_DEAD;
		else if(whatInfo=="DO_KILL_WEAPON")
			return CardAbilityBean.DO_KILL_WEAPON;
		else if(whatInfo=="DO_RESET_HERO")
			return CardAbilityBean.DO_RESET_HERO;
		else if(whatInfo=="DO_RESET_WEAPON")
			return CardAbilityBean.DO_RESET_WEAPON;
		else if(whatInfo=="DO_DRAW_CARD")
			return CardAbilityBean.DO_DRAW_CARD;		
		else if(whatInfo=="DO_BREAK_SKILL")
			return CardAbilityBean.DO_BREAK_SKILL;		
		else if(whatInfo=="DO_DROP_RES")
			return CardAbilityBean.DO_DROP_RES;		
		else if(whatInfo=="DO_DROP_HAND_CARD")
			return CardAbilityBean.DO_DROP_HAND_CARD;	
		else if(whatInfo=="DO_HEAL")
			return CardAbilityBean.DO_HEAL;											
		return CardAbilityBean.DO_NULL;	 	
	}
	private int ParseWhenInfo(String whenInfo){
		if(whenInfo=="WHEN_USE")
			return CardAbilityBean.WHEN_USE;
		else if(whenInfo=="WHEN_ALL")
			return CardAbilityBean.WHEN_ALL;
		else if(whenInfo=="WHEN_ENTER")
			return CardAbilityBean.WHEN_ENTER;
		else if(whenInfo=="WHEN_ATK")
			return CardAbilityBean.WHEN_ATK;
		else if(whenInfo=="WHEN_ATK_SIDE")
			return CardAbilityBean.WHEN_ATK_SIDE;
		else if(whenInfo=="WHEN_ATK_HERO_DAMAGE")
			return CardAbilityBean.WHEN_ATK_HERO_DAMAGE;
		else if(whenInfo=="WHEN_ATK_DAMAGE")
			return CardAbilityBean.WHEN_ATK_DAMAGE;
		else if(whenInfo=="WHEN_MY_LOOP_BEGIN")
			return CardAbilityBean.WHEN_MY_LOOP_BEGIN;
		else if(whenInfo=="WHEN_USE_SKILL")
			return CardAbilityBean.WHEN_USE_SKILL;
		else if(whenInfo=="WHEN_DEAD")
			return CardAbilityBean.WHEN_DEAD;
		else if(whenInfo=="WHEN_DEF_DEAD")
			return CardAbilityBean.WHEN_DEF_DEAD;
		else if(whenInfo=="WHEN_ATKED")
			return CardAbilityBean.WHEN_ATKED;
		else if(whenInfo=="WHEN_USE_WEAPON")
			return CardAbilityBean.WHEN_USE_WEAPON;
		else if(whenInfo=="WHEN_RESET")
			return CardAbilityBean.WHEN_RESET;
		else if(whenInfo=="WHEN_SIDE")
			return CardAbilityBean.WHEN_SIDE;
		return CardAbilityBean.WHEN_NULL;											
	}
}
