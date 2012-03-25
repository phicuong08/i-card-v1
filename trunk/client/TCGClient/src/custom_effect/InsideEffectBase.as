//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import mx.core.*;
    import flash.events.*;
    import flash.utils.*;

    public class InsideEffectBase extends CustomEffectBase {

        public var target;
        public var duration:int;
        protected var effectPassTime:uint;
        protected var currentDuration:uint;
        public var effectContainer:UIComponent;
        private var addToWindow;

        public function InsideEffectBase(_arg1, _arg2:int=1000){
            this.effectContainer = new UIComponent();
            super();
            this.target = _arg1;
            if (_arg1.is3D){
                this.effectContainer.transform.matrix3D = _arg1.transform.matrix3D.clone();
            } else {
                this.effectContainer.transform.matrix = _arg1.transform.matrix.clone();
            };
            this.effectContainer.mouseChildren = false;
            this.effectContainer.mouseEnabled = false;
            this.duration = _arg2;
        }
        override public function play():void{
            this.currentDuration = this.duration;
            this.addToWindow = (this.addToWindow) ? this.addToWindow : this.target.parent;
            if (!this.addToWindow){
                throw (new Error("特效没有指定播放窗口,传入对象也没有父窗口,特效无处播放!"));
            };
            this.addToWindow.addElement(this.effectContainer);
            super.play();
        }
        override public function end():void{
            var _local1:* = this.effectContainer.parent;
            if (_local1){
                _local1.removeElement(this.effectContainer);
            };
            super.end();
        }
        override public function pause():void{
            this.effectPassTime = (getTimer() - effectStartTime);
            super.pause();
        }
        override public function resume():void{
            effectStartTime = getTimer();
            this.currentDuration = (this.duration - this.effectPassTime);
            super.resume();
        }
        public function attach(_arg1):void{
            this.addToWindow = _arg1;
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            if ((getTimer() - effectStartTime) >= this.currentDuration){
                this.end();
            };
        }

    }
}//package custom_effect 
