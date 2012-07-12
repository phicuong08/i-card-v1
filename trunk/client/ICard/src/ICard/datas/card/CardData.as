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

		public static function copyObject(obj1:Object,obj2:Object):void{
			if(obj2==null)
				return;
			obj1["realID"]= obj2["realID"];
			if(obj2.hasOwnProperty("guy"))
				obj1["guy"] = obj2["guy"];
			if(obj2.hasOwnProperty("cardID"))
				obj1["cardID"] = obj2["cardID"];
			if(obj2.hasOwnProperty("hp"))
				obj1["hp"] = obj2["hp"];
			if(obj2.hasOwnProperty("atk"))
				obj1["atk"] = obj2["atk"];
			if(obj2.hasOwnProperty("cost"))
				obj1["cost"] = obj2["cost"];
			if(obj2.hasOwnProperty("def"))	
				obj1["def"] = obj2["def"];
			if(obj2.hasOwnProperty("side"))	
				obj1["side"] = obj2["side"];	
			if(obj2.hasOwnProperty("turn"))
				obj1["turn"] = obj2["turn"];
			if(obj2.hasOwnProperty("slot"))	
				obj1["slot"] = obj2["slot"];
		}
		public function get Info():Object{
			return _info;
		}
		
		public function set RealID(val:int):void{
			_info["realID"] = val;
		}
		public function get RealID():int{
			return _info["realID"];
		}
		public function set GuyID(val:int):void{
			_info["guy"] = val;
		}
		public function get GuyID():int{
			return _info["guy"];
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
		public function set Cost(val:int):void{
			_info["cost"] = val;
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
		public function Update(info:Object):void{
			if(info.hasOwnProperty("cardID"))
				_info["cardID"] = info["cardID"];
			
			if(info.hasOwnProperty("guy"))
				_info["guy"] = info["guy"];
				
			if(info.hasOwnProperty("side"))
				_info["side"] = info["side"];
			
			if(info.hasOwnProperty("turn"))
				_info["turn"] = info["turn"];
			
			if(info.hasOwnProperty("slot"))
				_info["slot"] = info["slot"];
			
			if(info.hasOwnProperty("hp"))
				_info["hp"] = info["hp"];
			
			if(info.hasOwnProperty("atk"))
				_info["atk"] = info["atk"];
			
			if(info.hasOwnProperty("def"))
				_info["def"] = info["def"];
		}
		public function Clone(arg1:CardData):void{
		  GuyID = arg1.GuyID;
			RealID = arg1.RealID;
			CardID = arg1.CardID;
			Slot = arg1.Slot;
			HP = arg1.HP;
			Atk = arg1.Atk;
			Def = arg1.Def;
			Side = arg1.Side;
			Turn = arg1.Turn;
			Cost = arg1.Cost;
		}
		public function IsDead():Boolean{
			return (HP<=0);
		}
		public function get Type():int{
				var ret:int=0;
				var typeId:int = CardID/1000;
				switch(typeId)
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
