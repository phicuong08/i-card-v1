//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IStrategy {

        function get content():MovieClip;
        function set showStrategyWar(_arg1:Function):void;
        function set drag(_arg1:IDrag):void;
        function set onClose(_arg1:Function):void;
        function clear():void;
        function renderPlayerList(_arg1:Array, _arg2:String):void;

    }
}//package com.assist.view.interfaces 
