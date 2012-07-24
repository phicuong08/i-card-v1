//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.server {
	
	import flash.utils.Dictionary;
	public class CardAbilityDB {
		private static var _AbilityDict:Dictionary = new Dictionary;
		public static function getCardAbility(id:int):CardAbility{
			if(_AbilityDict==null)
				_AbilityDict = new Dictionary;
			
			var info:Array = CardType.CardAbilityInfo(id);	
			if(info==null)
				return null;
			
			if(_AbilityDict[id]==null){
				var ability:CardAbility = new CardAbility(id);
				_AbilityDict[id] = ability;
			}
			
			return _AbilityDict[id];
		}
		
	}
}//package com.assist.server 
