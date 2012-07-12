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
				me.CardDB.getCardOnSlot([BattleFieldType.MyHeroSlotId],fillArr);
			if(UseCard.IsCast2MySoldier(card.CardID))
				me.CardDB.getCardOnSlot([BattleFieldType.MyFightSlotId],fillArr);
			if(UseCard.IsCast2YourHero(card.CardID))
				you.CardDB.getCardOnSlot([BattleFieldType.MyHeroSlotId],fillArr);
			if(UseCard.IsCast2YourSoldier(card.CardID))
				you.CardDB.getCardOnSlot([BattleFieldType.MyFightSlotId],fillArr);	
		}
		public static function getFightTarget(guyDict:Dictionary,srcID:int,me:BattleGuy,you:BattleGuy):Array{
			var targetArr:Array = [];
			var card:CardData = getCardData(guyDict,srcID);
			if(card==null)
				return null;
			switch(card.Type){
				case CardType.SoldierType:
				case CardType.HeroType:
					you.CardDB.getCardOnSlot([BattleFieldType.MyFightSlotId,BattleFieldType.MyHeroSlotId],targetArr);
					break;
				case CardType.SkillType:
					getCastTarget(card,me,you,targetArr);
					break;
			}
			return targetArr;
		}
	}
}//package com.assist.data.mission 
