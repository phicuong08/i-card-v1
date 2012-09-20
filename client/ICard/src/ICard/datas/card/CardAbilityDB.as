//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas.card {
	
	import flash.utils.Dictionary;
	import ICard.assist.server.CardType;
	public class CardAbilityDB {
		private static var _AbilityDict:Dictionary = new Dictionary;
		public static function getCardAbility(id:int):CardAbility{
			if(_AbilityDict==null)
				_AbilityDict = new Dictionary;
			
		
			if(_AbilityDict[id]==null){
				var ability:CardAbility = new CardAbility(id);
				_AbilityDict[id] = ability;
			}
			
			return _AbilityDict[id];
		}
		public static function getCardBuf(id:int):CardAbility{
			var ability:CardAbility = getCardAbility(id);
			if(ability!=null &&ability.IsBuf())
				return ability;
			else
				return null;
		}
	}
}//package com.assist.server 
