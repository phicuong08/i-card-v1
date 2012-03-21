//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {

    public class ControllerBaseMgr extends BaseMgr {

        protected var _data:Data;
        protected var _lang:Lang;

        public function get lang():Lang{
            return (this._lang);
        }
        public function init(_arg1:Data, _arg2:Lang):void{
            this._data = _arg1;
            this._lang = _arg2;
        }
        protected function createObject(_arg1:Class, _arg2:String=""):Object{
            _arg2 = (_arg1 + "");
            _arg2 = _arg2.replace(/Controller\]$/, "");
            return (createObjectBase(_arg1, _arg2, null, (this as ControllerMgr), this._data));
        }

    }
}//package com 
