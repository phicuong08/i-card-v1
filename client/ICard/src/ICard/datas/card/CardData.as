//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas.card {
	
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.haloer.data.*;
	public class CardData {
		public static const StateNormal:int = 0;
		public static const StateSide:int = 2;
		public static const StateTurn:int = 2;
		
		public var _realID:int; //唯一id
		public var _cardID:int; //卡片id,
//		public var _bufDB:BufDB;  //挂着的buf
		public var _hp:int;  //负值为扣血量
		public var _atk:int;  //
		public var _def:int;  
		public var _side:Boolean;//横置
		public var _turn:Boolean;//翻转
		public var _slot:int;  //卡片所在槽 
		
		public function CardData():void{

		}
		public function get RealID():int{
			return _realID;
		}
		public function get Slot():int{
			return _slot;
		}
		public function ToObject():Object{
			return {"realID":_realID,"cardID":_cardID,
								"hp":_hp,"atk":_atk,"def":_def,"side":_side,"turn":_turn,"slot":_slot};
		}
		public function format(arg1:Object):void{
			_realID = arg1["realID"];
			_cardID = arg1["cardID"];
			_hp = arg1["hp"];
			_atk = arg1["atk"];
			_def = arg1["def"];
			_side = arg1["side"];
			_turn = arg1["turn"];
			_slot = arg1["slot"];
		}
		public function get HP():int{
			return _hp;
		}
		
		public function get Atk():int{
			return _atk;
		}
		public function get Def():int{
			return _def;
		}
		
		public function get Side():Boolean{
			return _side;
		}
		public function get Turn():Boolean{
			return _turn;
		}
		
		public function Clone(arg1:CardData):void{
			_realID = arg1._realID;
			_cardID = arg1._cardID;
			_hp = arg1._hp;
			_atk = arg1._atk;
			_def = arg1._def;
			_side = arg1._side;
			_turn = arg1._turn;
			_slot = arg1._slot;
		}
		public function IsDead():Boolean{
			return (_hp<=0);
		}
		
		//		public function GetAtk(void):int{
		//			var baseInfo:Object = CardType.GetCardBattleInfo(_realID);
		//			if(!baseInfo || !baseInfo["atk"])
		//				return 0;
		//			return (baseInfo["atk"] + _bufDB.AtkAdd());
		//		}
		//		public function GetDef(void):int{
		//			var baseInfo:Object = CardType.GetCardBattleInfo(_realID);
		//			if(!baseInfo || !baseInfo["def"])
		//				return 0;
		//			return (baseInfo["def"] + _bufDB.DefAdd());
		//		}
		//		public function GetBattleInfo():Object{
		//			var battleInfo:Object ={};
		//			var baseInfo:Object = CardType.GetCardBattleInfo(_realID);
		//			if(!baseInfo)
		//				retrun null;
		//			battleInfo["hp"] = baseInfo["hp"]+ _bufDB.HpAdd() + _hpAdd;
		//			battleInfo["atk"] = baseInfo["atk"]+ _bufDB.AtkAdd();
		//			battleInfo["def"] = baseInfo["def"]+ _bufDB.DefAdd();
		//		}
		
		//        public function format(_arg1:Array):void{
		//            var _local2:Object = {};
		//            oObject.list(_arg1, _local2, ["offX", "offY", "challenged", "warResult", "awardExp", "awardItems", "failureAwardItem", "debugInfo", "reportId"]);
		//            this.offset = [_local2["offX"], _local2["offY"]];
		//            this.challenged = _local2["challenged"];
		//            this.formatWarResult(_local2["warResult"][0]);
		//            this.awardExperiences = this.formatAwardExperiences(((_local2["awardExp"]) || ([])));
		//            this.awardItems = this.formatAwardItems(((_local2["awardItems"]) || ([])));
		//            this.failureAwardItem = this.formatAwardItems(((_local2["failureAwardItem"]) || ([])));
		//            this.debugInfo = ((_local2["debugInfo"]) || ([]));
		//            this.reportId = ((_local2["reportId"]) || (0));
		//        }
		
	}
}//package com.assist.data.mission 
