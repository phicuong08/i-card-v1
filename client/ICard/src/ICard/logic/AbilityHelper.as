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
			var iconID:int;
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
		public static function IsAOE(cardID:int):Boolean{
			var ability:CardAbility  = CardAbilityDB.getCardAbility(cardID*10);
			if(ability==null)
				return false;
			return ability.IsAOE();
		}
		public static function getTarget(abilityId:int,me:BattleGuyData,you:BattleGuyData):Array{
			var targetArr:Array = [];
			var ability:CardAbility  = CardAbilityDB.getCardAbility(abilityId);
			if(ability==null)
				return null;
			switch(ability.which){
				case CardAbility.WHICH_MY:
					me.getCardOnSlot([BattleFieldType.FightSlotId,BattleFieldType.HeroSlotId],targetArr);
					break;
				case CardAbility.WHICH_MYHERO:
					me.getCardOnSlot([BattleFieldType.HeroSlotId],targetArr);
					break;
				case CardAbility.WHICH_MYSOLDIER:
					me.getCardOnSlot([BattleFieldType.FightSlotId],targetArr);
					break;
				case CardAbility.WHICH_YOUR:
					you.getCardOnSlot([BattleFieldType.FightSlotId,BattleFieldType.HeroSlotId],targetArr);
					break;
				case CardAbility.WHICH_YOURHERO:
					you.getCardOnSlot([BattleFieldType.HeroSlotId],targetArr);
					break;
				case CardAbility.WHICH_YOURSOLDIER:
					you.getCardOnSlot([BattleFieldType.FightSlotId],targetArr);
					break;
			}
			return filterFightTarget(me,you,targetArr);
		}
		public static function filterCastTarget(me:BattleGuyData,you:BattleGuyData,arr:Array):Array{
			var filterArr:Array = [];
			
			for each( var card:CardData in arr)
			{
				var bAdd:Boolean = true;
				switch(card.Slot){
					case BattleFieldType.FightSlotId:
						bAdd = (card.IsPointUnable())?false:true;
						break;
					default:
						break;
				}
				if(bAdd)
					filterArr.push(card.RealID);
			}
			return filterArr;
		}
		public static function filterFightTarget(me:BattleGuyData,you:BattleGuyData,arr:Array):Array{
			var filterArr:Array = [];
			var bAllyEnable:Boolean = IsSoldierFightable(me,you);
			for each( var card:CardData in arr)
			{
				var bAdd:Boolean = true;
				switch(card.Slot){
					case BattleFieldType.FightSlotId:
						bAdd = bAllyEnable;
						break;
					default:
						break;
				}
				if(bAdd)
					filterArr.push(card.RealID);
			}
			return filterArr;
		}
		public static function IsSoldierFightable(me:BattleGuyData,you:BattleGuyData):Boolean{
			var bAllyEnable:Boolean = true;
			if(ExistDeckSupport(you,CardAbility.WHICH_SOLDIER,CardAbility.BUF_ATK_UNABLE)==true)
				bAllyEnable = false;
			if(ExistDeckSupport(me,CardAbility.WHICH_MYSOLDIER,CardAbility.BUF_ATK_UNABLE)==true)
				bAllyEnable = false;
			return bAllyEnable;
		}
		public static function ExistDeckSupport(deck:BattleGuyData,which:int,what:int):Boolean{
			var fillArr:Array = [];
			deck.getCardOnSlot( [BattleFieldType.SupportSlotId],fillArr);
			
			for each( var card:CardData in fillArr)
			{
				var ability:CardAbility  = CardAbilityDB.getCardAbility(card.CardID*10);
				if(ability==null)
					return false;
				if(ability.what !=what)
					continue;
				if(ability.IsWhichMatch(which))
					return true;
				
			}
			return false;
		}
		public static function filterActiveCard(me:BattleGuyData,you:BattleGuyData,arr:Array):Array{
			var filterArr:Array = [];
			var bAllyEnable:Boolean = true;
			if(ExistDeckSupport(you,CardAbility.WHICH_SOLDIER,CardAbility.BUF_ATK_UNABLE)==true)
				bAllyEnable = false;
			if(ExistDeckSupport(me,CardAbility.WHICH_MYSOLDIER,CardAbility.BUF_ATK_UNABLE)==true)
				bAllyEnable = false;
			for each( var card:CardData in arr)
			{
				var bAdd:Boolean = true;
				switch(card.Slot){
					case BattleFieldType.FightSlotId:
						bAdd = bAllyEnable;
						break;
					default:
						break;
				}
				if(bAdd)
					filterArr.push(card.RealID);
			}
			return filterArr;
		}
		
		public static function IsCardAbility(cardID:int,what:int):Boolean{
			return (getCardAbility(cardID,what)!=null);
		}
		public static function getCardAbility(cardID:int,what:int):CardAbility{
			for( var i:int=0;i<5;i++){
				var ability:CardAbility  = CardAbilityDB.getCardAbility(cardID*10 +i);
				if(ability==null)
					continue;
				if(ability.what == what)
					return ability;
			}
			return null;
		}
		public static function getHeroAbilityVal(guy:BattleGuyData,what:int):int{
			var val:int = 0;
			for each( var card:CardData in guy.GetCardArr())
			{
				if(card.Slot != BattleFieldType.EquipSlotId)
					continue;
				var ability:CardAbility = getCardAbility(card.CardID,what);
				if(ability)
					val = ability.getVal();
			}
			return val;
		}
		public static function IsCast2MyHero(cardID:int):Boolean{
			var ability:CardAbility = CardAbilityDB.getCardAbility(cardID*10);
			if(ability==null)
				return false;
			return ability.IsWhichMatch(CardAbility.WHICH_MYHERO);
		}
		public static function IsCast2MySoldier(cardID:int):Boolean{
			var ability:CardAbility = CardAbilityDB.getCardAbility(cardID*10);
			if(ability==null)
				return false;
			return ability.IsWhichMatch(CardAbility.WHICH_MYSOLDIER);
		}
		public static function IsCast2YourHero(cardID:int):Boolean{
			var ability:CardAbility = CardAbilityDB.getCardAbility(cardID*10);
			if(ability==null)
				return false;
			return ability.IsWhichMatch(CardAbility.WHICH_YOURHERO);
		}
		public static function IsCast2YourSoldier(cardID:int):Boolean{
			var ability:CardAbility = CardAbilityDB.getCardAbility(cardID*10);
			if(ability==null)
				return false;
			return ability.IsWhichMatch(CardAbility.WHICH_YOURSOLDIER);
		}
		public static function getCastTargetNum(cardID:int):int{
			var ability:CardAbility = CardAbilityDB.getCardAbility(cardID*10);
			if(ability==null)
				return 0;
			return ability.targetNum;
		}
	}
}//package com.assist.data.mission 
