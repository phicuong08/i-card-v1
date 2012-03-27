//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import com.assist.view.interfaces.base.*;

    public interface IArmsGold extends IContent, IDragTitleBar {

        function set onOk(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function set onSelect(_arg1:Function):void;
        function set onTip(_arg1:Function):void;
        function get mcBox():Sprite;
        function get btnHelp():DisplayObject;
        function playEffect():void;
        function initDropList(_arg1:Array, _arg2:Object):void;

    }
}//package com.assist.view.interfaces 
