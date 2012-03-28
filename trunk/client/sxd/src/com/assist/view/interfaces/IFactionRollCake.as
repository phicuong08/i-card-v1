//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface IFactionRollCake {

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
        function allszAgain():void;
        function set getFactionRollCakeInfo(_arg1:Object):void;
        function set onShowMouse(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
