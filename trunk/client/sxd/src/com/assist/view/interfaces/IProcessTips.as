//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface IProcessTips {

        function get content():Sprite;
        function set visible(_arg1:Boolean):void;
        function set oParent(_arg1:Sprite):void;
        function set onClose(_arg1:Function):void;
        function set onAction(_arg1:Function):void;
        function render(_arg1:Object):void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void;

    }
}//package com.assist.view.interfaces 
