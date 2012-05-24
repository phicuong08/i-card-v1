//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.display.*;
	

    public interface IBattleField {
      function get content():MovieClip;
			function set tip(_arg1:ITip):void;
			
			function set AskTurnCard(_arg1:Function):void;   //翻转卡，任务卡,英雄卡使用，
			function set AskCard2FightSlot(_arg1:Function):void;//卡进场
			function set AskCard2ResSlot(_arg1:Function):void;  //卡进资源 
			function FindCard(realID:int):MovieClip;
			function Add2Slot(slotId:int,card:MovieClip):void;
			function RemoveCard(realID:int):void;
			function SideCard(info:Object):void; //横置,重置
			function RunTest():void;
	}
}//package com.assist.view.interfaces 
