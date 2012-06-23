//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import ICard.assist.data.IBattleStage;
    
    import flash.display.*;
	

    public interface IBattleField {
      function get content():MovieClip;
			function set tip(_arg1:ITip):void;
			function set BattleStage(arg1:IBattleStage):void;
			function FindCard(realID:int):MovieClip;
			function Add2Slot(slotId:int,card:MovieClip):void;
			function RemoveCard(realID:int):void;
			function SideCard(info:Object):void; //横置,重置
			function LoopFresh(myLoop:Boolean,secNum:int):void;
			function onEndOpOk():void;
			function RunTest():void;
	}
}//package com.assist.view.interfaces 
