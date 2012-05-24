//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.datas.*;
	
	public class BattleGuy {
		private var _data:BattleGuyData;
		private var _realID:int;
		private var _IsMe:Boolean;
		
		public function BattleGuy(arg1:int,meFlag:Boolean):void{
			_realID = arg1;
			_data = new BattleGuyData;
			_IsMe = meFlag;
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
		public function onUpdateCard(info:Object):void{
			_data.onUpdateCard(info);
		}
	
	}
}//package com.assist.data.mission 
