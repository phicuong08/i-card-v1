//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.controllers {
    import ICard.*;

    public class Base extends SuperSubBase {

        protected var _instanceName:String;
        protected var _ctrl:ControllerMgr;
        protected var _data:Data;

        override public function settle(_arg1:String, _arg2:ViewMgr, _arg3:ControllerMgr, _arg4:Data, _arg5:BaseMgr):void{
            if (null == this._ctrl){
                this._instanceName = _arg1;
                this._ctrl = _arg3;
                if (this._ctrl != _arg5){
                    throw (new Error(inheritError()));
                };
                this._data = _arg4;
                if (((this._data.hasOwnProperty(_arg1)) && (hasOwnProperty("ownData")))){
                    this["ownData"] = this._data[_arg1];
                };
            };
        }
        public function destroy():void{
            this._ctrl.destroyObject(this._instanceName);
        }

    }
}//package com.controllers 
