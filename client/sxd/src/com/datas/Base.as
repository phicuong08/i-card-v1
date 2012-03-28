//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.*;

    public class Base extends SuperSubBase {

        protected var _instanceName:String;
        protected var _data:Data;
        protected var _ctrl:Controller;
        protected var _loaded:Boolean = false;

        override public function settle(_arg1:String, _arg2:View, _arg3:Controller, _arg4:Data, _arg5:SuperBase):void{
            if (null == this._data){
                this._instanceName = _arg1;
                this._data = _arg4;
                if (this._data != _arg5){
                    throw (new Error(inheritError()));
                };
                this._ctrl = this._ctrl;
            };
        }
        public function destroy():void{
            this._data.destroyObject(this._instanceName);
        }

    }
}//package com.datas 
