//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;
    import com.assist.view.interfaces.map.*;

    public interface IWorld {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set alert(_arg1:IAlert):void;
        function set logoVisible(_arg1:Boolean):void;
        function set onArrive(_arg1:Function):void;
        function set defaultTown(_arg1:String):void;
        function autoTown(_arg1:Array):void;
        function set townOpened(_arg1:Array):void;
        function set townAllowed(_arg1:Array):void;
        function set townInfo(_arg1:Array):void;
        function playerPosition(_arg1:String, _arg2:IWorldFrame):void;
        function set onClose(_arg1:Function):void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void;
        function clear():void;
        function close():void;

    }
}//package com.assist.view.interfaces 
