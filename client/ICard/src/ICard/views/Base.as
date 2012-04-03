//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import ICard.assist.data.*;
    import ICard.assist.view.*;
    import ICard.controllers.Base;
    import ICard.views.structure.*;
    
    import flash.display.DisplayObject;

    public class Base extends SuperSubBase {

        protected var _instanceName:String;
        protected var _viewMgr:ICard.ViewMgr;
        protected var _ctrl:ControllerMgr;
        protected var _data:IData;
        protected var _structure:Structure;
        protected var _popup:Popup;
        protected var _requested:Boolean = false;
        protected var _inStageTipTitle:String;
        protected var _inStageTipContent:String;
        protected var _ignoreKeyboardEvent:Boolean = false;
        private var _assetsLoaded:Boolean = false;

        public function get inStage():Boolean{
            var _local1:Object = this;
            return (this._popup.hasView((_local1 as IView)));
        }
        public function get inStageWithTip():Boolean{
            if (((this.inStage) && (this._inStageTipTitle))){
                this._viewMgr.showTip(this._inStageTipTitle, this._inStageTipContent);
            };
            return (this.inStage);
        }
        public function get requested():Boolean{
            return (this._requested);
        }
        public function get ignoreKeyboardEvent():Boolean{
            return (this._ignoreKeyboardEvent);
        }
        override public function settle(_arg1:String, _arg2:ViewMgr, _arg3:ControllerMgr, _arg4:Data, _arg5:SuperMgr):void{
            if (null == this._viewMgr){
                this._instanceName = _arg1;
                this._viewMgr = _arg2;
                if (this._viewMgr != _arg5){
                    throw (new Error(inheritError()));
                };
                this._ctrl = _arg3;
                this._data = (_arg4 as IData);
                if (((this._ctrl.hasOwnProperty(_arg1)) && (hasOwnProperty("ownCtrl")))){
                    this["ownCtrl"] = this._ctrl[_arg1];
                };
            };
            this._structure = this._viewMgr.structure;
            this._popup = this._viewMgr.structure.popup;
        }

		public function addChild(_arg1:DisplayObject):void{
			_viewMgr.stage.addChild(_arg1);
		}
		public function addChildAt(_arg1:DisplayObject,index:int):void{
			_viewMgr.stage.addChildAt(_arg1,index);
		}
		public function getChildIndex(_arg1:DisplayObject):int{
			return _viewMgr.stage.getChildIndex(_arg1);
		}
		public function removeChild(_arg1:DisplayObject):void{
			_viewMgr.stage.removeChild(_arg1);
		}
		
		
        public function destroy():void{
            this._viewMgr.destroyObject(this._instanceName);
        }
        public function switchSelf():void{
            if (this._ignoreKeyboardEvent){
                return;
            };
            var _local1:Object = this;
            if (this._popup.hasView((_local1 as IView))){
                var _local2:Base = this;
                _local2["close"]();
            } else {
                _local2 = this;
                _local2["show"]();
            };
        }
        protected function loadAssets(_arg1:String, _arg2:Function, _arg3:String="", _arg4:Boolean=false, _arg5:Boolean=false, _arg6:Function=null):void{
            var self:* = null;
            var lr:* = null;
            var sign:* = _arg1;
            var callback:* = _arg2;
            var description:String = _arg3;
            var hideLoading:Boolean = _arg4;
            var ignoreCheck:Boolean = _arg5;
            var callback2:Function = _arg6;
            if (this.inStage){
                if ((callback2 is Function)){
                    callback2();
                };
                return;
            };
            self = this;
            var allowToOpen:* = function ():Boolean{
                if (false == hideLoading){
					_viewMgr.hideLoading();
                };
                if ((((false == ignoreCheck)) && ((_popup.allowToOpen((self as IView)) == false)))){
                    return (false);
                };
                return (true);
            };
            var handler:* = function ():void{
                if (allowToOpen()){
                    if ((callback is Function)){
                        callback();
                    };
                    if ((callback2 is Function)){
                        callback2();
                    };
                };
            };
            if (this._viewMgr.hasResource(sign)){
                handler();
            } else {
                if (allowToOpen() == false){
                    return;
                };
                if (this._assetsLoaded){
                    return;
                };
                this._assetsLoaded = true;
                lr = new LoadResponder(handler, function (_arg1:String, _arg2:int):void{
                    if (false == hideLoading){
						_viewMgr.showLoading(description, _arg2);
                    };
                });
                this._viewMgr.loadResources([sign], lr);
            };
        }

    }
}//package com.views 
