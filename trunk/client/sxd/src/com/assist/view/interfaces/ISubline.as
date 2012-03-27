//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface ISubline {

        function get content():Sprite;
        function set onClose(_arg1:Function):void;
        function receive(_arg1:Array, _arg2:int):void;
        function set onSendLine(_arg1:Function):void;
        function clear():void;

    }
}//package com.assist.view.interfaces 
