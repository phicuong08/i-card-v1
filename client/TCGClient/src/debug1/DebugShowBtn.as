//Created by Action Script Viewer - http://www.buraks.com/asv
package debug1{
    //import mx.core.*;
	import mx.core.IFlexModuleFactory;
	import mx.core.UIComponent;
//    import mx.events.*;
	import mx.events.FlexEvent;
//	import mx.core.FlexEvent;
    import flash.events.*;
    import spark.components.*;
    import flash.utils.*;

    public class DebugShowBtn extends spark.components.Button {

        private static var _skinParts_:Object = {labelDisplay:false};

        private var __moduleFactoryInitialized:Boolean = false;
        private var showTimer:Timer;

        public function DebugShowBtn(){
            this.showTimer = new Timer(5000, 1);
            super();
            this.depth = 500;
            this.width = 30;
            this.height = 30;
            this.alpha = 0;
            this.addEventListener("creationComplete", this.___DebugShowBtn_Button1_creationComplete);
            this.addEventListener("rollOver", this.___DebugShowBtn_Button1_rollOver);
            this.addEventListener("rollOut", this.___DebugShowBtn_Button1_rollOut);
            this.addEventListener("click", this.___DebugShowBtn_Button1_click);
            this.addEventListener("mouseDown", this.___DebugShowBtn_Button1_mouseDown);
            this.addEventListener("mouseUp", this.___DebugShowBtn_Button1_mouseUp);
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
        protected function button1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.showTimer.addEventListener(TimerEvent.TIMER, this.timerHandler);
        }
        protected function timerHandler():void{
            this.getDebugWindow().visible = true;
        }
        protected function button1_rollOverHandler(_arg1:MouseEvent):void{
            if (TCGClient.isDebugMode){
                alpha = 1;
            };
        }
        protected function button1_rollOutHandler(_arg1:MouseEvent):void{
            if (TCGClient.isDebugMode){
                alpha = 0;
            } else {
                this.showTimer.stop();
            };
        }
        protected function button1_clickHandler(_arg1:MouseEvent):void{
            if (TCGClient.isDebugMode){
                this.getDebugWindow().visible = !(this.getDebugWindow().visible);
            };
        }
        protected function button1_mouseDownHandler(_arg1:MouseEvent):void{
            if (!TCGClient.isDebugMode){
                if (this.getDebugWindow().visible){
                    this.getDebugWindow().visible = false;
                } else {
                    this.showTimer.start();
                };
            };
        }
        protected function button1_mouseUpHandler(_arg1:MouseEvent):void{
            if (!TCGClient.isDebugMode){
                this.showTimer.stop();
            };
        }
        protected function getDebugWindow():UIComponent{
			return null;
           // return (TCGClient.getInstance().debug);
        }
        public function ___DebugShowBtn_Button1_creationComplete(_arg1:FlexEvent):void{
            this.button1_creationCompleteHandler(_arg1);
        }
        public function ___DebugShowBtn_Button1_rollOver(_arg1:MouseEvent):void{
            this.button1_rollOverHandler(_arg1);
        }
        public function ___DebugShowBtn_Button1_rollOut(_arg1:MouseEvent):void{
            this.button1_rollOutHandler(_arg1);
        }
        public function ___DebugShowBtn_Button1_click(_arg1:MouseEvent):void{
            this.button1_clickHandler(_arg1);
        }
        public function ___DebugShowBtn_Button1_mouseDown(_arg1:MouseEvent):void{
            this.button1_mouseDownHandler(_arg1);
        }
        public function ___DebugShowBtn_Button1_mouseUp(_arg1:MouseEvent):void{
            this.button1_mouseUpHandler(_arg1);
        }
//        override protected function get skinParts():Object{
//            return (_skinParts_);
//        }

    }
}//package debug 
