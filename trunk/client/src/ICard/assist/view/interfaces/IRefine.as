//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import com.assist.view.interfaces.base.*;

    public interface IRefine extends IContent, IDragTitleBar {

        function showLianDan():void;
        function showLianZhi():void;
        function set itemMsg(_arg1:String):void;
        function set itemUrl(_arg1:String):void;
        function set itemNum(_arg1:int):void;
        function get itemBox():Sprite;
        function initList(_arg1:Array, _arg2:ITip, _arg3:int):void;
        function set onAutoMission(_arg1:Function):void;
        function set onLianZhi(_arg1:Function):void;
        function set onClose(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
