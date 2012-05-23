package com.icard.room;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.icard.cards.BaseCard;

public class CardSite {
	public static final int  MyHandSlotId		= 1;  
	public static final int  MyResourceSlotId	= 2;  
	public static final int  MyEquipSlotId		= 3;  
	public static final int  MyFightSlotId		= 4;  
	public static final int  MyTombSlotId		= 5;  
	public static final int  MyHeroSlotId		= 6;

	public static final int  YourHandSlotId		= 7;  
	public static final int  YourResourceSlotId	= 8;  
	public static final int  YourEquipSlotId	= 9;  
	public static final int  YourFightSlotId	= 10;  
	public static final int  YourTombSlotId		= 11;
	public static final int  YourHeroIdSlotId	= 12;
	
	public static final int  USER_READY_STATE_NOT_READY	= 0;
	public static final int  USER_READY_STATE_READYED	= 1;
	
	public int belongUserID = -1; 
	public int userReadyState =0; //[ 0--初始状态， 1--就绪]
	
	//套牌
	public List<BaseCard> CardBox = new ArrayList<BaseCard>();
	//英雄
	public BaseCard		Hero;
	//手牌
	public HashMap<Integer,BaseCard> HandSlot		= new  HashMap<Integer,BaseCard> ();
	//资源
	public HashMap<Integer,BaseCard> ResourceSlot	= new  HashMap<Integer,BaseCard> ();
	//武器
	public HashMap<Integer,BaseCard> EquipSlot	= new  HashMap<Integer,BaseCard> ();
	//战斗区
	public HashMap<Integer,BaseCard> FightSlot	= new  HashMap<Integer,BaseCard> ();
	//坟墓场
	public HashMap<Integer,BaseCard> TombSlot		= new  HashMap<Integer,BaseCard> ();
	
	public void clear(){
		CardBox.clear();
		Hero =null;
		HandSlot.clear();
		ResourceSlot.clear();
		EquipSlot.clear();
		FightSlot.clear();
		TombSlot.clear();
	}
	
	//起牌
	public List<BaseCard> pickCard(int cardNumber){
		List<BaseCard> ret = new ArrayList<BaseCard>();
		for(int index =0;index<cardNumber;index++){
			BaseCard card = CardBox.get(index);
			ret.add(card);
			HandSlot.put(card.getRealId(), card);
		}
		for(int index =0;index<cardNumber;index++){
			CardBox.remove(index);
		}
		return ret;
	}
}
