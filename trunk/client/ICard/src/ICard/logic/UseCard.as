//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.datas.*;
	mport ICard.datas.card.*;
	import ICard.assist.server.CardType;
	
		public class CardType {
		
		public static const HeroType = 0;
		public static const SoldierType = 1;
		public static const WeaponType = 2;
		public static const DefType = 3;
		public static const SkillType = 4;
		public static const TaskType = 5;
		
	//ID    费用　目标数　我方英雄　我方盟军　敌方英雄　　敌方盟军　
	public class UseCard {
	
		public static function ResEnough(card:CardData,resVal:int):Boolean{
				var useInfo:Array = CardType.UseCardInfo(card.CardID);
				if(useInfo==false)
					return true;
				return (resVal >= useInfo[1]);
		}
		public static function UseAble(card:CardData,resVal:int):Boolean{
				if(ResEnough(card,resVal)==false)
					return false;
				switch(card.Type)
				{
						case CardType.HeroType:
						{
							if(card.Slot ==BattleFieldType.MyHeroSlotId &&
						   	card.Turn == false)
						   	return true;
						}
						break;
						case CardType.SoldierType:
						{
							if(card.Slot ==BattleFieldType.MySoldierSlotId &&
						   	card.Turn == false)
						   	return true;
						}
						break;
						case CardType.SkillType:
						{
								if(card.Slot ==BattleFieldType.MyHandSlotId)
						   	   	return true;
						}
						break;
						case CardType.WeaponType:
						case CardType.DefType:
						{
								if(card.Slot ==BattleFieldType.YouEquipSlotId &&
									card.Turn == false)
						   	   	return true;
						}
						break;
						case CardType.TaskType:
						{
								if((card.Slot ==BattleFieldType.MyHandSlotId ||card.Slot ==BattleFieldType.MyResourceSlotId)&&
									card.Turn == false)
						   	   	return true;
						}
						break;
				}
				return false;
		}
		public static function Use(cardID:int):Boolean{
		}
		
	}
}//package com.assist.data.mission 
