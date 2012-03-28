//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class RollCakeData extends Base {

        private var _rollData:Array;
        private var _addCount:Array;
        private var _getCount:Array;
        private var _rerollData:Array;
        private var _getAward:Array;
        public var getState:Array;

        public function get rollData():Array{
            return (this._rollData);
        }
        public function get addCount():Array{
            return (this._addCount);
        }
        public function get getCount():Array{
            return (this._getCount);
        }
        public function get rerollData():Array{
            return (this._rerollData);
        }
        public function get getAward():Array{
            return (this._getAward);
        }
        public function roll(_arg1:Array):void{
            this._rollData = _arg1;
        }
        public function add_count(_arg1:Array):void{
            this._addCount = _arg1;
        }
        public function get_count(_arg1:Array):void{
            this._getCount = _arg1;
        }
        public function reroll(_arg1:Array):void{
            this._rerollData = _arg1;
        }
        public function get_award(_arg1:Array):void{
            this._getAward = _arg1;
        }
        public function get_state(_arg1:Array):void{
            this.getState = _arg1;
        }

    }
}//package com.datas 
