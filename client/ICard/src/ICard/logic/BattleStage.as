//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.Data;
	import ICard.SFSMod.*;
	import ICard.SFSMod.Mod_Battle;
	import ICard.assist.data.*;
	import ICard.assist.cardTipHtml;
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.*;
	import ICard.datas.card.*;
	import ICard.views.BattleFieldView;
	
	import flash.events.*;
	import flash.utils.*;
	
	public class BattleStage implements IBattleStage{
		public static var state_play_null:int = 0;
		public static var state_play_res:int = 1;
		public static var state_play_card:int = 2;
		public static var state_play_card_ex:int = 3;//选目标
		
		private var _guy:Dictionary;
		private var _gameID:int;
		private var _myID:int;
		private var _lastPlayer:int;
		protected var _data:IData;
		private var _IsTurn:Boolean; //操作回合
		private var _fightSrc:int;
		private var _fightDes:Array;
		private var _curState:int;
		private static var _obj:BattleStage;
		private static var _battleField:BattleFieldView;

		
		public function BattleStage():void{
			_curState = state_play_null;
		}
		
		public function settle(arg1:IData,arg2:BattleFieldView):void{
			_data = (arg1 as IData);
			_battleField = arg2;
		}
		
		public static function getInstance():BattleStage{
			if (!_obj){
				_obj = new (BattleStage)();
			};
			return (_obj);
		}
			
		public function InitGuy(me:int,you:int,gameID:int):void{
			_guy = new Dictionary;
			_myID = me;
			_gameID = gameID;
			_guy[me] = new BattleGuy(me,true);
			_guy[you] = new BattleGuy(you,false);
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
		public function get TurnPlayer():BattleGuy{
			return (_IsTurn)?PlayerMe:Enemy;
		}
		public function getActiveTarget():Array{
			var arr:Array=[];
			if(_IsTurn==false)
				return arr;
			
			switch(_curState)
			{
				case state_play_res:
					PlayerMe.CardDB.getCardOnSlot([BattleFieldType.HandSlotId],arr);
					break;
				case state_play_card:
					PlayerMe.CardDB.getActiveCardOnSlot(PlayerMe.CardDB.ResNum,arr);
					break;
				case state_play_card_ex:
					break;
			}
			return AbilityHelper.filterActiveCard(PlayerMe.CardDB,Enemy.CardDB,arr);
		}
		public function get FightTarget():Array{
			return BattleHelper.getFightTarget(_guy,_fightSrc,PlayerMe,Enemy);
		}
		
		public function getAbilityTarget(id:int):Array{
			return AbilityHelper.getTarget(id,PlayerMe.CardDB,Enemy.CardDB);
		}
		
		public function onUpdateCard(info:Object):void{
			if(_guy[info["guy"]])
				_guy[info["guy"]].onUpdateCard(info);
		}
		
			
		public function onCardFightResult(srcID:int,targets:Array):void{
			var oldCards:Array=[];
			var srcGuy:int = FindCardOwner(srcID);
			var desGuy:int;
			for each(var card:Object in targets){
				var cardOld:Object = BattleHelper.CloneCardInfo(_guy,card["realID"]); 
				oldCards.push(cardOld);
				var cardOwner:int =  FindCardOwner(card["realID"]);
				if(_guy[cardOwner])
					_guy[cardOwner].onUpdateCard(card);
				
				if(card["realID"] != srcID)
					desGuy= cardOwner;
				var cardInfo:Object =CardType.CreateCardInfo(card["cardID"]);
				card["cost"] = cardInfo["cost"];
				
			}
			_battleField.onCardFightResult(srcID,targets,oldCards,(srcGuy!=desGuy));
		}

		public function AskCard2FightSlot(realID:int):Boolean{
			var card:CardData = PlayerMe.CardDB.FindCard(realID);
			if(!card)
				return false;
			_Mod_Battle.QueryEnterCard(card.RealID);
			return true;
		}
		
		public function AskCard2ResSlot(realID:int):Boolean{
			if(_curState!=state_play_res)
				return false;
			_curState = state_play_null;
			_Mod_Battle.QueryPlayRes(realID);
			return true;
		}
		public function AskCard2Skip():void{
			_Mod_Battle.QueryEndOp();
		}
		public function AskTurnCard(realID:int):Boolean{
			return true;
		}
		public function GetUISlot(cardInfo:Object):int{
			if(cardInfo["slot"]==4)
				var abc:int=0;
			var card:CardData = PlayerMe.CardDB.FindCard(cardInfo["realID"]);
			if(card)
				return cardInfo["slot"];
			else
				return cardInfo["slot"] +8;
		}
		
		public function FindCardOwner(realID:int):int{
			return BattleHelper.getCardOwner(_guy,realID);
		}
		
		public function FindCard(realID:int):CardData{
			return  BattleHelper.getCardData(_guy,realID);
		}
		
		public function onEndOpOK():void{
			_IsTurn = false;
			_battleField.onEndOpOk();
		}
		public function onCardExOp(playerID:int,card:int,ability:int):void{
			if(playerID==_myID)
			{
				_battleField.onCardExOp(card,ability);
			}
		}
		public function WaitPlayerCard(playerID:int,secNum:int):void{
			_curState = state_play_card;
			_IsTurn = (playerID==_myID)?true:false;
			_battleField.onResetPlayerLoop(playerID==_myID,secNum);
		}
		public function PlayerLoopFresh(playerID:int,secNum:int):void{  //回合转换
			_lastPlayer = playerID;
			_curState = state_play_res;
			_battleField.onPlayerLoopFresh(playerID==_myID,secNum);	
			_IsTurn = (playerID==_myID)?true:false;
		}
		public function get _Mod_Battle():Mod_Battle{
			return (_data._Mod_Battle as Mod_Battle);
		}
		public function CardMenuFlag(realID:int):Object{
			var card:CardData =  FindCard(realID);
			if(!card || card.GuyID!=_myID ||(_IsTurn==false))
				return null;
			var bAllyFightable:Boolean = AbilityHelper.IsSoldierFightable(PlayerMe.CardDB,Enemy.CardDB);
			return UseCard.genMenuFlag(card,_curState,PlayerMe.CardDB.ResNum,bAllyFightable);
		}
		
		public function getAttachHtml(realID:int):String{
			var info:String = "";
			var fillArr:Array = [];
			for each(var guy:BattleGuy in _guy){
				guy.CardDB.getAttachCard(realID,fillArr);
			}
			for each(var card:CardData in fillArr){
				info += card.Info["title"] + ","
			}
			if(info.length==0)
				return "";
			return cardTipHtml.CardAttachHtml(info);
		}
		public function CardInfo(realID:int):Object{
			return BattleHelper.CloneCardInfo(_guy,realID);
		}
		
		public function GetResNum(me:Boolean):int{
			if(!PlayerMe)
				return 0;
			if(me)
				return PlayerMe.CardDB.ResNum;
			else{
				for each(var guy:BattleGuy in _guy){
					if(guy.ID!=_myID)
						return guy.CardDB.ResNum;
				}
			}
			return 0;
		}
		public function QueryEndOp():void{
			_Mod_Battle.QueryEndOp();
		}
		public function InitialFight(realID:int):void{
			_fightSrc = realID;
			_fightDes = [];
			_curState = state_play_card_ex;
			var card:CardData =  FindCard(realID);
			if(card&& AbilityHelper.IsAOE(card.CardID)){
				_Mod_Battle.QueryFightCard(_fightSrc,null);
			}
		}
		public function AddFightTarget(realID:int):void{
			_fightDes.push(realID);
		}
		public function DoQueryFight(e:MouseEvent):Boolean{
			if(_fightDes==null || _fightDes.length==0){
				return false;
			}
			_Mod_Battle.QueryFightCard(_fightSrc,_fightDes);
			return true;
		}
		public function TurnPlayerLoop(playerID:int,secNum:int):void{
			_battleField.onEndOpOk();
			
			var newTurn:Boolean = (playerID==_myID)?true:false;
			_battleField.onPriPlayerLoop(newTurn,secNum,(_lastPlayer!=playerID));
			_IsTurn = newTurn;
			_lastPlayer = playerID;
		}
		public function PreShowAction(srcID:int,actionType:int,targetArr:Array):void{
			var cardArr:Array = [];
			var srcOwner:int = FindCardOwner(srcID);
			var targetOwner:int = 0;
			var srcCard:Object = BattleHelper.CloneCardInfo(_guy,srcID); 
			cardArr.push(srcCard);
			for each(var targetId:int in targetArr){
				var cardObj:Object = BattleHelper.CloneCardInfo(_guy,targetId); 
				cardArr.push(cardObj);
				if(targetOwner==0)
					targetOwner = FindCardOwner(targetId);
			}
			_battleField.onPreShowAction(srcID,cardArr, (srcOwner!=targetOwner));
		}
		
	}
}//package com.assist.data.mission 
