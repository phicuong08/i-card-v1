//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import com.assist.view.interfaces.base.*;

    public interface IArmsRecast extends IContent, IDragTitleBar {

        function initdropList1(_arg1:Array, _arg2:Object):void;
        function initdropList2(_arg1:Array, _arg2:Object):void;
        function set onSelect1(_arg1:Function):void;
        function set onSelect2(_arg1:Function):void;
        function set onOk(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function runAction():void;
        function get box1():Sprite;
        function get box2():Sprite;

    }
}//package com.assist.view.interfaces 
