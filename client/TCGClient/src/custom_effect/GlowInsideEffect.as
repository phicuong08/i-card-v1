//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import mx.core.*;
    import flash.events.*;
    import flash.utils.*;

    public class GlowInsideEffect extends CustomEffectBase {

        public var target;
        public var color:uint;
        public var duration:int;
        public var alphaFrom:Number;
        public var alphaTo:Number;
        public var repeatCount:int = -1;
        public var isRepeatReverse:Boolean = true;
        public var effectContainer:UIComponent;
        protected var effectPlayCount:int = 0;
        protected var playEffectReverse:Boolean = false;

        public function GlowInsideEffect(_arg1, _arg2:int, _arg3:uint, _arg4:Number, _arg5:Number, _arg6:int=-1, _arg7:Boolean=false){
            this.effectContainer = new UIComponent();
            this.target = _arg1;
            this.duration = _arg2;
            this.color = _arg3;
            this.alphaFrom = _arg4;
            this.alphaTo = _arg5;
            this.repeatCount = _arg6;
            this.isRepeatReverse = _arg7;
            super();
        }
        override public function play():void{
            this.effectPlayCount = 0;
            this.playEffectReverse = false;
            this.createGlowImage();
            this.target.addElement(this.effectContainer);
            super.play();
            this.enterFrameHandler(null);
        }
        protected function createGlowImage():void{
            this.effectContainer.width = this.target.width;
            this.effectContainer.height = this.target.height;
            this.effectContainer.graphics.clear();
            this.effectContainer.graphics.beginFill(this.color);
            this.effectContainer.graphics.drawRect(0, 0, this.effectContainer.width, this.effectContainer.height);
            this.effectContainer.graphics.endFill();
        }
        override public function end():void{
            var _local1:* = this.effectContainer.parent;
            if (_local1){
                _local1.removeElement(this.effectContainer);
            };
            super.end();
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local2:Number = ((getTimer() - effectStartTime) / this.duration);
            if (_local2 >= 1){
                this.checkEnd();
            } else {
                if (this.playEffectReverse){
                    this.effectContainer.alpha = (this.alphaTo + ((this.alphaFrom - this.alphaTo) * _local2));
                } else {
                    this.effectContainer.alpha = (this.alphaFrom + ((this.alphaTo - this.alphaFrom) * _local2));
                };
            };
        }
        protected function checkEnd():void{
            if ((((this.repeatCount == 0)) || ((this.repeatCount > this.effectPlayCount)))){
                this.effectPlayCount++;
                this.playEffectReverse = ((this.isRepeatReverse) && (!(this.playEffectReverse)));
                effectStartTime = getTimer();
                this.enterFrameHandler(null);
            } else {
                this.end();
            };
        }

    }
}//package custom_effect 
