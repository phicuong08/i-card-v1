//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.utils.*;

    public interface IDrag {

        function get targets():Dictionary;
        function set onMouseDown(_arg1:Function):void;
        function addTarget(_arg1:DisplayObject, _arg2:DisplayObject):void;
        function removeTarget(_arg1:DisplayObject):void;
        function toString():String;

    }
}//package com.assist.view.interfaces 
