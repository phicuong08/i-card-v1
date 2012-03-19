//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.controls {
    import flash.events.*;
    import flash.display.*;
    import ICard.views.*;
    import flash.utils.*;
    import flash.geom.*;
    import ICard.assist.view.interfaces.*;

    public class Drag implements IDrag {

        private static var _obj:Drag;

        private var _targets:Dictionary;
        private var _target:DisplayObject;
        private var _onMouseDown:Function;

        public function Drag(){
            this._targets = new Dictionary();
            super();
        }
        public static function getInstance():IDrag{
            if (!_obj){
                _obj = new (Drag)();
            };
            return (_obj);
        }

        public function addTarget(_arg1:DisplayObject, _arg2:DisplayObject):void{
            if (this._targets[_arg1]){
                this.removeTarget(_arg1);
            };
            this._targets[_arg1] = {container:_arg2};
            this.addEvent(_arg1, _arg2);
        }
        public function removeTarget(_arg1:DisplayObject):void{
            if (((_arg1) && (this._targets[_arg1]))){
                this.removeEvent(_arg1);
                delete this._targets[_arg1];
            };
        }
        public function get targets():Dictionary{
            return (this._targets);
        }
        public function set onMouseDown(_arg1:Function):void{
            this._onMouseDown = _arg1;
        }
        public function toString():String{
            var _local3:Object;
            var _local1 = 1;
            var _local2 = "============\n";
            for (_local3 in this._targets) {
                _local2 = (_local2 + ((((((((((("[" + _local1) + "], ") + _local3) + " : \n") + "\tname   : ") + _local3.name) + "\n") + "\tparent : ") + _local3.parent) + "\n") + "\n"));
                _local1++;
            };
            _local2 = (_local2 + "============\n");
            return (_local2);
        }
        private function addEvent(_arg1:DisplayObject, _arg2:DisplayObject):void{
            var isMouseDown:* = false;
            var curX:* = NaN;
            var curY:* = NaN;
            var mouseX:* = NaN;
            var mouseY:* = NaN;
            var pLT:* = null;
            var pRB:* = null;
            var pTemp:* = null;
            var mouseMove:* = null;
            var mouseUp:* = null;
            var titleBar:* = _arg1;
            var window:* = _arg2;
            isMouseDown = false;
            pLT = new Point(0, 0);
            pRB = new Point(0, 0);
            var updatePLT:* = function (_arg1:Stage):void{
                var _local2:Number = 0;
                var _local3:Number = 0;
                if (_arg1.stageWidth > Structure.maxStageWidth){
                    _local2 = ((_arg1.stageWidth - Structure.maxStageWidth) / 2);
                };
                if (_arg1.stageHeight > Structure.maxStageHeight){
                    _local3 = ((_arg1.stageHeight - Structure.maxStageHeight) / 2);
                };
                pLT.x = _local2;
                pLT.y = _local3;
            };
            var mouseDown:* = function ():void{
                isMouseDown = true;
                var _local1:Stage = titleBar.stage;
                var _local2:DisplayObject = window.parent;
                window.parent.addChild(window);
                curX = window.x;
                curY = window.y;
                mouseX = _local2.mouseX;
                mouseY = _local2.mouseY;
                updatePLT(_local1);
                var _local3:Number = pLT.x;
                var _local4:Number = pLT.y;
                pTemp = _local2.globalToLocal(pLT);
                pLT.x = pTemp.x;
                pLT.y = pTemp.y;
                pTemp = new Point(((_local3 + Structure.stageWidth) - window.width), ((_local4 + Structure.stageHeight) - window.height));
                pTemp = _local2.globalToLocal(pTemp);
                pRB.x = pTemp.x;
                pRB.y = pTemp.y;
                _local1.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove, false, 0, true);
                _local1.addEventListener(MouseEvent.MOUSE_UP, mouseUp, false, 0, true);
                if ((_onMouseDown is Function)){
                    _onMouseDown(window);
                };
            };
            mouseMove = function ():void{
                if (isMouseDown == false){
                    return;
                };
                var _local1:Stage = titleBar.stage;
                if (_local1 == null){
                    return;
                };
                var _local2:DisplayObject = window.parent;
                var _local3:Number = Math.floor(((curX + _local2.mouseX) - mouseX));
                var _local4:Number = Math.floor(((curY + _local2.mouseY) - mouseY));
                if (_local3 < pLT.x){
                    _local3 = pLT.x;
                } else {
                    if (_local3 > pRB.x){
                        _local3 = pRB.x;
                    };
                };
                if (_local4 < pLT.y){
                    _local4 = pLT.y;
                } else {
                    if (_local4 > pRB.y){
                        _local4 = pRB.y;
                    };
                };
                window.x = _local3;
                window.y = _local4;
            };
            mouseUp = function ():void{
                isMouseDown = false;
                var _local1:Stage = titleBar.stage;
                if (_local1 == null){
                    return;
                };
                _local1.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
                _local1.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
            };
            this._targets[titleBar].mouseDown = mouseDown;
            titleBar.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown, false, 0, true);
        }
        private function removeEvent(_arg1:DisplayObject):void{
            _arg1.removeEventListener(MouseEvent.MOUSE_DOWN, this._targets[_arg1].mouseDown);
        }

    }
}//package com.assist.view.controls 
