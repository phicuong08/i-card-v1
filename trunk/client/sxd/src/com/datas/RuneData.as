//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class RuneData extends Base {

        private var _runeList:Array;
        private var _runeUse:Object;
        private var _batchRuneList:Array;
        private var _batchRuneUse:Array;
        private var _autoRuneInfo:Array;
        private var _setAutoRune:Array;
        private var _runeUseNotify:Array;

        public function get runeList():Array{
            return (this._runeList);
        }
        public function get runeUse():Object{
            return (this._runeUse);
        }
        public function get batchRuneList():Array{
            return (this._batchRuneList);
        }
        public function get batchRuneUse():Array{
            return (this._batchRuneUse);
        }
        public function get autoRuneInfo():Array{
            return (this._autoRuneInfo);
        }
        public function get setAutoRune():Array{
            return (this._setAutoRune);
        }
        public function get runeUseNotify():Array{
            return (this._runeUseNotify);
        }
        public function rune_list(_arg1:Array):void{
            this._runeList = _arg1;
        }
        public function rune_use(_arg1:Object):void{
            this._runeUse = _arg1;
        }
        public function batch_rune_list(_arg1:Array):void{
            this._batchRuneList = _arg1;
        }
        public function batch_rune_use(_arg1:Array):void{
            this._batchRuneUse = _arg1;
        }
        public function auto_rune_info(_arg1:Array):void{
            this._autoRuneInfo = _arg1;
        }
        public function set_auto_rune(_arg1:Array):void{
            this._setAutoRune = _arg1;
        }
        public function rune_use_notify(_arg1:Array):void{
            this._runeUseNotify = _arg1;
        }

    }
}//package com.datas 
