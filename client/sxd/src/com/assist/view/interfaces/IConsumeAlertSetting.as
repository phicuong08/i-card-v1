//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IConsumeAlertSetting {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function init():void;
        function clear():void;
        function render(_arg1:Array):void;
        function renderSubmit():void;
        function set onClose(_arg1:Function):void;
        function set onSubmit(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
