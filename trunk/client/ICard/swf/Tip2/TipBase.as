//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.filters.*;
    import flash.utils.*;

    public class TipBase extends Sprite {

        private var _oParent:Sprite;
        protected var _title:TextField;
        protected var _content:TextField;
        protected var _icon:MovieClip;
        private var _type:int;
        private var _mx:Number;
        private var _my:Number;
        private var _mh:int = 35;
        private var _step:Number = 4;
        private var _cmfValue:Array;
        private var _cmf:ColorMatrixFilter;
        private var _timer:Timer;
        private var _delay1:int = 0;
        private var _delay2:int = 1000;
        private var _w:Number;
        private var _h:Number;

        public function TipBase(){
            this._cmfValue = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0];
            super();
            this.mouseChildren = false;
            this.mouseEnabled = false;
        }
        public function show(_arg1:String, _arg2:String, _arg3:int):void{
            cacheAsBitmap = false;
            this._title.htmlText = _arg1;
            if (_arg2 != null){
                this._content.htmlText = _arg2;
            };
            this._icon.gotoAndStop(_arg3);
            this._oParent.addChild(this);
            this._mx = Math.floor(((this._w - width) / 2));
            this._my = Math.floor(((this._h - height) / 2));
            x = this._mx;
            y = (this._my + this._mh);
            this._type = _arg3;
            this.bottomToMiddle();
        }
        public function hide():void{
            if (parent){
                parent.removeChild(this);
            };
        }
        private function setFilter(_arg1:Number):void{
            if (_arg1 > 1){
                return;
            };
            this._cmfValue[18] = _arg1;
            this._cmf = new ColorMatrixFilter(this._cmfValue);
            filters = [this._cmf];
        }
        private function bottomToMiddle():void{
            this.clearAllEvent();
            this._timer = new Timer(this._delay1);
            this._timer.addEventListener(TimerEvent.TIMER, this.bottomToMiddleHandler);
            this.setFilter(0);
            this._timer.start();
        }
        private function middle():void{
            this.clearAllEvent();
            this._timer = new Timer(this._delay2);
            this._timer.addEventListener(TimerEvent.TIMER, this.middleHandler);
            this._timer.start();
        }
        private function middleToTop():void{
            this.clearAllEvent();
            this._timer = new Timer(this._delay1);
            this._timer.addEventListener(TimerEvent.TIMER, this.middleToTopHandler);
            this._timer.start();
        }
        private function bottomToMiddleHandler(_arg1:TimerEvent):void{
            if ((y - this._step) <= this._my){
                this._timer.stop();
                y = this._my;
                this.setFilter(1);
                this.middle();
            } else {
                y = (y - this._step);
                this.setFilter((this._cmfValue[18] + 0.05));
            };
        }
        private function middleHandler(_arg1:TimerEvent):void{
            this._timer.stop();
            this.middleToTop();
        }
        private function middleToTopHandler(_arg1:TimerEvent):void{
            if ((y - this._step) <= ((this._my - this._mh) - 10)){
                this._timer.stop();
                y = (this._my - this._mh);
                this.setFilter(1);
                this.hide();
            } else {
                y = (y - this._step);
                this.setFilter((this._cmfValue[18] - 0.09));
            };
        }
        private function clearAllEvent():void{
            if (this._timer == null){
                return;
            };
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER, this.bottomToMiddleHandler);
            this._timer.removeEventListener(TimerEvent.TIMER, this.middleHandler);
            this._timer.removeEventListener(TimerEvent.TIMER, this.middleToTopHandler);
        }
        public function reposition(_arg1:Number, _arg2:Number):void{
            this._w = _arg1;
            this._h = _arg2;
            x = (this._mx = Math.floor(((this._w - width) / 2)));
        }
        public function set oParent(_arg1:Sprite):void{
            this._oParent = _arg1;
        }
        public function set delay(_arg1:int):void{
        }

    }
}//package 
