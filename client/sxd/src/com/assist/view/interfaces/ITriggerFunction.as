//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface ITriggerFunction {

        function get content():MovieClip;
        function newFunction(_arg1:Array):void;
        function set onStart(_arg1:Function):void;
        function set triggerUrl(_arg1:String):void;
        function clear():void;

    }
}//package com.assist.view.interfaces 
