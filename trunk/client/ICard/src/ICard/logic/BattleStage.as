//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
			import ICard.datas.*;
			
			public class BattleStage {
					private var _guy:Dictionary;
					
					public function BattleStage():void{
					}
					
					public function InitGuy(guysInfo:Array):void{
							_guy = new Dictionary;
							for each(var o:Object in guysInfo)
							{
									var newGuy:BattleGuy = new BattleGuy(o);
									_guy[newGuy.ID] =newGuy;
							}
					}
		
		
    }
}//package com.assist.data.mission 
