package {
    import flash.display.*;
    import com.assist.view.interfaces.*;
    import flash.geom.*;
    import flash.utils.*;
    import flash.events.*;
    import com.assist.view.controls.*;
    import com.assist.*;
    import flash.text.*;

    public class oAlert extends Sprite implements IAlert {

        public var _Content:TextField;
        public var _Checked:MovieClip;
        public var _Yes:MovieClip;
        public var _No:MovieClip;
        public var _Cancel:MovieClip;
        private var _yesLabelTip:String = "";
        private var _noLabelTip:String = "";
        private var _cancelLabelTip:String = "";
        private var _yesLabel:String = "Yes";
        private var _noLabel:String = "No";
        private var _cancelLabel:String = "Cancel";
        private var _yesEnabled:Boolean = true;
        private var _noEnabled:Boolean = true;
        private var _cancelEnabled:Boolean = true;
        private var _firstButton:uint = 1;
        private var _hasCheckbox:Boolean = false;
        private var _tip:ITip;
        private var _parent:Sprite;
        private var _visible:Boolean = false;
        private var _closeHander:Function;
        private var _defaultPosition:Dictionary;
        private var _infoDefaultWidth:int = 238;
        private var _defaultX:Number;
        private var _defaultY:Number;
        private var _defaultW:Number;
        private var _defaultH:Number;
        private var _minW:int;
        private var _minH:int;
        private var _maxW:int;
        private var _maxH:int;
        private var _timerIn:Timer;
        private var _listIn:Array;
        private var _timerOut:Timer;
        private var _list:Array;

        public function oAlert(){
            this._defaultPosition = new Dictionary();
            this._listIn = [];
            this._list = [];
            super();
            this._Checked.buttonMode = true;
            this._Checked.useHandCursor = true;
            this.settleButton(this._Yes, this._yesLabel);
            this.settleButton(this._No, this._noLabel);
            this.settleButton(this._Cancel, this._cancelLabel);
            this._defaultW = width;
            this._defaultH = height;
        }
        public function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
            if (_arg1){
                this._minW = _arg1;
            } else {
                _arg1 = this._minW;
            };
            if (_arg2){
                this._minH = _arg2;
            } else {
                _arg2 = this._minH;
            };
            if (_arg3){
                this._maxW = _arg3;
            } else {
                _arg3 = this._maxW;
            };
            if (_arg4){
                this._maxH = _arg4;
            } else {
                _arg4 = this._maxH;
            };
            if ((((this._parent == null)) || ((parent == null)))){
                return;
            };
            var _local5:Number = Math.max(_arg1, Math.min(_arg3, stage.stageWidth));
            var _local6:Number = Math.max(_arg2, Math.min(_arg4, stage.stageHeight));
            this._parent.graphics.clear();
            this._parent.graphics.beginFill(0, 0);
            this._parent.graphics.drawRect(0, 0, this._parent.stage.stageWidth, this._parent.stage.stageHeight);
            this._parent.graphics.endFill();
            x = Math.floor(((_local5 - width) / 2));
            y = Math.floor(((_local6 - height) / 2));
            this._defaultX = x;
            this._defaultY = y;
        }
        public function show(_arg1:String, _arg2:uint=1, _arg3:Function=null):void{
            this.formatText(_arg1);
            this._closeHander = _arg3;
            this.buttonState(this._Yes, this._yesLabel, this._yesLabelTip, this._yesEnabled);
            this.buttonState(this._No, this._noLabel, this._noLabelTip, this._noEnabled);
            this.buttonState(this._Cancel, this._cancelLabel, this._cancelLabelTip, this._cancelEnabled);
            var _local4:Array = [];
            switch (_arg2){
                case 1:
                    this.yesVisible = true;
                    _local4.push(this._Yes);
                    this._firstButton = AlertButtonType.Yes;
                    break;
                case 2:
                    this.noVisible = true;
                    _local4.push(this._No);
                    this._firstButton = AlertButtonType.No;
                    break;
                case 3:
                    this.yesVisible = true;
                    this.noVisible = true;
                    _local4.push(this._Yes, this._No);
                    this._firstButton = AlertButtonType.Yes;
                    break;
                case 4:
                    this.cancelVisible = true;
                    _local4.push(this._Cancel);
                    this._firstButton = AlertButtonType.Cancel;
                    break;
                case 5:
                    this.yesVisible = true;
                    this.cancelVisible = true;
                    _local4.push(this._Yes, this._Cancel);
                    this._firstButton = AlertButtonType.Yes;
                    break;
                case 6:
                    this.noVisible = true;
                    this.cancelVisible = true;
                    _local4.push(this._No, this._Cancel);
                    this._firstButton = AlertButtonType.No;
                    break;
                case 7:
                    this.yesVisible = true;
                    this.noVisible = true;
                    this.cancelVisible = true;
                    _local4.push(this._Yes, this._No, this._Cancel);
                    this._firstButton = AlertButtonType.Yes;
                    break;
                default:
                    this.yesVisible = true;
                    _local4.push(this._Yes);
                    this._firstButton = AlertButtonType.Yes;
            };
            var _local5 = 10;
            var _local6:Number = (((_local4.length - 1) * _local5) + (_local4[0].width * _local4.length));
            var _local7:Number = ((width - _local6) / 2);
            var _local8:int;
            while (_local8 < _local4.length) {
                _local4[_local8].x = (_local7 + (_local8 * (_local4[_local8].width + _local5)));
                _local8++;
            };
            this._Checked.visible = this._hasCheckbox;
            this._Checked._Box.gotoAndStop(1);
            this._Checked.addEventListener(MouseEvent.CLICK, this.onCheckedHandler);
            if (this._parent){
                this._parent.addChild(this);
                this._visible = true;
            };
            this.reposition(0, 0, 0, 0);
            visible = false;
            this.startFadeIn();
        }
        public function updateContent(_arg1:String):void{
            this.formatText(_arg1);
        }
        private function formatText(_arg1:String):void{
            this._Content.htmlText = _arg1;
            this._Content.autoSize = TextFieldAutoSize.LEFT;
            this._Content.multiline = false;
            this._Content.wordWrap = false;
            var _local2:TextFormat = new TextFormat();
            _local2.leading = 5;
            _local2.align = "center";
            this._Content.setTextFormat(_local2);
            var _local3:Boolean = /\r|\n/.test(_arg1);
            if ((((this._Content.width > this._infoDefaultWidth)) || (_local3))){
                _local2.align = (_local3) ? "center" : "left";
                this._Content.y = 29;
                this._Content.height = 50;
                this._Content.multiline = true;
                this._Content.wordWrap = true;
            } else {
                this._Content.y = 38;
                this._Content.height = 18;
            };
            this._Content.autoSize = "none";
            this._Content.width = this._infoDefaultWidth;
            this._Content.setTextFormat(_local2);
        }
        public function hide():void{
            this.startFadeOut();
            if (this._parent){
                this._parent.graphics.clear();
            };
            if (parent){
                parent.removeChild(this);
            };
            if (this._tip){
                this._tip.hide();
                this._tip.removeTarget(this._Yes);
                this._tip.removeTarget(this._No);
                this._tip.removeTarget(this._Cancel);
            };
            this._yesLabelTip = "";
            this._noLabelTip = "";
            this._cancelLabelTip = "";
            this._yesLabel = "Yes";
            this._noLabel = "No";
            this._cancelLabel = "Cancel";
            this._yesEnabled = true;
            this._noEnabled = true;
            this._cancelEnabled = true;
            this._hasCheckbox = false;
            this._visible = false;
        }
        private function onCheckedHandler(_arg1:MouseEvent):void{
            var _local2:int = this._Checked._Box.currentFrame;
            this._Checked._Box.gotoAndStop(((_local2 == 1)) ? 2 : 1);
        }
        private function settleButton(_arg1:MovieClip, _arg2:String):void{
            _arg1._Name.text = _arg2;
            _arg1._Name.mouseEnabled = false;
            _arg1.buttonMode = true;
            _arg1.visible = true;
            this._defaultPosition[_arg1] = new Point(_arg1._Name.x, _arg1._Name.y);
            _arg1.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOverHandler);
            _arg1.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOutHandler);
            _arg1.addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDownHandler);
            _arg1.addEventListener(MouseEvent.MOUSE_UP, this.onMouseUpHandler);
            _arg1.addEventListener(MouseEvent.CLICK, this.onClickHandler);
        }
        private function onMouseOverHandler(_arg1:MouseEvent):void{
            _arg1.target.gotoAndStop(2);
        }
        private function onMouseOutHandler(_arg1:MouseEvent):void{
            _arg1.target.gotoAndStop(1);
            _arg1.target._Name.x = this._defaultPosition[_arg1.target].x;
            _arg1.target._Name.y = this._defaultPosition[_arg1.target].y;
        }
        private function onMouseDownHandler(_arg1:MouseEvent):void{
            _arg1.target.gotoAndStop(3);
            _arg1.target._Name.x = (this._defaultPosition[_arg1.target].x + 1);
            _arg1.target._Name.y = (this._defaultPosition[_arg1.target].y + 1);
        }
        private function onMouseUpHandler(_arg1:MouseEvent):void{
            _arg1.target.gotoAndStop(2);
            _arg1.target._Name.x = this._defaultPosition[_arg1.target].x;
            _arg1.target._Name.y = this._defaultPosition[_arg1.target].y;
        }
        private function onClickHandler(_arg1:MouseEvent):void{
            var _local2:int = AlertButtonType.Yes;
            if (_arg1.target == this._No){
                _local2 = AlertButtonType.No;
            } else {
                if (_arg1.target == this._Cancel){
                    _local2 = AlertButtonType.Cancel;
                };
            };
            this.hide();
            if ((this._closeHander is Function)){
                this._closeHander(_local2);
            };
        }
        private function set yesVisible(_arg1:Boolean):void{
            this._Yes.visible = _arg1;
        }
        private function set noVisible(_arg1:Boolean):void{
            this._No.visible = _arg1;
        }
        private function set cancelVisible(_arg1:Boolean):void{
            this._Cancel.visible = _arg1;
        }
        private function buttonState(_arg1:MovieClip, _arg2:String, _arg3:String, _arg4:Boolean):void{
            _arg1.visible = false;
            _arg1._Name.text = _arg2;
            _arg1.mouseEnabled = _arg4;
            _arg1.filters = (_arg4) ? [] : [Filter.filter1];
            if (_arg3){
                this._tip.addTarget(_arg1, _arg3);
            };
        }
        public function defaultCloseEvent():void{
            this.hide();
            if ((this._closeHander is Function)){
                this._closeHander(this._firstButton);
            };
        }
        private function startFadeIn():void{
            if (this._parent == null){
                return;
            };
            if (this._timerIn == null){
                this._timerIn = new Timer(10);
                this._timerIn.addEventListener(TimerEvent.TIMER, this.onFadeIn);
            };
            var _local1:BitmapData = new BitmapData(width, height, true, 0);
            _local1.draw(this);
            var _local2:Bitmap = new Bitmap(_local1);
            this._parent.addChild(_local2);
            _local2.scaleX = 0.5;
            _local2.scaleY = 0.5;
            _local2.x = (this._defaultX + ((this._defaultW - _local2.width) / 2));
            _local2.y = (this._defaultY + ((this._defaultH - _local2.height) / 2));
            this._listIn.push(_local2);
            if (this._listIn.length == 1){
                this._timerIn.start();
            };
        }
        private function onFadeIn(_arg1:TimerEvent):void{
            var _local4:Bitmap;
            var _local2:int = this._listIn.length;
            var _local3:int = (_local2 - 1);
            while (_local3 > -1) {
                _local4 = this._listIn[_local3];
                if (_local4.scaleX < 1){
                    _local4.scaleX = (_local4.scaleX + 0.1);
                    _local4.scaleY = (_local4.scaleY + 0.1);
                    _local4.x = (this._defaultX + ((this._defaultW - _local4.width) / 2));
                    _local4.y = (this._defaultY + ((this._defaultH - _local4.height) / 2));
                };
                if (_local4.scaleX > 0.9){
                    this._parent.removeChild(_local4);
                    this._listIn.splice(_local3, 1);
                    visible = true;
                };
                _local3--;
            };
            if (this._listIn.length == 0){
                this._timerIn.stop();
            };
        }
        private function startFadeOut():void{
            if ((((this._parent == null)) || ((parent == null)))){
                return;
            };
            if (this._timerOut == null){
                this._timerOut = new Timer(10);
                this._timerOut.addEventListener(TimerEvent.TIMER, this.onFadeOut);
            };
            var _local1:BitmapData = new BitmapData(width, height, true, 0);
            _local1.draw(this);
            var _local2:Bitmap = new Bitmap(_local1);
            this._parent.addChild(_local2);
            _local2.x = x;
            _local2.y = y;
            this._list.push(_local2);
            if (this._list.length == 1){
                this._timerOut.start();
            };
        }
        private function onFadeOut(_arg1:TimerEvent):void{
            var _local4:Bitmap;
            var _local2:int = this._list.length;
            var _local3:int = (_local2 - 1);
            while (_local3 > -1) {
                _local4 = this._list[_local3];
                this._list[_local3].alpha = (_local4.alpha - 0.15);
                if ((_local4.scaleX - 0.08) > 0){
                    _local4.scaleX = (_local4.scaleX - 0.08);
                    _local4.scaleY = (_local4.scaleY - 0.08);
                    _local4.x = (this._defaultX + ((this._defaultW - _local4.width) / 2));
                    _local4.y = (this._defaultY + ((this._defaultH - _local4.height) / 2));
                };
                if (_local4.alpha <= 0){
                    _local4.parent.removeChild(_local4);
                    this._list.splice(_local3, 1);
                };
                _local3--;
            };
            if (this._list.length == 0){
                this._timerOut.stop();
            };
        }
        public function get content():Sprite{
            return (this);
        }
        public function set oParent(_arg1:Sprite):void{
            this._parent = _arg1;
        }
        public function set tip(_arg1:ITip):void{
            this._tip = _arg1;
        }
        public function set yesLabelTip(_arg1:String):void{
            this._yesLabelTip = _arg1;
        }
        public function set noLabelTip(_arg1:String):void{
            this._noLabelTip = _arg1;
        }
        public function set cancelLabelTip(_arg1:String):void{
            this._cancelLabelTip = _arg1;
        }
        public function set yesLabel(_arg1:String):void{
            this._yesLabel = _arg1;
        }
        public function set noLabel(_arg1:String):void{
            this._noLabel = _arg1;
        }
        public function set cancelLabel(_arg1:String):void{
            this._cancelLabel = _arg1;
        }
        public function set yesEnabled(_arg1:Boolean):void{
            this._yesEnabled = _arg1;
        }
        public function set noEnabled(_arg1:Boolean):void{
            this._noEnabled = _arg1;
        }
        public function set cancelEnabled(_arg1:Boolean):void{
            this._cancelEnabled = _arg1;
        }
        public function set hasCheckbox(_arg1:Boolean):void{
            this._hasCheckbox = _arg1;
        }
        public function get checked():Boolean{
            return ((this._Checked._Box.currentFrame == 2));
        }
        override public function get visible():Boolean{
            return (this._visible);
        }

    }
}//package 
