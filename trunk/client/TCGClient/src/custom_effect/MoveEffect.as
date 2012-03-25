//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.events.*;
    import flash.utils.*;

    public class MoveEffect extends CustomEffectBase {

        public var target;
        public var xTo:Number;
        public var yTo:Number;
        public var duration:int;
        private var xDistance:Number;
        private var yDistance:Number;
        private var xFrom:Number;
        private var yFrom:Number;

        public function MoveEffect(_arg1, _arg2:Number=1000){
            this.target = _arg1;
            this.duration = _arg2;
            super();
        }
        override public function play():void{
            this.xFrom = this.target.x;
            this.yFrom = this.target.y;
            this.xDistance = (this.xTo - this.xFrom);
            this.yDistance = (this.yTo - this.yFrom);
            super.play();
        }
        override public function end():void{
            this.target.x = this.xTo;
            this.target.y = this.yTo;
            super.end();
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local2:Number = ((getTimer() - effectStartTime) / this.duration);
            if (_local2 >= 1){
                this.end();
            } else {
                this.target.x = (this.xFrom + (_local2 * this.xDistance));
                this.target.y = (this.yFrom + (_local2 * this.yDistance));
            };
        }

    }
}//package custom_effect 
