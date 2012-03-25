//Created by Action Script Viewer - http://www.buraks.com/asv
package tool {

    public class ColorUtil {

        public static function getColorMatrixByBrightness(_arg1:Number):Array{
            var _local2:Array;
            _arg1 = ((_arg1 > 1)) ? 1 : _arg1;
            _arg1 = ((_arg1 < -1)) ? -1 : _arg1;
            if (_arg1 > 0){
                _local2 = [(1 - _arg1), 0, 0, 0, (0xFF * _arg1), 0, (1 - _arg1), 0, 0, (0xFF * _arg1), 0, 0, (1 - _arg1), 0, (0xFF * _arg1), 0, 0, 0, 1, 0];
            } else {
                _local2 = [(1 + _arg1), 0, 0, 0, 0, 0, (1 + _arg1), 0, 0, 0, 0, 0, (1 + _arg1), 0, 0, 0, 0, 0, 1, 0];
            };
            return (_local2);
        }
        public static function getGrayColorMatrix():Array{
            var _local1:Number = 0.212671;
            var _local2:Number = 0.71516;
            var _local3:Number = 0.072169;
            return ([_local1, _local2, _local3, 0, 0, _local1, _local2, _local3, 0, 0, _local1, _local2, _local3, 0, 0, 0, 0, 0, 1, 0]);
        }

    }
}//package tool 
