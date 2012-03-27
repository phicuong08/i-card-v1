//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IRedEnvelopes {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set onClose(_arg1:Function):void;
        function clear():void;
        function set onTip(_arg1:Function):void;
        function set onGetEnvelope(_arg1:Function):void;
        function getPackedList(_arg1:Array):void;
        function set lostTimeInfo(_arg1:String):void;

    }
}//package com.assist.view.interfaces 
