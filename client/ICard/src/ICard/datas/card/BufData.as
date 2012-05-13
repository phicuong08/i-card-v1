//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas.card {
	
    public class BufData {
		
		public var _realID:int; //唯一id
		public var _hpAdd:int;
		public var _atkAdd:int;
		public var _defAdd:int;
					
		public function BufData(arg1:Array):void{
				format(arg1);
		}
		
		public function format(arg1:Array):void{
				_realID = arg1[0];
				_hpAdd = arg1[1];
				_atkAdd = arg1[2];
				_defAdd = arg1[3];
		}
     
		public function get RealID():int{
				return _realID;
		}
		 public function get HpAdd():int{
				return _hpAdd;
		}
		public function get AtkAdd():int{
				return _atkAdd;
		}
		public function get DefAdd():int{
				return _defAdd;
		}

    }
}//package com.assist.data.mission 
