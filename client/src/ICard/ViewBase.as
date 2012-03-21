//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
    import flash.events.*;
    import flash.display.*;
    import ICard.views.*;
    import ICard.haloer.net.*;
    import ICard.assist.view.*;
    import ICard.assist.*;
    import ICard.haloer.data.*;

    public class ViewBase extends SuperMgr {

        protected var _stage:Stage;
        protected var _structure:Structure;
        protected var _ctrl:ControllerMgr;
        protected var _data:Data;
        protected var _lang:Lang;
        private var _positionList:Object;
        private var _assets:Object;
        private var _libs:Object;

        public function ViewBase(_arg1:Stage){
            this._positionList = {};
            this._assets = {};
            this._libs = {};
            super();
            this._stage = _arg1;
        }
        public function get stage():Stage{
            return (this._stage);
        }
        public function get structure():Structure{
            return (this._structure);
        }
        public function get ctrl():ControllerMgr{
            return (this._ctrl);
        }
        public function get lang():Lang{
            return (this._lang);
        }
        public function init(_arg1:Data, _arg2:ControllerMgr, _arg3:Lang):void{
            this._data = _arg1;
            this._ctrl = _arg2;
            this._lang = _arg3;
            this._structure = Structure.getInstance(this._stage, this);
            this._stage.addEventListener(Event.RESIZE, this.resetPosition);
        }
        protected function createObject(_arg1:Class, _arg2:String=""):Object{
            _arg2 = (_arg1 + "").replace(/View\]$/, "");
            return (createObjectBase(_arg1, _arg2, (this as View), this._ctrl, this._data));
        }
        public function addToPositionList(_arg1:String, _arg2:Function):void{
            this._positionList[_arg1] = _arg2;
        }
        public function removeFromPositionList(_arg1:String):void{
            delete this._positionList[_arg1];
        }
        protected function resetPosition(_arg1:Event):void{
            var _local2:String;
            for (_local2 in this._positionList) {
                var _local5 = this._positionList;
                _local5[_local2]();
            };
        }
        public function center(_arg1:String, _arg2:DisplayObject, _arg3:Function=null):void{
            var sign:* = _arg1;
            var d:* = _arg2;
            var func = _arg3;
            if (func == null){
                func = function ():void{
                    if (d.stage == null){
                        removeFromPositionList(sign);
                        return;
                    };
                    var _local1:int = Structure.stageWidth;
                    var _local2:int = Structure.stageHeight;
                    var _local3:Number = Math.floor(((_local2 - d.height) / 2));
                    d.x = Math.floor(((_local1 - d.width) / 2));
                    d.y = ((_local3 < 0)) ? 60 : _local3;
                };
            };
            func();
            this.addToPositionList(sign, func);
        }
        public function cancelCenter(_arg1:String):void{
            this.removeFromPositionList(_arg1);
        }
        public function hasAssets(_arg1:String):Boolean{
            return (!(!(this._assets[_arg1])));
        }
        public function addAssets(_arg1:String, _arg2:String):void{
            if (this.hasAssets(_arg1)){
                throw (new Error((("名称为" + _arg1) + "已经存在。")));
            };
            this._assets[_arg1] = _arg2;
        }
        public function getAssetsUrl(_arg1:String):String{
            if (this.hasAssets(_arg1) == false){
                throw (new Error((("对象 _assets 找不到键名为 " + _arg1) + " 的项。")));
            };
            if (_arg1.indexOf(URI.assetsUrl) == 0){
                return (_arg1);
            };
            return ((URI.assetsUrl + this._assets[_arg1]));
        }
        public function getAssetsClass(_arg1:String, _arg2:String):Class{
            if (this.hasResource(_arg1) == false){
                throw (new Error((((("找不到名为 " + _arg1) + " 的资源。请确认资源 ") + _arg1) + " 关联的swf文件已经加载。")));
            };
            return ((this._libs[_arg1] as File).getClassByName(_arg2));
        }
        public function getAssetsObject(_arg1:String, _arg2:String):Object{
            var _local3:Class = (this.getAssetsClass(_arg1, _arg2) as Class);
            return (new (_local3)());
        }
        public function getAssetsObj(_arg1:String):File{
            return ((this._libs[_arg1] as File));
        }
        public function loadResources(_arg1:Array, _arg2:LoadResponder, _arg3:Boolean=false):void{
            var len:* = 0;
            var i:* = 0;
            var list:* = _arg1;
            var loadResponder:* = _arg2;
            var fullUrl:Boolean = _arg3;
            var callback:* = function (_arg1:Array):void{
                oObject.list(_arg1, _libs, list);
                loadResponder.lCallback();
            };
            var progress:* = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                loadResponder.lProgress(list[_arg2], _arg3, _arg2, _arg1, _arg4);
            };
            var tempList:* = [];
            len = list.length;
            i = 0;
            while (i < len) {
                tempList[i] = (fullUrl) ? list[i] : this.getAssetsUrl(list[i]);
                i = (i + 1);
            };
            File.loadList(tempList, callback, progress);
        }
        public function loadNewResources(_arg1:String, _arg2:LoadResponder):void{
            if (this.hasResource(_arg1) == false){
                this._assets[_arg1] = _arg1;
                this.loadResources([_arg1], _arg2, true);
            } else {
                _arg2.lCallback();
            };
        }
        public function hasResource(_arg1:String):Boolean{
            return (!(!(this._libs[_arg1])));
        }
        public function removeResource(_arg1:String):void{
            if (this.hasResource(_arg1)){
                delete this._libs[_arg1];
            };
        }

    }
}//package com 
