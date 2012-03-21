//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
    import ICard.haloer.data.*;
    
    import flash.utils.*;

    public class Lang {

        public static function sprintf(_arg1:String, ... _args):String{
            var _local5:RegExp;
            var _local3:int = _args.length;
            var _local4:int = 1;
            while (_local4 <= _local3) {
                _local5 = new RegExp((("\\$<" + _local4) + ">"));
                _arg1 = _arg1.replace(_local5, _args[(_local4 - 1)]);
                _local4++;
            };
            return (_arg1);
        }
        public static function output(_arg1:Class):String{
            var _local6:XML;
            var _local7:Array;
            var _local8:String;
            var _local9:int;
            var _local10:int;
            var _local11:String;
            var _local2:XML = describeType(_arg1);
            var _local3:XMLList = _local2.children();
            var _local4:Object = {};
            var _local5:String = "";
            for each (_local6 in _local3) {
                _local11 = _local6.name();
                if ((((_local11 == "constant")) || ((_local11 == "variable")))){
                    _local5 = _local6.attribute("name");
                    _local4[_local5] = _arg1[_local5].replace(/\r|\n/g, "\\n");
                };
            };
            _local7 = oObject.getKeys(_local4);
            _local7.sort(Array.CASEINSENSITIVE);
            _local8 = "";
            _local9 = _local7.length;
            _local10 = 0;
            while (_local10 < _local9) {
                if (_local8 != ""){
                    _local8 = (_local8 + "\r\n");
                };
                _local5 = _local7[_local10];
                _local8 = (_local8 + ((_local5 + " : ") + _local4[_local5]));
                _local10++;
            };
            return (_local8);
        }

    }
}//package com 
