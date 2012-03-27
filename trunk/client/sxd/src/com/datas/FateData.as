//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class FateData extends Base {

        private var _fateNpc:Array;
        private var _tempFate:Array;
        private var _pickupFate:Array;
        private var _saleTempFate:Array;
        private var _bagList:Array;
        private var _buyBagGrid:Array;
        private var _roleFateList:Array;
        private var _wearOn:Array;
        private var _discardFate:Array;
        private var _appointFateNpc:Array;
        private var _wearOffFate:Array;
        private var _openFate:Array;
        private var _changeFateGrid:Array;
        private var _changePosition:Array;
        private var _merge:Array;
        private var _getFatePower:Array;
        private var _mergeData:Array;
        private var _mergeAllInBag:Array;
        private var _buyFateNpc:Array;
        public var ExchangeFate:Array;

        public function get fateNpc():Array{
            return (this._fateNpc);
        }
        public function get tempFate():Array{
            return (this._tempFate);
        }
        public function get pickupFate():Array{
            return (this._pickupFate);
        }
        public function get saleTempFate():Array{
            return (this._saleTempFate);
        }
        public function get bagList():Array{
            return (this._bagList);
        }
        public function get buyBagGrid():Array{
            return (this._buyBagGrid);
        }
        public function get roleFateList():Array{
            return (this._roleFateList);
        }
        public function get wearOn():Array{
            return (this._wearOn);
        }
        public function get discardFate():Array{
            return (this._discardFate);
        }
        public function get appointFateNpc():Array{
            return (this._appointFateNpc);
        }
        public function get wearOffFate():Array{
            return (this._wearOffFate);
        }
        public function get openFate():Array{
            return (this._openFate);
        }
        public function get changeFateGrid():Array{
            return (this._changeFateGrid);
        }
        public function get changePosition():Array{
            return (this._changePosition);
        }
        public function get merge():Array{
            return (this._merge);
        }
        public function get getFatePower():Array{
            return (this._getFatePower);
        }
        public function get mergeData():Array{
            return (this._mergeData);
        }
        public function get mergeAllInBag():Array{
            return (this._mergeAllInBag);
        }
        public function get buyFateNpc():Array{
            return (this._buyFateNpc);
        }
        public function get_fate_npc(_arg1:Array):void{
            this._fateNpc = _arg1;
        }
        public function get_temp_fate(_arg1:Array):void{
            this._tempFate = _arg1;
        }
        public function pickup_fate(_arg1:Array):void{
            this._pickupFate = _arg1;
        }
        public function sale_temp_fate(_arg1:Array):void{
            this._saleTempFate = _arg1;
        }
        public function get_bag_list(_arg1:Array):void{
            this._bagList = _arg1;
        }
        public function buy_bag_grid(_arg1:Array):void{
            this._buyBagGrid = _arg1;
        }
        public function get_role_fate_list(_arg1:Array):void{
            this._roleFateList = _arg1;
        }
        public function wear_on(_arg1:Array):void{
            this._wearOn = _arg1;
        }
        public function discard_fate(_arg1:Array):void{
            this._discardFate = _arg1;
        }
        public function appoint_fate_npc(_arg1:Array):void{
            this._appointFateNpc = _arg1;
        }
        public function wear_off_fate(_arg1:Array):void{
            this._wearOffFate = _arg1;
        }
        public function open_fate(_arg1:Array):void{
            this._openFate = _arg1;
        }
        public function change_fate_grid(_arg1:Array):void{
            this._changeFateGrid = _arg1;
        }
        public function change_position(_arg1:Array):void{
            this._changePosition = _arg1;
        }
        public function merge_fate(_arg1:Array):void{
            this._merge = _arg1;
        }
        public function get_player_role_fate_power(_arg1:Array):void{
            this._getFatePower = _arg1;
        }
        public function get_merge_data(_arg1:Array):void{
            this._mergeData = _arg1;
        }
        public function merge_all_in_bag(_arg1:Array):void{
            this._mergeAllInBag = _arg1;
        }
        public function buy_fate_npc(_arg1:Array):void{
            this._buyFateNpc = _arg1;
        }
        public function exchange_fate(_arg1:Array):void{
            this.ExchangeFate = _arg1;
        }

    }
}//package com.datas 
