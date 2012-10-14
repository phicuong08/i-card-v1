//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.SFSMod.*;
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.*;
	import ICard.datas.card.*;
	
	import flash.utils.Dictionary;

	public class AttachCardHelper {
		
		public static function fillAttachCard(realID:int,guyDict:Dictionary,fillArr:Array):void{
			for each(var guy:BattleGuy in guyDict){
				for each( var card:CardData in guy.CardDB)
				{
					if(card.Slot != BattleFieldType.AttachSlotId)
						continue;
					if(card.AttachTo ==realID)
						fillArr.push(card);
				}
			}
		}
		public static function ExistAbility(realID:int,what:int):Boolean{
			
			for each(var guy:BattleGuy in BattleStage.getInstance().GuyDict){
				for each( var card:CardData in guy.CardDB)
				{
					if(card.Slot != BattleFieldType.AttachSlotId)
						continue;
					if(card.AttachTo!=realID)
						continue;
					if(AbilityHelper.IsCardAbility(card.CardID,what))
						return true;
				}
			}

			return false;
		}
		
	
	}
}//package com.assist.data.mission 
