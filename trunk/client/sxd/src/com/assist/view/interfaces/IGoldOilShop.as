//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IGoldOilShop {

        function get content():MovieClip;
        function set onClose(_arg1:Function):void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function clear():void;
        function init():void;
        function renderGoldOilShop(_arg1:Array):void;
        function renderMyStatePoint(_arg1:int, _arg2:int):void;
        function set onConvert(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
