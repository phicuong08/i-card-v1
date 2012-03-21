package {
    import flash.events.*;
    import ICard.*;
    import flash.display.*;
    import flash.utils.*;
    import ICard.assist.*;

    public class Main extends Sprite {

        public static var Instance:Main;

        private var _ctrl:ControllerMgr;
        private var _data:Data;
        private var _view:View;
        private var _lang:Lang;
        private var _timer:Timer;
        private var _target:Sprite;

        public function Main():void{
            addEventListener(Event.ADDED_TO_STAGE, this.addedToStage);
        }
        protected function addedToStage(_arg1:Event):void{
            var e:* = _arg1;
            Instance = this;
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            URI.test = Config.EnableDomainSelector;
            URI.analyze(this);
            Helper.test = Config.EnableProtocolHelper;
            Helper.initStage(stage);
            this._data = new Data();
            this._ctrl = new ControllerMgr();
            this._view = new View(stage);
            this._lang = new Lang();
            this._data.onConnect = function ():void{
                Helper.backtrace("connected");
                _view.show();
            };
            this._view.init(this._data, this._ctrl, this._lang);
            this._ctrl.init(this._data, this._lang);
            this._data.init(this._view, this._ctrl);
            Helper.backtrace("init");
            this.settleAge();
        }
        private function settleAge():void{
            this._timer = new Timer(1000);
            this._timer.addEventListener(TimerEvent.TIMER, this.timerHandler);
            this._timer.start();
            this._target = new Sprite();
            this._target.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
        }
        public function unsettleAge():void{
            if (this._timer){
                this._timer.removeEventListener(TimerEvent.TIMER, this.timerHandler);
                this._timer = null;
            };
            if (this._target){
                this._target.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
                this._target = null;
            };
        }
        private function timerHandler(_arg1:TimerEvent):void{
            this._data.timerProcess();
            this._ctrl.timerProcess();
            this._view.timerProcess();
        }
        private function enterFrameHandler(_arg1:Event):void{
            this._data.frameProcess();
            this._ctrl.frameProcess();
            this._view.frameProcess();
        }

    }
}//package 
