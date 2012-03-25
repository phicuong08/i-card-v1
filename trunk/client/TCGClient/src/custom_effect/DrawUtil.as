//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.display.*;
    import flash.geom.*;

    public class DrawUtil {

        public static function divide(_arg1, _arg2:int, _arg3:int, _arg4:Boolean=false, _arg5=null):Array{
            var _local13:Array;
            var _local14:int;
            var _local15:BitmapData;
            var _local16:Bitmap;
            var _local6:BitmapData = new BitmapData(_arg1.width, _arg1.height, true, 0);
            _local6.draw(_arg1);
            var _local7:uint = Math.ceil((_local6.width / _arg3));
            var _local8:uint = Math.ceil((_local6.height / _arg2));
            var _local9:Array = new Array();
            var _local10:Point = new Point(0, 0);
            var _local11:Rectangle = new Rectangle(0, 0, _local7, _local8);
            var _local12:int;
            while (_local12 < _arg2) {
                _local13 = new Array();
                _local11.y = (_local12 * _local8);
                _local14 = 0;
                while (_local14 < _arg3) {
                    _local11.x = (_local14 * _local7);
                    _local15 = new BitmapData(_local7, _local8, true, 0);
                    _local15.copyPixels(_local6, _local11, _local10);
                    if (_arg4){
                        _local16 = new Bitmap(_local15);
                        _local16.x = _local11.x;
                        _local16.y = _local11.y;
                        if (_arg5){
                            _arg5.addChild(_local16);
                        };
                        _local13.push(_local16);
                    } else {
                        _local13.push(_local15);
                    };
                    _local14++;
                };
                _local9.push(_local13);
                _local12++;
            };
            return (_local9);
        }

    }
}//package custom_effect 
