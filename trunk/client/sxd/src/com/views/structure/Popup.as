//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views.structure {
    import com.*;
    import com.assist.view.*;
    import com.haloer.data.*;
    import com.views.*;
    
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;

    public class Popup extends com.views.structure.Base {

        private var _superViews:Array;
        private var _coexistViews:Array;
        private var _exclusiveViews:Array;
        private var _inTownViews:Array;
        private var _freeViews:Array;
        public var structure:Structure;
        private var _view:View;
        private var _currentAddedView:IView;
        private var _supers:Dictionary;
        private var _views:Dictionary;
        private var _frees:Dictionary;
        private var _supersList:Array;
        private var _viewsList:Array;
        private var _timerOut:Timer;
        private var _hasFade:Boolean = false;
        private var _fadeOutList:Dictionary;
        private var _shape:Sprite;
        private var _alphp:Number = 0;
        private var _processList:Dictionary;
        private var _focusView:IView;

        public function Popup(_arg1:View):void{
            this._supers = new Dictionary();
            this._views = new Dictionary();
            this._frees = new Dictionary();
            this._supersList = [];
            this._viewsList = [];
            this._fadeOutList = new Dictionary();
            this._processList = new Dictionary();
            super();
            this._view = _arg1;
            this._superViews = this._view.superViews;
            this._coexistViews = this._view.coexistViews;
            this._exclusiveViews = this._view.exclusiveViews;
            this._inTownViews = this._view.inTownViews;
            this._freeViews = this._view.freeViews;
            this._view.addToFrameProcessList(this.toString(), this.process);
        }
        public function addView(_arg1:IView, _arg2:Sprite):void{
            if (this.hasViewIncluded(_arg1, this._freeViews)){
                this.removeFadeOutList(_arg1);
                this._frees[_arg1] = _arg2;
                this.addChildWithFade(_arg1, _arg2);
                this._view.chat.updateDepth(_arg1);
                this._view.friendMessage.updateDepth(_arg1);
                if ((_arg1 is TakeBibleRoadView)){
                    this._view.toolbar.functionBarParent = this;
                };
                return;
            };
            if (this.hasViewIncluded(_arg1, this._superViews)){
                this.closeAll();
                this.removeFadeOutList(_arg1);
                this._supers[_arg1] = _arg2;
                this.addChildWithFade(_arg1, _arg2);
                this._view.chat.updateDepth(_arg1);
                return;
            };
            var _local3:Array = this.getCoexistViews(_arg1);
            if (_local3.length > 0){
                _local3 = _local3[0];
            };
            _local3.push(_arg1);
            this.closeExclude(_local3);
            this.removeFadeOutList(_arg1);
            this._views[_arg1] = _arg2;
            this.addChildWithFade(_arg1, _arg2);
            this.setfocusView(_arg1);
            _arg2.mouseChildren = true;
            _arg2.mouseEnabled = true;
            if (_arg2.width < Structure.stageWidth){
                _arg2.x = Math.floor(((Structure.stageWidth - _arg2.width) / 2));
                _arg2.y = Math.floor(((Structure.stageHeight - _arg2.height) / 2));
            };
            if (this._viewsList.indexOf(_arg1) == -1){
                this._viewsList.push(_arg1);
            };
            this._currentAddedView = _arg1;
            this.reposition();
            setTimeout(this.reposition, 10);
        }
        private function addChildWithFade(_arg1:IView, _arg2:Sprite):void{
            var bm:* = null;
            var handle:* = null;
            var timer:* = null;
            var view:* = _arg1;
            var panel:* = _arg2;
            addChild(panel);
        }
        public function closeView(_arg1:IView):void{
            var _local2:Object;
            var _local3:Sprite;
            var _local4:Sprite;
            if (this.hasViewIncluded(_arg1, this._freeViews)){
                _local3 = this._frees[_arg1];
                if (_local3){
                    this.startFadeOut(_arg1, true);
                    this._view.cancelCenter(_arg1.sign);
                    delete this._frees[_arg1];
                    removeChild(_local3);
                    Shortcut.removeView(_arg1);
                };
                return;
            };
            if (this.hasViewIncluded(_arg1, this._superViews)){
                _local4 = this._supers[_arg1];
                if (_local4){
                    if (!(_arg1 is WorldView)){
                        this.startFadeOut(_arg1, true);
                    };
                    this._view.cancelCenter(_arg1.sign);
                    delete this._supers[_arg1];
                    removeChild(_local4);
                    Shortcut.removeView(_arg1);
                };
                return;
            };
            if ((this._views[_arg1] is Sprite)){
                this._views[_arg1].mouseChildren = false;
                this._views[_arg1].mouseEnabled = false;
                this.closeView0(_arg1, true);
            };
            this.setfocusView(null);
            for (_local2 in this._views) {
                if (this.focusView == null){
                    this.setfocusView((_local2 as IView));
                    break;
                };
            };
            setTimeout(this.reposition, 100);
        }
        private function closeView0(_arg1:IView, _arg2:Boolean):void{
            this._view.cancelCenter(_arg1.sign);
            this.startFadeOut(_arg1);
            this.removeView(_arg1);
            if (false == _arg2){
                _arg1.close();
            };
            var _local3:int = this._viewsList.length;
            var _local4:int;
            while (_local4 < _local3) {
                if (_arg1 == this._viewsList[_local4]){
                    this._viewsList.splice(_local4, 1);
                    break;
                };
                _local4++;
            };
            Shortcut.removeView(_arg1);
        }
        private function removeView(_arg1:IView):void{
            if (((this._views[_arg1]) && (this._views[_arg1].parent))){
                removeChild(this._views[_arg1]);
            };
            delete this._views[_arg1];
        }
        private function closeExclude(_arg1:Array):void{
            var _local2:Array = oObject.getKeys(this._views);
            var _local3:int;
            while (_local3 < _local2.length) {
                if (_arg1.indexOf(_local2[_local3]) == -1){
                    this.closeView0((_local2[_local3] as IView), false);
                };
                _local3++;
            };
        }
        override public function closeAll():void{
            var _local3:IView;
            var _local1:Array = oObject.getKeys(this._views);
            var _local2:int;
            while (_local2 < _local1.length) {
                _local3 = _local1[_local2];
                this._view.cancelCenter(_local3.sign);
                this.startFadeOut(_local3);
                this.closeView0(_local3, false);
                _local2++;
            };
            this.setfocusView(null);
        }
        public function hasView(_arg1:IView):Boolean{
            return (((((!(!(this._views[_arg1]))) || (!(!(this._supers[_arg1]))))) || (!(!(this._frees[_arg1])))));
        }
        public function updateFocusView(_arg1:Sprite):void{
            var _local2:*;
            for (_local2 in this._views) {
                if (this._views[_local2] == _arg1){
                    if (this.focusView != _local2){
                        this.setfocusView((_local2 as IView));
                    };
                    break;
                };
            };
        }
        public function getRelatedView(_arg1:DisplayObject):IView{
            var obj:* = _arg1;
            var handler:* = function (_arg1:Dictionary):IView{
                var _local2:*;
                for (_local2 in _arg1) {
                    if (_arg1[_local2].contains(obj)){
                        return (_local2);
                    };
                };
                return (null);
            };
            return (((((handler(this._views)) || (handler(this._supers)))) || (handler(this._frees))));
        }
        private function getCoexistViews(_arg1:IView):Array{
            var _local5:Array;
            var _local6:Array;
            var _local7:Object;
            var _local2:Array = [];
            var _local3:int = this._coexistViews.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = this._coexistViews[_local4];
                if (this.hasViewIncluded(_arg1, _local5) == false){
                } else {
                    _local6 = [];
                    for (_local7 in this._views) {
                        if (this.hasViewIncluded((_local7 as IView), _local5) == true){
                            _local6.push(_local7);
                        };
                    };
                    if (_local6.length > 0){
                        if ((((_local6.length == 1)) && ((_local6[0] is PanelLoadingView)))){
                        } else {
                            _local2.push(_local6);
                        };
                    };
                };
                _local4++;
            };
            return (_local2);
        }
        private function hasViewIncluded(_arg1:IView, _arg2:Array):Boolean{
            var _local3:int = (_arg2) ? _arg2.length : 0;
            var _local4:int;
            while (_local4 < _local3) {
                if ((_arg1 is _arg2[_local4])){
                    return (true);
                };
                _local4++;
            };
            return (false);
        }
        public function allowToOpen(_arg1:IView):Boolean{
            var _local2:Object;
            for (_local2 in this._views) {
                if (this.hasExclusive((_local2 as IView), _arg1)){
                    (_local2 as IView).inStageWithTip;
                    return (false);
                };
            };
            for (_local2 in this._supers) {
                if (this.hasExclusive((_local2 as IView), _arg1)){
                    (_local2 as IView).inStageWithTip;
                    return (false);
                };
            };
            if (this.hasViewIncluded(_arg1, this._freeViews)){
                return (true);
            };
            if ((((this._view.townMap.inStage == false)) && (this.hasViewIncluded((_local2 as IView), this._inTownViews)))){
                return (false);
            };
            return (true);
        }
        private function hasExclusive(_arg1:IView, _arg2:IView):Boolean{
            var _local5:Object;
            var _local6:Array;
            var _local7:Array;
            var _local3:int = this._exclusiveViews.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = this._exclusiveViews[_local4];
                if ((_arg1 is _local5["master"])){
                    _local6 = _local5["black"];
                    _local7 = _local5["white"];
                    if ((((_local6.length == 0)) && ((_local7.length == 0)))){
                        return (true);
                    };
                    if (_local7.length > 0){
                        if (this.hasViewIncluded(_arg2, _local7)){
                            return (false);
                        };
                        return (true);
                    };
                    if (_local6.length > 0){
                        if (this.hasViewIncluded(_arg2, _local6)){
                            return (true);
                        };
                        return (false);
                    };
                };
                _local4++;
            };
            return (false);
        }
        private function hasViewInstance(_arg1:Class, _arg2:Array):Boolean{
            var _local3:uint = _arg2.length;
            var _local4:uint;
            while (_local4 < _local3) {
                if ((_arg2[_local4] is _arg1)){
                    return (true);
                };
                _local4++;
            };
            return (false);
        }
        public function hasExclusiveView(_arg1:Class):int{
            var _local4:Object;
            var _local2:int = this._exclusiveViews.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._exclusiveViews[_local3];
                if (_local4["master"] == _arg1){
                    return (_local3);
                };
                _local3++;
            };
            return (-1);
        }
        public function addExclusiveView(_arg1:Class):void{
            if (this.hasExclusiveView(_arg1) > -1){
                return;
            };
            this._exclusiveViews.push({
                master:_arg1,
                black:[],
                white:[]
            });
        }
        public function removeExclusiveView(_arg1:Class):void{
            var _local2:int = this.hasExclusiveView(_arg1);
            if (_local2 > -1){
                this._exclusiveViews.splice(_local2, 1);
            };
        }
        private function removeFadeOutList(_arg1:IView):void{
            if (this._fadeOutList[_arg1]){
                removeChild(this._fadeOutList[_arg1]);
                delete this._fadeOutList[_arg1];
                if ((_arg1 is TakeBibleRoadView)){
                    this._view.toolbar.functionBarParent = null;
                };
            };
        }
        private function startFadeOut(_arg1:IView, _arg2:Boolean=false):void{
            var _local4:BitmapData;
            var _local5:Bitmap;
            if (this._timerOut == null){
                this._timerOut = new Timer(10);
                this._timerOut.addEventListener(TimerEvent.TIMER, this.onFadeOut);
            };
            var _local3:Sprite = ((_arg2 == false)) ? this._views[_arg1] : ((this._supers[_arg1]) || (this._frees[_arg1]));
            if (((((_local3) && ((_local3.width > 0)))) && ((_local3.height > 0)))){
                _local4 = new BitmapData(_local3.width, _local3.height, true, 0);
                _local4.draw(_local3);
                _local5 = new Bitmap(_local4);
                _local5.x = _local3.x;
                _local5.y = _local3.y;
                addChildAt(_local5, getChildIndex(_local3));
                this.removeFadeOutList(_arg1);
                this._fadeOutList[_arg1] = _local5;
            };
            this._hasFade = true;
            this._timerOut.start();
        }
        private function onFadeOut(_arg1:TimerEvent):void{
            var _local3:Object;
            var _local4:Bitmap;
            var _local2:int;
            for (_local3 in this._fadeOutList) {
                _local4 = this._fadeOutList[_local3];
                if (_local4.alpha > 0){
                    _local4.alpha = (_local4.alpha - 0.08);
                    _local2++;
                } else {
                    delete this._fadeOutList[_local3];
                    removeChild(_local4);
                };
            };
            if (_local2 == 0){
                this._hasFade = false;
                this._timerOut.stop();
            };
        }
        public function addMask(_arg1:Boolean=false, _arg2:Number=0):void{
            if (this._shape == null){
                this._shape = new Sprite();
            };
            this._alphp = _arg2;
            if (_arg1){
                addChild(this._shape);
            } else {
                addChildAt(this._shape, 0);
            };
            this.reposition();
        }
        public function removeMask():void{
            if (((this._shape) && (this._shape.parent))){
                removeChild(this._shape);
            };
        }
        public function reposition():void{
            var _local2:IView;
            var _local3:Sprite;
            var _local7:int;
            var _local8:int;
            var _local9:Boolean;
            var _local10:Number;
            var _local11:Boolean;
            var _local12:Boolean;
            var _local13:Boolean;
            if (((!((this._shape == null))) && (!((this._shape.parent == null))))){
                this._shape.graphics.clear();
                this._shape.graphics.beginFill(0, this._alphp);
                this._shape.graphics.drawRect(-50, -50, 1350, 750);
                this._shape.graphics.endFill();
            };
            var _local1:int = 10;
            var _local4:Number = 0;
            var _local5:int = this._viewsList.length;
            var _local6:int = (_local5 - 1);
            while (_local6 > -1) {
                _local2 = this._viewsList[_local6];
                if ((_local2 is WorldView)){
                    return;
                };
                _local3 = this._views[_local2];
                if (_local3){
                    _local4 = (_local4 + (_local3.width + ((_local6 > 0)) ? _local1 : 0));
                };
                _local6--;
            };
            if (_local5 == 1){
                _local3 = this._views[this._viewsList[0]];
                _local7 = Math.floor(((Structure.stageWidth - _local3.width) / 2));
                _local8 = Math.floor(((Structure.stageHeight - _local3.height) / 2));
                this.moveTo(this._viewsList[0], _local3, _local7, _local8);
            } else {
                if (_local5 > 1){
                    _local9 = (_local4 > Structure.stageWidth);
                    _local10 = ((Structure.stageWidth - _local4) / 2);
                    _local11 = (((((this._currentAddedView is PackView)) && (this.hasViewInstance(RoleMsgView, this._viewsList)))) && (this.hasViewInstance(PackView, this._viewsList)));
                    _local12 = (((((this._currentAddedView is RoleMsgView)) && (this.hasViewInstance(RoleMsgView, this._viewsList)))) && (this.hasViewInstance(PackView, this._viewsList)));
                    _local13 = ((_local11) || (((!(_local11)) && (!(_local12)))));
                    _local6 = (_local13) ? 0 : (_local5 - 1);
                    while ((_local13) ? (_local6 < _local5) : (_local6 > -1)) {
                        _local3 = this._views[this._viewsList[_local6]];
                        if (_local3){
                            _local7 = Math.floor((_local9) ? ((Structure.stageWidth - _local3.width) / 2) : _local10);
                            _local8 = Math.floor(((Structure.stageHeight - _local3.height) / 2));
                            this.moveTo(this._viewsList[_local6], _local3, _local7, _local8);
                            _local10 = (_local10 + (_local3.width + _local1));
                        };
                        if (_local13){
                            _local6++;
                        } else {
                            _local6--;
                        };
                    };
                };
            };
        }
        private function moveTo(_arg1:IView, _arg2:Sprite, _arg3:Number, _arg4:Number):void{
            var _local5:Number = (_arg3 - _arg2.x);
            var _local6:Number = (_arg4 - _arg2.y);
            var _local7:Number = 6;
            var _local8:Number = (_local5 / _local7);
            var _local9:Number = (_local6 / _local7);
            this._processList[_arg1] = {
                panel:_arg2,
                x:_arg2.x,
                y:_arg2.y,
                dx:_local8,
                dy:_local9,
                i:0,
                n:_local7
            };
        }
        private function process():void{
            var _local4:IView;
            var _local5:Object;
            var _local1:Array = oObject.getKeys(this._processList);
            var _local2:int = _local1.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = _local1[_local3];
                _local5 = this._processList[_local4];
                if (((_local5.panel.parent) && ((_local5.i < _local5.n)))){
                    _local5.panel.x = (_local5.panel.x + _local5.dx);
                    _local5.panel.y = (_local5.panel.y + _local5.dy);
                    _local5.i++;
                } else {
                    delete this._processList[_local4];
                };
                _local3++;
            };
        }
        private function setfocusView(_arg1:IView):void{
            this._focusView = _arg1;
            Shortcut.focusView = _arg1;
        }
        public function get views():Dictionary{
            return (this._views);
        }
        public function get focusView():IView{
            return (this._focusView);
        }

    }
}//package com.views.structure 
