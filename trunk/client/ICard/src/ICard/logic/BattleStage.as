//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.datas.*;
	import flash.utils.*;
	public class BattleStage {
		private var _guy:Dictionary;
		private var _myID:int;
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
				if(o["mine"]=true)
						_myID = newGuy.ID;
				_guy[newGuy.ID] =newGuy;
			}
		}
		public function get PlayerMe():BattleGuy{
			return _guy[_myID];
		}
		public function ResetCards(guyId:int):void{
			if(_guy[guyId])
				_guy[guyId].ResetCards();
		}
		public function UpdateCards(guyId:int,info:Array):void{
			if(_guy[guyId])
				_guy[guyId].UpdateCards(info);
		}
		
		public function Card2Fight(realID:int):Boolean{
			var card:CardData = PlayerMe.CardDB.FindCard(realID);
			if(!card)
				return false;
			if(!UseCard.UseAble(card,PlayerMe.CardDB.ResNum())	
				return false;
		
		}
		public function Card2Res(realID:int):Boolean{
		
		}
	}
}//package com.assist.data.mission 
