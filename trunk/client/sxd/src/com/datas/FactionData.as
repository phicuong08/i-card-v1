//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class FactionData extends Base {

        private var _factionList:Array;
        private var _createFaction:Array;
        private var _factionApply:Array;
        private var _cancelApply:Array;
        private var _memberList:Array;
        private var _applyList:Array;
        private var _acceptApply:Array;
        private var _denyApply:Array;
        private var _modifyInfo:Array;
        private var _modifyNotice:Array;
        private var _appointJob:Array;
        private var _dismissJob:Array;
        private var _kickoutMember:Array;
        private var _transfer:Array;
        private var _quitFaction:Array;
        private var _disbandFaction:Array;
        private var _myFactionInfo:Array;
        private var _foundFactionCoin:Array;
        private var _groupNumber:Array;
        private var _contributionList:Array;
        private var _godInfo:Array;
        private var _incense:Array;
        private var _blessingCount:Array;
        private var _joinSealSatan:Array;
        private var _sealSatanCallNpc:Array;
        private var _sealSatanJoinNotify:Array;
        private var _sealSatanCallFactionMember:Array;
        private var _sealSatanInfo:Array;
        private var _sealSatanAwardNotify:Array;
        private var _sealSatanMemberList:Array;
        private var _callEatInfo:Array;
        private var _callEat:Array;
        private var _callEatDetailedInfo:Array;
        private var _joinEat:Array;
        private var _isCanJoinActivity:Array;
        private var _factionMessage:Array;
        private var _cleanFactionRequest:Array;
        private var _getFactionLevel:Array;
        private var _factionMasterTracel:Array;
        private var _seizeTheThrone:Array;
        public var RollCakeReamain:Array;
        public var RollCakeInfo:Array;
        public var RollCake:Array;

        public function get factionList():Array{
            return (this._factionList);
        }
        public function get createFaction():Array{
            return (this._createFaction);
        }
        public function get factionApply():Array{
            return (this._factionApply);
        }
        public function get cancelApply():Array{
            return (this._cancelApply);
        }
        public function get memberList():Array{
            return (this._memberList);
        }
        public function get applyList():Array{
            return (this._applyList);
        }
        public function get acceptApply():Array{
            return (this._acceptApply);
        }
        public function get denyApply():Array{
            return (this._denyApply);
        }
        public function get modifyInfo():Array{
            return (this._modifyInfo);
        }
        public function get modifyNotice():Array{
            return (this._modifyNotice);
        }
        public function get appointJob():Array{
            return (this._appointJob);
        }
        public function get dismissJob():Array{
            return (this._dismissJob);
        }
        public function get kickoutMember():Array{
            return (this._kickoutMember);
        }
        public function get transfer():Array{
            return (this._transfer);
        }
        public function get quitFaction():Array{
            return (this._quitFaction);
        }
        public function get disbandFaction():Array{
            return (this._disbandFaction);
        }
        public function get myFactionInfo():Array{
            return (this._myFactionInfo);
        }
        public function get foundFactionCoin():Array{
            return (this._foundFactionCoin);
        }
        public function get groupNumber():Array{
            return (this._groupNumber);
        }
        public function get contributionList():Array{
            return (this._contributionList);
        }
        public function get godInfo():Array{
            return (this._godInfo);
        }
        public function get factionIncense():Array{
            return (this._incense);
        }
        public function get blessingCount():Array{
            return (this._blessingCount);
        }
        public function get joinSealSatan():Array{
            return (this._joinSealSatan);
        }
        public function get sealSatanCallNpc():Array{
            return (this._sealSatanCallNpc);
        }
        public function get sealSatanJoinNotify():Array{
            return (this._sealSatanJoinNotify);
        }
        public function get sealSatanCallFactionMember():Array{
            return (this._sealSatanCallFactionMember);
        }
        public function get sealSatanInfo():Array{
            return (this._sealSatanInfo);
        }
        public function get sealSatanAwardNotify():Array{
            return (this._sealSatanAwardNotify);
        }
        public function get sealSatanMemberList():Array{
            return (this._sealSatanMemberList);
        }
        public function get callEatInfo():Array{
            return (this._callEatInfo);
        }
        public function get callEat():Array{
            return (this._callEat);
        }
        public function get callEatDetailedInfo():Array{
            return (this._callEatDetailedInfo);
        }
        public function get joinEat():Array{
            return (this._joinEat);
        }
        public function get isCanJoinActivity():Array{
            return (this._isCanJoinActivity);
        }
        public function get factionMessage():Array{
            return (this._factionMessage);
        }
        public function get cleanFactionRequest():Array{
            return (this._cleanFactionRequest);
        }
        public function get getFactionLevel():Array{
            return (this._getFactionLevel);
        }
        public function get factionMasterTracel():Array{
            return (this._factionMasterTracel);
        }
        public function get seizeTheThrone():Array{
            return (this._seizeTheThrone);
        }
        public function faction_list(_arg1:Array):void{
            this._factionList = _arg1;
        }
        public function found_faction(_arg1:Array):void{
            this._createFaction = _arg1;
        }
        public function faction_request(_arg1:Array):void{
            this._factionApply = _arg1;
        }
        public function cancel_request(_arg1:Array):void{
            this._cancelApply = _arg1;
        }
        public function member_List(_arg1:Array):void{
            this._memberList = _arg1[0];
        }
        public function request_list(_arg1:Array):void{
            this._applyList = _arg1[0];
        }
        public function accept_request(_arg1:Array):void{
            this._acceptApply = _arg1;
        }
        public function deny_request(_arg1:Array):void{
            this._denyApply = _arg1;
        }
        public function modify_faction_desc(_arg1:Array):void{
            this._modifyInfo = _arg1;
        }
        public function modify_faction_notice(_arg1:Array):void{
            this._modifyNotice = _arg1;
        }
        public function appoint_job(_arg1:Array):void{
            this._appointJob = _arg1;
        }
        public function dismiss_job(_arg1:Array):void{
            this._dismissJob = _arg1;
        }
        public function kickout_member(_arg1:Array):void{
            this._kickoutMember = _arg1;
        }
        public function master_transfer(_arg1:Array):void{
            this._transfer = _arg1;
        }
        public function quit_faction(_arg1:Array):void{
            this._quitFaction = _arg1;
        }
        public function disband_faction(_arg1:Array):void{
            this._disbandFaction = _arg1;
        }
        public function my_faction_info(_arg1:Array):void{
            this._myFactionInfo = _arg1;
        }
        public function found_faction_coin(_arg1:Array):void{
            this._foundFactionCoin = _arg1;
        }
        public function modify_group_number(_arg1:Array):void{
            this._groupNumber = _arg1;
        }
        public function faction_contribution_list(_arg1:Array):void{
            this._contributionList = _arg1[0];
        }
        public function faction_god_info(_arg1:Array):void{
            this._godInfo = _arg1;
        }
        public function incense(_arg1:Array):void{
            this._incense = _arg1;
        }
        public function get_blessing_count(_arg1:Array):void{
            this._blessingCount = _arg1;
        }
        public function blessing_count_change(_arg1:Array):void{
        }
        public function faction_message_notify(_arg1:Array):void{
            this._factionMessage = _arg1;
        }
        public function join_seal_satan(_arg1:Array):void{
            this._joinSealSatan = _arg1;
        }
        public function seal_satan_call_npc(_arg1:Array):void{
            this._sealSatanCallNpc = _arg1;
        }
        public function seal_satan_join_notify(_arg1:Array):void{
            this._sealSatanJoinNotify = _arg1;
        }
        public function seal_satan_call_faction_member(_arg1:Array):void{
            this._sealSatanCallFactionMember = _arg1;
        }
        public function seal_satan_info(_arg1:Array):void{
            this._sealSatanInfo = _arg1;
        }
        public function seal_satan_award_notify(_arg1:Array):void{
            this._sealSatanAwardNotify = _arg1;
        }
        public function seal_satan_member_list(_arg1:Array):void{
            this._sealSatanMemberList = _arg1;
        }
        public function close_seal_satan(_arg1:Array):void{
        }
        public function call_eat_info(_arg1:Array):void{
            this._callEatInfo = _arg1;
        }
        public function call_eat(_arg1:Array):void{
            this._callEat = _arg1;
        }
        public function call_eat_detailed_info(_arg1:Array):void{
            this._callEatDetailedInfo = _arg1;
        }
        public function join_eat(_arg1:Array):void{
            this._joinEat = _arg1;
        }
        public function is_can_join_activity(_arg1:Array):void{
            this._isCanJoinActivity = _arg1;
        }
        public function clean_faction_request(_arg1:Array):void{
            this._cleanFactionRequest = _arg1;
        }
        public function get_faction_level(_arg1:Array):void{
            this._getFactionLevel = _arg1;
        }
        public function get_faction_master_trace(_arg1:Array):void{
            this._factionMasterTracel = _arg1;
        }
        public function seize_the_throne(_arg1:Array):void{
            this._seizeTheThrone = _arg1;
        }
        public function faction_roll_cake_remain_times(_arg1:Array):void{
            this.RollCakeReamain = _arg1;
        }
        public function faction_roll_cake_info(_arg1:Array):void{
            this.RollCakeInfo = _arg1;
        }
        public function roll_cake(_arg1:Array):void{
            this.RollCake = _arg1;
        }

    }
}//package com.datas 
