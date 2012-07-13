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
	import ICard.views.BattleFieldView;
	
	import flash.events.*;
	import flash.utils.*;
	
	public class BattleStage implements IBattleStage{
		private var _guy:Dictionary;
		private var _gameID:int;
		private var _myID:int;
		private var _lastPlayer:int;
		private var _enable2Res:Boolean;
		protected var _data:IData;
		private var _IsTurn:Boolean; //操作回合
		private var _fightSrc:int;
		private var _fightDes:Array;
		private static var _obj:BattleStage;
		private static var _battleField:BattleFieldView;

		
		public function BattleStage():void{
			_enable2Res = false;
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
				
		public function get FightTarget():Array{
			return BattleHelper.getFightTarget(_guy,_fightSrc,PlayerMe,Enemy);
		}
		
		public function onUpdateCard(info:Object):void{
			if(_guy[info["guy"]])
				_guy[info["guy"]].onUpdateCard(info);
			if(info["slot"] && info["slot"]==BattleFieldType.MyResourceSlotId)
				_enable2Res = false;

		}
		
		public function CreateCardInfo(cardID:int,realID:int):Object{
			return BattleHelper.CreateCardInfo(_guy,cardID,realID);
		}
		
		public function onCardFightResult(srcID:int,targets:Array):void{
			var oldCards:Array=[];
			var srcGuy:int = FindCardOwner(srcID);
			var desGuy:int;
			for each(var card:Object in targets){
				var cardOld:Object = BattleHelper.CloneCardInfo(_guy,card["realID"]); 
				oldCards.push(cardOld);
				
				if(card["realID"] != srcID)
					desGuy= FindCardOwner(card["realID"]);
			}
			_battleField.onCardFightResult(srcID,targets,oldCards,(srcGuy!=desGuy));
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
			if(cardInfo["slot"]==4)
				var abc:int=0;
			var card:CardData = PlayerMe.CardDB.FindCard(cardInfo["realID"]);
			if(card)
				return cardInfo["slot"];
			else
				return cardInfo["slot"] +6;
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
		public function PlayerLoopFresh(playerID:int,secNum:int):void{  //回合转换
			_lastPlayer = playerID;
			_battleField.onPlayerLoopFresh(playerID==_myID,secNum);	
			_IsTurn = (playerID==_myID)?true:false;
			if(_IsTurn)
				_enable2Res = true;
		}
		public function get _Mod_Battle():Mod_Battle{
			return (_data._Mod_Battle as Mod_Battle);
		}
		public function CardMenuFlag(realID:int):Object{
			var card:CardData =  FindCard(realID);
			if(!card || card.GuyID!=_myID ||(_IsTurn==false))
				return null;
			return UseCard.genMenuFlag(card,_enable2Res,PlayerMe.CardDB.ResNum());
		}
		
		public function CardInfo(realID:int):Object{
			return BattleHelper.CloneCardInfo(_guy,realID);
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
			_Mod_Battle.QueryEndOp();
		}
		public function InitialFight(realID:int):void{
			_fightSrc = realID;
			_fightDes = [];
		}
		public function AddFightTarget(realID:int):void{
			_fightDes.push(realID);
		}
		public function DoQueryFight(e:MouseEvent):Boolean{
			if(_fightDes==null || _fightDes.length==0){
				return false;
			}
			_Mod_Battle.QueryCardAtk(_fightSrc,_fightDes);
			return true;
		}
		public function PriPlayerLoop(playerID:int,secNum:int):void{
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
