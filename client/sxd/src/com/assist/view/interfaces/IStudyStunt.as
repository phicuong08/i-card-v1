//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IStudyStunt {

        function get content():MovieClip;
        function set playerLevel(_arg1:int):void;
        function set playerSeat(_arg1:Sprite):void;
        function set iconUrl(_arg1:String):void;
        function set onClose(_arg1:Function):void;
        function set onStudyStunt(_arg1:Function):void;
        function set onReturnTown(_arg1:Function):void;
        function set tip(_arg1:ITip):void;
        function clear():void;
        function init():void;
        function renderPlayerStuntInfo(_arg1:Array, _arg2:Array, _arg3:Object):void;
        function renderPlayStudyStunt(_arg1:Array, _arg2:Array, _arg3:Object, _arg4:String):void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Number, _arg6:Number):void;

    }
}//package com.assist.view.interfaces 
