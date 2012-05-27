//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas.card {
	
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.haloer.data.*;
	public class CardData {
		public static const StateNormal:int = 0;
		public static const StateSide:int = 2;
		public static const StateTurn:int = 2;
		

		public var _targetArr:Array;
		public var _info:Object;
		public function CardData(info:Object):void{
			_info = info;
		}
	

	/*	
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
	*/	
		public function get Info():Object{
			return _info;
		}
		public function set RealID(val:int):void{
			_info["realID"] = val;
		}
		public function get RealID():int{
			return _info["realID"];
		}
		public function get CardID():int{
			return _info["cardID"];
		}
		public function set CardID(val:int):void{
			_info["cardID"] = val;
		}
		public function get Cost():int{
			return _info["cost"];
		}
		public function get Slot():int{
			return _info["slot"];
		}
		public function set Slot(val:int):void{
			_info["slot"]=val;
		}
		public function get HP():int{
			return _info["hp"];
		}
		public function set HP(val:int):void{
			_info["hp"]=val;
		}
		public function get Atk():int{
			return _info["atk"];
		}
		public function set Atk(val:int):void{
			_info["atk"] = val;
		}
		public function get Def():int{
			return _info["def"];
		}
		public function set Def(val:int):void{
			_info["def"] = val;
		}
		public function get Side():int{
			return _info["side"];
		}
		public function set Side(val:int):void{
			_info["side"] = val;
		}
		public function get Turn():int{
			return _info["turn"];
		}
		public function set Turn(val:int):void{
			_info["turn"]=val;
		}
		
		public function Clone(arg1:CardData):void{
			RealID = arg1.RealID;
			CardID = arg1.CardID;
			Slot = arg1.Slot;
			HP = arg1.HP;
			Atk = arg1.Atk;
			Def = arg1.Def;
			Side = arg1.Side;
			Turn = arg1.Turn;
		}
		public function IsDead():Boolean{
			return (HP<=0);
		}
		public function get Type():int{
				var ret:int=0;
				switch(CardID/1000)
				{
				case 30:
					ret = CardType.WeaponType;
					break;
				case 31:
					ret = CardType.DefType;
					break;
				case 21:
				case 22:
				case 23:
					ret = CardType.SoldierType;
					break;
				case 20:
					ret = CardType.HeroType;
					break;
				case 50:
					ret = CardType.SkillType;
					break;
				case 40:
					ret = CardType.TaskType;
					break;
			}
			return ret;
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
