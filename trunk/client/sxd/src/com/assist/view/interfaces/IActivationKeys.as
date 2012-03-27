//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IActivationKeys {

        function get content():Sprite;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set nickName(_arg1:String):void;
        function set url(_arg1:String):void;
        function set webDomain(_arg1:String):void;
        function set onSuccess(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function set onDebug(_arg1:Function):void;
        function init():void;
        function clear():void;

    }
}//package com.assist.view.interfaces 
