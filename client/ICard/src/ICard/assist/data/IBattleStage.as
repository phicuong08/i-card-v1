//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.data{
    import flash.display.*;
    import flash.events.*;
    public interface IBattleStage {
    function CardInfo(realID:int):Object;
		function CardMenuFlag(realID:int):Object;
		function AskCard2FightSlot(realID:int):Boolean;
		function AskCard2ResSlot(realID:int):Boolean;
		function AskTurnCard(realID:int):Boolean;
		function AskCard2Skip():void;
		function GetResNum(me:Boolean):int;
		function QueryEndOp():void;
		function DoQueryFight(e:MouseEvent):Boolean;
		function get FightTarget():Array;
		function InitialFight(realID:int):void;
		function AddFightTarget(realID:int):void;
		function getAbilityTarget(id:int):Array;
		function getActiveTarget():Array;
    }
}//package com.assist.view.interfaces 
