//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.SFSMod.*;
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.*;
	import ICard.datas.card.*;
	
	import flash.utils.Dictionary;

	public class AbilityHelper {
		public static const ICON_NULL:int = 0;
		public static const ICON_HEAL:int = 1;
		public static const ICON_ATK_UNABLE:int = 2;
		public static const ICON_CURE:int = 3;
		public static const ICON_SIDE:int = 4;
		public static const ICON_X:int = 5;
		
		public static function getIconID(abilityId:int):int{
			var ability:CardAbility  = CardAbilityDB.getCardAbility(abilityId);
			if(ability==null)
				return ICON_NULL;
			int iconID;
			switch(ability.what){
			case CardAbility.BUF_HEAL:
				iconID = ICON_HEAL;
				break;
			case CardAbility.BUF_ATK_UNABLE:
				iconID = ICON_ATK_UNABLE;
				break;
			case CardAbility.BUF_CURE:
				iconID = ICON_CURE;
				break;
			case CardAbility.BUF_SIDE:
				iconID = ICON_SIDE;
				break;
			default:
				iconID = ICON_X;
				break;
			}
			return iconID;
		}
		
		public static function getTarget(abilityId:int,me:BattleGuy,you:BattleGuy):Array{
			var targetArr:Array = [];
			var ability:CardAbility  = CardAbilityDB.getCardAbility(abilityId);
			if(ability==null)
				return null;
			switch(ability.which){
				case CardAbility.WHICH_MY:
					me.CardDB.getCardOnSlot([BattleFieldType.MyFightSlotId,BattleFieldType.MyHeroSlotId],targetArr);
					break;
				case CardAbility.WHICH_MYHERO:
					me.CardDB.getCardOnSlot([BattleFieldType.MyHeroSlotId],targetArr);
					break;
				case CardAbility.WHICH_MYSOLDIER:
					me.CardDB.getCardOnSlot([BattleFieldType.MyFightSlotId],targetArr);
					break;
				case CardAbility.WHICH_YOUR:
					you.CardDB.getCardOnSlot([BattleFieldType.MyFightSlotId,BattleFieldType.MyHeroSlotId],targetArr);
					break;
				case CardAbility.WHICH_YOURHERO:
					you.CardDB.getCardOnSlot([BattleFieldType.MyHeroSlotId],targetArr);
					break;
				case CardAbility.WHICH_YOURSOLDIER:
					you.CardDB.getCardOnSlot([BattleFieldType.MyFightSlotId],targetArr);
					break;
			}
			return targetArr;
		}
		
	}
}//package com.assist.data.mission 
