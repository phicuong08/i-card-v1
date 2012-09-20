//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.SFSMod.*;
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.*;
	import ICard.datas.card.*;
	
	import flash.utils.Dictionary;

	public class BattleHelper {
		
		public static function getCardOwner(guyDict:Dictionary,realID:int):int{
			for each(var guy:BattleGuy in guyDict)
			{
				var card:CardData = guy.CardDB.FindCard(realID);
				if(card)
				{
					return guy.ID;
				}
			}
			return 0;
		}
		public static function CreateCardInfo(guyDict:Dictionary,cardID:int,realID:int):Object{
			var card:CardData = getCardData(guyDict,realID);
			if(card!=null){
				return card.CloneInfo();
			}
			else{
				return CardType.CreateCardInfo(cardID);
			}
		}
		
		public static function CloneCardInfo(guyDict:Dictionary,realID:int):Object{
			var card:CardData = getCardData(guyDict,realID);
			if(card)
				return card.CloneInfo();
			else
				return null;
		}
		
		public static function getCardData(guyDict:Dictionary,realID:int):CardData{
			var cardInfo:Object = new Object;
			for each(var guy:BattleGuy in guyDict)
			{
				var card:CardData = guy.CardDB.FindCard(realID);
				if(card)
				{
					return card;
				}
			}
			return null;
		}
		private static function getCastTarget(card:CardData,me:BattleGuy,you:BattleGuy,fillArr:Array):void{
			if(UseCard.IsCast2MyHero(card.CardID))
				me.CardDB.getCardOnSlot([BattleFieldType.HeroSlotId],fillArr);
			if(UseCard.IsCast2MySoldier(card.CardID))
				me.CardDB.getCardOnSlot([BattleFieldType.FightSlotId],fillArr);
			if(UseCard.IsCast2YourHero(card.CardID))
				you.CardDB.getCardOnSlot([BattleFieldType.HeroSlotId],fillArr);
			if(UseCard.IsCast2YourSoldier(card.CardID))
				you.CardDB.getCardOnSlot([BattleFieldType.FightSlotId],fillArr);	
		}
	
		public static function getFightTarget(guyDict:Dictionary,srcID:int,me:BattleGuy,you:BattleGuy):Array{
			var targetArr:Array = [];
			var retArr:Array;
			var card:CardData = getCardData(guyDict,srcID);
			if(card==null)
				return null;
			switch(card.Type){
				case CardType.SoldierType:
				case CardType.HeroType:
					you.CardDB.getCardOnSlot([BattleFieldType.FightSlotId,BattleFieldType.HeroSlotId],targetArr);
					retArr = AbilityHelper.filterFightTarget(me.CardDB,you.CardDB,targetArr);
					break;
				case CardType.SkillType:
					getCastTarget(card,me,you,targetArr);
					retArr =  AbilityHelper.filterCastTarget(me.CardDB,you.CardDB,targetArr);
					break;
			}
			return retArr;
		}
	}
}//package com.assist.data.mission 
