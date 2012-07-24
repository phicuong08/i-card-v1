//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas.card {
	
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.haloer.data.*;
	import ICard.logic.UseCard;
	import flash.utils.ByteArray;

	public class CardData {
		public static const StateNormal:int = 0;
		public static const StateSide:int = 2;
		public static const StateTurn:int = 2;
		public static const MaxBufNum:int = 5;
		public var  _info:Object;
		public function CardData(info:Object):void{
			_info = info;
		}


		public function CloneInfo():Object{
			var ba:ByteArray = new ByteArray();
			ba.writeObject( _info );
			ba.position = 0;
			return (ba.readObject() as Object);
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
			if(info.hasOwnProperty("cardID")&& 
				CardID != info["cardID"])
			{
				var baseInfo:Object = CardType.CreateCardInfo(info["cardID"]);
				if(baseInfo)
				{
					_info = baseInfo;
				}
			}
			else{
				if(info.hasOwnProperty("hp"))
					_info["hp"] = info["hp"];
				if(info.hasOwnProperty("atk"))
					_info["atk"] = info["atk"];
				if(info.hasOwnProperty("def"))
					_info["def"] = info["def"];
				if(info.hasOwnProperty("cost"))
					_info["cost"] = info["cost"];
			}
			if(info.hasOwnProperty("realID"))
				_info["realID"] = info["realID"];
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
			UpdateBuf(info);
		}
		private function UpdateBuf(info:Object):void{
			for(var i:int=0;i<MaxBufNum;i++){
				var bufName:String = "buf" +i;
				if(info.hasOwnProperty(bufName))
					_info[bufName] = info[bufName];		
				else
					_info[bufName] = 0;
			}
		}
		public function IsBufDif(arg1:CardData):boolean{
			for(var i:int=0;i<MaxBufNum;i++){
				if(getBuf(i) !=arg1.getBuf(i))
					return true;
			}
			return false;
		}
		public function getBuf(index:int):int{
			var bufName:String = "buf" +i;
			if(_info.hasOwnProperty(bufName))
				return _info[bufName];
			else
				return 0;
		}
		public function Clone(arg1:CardData):void{
			_info = arg1.CloneInfo();
		}
		
		public function IsDead():Boolean{
			return (HP<=0);
		}

		public function get Type():int{
			return UseCard.getType(CardID); 
		}	
		
	}
}//package com.assist.data.mission 
