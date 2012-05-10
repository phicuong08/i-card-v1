//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.display.*;
	

    public interface IBattleField {
        	function get content():MovieClip;
			function set tip(_arg1:ITip):void;
			
			function set onCard2Fight(_arg1:Function):void;
			function set onCard2Res(_arg1:Function):void;
			
			function Add2Slot(slotId:int,card:MovieClip):void;
			function RemoveCard(slotId:int,realID:int):void;
			function SideCard(slotId:int,realID:int):void; //横置
			function RunTest():void;
	}
}//package com.assist.view.interfaces 
