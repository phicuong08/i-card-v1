//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface ITakeBibleReady {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set onClose(_arg1:Function):void;
        function set drag(_arg1:IDrag):void;
        function set inspireInfo(_arg1:int):void;
        function set onSure(_arg1:Function):void;
        function set awardState(_arg1:Number):void;
        function set onCancel(_arg1:Function):void;
        function set isUserProtection(_arg1:int):void;
        function set vipLevel(_arg1:int):void;
        function init():void;
        function hasApplyFriend(_arg1:Boolean, _arg2:Boolean=false):void;
        function clear():void;
        function set onTip(_arg1:Function):void;
        function set onInspire(_arg1:Function):void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void;
        function set onSummon(_arg1:Function):void;
        function set onRefreshAngel(_arg1:Function):void;
        function set onStartEscort(_arg1:Function):void;
        function set escortStata(_arg1:int):void;
        function set changeRefreshPrice(_arg1:int):void;
        function set getEscortData(_arg1:Object):void;

    }
}//package com.assist.view.interfaces 
