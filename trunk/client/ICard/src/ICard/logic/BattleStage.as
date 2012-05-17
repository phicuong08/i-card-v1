//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.datas.*;
	import flash.utils.*;
	import ICard.datas.card.*;
	public class BattleStage {
		private var _guy:Dictionary;
		private var _myID:int;
		private var _fightLink:FightLink;
		private static var _obj:BattleStage;
		public function BattleStage():void{
		}
		
		public static function getInstance():BattleStage{
			if (!_obj){
				_obj = new (BattleStage)();
			};
			return (_obj);
		}
		public function InitGuy(me:int,you:int):void{
			_guy = new Dictionary;
			_myID = me;
			_guy[me] = new BattleGuy(me);
			_guy[you] = new BattleGuy(you);
			_fightLink = new FightLink;
		}
		public function get PlayerMe():BattleGuy{
			return _guy[_myID];
		}
		public function ResetCards(guyId:int):void{
			if(_guy[guyId])
				_guy[guyId].ResetCards();
		}
		public function onUpdateCard(info:Object):void{
			if(_guy[info["playerID"]])
				_guy[info["playerID"]].onUpdateCard(info);
		}
		public function onCardFight(fightInfo:Object,targets:Array):void{
			var srdID:int = fightInfo["srcID"];
			var defender:int = fightInfo["defender"];
			var timeVal = fightInfo["time"];
			_fightLink.Add(srdID,targets);
			if(defender==_myID) //·ÀÓù
			{
					
			}
		}
		
		public function InitDefend(playerID:int,timeVal:int):void{
		
		}
		public function Card2Fight(realID:int):Boolean{
			var card:CardData = PlayerMe.CardDB.FindCard(realID);
			if(!card)
				return false;
			if(!UseCard.UseAble(card,PlayerMe.CardDB.ResNum()))	
				return false;
			return true;
		
		}
		public function Card2Res(realID:int):Boolean{
			return true;
		}
	}
}//package com.assist.data.mission 
