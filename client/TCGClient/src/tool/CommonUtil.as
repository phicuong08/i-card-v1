//Created by Action Script Viewer - http://www.buraks.com/asv
package tool {
    import flash.events.*;
    import spark.components.*;
    import flash.utils.*;

    public class CommonUtil {

        public static function getAncestorByClass(_arg1, _arg2:Class){
            var _local3:* = _arg1.parent;
            while (_local3) {
                if ((_local3 is _arg2)){
                    return (_local3);
                };
                if ((_local3 is Application)){
                    return (null);
                };
                _local3 = _local3.parent;
            };
            return (null);
        }
        public static function cleanGroupElements(_arg1:Group, _arg2:int=0):void{
            var _local3:Array = new Array();
            var _local4:int = (_arg1.numElements - 1);
            while (_local4 >= _arg2) {
                _local3.push(_arg1.getElementAt(_local4));
                _local4--;
            };
            _local4 = 0;
            while (_local4 < _local3.length) {
                _arg1.removeElement(_local3[_local4]);
                _local4++;
            };
        }
        public static function addTimerLaterCall(_arg1:int, _arg2:Function, _arg3:Array=null):void{
            var t:* = null;
            var timerHandler:* = null;
            var duration:* = _arg1;
            var func:* = _arg2;
            var arg = _arg3;
            timerHandler = function ():void{
                t.removeEventListener(TimerEvent.TIMER, timerHandler);
                t.stop();
                func.apply(null, arg);
            };
            t = new Timer(duration, 1);
            t.addEventListener(TimerEvent.TIMER, timerHandler);
            t.start();
        }
        public static function getObjectKeyByValue(_arg1:Object, _arg2):String{
            var _local3:String;
            for (_local3 in _arg1) {
                if (_arg1[_local3] == _arg2){
                    return (_local3);
                };
            };
            return (null);
        }
        public static function cloneObject(_arg1:Object):Object{
            var _local3:String;
            var _local2:Object = new Object();
            for (_local3 in _arg1) {
                _local2[_local3] = _arg1[_local3];
            };
            return (_local2);
        }
        public static function isObjectEmpty(_arg1:Object):Boolean{
            var _local2:String;
            for (_local2 in _arg1) {
                return (false);
            };
            return (true);
        }

    }
}//package tool 
