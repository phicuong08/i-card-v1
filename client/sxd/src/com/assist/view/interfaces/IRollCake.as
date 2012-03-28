//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface IRollCake {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set onClose(_arg1:Function):void;
        function init():void;
        function clear():void;
        function set onTip(_arg1:Function):void;
        function reposition(_arg1:Point):void;
        function set onSound(_arg1:Function):void;
        function getMainSzData(_arg1:Object, _arg2:Boolean):void;
        function set onGetRoll(_arg1:Function):void;
        function set isFirst(_arg1:Boolean):void;
        function set szAgainForId(_arg1:int):void;
        function allszAgain():void;
        function set onRobelRedirection(_arg1:Function):void;
        function set onSureAward(_arg1:Function):void;
        function set getCountNum(_arg1:int):void;
        function set getSkill(_arg1:int):void;
        function set getStatePoing(_arg1:int):void;
        function set getFreeRobeNum(_arg1:int):void;
        function set getRobeMaxNum(_arg1:int):void;
        function set isVip4(_arg1:Boolean):void;
        function set isVip10(_arg1:Boolean):void;
        function set onUserRobel(_arg1:Function):void;
        function set onShowMouse(_arg1:Function):void;
        function set sureTip(_arg1:String):void;
        function userRobel():void;
        function set onAuto(_arg1:Function):void;
        function set isAuto(_arg1:Boolean):void;

    }
}//package com.assist.view.interfaces 
