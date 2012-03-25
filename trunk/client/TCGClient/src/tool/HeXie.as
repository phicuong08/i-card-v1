//Created by Action Script Viewer - http://www.buraks.com/asv
package tool {
    import flash.utils.*;

    public class HeXie {

        private static var hexiestrFile:Class = HeXie_hexiestrFile;
        private static var heXieHashOb:Object;

        public static function init():void{
            var _local4:String;
            var _local5:int;
            var _local6:Object;
            var _local7:String;
            var _local8:Object;
            var _local1:ByteArray = (new hexiestrFile() as ByteArray);
            var _local2:Array = getAllHeXieString(_local1.readUTFBytes(_local1.length));
            heXieHashOb = new Object();
            var _local3:Object = new Object();
            for each (_local4 in _local2) {
                _local4 = StringUtils.trim(_local4);
                _local5 = _local4.length;
                if (_local5 == 0){
                } else {
                    _local6 = _local3[_local5.toString()];
                    if (!_local6){
                        _local6 = new Object();
                        _local3[_local5.toString()] = _local6;
                    };
                    _local6[_local4] = true;
                    _local7 = _local4.charAt(0);
                    _local8 = heXieHashOb[_local7];
                    if (!_local8){
                        _local8 = new Object();
                        heXieHashOb[_local7] = _local8;
                    };
                    _local8[_local5.toString()] = _local6;
                };
            };
        }
        private static function getAllHeXieString(_arg1:String):Array{
            return (_arg1.match(new RegExp("[^,]+", "g")));
        }
        public static function heXieString(_arg1:String):String{
            var _local5:String;
            var _local6:String;
            var _local7:Object;
            var _local8:String;
            var _local9:Object;
            var _local10:String;
            var _local2:int = _arg1.length;
            var _local3:Object = new Object();
            var _local4:int;
            while (_local4 < _local2) {
                _local6 = _arg1.charAt(_local4);
                _local7 = heXieHashOb[_local6];
                if (_local7){
                    for (_local8 in _local7) {
                        _local9 = _local7[_local8];
                        _local10 = _arg1.slice(_local4, (_local4 + int(_local8)));
                        if (_local9[_local10]){
                            _local3[_local10] = true;
                            _local4 = ((_local4 + int(_local8)) - 1);
                        };
                    };
                };
                _local4++;
            };
            for (_local5 in _local3) {
                _arg1 = _arg1.replace(new RegExp(_local5, "g"), "***");
            };
            return (_arg1);
        }
        public static function hasSensitiveWord(_arg1:String){
            var _local5:String;
            var _local6:Object;
            var _local7:String;
            var _local8:Object;
            var _local9:String;
            var _local2:int = _arg1.length;
            var _local3:Object = new Object();
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = _arg1.charAt(_local4);
                _local6 = heXieHashOb[_local5];
                if (_local6){
                    for (_local7 in _local6) {
                        _local8 = _local6[_local7];
                        _local9 = _arg1.slice(_local4, (_local4 + int(_local7)));
                        if (_local8[_local9]){
                            return ([_local4, ((_local4 + int(_local7)) - 1), ((int(_local7) == 1)) ? (("第" + (_local4 + 1)) + "个字符为屏蔽字符。") : (((("第" + (_local4 + 1)) + "至") + (_local4 + int(_local7))) + "个字符为屏蔽字符。")]);
                        };
                    };
                };
                _local4++;
            };
            return (false);
        }

    }
}//package tool 
