//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.datas.*;
	
	public class BattleGuy {
		private var _data:BattleGuyData;
		private var _realID:int;

		
		public function BattleGuy(arg1:int):void{
			_realID = arg1;
			_data = new BattleGuyData;
		}
		public function get CardDB():BattleGuyData{
			return _data;
		}
		public function get ID():int{
			return _realID;
		}
		
		public function ResetCards():void{
			_data.ResetCards();
		}
		public function EmptyCards():void{
			_data.EmptyCards();
		}
		public function UpdateCard(info:Object):void{
			_data.UpdateCard(info);
		}
	
	}
}//package com.assist.data.mission 
