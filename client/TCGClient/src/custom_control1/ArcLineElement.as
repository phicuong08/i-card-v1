//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import flash.display.*;

    public class ArcLineElement extends Shape {

        private static const elementRadius:Number = 8;

        public var percent:Number;

        public function ArcLineElement(_arg1:Number, _arg2:uint=16725799, _arg3:uint=16725799){
            this.percent = _arg1;
            this.init(_arg2, _arg3);
        }
        public function init(_arg1:uint, _arg2:uint):void{
            graphics.clear();
            graphics.beginFill(this.getColor(_arg1, _arg2), this.getAlpha());
            graphics.drawCircle(elementRadius, elementRadius, this.getRadius());
            graphics.endFill();
        }
        private function getColor(_arg1:uint, _arg2:uint):uint{
            var _local3:Number = ((_arg1 >> 16) & 0xFF);
            var _local4:Number = ((_arg1 >> 8) & 0xFF);
            var _local5:Number = (_arg1 & 0xFF);
            var _local6:Number = ((_arg2 >> 16) & 0xFF);
            var _local7:Number = ((_arg2 >> 8) & 0xFF);
            var _local8:Number = (_arg2 & 0xFF);
            var _local9:uint = (_local3 + ((_local6 - _local3) * this.percent));
            var _local10:uint = (_local4 + ((_local7 - _local4) * this.percent));
            var _local11:uint = (_local5 + ((_local8 - _local5) * this.percent));
            return ((((_local9 << 16) | (_local10 << 8)) | _local11));
        }
        private function getAlpha():Number{
            var _local1:Number = 0.3;
            return (((this.percent > 0.5)) ? (((1 - this.percent) * 2) * _local1) : _local1);
        }
        private function getRadius():Number{
            return ((elementRadius * (1 - (Math.abs((0.5 - this.percent)) / 2))));
        }

    }
}//package custom_control 
