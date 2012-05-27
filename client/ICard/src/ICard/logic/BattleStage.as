//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.Data;
	import ICard.SFSMod.*;
	import ICard.SFSMod.Mod_Battle;
	import ICard.assist.data.*;
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.*;
	import ICard.datas.card.*;
	
	import flash.utils.*;
	
	public class BattleStage {
		private var _guy:Dictionary;
		private var _myID:int;
		private var _fightLink:FightLink;
		private var _cardFightResultCallback:Function;
		private var _playerLoopFreshCallback:Function;
		private var _enable2Res:Boolean;
		protected var _data:IData;
		private var _IsTurn:Boolean; //操作回合
		private static var _obj:BattleStage;
		public function BattleStage():void{
			_enable2Res = false;
			_cardFightResultCallback = new Function;
			_playerLoopFreshCallback = new Function;
		}
		public function settle(arg:Data):void{
			_data = (arg as IData);
		}
		public static function getInstance():BattleStage{
			if (!_obj){
				_obj = new (BattleStage)();
			};
			return (_obj);
		}
		public function set CardFightResultCallback(arg1:Function):void{
			_cardFightResultCallback = arg1;
		}
		public function set PlayerLoopFreshCallback(arg1:Function):void{
			_playerLoopFreshCallback = arg1;
		}
		public function InitGuy(me:int,you:int):void{
			_guy = new Dictionary;
			_myID = me;
			_guy[me] = new BattleGuy(me,true);
			_guy[you] = new BattleGuy(you,false);
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
			var fullCard:Object = FullCardInfo(info);
			if(fullCard==null)
				return;
			if(_guy[info["playerID"]])
				_guy[info["playerID"]].onUpdateCard(fullCard);
		}
		private function FullCardInfo(info:Object):Object{
			var fillCard:Object = CardType.CreateCardInfo(info["cardID"]);
			if(fillCard==null)
				return null;
			fillCard["realID"]= info["realID"];
			if(info["hp"])
				fillCard["hp"] = info["hp"];
			if(info["atk"])	
				fillCard["atk"] = info["atk"];
			if(info["def"])	
				fillCard["def"] = info["def"];
			if(info["side"])	
				fillCard["side"] = info["side"];	
			if(info["turn"])	
				fillCard["turn"] = info["turn"];
			if(info["slot"])	
				fillCard["slot"] = info["slot"];	
			return fillCard;
		}
			
		public function onCardFight(fightInfo:Object,targets:Array):void{
			var srdID:int = fightInfo["srcID"];
			var defender:int = fightInfo["defender"];
			var timeVal:int = fightInfo["time"];
			_fightLink.Add(srdID,targets);
			if(defender==_myID) //����
			{
					
			}
		}
		public function onCardFightResult(srcID:int,targets:Array):void{
			var oldCards:Array=[];
			var srcGuy:BattleGuy;
			var desGuy:BattleGuy;
			for each(var card:Object in targets){
				var cardOld:Object = FindCard(card["realID"]);
				if(cardOld)
					oldCards.push(cardOld["card"]);
				if( card["realID"] == srcID)
					srcGuy = card["guy"];
				else
					desGuy = card["guy"];
			}
			if(_cardFightResultCallback!=null)
				_cardFightResultCallback(srcID,targets,oldCards,(srcGuy!=desGuy));
		}

		public function AskCard2FightSlot(realID:int):Boolean{
			var card:CardData = PlayerMe.CardDB.FindCard(realID);
			if(!card)
				return false;
			if(!UseCard.UseAble(card,PlayerMe.CardDB.ResNum()))	
				return false;
			return UseCard.Card2FightSlot(card,_Mod_Battle);
		}
		public function AskCard2ResSlot(realID:int):Boolean{
			if(!_enable2Res)
				return false;
			_enable2Res = false;
			_Mod_Battle.QueryUpdateCard(realID,BattleFieldType.MyResourceSlotId);
			return true;
		}
		public function AskTurnCard(realID:int):Boolean{
			return true;
		}
		public function GetUISlot(cardInfo:Object):int{
			var card:CardData = PlayerMe.CardDB.FindCard(cardInfo["realID"]);
			if(card)
				return cardInfo["slot"];
			else
				return cardInfo["slot"] +6;
		}
		
		public function FindCard(realID:int):Object{
			var cardInfo:Object = new Object;
			for each(var guy:BattleGuy in _guy)
			{
				var card:CardData = guy.CardDB.FindCard(realID);
				if(card)
				{
					cardInfo["card"]=card;
					cardInfo["guy"]=guy;
					return cardInfo;
					
				}
			}
			return null;
		}
		private function onMyLoop():void{
			_enable2Res = true;
		}
		public function PlayerLoopFresh(playerID:int,secNum:int):void{  //回合转换
			ResetCards(playerID);
			_playerLoopFreshCallback(playerID==_myID,secNum);	
			_IsTurn = (playerID==_myID)?true:false;
		}
		public function get _Mod_Battle():Mod_Battle{
			return (_data._Mod_Battle as Mod_Battle);
		}
		public function CardMenuFlag(realID:int):Array{
			var cardInfo:Object =  FindCard(realID);
			if(!cardInfo || cardInfo["guy"]!=_myID ||(_IsTurn==false))
				return null;
			var flagArr:Array = new Array;
			flagArr[0] = UseCard.Is2ResAble(cardInfo["card"]);                             //资源
			flagArr[1] = UseCard.Is2EnterAble(cardInfo["card"],PlayerMe.CardDB.ResNum());  //进场
			flagArr[2] = UseCard.Is2FightAble(cardInfo["card"],PlayerMe.CardDB.ResNum());  //战斗  
			flagArr[3] = UseCard.IsTaskAble(cardInfo["card"],PlayerMe.CardDB.ResNum()); //任务
			flagArr[4] = UseCard.IsSkillAble(cardInfo["card"],PlayerMe.CardDB.ResNum()); //施法
			flagArr[5] = UseCard.IsTurnAble(cardInfo["card"],PlayerMe.CardDB.ResNum()); //施法
			return flagArr;
		}

	}
}//package com.assist.data.mission 
