//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.*;
    import com.assist.view.*;
    import com.datas.*;
    import com.assist.*;
    import com.haloer.data.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.assist.view.toolbar.*;
    import com.lang.client.com.controllers.*;

    public class FactionController extends com.controllers.Base {

        public var ownData:FactionData;
        private var _lastMainPositionTime:int = 0;
        private var _contributionList:Array;
        private var _tanHeTime:int = 604800;
        private var _isShowTanHe:Boolean = false;
        private var jobData:Object;
        private var objIncenseColor:Object;

        public function FactionController(){
            this.jobData = {
                0:FactionControllerLang.Position,
                1:FactionControllerLang.Leader,
                2:FactionControllerLang.DeputyLeader
            };
            this.objIncenseColor = {
                1:0xFFFFFF,
                2:44783,
                3:0xFFFF00
            };
            super();
        }
        public function get factionList():Object{
            var _local1:Array = this.ownData.factionList;
            var _local2:Object = {};
            _local2.page = _local1[1];
            _local2.allPage = _local1[0];
            _local2.list = this.renderFactionList(_local1[2], _local2.page);
            return (_local2);
        }
        public function get createFaction():Object{
            var _local1:Array = this.ownData.createFaction;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.list = _local1[1];
            return (_local2);
        }
        public function get factionApply():Object{
            var _local1:Array = this.ownData.factionApply;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.list = _local1[1];
            return (_local2);
        }
        public function get cancelApply():Object{
            var _local1:Array = this.ownData.cancelApply;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.applyId = _local1[1];
            return (_local2);
        }
        public function get myFactionInfo():Object{
            var _local1:Array = this._data.faction.myFactionInfo;
            var _local2:int = _local1[0].length;
            var _local3:Object = {};
            if (_local2 > 0){
                _local3.msg = "myFaction";
                _local3.factionData = this.renderMyFaction(_local1[0][0]);
            } else {
                _local3.msg = "joinFaction";
            };
            return (_local3);
        }
        public function get memberList():Array{
            var _local5:Array;
            var _local6:Object;
            var _local7:int;
            var _local1:Array = this._data.faction.memberList;
            var _local2:int = _local1.length;
            var _local3:Array = [];
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = _local1[_local4];
                _local6 = {};
                _local6.memberId = _local5[0];
                _local6.playerId = _local5[1];
                _local6.isPlayer = (_local6.playerId == _ctrl.player.playerId);
                _local6.playerName = _local5[2];
                _local6.showName = _ctrl.player.removeNickNameSuffix(_local6.playerName);
                _local6.playerLevel = _local5[3];
                _local6.factionJobId = _local5[4];
                _local6.position = this.renderJob(_local5[5]);
                _local6.positionNum = _local5[5];
                _local6.contribution = _local5[6];
                _local6.todayContribution = _local5[7];
                _local6.lastLoginTime = TimeChange.timerInfo(_local5[8], _ctrl.player.serverTime);
                _local6.lastMainLoginTime = 0;
                if (_local6.position == FactionControllerLang.Leader){
                    _local7 = (_ctrl.player.serverTime - _local5[8]);
                    _local6.lastMainLoginTime = (this._tanHeTime - _local7);
                };
                if (_local5[9] == Mod_Faction_Base.YES){
                    _local6.isOnline = 2;
                } else {
                    _local6.isOnline = 1;
                };
                _local6.sex = RoleType.getRoleGender(_local5[10]);
                _local6.sportRank = _local5[11];
                _local3.push(_local6);
                _local4++;
            };
            return (_local3);
        }
        public function get applyList():Array{
            var _local5:Array;
            var _local6:Object;
            var _local1:Array = this._data.faction.applyList;
            var _local2:int = _local1.length;
            var _local3:Array = [];
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = _local1[_local4];
                _local6 = {};
                _local6.rank = (_local4 + 1);
                _local6.applyId = _local5[0];
                _local6.playerId = _local5[1];
                _local6.playerName = _local5[2];
                _local6.showName = _ctrl.player.removeNickNameSuffix(_local6.playerName);
                _local6.factionId = _local5[3];
                _local6.playerLevel = _local5[4];
                _local6.reqTime = TimeChange.timerInfo(_local5[5], _ctrl.player.serverTime);
                _local6.sex = RoleType.getRoleGender(_local5[6]);
                _local6.sportRank = _local5[7];
                _local3.push(_local6);
                _local4++;
            };
            _local3.sortOn("playerLevel", (Array.NUMERIC | Array.DESCENDING));
            return (_local3);
        }
        public function get acceptApply():Object{
            var _local1:Array = this._data.faction.acceptApply;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get kickoutMember():Object{
            var _local1:Array = this._data.faction.kickoutMember;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get denyApply():Object{
            var _local1:Array = this._data.faction.denyApply;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get cleanFactionRequest():Object{
            var _local1:Array = this._data.faction.cleanFactionRequest;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get appointJob():Object{
            var _local1:Array = this._data.faction.appointJob;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get dismissJob():Object{
            var _local1:Array = this._data.faction.dismissJob;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get transfer():Object{
            var _local1:Array = this._data.faction.transfer;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get modifyNotice():Object{
            var _local1:Array = this._data.faction.modifyNotice;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.factionData = this.renderMyFaction(_local1[1][0]);
            return (_local2);
        }
        public function get modifyInfo():Object{
            var _local1:Array = this._data.faction.modifyInfo;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.factionData = this.renderMyFaction(_local1[1][0]);
            return (_local2);
        }
        public function get disbandFaction():Object{
            var _local1:Array = this._data.faction.disbandFaction;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.id = _local1[1];
            return (_local2);
        }
        public function get quitFaction():Object{
            var _local1:Array = this._data.faction.quitFaction;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get foundFactionCoin():Object{
            var _local1:Array = this._data.faction.foundFactionCoin;
            var _local2:Object = {};
            _local2.coin = Lang.sprintf(FactionControllerLang.CreateFaction, _local1[0]);
            return (_local2);
        }
        public function get groupNumber():Object{
            var _local1:Array = this._data.faction.groupNumber;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.factionData = this.renderMyFaction(_local1[1][0]);
            return (_local2);
        }
        public function get contributionList():Array{
            var _local5:Object;
            var _local6:int;
            var _local1:Array = [];
            var _local2:Array = this._data.faction.contributionList;
            this.sortTime(_local2);
            var _local3:int = _local2.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local5.playerId = _local2[_local4][0];
                _local5.nickName = _local2[_local4][1];
                _local5.showName = _ctrl.player.removeNickNameSuffix(_local5.nickName);
                _local5.value = _local2[_local4][2];
                _local6 = _local2[_local4][2];
                if (_local6 > 10000){
                    _local5.value = (int((_local6 / 10000)) + FactionControllerLang.Wan);
                };
                _local5.time = TimeChange.timerInfo(_local2[_local4][3], _ctrl.player.serverTime);
                _local5.info = (((((((((((((((((((((((("<font color=\"#fff200\">" + "<u>") + "<a href=\"event:") + TextLinkType.Player) + "_") + _local5.playerId) + "_") + _local5.nickName) + "\">") + _local5.showName) + "</a></u></font>") + "<font color=\"#ffffff\"> ") + FactionControllerLang.Get) + "</font>") + "<font color=\"#00ff00\">") + _local5.value) + FactionControllerLang.Fram) + "</font>") + "<font color=\"#ffffff\">，") + FactionControllerLang.UserFram) + "</font>") + "<font color=\"#00ff00\">") + _local5.value) + FactionControllerLang.Exp) + "</font>");
                _local1.push(_local5);
                _local4++;
            };
            return (_local1);
        }
        private function sortTime(_arg1:Array):void{
            var _local4:int;
            var _local5:Object;
            var _local2:int = _arg1.length;
            var _local3:int = 1;
            while (_local3 < _local2) {
                _local4 = 0;
                while (_local4 < (_local2 - 1)) {
                    if (_arg1[_local4][3] < _arg1[(_local4 + 1)][3]){
                        _local5 = _arg1[_local4];
                        _arg1[_local4] = _arg1[(_local4 + 1)];
                        _arg1[(_local4 + 1)] = _local5;
                    };
                    _local4++;
                };
                _local3++;
            };
        }
        public function get factionMessage():Object{
            var _local5:String;
            var _local1:Array = _data.faction.factionMessage;
            var _local2:Object = {};
            _local2.playerId = _local1[1];
            _local2.nickName = _local1[2];
            _local2.showName = _ctrl.player.removeNickNameSuffix(_local2.nickName);
            _local2.offeringsId = _local1[3];
            _local2.remCount = _local1[4];
            _local2.eatFame = _local1[5];
            _local2.power = _local1[6];
            _local2.eatCount = _local1[7];
            _local2.offerings = FactionType.getOfferName(_local2.offeringsId);
            _local2.fame = FactionType.getOfferFame(_local2.offeringsId);
            _local2.color = this.objIncenseColor[_local2.offeringsId];
            var _local3:String = "";
            var _local4:String = (((((((((((("<font color=\"#fff200\">" + "<a href = \"event:") + TextLinkType.Player) + "_") + _local2.playerId) + "_") + _local2.nickName) + "\">") + "<u>") + _local2.showName) + "</u>") + "</a>") + "</font>");
            switch (_local1[0]){
                case Mod_Faction_Base.NEW_MEMBER:
                    _local3 = (((_local4 + "<font color=\"#ffffff\">") + FactionControllerLang.NewMember) + "</font>");
                    break;
                case Mod_Faction_Base.QUIT_FACTION:
                    _local3 = (((_local4 + "<font color=\"#ffffff\">") + FactionControllerLang.QuitFaction) + "</font>");
                    break;
                case Mod_Faction_Base.KICKOUT_MEMBER:
                    _local3 = (((_local4 + "<font color=\"#ffffff\">") + FactionControllerLang.KickoutMember) + "</font>");
                    break;
                case Mod_Faction_Base.MASTER_TRANSFER:
                    _local3 = (((_local4 + "<font color=\"#ffffff\">") + FactionControllerLang.MasterTransfer) + "</font>");
                    break;
                case Mod_Faction_Base.DISMISS_JOB:
                    _local3 = (((_local4 + "<font color=\"#ffffff\">") + FactionControllerLang.DismissJob) + "</font>");
                    break;
                case Mod_Faction_Base.INCENSE:
                    _local3 = (_local4 + Lang.sprintf(FactionControllerLang.INCENSE, (((("<font color=\"#" + _local2.color.toString(16)) + "\">") + _local2.offerings) + "</font>"), _local2.fame));
                    break;
                case Mod_Faction_Base.APPOINT_JOB:
                    _local3 = (((_local4 + "<font color=\"#ffffff\">") + FactionControllerLang.AppointJob) + "</font>");
                    break;
                case Mod_Faction_Base.CALL_SEAL_SATAN:
                    _local5 = (((((((("<font color=\"#ffff00\">" + "<a href = \"event:") + ActivityType.FactionSeal) + "\">") + "<u>") + FactionControllerLang.CallSealSatan) + "</u>") + "</a>") + "</font>");
                    _local3 = ((_local4 + HtmlText.yellow(Lang.sprintf(FactionControllerLang.CallSealSatan1, _local2.remCount))) + _local5);
                    break;
                case Mod_Faction_Base.CALL_EAT:
                    _local3 = ((((_local4 + HtmlText.white(FactionControllerLang.Summer)) + HtmlText.yellow(FactionControllerLang.FactionEat)) + HtmlText.white(FactionControllerLang.Get)) + HtmlText.yellow((_local2.eatFame + FactionControllerLang.Fram)));
                    break;
                case Mod_Faction_Base.JOIN_EAT:
                    _local3 = ((((_local4 + HtmlText.white(FactionControllerLang.JoinEat)) + HtmlText.yellow((_local2.power + FactionControllerLang.Power))) + HtmlText.white(FactionControllerLang.And)) + HtmlText.yellow((_local2.eatFame + FactionControllerLang.Fram)));
                    break;
                case Mod_Faction_Base.CALL_EAT_AEARD:
                    _local3 = (((((HtmlText.white(FactionControllerLang.CallEatAeard) + HtmlText.yellow((_local2.eatCount + FactionControllerLang.Pepore))) + HtmlText.white(FactionControllerLang.Join)) + _local4) + HtmlText.white(FactionControllerLang.Additional)) + HtmlText.yellow((_local2.eatFame + FactionControllerLang.Fram)));
                    break;
                case Mod_Faction_Base.FACTION_ROLL_CAKE:
                    _local2.rollCakeType = _local1[8];
                    _local2.typeName = RollCakeType.getRollCakeNickName(_local2.rollCakeType);
                    _local2.score = _local1[9];
                    _local3 = (_local4 + HtmlText.white(Lang.sprintf(FactionControllerLang.RollCakeInfo, HtmlText.yellow(_local2.typeName), HtmlText.yellow(_local2.score))));
                    break;
                case Mod_Faction_Base.FACTION_ROLL_CAKE_SCORE_AWARD:
                    _local2.scoreAwardStand = _local1[10];
                    _local2.scoreAward = _local1[11];
                    _local3 = Lang.sprintf(FactionControllerLang.ScoreAward, HtmlText.yellow((_local2.scoreAwardStand + FactionControllerLang.Score)), HtmlText.yellow((_local2.scoreAward + FactionControllerLang.Coin)));
                    break;
                case Mod_Faction_Base.FACTION_ROLL_CAKE_JOIN_COUNT_AWARD:
                    _local2.rollCakeJoinCount = _local1[12];
                    _local2.rollCakeJoinCountAwardFame = _local1[13];
                    _local3 = Lang.sprintf(FactionControllerLang.JoinCountAward, HtmlText.yellow(_local2.rollCakeJoinCount), HtmlText.yellow((_local2.rollCakeJoinCountAwardFame + FactionControllerLang.Fram)));
                    break;
            };
            _local2.info = ((("<font color=\"#80c269\">[" + FactionControllerLang.Faction) + "]</font>") + _local3);
            return (_local2);
        }
        public function get godInfo():Object{
            var _local1:Object = {};
            oObject.list(this._data.faction.godInfo, _local1, ["faction_god_level", "faction_god_exp", "require_exp", "incense_count", "total_count", "is_cover"]);
            return (_local1);
        }
        public function get incenseLog():Array{
            var _local1:Object;
            var _local3:Array;
            var _local2:Array = [];
            for each (_local3 in this._data.faction.godInfo[(this._data.faction.godInfo.length - 1)]) {
                _local1 = {};
                oObject.list(_local3, _local1, ["player_id", "player_name", "incense_id", "exp", "time"]);
                _local1["player_name"] = this._ctrl.player.removeNickNameSuffix(_local1["player_name"]);
                _local1["incense_name"] = FactionType.getOfferName(_local1["incense_id"]);
                _local1["color"] = this.objIncenseColor[_local1["incense_id"]];
                _local1["chinese_time"] = DateTime.formatFromSecond2(_local1["time"], this._ctrl.player.serverTime);
                _local2.push(_local1);
            };
            _local2.sort(this.sortByTime);
            return (_local2);
        }
        public function get incense():Object{
            var _local1:Object = {result:this._data.faction.factionIncense};
            return (_local1);
        }
        public function get blessingCount():Object{
            var _local1:Object = {};
            oObject.list(this._data.faction.blessingCount, _local1, ["count", "coin_add"]);
            return (_local1);
        }
        private function sortByTime(_arg1:Object, _arg2:Object):int{
            var _local3:int = _arg1["time"];
            var _local4:int = _arg2["time"];
            if (_local3 < _local4){
                return (1);
            };
            if (_local3 > _local4){
                return (-1);
            };
            return (0);
        }
        public function get joinSealSatan():Object{
            var _local1:Object = {result:this._data.faction.joinSealSatan[0]};
            return (_local1);
        }
        public function get sealSatanCallNpc():Object{
            var _local1:Object = {result:this._data.faction.sealSatanCallNpc[0]};
            return (_local1);
        }
        public function get sealSatanJoinNotify():Array{
            return (this.setSealMemberList(this._data.faction.sealSatanJoinNotify[0]));
        }
        public function get sealSatanCallFactionMember():Object{
            var _local1:Object = {result:this._data.faction.sealSatanCallFactionMember[0]};
            return (_local1);
        }
        public function get sealSatanInfo():Object{
            var _local1:Object = {};
            oObject.list(this._data.faction.sealSatanInfo, _local1, ["is_complete_seal", "is_in_seal", "join_member_count", "max_join_count"]);
            return (_local1);
        }
        public function get sealSatanAwardNotify():Object{
            var _local1:Object = {};
            oObject.list(this._data.faction.sealSatanAwardNotify, _local1, ["result", "award_fame"]);
            return (_local1);
        }
        public function get sealSatanMemberList():Array{
            return (this.setSealMemberList(this._data.faction.sealSatanMemberList[0]));
        }
        private function setSealMemberList(_arg1:Array):Array{
            var _local2:Object;
            var _local4:Array;
            var _local3:Array = [];
            for each (_local4 in _arg1) {
                _local2 = {};
                oObject.list(_local4, _local2, ["id", "name", "role_id", "join_time", "is_joined"]);
                _local2["name"] = this._ctrl.player.removeNickNameSuffix(_local2["name"]);
                _local2["url"] = ((URI.iconsUrl + RoleType.getRoleSign(_local2["role_id"])) + ".png");
                _local3.push(_local2);
            };
            _local3.sortOn("join_time", Array.NUMERIC);
            return (_local3);
        }
        public function get callEatInfo():Object{
            var _local1:Object = {};
            oObject.list(this._data.faction.callEatInfo, _local1, ["is_join", "rem_count", "rem_time"]);
            return (_local1);
        }
        public function get callEat():Object{
            var _local1:Object = {result:this._data.faction.callEat[0]};
            return (_local1);
        }
        public function get callEatDetailedInfo():Object{
            var _local1:Object = {};
            oObject.list(this._data.faction.callEatDetailedInfo, _local1, ["player_id", "nick_name", "rem_time", "is_join"]);
            _local1["nick_name"] = this._ctrl.player.removeNickNameSuffix(_local1["nick_name"]);
            return (_local1);
        }
        public function get joinEat():Object{
            var _local1:Object = {result:this._data.faction.joinEat[0]};
            return (_local1);
        }
        public function get isCanJoinActivity():Object{
            var _local1:Object = {result:this._data.faction.isCanJoinActivity[0]};
            return (_local1);
        }
        public function get factionMasterTracel():Object{
            var _local1:Array = _data.faction.factionMasterTracel;
            var _local2:Object = {};
            _local2.loginTime = _local1[0];
            _local2.offineTime = _local1[1];
            _local2.nowTime = _local1[2];
            _local2.isOnline = _local1[3];
            _local2.showTanHe = this._isShowTanHe;
            if ((((((_local2.isOnline == Mod_Faction_Base.NO)) && (((_local2.nowTime - _local2.offineTime) >= this._tanHeTime)))) && (((_local2.nowTime - _local2.loginTime) >= this._tanHeTime)))){
            };
            return (_local2);
        }
        public function get seizeTheThrone():Object{
            var _local1:Array = _data.faction.seizeTheThrone;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        private function renderFactionList(_arg1:Array, _arg2:int):Array{
            var _local6:Object;
            var _local3:Array = [];
            var _local4:int = _arg1.length;
            var _local5:int;
            while (_local5 < _local4) {
                _local6 = {};
                _local6.id = _arg1[_local5][0];
                _local6.name = _arg1[_local5][1];
                _local6.masterId = _arg1[_local5][2];
                _local6.master = _arg1[_local5][3];
                _local6.level = _arg1[_local5][4];
                _local6.maxPerson = _arg1[_local5][5];
                _local6.minPerson = _arg1[_local5][6];
                _local6.exp = _arg1[_local5][7];
                _local6.requireExp = _arg1[_local5][8];
                _local6.info = _arg1[_local5][9];
                _local6.applyId = _arg1[_local5][10];
                _local6.rank = (_local5 + 1);
                if (_local6.applyId != 0){
                    _local6.applyBool = true;
                } else {
                    _local6.applyBool = false;
                };
                _local3.push(_local6);
                _local5++;
            };
            return (_local3);
        }
        private function renderMyFaction(_arg1:Array):Object{
            if (_arg1 == null){
                return ({});
            };
            var _local2:Object = {};
            _local2.factionId = _arg1[0];
            _local2.factionName = _arg1[1];
            _local2.masterId = _arg1[2];
            _local2.master = _arg1[3];
            _local2.level = _arg1[4];
            _local2.maxPerson = _arg1[5];
            _local2.minPerson = _arg1[6];
            _local2.exp = _arg1[7];
            _local2.requireExp = _arg1[8];
            _local2.desc = _arg1[9];
            _local2.notice = _arg1[10];
            _local2.position = this.renderJob(_arg1[11]);
            _local2.groupNumber = _arg1[12];
            _local2.rank = _arg1[13];
            _local2.nowWeekCon = _arg1[14];
            return (_local2);
        }
        public function get rollCakeReamain():Object{
            var _local1:Array = _data.faction.RollCakeReamain;
            var _local2:Object = {};
            _local2.remainTimes = _local1[0];
            return (_local2);
        }
        public function get rollCakeInfo():Object{
            var _local1:Array = _data.faction.RollCakeInfo;
            var _local2:Object = {};
            _local2.weekBestScore = _local1[0];
            _local2.todayBestScore = _local1[1];
            _local2.remainTimes = _local1[2];
            _local2.factionScore = _local1[3];
            _local2.factionRCInfo = this.renderFactionRollCakeInfo(_local1[4]);
            return (_local2);
        }
        private function renderFactionRollCakeInfo(_arg1:Array):Array{
            var _local5:Object;
            var _local2:int = _arg1.length;
            var _local3:Array = [];
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = {};
                _local5.playerId = _arg1[_local4][0];
                _local5.isMain = (_local5.playerId == _ctrl.player.playerId);
                _local5.color = ((_local5.isMain == true)) ? HtmlText.Orange : HtmlText.White;
                _local5.nickName = _ctrl.player.removeNickNameSuffix(_arg1[_local4][1]);
                _local5.score = _arg1[_local4][2];
                _local3.push(_local5);
                _local4++;
            };
            return (_local3);
        }
        public function get RollCake():Object{
            var _local6:Object;
            var _local1:Array = _data.faction.RollCake;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.type = _local1[1];
            _local2.typeName = RollCakeType.getRollCakeNickName(_local2.type);
            _local2.score = _local1[2];
            _local2.todayScore = _local1[3];
            _local2.numList = [];
            var _local3:Array = _local1[4];
            var _local4:int = _local3.length;
            var _local5:int;
            while (_local5 < _local4) {
                _local6 = {};
                _local6.id = (_local5 + 1);
                _local6.num = _local3[_local5][0];
                _local2.numList.push(_local6);
                _local5++;
            };
            return (_local2);
        }
        public function get getFactionLevel():int{
            var _local1:Array = _data.faction.getFactionLevel;
            var _local2:int = _local1[0];
            return (_local2);
        }
        private function renderJob(_arg1:int):String{
            var _local2:String = "";
            _local2 = this.jobData[_arg1];
            return (_local2);
        }

    }
}//package com.controllers 
