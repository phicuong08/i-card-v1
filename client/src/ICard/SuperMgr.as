//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
    import flash.utils.*;

    public class SuperMgr {

        private var _superSubBaseList:Object;
        private var _frameProcessList:Object;
        private var _timerProcessList:Object;
        private var _nameHash:Object;

        public function SuperMgr(){
            this._superSubBaseList = {};
            this._frameProcessList = {};
            this._timerProcessList = {};
            this._nameHash = {};
            super();
        }
        public function get sign():String{
            return (getQualifiedClassName(this));
        }
        public function addToFrameProcessList(_arg1:String, _arg2:Function):void{
            this._frameProcessList[_arg1] = _arg2;
        }
        public function removeFromFrameProcessList(_arg1:String):void{
            delete this._frameProcessList[_arg1];
        }
        public function frameProcess():void{
            var _local1:String;
            for (_local1 in this._frameProcessList) {
                var _local4 = this._frameProcessList;
                _local4[_local1]();
            };
        }
        public function addToTimerProcessList(_arg1:String, _arg2:Function):void{
            this._timerProcessList[_arg1] = _arg2;
        }
        public function removeFromTimerProcessList(_arg1:String):void{
            delete this._timerProcessList[_arg1];
        }
        public function timerProcess():void{
            var _local1:String;
            for (_local1 in this._timerProcessList) {
                var _local4 = this._timerProcessList;
                _local4[_local1]();
            };
        }
        protected function createObjectBase(_arg1:Class, _arg2:String, _arg3:View, _arg4:Controller, _arg5:Data):Object{
            var _local6:String = this._nameHash[_arg2];
            if (null == _local6){
                _local6 = _arg2.replace(/^\[class /, "");
                _local6 = (_local6.substring(0, 1).toLowerCase() + _local6.substring(1));
                this._nameHash[_arg2] = _local6;
            };
            if (null == this._superSubBaseList[_local6]){
                this._superSubBaseList[_local6] = new (_arg1)();
                (this._superSubBaseList[_local6] as SuperSubBase).settle(_local6, _arg3, _arg4, _arg5, this);
            };
            return (this._superSubBaseList[_local6]);
        }
        public function destroyObject(_arg1:String):void{
            delete this._superSubBaseList[_arg1];
        }
        public function destroyAllObject(... _args):void{
            var _local2:String;
            for (_local2 in this._superSubBaseList) {
                if (_args.indexOf(_local2) == -1){
                    this.destroyObject(_local2);
                };
            };
        }

    }
}//package com 
