//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
 //   import mx.effects.*;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import custom_effect.*;
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

    public class RollNumGroup extends Group {

        public static const ROLL_TO_ZERO:String = "rollToZero";

        private var __moduleFactoryInitialized:Boolean = false;
        protected var currentNum:int = -1;
        protected var rollNumWindows:Array;
        protected var _numDistance:Number = 6;
        protected var _rollDuration:Number = 200;
        protected var _moveDuration:Number = 200;

        public function RollNumGroup(){
            this.rollNumWindows = new Array();
            super();
            this.layout = this._RollNumGroup_BasicLayout1_c();
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
                this.fontSize = 12;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function set numDistance(_arg1:Number):void{
            this._numDistance = _arg1;
        }
        public function get numDistance():Number{
            return (this._numDistance);
        }
        public function set rollDuration(_arg1:Number):void{
            this._rollDuration = _arg1;
        }
        public function get rollDuration():Number{
            return (this._rollDuration);
        }
        public function set moveDuration(_arg1:Number):void{
            this._moveDuration = _arg1;
        }
        public function get moveDuration():Number{
            return (this._moveDuration);
        }
        public function setNum(_arg1:int, _arg2:Boolean=true):void{
            var _local7:OneRollNum;
            this.currentNum = _arg1;
            var _local3:String = _arg1.toString();
            var _local4:int = this.rollNumWindows.length;
            while (_local4 < _local3.length) {
                this.createRollNumWindow(_arg2);
                _local4++;
            };
            var _local5:Array = this.rollNumWindows.slice();
            var _local6:int;
            while (_local6 < _local5.length) {
                if (_local6 >= _local3.length){
                    if (_arg2){
                        (_local5[_local6] as OneRollNum).num = 0;
                    } else {
                        _local7 = (_local5[_local6] as OneRollNum);
                        removeElement(_local7);
                        this.rollNumWindows.splice(this.rollNumWindows.indexOf(_local7), 1);
                    };
                } else {
                    if (_arg2){
                        (_local5[_local6] as OneRollNum).num = int(_local3.charAt(((_local3.length - _local6) - 1)));
                    } else {
                        (_local5[_local6] as OneRollNum).originalNum = int(_local3.charAt(((_local3.length - _local6) - 1)));
                    };
                };
                _local6++;
            };
            this.setAllRollNumWindowPos(_arg2);
        }
        public function getNum():int{
            return (this.currentNum);
        }
        protected function rollEffectEnd(_arg1:Event):void{
            var _local4:FakeFadeEffect;
            if ((((this.currentNum == 0)) && ((this.rollNumWindows.length == 1)))){
                dispatchEvent(new Event(ROLL_TO_ZERO));
                return;
            };
            var _local2:OneRollNum = (_arg1.currentTarget as OneRollNum);
            var _local3:int = this.rollNumWindows.indexOf(_local2);
            if (_local3 >= this.currentNum.toString().length){
                _local4 = new FakeFadeEffect(_local2, 300, 1, 0);
                _local4.play();
                removeElement(_local2);
                this.rollNumWindows.splice(_local3, 1);
                this.setAllRollNumWindowPos();
            };
        }
        protected function createRollNumWindow(_arg1:Boolean=true):void{
            var _local3:spark.effects.Fade;
            var _local2:OneRollNum = new OneRollNum();
            _local2.rollDura = this._rollDuration;
            _local2.width = getStyle("fontSize");
            _local2.height = (getStyle("fontSize") - 2);
            _local2.addEventListener("rollEffectEnd", this.rollEffectEnd);
            addElement(_local2);
            if (_arg1){
                _local3 = new Fade(_local2);
                _local3.duration = 300;
                _local3.alphaFrom = 0;
                _local3.alphaTo = 1;
                _local3.play();
            };
            this.rollNumWindows.push(_local2);
        }
        protected function setAllRollNumWindowPos(_arg1:Boolean=true):void{
            var _local3:OneRollNum;
            var _local4:Number;
            var _local5:Move;
            var _local2:int;
            while (_local2 < this.rollNumWindows.length) {
                _local3 = (this.rollNumWindows[((this.rollNumWindows.length - _local2) - 1)] as OneRollNum);
                _local4 = this.getRollNumXPos(_local2, this.rollNumWindows.length);
                if (_arg1){
                    if (_local4 != _local3.x){
                        _local5 = new Move(_local3);
                        _local5.xTo = _local4;
                        _local5.duration = this._moveDuration;
                        _local5.play();
                    };
                } else {
                    _local3.x = _local4;
                };
                _local2++;
            };
        }
        protected function getRollNumXPos(_arg1:int, _arg2:int):Number{
            return (((_arg1 * this._numDistance) - ((_arg2 * this._numDistance) / 2)));
        }
        private function _RollNumGroup_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }

    }
}//package custom_control 
