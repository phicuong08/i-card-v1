//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import com.assist.view.info.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.interfaces.base.*;
    
    import flash.display.*;
    import flash.events.*;

    public interface IMap extends IContent {

        function clear():void;
        function initMapinfo(_arg1:MapInfo):void;
        function set backSWF(_arg1:IMapSWF):void;
        function set backMini(_arg1:DisplayObject):void;
        function addPlayer(_arg1:PlayerInfo):void;
        function removePlayer(_arg1:int):void;
        function moveToPlayer(_arg1:int, _arg2:int, _arg3:int):void;
        function movePlayer(_arg1:int, _arg2:int, _arg3:int):void;
        function playerSay(_arg1:int, _arg2:Object, _arg3:int):void;
        function addMonster(_arg1:MonsterInfo):void;
        function removeMonster(_arg1:int):void;
        function addPortal(_arg1:PortalInfo):void;
        function addNPC(_arg1:NPCInfo):void;
        function updateNpcLoack(_arg1:int):void;
        function addBuild(_arg1:BuildInfo):void;
        function setBuildGetVisible(_arg1:int, _arg2:Boolean):void;
        function stop():void;
        function addOtherFlash(_arg1:String, _arg2:Sprite, _arg3:int, _arg4:int):void;
        function removeOtherFlash(_arg1:String):void;
        function passClick(_arg1:MouseEvent):void;
        function showQuestOk():void;
        function showQuestAdd():void;
        function showLevelUp():void;
        function showEffort():void;
        function updateBodyUrl(_arg1:int):void;
        function reposition():void;
        function getMapWarBG():BitmapData;
        function showTextEffect(_arg1:String, _arg2:uint):void;
        function showFollow(_arg1:int, _arg2:int):void;
        function set onMoveTo(_arg1:Function):void;
        function set onUpdateXY(_arg1:Function):void;
        function updatePracticePanel():void;
        function set onCancelPraceice(_arg1:Function):void;
        function set onGoonPraceice(_arg1:Function):void;
        function set onPracticeAction(_arg1:Function):void;
        function set onPracticeSpeed(_arg1:Function):void;
        function get practiceBtnSpeed1():DisplayObject;
        function get practiceBtnSpeed24():DisplayObject;
        function get inMove():Boolean;
        function updatePetLv(_arg1:int, _arg2:int):void;

    }
}//package com.assist.view.interfaces.map 
