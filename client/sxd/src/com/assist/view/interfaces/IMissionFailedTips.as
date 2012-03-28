//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface IMissionFailedTips {

        function get content():MovieClip;
        function clear():void;
        function set onClose(_arg1:Function):void;
        function renderImages(_arg1:Array, _arg2:Array):void;
        function set onFunctionOpen(_arg1:Function):void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void;

    }
}//package com.assist.view.interfaces 
