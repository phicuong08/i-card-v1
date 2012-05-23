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
	public int userReadyState =0; //[ 0--��ʼ״̬�� 1--����]
	
	//����
	public List<BaseCard> CardBox = new ArrayList<BaseCard>();
	//Ӣ��
	public BaseCard		Hero;
	//����
	public HashMap<Integer,BaseCard> HandSlot		= new  HashMap<Integer,BaseCard> ();
	//��Դ
	public HashMap<Integer,BaseCard> ResourceSlot	= new  HashMap<Integer,BaseCard> ();
	//����
	public HashMap<Integer,BaseCard> EquipSlot	= new  HashMap<Integer,BaseCard> ();
	//ս����
	public HashMap<Integer,BaseCard> FightSlot	= new  HashMap<Integer,BaseCard> ();
	//��Ĺ��
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
	
	//����
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
