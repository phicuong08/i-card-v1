package {
    import com.assist.view.*;
    import flash.display.*;
    import flash.utils.*;
    import flash.events.*;
    import com.assist.*;

    public class ActivityDownTimer extends ActivityDownTimerBase {

        private var _isShowBtn:Boolean = false;
        private var _diffTime:int = 0;
        private var _timerStr:String = "";
        private var _endTime:int = 0;
        private var _newTime:int = 0;
        private var _onDownTimeEnd:Function;
        private var _onMinute:Function;
        private var _mcType:String = "";
        public var EndTimerStr:String = "";
        private var _startTimerColor:uint = 0xFFFFFF;
        private var _endTimerColor:uint = 0xFFFFFF;
        private var _onClick:Function;
        private var _timer:Timer;
        private var _downTimer:Number = 0;
        private var _isDownTimer:Boolean = false;
        private var _changeColor:int = 0;
        private var _f:int = 0;
        private var _s:int = 0;
        private var _fStr:String = "";
        private var _sStr:String = "";

        public function ActivityDownTimer(){
            this._onDownTimeEnd = new Function();
            this._onMinute = new Function();
            this._onClick = new Function();
            this._timer = new Timer(1000);
            super();
            this._timer.addEventListener(TimerEvent.TIMER, this.onDownTimer);
            _Btn.addEventListener(MouseEvent.CLICK, this.onBtnClick);
        }
        public function set isShowBtn(_arg1:Boolean):void{
            this.visible = _arg1;
            this._isShowBtn = _arg1;
        }
        public function set diffTime(_arg1:int):void{
            this._diffTime = _arg1;
        }
        public function set downTimer(_arg1:int):void{
            var _local2:int = _arg1;
            this._newTime = ((new Date().getTime() / 1000) - this._diffTime);
            this._endTime = (this._newTime + _local2);
            this._downTimer = Math.floor((this._endTime - this._newTime));
            this.downTimerInfo();
            if (this._isDownTimer == false){
                this._isDownTimer = true;
                this._timer.start();
            };
        }
        public function set onDownTimeEnd(_arg1:Function):void{
            this._onDownTimeEnd = _arg1;
        }
        public function set onMinute(_arg1:Function):void{
            this._onMinute = _arg1;
        }
        private function downTimerInfo():void{
            var _local1:Boolean;
            this.visible = this._isShowBtn;
            _Btn.visible = this._isShowBtn;
            if (this._downTimer <= 0){
                this._onDownTimeEnd(this._mcType);
                this._downTimer = -1;
                if (this._changeColor == 0){
                    this.htmlText(this.EndTimerStr, 12, this._startTimerColor);
                    this._changeColor = 1;
                } else {
                    this.htmlText(this.EndTimerStr, 12, this._endTimerColor);
                    this._changeColor = 0;
                };
            } else {
                _local1 = (this._downTimer > 3600);
                this._timerStr = TimeChange.mainTime(this._downTimer, ":", _local1);
                this.htmlText(this._timerStr, 12, this._startTimerColor);
            };
        }
        public function set activityBtn(_arg1:SimpleButton):void{
            this.x = (_arg1.x + 9);
            this.y = (_arg1.y + 68);
        }
        public function set mcType(_arg1:String):void{
            this._mcType = _arg1;
        }
        public function set endTimerStr(_arg1:String):void{
            this.EndTimerStr = _arg1;
        }
        public function set startTimerColor(_arg1:uint):void{
            this._startTimerColor = _arg1;
        }
        public function set endTimerColor(_arg1:uint):void{
            this._endTimerColor = _arg1;
        }
        public function set onClick(_arg1:Function):void{
            this._onClick = _arg1;
        }
        private function onBtnClick(_arg1:MouseEvent):void{
            this._onClick(this._mcType);
        }
        private function onDownTimer(_arg1:TimerEvent):void{
            this._newTime = ((new Date().getTime() / 1000) - this._diffTime);
            this._downTimer = Math.floor((this._endTime - this._newTime));
            if ((((this._downTimer >= 0)) && (((this._downTimer % 60) == 0)))){
                this._onMinute(this._mcType, this._downTimer);
            };
            this.downTimerInfo();
        }
        private function htmlText(_arg1:String, _arg2:int, _arg3:uint, _arg4:Boolean=false, _arg5:Boolean=false):void{
            _DownTimer.htmlText = htmlFormat(_arg1, _arg2, _arg3, _arg4, _arg5);
        }
        public function clear():void{
            this._isDownTimer = false;
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER, this.onDownTimer);
            _Btn.removeEventListener(MouseEvent.CLICK, this.onBtnClick);
        }
        private function renderTime(_arg1:int):String{
            var _local2:int = _arg1;
            if ((_local2 / 60) > 0){
                this._f = Math.floor((_local2 / 60));
                _local2 = (_local2 - (this._f * 60));
            };
            this._s = _local2;
            this._fStr = (this._f + "");
            this._sStr = (this._s + "");
            if (this._f < 10){
                this._fStr = ("0" + this._f);
            };
            if (this._s < 10){
                this._sStr = ("0" + this._s);
            };
            var _local3:String = ((this._fStr + ":") + this._sStr);
            return (_local3);
        }

    }
}//package 
