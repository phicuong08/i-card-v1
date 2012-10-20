//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import ICard.assist.data.IBattleStage;
    
    import flash.display.*;
	

    public interface IBattleField {
      function get content():MovieClip;
			function set tip(_arg1:ITip):void;
			function set BattleStage(arg1:IBattleStage):void;
			function FindCard(realID:int):MovieClip;
			function Add2Slot(slotId:int,card:MovieClip,cardInfo:Object):void;
			function RemoveCard(realID:int):void;
			function SideCard(info:Object):void; //横置,重置
			function LoopFresh(myLoop:Boolean,secNum:int):void;
			function onCardExOp(realID:int,abilityId:int):void;
			function onEndOpOk():void;
			function PriFresh(myLoop:Boolean,secNum:int):void;
			function set onFight(_arg1:Function):void;
	}
}//package com.assist.view.interfaces 
