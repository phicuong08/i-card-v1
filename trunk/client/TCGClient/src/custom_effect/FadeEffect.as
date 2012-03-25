//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.events.*;
    import flash.utils.*;

    public class FadeEffect extends CustomEffectBase {

        public var target;
        public var alphaFrom:Number;
        public var alphaTo:Number;
        public var duration:int;

        public function FadeEffect(_arg1, _arg2:int, _arg3:Number, _arg4:Number){
            this.target = _arg1;
            this.duration = _arg2;
            this.alphaFrom = _arg3;
            this.alphaTo = _arg4;
            super();
        }
        override public function play():void{
            this.target.alpha = this.alphaFrom;
            super.play();
        }
        override public function end():void{
            this.target.alpha = this.alphaTo;
            super.end();
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local2:Number = ((getTimer() - effectStartTime) / this.duration);
            if (_local2 >= 1){
                this.end();
            } else {
                this.target.alpha = (this.alphaFrom + ((this.alphaTo - this.alphaFrom) * this.easeOut(_local2, 1)));
            };
        }
        private function easeOut(_arg1:Number, _arg2:Number):Number{
            _arg1 = (1 - (_arg1 / _arg2));
            return ((1 - (_arg1 * _arg1)));
        }

    }
}//package custom_effect 
