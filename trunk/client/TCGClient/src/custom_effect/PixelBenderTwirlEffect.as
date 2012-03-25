//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.display.*;
    import flash.geom.*;

    public class PixelBenderTwirlEffect extends PixelBenderEffectBase {

        private static var cls:Class = PixelBenderTwirlEffect_cls;

        private var maxRadius:Number;
        private var reverse:Boolean;
        private var centerPoint:Point;

        public function PixelBenderTwirlEffect(_arg1:DisplayObject, _arg2:Number, _arg3:Point, _arg4:Boolean=false){
            this.centerPoint = _arg3;
            this.reverse = _arg4;
            super(_arg1, _arg2, cls);
        }
        override protected function initFilter(_arg1:Class):void{
            super.initFilter(_arg1);
            this.maxRadius = ((this.centerPoint.x > this.centerPoint.y)) ? this.centerPoint.x : this.centerPoint.y;
            shader.data["twirlAngle"].value = [500];
            shader.data["center"].value = [this.centerPoint.x, this.centerPoint.y];
            shader.data["radius"].value = [0.1];
        }
        override protected function changeFilterByPercent(_arg1:Number):void{
            var _local2:Number = (this.reverse) ? (1 - _arg1) : _arg1;
            shader.data["radius"].value = [(0.1 + (this.maxRadius * _local2))];
            shader.data["scale"].value = [(1 - _local2)];
            super.changeFilterByPercent(_arg1);
        }

    }
}//package custom_effect 
