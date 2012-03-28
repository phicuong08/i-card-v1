//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class TakeBibleData extends Base {

        private var _openTakeBible:Array;
        private var _closeTakeBible:Array;
        private var _getTakeBibleInfo:Array;
        private var _applyFriend:Array;
        private var _cancelApplyFriend:Array;
        private var _approveApply:Array;
        private var _rejectApply:Array;
        private var _buyProtection:Array;
        private var _refresh:Array;
        private var _playerTakeBible:Array;
        private var _startTakeBible:Array;
        private var _rob:Array;
        private var _notify:Array;
        private var _notifyGlobal:Array;
        private var _quickly:Array;
        private var _takeBibleUpdataData:Array;
        private var _takeBibleCdTime:Array;
        private var _clearTakeBibleCdTime:Array;
        public var buyBless:Array;
        public var callRuLai:Array;
        public var getRulaiOpenTime:Array;
        public var canRobTimes:int = 0;
        public var canProtectTimes:int = 0;
        public var canTakeBibleTimes:int = 0;
        public var quicklyTimes:int = 0;

        public function TakeBibleData(){
            this._playerTakeBible = [];
            this.buyBless = [];
            this.callRuLai = [];
            super();
        }
        public function get openTakeBible():Array{
            return (this._openTakeBible);
        }
        public function get closeTakeBible():Array{
            return (this._closeTakeBible);
        }
        public function get getTakeBibleInfo():Array{
            return (this._getTakeBibleInfo);
        }
        public function get applyFriend():Array{
            return (this._applyFriend);
        }
        public function get cancelApplyFriend():Array{
            return (this._cancelApplyFriend);
        }
        public function get approveApply():Array{
            return (this._approveApply);
        }
        public function get rejectApply():Array{
            return (this._rejectApply);
        }
        public function get buyProtection():Array{
            return (this._buyProtection);
        }
        public function get refreshData():Array{
            return (this._refresh);
        }
        public function get playerTakeBible():Array{
            return (this._playerTakeBible);
        }
        public function get startTakeBible():Array{
            return (this._startTakeBible);
        }
        public function get robData():Array{
            return (this._rob);
        }
        public function get notifyData():Array{
            return (this._notify);
        }
        public function get notifyGlobal():Array{
            return (this._notifyGlobal);
        }
        public function get quicklyData():Array{
            return (this._quickly);
        }
        public function get takeBibleUpdataData():Array{
            return (this._takeBibleUpdataData);
        }
        public function get takeBibleCdTime():Array{
            return (this._takeBibleCdTime);
        }
        public function get clearTakeBibleCdTime():Array{
            return (this._clearTakeBibleCdTime);
        }
        public function open_take_bible(_arg1:Array):void{
            this._openTakeBible = _arg1;
        }
        public function close_take_bible(_arg1:Array):void{
            this._closeTakeBible = _arg1;
        }
        public function get_take_bible_info(_arg1:Array):void{
            this._getTakeBibleInfo = _arg1;
        }
        public function apply_friend(_arg1:Array):void{
            this._applyFriend = _arg1;
        }
        public function cancel_apply_friend(_arg1:Array):void{
            this._cancelApplyFriend = _arg1;
        }
        public function approve_apply(_arg1:Array):void{
            this._approveApply = _arg1;
        }
        public function reject_apply(_arg1:Array):void{
            this._rejectApply = _arg1;
        }
        public function buy_protection(_arg1:Array):void{
            this._buyProtection = _arg1;
        }
        public function refresh(_arg1:Array):void{
            this._refresh = _arg1;
        }
        public function get_player_take_bible(_arg1:Array):void{
            this.savePlyareTakBible(_arg1);
        }
        private function savePlyareTakBible(_arg1:Array):void{
            var _local2:int = this._playerTakeBible.length;
            var _local3:int;
            while (_local3 < _local2) {
                if (this._playerTakeBible[_local3][0] == _arg1[0]){
                    this._playerTakeBible[_local3] = _arg1;
                    return;
                };
                _local3++;
            };
            this._playerTakeBible.push(_arg1);
        }
        public function start_take_bible(_arg1:Array):void{
            this._startTakeBible = _arg1;
        }
        public function rob(_arg1:Array):void{
            this._rob = _arg1;
        }
        public function notify(_arg1:Array):void{
            this._notify = _arg1;
        }
        public function notify_global(_arg1:Array):void{
            this._notifyGlobal = _arg1;
        }
        public function quickly(_arg1:Array):void{
            this._quickly = _arg1;
        }
        public function get_take_bible_updata_data(_arg1:Array):void{
            this._takeBibleUpdataData = _arg1;
        }
        public function get_rob_take_bible_cd_time(_arg1:Array):void{
            this._takeBibleCdTime = _arg1;
        }
        public function clear_rob_take_bible_cd_time(_arg1:Array):void{
            this._clearTakeBibleCdTime = _arg1;
        }
        public function buy_bless(_arg1:Array):void{
            this.buyBless = _arg1;
        }
        public function call_rulai(_arg1:Array):void{
            this.callRuLai = _arg1;
        }
        public function get_rulai_open_time(_arg1:Array):void{
            this.getRulaiOpenTime = _arg1;
        }
        public function take_bible_info(_arg1:Array):void{
            this.canRobTimes = _arg1[0];
            this.canProtectTimes = _arg1[1];
            this.canTakeBibleTimes = _arg1[2];
            this.quicklyTimes = _arg1[3];
        }

    }
}//package com.datas 
