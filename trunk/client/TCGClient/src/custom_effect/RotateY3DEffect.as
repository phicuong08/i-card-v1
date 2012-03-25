//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import mx.core.*;
    import flash.events.*;
    import flash.utils.*;

    public class RotateY3DEffect extends CustomEffectBase {

        public var target:UIComponent;
        public var yFrom:Number;
        public var yTo:Number;
        public var duration:int;
        public var currentY:Number;

        public function RotateY3DEffect(_arg1:UIComponent, _arg2:Number, _arg3:Number, _arg4:int){
            this.target = _arg1;
            this.yFrom = _arg2;
            this.yTo = _arg3;
            this.duration = _arg4;
            super();
        }
        override public function end():void{
            this.target.rotationY = this.yTo;
            super.end();
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local2:Number = ((getTimer() - effectStartTime) / this.duration);
            if (_local2 >= 1){
                this.end();
            } else {
                this.target.rotationY = (this.yFrom + ((this.yTo - this.yFrom) * _local2));
            };
        }

    }
}//package custom_effect 
