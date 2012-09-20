//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.SFSMod.*;
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.*;
	import ICard.datas.card.*;
	
	import flash.utils.Dictionary;

	public class CardAttrHelper {
		
		public static function IsExistAttr(cardID:int,val:int):Boolean{
			var attr:CardAttr = CardAttrDB.getCardAttr(cardID);
			if(attr==null)
				return false;
			return attr.IsExistAttr(val);
		}
	
	}
}//package com.assist.data.mission 
