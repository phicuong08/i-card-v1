//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.controls {
    import ICard.assist.*;
    import ICard.assist.view.*;
    import ICard.assist.view.interfaces.*;
    
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.utils.*;

    public class Tip extends Sprite implements ITip {

        public static const LEFT:int = -1;
        public static const RIGHT:int = 1;

        private static var _offset:Point = new Point(0, 0);
        private static var _obj:Tip;

        private var _parent:Sprite;
        private var _targets:Dictionary;
        private var _target:DisplayObject;
        private var _content:DisplayObject;
        private var _contentOffset:Point;
        private var _contentSpan:Point;
        private var _mouseOffset:Point;
        private var _dir:int = 0;
        private var _openedTarget:Object;
        private var _tempX:Number = 0;
        private var _tempY:Number = 0;
        private var _enterFrame:Function;
        private var _txtTween:TextField;
        private var _speed:Number = 0.15;
        private var _angle:Number = 0;

        public function Tip(){
            this._targets = new Dictionary();
            this._contentOffset = new Point(6, 6);
            this._contentSpan = new Point(10, 0);
            this._mouseOffset = new Point(15, 15);
            this._openedTarget = {};
            super();
            mouseEnabled = false;
            this.initTextTip();
        }
        public static function set offset(_arg1:Point):void{
            _offset = _arg1;
            _obj.hideOpened();
        }
        public static function getInstance():ITip{
            if (!_obj){
                _obj = new (Tip)();
            };
            return (_obj);
        }

        public function get stageOffset():Point{
            return (_offset);
        }
        public function addTarget(_arg1:DisplayObject, _arg2:Object=null):void{
            this.clearTarget(_arg1);
            this.addOne(_arg1, _arg2);
            this.addEvent(_arg1);
        }
        public function addTargetMoreTips(_arg1:DisplayObject, ... _args):void{
            this.clearTarget(_arg1);
            var _local3:int = _args.length;
            var _local4:int;
            while (_local4 < _local3) {
                this.addOne(_arg1, _args[_local4]);
                _local4++;
            };
            this.addEvent(_arg1);
        }
	
        public function addFixedTarget(_arg1:DisplayObject, _arg2:Object, _arg3:Point, _arg4:Boolean=true):void{
            this.clearTarget(_arg1);
            this.addOne(_arg1, _arg2, _arg3, _arg4);
            this.addEvent(_arg1);
        }
        private function addOne(_arg1:DisplayObject, _arg2:*, _arg3:Point=null, _arg4:Boolean=true):void{
            var d:* = null;
            var target:* = _arg1;
            var content:* = _arg2;
            var pos:Point = _arg3;
            var topBase:Boolean = _arg4;
            if ((content is String)){
                d = new TextField();
                var _local6:TextField = (d as TextField);
                with (_local6) {
                    selectable = false;
                    autoSize = TextFieldAutoSize.LEFT;
                    multiline = true;
                    htmlText = HtmlText.white(content);
                };
            } else {
                if ((content is DisplayObject)){
                    d = content;
                };
            };
            if (null == this._targets[target]){
                this._targets[target] = {
                    contents:[],
                    pos:pos,
                    topBase:topBase
                };
            };
            this._targets[target]["contents"].push(d);
        }
        public function removeTarget(_arg1:DisplayObject):void{
            if (((_arg1) && (this._targets[_arg1]))){
                this.hide();
                this.removeEvent(_arg1);
                delete this._targets[_arg1];
            };
        }
        private function addEvent(_arg1:DisplayObject):void{
            var mouseMove:* = null;
            var target:* = _arg1;
            mouseMove = function (_arg1:MouseEvent):void{
                var _local5:int;
                var _local6:int;
                var _local7:int;
                if (stage == null){
                    return;
                };
                _target = target;
                if (((!(_targets[target])) || (!(_targets[target]["contents"])))){
                    return;
                };
                var _local2:DisplayObject = _targets[target]["contents"][0];
                if (((_content) && (!((_content == _local2))))){
                    while (numChildren) {
                        removeChildAt(0);
                    };
                    _content = null;
                };
                if (_content != _local2){
                    _content = _local2;
                    _local6 = _targets[target]["contents"].length;
                    _local7 = 0;
                    while (_local7 < _local6) {
                        _local2 = _targets[target]["contents"][_local7];
                        addChild(_local2);
                        _local7++;
                    };
                    draw();
                };
                var _local3:Number = (_parent.mouseX + _mouseOffset.x);
                var _local4:Number = (_parent.mouseY + _mouseOffset.y);
                if ((_local3 + width) > (stage.stageWidth - (_offset.x * 2))){
                    _local3 = (((_parent.mouseX - width) - _mouseOffset.x) + 5);
                    _local5 = Tip.LEFT;
                } else {
                    _local5 = Tip.RIGHT;
                };
                if ((_local4 + height) > (stage.stageHeight - (_offset.y * 2))){
                    _local4 = (((_parent.mouseY - height) - _mouseOffset.y) + 5);
                };
                if (_local4 < _mouseOffset.y){
                    _local4 = _mouseOffset.y;
                };
                if (_targets[target].pos != null){
                    x = _targets[target].pos.x;
                    y = (_targets[target].pos.y - height);
                } else {
                    x = Math.floor(_local3);
                    y = Math.floor(_local4);
                };
                if (_local5 != _dir){
                    _dir = _local5;
                    draw();
                };
                _arg1.updateAfterEvent();
            };
            var mouseOver:* = function (_arg1:MouseEvent):void{
                removeEnterFrame();
                show();
                target.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove, false, 0, true);
            };
            var mouseOut:* = function (_arg1:MouseEvent):void{
                hide();
                target.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
            };
            this._targets[target].mouseOver = mouseOver;
            this._targets[target].mouseOut = mouseOut;
            this._targets[target].mouseMove = mouseMove;
            target.addEventListener(MouseEvent.ROLL_OVER, mouseOver, false, 0, true);
            target.addEventListener(MouseEvent.ROLL_OUT, mouseOut, false, 0, true);
        }
        private function removeEvent(_arg1:DisplayObject):void{
            _arg1.removeEventListener(MouseEvent.MOUSE_OVER, this._targets[_arg1].mouseOver);
            _arg1.removeEventListener(MouseEvent.MOUSE_OUT, this._targets[_arg1].mouseOut);
            _arg1.removeEventListener(MouseEvent.MOUSE_MOVE, this._targets[_arg1].mouseMove);
        }
        private function clearTarget(_arg1:DisplayObject):void{
            if (_arg1 == null){
                throw (new Error("target不能为null！"));
            };
            if (this._targets[_arg1]){
                this.removeTarget(_arg1);
            };
        }
        public function updateTarget(_arg1:DisplayObject=null):void{
            this.draw();
            this.updateTarget1();
        }
        private function show():void{
            if (this._parent){
                this._parent.addChild(this);
            };
            if ((((x == 0)) && ((y == 0)))){
                x = 10000;
                y = 10000;
            };
        }
        public function hide():void{
            this._target = null;
            this._content = null;
            graphics.clear();
            this.removeEnterFrame();
            if (((this._parent) && (parent))){
                parent.removeChild(this);
            };
            while (numChildren) {
                removeChildAt(0);
            };
        }
        private function draw():void{
            var addonX:* = 0;
            var addonY:* = 0;
            var i:* = 0;
            if (this._target == null){
                return;
            };
            graphics.clear();
            addonX = 0;
            addonY = 0;
            var handler:* = function (_arg1:int):void{
                var _local2:DisplayObject = _targets[_target]["contents"][_arg1];
                visible = _local2.visible;
                var _local3:int = (_local2) ? (_local2.width + (_contentOffset.x * 2)) : 100;
                var _local4:int = (_local2) ? (_local2.height + (_contentOffset.y * 2)) : 50;
                var _local5:int = 8;
                graphics.lineStyle(1, 0, 0.3);
                graphics.beginFill(0, 0.75);
                graphics.drawRoundRect((2 + addonX), (2 + addonY), _local3, _local4, _local5, _local5);
                graphics.endFill();
                graphics.lineStyle(1, 8082482);
                graphics.beginFill(0x111111);
                graphics.drawRoundRect((0 + addonX), (0 + addonY), _local3, _local4, _local5, _local5);
                graphics.endFill();
                _local2.x = (_contentOffset.x + addonX);
                _local2.y = (_contentOffset.y + addonY);
                addonX = (addonX + (_local3 + 5));
                addonY = (addonY + _contentSpan.y);
            };
            var start:* = 0;
            var end:* = this._targets[this._target]["contents"].length;
            if (Tip.LEFT == this._dir){
                i = (end - 1);
                while (i >= start) {
                    handler(i);
                    i = (i - 1);
                };
            } else {
                i = start;
                while (i < end) {
                    handler(i);
                    i = (i + 1);
                };
            };
        }
        public function clickToOpen(_arg1:Object, _arg2:Event=null):Sprite{
            var d:* = null;
            var content:* = _arg1;
            var e:Event = _arg2;
            var container:* = new Sprite();
            this._parent.addChild(container);
            if ((content is DisplayObject)){
                d = content;
            } else {
                d = new TextField();
                var _local4:TextField = (d as TextField);
                with (_local4) {
                    selectable = false;
                    autoSize = TextFieldAutoSize.LEFT;
                    multiline = true;
                    htmlText = (("<font color=\"#ffffff\">" + content) + "</font>");
                };
            };
            this._openedTarget["container"] = container;
            this._openedTarget["content"] = d;
            d.x = this._contentOffset.x;
            d.y = this._contentOffset.y;
            container.addChild(d);
            var handler:* = this.clickToClose(container);
            this._parent.stage.addEventListener(MouseEvent.CLICK, handler);
            this._parent.stage.addEventListener(MouseEvent.CLICK, handler, true);
            this._openedTarget["mouseX"] = this._parent.mouseX;
            this._openedTarget["mouseY"] = this._parent.mouseY;
            this.updateTarget1();
            return (container);
        }
        private function clickToClose(_arg1:DisplayObject):Function{
            var handler:* = null;
            var container:* = _arg1;
            handler = function (_arg1:MouseEvent):void{
                var _local2:DisplayObject = (_arg1.target as DisplayObject);
                while (_local2) {
                    if (_local2 == container){
                        break;
                    };
                    _local2 = _local2.parent;
                };
                _parent.stage.removeEventListener(MouseEvent.CLICK, handler);
                _parent.stage.removeEventListener(MouseEvent.CLICK, handler, true);
                if (((container) && (container.parent))){
                    container.parent.removeChild(container);
                };
            };
            return (handler);
        }
        public function hideOpened():void{
            var _local1:Sprite = this._openedTarget["container"];
            if (((_local1) && (_local1.parent))){
                _local1.parent.removeChild(_local1);
            };
        }
        private function updateTarget1():void{
            var _local1:Sprite = this._openedTarget["container"];
            var _local2:Object = this._openedTarget["content"];
            if ((((_local1 == null)) || ((_local1.parent == null)))){
                return;
            };
            var _local3:int;
            var _local4:int;
            var _local5:int = (_local2) ? (_local2.width + (this._contentOffset.x * 2)) : 100;
            var _local6:int = (_local2) ? (_local2.height + (this._contentOffset.y * 2)) : 50;
            var _local7:int = 8;
            _local1.graphics.clear();
            _local1.graphics.lineStyle(1, 0, 0.3);
            _local1.graphics.beginFill(0, 0.75);
            _local1.graphics.drawRoundRect((2 + _local3), (2 + _local4), _local5, _local6, _local7, _local7);
            _local1.graphics.endFill();
            _local1.graphics.lineStyle(1, 8082482);
            _local1.graphics.beginFill(0x111111);
            _local1.graphics.drawRoundRect((0 + _local3), (0 + _local4), _local5, _local6, _local7, _local7);
            _local1.graphics.endFill();
            this.updatePosition(_local1);
        }
        private function updatePosition(_arg1:Sprite):void{
            var _local2:Number = this._openedTarget["mouseX"];
            var _local3:Number = this._openedTarget["mouseY"];
            var _local4:Number = (_local2 + this._mouseOffset.x);
            var _local5:Number = (_local3 + this._mouseOffset.y);
            if ((_local4 + _arg1.width) > (this._parent.stage.stageWidth - (_offset.x * 2))){
                _local4 = ((_local2 - _arg1.width) - this._mouseOffset.x);
            };
            if ((_local5 + _arg1.height) > (this._parent.stage.stageHeight - (_offset.y * 2))){
                _local5 = ((_local3 - _arg1.height) - this._mouseOffset.y);
            };
            if (_local5 < this._mouseOffset.y){
                _local5 = this._mouseOffset.y;
            };
            _arg1.x = Math.floor(_local4);
            _arg1.y = Math.floor(_local5);
        }
        private function moveTo(_arg1:Array, _arg2:Array):void{
            var offsetX:* = NaN;
            var offsetY:* = NaN;
            var start:* = _arg1;
            var end:* = _arg2;
            this.removeEnterFrame();
            var tempEnd:* = end;
            if ((((this._parent.mouseX > x)) && ((this._parent.mouseX <= end[0])))){
                tempEnd[0] = (this._parent.mouseX - 10);
            } else {
                if ((((this._parent.mouseX <= x)) && ((this._parent.mouseX > end[0])))){
                    tempEnd[0] = (this._parent.mouseX + 10);
                };
            };
            if ((((this._parent.mouseY > y)) && ((this._parent.mouseY <= end[1])))){
                tempEnd[1] = (this._parent.mouseY - 10);
            } else {
                if ((((this._parent.mouseY <= y)) && ((this._parent.mouseY > end[1])))){
                    tempEnd[1] = (this._parent.mouseY + 10);
                };
            };
            offsetX = (tempEnd[0] - start[0]);
            offsetY = (tempEnd[1] - start[1]);
            this._enterFrame = function ():void{
                if ((((Math.abs(offsetX) < 1)) && ((Math.abs(offsetY) < 1)))){
                    removeEnterFrame();
                    x = end[0];
                    y = end[1];
                    return;
                };
                offsetX = (offsetX / 2);
                offsetY = (offsetY / 2);
                x = (x + offsetX);
                y = (y + offsetY);
            };
            addEventListener(Event.ENTER_FRAME, this._enterFrame);
        }
        private function removeEnterFrame():void{
            if ((this._enterFrame is Function)){
                removeEventListener(Event.ENTER_FRAME, this._enterFrame);
            };
        }
        public function textTip(_arg1:DisplayObject, _arg2:String, _arg3:uint=0xFFFF00, _arg4:int=18):void{
            this._angle = 0;
            var _local5:String = htmlFormat(_arg2, _arg4, _arg3, true);
            this._txtTween.filters = [Filter.filter2];
            this._txtTween.htmlText = _local5;
            this._txtTween.alpha = this._angle;
            this._txtTween.x = (_arg1.x + ((_arg1.width - this._txtTween.width) / 2));
            this._txtTween.y = (_arg1.y - 27);
            _arg1.parent.addChild(this._txtTween);
            addEventListener(Event.ENTER_FRAME, this.enterFrame);
        }
        private function initTextTip():void{
            this._txtTween = new TextField();
            this._txtTween.mouseEnabled = false;
            this._txtTween.autoSize = TextFieldAutoSize.LEFT;
        }
        private function enterFrame(_arg1:Event):void{
            var _local2:Number = Math.sin(this._angle);
            this._txtTween.alpha = _local2;
            this._angle = (this._angle + this._speed);
            if (this._angle >= 1.5){
                this._txtTween.y = (this._txtTween.y - 0.5);
            };
            if (this._angle >= 3.2){
                this._angle = 0;
                removeEventListener(Event.ENTER_FRAME, this.enterFrame);
                this._txtTween.parent.removeChild(this._txtTween);
            };
        }
        public function set oParent(_arg1:Sprite):void{
            this._parent = _arg1;
        }
        public function get targets():Dictionary{
            return (this._targets);
        }
        override public function toString():String{
            var _local3:Object;
            var _local1:int = 1;
            var _local2:String = "============\n";
            for (_local3 in this._targets) {
                _local2 = (_local2 + ((((((((((("[" + _local1) + "], ") + _local3) + " : \n") + "\tname   : ") + _local3.name) + "\n") + "\tparent : ") + _local3.parent) + "\n") + "\n"));
                _local1++;
            };
            _local2 = (_local2 + "============\n");
            return (_local2);
        }

    }
}//package com.assist.view.controls 
