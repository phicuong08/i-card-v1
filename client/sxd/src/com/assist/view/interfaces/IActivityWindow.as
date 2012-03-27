//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IActivityWindow {

        function get content():MovieClip;
        function set buttonEffect(_arg1:Class):void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set onClose(_arg1:Function):void;
        function moveFileInfo(_arg1:String, _arg2:String):void;
        function set onStartActivity(_arg1:Function):void;
        function set onIsCheck(_arg1:Function):void;
        function set activityList(_arg1:Array):void;
        function set activityUrl(_arg1:String):void;
        function clear():void;

    }
}//package com.assist.view.interfaces 
