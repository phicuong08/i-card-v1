package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

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
				int Id = Integer.parseInt(rowData.get("ID")); // ÅÆµÄid
				String whenInfo = (rowData.get("WHEN")==null||rowData.get("WHEN").isEmpty())?"":rowData.get("WHEN"); // 
				String whatInfo = (rowData.get("WHAT")==null||rowData.get("WHAT").isEmpty())?"":rowData.get("WHAT"); //
				String whichInfo = (rowData.get("WHICH")==null||rowData.get("WHICH").isEmpty())?"":rowData.get("WHICH"); //
				int val = (rowData.get("VAL")==null||rowData.get("VAL").isEmpty())?0 :Integer.parseInt(rowData.get("VAL")); //
				String op = (rowData.get("OP")==null||rowData.get("OP").isEmpty())?"":rowData.get("OP");//
				int cost = (rowData.get("COST")==null||rowData.get("COST").isEmpty())?0 :Integer.parseInt(rowData.get("COST")); //
				String loop = (rowData.get("LOOP")==null||rowData.get("LOOP").isEmpty())?"":rowData.get("LOOP");//
				int tarNum = (rowData.get("TARGETNUM")==null||rowData.get("TARGETNUM").isEmpty())?0 :Integer.parseInt(rowData.get("TARGETNUM")); //
				AddAbilityInfo(Id,whenInfo,whichInfo,whatInfo,val,op,cost,loop,tarNum);
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
		}while(true);
		return vec;
	}
	private void AddAbilityInfo(int id,String whenInfo,String whichInfo,String whatInfo,int val,String op,int cost,
								String loop,int tarNum){
		CardAbilityBean ability = new CardAbilityBean(id,  ParseWhenInfo(whenInfo),ParseWhichInfo(whichInfo),
									ParseWhatInfo(whatInfo),val,ParseOpInfo(op),cost,ParseLoopInfo(loop),tarNum);
		_abilityInfoMap.put(id, ability);
	}
	private int ParseLoopInfo(String loop){
		if(loop.equals("LOOP_ONE"))
			return CardAbilityBean.LOOP_ONE;
		else if(loop.equals("LOOP_ALL"))
			return CardAbilityBean.LOOP_ALL;
		else if(loop.equals("LOOP_MY"))
			return CardAbilityBean.LOOP_MY;
		return 	CardAbilityBean.LOOP_ONE;
	}
	private int ParseOpInfo(String op){
		if(op.equals("OP_OR"))
			return CardAbilityBean.OP_OR;
		else if(op.equals("OP_AND"))
			return CardAbilityBean.OP_AND;
		return 	CardAbilityBean.OP_OR;
	}
	private int ParseWhichInfo(String which){
		if(which.equals("WHICH_MY"))
			return CardAbilityBean.WHICH_MY;
		else if(which.equals("WHICH_MYHERO"))
			return CardAbilityBean.WHICH_MYHERO;
		else if(which.equals("WHICH_MYSOLDIER"))
			return CardAbilityBean.WHICH_MYSOLDIER;
		else if(which.equals("WHICH_MYWEAPON"))
			return CardAbilityBean.WHICH_MYWEAPON;
		else if(which.equals("WHICH_YOUR"))
			return CardAbilityBean.WHICH_YOUR;
		else if(which.equals("WHICH_YOURHERO"))
			return CardAbilityBean.WHICH_YOURHERO;
		else if(which.equals("WHICH_YOURSOLDIER"))
			return CardAbilityBean.WHICH_YOURSOLDIER;
		else if(which.equals("WHICH_YOURWEAPON"))
			return CardAbilityBean.WHICH_YOURWEAPON;
		else if(which.equals("WHICH_SKILL"))
			return CardAbilityBean.WHICH_SKILL;
		else if(which.equals("WHICH_DES"))
			return CardAbilityBean.WHICH_DES;
		else if(which.equals("WHICH_SRC"))
			return CardAbilityBean.WHICH_SRC;
		else if(which.equals("WHICH_I"))
			return CardAbilityBean.WHICH_I;
		return 	CardAbilityBean.WHICH_NULL;
	}
	

	private int ParseWhatInfo(String whatInfo){
		if(whatInfo.equals("BUF_ATK_DIST"))
			return CardAbilityBean.BUF_ATK_DIST;
		else if(whatInfo.equals("BUF_ATK_WITH_EQUIP"))
			return CardAbilityBean.BUF_ATK_WITH_EQUIP;
		else if(whatInfo.equals("BUF_ATK_ADD"))
			return CardAbilityBean.BUF_ATK_ADD;
		else if(whatInfo.equals("BUF_ATK_UNABLE"))
			return CardAbilityBean.BUF_ATK_UNABLE;
		else if(whatInfo.equals("BUF_CURE"))
			return CardAbilityBean.BUF_CURE;
		else if(whatInfo.equals("BUF_DAMAGE_UNSTOP"))
			return CardAbilityBean.BUF_DAMAGE_UNSTOP;
		else if(whatInfo.equals("BUF_GUIDE"))
			return CardAbilityBean.BUF_GUIDE;			
		else if(whatInfo.equals("BUF_HEAL"))
			return CardAbilityBean.BUF_HEAL;
		else if(whatInfo.equals("BUF_HIDDEN"))
			return CardAbilityBean.BUF_HIDDEN;
		else if(whatInfo.equals("BUF_HP_WITH_EQUIP"))
			return CardAbilityBean.BUF_HP_WITH_EQUIP;
		else if(whatInfo.equals("BUF_LATENT"))
			return CardAbilityBean.BUF_LATENT;
		else if(whatInfo.equals("BUF_SHIELD"))
			return CardAbilityBean.BUF_SHIELD;	
		else if(whatInfo.equals("BUF_SIDE"))
			return CardAbilityBean.BUF_SIDE;
		else if(whatInfo.equals("BUF_STRIKE_COST_ADD"))
			return CardAbilityBean.BUF_STRIKE_COST_ADD;
		else if(whatInfo.equals("BUF_STRIKE_DAMAGE_ADD"))
			return CardAbilityBean.BUF_STRIKE_DAMAGE_ADD;		
		else if(whatInfo.equals("BUF_POINT_UNABLE"))
			return CardAbilityBean.BUF_POINT_UNABLE;
		else if(whatInfo.equals("BUF_DEF_UNABLE"))
			return CardAbilityBean.BUF_DEF_UNABLE;
		else if(whatInfo.equals("DO_ATK_SIDE_ADD"))
			return CardAbilityBean.DO_ATK_SIDE_ADD;
		else if(whatInfo.equals("DO_BREAK_SKILL"))
			return CardAbilityBean.DO_BREAK_SKILL;
		else if(whatInfo.equals("DO_DROP_HAND_CARD"))
			return CardAbilityBean.DO_DROP_HAND_CARD;
		else if(whatInfo.equals("DO_DROP_RES"))
			return CardAbilityBean.DO_DROP_RES;
		else if(whatInfo.equals("DO_DAMAGE"))
			return CardAbilityBean.DO_DAMAGE;
		else if(whatInfo.equals("DO_DEAD"))
			return CardAbilityBean.DO_DEAD;		
		else if(whatInfo.equals("DO_HEAL"))
			return CardAbilityBean.DO_HEAL;		
		else if(whatInfo.equals("DO_KILL"))
			return CardAbilityBean.DO_KILL;		
		else if(whatInfo.equals("DO_KILL_COST_UP"))
			return CardAbilityBean.DO_KILL_COST_UP;	
		else if(whatInfo.equals("DO_KILL_COST_DOWN"))
			return CardAbilityBean.DO_KILL_COST_DOWN;	
		else if(whatInfo.equals("DO_RESET"))
			return CardAbilityBean.DO_RESET;
		else if(whatInfo.equals("DO_SIDE"))
			return CardAbilityBean.DO_SIDE;	
		return CardAbilityBean.DO_NULL;	 	
	}
	private int ParseWhenInfo(String whenInfo){
		if(whenInfo.equals("WHEN_USE"))
			return CardAbilityBean.WHEN_USE;
		else if(whenInfo.equals("WHEN_ALL"))
			return CardAbilityBean.WHEN_ALL;
		else if(whenInfo.equals("WHEN_ATK"))
			return CardAbilityBean.WHEN_ATK;
		else if(whenInfo.equals("WHEN_ATKED"))
			return CardAbilityBean.WHEN_ATKED;
		else if(whenInfo.equals("WHEN_ATK_DAMAGE"))
			return CardAbilityBean.WHEN_ATK_DAMAGE;
		else if(whenInfo.equals("WHEN_ENTER"))
			return CardAbilityBean.WHEN_ENTER;
		else if(whenInfo.equals("WHEN_DEAD"))
			return CardAbilityBean.WHEN_DEAD;
		else if(whenInfo.equals("WHEN_DEF_DEAD"))
			return CardAbilityBean.WHEN_DEF_DEAD;
		else if(whenInfo.equals("WHEN_USE"))
			return CardAbilityBean.WHEN_USE;
		else if(whenInfo.equals("WHEN_USE_SKILL"))
			return CardAbilityBean.WHEN_USE_SKILL;
		else if(whenInfo.equals("WHEN_SACRIFICE"))
			return CardAbilityBean.WHEN_SACRIFICE;
		else if(whenInfo.equals("WHEN_MY_LOOP_BEGIN"))
			return CardAbilityBean.WHEN_MY_LOOP_BEGIN;
		else if(whenInfo.equals("WHEN_MY_LOOP_END"))
			return CardAbilityBean.WHEN_MY_LOOP_END;
		return CardAbilityBean.WHEN_NULL;											
	}
}
