//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.*;
    import com.assist.view.*;
    import com.protocols.*;
    import com.assist.view.toolbar.*;
    import com.lang.client.com.controllers.*;

    public class TakeBibleController extends Base {

        public var rulaiState:int = 0;
        private var _openTakeBible:Array;
        public var callRuLaiPrice:int = 0;
        public var canCalruLaiTime:int = 0;
        private var _closeTakeBible:Array;
        private var _getTakeBibleInfo:Array;
        private var _cancelApplyFriend:Array;
        private var _buyProtection:Array;
        private var _playerTakeBible:Array;
        private var _rob:Array;
        private var _notify:Array;
        private var _notifyBeRob:Array;
        public var applyProtectList:Array;

        public function TakeBibleController(){
            this.applyProtectList = [];
            super();
        }
        public function get openTakeBible():Object{
            var _local2:Object;
            var _local1:Array = _data.takeBible.openTakeBible;
            _local2 = {};
            _local2.protectPlayerId = _local1[1];
            _local2.classTakePlayer = this.renderClssTakePlayer(_local1[0]);
            _local2.canRobTimes = _local1[2];
            _local2.canProtectTimes = _local1[3];
            _local2.canTakeBibleTimes = _local1[4];
            _local2.quicklyTimes = _local1[5];
            _local2.bless = _local1[6];
            _local2.type = _local1[7];
            _local2.time = _local1[8];
            _local2.rulaiPlayerId = _local1[9];
            _local2.rulaiNickName = _local1[10];
            _local2.isSelf = (_local2.rulaiPlayerId == _ctrl.player.playerId);
            _local2.diffTime = _ctrl.player.diffServerTime;
            _local2.callRuLaiPrice = _local1[11];
            this.callRuLaiPrice = _local1[11];
            _local2.canCalruLaiTime = _local1[12];
            this.canCalruLaiTime = _local2.canCalruLaiTime;
            _data.takeBible.canRobTimes = _local2.canRobTimes;
            _data.takeBible.canProtectTimes = _local2.canProtectTimes;
            _data.takeBible.canTakeBibleTimes = _local2.canTakeBibleTimes;
            _data.takeBible.quicklyTimes = _local2.quicklyTimes;
            return (_local2);
        }
        private function renderClssTakePlayer(_arg1:Array):Array{
            var _local6:Object;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int = _ctrl.player.serverTime;
            var _local5:int;
            while (_local5 < _local3) {
                _local6 = {};
                _local6.protectPlayerId = _arg1[_local5][5];
                _local6.playerId = _arg1[_local5][0];
                _local6.isMainPlayer = (_local6.playerId == _ctrl.player.playerId);
                _local6.isProtectPlayer = (_local6.protectPlayerId == _ctrl.player.playerId);
                _local6.protection = _arg1[_local5][1];
                _local6.startTime = _arg1[_local5][2];
                _local6.mainTime = _local4;
                _local6.arrivalTime = _arg1[_local5][3];
                _local6.distance = _arg1[_local5][4];
                _local2.push(_local6);
                _local5++;
            };
            return (_local2);
        }
        public function get closeTakeBible():Array{
            return (this._closeTakeBible);
        }
        public function get getTakeBibleInfo():Object{
            var _local1:Array = _data.takeBible.getTakeBibleInfo;
            var _local2:Object = {};
            _local2.protectionList = this.renderProtectionList(_local1[0]);
            _local2.protectPlayerList = this.renderProtectPlayerList(_local1[1]);
            _local2.takeBibleTimes = _local1[2];
            _local2.totalTakeBibleTimes = _local1[3];
            _local2.refreshPrice = _local1[4];
            _local2.takeBibleStatus = _local1[5];
            _local2.canProtection = _local1[6];
            _local2.protectPlayer = _ctrl.player.removeNickNameSuffix(_local1[7]);
            _local2.bless = _local1[8];
            return (_local2);
        }
        private function renderProtectionList(_arg1:Array):Array{
            var _local5:Object;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local5.protection = _arg1[_local4][0];
                _local5.takeTime = _arg1[_local4][1];
                _local5.awardCoin = _arg1[_local4][2];
                _local5.awardFame = _arg1[_local4][3];
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        private function renderProtectPlayerList(_arg1:Array):Array{
            var _local6:Object;
            var _local7:String;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local6 = {};
                _local6.playerId = _arg1[_local4][0];
                _local6.nickName = _arg1[_local4][1];
                _local6.showName = _ctrl.player.removeNickNameSuffix(_local6.nickName);
                _local6.remainProtectTimes = _arg1[_local4][2];
                _local6.totalProtectTimes = _arg1[_local4][3];
                _local6.protectStatus = _arg1[_local4][4];
                _local7 = Lang.sprintf(TakeBibleControllerLang.RemainProtectTimes, HtmlText.green(_local6.remainProtectTimes));
                if (_local6.remainProtectTimes <= 0){
                    _local7 = TakeBibleControllerLang.ProtectTimesMax;
                };
                if (_local6.protectStatus == 1){
                    _local7 = TakeBibleControllerLang.ProtectTimesMaxIng;
                };
                _local6.label = ((_local6.showName + " ") + _local7);
                _local2.push(_local6);
                _local4++;
            };
            var _local5:Object = {};
            _local5.playerId = 0;
            if (_local2.length <= 0){
                _local5.label = TakeBibleControllerLang.NoFriendOnline;
            } else {
                _local5.label = TakeBibleControllerLang.Invitation;
            };
            _local2.unshift(_local5);
            return (_local2);
        }
        public function get applyFriend():Object{
            var _local1:Array = _data.takeBible.applyFriend;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get cancelApplyFriend():Array{
            return (this._cancelApplyFriend);
        }
        public function get approveApply():Object{
            var _local1:Array = _data.takeBible.approveApply;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get rejectApply():Object{
            var _local1:Array = _data.takeBible.rejectApply;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get buyProtection():Object{
            var _local1:Array = _data.takeBible.buyProtection;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get refreshData():Object{
            var _local1:Array = _data.takeBible.refreshData;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.newProtection = _local1[1];
            _local2.nextPrice = _local1[2];
            return (_local2);
        }
        public function get playerTakeBible():Array{
            var _local5:Object;
            var _local1:Array = _data.takeBible.playerTakeBible;
            var _local2:Array = [];
            var _local3:int = _local1.length;
            var _local4:int = (_local3 - 1);
            while (_local4 >= 0) {
                _local5 = {};
                _local5.playerId = _local1[_local4][0];
                _local5.nickname = _local1[_local4][1];
                _local5.showName = _ctrl.player.removeNickNameSuffix(_local5.nickname);
                _local5.level = _local1[_local4][2];
                _local5.beRobTimes = _local1[_local4][3];
                _local5.totalCanRobTimes = _local1[_local4][4];
                _local5.protectNickname = _ctrl.player.removeNickNameSuffix(_local1[_local4][5]);
                _local5.robCoin = _local1[_local4][6];
                _local5.robFame = _local1[_local4][7];
                _local5.awardCoin = _local1[_local4][8];
                _local5.awardFame = _local1[_local4][9];
                _local5.isRobbed = _local1[_local4][10];
                _local5.factionName = _local1[_local4][11];
                if (_local5.factionName.length <= 0){
                    _local5.factionName = TakeBibleControllerLang.Null;
                    _local5.isFaction = false;
                    _local5.factionColor = HtmlText.White;
                } else {
                    _local5.isFaction = ((_local5.factionName == _ctrl.player.factionName)) ? true : false;
                    if (_local5.isFaction){
                        _local5.factionColor = _data.player.playerInfo.factionColor;
                    } else {
                        _local5.factionColor = HtmlText.White;
                    };
                };
                _local2.push(_local5);
                _data.takeBible.playerTakeBible.splice(_local4, 1);
                _local4--;
            };
            return (_local2);
        }
        public function get startTakeBible():Object{
            var _local1:Array = _data.takeBible.startTakeBible;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get robData():Object{
            var _local1:Array = _data.takeBible.robData;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.takeBiblePlayerId = _local1[1];
            _local2.takeBibleNickname = _local1[2];
            _local2.takeBibleShowname = _ctrl.player.removeNickNameSuffix(_local2.takeBibleNickname);
            _local2.robCoin = _local1[3];
            _local2.robFame = _local1[4];
            _local2.warReportId = _local1[5];
            _local2.warData = [0, 0, 0, [_local1[6][0]]];
            _local2.bless = _local1[7];
            _local2.blessInfo = HtmlText.green((("+" + _local2.bless) + TakeBibleControllerLang.PowerAndLife));
            _local2.info = ((((((((((((((("<font color=\"#ffcc99\">" + "<a href = \"event:") + TextLinkType.Player) + "_") + _local2.takeBiblePlayerId) + "_") + _local2.takeBibleNickname) + "\">") + "<u>") + _local2.takeBibleShowname) + "</u>") + "</a>") + "</font>") + "<font color=\"#ffffff\">") + TakeBibleControllerLang.GuardFriend) + "</font>");
            return (_local2);
        }
        public function get notifyData():Object{
            var _local6:int;
            var _local7:Object;
            var _local8:Object;
            var _local1:Array = _data.takeBible.notifyData;
            var _local2:Object = {};
            _local2.type = _local1[0];
            var _local3:Array = _local1[1];
            var _local4:Array = _local1[2];
            var _local5:Array = _local1[4];
            switch (_local1[0]){
                case Mod_TakeBible_Base.ROB:
                    if (_local3.length > 0){
                        _local2.robberPlayerId = _local3[0][0];
                        _local2.robberNickname = _local3[0][1];
                        _local2.robberShowname = _ctrl.player.removeNickNameSuffix(_local2.robberNickname);
                        _local2.beRobberPlayerId = _local3[0][2];
                        _local2.beRobberNickname = _local3[0][3];
                        _local2.beRobberShowname = _ctrl.player.removeNickNameSuffix(_local2.beRobberNickname);
                        _local2.protection = _local3[0][4];
                        _local2.robCoin = _local3[0][5];
                        _local2.robFame = _local3[0][6];
                        _local2.line = 2;
                        _local7 = this.protectionData(_local2.protection);
                        _local2.isMain = (_local2.robberPlayerId == _ctrl.player.playerId);
                        _local2.info = (((((((((((((((((((((((("<font color=\"#ffcc99\">" + "<a href = \"event:") + TextLinkType.Player) + "_") + _local2.robberPlayerId) + "_") + _local2.robberNickname) + "\">") + _local2.robberShowname) + "</a>") + "</font>") + Lang.sprintf(HtmlText.white(TakeBibleControllerLang.SuccessRob), (("<font color=\"#CC0000\">" + TakeBibleControllerLang.Rob) + "</font>"))) + "<font color=\"#ffcc99\">") + "<a href = \"event:") + TextLinkType.Player) + "_") + _local2.beRobberPlayerId) + "_") + _local2.beRobberNickname) + "\">") + _local2.beRobberShowname) + "</a>") + "</font>") + Lang.sprintf(HtmlText.white(TakeBibleControllerLang.RobIng), (((("<font color=\"#" + _local7.color.toString(16)) + "\">【") + _local7.name) + "】</font>"))) + Lang.sprintf(((("<font color=\"#66ff00\">" + TakeBibleControllerLang.RobAward) + "</font>") + "\n"), _local2.robCoin, _local2.robFame));
                    };
                    break;
                case Mod_TakeBible_Base.TAKE_BIBLE:
                    if (_local4.length > 0){
                        _local2.playerId = _local4[0][0];
                        _local2.nickname = _local4[0][1];
                        _local2.showName = _ctrl.player.removeNickNameSuffix(_local2.nickname);
                        _local2.protection = _local4[0][2];
                        _local2.line = 1;
                        _local8 = this.protectionData(_local2.protection);
                        _local2.info = ((((((((((((("<font color=\"#ffcc99\">" + "<a href = \"event:") + TextLinkType.Player) + "_") + _local2.playerId) + "_") + _local2.nickname) + "\">") + "<u>") + _local2.showName) + "</u>") + "</a>") + "</font>") + Lang.sprintf(HtmlText.white(TakeBibleControllerLang.TaleBible), (((("<font color=\"#" + _local8.color.toString(16)) + "\">【") + _local8.name) + "】</font>")));
                    };
                    break;
                case Mod_TakeBible_Base.NEW_TAKE_BIBLE:
                    _local6 = _ctrl.player.serverTime;
                    _local2.classTakePlayer = this.renderClssTakePlayer(_local1[3]);
                    break;
                case Mod_TakeBible_Base.QUICKLY:
                    if (_local5.length > 0){
                        _local2.playerId = _local5[0][0];
                        _local2.arrivalTime = _local5[0][1];
                        _local2.mainTime = _ctrl.player.serverTime;
                    };
                    break;
                case Mod_TakeBible_Base.ARRIVAL:
                    _local2.playerId = _local1[5][0];
                    _local2.arrivalTime = _ctrl.player.serverTime;
                    _local2.mainTime = _ctrl.player.serverTime;
                    break;
                case Mod_TakeBible_Base.FRIEND_APPROVE_APPLY:
                case Mod_TakeBible_Base.FRIEND_REJECT_APPLY:
                    break;
            };
            return (_local2);
        }
        private function protectionData(_arg1:int):Object{
            var _local2:Object = {};
            switch (_arg1){
                case Mod_TakeBible_Base.TANG_SENG:
                    _local2.name = TakeBibleControllerLang.TS;
                    _local2.color = HtmlText.Yellow;
                    _local2.minColor = "Y";
                    break;
                case Mod_TakeBible_Base.SUN_WU_KONG:
                    _local2.name = TakeBibleControllerLang.SWK;
                    _local2.color = 0xFF00FF;
                    _local2.minColor = "P";
                    break;
                case Mod_TakeBible_Base.ZHU_BA_JIE:
                    _local2.name = TakeBibleControllerLang.ZBJ;
                    _local2.color = HtmlText.Blue;
                    _local2.minColor = "B";
                    break;
                case Mod_TakeBible_Base.SHA_WU_JING:
                    _local2.name = TakeBibleControllerLang.SWJ;
                    _local2.color = HtmlText.Green;
                    _local2.minColor = "G";
                    break;
                case Mod_TakeBible_Base.BAI_LONG_MA:
                    _local2.name = TakeBibleControllerLang.BLM;
                    _local2.color = HtmlText.White;
                    _local2.minColor = "W";
                    break;
            };
            return (_local2);
        }
        public function get notifyGlobal():Object{
            var _local7:Object;
            var _local1:Array = _data.takeBible.notifyGlobal;
            var _local2:Object = {};
            _local2.type = _local1[0];
            var _local3:Array = _local1[1];
            var _local4:Array = _local1[2];
            var _local5:Array = _local1[3];
            var _local6:Array = _local1[4];
            switch (_local2.type){
                case Mod_TakeBible_Base.BEROB:
                    if (_local3.length > 0){
                        _local2.robberNickname = _local3[0][0];
                        _local2.robberShowName = _ctrl.player.removeNickNameSuffix(_local2.robberNickname);
                        _local2.reportId = _local3[0][1];
                    };
                    break;
                case Mod_TakeBible_Base.PROTECT_BEROB:
                    if (_local4.length > 0){
                        _local2.robberNickname = _local4[0][0];
                        _local2.protectNickname = _local4[0][1];
                        _local2.robberShowName = _ctrl.player.removeNickNameSuffix(_local2.robberNickname);
                        _local2.protectShowName = _ctrl.player.removeNickNameSuffix(_local2.protectNickname);
                        _local2.reportId = _local4[0][2];
                    };
                    break;
                case Mod_TakeBible_Base.APPLY_PROTECT:
                    if (_local5.length > 0){
                        _local2.playerId = _local5[0][0];
                        _local2.playerNickname = _local5[0][1];
                        _local2.playerShowName = _ctrl.player.removeNickNameSuffix(_local2.playerNickname);
                        _local2.protectNpc = _local5[0][2];
                        _local2.protectAwardFame = _local5[0][3];
                        _local7 = this.protectionData(_local2.protectNpc);
                        _local2.protectName = (((("<" + _local7.name) + "&") + _local7.minColor) + ">");
                        this.applyProtectList.push(_local2);
                    };
                    break;
            };
            return (_local2);
        }
        public function removeApplyProtect(_arg1:int):void{
            var _local4:Object;
            var _local2:int = this.applyProtectList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this.applyProtectList[_local3];
                if (_local4.playerId == _arg1){
                    this.applyProtectList.splice(_local3, 1);
                    return;
                };
                _local3++;
            };
        }
        public function get quicklyData():Object{
            var _local1:Array = _data.takeBible.quicklyData;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get takeBibleUpdataData():Object{
            var _local1:Array = _data.takeBible.takeBibleUpdataData;
            var _local2:Object = {};
            _local2.canRobTimes = _local1[0];
            _local2.canTakeBibleTimes = _local1[1];
            _local2.callRuLaiPrice = _local1[2];
            this.callRuLaiPrice = _local2.callRuLaiPrice;
            _local2.canCalruLaiTime = _local1[3];
            _data.takeBible.canRobTimes = _local2.canRobTimes;
            _data.takeBible.canTakeBibleTimes = _local2.canTakeBibleTimes;
            return (_local2);
        }
        public function get takeBibleCdTime():Object{
            var _local1:Array = _data.takeBible.takeBibleCdTime;
            var _local2:Object = {};
            _local2.cdTime = _local1[0];
            _local2.cleanIngot = _local1[1];
            return (_local2);
        }
        public function get clearTakeBibleCdTime():Object{
            var _local1:Array = _data.takeBible.clearTakeBibleCdTime;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get buyBless():Object{
            var _local1:Array = _data.takeBible.buyBless;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.newBless = _local1[1];
            return (_local2);
        }
        public function get callRulai():Object{
            var _local1:Array = _data.takeBible.callRuLai;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get getRulaiOpenTimeData():Object{
            var _local7:Object;
            var _local1:Array = _data.takeBible.getRulaiOpenTime;
            var _local2:Array = _local1[1];
            var _local3:Object = {};
            _local3.type = _local1[0];
            this.rulaiState = _local3.type;
            _local3.timeList = [];
            var _local4:int = _local2.length;
            var _local5:Array = [];
            var _local6:int;
            while (_local6 < _local4) {
                _local7 = {};
                _local7.startTime = _local2[_local6][0];
                _local7.endTime = _local2[_local6][1];
                _local3.timeList.push(_local7);
                _local6++;
            };
            return (_local3);
        }
        public function get canRobTimes():int{
            return (_data.takeBible.canRobTimes);
        }
        public function get canProtectTimes():int{
            return (_data.takeBible.canProtectTimes);
        }
        public function get canTakeBibleTimes():int{
            return (_data.takeBible.canTakeBibleTimes);
        }
        public function get quicklyTimes():int{
            return (_data.takeBible.quicklyTimes);
        }

    }
}//package com.controllers 
