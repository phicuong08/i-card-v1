//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import mx.core.*;
    import mx.events.*;
    import flash.events.*;
    import mx.binding.*;
    import custom_control1.*;
    import spark.filters.*;
    import flash.utils.*;

    public class ArrowFlashSign extends SmoothImage {

        private var __moduleFactoryInitialized:Boolean = false;
        private var img1:Class;
        private var img2:Class;
        private var actionTimer:Timer;

        public function ArrowFlashSign(){
            this.img1 = ArrowFlashSign_img1;
            this.img2 = ArrowFlashSign_img2;
            super();
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.filters = [this._ArrowFlashSign_GlowFilter1_c()];
            this.addEventListener("creationComplete", this.___ArrowFlashSign_SmoothImage1_creationComplete);
            this.addEventListener("addedToStage", this.___ArrowFlashSign_SmoothImage1_addedToStage);
            this.addEventListener("removedFromStage", this.___ArrowFlashSign_SmoothImage1_removedFromStage);
        }
        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            super.moduleFactory = _arg1;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function creationCompleteHandler():void{
            this.actionTimer = new Timer(300);
            this.actionTimer.addEventListener(TimerEvent.TIMER, this.timerHandler);
            this.actionTimer.start();
        }
        private function timerHandler(_arg1:TimerEvent):void{
            source = ((source == this.img1)) ? this.img2 : this.img1;
        }
        protected function addedToStageHandler():void{
            if (this.actionTimer != null){
                this.actionTimer.start();
            };
        }
        protected function removedFromStageHandler():void{
            if (this.actionTimer != null){
                this.actionTimer.stop();
            };
        }
        private function _ArrowFlashSign_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 1786685;
            _local1.alpha = 0.3;
            _local1.strength = 5;
            _local1.blurX = 10;
            _local1.blurY = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___ArrowFlashSign_SmoothImage1_creationComplete(_arg1:FlexEvent):void{
            this.creationCompleteHandler();
        }
        public function ___ArrowFlashSign_SmoothImage1_addedToStage(_arg1:Event):void{
            this.addedToStageHandler();
        }
        public function ___ArrowFlashSign_SmoothImage1_removedFromStage(_arg1:Event):void{
            this.removedFromStageHandler();
        }

    }
}//package ui_element 
