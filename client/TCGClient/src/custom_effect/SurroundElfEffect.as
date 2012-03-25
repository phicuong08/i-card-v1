//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import mx.core.*;
    import flash.events.*;
    import flash.filters.*;
    import __AS3__.vec.*;

    public class SurroundElfEffect extends CustomEffectBase {

        public var target;
        public var glowColor:Number;
        public var lineColor:Number;
        public var lineSize:Number;
        public var moveSpeed:Number;
        public var effectContainer:UIComponent;
        public var lapLength:Number;
        public var targetWidth:Number;
        public var targetHeight:Number;
        protected var addToWindow;
        private var passRoute:Number;
        private var allElement:Vector.<SurroundElfEffectElement>;

        public function SurroundElfEffect(_arg1, _arg2:Number=4, _arg3:Number=0xCDEB00, _arg4:Number=0xFFFFFF, _arg5:Number=6){
            this.target = _arg1;
            this.glowColor = _arg3;
            this.moveSpeed = _arg2;
            this.lineColor = _arg4;
            this.lineSize = _arg5;
            this.targetWidth = _arg1.width;
            this.targetHeight = _arg1.height;
            this.lapLength = ((_arg1.width + _arg1.height) * 2);
            super();
        }
        public function attach(_arg1):void{
            this.addToWindow = _arg1;
        }
        override public function play():void{
            this.allElement = new Vector.<SurroundElfEffectElement>();
            this.passRoute = 0;
            if (!this.effectContainer){
                this.effectContainer = new UIComponent();
            };
            this.addToWindow = (this.addToWindow) ? this.addToWindow : this.target;
            this.addToWindow.addElement(this.effectContainer);
            this.effectContainer.mouseChildren = false;
            this.effectContainer.mouseEnabled = false;
            this.effectContainer.addEventListener(Event.REMOVED_FROM_STAGE, this.doEnd);
            this.effectContainer.filters = [new GlowFilter(this.glowColor, 1, 10, 10)];
            super.play();
        }
        private function doEnd(_arg1:Event):void{
            this.end();
        }
        override public function end():void{
            super.end();
            this.effectContainer.removeEventListener(Event.REMOVED_FROM_STAGE, this.doEnd);
            this.effectContainer.callLater(this.removeEffectContainer);
        }
        protected function removeEffectContainer():void{
            var _local1:*;
            if (!isPlaying){
                _local1 = this.effectContainer.parent;
                if (_local1){
                    _local1.removeElement(this.effectContainer);
                };
            };
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local3:SurroundElfEffectElement;
            this.effectContainer.graphics.clear();
            var _local2:Vector.<SurroundElfEffectElement> = this.allElement.slice();
            for each (_local3 in _local2) {
                _local3.draw();
                _local3.lineSize = (_local3.lineSize - 1);
                if (_local3.lineSize < 1){
                    this.allElement.splice(this.allElement.indexOf(_local3), 1);
                };
            };
            this.update();
        }
        private function update():void{
            this.createOneElement(this.passRoute);
            this.createOneElement((((this.passRoute + this.targetWidth) + this.targetHeight) % this.lapLength));
            this.passRoute = (this.passRoute + this.moveSpeed);
            this.passRoute = (this.passRoute % this.lapLength);
        }
        private function createOneElement(_arg1:Number):void{
            var _local2:Array = this.getPosByRoute(_arg1);
            _arg1 = (_arg1 + this.moveSpeed);
            _arg1 = (_arg1 % this.lapLength);
            var _local3:Array = this.getPosByRoute(_arg1);
            var _local4:SurroundElfEffectElement = new SurroundElfEffectElement(this.effectContainer, _local2[0], _local2[1], _local3[0], _local3[1], this.lineColor, this.lineSize);
            this.allElement.push(_local4);
        }
        private function getPosByRoute(_arg1:Number):Array{
            if (_arg1 <= this.targetWidth){
                return ([_arg1, 0]);
            };
            if (_arg1 <= (this.targetWidth + this.targetHeight)){
                return ([this.targetWidth, (_arg1 - this.targetWidth)]);
            };
            if (_arg1 <= ((this.targetWidth * 2) + this.targetHeight)){
                return ([(((2 * this.targetWidth) + this.targetHeight) - _arg1), this.targetHeight]);
            };
            return ([0, (((this.targetHeight + this.targetWidth) * 2) - _arg1)]);
        }

    }
}//package custom_effect 
