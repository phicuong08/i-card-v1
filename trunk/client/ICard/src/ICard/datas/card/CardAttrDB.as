//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas.card {
	
	import flash.utils.Dictionary;
	import ICard.assist.server.CardType;
	public class CardAttrDB {
		private static var _AttrDict:Dictionary = new Dictionary;
		public static function getCardAttr(id:int):CardAttr{
			if(_AttrDict==null)
				_AttrDict = new Dictionary;
			
			if(_AttrDict[id]==null){
				var attr:CardAttr = new CardAttr(id);
				_AttrDict[id] = attr;
			}
			
			return _AttrDict[id];
		}
	}
}//package com.assist.server 
