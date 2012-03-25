//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import spark.filters.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class CountdownClock extends Label {

        private var __moduleFactoryInitialized:Boolean = false;
        protected var clockTimer:Timer;
        protected var timerStartTime:int;
        protected var totalMillisecond:int;
        protected var currentColor:uint;

        public function CountdownClock(){
            this.clockTimer = new Timer(1000);
            super();
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.filters = [this._CountdownClock_GlowFilter1_c()];
            this.addEventListener("initialize", this.___CountdownClock_Label1_initialize);
        }
        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            var factory:* = _arg1;
            super.moduleFactory = factory;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
            if (!this.styleDeclaration){
                this.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
            };
            this.styleDeclaration.defaultFactory = function ():void{
                this.fontFamily = "Times New Roman";
                this.fontWeight = "bold";
                this.fontSize = 18;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function label1_initializeHandler(_arg1:FlexEvent):void{
            this.clockTimer.addEventListener(TimerEvent.TIMER, this.timerHandler);
        }
        public function clearClock():void{
            this.stopClock();
            text = null;
        }
        public function stopClock(_arg1:int=-1):void{
            this.clockTimer.stop();
            if (_arg1 != -1){
                this.setClockTextByLeftSecond((_arg1 * 1000));
            };
        }
        public function startClock(_arg1:int):void{
            this.clockTimer.start();
            this.totalMillisecond = (_arg1 * 1000);
            this.timerStartTime = (getTimer() + 500);
            this.setClockTextByLeftSecond(this.totalMillisecond);
        }
        protected function timerHandler(_arg1:TimerEvent=null):void{
            this.setClockTextByLeftSecond((this.totalMillisecond - (getTimer() - this.timerStartTime)));
        }
        protected function setClockTextByLeftSecond(_arg1:int):void{
            var _local2:Date;
            var _local3:String;
            var _local4:String;
            if (_arg1 <= 0){
                text = "00 : 00";
                this.changeColorByLeftTime(0);
            } else {
                _local2 = new Date(_arg1);
                _local3 = ("0" + _local2.minutes).substr(-2);
                _local4 = ("0" + _local2.seconds).substr(-2);
                text = ((_local3 + " : ") + _local4);
                this.changeColorByLeftTime(_arg1);
            };
        }
        protected function changeColorByLeftTime(_arg1:int):void{
            if (_arg1 < 60000){
                if (this.currentColor != 15346963){
                    this.currentColor = 15346963;
                    setStyle("color", this.currentColor);
                };
            } else {
                if (this.currentColor != 0xE4FF00){
                    this.currentColor = 0xE4FF00;
                    setStyle("color", this.currentColor);
                };
            };
        }
        private function _CountdownClock_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CountdownClock_Label1_initialize(_arg1:FlexEvent):void{
            this.label1_initializeHandler(_arg1);
        }

    }
}//package custom_control 
