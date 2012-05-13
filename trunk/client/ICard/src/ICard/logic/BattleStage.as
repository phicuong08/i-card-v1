//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.datas.*;
	import flash.utils.*;
	public class BattleStage {
		private var _guy:Dictionary;
		private static var _obj:BattleStage;
		public function BattleStage():void{
		}
		
		public static function getInstance():BattleStage{
			if (!_obj){
				_obj = new (BattleStage)();
			};
			return (_obj);
		}
		public function InitGuy(guysInfo:Array):void{
			_guy = new Dictionary;
			for each(var o:Object in guysInfo)
			{
				var newGuy:BattleGuy = new BattleGuy(o);
				_guy[newGuy.ID] =newGuy;
			}
		}

		public function ResetCards(guyId:int):void{
			if(_guy[guyId])
				_guy[guyId].ResetCards();
		}
		public function UpdateCards(guyId:int,info:Array):void{
			if(_guy[guyId])
				_guy[guyId].UpdateCards(info);
		}
	}
}//package com.assist.data.mission 
