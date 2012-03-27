//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IFactionBlessing {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set onTextLink(_arg1:Function):void;
        function set onCloseBtn(_arg1:Function):void;
        function set onIncenseBtn(_arg1:Function):void;
        function render():void;
        function clear():void;
        function renderGod(_arg1:Object):void;
        function renderRecordList(_arg1:Array):void;

    }
}//package com.assist.view.interfaces 
