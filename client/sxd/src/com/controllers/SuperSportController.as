//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.toolbar.*;
    import com.datas.*;
    import com.lang.client.com.controllers.*;
    import com.protocols.*;

    public class SuperSportController extends com.controllers.Base {

        public var ownData:SuperSportData;
        private var _numData:Object;
        private var winData:Object;
        private var winLastData:Object;

        public function SuperSportController(){
            this._numData = {
                0:SuperSportControllerLang.One,
                1:SuperSportControllerLang.Two,
                2:SuperSportControllerLang.Three,
                3:SuperSportControllerLang.Four,
                4:SuperSportControllerLang.Five
            };
            this.winData = {
                5:SuperSportControllerLang.WinInfo1,
                6:SuperSportControllerLang.WinInfo1,
                7:SuperSportControllerLang.WinInfo1,
                8:SuperSportControllerLang.WinInfo2,
                9:SuperSportControllerLang.WinInfo2,
                10:SuperSportControllerLang.WinInfo2,
                11:SuperSportControllerLang.WinInfo3,
                12:SuperSportControllerLang.WinInfo3,
                13:SuperSportControllerLang.WinInfo3,
                14:SuperSportControllerLang.WinInfo4,
                15:SuperSportControllerLang.WinInfo4,
                16:SuperSportControllerLang.WinInfo4,
                17:SuperSportControllerLang.WinInfo5,
                18:SuperSportControllerLang.WinInfo5,
                19:SuperSportControllerLang.WinInfo5,
                20:SuperSportControllerLang.WinInfo6,
                21:SuperSportControllerLang.WinInfo6,
                22:SuperSportControllerLang.WinInfo6,
                23:SuperSportControllerLang.WinInfo7,
                24:SuperSportControllerLang.WinInfo7,
                25:SuperSportControllerLang.WinInfo7,
                26:SuperSportControllerLang.WinInfo8,
                27:SuperSportControllerLang.WinInfo8,
                28:SuperSportControllerLang.WinInfo8,
                29:SuperSportControllerLang.WinInfo9,
                30:SuperSportControllerLang.WinInfo9,
                31:SuperSportControllerLang.WinInfo9
            };
            this.winLastData = {
                5:"",
                6:"",
                7:"",
                8:"",
                9:"",
                10:"",
                11:"",
                12:"",
                13:"",
                14:"",
                15:"",
                16:"",
                17:"",
                18:"",
                19:"",
                20:"",
                21:"",
                22:"",
                23:SuperSportControllerLang.WinLast1,
                24:SuperSportControllerLang.WinLast1,
                25:SuperSportControllerLang.WinLast1,
                26:SuperSportControllerLang.WinLast2,
                27:SuperSportControllerLang.WinLast2,
                28:SuperSportControllerLang.WinLast2,
                29:SuperSportControllerLang.WinLast3,
                30:SuperSportControllerLang.WinLast3,
                31:SuperSportControllerLang.WinLast3
            };
            super();
        }
        public function get openSuperSport():Object{
            var _local1:int = _data.player.playerId;
            var _local2:Array = _data.SuperSport.openSuperSport;
            var _local3:Object = {};
            _local3.mainData = {};
            _local3.ChallengeNum = {};
            _local3.awardInfo = {};
            _local3.challengePersonList = [];
            _local3.sportReportList = [];
            _local3.winCountData = {};
            _local3.mainData.myRank = _local2[0];
            _local3.mainData.name = _data.player.nickname;
            _local3.mainData.winCount = _local2[1];
            _local3.mainData.fame = _local2[2];
            _local3.mainData.fameName = FameLevel.getFameName(_local2[3]);
            _local3.ChallengeNum.remainChallengeTimes = _local2[4];
            _local3.ChallengeNum.remainBuyTimes = _local2[5];
            _local3.ChallengeNum.nextBuyPrice = _local2[6];
            _local3.awardInfo.awardCoin = _local2[7];
            _local3.awardInfo.awardFame = _local2[8];
            var _local4:Number = _ctrl.player.serverTime;
            _local3.awardInfo.awardTime = (_local2[9] - _local4);
            _local3.openTimer = (_local2[10] - _local4);
            _local3.cdTimer = _local2[11];
            _local3.challengePersonList = this.renderChallengePersonList(_local2[12]);
            _local3.sportReportList = this.renderSportReportList(_local2[13]);
            _local3.winCountData.winId = _local2[14];
            _local3.winCountData.winName = _local2[15];
            _local3.winCountData.winTimesTop = _local2[16];
            return (_local3);
        }
        private function renderChallengePersonList(_arg1:Array):Array{
            var _local5:Object;
            var _local2:int = _arg1.length;
            var _local3:Array = [];
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = {};
                _local5.rank = _arg1[_local4][0];
                _local5.playerId = _arg1[_local4][1];
                _local5.roleId = _arg1[_local4][2];
                _local5.sign = RoleType.getRoleSign(_local5.roleId);
                _local5.url = URI.getRoleIconUrl(_local5.sign);
                _local5.level = _arg1[_local4][3];
                _local5.name = _arg1[_local4][4];
                _local5.showName = _ctrl.player.removeNickNameSuffix(_local5.name);
                _local5.awardCoin = _arg1[_local4][5];
                _local5.awardFame = _arg1[_local4][6];
                _local5.liveX = 0;
                _local3.push(_local5);
                _local4++;
            };
            return (_local3);
        }
        private function renderSportReportList(_arg1:Array):Array{
            var _local6:Object;
            var _local2:int = _arg1.length;
            var _local3:Array = [];
            var _local4:int = _ctrl.player.serverTime;
            var _local5:int;
            while (_local5 < _local2) {
                _local6 = {};
                _local6.warReportId = _arg1[_local5][0];
                _local6.isRead = _arg1[_local5][1];
                _local6.attackPlayerId = _arg1[_local5][2];
                _local6.showAttackPlayerName = "";
                _local6.isYou = false;
                if (_local6.attackPlayerId == _data.player.playerId){
                    _local6.isYou = true;
                    _local6.attackPlayerName = SuperSportControllerLang.You;
                } else {
                    _local6.attackPlayerName = _arg1[_local5][3];
                    _local6.showAttackPlayerName = _ctrl.player.removeNickNameSuffix(_local6.attackPlayerName);
                };
                _local6.defensePlayerId = _arg1[_local5][4];
                _local6.defensePlayerName = "";
                _local6.isDefenseYou = false;
                if (_local6.defensePlayerId == _data.player.playerId){
                    _local6.isDefenseYou = true;
                    _local6.defensePlayerName = SuperSportControllerLang.You;
                } else {
                    _local6.defensePlayerName = _arg1[_local5][5];
                    _local6.showDefensePlayerName = _ctrl.player.removeNickNameSuffix(_local6.defensePlayerName);
                };
                _local6.winPlayerId = _arg1[_local5][6];
                _local6.oldRank = _arg1[_local5][7];
                _local6.newRank = _arg1[_local5][8];
                _local6.version = _arg1[_local5][9];
                _local6.reportTimer = TimeChange.timerInfo(_arg1[_local5][10], _local4, SuperSportControllerLang.Just);
                if (_local6.oldRank > _local6.newRank){
                    _local6.isRunkUp = 0;
                };
                if (_local6.oldRank < _local6.newRank){
                    _local6.isRunkUp = 1;
                };
                if (_local6.oldRank == _local6.newRank){
                    _local6.isRunkUp = 2;
                };
                _local6.isWin = (_local6.winPlayerId == _data.player.playerId);
                _local3.push(_local6);
                _local5++;
            };
            return (_local3);
        }
        public function get challengeList():Array{
            var _local1:Array = _data.SuperSport.challengeList;
            var _local2:Array = this.renderChallengePersonList(_local1[0]);
            return (_local2);
        }
        public function get startChallenge():Object{
            var _local3:Array;
            var _local1:Array = _data.SuperSport.startChallenge;
            var _local2:Object = {};
            _local2.result = _local1[0];
            _local2.msg = _local1[0];
            _local2.remain = _local1[1];
            _local2.cdTimer = _local1[2];
            if (_local2.result == Mod_SuperSport_Base.SUCCESS){
                _local3 = _local1[3][0];
                _local2.awardFame = _local3[0];
                _local2.awardCoin = _local3[1];
                _local2.reportId = _local3[2];
                _local2.warData = [0, 0, 0, [_local3[3][0]]];
            };
            return (_local2);
        }
        public function get clearCdTime():Object{
            var _local1:Array = _data.SuperSport.clearCdTime;
            var _local2:Object = {};
            _local2.result = _local1[0];
            return (_local2);
        }
        public function get buyChallengeTimes():Object{
            var _local1:Array = _data.SuperSport.buyChallengeTimes;
            var _local2:Object = {};
            _local2.result = _local1[0];
            _local2.remainBuyTimes = _local1[1];
            _local2.nextBuyPrice = _local1[2];
            _local2.remainChallengeTimes = _local1[3];
            return (_local2);
        }
        public function get newSportWarReport():Object{
            var _local1:Array = _data.SuperSport.newSportWarReport;
            var _local2:Object = {};
            _local2.myRank = _local1[0];
            _local2.awardCoin = _local1[1];
            _local2.awardFame = _local1[2];
            _local2.winCount = _local1[3];
            _local2.fame = _local1[4];
            _local2.fameLevel = _local1[5];
            _local2.fameName = FameLevel.getFameName(_local2.fameLevel);
            var _local3:Array = [];
            _local3 = _local1;
            _local3.shift();
            _local3.shift();
            _local3.shift();
            _local3.shift();
            _local3.shift();
            _local3.shift();
            var _local4:Array = this.renderSportReportList([_local3]);
            _local2.sportReport = _local4[0];
            return (_local2);
        }
        public function get getNotify():Object{
            var _local1:Array = _data.SuperSport.getNotify;
            var _local2:Object = {};
            _local2.notifyType = _local1[0];
            if (_local2.notifyType == Mod_SuperSport_Base.START_AWARD){
                _local2.msg = 0;
            };
            if (_local2.notifyType == Mod_SuperSport_Base.END_AWARD){
                _local2.msg = 1;
            };
            var _local3:Number = _ctrl.player.serverTime;
            _local2.awardTime = (_local1[1] - _local3);
            _local2.getAwardTime = (_local1[2] - _local3);
            return (_local2);
        }
        public function get closeSuperSport():Array{
            return ([]);
        }
        public function get playerWarReport():Array{
            return ([]);
        }
        public function get rankingTop():Array{
            var _local5:Object;
            var _local1:Array = _data.SuperSport.rankingTop;
            var _local2:Array = [];
            var _local3:int = _local1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local5.rank = _local1[_local4][0];
                _local5.lastRank = _local1[_local4][1];
                if (_local5.rank > _local5.lastRank){
                    _local5.isUp = 0;
                };
                if (_local5.rank < _local5.lastRank){
                    _local5.isUp = 1;
                };
                if (_local5.rank == _local5.lastRank){
                    _local5.isUp = 2;
                };
                _local5.id = _local1[_local4][2];
                _local5.name = _local1[_local4][3];
                _local5.showName = _ctrl.player.removeNickNameSuffix(_local5.name);
                _local5.level = _local1[_local4][4];
                _local5.power = _local1[_local4][5];
                _local5.isOnline = _local1[_local4][6];
                _local5.sex = RoleType.getRoleGender(_local1[_local4][7]);
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        public function get updateWinTop():Object{
            var _local1:Array = _data.SuperSport.updateWinTop;
            var _local2:Object = {};
            _local2.winId = _local1[0];
            _local2.winName = _local1[1];
            _local2.winTimesTop = _local1[2];
            return (_local2);
        }
        public function get notifyGlobal():Object{
            var _local1:Array = _data.SuperSport.notifyGlobal;
            var _local2:Object = {};
            _local2.type = _local1[0];
            switch (_local2.type){
                case Mod_SuperSport_Base.WIN_TOP:
                    _local2.winId = _local1[1][0][0];
                    _local2.winName = _local1[1][0][1];
                    _local2.showWinName = _ctrl.player.removeNickNameSuffix(_local2.winName);
                    _local2.winTimesTop = _local1[1][0][2];
                    this.getWinCountData(_local2);
                    break;
                case Mod_SuperSport_Base.KILL_WIN_TOP:
                    _local2.killPlayerId = _local1[2][0][0];
                    _local2.killNickname = _local1[2][0][1];
                    _local2.showKillNickname = _ctrl.player.removeNickNameSuffix(_local2.killNickname);
                    _local2.topPlayerId = _local1[2][0][2];
                    _local2.topNickName = _local1[2][0][3];
                    _local2.showTopNickName = _ctrl.player.removeNickNameSuffix(_local2.topNickName);
                    _local2.timesTop = _local1[2][0][4];
                    this.killWinTop(_local2);
                    break;
                case Mod_SuperSport_Base.RANKING_TOP:
                    _local2.playerId = _local1[3][0][0];
                    _local2.playerNickname = _local1[3][0][1];
                    _local2.oldPlayerId = _local1[3][0][2];
                    _local2.oldPlayerNickname = _local1[3][0][3];
                    this.rankInfTop(_local2);
                    break;
                case Mod_SuperSport_Base.UPDATE_RANKING_TOP:
                    _local2.playerId = _local1[4][0][0];
                    _local2.nickName = _local1[4][0][1];
                    _local2.updateRanking = _local1[4][0][2];
                    this.updateRankIngTop(_local2);
                    break;
                case Mod_SuperSport_Base.AWARD_TOP:
                    _local2.awardTop = this.renderAwardTop(_local1[5], _local2);
                    break;
            };
            return (_local2);
        }
        private function renderAwardTop(_arg1:Array, _arg2:Object):Array{
            var _local6:Object;
            var _local3:int = _arg1.length;
            var _local4:Array = [];
            _arg2.info = ((((("<font color=\"#fff200\">" + SuperSportControllerLang.Notice) + "</font>") + "<font color=\"#ffffff\">") + SuperSportControllerLang.AwardTop) + "</font>");
            var _local5:int;
            while (_local5 < _local3) {
                _local6 = {};
                _local6.ranking = _arg1[_local5][0];
                _local6.playerId = _arg1[_local5][1];
                _local6.nickName = _arg1[_local5][2];
                _local6.showName = _ctrl.player.removeNickNameSuffix(_local6.nickName);
                _local6.awardCoin = _arg1[_local5][3];
                _local6.awardFame = _arg1[_local5][4];
                _arg2.info = (_arg2.info + (((((((((((((((((((((((("\n" + "<font color=\"#ffffff\">") + Lang.sprintf(SuperSportControllerLang.Rank, this._numData[_local5])) + ":</font>") + "<font color=\"#fff200\">") + "<u>") + "<a href=\"event:") + TextLinkType.Player) + "_") + _local6.playerId) + "_") + _local6.nickName) + "\">") + _local6.showName) + "</a>") + "</u>") + "</font>") + "<font color=\"#ffffff\"> ") + _local6.awardCoin) + SuperSportControllerLang.Coin) + "</font>") + "<font color=\"#ffffff\"> ") + _local6.awardFame) + SuperSportControllerLang.Fram) + "</font>"));
                _local4.push(_local6);
                _local5++;
            };
            return (_local4);
        }
        private function getWinCountData(_arg1:Object):void{
            var _local2:int = _arg1.winTimesTop;
            var _local3:String = "";
            if (_local2 > 13){
                _local2 = 13;
            };
            _arg1.info = ((((((((((((("<b>" + "<font color=\"#fff200\"><u><a href=\"event:") + TextLinkType.Player) + "_") + _arg1.winId) + "_") + _arg1.winName) + "\">") + _arg1.showWinName) + "</a></u></font>") + "<font color=\"#ffffff\">") + Lang.sprintf(SuperSportControllerLang.WinCount1, this.winData[_local2], _arg1.winTimesTop, this.winLastData[_local2])) + "</font>") + "</b>");
            _arg1.worldInfo = (("<font color=\"#fff200\"><b>" + Lang.sprintf(SuperSportControllerLang.WinCount2, _arg1.showWinName, this.winData[_local2], _arg1.winTimesTop, this.winLastData[_local2])) + "</b></font>");
        }
        private function killWinTop(_arg1:Object):void{
            _arg1.info = ((((((((((((((((((((((((((((((((("<b>" + "<font color=\"#fff200\">") + "<u>") + "<a href=\"event:") + TextLinkType.Player) + "_") + _arg1.killPlayerId) + "_") + _arg1.killNickname) + "\">") + _arg1.showKillNickname) + "</a>") + "</u>") + "</font>") + "<font color=\"#ffffff\">") + SuperSportControllerLang.KillWin1) + "</font>") + "<font color=\"#fff200\">") + "<u>") + "<a href=\"event:") + TextLinkType.Player) + "_") + _arg1.topPlayerId) + "_") + _arg1.topNickName) + "\">") + _arg1.showTopNickName) + "</a>") + "</u>") + "</font>") + "<font color=\"#ffffff\">") + Lang.sprintf(SuperSportControllerLang.KillWin2, _arg1.timesTop)) + "</font>") + "</b>");
            _arg1.worldInfo = (("<font color=\"#fff200\"><b>" + Lang.sprintf(SuperSportControllerLang.KillWin3, _arg1.showKillNickname, _arg1.showTopNickName, _arg1.timesTop)) + "</b></font>");
        }
        private function rankInfTop(_arg1:Object):void{
            if (_arg1.oldPlayerId == 0){
                _arg1.info = ((((((((((((((((("<b>" + "<font color=\"#fff200\">") + "<u>") + "<a href=\"event:") + TextLinkType.Player) + "_") + _arg1.playerId) + "_") + _arg1.playerNickname) + "\">") + _ctrl.player.removeNickNameSuffix(_arg1.playerNickname)) + "</a>") + "</u>") + "</font>") + "<font color=\"#ffffff\">") + SuperSportControllerLang.RankInfTop) + "</font>") + "</b>");
                _arg1.worldInfo = ((((("<font color=\"#fff200\"><b>" + "【") + _ctrl.player.removeNickNameSuffix(_arg1.playerNickname)) + "】") + SuperSportControllerLang.RankInfTop) + "</b></font>");
            } else {
                _arg1.info = ((((((((((((((((((((((((((((((((("<b>" + "<font color=\"#fff200\">") + "<u>") + "<a href=\"event:") + TextLinkType.Player) + "_") + _arg1.playerId) + "_") + _arg1.playerNickname) + "\">") + _ctrl.player.removeNickNameSuffix(_arg1.playerNickname)) + "</a>") + "</u>") + "</font>") + "<font color=\"#ffffff\">") + SuperSportControllerLang.RankInfTop1) + "</font>") + "<font color=\"#fff200\">") + "<u>") + "<a href=\"event:") + TextLinkType.Player) + "_") + _arg1.oldPlayerId) + "_") + _arg1.oldPlayerNickname) + "\">") + _ctrl.player.removeNickNameSuffix(_arg1.oldPlayerNickname)) + "</a>") + "</u>") + "</font>") + "<font color=\"#ffffff\">，") + SuperSportControllerLang.RankInfTop) + "</font>") + "</b>");
                _arg1.worldInfo = ((((((((("<font color=\"#fff200\"><b>" + "【") + _ctrl.player.removeNickNameSuffix(_arg1.playerNickname)) + "】") + SuperSportControllerLang.RankInfTop1) + "【") + _ctrl.player.removeNickNameSuffix(_arg1.oldPlayerNickname)) + "】") + SuperSportControllerLang.RankInfTop) + "</b></font>");
            };
        }
        private function updateRankIngTop(_arg1:Object):void{
            _arg1.info = ((((((((((((((((("<b>" + "<font color=\"#fff200\">") + "<u>") + "<a href=\"event:") + TextLinkType.Player) + "_") + _arg1.playerId) + "_") + _arg1.nickName) + "\">") + _ctrl.player.removeNickNameSuffix(_arg1.nickName)) + "</a>") + "</u>") + "</font>") + "<font color=\"#ffffff\">") + Lang.sprintf(SuperSportControllerLang.updateRank, _arg1.updateRanking)) + "</font>") + "</b>");
            _arg1.worldInfo = ((((("<font color=\"#fff200\"><b>" + "【") + _ctrl.player.removeNickNameSuffix(_arg1.nickName)) + "】") + Lang.sprintf(SuperSportControllerLang.updateRank, _arg1.updateRanking)) + "</b></font>");
        }

    }
}//package com.controllers 
