//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas.card {
	
			import ICard.assist.view.controls.BattleFieldType;
			import ICard.haloer.data.*;
			import ICard.assist.server.CardType;
			public class CardData {
					public static const StateNormal:int = 0;
					public static const StateSide:int = 2;
					public static const StateTurn:int = 2;
					
					public var _realID:int; //唯一id
					public var _cardID:int; //卡片id,
					public var _bufDB:BufDB;  //挂着的buf
					public var _hpAdd:int;  //负值为扣血量
					public var _side:Boolean;//横置
					public var _turn;Boolean;//翻转
					public var _slot:int;  //卡片所在槽 
					
					public function CardData():void{
							_bufDB = new BufDB;
					}
					public function CardData(realID:int,cardID:int,slot:int,hpAdd:int=0,side:Boolean=false,turn:Boolean=false):void{
							_bufDB = new BufDB;
							_realID = realID;
							_cardID = cardID;
							_hpAdd = hpAdd;
							_side = side;
							_turn = turn;
							_slot = slot;
					}
					
					public function format(arg1:Object):void{
     					_realID = arg1["realID"];
     					_cardID = arg1["cardID"];
     					_bufDB = arg1["bufDB"];
     					_hpAdd = arg1["hpAdd"];
     					_side = arg1["side"];
     					_turn = arg1["turn"];
     					_slot = arg1["slot"];
     			}
     	
     			public function AddBuf(arg1:Array):void{
     					_bufDB.AddBuf(arg1);
     			}
     			
     			public function DelBuf(realID:int):void{
     					_bufDB.DelBuf(realID);
     			}
     			
     			public function AddHP(arg1:int):void{
     					_hpAdd = _hpAdd + arg1;
     			}
     			
     			public function IsDead(void):Boolean{
     					return (GetHP()<=0);
     			}
     			
     			public function GetHP(void):int{
     					var baseInfo:Object = CardType.GetCardBattleInfo(_realID);
     					if(!baseInfo || !baseInfo["hp"])
     							return 0;
     					return (baseInfo["hp"] + _bufDB.HpAdd() + _hpAdd);
     			}
     			public function GetAtk(void):int{
     					var baseInfo:Object = CardType.GetCardBattleInfo(_realID);
     					if(!baseInfo || !baseInfo["atk"])
     							return 0;
     					return (baseInfo["atk"] + _bufDB.AtkAdd());
     			}
     			public function GetDef(void):int{
     					var baseInfo:Object = CardType.GetCardBattleInfo(_realID);
     					if(!baseInfo || !baseInfo["def"])
     							return 0;
     					return (baseInfo["def"] + _bufDB.DefAdd());
     			}
     			public function GetBattleInfo():Object{
     					var battleInfo:Object ={};
     					var baseInfo:Object = CardType.GetCardBattleInfo(_realID);
     					if(!baseInfo)
     							retrun null;
     					battleInfo["hp"] = baseInfo["hp"]+ _bufDB.HpAdd() + _hpAdd;
     					battleInfo["atk"] = baseInfo["atk"]+ _bufDB.AtkAdd();
     					battleInfo["def"] = baseInfo["def"]+ _bufDB.DefAdd();
     			}

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
