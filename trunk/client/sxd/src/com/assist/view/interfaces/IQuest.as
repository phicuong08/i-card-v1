//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IQuest {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set hasTrace(_arg1:Boolean):void;
        function set abortVisible(_arg1:Boolean):void;
        function set onClose(_arg1:Function):void;
        function set onTrace(_arg1:Function):void;
        function set onAccepted(_arg1:Function):void;
        function set onAcceptable(_arg1:Function):void;
        function init():void;
        function openAcceptedLabel():void;
        function openAcceptableLabel():void;
        function renderAccepted(_arg1:Array):void;
        function renderAcceptable(_arg1:Array):void;
        function renderDetail(_arg1:Object):void;
        function set onDetail(_arg1:Function):void;
        function set onAccept(_arg1:Function):void;
        function set onComplete(_arg1:Function):void;
        function set onAbort(_arg1:Function):void;
        function set onWayFinding(_arg1:Function):void;
        function clear():void;
        function set acceptBtnVisible(_arg1:Boolean):void;

    }
}//package com.assist.view.interfaces 
