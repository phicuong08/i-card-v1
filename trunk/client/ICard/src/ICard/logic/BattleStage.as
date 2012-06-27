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
	
	public class BattleStage implements IBattleStage{
		private var _guy:Dictionary;
		private var _gameID:int;
		private var _myID:int;
		private var _fightLink:FightLink;
		private var _cardFightResultCallback:Function;
		private var _playerLoopFreshCallback:Function;
		private var _endOpOkCallback:Function;
		private var _preShowAction:Function;
		private var _enable2Res:Boolean;
		protected var _data:IData;
		private var _IsTurn:Boolean; //操作回合
		private var _fightSrc:int;
		private var _fightDes:Array;
		private static var _obj:BattleStage;
		public function BattleStage():void{
			_enable2Res = false;
			_cardFightResultCallback = new Function;
			_playerLoopFreshCallback = new Function;
			_endOpOkCallback = new Function;
		}
		
		public function settle(arg1:IData):void{
			_data = (arg as IData);
		}
		
		public static function getInstance():BattleStage{
			if (!_obj){
				_obj = new (BattleStage)();
			};
			return (_obj);
		}
		
		public function set EndOpOkCallback(arg1:Function):void{
			_endOpOkCallback = arg1;
		}
		
		public function set PreShowActionCallback(arg1:Function):void{
			_preShowAction = arg1;
		}
		
		public function set CardFightResultCallback(arg1:Function):void{
			_cardFightResultCallback = arg1;
		}
		
		public function set PlayerLoopFreshCallback(arg1:Function):void{
			_playerLoopFreshCallback = arg1;
		}
		
		public function InitGuy(me:int,you:int,gameID:int):void{
			_guy = new Dictionary;
			_myID = me;
			_gameID = gameID;
			_guy[me] = new BattleGuy(me,true);
			_guy[you] = new BattleGuy(you,false);
			_fightLink = new FightLink;
		}
		public function get GameID():int{
			return _gameID;
		}
		public function get PlayerMe():BattleGuy{
			return _guy[_myID];
		}
		public function get Enemy():BattleGuy{
			for each(var guy:BattleGuy in _guy){
				if(guy.ID != _myID){
					return guy;
				}
			}
			return null;
		}
		public function get FightTarget():Array{
			var guy:BattleGuy  = Enemy;
			if(guy==null)
				return null;
			return guy.CardDB.getFightTarget();
		}
		public function onUpdateCard(info:Object):void{
			var fullCard:Object = FullCardInfo(info);
			if(fullCard==null)
				return;
			if(_guy[info["playerID"]])
				_guy[info["playerID"]].onUpdateCard(fullCard);
			if(info["slot"] && info["slot"]==BattleFieldType.MyResourceSlotId)
				_enable2Res = false;

		}
		
		private function CopyCardData(fillCard:Object,realID:int):void{
			var cardObj:Object = FindCard(realID);
			UseCard.CopyCardData(fillCard,cardObj);
		}
		
		private function FullCardInfo(info:Object):Object{
			var fillCard:Object = CardType.CreateCardInfo(info["cardID"]);
			CopyCardData(fillCard,info["realID"]);
			CardData.copyObject(fillCard,info);
			return fillCard;
		}
			
		public function onCardFight(fightInfo:Object,targets:Array):void{
			var srdID:int = fightInfo["srcID"];
			var defender:int = fightInfo["player"];
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
		public function FindCardOwner(realID:int):int{
			for each(var guy:BattleGuy in _guy)
			{
				var card:CardData = guy.CardDB.FindCard(realID);
				if(card)
				{
					return guy.ID;
				}
			}
			return 0;
		}
		public function FindCard(realID:int):Object{
			var cardInfo:Object = new Object;
			for each(var guy:BattleGuy in _guy)
			{
				var card:CardData = guy.CardDB.FindCard(realID);
				if(card)
				{
					cardInfo["card"]=card;
					cardInfo["guy"]=guy.ID;
					return cardInfo;
					
				}
			}
			return null;
		}
		public function onEndOpOK():void{
			_IsTurn = false;
			_endOpOkCallback();
		}
		public function PlayerLoopFresh(playerID:int,secNum:int):void{  //回合转换
			_playerLoopFreshCallback(playerID==_myID,secNum);	
			_IsTurn = (playerID==_myID)?true:false;
			if(_IsTurn)
				_enable2Res = true;
		}
		public function get _Mod_Battle():Mod_Battle{
			return (_data._Mod_Battle as Mod_Battle);
		}
		public function CardMenuFlag(realID:int):Object{
			var cardInfo:Object =  FindCard(realID);
			if(!cardInfo || cardInfo["guy"]!=_myID ||(_IsTurn==false))
				return null;
			return UseCard.genMenuFlag(cardInfo,_enable2Res,PlayerMe.CardDB.ResNum());
		}
		public function CardInfo(realID:int):Object{
			var cardObj:Object = FindCard(realID);
			if(!cardObj)
				return null;
			var	card:CardData = cardObj["card"] as CardData;
			if(!card)
				return null;
			return card.Info;
		}
		public function GetResNum(me:Boolean):int{
			if(!PlayerMe)
				return 0;
			if(me)
				return PlayerMe.CardDB.ResNum();
			else{
				for each(var guy:BattleGuy in _guy){
					if(guy.ID!=_myID)
						return guy.CardDB.ResNum();
				}
			}
			return 0;
		}
		public function QueryEndOp():void{
			if(DoQueryFight()==true)
				return;
			_Mod_Battle.QueryEndOp();
		}
		public function InitialFight(realID:int):void{
			_fightSrc = realID;
			_fightDes = [];
		}
		public function AddFightTarget(realID:int):void{
			_fightDes.push(realID);
		}
		public function DoQueryFight():Boolean{
			if(_fightDes==null || _fightDes.length==0){
				return false;
			}
			_Mod_Battle.QueryCardAtk(_fightSrc,_fightDes);
			return true;
		}
		
		public function PriPlayerLoop(playerID:int,secNum:int):void{
			_endOpOkCallback();
		}
				
		public function PreShowAction(srcID:int,actionType:int,targetArr:Array):void{
			var cardArr:Array = [];
			var srcCard:Object = new Object;
			var srcOwner:int = FindCardOwner(srcID);
			var targetOwner:int = 0;
			CopyCardData(srcCard,srcID);
			cardArr.push(srcCard);
			for each(var targetId:int in targetArr){
				var cardObj:Object = new Object;
				CopyCardData(cardObj,targetId);
				cardArr.push(cardObj);
				if(targetOwner==0)
					targetOwner = FindCardOwner(targetId);
			}
			_preShowAction(srcID,cardArr, (srcOwner!=targetOwner));
		}
		
	}
}//package com.assist.data.mission 
