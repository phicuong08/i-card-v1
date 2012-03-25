//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.events.*;
    import flash.utils.*;

    public class ScaleEffect extends CustomEffectBase {

        public var target;
        public var scaleXTo:Number;
        public var scaleYTo:Number;
        public var duration:int;
        private var scaleXFrom:Number;
        private var scaleYFrom:Number;

        public function ScaleEffect(_arg1, _arg2:int=1000, _arg3:Number=1, _arg4:Number=1){
            this.target = _arg1;
            this.scaleXTo = _arg3;
            this.scaleYTo = _arg4;
            this.duration = _arg2;
            super();
        }
        override public function play():void{
            this.scaleXFrom = this.target.scaleX;
            this.scaleYFrom = this.target.scaleY;
            super.play();
        }
        override public function end():void{
            this.target.scaleX = this.scaleXTo;
            this.target.scaleY = this.scaleYTo;
            super.end();
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local2:Number = ((getTimer() - effectStartTime) / this.duration);
            if (_local2 >= 1){
                this.end();
            } else {
                this.target.scaleX = (this.scaleXFrom + ((this.scaleXTo - this.scaleXFrom) * _local2));
                this.target.scaleY = (this.scaleYFrom + ((this.scaleYTo - this.scaleYFrom) * _local2));
            };
        }

    }
}//package custom_effect 
