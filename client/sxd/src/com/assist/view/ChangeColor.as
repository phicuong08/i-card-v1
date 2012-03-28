//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view {
    import flash.events.*;
    import flash.display.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import flash.text.*;
    import com.assist.*;
    import com.lang.client.com.assist.view.*;

    public class ChangeColor extends Sprite {

        private var _tip:ITip;
        private var _isFirst:Boolean = true;
        private var _downTimer:int = 6;
        private var _countTimer:int = 6;
        private var _timer:Timer;
        private var _isPlay:Boolean = false;
        private var _oldStr:String = "";
        private var _newStr:String = "";
        private var _textField:TextField;
        private var _oldColor:uint;
        private var _newColor:uint;
        private var _isSize:int;
        private var _isBold:Boolean;

        public function ChangeColor(){
            this._timer = new Timer(100);
            super();
        }
        public function set tip(_arg1:ITip):void{
            this._tip = _arg1;
        }
        public function newTextColor(_arg1:TextField, _arg2:uint, _arg3:uint=0xFFFFFF, _arg4:int=12, _arg5:Boolean=false):void{
            var _local6:String = _arg1.text;
            if (this._isFirst){
                this._textField = _arg1;
                this._textField.htmlText = htmlFormat(_local6, _arg4, _arg3, _arg5);
                this._isFirst = false;
                return;
            };
            this._oldStr = _local6;
            this._newStr = _local6;
            this._oldColor = _arg3;
            this._newColor = _arg2;
            this._downTimer = this._countTimer;
            this._isSize = _arg4;
            this._isBold = _arg5;
            if (this._isPlay == false){
                this._timer.addEventListener(TimerEvent.TIMER, this.playTimerStart);
                this._isPlay = true;
                this._timer.start();
            };
        }
        public function textColor(_arg1:TextField, _arg2:Number, _arg3:uint, _arg4:uint=0xFFFFFF, _arg5:int=12, _arg6:Boolean=false):void{
            this.textColorForCpom(_arg1, _arg2.toString(), _arg3, _arg4, _arg5, _arg6);
        }
        public function textColorForIngot(_arg1:TextField, _arg2:Number, _arg3:uint, _arg4:uint=0xFFFFFF, _arg5:int=12, _arg6:Boolean=false):void{
            var _local7:String = _arg2.toString();
            if (_arg2 >= 99999){
                _local7 = (Math.floor(Number((_arg2 / 10000))) + ChangeColorLang.TenThousand);
            };
            this.textColorForCpom(_arg1, _local7, _arg3, _arg4, _arg5, _arg6);
        }
        public function textColorForCoins(_arg1:TextField, _arg2:Number, _arg3:uint, _arg4:uint=0xFFFFFF, _arg5:int=12, _arg6:Boolean=false):void{
            var _local7:String = _arg2.toString();
            if (_arg2 >= 999999999){
                _local7 = (Math.floor(Number((_arg2 / 100000000))) + ChangeColorLang.YI);
            } else {
                if (_arg2 >= 99999){
                    _local7 = (Math.floor(Number((_arg2 / 10000))) + ChangeColorLang.TenThousand);
                };
            };
            this.textColorForCpom(_arg1, _local7, _arg3, _arg4, _arg5, _arg6);
        }
        public function textColorForCpom(_arg1:TextField, _arg2:String, _arg3:uint, _arg4:uint=0xFFFFFF, _arg5:int=12, _arg6:Boolean=false):void{
            if (this._isFirst){
                this._textField = _arg1;
                this._textField.htmlText = htmlFormat(_arg2, _arg5, _arg4, _arg6);
                this._isFirst = false;
                this._oldStr = _arg2;
                return;
            };
            this._newStr = _arg2;
            this._oldColor = _arg4;
            this._newColor = _arg3;
            this._downTimer = this._countTimer;
            this._isSize = _arg5;
            this._isBold = _arg6;
            if (this._isPlay == false){
                this._timer.addEventListener(TimerEvent.TIMER, this.playTimerStart);
                this._isPlay = true;
                this._timer.start();
            } else {
                this.endTextField();
            };
        }
        public function set downTimer(_arg1:int):void{
            this._downTimer = _arg1;
            this._countTimer = _arg1;
        }
        private function playTimerStart(_arg1:TimerEvent):void{
            if (this._downTimer == 0){
                this._timer.removeEventListener(TimerEvent.TIMER, this.playTimerStart);
                this._timer.stop();
                this.endTextField();
                this._isPlay = false;
            } else {
                if (((((this._downTimer % 2) == 0)) && (!((this._downTimer == 0))))){
                    this._textField.htmlText = htmlFormat(this._oldStr.toString(), this._isSize, this._newColor, this._isBold);
                } else {
                    this._textField.htmlText = htmlFormat(this._oldStr.toString(), this._isSize, this._oldColor, this._isBold);
                };
                this._downTimer--;
            };
        }
        private function endTextField():void{
            this._textField.htmlText = htmlFormat(this._newStr.toString(), this._isSize, this._oldColor, this._isBold);
            this._oldStr = this._newStr;
        }

    }
}//package com.assist.view 
