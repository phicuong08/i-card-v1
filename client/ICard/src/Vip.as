package {
    import flash.display.*;
    import com.assist.view.interfaces.*;
    import flash.utils.*;
    import com.assist.*;
    import flash.events.*;
    import flash.text.*;

    public class Vip extends MovieClip implements IVip {

        public var _ProgressBar:MovieClip;
        public var _CurrentVip:TextField;
        public var _OnePayBtn:SimpleButton;
        public var _NeedIngot:TextField;
        public var _TitleBar:MovieClip;
        public var _LinkBtn:SimpleButton;
        public var _Confirm:SimpleButton;
        public var _FirstPayBtn:SimpleButton;
        public var _Close:SimpleButton;
        public var _NextVipFullInfo:TextField;
        private var _onClose:Function;
        private var _drag:IDrag;
        private var _conutIngot:int = 0;
        private var _oldNeedIngotValue:int;
        private var _newNeedIngotValue:int;
        private var _mcFirstPay:FirstPay;
        private var _onePay:OnePay;
        private var _tiemrProgressBar:Timer;
        private var _srollbarBox:Scrollbar;
        private var _onShowVIPInfo:Function;
        private var _onRecharge:Function;

        public function Vip(){
            this._tiemrProgressBar = new Timer(10);
            super();
            this._ProgressBar._CountIngot.filters = [Filter.filter2];
            this._Close.addEventListener(MouseEvent.CLICK, this.onCloseHander, false, 0, true);
            this._Confirm.addEventListener(MouseEvent.CLICK, this.onConfirmHandler, false, 0, true);
            this._LinkBtn.addEventListener(MouseEvent.CLICK, this.onShowVIPInfoHandler, false, 0, true);
            this._FirstPayBtn.addEventListener(MouseEvent.CLICK, this.onFirstPayBtn);
            this._OnePayBtn.addEventListener(MouseEvent.CLICK, this.onOnePayBtn);
            this._tiemrProgressBar.addEventListener(TimerEvent.TIMER, this.onTimerProgressBar);
            this._mcFirstPay = new FirstPay();
            this._mcFirstPay._CloseBtn.addEventListener(MouseEvent.CLICK, this.onFirstPayCloseBtn);
            addChild(this._mcFirstPay);
            this._mcFirstPay.visible = false;
            this._onePay = new OnePay();
            this._onePay._SendIngotFile._Info.mouseWheelEnabled = false;
            this._onePay._CloseBtn.addEventListener(MouseEvent.CLICK, this.onOnePayCloseBtn);
            addChild(this._onePay);
            this._onePay.visible = false;
            this.addScrollbar();
        }
        public function get content():Sprite{
            return (this);
        }
        public function info(_arg1:String, _arg2:String, _arg3:String):void{
            this.clearDetailText();
            this._CurrentVip.htmlText = (("<b>" + _arg1) + "</b>");
            this._NextVipFullInfo.htmlText = _arg2;
            this._NeedIngot.text = _arg3;
        }
        public function set showFirstPayBtn(_arg1:Boolean):void{
            this._FirstPayBtn.visible = _arg1;
        }
        public function set showOnePayBtn(_arg1:Boolean):void{
            this._OnePayBtn.visible = _arg1;
        }
        public function set drag(_arg1:IDrag):void{
            this._drag = _arg1;
            this._drag.addTarget(this._TitleBar, this);
        }
        public function set onClose(_arg1:Function):void{
            this._onClose = _arg1;
        }
        override public function get width():Number{
            return (520);
        }
        override public function get height():Number{
            return (368);
        }
        public function clear():void{
            this._Close.removeEventListener(MouseEvent.CLICK, this.onCloseHander);
            this._Confirm.removeEventListener(MouseEvent.CLICK, this.onConfirmHandler);
            this._LinkBtn.removeEventListener(MouseEvent.CLICK, this.onShowVIPInfoHandler);
            this._FirstPayBtn.removeEventListener(MouseEvent.CLICK, this.onFirstPayBtn);
            this._OnePayBtn.removeEventListener(MouseEvent.CLICK, this.onOnePayBtn);
            this._mcFirstPay._CloseBtn.removeEventListener(MouseEvent.CLICK, this.onFirstPayCloseBtn);
            this._onePay._CloseBtn.removeEventListener(MouseEvent.CLICK, this.onOnePayCloseBtn);
            this._tiemrProgressBar.stop();
            this._tiemrProgressBar.removeEventListener(TimerEvent.TIMER, this.onTimerProgressBar);
            this._drag.removeTarget(this._TitleBar);
            this.removeChild(this._onePay);
            this._onePay = null;
            this.removeChild(this._mcFirstPay);
            this._mcFirstPay = null;
            this._srollbarBox.target = null;
            this._srollbarBox = null;
        }
        public function renderProgressBar(_arg1:int, _arg2:int, _arg3:int):void{
            this._conutIngot = _arg2;
            this._oldNeedIngotValue = (_arg1 + _arg3);
            this._newNeedIngotValue = _arg1;
            this.setProgressBar(this._oldNeedIngotValue, this._conutIngot);
            if (_arg3 != 0){
                this._tiemrProgressBar.start();
            };
        }
        private function addScrollbar():void{
            this._srollbarBox = new Scrollbar();
            this._srollbarBox.showWidth = 284;
            this._srollbarBox.scrollbarX = 284;
            this._srollbarBox.speed = 10;
            this._srollbarBox.showHeight = 205;
            this._srollbarBox.visibleScrollbar = false;
            this._onePay._SendIngotFile.y = 97;
            this._srollbarBox.target = this._onePay._SendIngotFile;
        }
        private function clearDetailText():void{
            this._CurrentVip.htmlText = "";
            this._NextVipFullInfo.htmlText = "";
        }
        private function setProgressBar(_arg1:int, _arg2:int):void{
            var _local3:Number = ((_arg2 - _arg1) / _arg2);
            this._ProgressBar._CountIngot.text = (((_arg2 - _arg1) + "/") + _arg2);
            this._ProgressBar._Middle.width = Math.ceil((283 * _local3));
            this._ProgressBar._Right.x = (this._ProgressBar._Middle.x + this._ProgressBar._Middle.width);
            this._ProgressBar._Light.x = ((this._ProgressBar._Middle.x + this._ProgressBar._Middle.width) - 10);
        }
        private function onCloseHander(_arg1:MouseEvent):void{
            if ((this._onClose is Function)){
                this._onClose();
            };
        }
        private function onConfirmHandler(_arg1:MouseEvent):void{
            if ((this._onRecharge is Function)){
                this._onRecharge();
            };
        }
        private function onShowVIPInfoHandler(_arg1:MouseEvent):void{
            if ((this._onShowVIPInfo is Function)){
                this._onShowVIPInfo();
            };
        }
        private function onFirstPayBtn(_arg1:MouseEvent):void{
            this._mcFirstPay.x = ((this.width - this._mcFirstPay.width) / 2);
            this._mcFirstPay.y = ((this.height - this._mcFirstPay.height) / 2);
            this._mcFirstPay.visible = true;
        }
        private function onOnePayBtn(_arg1:MouseEvent):void{
            this._onePay.x = ((this.width - this._onePay.width) / 2);
            this._onePay.y = ((this.height - 340) / 2);
            this._onePay.visible = true;
        }
        private function onOnePayCloseBtn(_arg1:MouseEvent):void{
            this._onePay.visible = false;
        }
        private function onFirstPayCloseBtn(_arg1:MouseEvent):void{
            this._mcFirstPay.visible = false;
        }
        private function onTimerProgressBar(_arg1:TimerEvent):void{
            if (this._oldNeedIngotValue == this._newNeedIngotValue){
                this._tiemrProgressBar.stop();
                this._tiemrProgressBar.removeEventListener(TimerEvent.TIMER, this.onTimerProgressBar);
            };
            if (this._oldNeedIngotValue < this._newNeedIngotValue){
                this._oldNeedIngotValue++;
            } else {
                if (this._oldNeedIngotValue > this._newNeedIngotValue){
                    this._oldNeedIngotValue--;
                };
            };
            this.setProgressBar(this._oldNeedIngotValue, this._conutIngot);
        }
        public function set onShowVIPInfo(_arg1:Function):void{
            this._onShowVIPInfo = _arg1;
        }
        public function set onRecharge(_arg1:Function):void{
            this._onRecharge = _arg1;
        }

    }
}//package 
