//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.data{
    import flash.display.*;

    public interface IBattleStage {
    function CardInfo(realID:int):Object;
		function CardMenuFlag(realID:int):Object;
		function AskCard2FightSlot(realID:int):Boolean;
		function AskCard2ResSlot(realID:int):Boolean;
		function AskTurnCard(realID:int):Boolean;
		function GetResNum(me:Boolean):int;
		function QueryEndOp():void;
		function DoQueryFight():void;
		function get FightTarget():Array;
		function InitialFight(realID:int):void;
		function AddFightTarget(realID:int):void;
    }
}//package com.assist.view.interfaces 
