//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface ITravelEvent {

        function get content():MovieClip;
        function set onSureClick(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function set getClearIngo(_arg1:int):void;
        function set eventInfo(_arg1:Object):void;
        function set awardInfo(_arg1:String):void;
        function set onAutoClear(_arg1:Function):void;
        function close():void;
        function set visibleIngot(_arg1:Boolean):void;

    }
}//package com.assist.view.interfaces 
