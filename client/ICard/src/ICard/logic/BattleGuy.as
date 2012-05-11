//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
			import ICard.datas.*;
			
			public class BattleGuy {
					private var _data:BattleGuyData;
					private var _realID:int;
					public function BattleGuy(arg1:Object):void{
							_realID = arg1["realID"];
					}
					public function get ID():int{
							return _realID;
					}
		
    }
}//package com.assist.data.mission 
