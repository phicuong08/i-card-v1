//ս����
package ICard.logic {
	import ICard.datas.*;
	import ICard.datas.card.*;
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	
	public class FightLink {
		private var _cardLink:Array;
		public function FightLink():void{
				_cardLink = new Array;
		}
		
		public function Add(srcID:int,target:Array):void{
				var newNode:Object = new Object;
				newNode["srcID"] = srcID;
				newNode["target"] = target;
				_cardLink.push_back(newNode);
		}
		public function Clear():void{
				_cardLink = new Array;
		}
	}
}//package com.assist.data.mission 
