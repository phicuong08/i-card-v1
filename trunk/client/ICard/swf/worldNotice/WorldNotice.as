package {
    import flash.display.*;
    import flash.utils.*;
    import flash.events.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;

    public class WorldNotice extends MovieClip implements IWorldNotice {

        public var _Notice:MovieClip;
        public var _NoticeText:TextField;
        private var _timer:Timer;
        private var _aryMessage:Array;
        private var blnEnterFrame:Boolean = false;
        private var _speed:Number = 0.035;
        private var _angle:Number = 0;
        private var _num:Number;
        private var _wait:Number = 2;
        private var _onClose:Function;

        public function WorldNotice():void{
            this._timer = new Timer(100);
            this._aryMessage = [];
            this._onClose = new Function();
            super();
            this._Notice.alpha = 0;
            this._NoticeText.alpha = 0;
            this.mouseChildren = false;
            this.mouseEnabled = false;
        }
        public function get content():MovieClip{
            return (this);
        }
        public function show(_arg1:String, _arg2:int):void{
            if (_arg2 > 9){
                _arg2 = 9;
            };
            var _local3:Number = (_arg2 * 10);
            _local3 = ((Math.PI / 180) * _local3);
            _local3 = (0.12 - (Math.sin(_local3) / 10));
            var _local4:Object = {
                message:_arg1,
                speed:_local3
            };
            this._aryMessage.push(_local4);
            this._NoticeText.htmlText = (this._aryMessage[0] as Object)["message"];
            this._speed = (this._aryMessage[0] as Object)["speed"];
            if (!(this.blnEnterFrame)){
                this.addEventListener(Event.ENTER_FRAME, this.enterFrame);
            };
        }
        private function enterFrame(_arg1:Event):void{
            var _local2:Object;
            this.blnEnterFrame = true;
            if (this._angle <= 1.5){
                this._num = Math.sin(this._angle);
                this._Notice.alpha = this._num;
                this._NoticeText.alpha = this._num;
            } else {
                if ((((this._angle >= 2)) && ((this._angle <= 3.111)))){
                    if (this._wait > 0){
                        this._wait = (this._wait - this._speed);
                        return;
                    };
                    this._num = Math.sin(this._angle);
                    this._Notice.alpha = this._num;
                    this._NoticeText.alpha = this._num;
                } else {
                    if (this._angle > 3.1){
                        this._aryMessage.shift();
                        this._angle = 0;
                        this._wait = 2;
                        if (this._aryMessage.length > 0){
                            _local2 = (this._aryMessage[0] as Object);
                            this._NoticeText.htmlText = _local2["message"];
                            this._speed = _local2["speed"];
                        } else {
                            this.removeEventListener(Event.ENTER_FRAME, this.enterFrame);
                            this._Notice.alpha = 0;
                            this._NoticeText.alpha = 0;
                            this.blnEnterFrame = false;
                            this._onClose();
                        };
                        return;
                    };
                };
            };
            this._angle = (this._angle + this._speed);
        }
        public function set onClose(_arg1:Function):void{
            this._onClose = _arg1;
        }

    }
}//package 
