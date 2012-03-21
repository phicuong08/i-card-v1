//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface ILogin {

        function get content():Sprite;
        function set drag(_arg1:IDrag):void;
        function info(_arg1:String, _arg2:String, _arg3:String):void;
        function set onClose(_arg1:Function):void;
        function set onRecharge(_arg1:Function):void;
        function set onShowVIPInfo(_arg1:Function):void;
        function renderProgressBar(_arg1:int, _arg2:int, _arg3:int):void;
        function clear():void;

    }
}//package com.assist.view.interfaces 
