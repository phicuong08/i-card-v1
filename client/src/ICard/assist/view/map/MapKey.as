//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.map {
    import flash.events.*;
    import flash.display.*;

    public final class MapKey {

        public static const W:int = 87;
        public static const A:int = 65;
        public static const S:int = 83;
        public static const D:int = 68;
        public static const Space:int = 32;
        public static const RIGHT:int = 39;
        public static const LEFT:int = 37;
        public static const DOWN:int = 40;
        public static const UP:int = 38;
        public static const Event_KeyChange:String = "Event_KeyChange";
        public static const Event_ACTIVATE:String = "Event_ACTIVATE";
        public static const Event_Space:String = "Event_Space";

        public static var keyArray:Array = [];
        private static var _ed:EventDispatcher = new EventDispatcher();
        private static var _changeKeys:Array = [];

        public static function initKey():void{
            var _local1:Stage = MapStatic.mapStage;
            _local1.addEventListener(Event.ACTIVATE, resetKey);
            _local1.addEventListener(Event.DEACTIVATE, resetKey);
            keyArray = [];
            _changeKeys[W] = true;
            _changeKeys[A] = true;
            _changeKeys[S] = true;
            _changeKeys[D] = true;
            _changeKeys[RIGHT] = true;
            _changeKeys[LEFT] = true;
            _changeKeys[DOWN] = true;
            _changeKeys[UP] = true;
        }
        public static function uninitKey():void{
            keyArray = [];
            var _local1:Stage = MapStatic.mapStage;
            _local1.removeEventListener(Event.ACTIVATE, resetKey);
            _local1.removeEventListener(Event.DEACTIVATE, resetKey);
        }
        public static function getKeyDown(_arg1:int):Boolean{
            return ((keyArray[_arg1] == true));
        }
        public static function keyDownHandler(_arg1:KeyboardEvent):void{
            if (keyArray[_arg1.keyCode] != true){
                keyArray[_arg1.keyCode] = true;
                if (_changeKeys[_arg1.keyCode] == true){
                    _ed.dispatchEvent(new Event(Event_KeyChange));
                };
            };
        }
        public static function keyUpHandler(_arg1:KeyboardEvent):void{
            keyArray[_arg1.keyCode] = false;
            if (_changeKeys[_arg1.keyCode] == true){
                _ed.dispatchEvent(new Event(Event_KeyChange));
            } else {
                if (_arg1.keyCode == Space){
                    _ed.dispatchEvent(new Event(Event_Space));
                };
            };
        }
        private static function resetKey(_arg1:Event):void{
            keyArray = [];
            _ed.dispatchEvent(new Event(Event_ACTIVATE));
        }
        public static function addEventListener(_arg1:String, _arg2:Function):void{
            _ed.addEventListener(_arg1, _arg2);
        }
        public static function removeEventListener(_arg1:String, _arg2:Function):void{
            _ed.removeEventListener(_arg1, _arg2);
        }
        private static function get isKeyAorLeft():int{
            if (keyArray[A] == true){
                return (1);
            };
            if (keyArray[LEFT] == true){
                return (1);
            };
            return (0);
        }
        private static function get isKeyDorRIGHT():int{
            if (keyArray[D] == true){
                return (1);
            };
            if (keyArray[RIGHT] == true){
                return (1);
            };
            return (0);
        }
        private static function get isKeySorDOWN():int{
            if (keyArray[S] == true){
                return (1);
            };
            if (keyArray[DOWN] == true){
                return (1);
            };
            return (0);
        }
        private static function get isKeyWorUP():int{
            if (keyArray[W] == true){
                return (1);
            };
            if (keyArray[UP] == true){
                return (1);
            };
            return (0);
        }
        public static function get keyX():int{
            return ((isKeyDorRIGHT - isKeyAorLeft));
        }
        public static function get keyY():int{
            return ((isKeySorDOWN - isKeyWorUP));
        }

    }
}//package com.assist.view.map 
