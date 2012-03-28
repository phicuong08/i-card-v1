//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import flash.text.*;

    public interface IMissionMap extends IMap {

        function set onWar(_arg1:Function):void;
        function set onCancel(_arg1:Function):void;
        function set onGongLue(_arg1:Function):void;
        function set onSound(_arg1:Function):void;
        function set soundState(_arg1:int):void;
        function addMonsters(_arg1:Array):void;
        function warClose(_arg1:Boolean):void;
        function gotoNearMonster():void;
        function get tfName():TextField;
        function showWarSoul(_arg1:int, _arg2:Class, _arg3:Class):void;

    }
}//package com.assist.view.interfaces.map 
