//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface INPCDialog {

        function get content():Sprite;
        function set iconUrl(_arg1:String):void;
        function set data(_arg1:Array):void;
        function set npcId(_arg1:int):void;
        function get npcId():int;
        function set npcSign(_arg1:String):void;
        function set npcName(_arg1:String):void;
        function set npcMessage(_arg1:String):void;
        function set npcFeature(_arg1:String):void;
        function set npcSlaveFeature(_arg1:String):void;
        function set featureNPCTalk(_arg1:Array):void;
        function set slaveFeatureNPCTalk(_arg1:Array):void;
        function set onClose(_arg1:Function):void;
        function set onFeature(_arg1:Function):void;
        function set onSlaveFeature(_arg1:Function):void;
        function set onAccept(_arg1:Function):void;
        function set onComplete(_arg1:Function):void;
        function set onAcceptNextForGuide(_arg1:Function):void;
        function set onAcceptLastForGuide(_arg1:Function):void;
        function show():void;
        function clear():void;

    }
}//package com.assist.view.interfaces 
