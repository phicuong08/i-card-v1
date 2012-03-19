//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import flash.text.*;

    public interface IMissionMap extends IMap {

        function set onWar(_arg1:Function):void;
        function set onCancel(_arg1:Function):void;
        function set onGongLue(_arg1:Function):void;
        function addMonsters(_arg1:Array):void;
        function warClose(_arg1:Boolean):void;
        function gotoNearMonster():void;
        function set mapName(_arg1:String):void;
        function get TFmsg1():TextField;
        function get TFmsg2():TextField;

    }
}//package com.assist.view.interfaces.map 
