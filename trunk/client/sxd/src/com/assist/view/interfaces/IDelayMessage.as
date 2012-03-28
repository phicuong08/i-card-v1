//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IDelayMessage {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set dialog(_arg1:IAlert):void;
        function set whenDelayMessageDialogShow(_arg1:Function):void;
        function set specialDelayMessage(_arg1:Function):void;
        function set removeNickNameSuffix(_arg1:Function):void;
        function init():void;
        function addMessage(_arg1:Object):void;
        function addOverrideMessage(_arg1:int):void;
        function reposition(_arg1:Number, _arg2:Number):void;

    }
}//package com.assist.view.interfaces 
