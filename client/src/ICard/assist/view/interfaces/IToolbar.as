﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.view.interfaces.base.*;

    public interface IToolbar extends IContent {

        function init():void;
        function clear():void;
        function set vipLevel(_arg1:int):void;
        function set rechargeVisible(_arg1:Boolean):void;
        function set onPlayerIcon(_arg1:Function):void;
        function set nickName(_arg1:String):void;
        function set powerVisible(_arg1:Boolean):void;
        function health(_arg1:int, _arg2:int):void;
        function set ingot(_arg1:int):void;
        function set coins(_arg1:Number):void;
        function set PlayerInfo(_arg1:String):void;
        function set onPlayerIconOver(_arg1:Function):void;
        function power(_arg1:int, _arg2:int):void;
        function set onBuyPower(_arg1:Function):void;
        function set powerInfo(_arg1:Object):void;
        function set level(_arg1:int):void;
        function set onSoundControl(_arg1:Function):void;
        function set onDoubleRemoveBuff(_arg1:Function):void;
        function set removeBuff(_arg1:String):void;
        function soundMute(_arg1:Boolean):void;
        function set addBuff(_arg1:Object):void;
        function set visibleBuff(_arg1:Boolean):void;
        function updateExperience(_arg1:Number, _arg2:Number):void;
        function set onRecharge(_arg1:Function):void;
        function loadPlayerAvatar(_arg1:String):void;
        function set onOpenRune(_arg1:Function):void;
        function set runeVisible(_arg1:Boolean):void;
        function renderFunctionLink(_arg1:Object):void;
        function renderFunctionLinkBtnTip(_arg1:String, _arg2:String):void;
        function renderFunctionTextTip(_arg1:String, _arg2:String):void;
        function clearFunctionLink():void;
        function removeFunctionLink(_arg1:String):void;
        function setFunctionLinkPoint():void;
        function set onLinkTextClick(_arg1:Function):void;
        function set onLinkBtnClick(_arg1:Function):void;
        function get miniMap():IMiniMap;
        function set questTraceLink(_arg1:Function):void;
        function set questTraceTipVisible(_arg1:Boolean):void;
        function renderQuestTrace(_arg1:Object):void;
        function get questTraceContent():Sprite;
        function newFunctionBar(_arg1:Array, _arg2:Array):void;
        function getFunctionPoint(_arg1:String):Point;
        function set onEnd(_arg1:Function):void;
        function set onBody(_arg1:Function):void;
        function set onPack(_arg1:Function):void;
        function set onUpgrade(_arg1:Function):void;
        function set onDeploy(_arg1:Function):void;
        function set onResearch(_arg1:Function):void;
        function set onFate(_arg1:Function):void;
        function set onSealSoul(_arg1:Function):void;
        function set onQuest(_arg1:Function):void;
        function set onFriend(_arg1:Function):void;
        function set onFaction(_arg1:Function):void;
        function set onFarm(_arg1:Function):void;
        function set onPractice(_arg1:Function):void;
        function addPackFull():void;
        function removePackFull():void;
        function updatePackMessageXY():void;
        function switchBubble(_arg1:int):void;
        function set functionBarParent(_arg1:Sprite):void;
        function playFlowerRain(_arg1:String, _arg2:int, _arg3:int):void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void;
        function set tip(_arg1:ITip):void;
        function set alert(_arg1:IAlert):void;
        function set goodsIconUrl(_arg1:String):void;
        function set addonsUrl(_arg1:String):void;
        function set playerDataVisible(_arg1:Boolean):void;
        function get playerDataVisible():Boolean;
        function set functionLinkVisible(_arg1:Boolean):void;
        function get functionLinkVisible():Boolean;
        function set questTraceVisible(_arg1:Boolean):void;
        function get questTraceVisible():Boolean;
        function set functionBarVisible(_arg1:Boolean):void;
        function get functionBarVisible():Boolean;
        function set onClickIgnore(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
