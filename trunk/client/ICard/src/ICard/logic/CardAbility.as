//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {

	import ICard.assist.server.CardType;
	
	import flash.utils.Dictionary;
	public class CardAbility {
		public static const WHICH_NULL:int = 0;
		public static const WHICH_MY:int = 1;
		public static const WHICH_MYHERO:int = 2;
		public static const WHICH_MYSOLDIER:int = 3;
		public static const WHICH_YOUR:int = 4;
		public static const WHICH_YOURHERO:int = 5;
		public static const WHICH_YOURSOLDIER:int = 6;
		private var _id:int;
		private var _info:Array;
		
		public function CardAbility(id:int){
			_id = id;
			_info = CardType.CardAbilityInfo(id);
		}
		
		public function get CardID():int{
			return _id/10;
		}
		public function get targetNum():int{
			if(_info==null)
				return 0;
			else
				return _info[7];
		}
		public function get which():int{
			if(_info[1]=="WHICH_MY")
				return WHICH_MY;
			else if(_info[1]=="WHICH_MYHERO")
				return WHICH_MYHERO;
			else if(_info[1]=="WHICH_MYSOLDIER")
				return WHICH_MYSOLDIER;	
			else if(_info[1]=="WHICH_YOUR")
				return WHICH_YOUR;
			else if(_info[1]=="WHICH_YOURSOLDIER")
				return WHICH_MYSOLDIER;	
			else if(_info[1]=="WHICH_YOURHERO")
				return WHICH_YOURHERO;
			else
				return WHICH_NULL;	
		}
	}
}//package com.assist.data.mission 
