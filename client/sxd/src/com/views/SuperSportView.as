//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.*;
    import flash.display.*;
    import com.haloer.net.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.toolbar.*;
    import com.assist.view.war.*;
    import flash.desktop.*;

    public class SuperSportView extends Base implements IView {

        public var topRank:int = 1;
        private var _myRank:int = 0;
        private var _isStartWar:Boolean = false;
        private var _isUpDataRank:Boolean = false;
        private var _newSportWrReport:Object;
        private var openData:Object;
        private var _battleData:Object;
        private var _challengePersonData:Object;
        public var startChallenge:Boolean = false;
        private var _isBatton:Boolean = false;
        private var _isLoaded:Boolean = false;
        private var _playerSign:String;
        private var _sportPlayerList:Array;
        private var _superSport:ISuperSport;
        private var _playerData:Object;
        private var _loader:Loader;
        private var _playerList:Array;

        public function SuperSportView():void{
            this.openData = {};
            this._battleData = {};
            this._playerList = [{
                sign:(RoleType.JianLing + RoleType.Nan),
                x:0,
                y:0
            }, {
                sign:(RoleType.JianLing + RoleType.Nv),
                x:0,
                y:0
            }, {
                sign:(RoleType.FeiYu + RoleType.Nan),
                x:0,
                y:0
            }, {
                sign:(RoleType.FeiYu + RoleType.Nv),
                x:0,
                y:0
            }, {
                sign:(RoleType.WuSheng + RoleType.Nan),
                x:0,
                y:0
            }, {
                sign:(RoleType.WuSheng + RoleType.Nv),
                x:0,
                y:0
            }];
            super();
            _inStageTipTitle = SuperSportViewLang.InStageTipTitle;
            _inStageTipContent = "";
        }
        private function open_super_sport():void{
            _data.call(Mod_SuperSport_Base.open_super_sport, this.openSuperSportCallBack, []);
        }
        public function get_challenge_list():void{
            _data.call(Mod_SuperSport_Base.get_challenge_list, this.getChallengeListCallBack, []);
        }
        public function start_challenge(_arg1:int):void{
            _view.superSportWar.opened = true;
            this.startChallenge = true;
            this.topRank = Math.min(this._myRank, _arg1);
            _data.call(Mod_SuperSport_Base.start_challenge, this.startChallengeCallBack, [_arg1]);
        }
        public function clear_cd_time():void{
            _data.call(Mod_SuperSport_Base.clear_cd_time, this.clearCdTimeCallBack, []);
        }
        public function buy_challenge_times():void{
            _data.call(Mod_SuperSport_Base.buy_challenge_times, this.buyChallengeTimesCallBack, []);
        }
        public function notify_new_sport_war_report():void{
            _data.patch(Mod_SuperSport_Base.notify_new_sport_war_report, this.newSportWarReportTimesCallBack);
        }
        public function notify():void{
            _data.patch(Mod_SuperSport_Base.notify, this.notifyCallBack);
        }
        public function close_super_sport():void{
            _data.call(Mod_SuperSport_Base.close_super_sport, new Function(), []);
        }
        public function get_ranking_top():void{
            _data.call(Mod_SuperSport_Base.get_ranking_top, this.getRankingTopCallBack, []);
        }
        public function notify_update_win_top():void{
            _data.patch(Mod_SuperSport_Base.notify_update_win_top, this.updateWinTopCallBack);
        }
        public function notify_global():void{
            _view.toolbar.cancelPatchNotifyGlobal();
            _data.call(Mod_SuperSport_Base.notify_global, this.globalCallBack, []);
        }
        private function openSuperSportCallBack():void{
            this.openData = _ctrl.superSport.openSuperSport;
            this._myRank = this.openData.mainData.myRank;
            this.topRank = this._myRank;
            loadAssets("SuperSport", this.renderShow, SuperSportViewLang.LoadAssets);
        }
        public function getChallengeListCallBack():void{
            var _local1:Array = _ctrl.superSport.challengeList;
            this._superSport.getChallengePersonList = _local1;
        }
        public function startChallengeCallBack():void{
            var warData:* = null;
            var data:* = _ctrl.superSport.startChallenge;
            if (data.result == Mod_SuperSport_Base.SUCCESS){
                this._superSport.getClearTimer = data.cdTimer;
                this._superSport.getChallengeNum = data.remain;
                _view.superSportWar.detail = {
                    attackerLevel:this._ctrl.player.level,
                    attackerRank:this._myRank,
                    defenderLevel:this._challengePersonData.level,
                    defenderRank:this._challengePersonData.rank
                };
                _view.superSportWar.awardCoin = data["awardCoin"];
                _view.superSportWar.awardFame = data["awardFame"];
                warData = new WarData();
                warData.format(data["warData"]);
                _view.superSportWar.warData = warData;
                _view.superSportWar.reportId = data["reportId"];
                this._isStartWar = true;
                _view.superSportWar.onClose = function ():void{
                    _isStartWar = false;
                    startChallenge = false;
                    _view.toolbar.saveNotifyGlobal();
                    if (_isUpDataRank){
                        get_challenge_list();
                    };
                    _superSport.getNewSportWarReport = _newSportWrReport;
                };
                _view.superSportWar.show();
            } else {
                _view.superSportWar.opened = false;
                this.startChallenge = false;
                this.showResult(data);
            };
        }
        public function clearCdTimeCallBack():void{
            var _local1:Object = _ctrl.superSport.clearCdTime;
            if (_local1.result == Mod_SuperSport_Base.SUCCESS){
                this._superSport.getClearTimer = 0;
                if (this._battleData.isBattle){
                    this.start_challenge(this._battleData.rank);
                    this._battleData.isBattle = false;
                };
            } else {
                this.showResult(_local1);
            };
        }
        public function buyChallengeTimesCallBack():void{
            var _local1:Object = _ctrl.superSport.buyChallengeTimes;
            if (_local1.result == Mod_SuperSport_Base.SUCCESS){
                this._superSport.getBuyChallengeData = _local1;
            } else {
                this.showResult(_local1);
            };
        }
        public function newSportWarReportTimesCallBack():void{
            this._newSportWrReport = _ctrl.superSport.newSportWarReport;
            this._isUpDataRank = !((this._myRank == this._newSportWrReport.myRank));
            if (!this._isStartWar){
                if (this._myRank != this._newSportWrReport.myRank){
                    this.get_challenge_list();
                };
                this._superSport.getNewSportWarReport = this._newSportWrReport;
            };
            this._myRank = this._newSportWrReport.myRank;
            this.topRank = this._myRank;
        }
        public function notifyCallBack():void{
            var _local1:Object = _ctrl.superSport.getNotify;
            if (_local1.msg == 0){
                _view.showTip(SuperSportViewLang.StartAward);
                this._superSport.getAwardTimer(_local1.getAwardTime, _local1.msg);
            } else {
                _view.showTip(SuperSportViewLang.StartAward);
                this._superSport.isShowGetAwardBtn = true;
                this._superSport.getAwardTimer(_local1.awardTime, _local1.msg);
            };
        }
        public function getPlayerWarReportCallBack():void{
        }
        public function updateWinTopCallBack():void{
            var _local1:Object = _ctrl.superSport.updateWinTop;
        }
        public function getRankingTopCallBack():void{
            var _local1:Array = _ctrl.superSport.rankingTop;
            this._superSport.getHeroBoxList = _local1;
        }
        public function globalCallBack():void{
            var _local1:Object = _ctrl.superSport.notifyGlobal;
            if (_local1.type != Mod_SuperSport_Base.AWARD_TOP){
                if (_local1.type == Mod_SuperSport_Base.WIN_TOP){
                    if (_local1.winTimesTop >= 5){
                        this.changeNotife(_local1.info);
                    };
                } else {
                    if (_local1.type == Mod_SuperSport_Base.KILL_WIN_TOP){
                        if (_local1.timesTop >= 5){
                            this.changeNotife(_local1.info);
                        };
                    } else {
                        this.changeNotife(_local1.info);
                    };
                };
            };
            _view.toolbar.patchNotifyGlobal();
        }
        public function changeNotife(_arg1:String):void{
            if (this.inStage){
                this._superSport.getWinCountData = _arg1;
            };
        }
        private function showResult(_arg1:Object):void{
            switch (_arg1.result){
                case Mod_SuperSport_Base.INVALID_RANKING:
                    this.get_challenge_list();
                    _view.showTip(SuperSportViewLang.InvalidRanking);
                    break;
                case Mod_SuperSport_Base.NOT_ENOUGH_CHALLENGE_TIMES:
                    _view.showTip(SuperSportViewLang.NotEnoughChallengeTimes);
                    break;
                case Mod_SuperSport_Base.HAVE_CD_TIME:
                    _view.showTip(SuperSportViewLang.HaveCdTime);
                    break;
                case Mod_SuperSport_Base.NOT_IN_CHALLENGE_TIME:
                    _view.showTip(SuperSportViewLang.NotInChallengeTime);
                    break;
                case Mod_SuperSport_Base.NOT_ENOUGH_INGOT:
                    _view.showTip(SuperSportViewLang.NotEnoughIngot);
                    break;
                case Mod_SuperSport_Base.FULL_BUY_TIMES:
                    _view.showTip(SuperSportViewLang.FullBuyTimes);
                    break;
            };
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        public function show():void{
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.multiMission.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            _view.closeEvent();
            _view.screen.stopPlayerRun();
            this.open_super_sport();
        }
        public function render(_arg1:Array):void{
            var list:* = _arg1;
            this._superSport = (_view.getAssetsObject("SuperSport", "SuperSport") as ISuperSport);
            _popup.addView(this, this._superSport.content);
            this._superSport.tip = _view.tip.iTip;
            this._superSport.drag = _view.drag.iDrag;
            this.notify_global();
            this._superSport.loaderMap = this.renderUrl(list);
            this._superSport.isVip4 = VIPType.check(VIPType.Level1);
            this._superSport.getPlayerData = this.openData.mainData;
            this._superSport.getChallengePersonList = this.openData.challengePersonList;
            this._superSport.getSportReportList = this.openData.sportReportList;
            this._superSport.getBuyChallengeData = this.openData.ChallengeNum;
            this._superSport.getNoticeData = this.openData.awardInfo;
            this._superSport.getClearTimer = this.openData.cdTimer;
            this._superSport.getAwardTimer(this.openData.openTimer, 0);
            this._superSport.renderIngot = _ctrl.player.ingot;
            this._superSport.renderCoins = _ctrl.player.coins;
            this._superSport.isOpenFate = FunctionType.isOpened(FunctionType.Fate);
            this._superSport.isOpenSealSoul = FunctionType.isOpened(FunctionType.SealSoul);
            this.notify_new_sport_war_report();
            this.notify();
            this.notify_update_win_top();
            this._superSport.onAddChallenge = function (_arg1:int, _arg2:int):void{
                var callback:* = null;
                var value:* = _arg1;
                var remainBuyTimes:* = _arg2;
                if (_view.vipEnabled == false){
                    return;
                };
                if (_view.ingotEnough(value) == false){
                    return;
                };
                if (remainBuyTimes > 0){
                    if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.AddChallenge)){
                        dialog.yesLabel = SuperSportViewLang.Sure;
                        dialog.cancelLabel = SuperSportViewLang.Cancel;
                        dialog.hasCheckbox = true;
                        callback = function (_arg1:uint):void{
                            if (_arg1 == AlertButtonType.Yes){
                                buy_challenge_times();
                            };
                            if (dialog.checked){
                                _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.AddChallenge, true);
                            };
                        };
                        dialog.show(Lang.sprintf(SuperSportViewLang.AddChallenge, HtmlText.yellow((value + SuperSportViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                    } else {
                        buy_challenge_times();
                    };
                } else {
                    _view.showTip(SuperSportViewLang.CantAddChallenge);
                };
            };
            this._superSport.onClearCdTimer = function (_arg1:int):void{
                var callback:* = null;
                var value:* = _arg1;
                if ((((_view.vipEnabled == false)) || ((_view.ingotEnough(value) == false)))){
                    return;
                };
                if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.SportClearCd)){
                    dialog.yesLabel = SuperSportViewLang.Sure;
                    dialog.cancelLabel = SuperSportViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            clear_cd_time();
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.SportClearCd, true);
                        };
                    };
                    dialog.show(Lang.sprintf(SuperSportViewLang.ClearCdTimer, HtmlText.yellow((value + SuperSportViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    clear_cd_time();
                };
                _battleData.isBattle = false;
            };
            this._superSport.onChallengePerson = function (_arg1:Object, _arg2:int, _arg3:int):void{
                var callback:* = null;
                var data:* = _arg1;
                var cdTimer:* = _arg2;
                var remainBuyTimes:* = _arg3;
                _challengePersonData = data;
                if (remainBuyTimes <= 0){
                    _view.showTip(SuperSportViewLang.RemainBuyTimes);
                    return;
                };
                if ((((_view.vipEnabled == false)) && ((cdTimer > 0)))){
                    _view.showTip(SuperSportViewLang.ButtleCd);
                    return;
                };
                if (cdTimer > 0){
                    if (_view.ingotEnough(cdTimer) == false){
                        return;
                    };
                    if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.SportClearCd)){
                        dialog.yesLabel = SuperSportViewLang.Sure;
                        dialog.cancelLabel = SuperSportViewLang.Cancel;
                        dialog.hasCheckbox = true;
                        callback = function (_arg1:uint):void{
                            if (_arg1 == AlertButtonType.Yes){
                                clear_cd_time();
                            };
                            if (dialog.checked){
                                _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.SportClearCd, true);
                            };
                        };
                        dialog.show(Lang.sprintf(SuperSportViewLang.ClearCdTimer, HtmlText.yellow((cdTimer + SuperSportViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                    } else {
                        clear_cd_time();
                    };
                    _battleData.isBattle = true;
                    _battleData.rank = data.rank;
                    return;
                };
                start_challenge(data.rank);
            };
            this._superSport.onClose = function ():void{
                close();
            };
            this._superSport.onGetAwardClick = function ():void{
                _superSport.isShowGetAwardBtn = false;
                _view.activities.onStartActivity(ActivityType.Gift4);
            };
            this._superSport.onCharacter = _view.roleMsg.switchSelf;
            this._superSport.onPack = _view.pack.switchSelf;
            this._superSport.onUpgrade = _view.upgrade.switchSelf;
            this._superSport.onResearch = _view.research.switchSelf;
            this._superSport.onDeploy = _view.superDeploy.switchSelf;
            this._superSport.onFate = _view.fate.switchSelf;
            this._superSport.onSealSoul = _view.sealSoul.switchSelf;
            this._superSport.onTextLink = function (_arg1:TextEvent):void{
                var list:* = null;
                var e:* = _arg1;
                list = e.text.split("_");
                switch (list[0]){
                    case TextLinkType.ViewReport:
                        if (_isBatton){
                            return;
                        };
                        _isBatton = true;
                        _view.strategyWar.warType = WarType.SuperSportWar;
                        _view.strategyWar.reportId = list[1];
                        _view.strategyWar.nickName = list[2];
                        _view.strategyWar.version = list[3];
                        _view.strategyWar.onSendChat = function (_arg1:String, _arg2:String):void{
                            var _local4:int;
                            var _local3:Array = _view.strategyWar.reportArgs;
                            if (_local3.length > 0){
                                _local3.unshift(ChatMsgType.WarReport, _arg1, _arg2);
                                _local4 = list[4];
                                _local3.push(_local4);
                                _view.chat.showMsg(_local3);
                            };
                        };
                        _view.strategyWar.onClose = function ():void{
                            _isBatton = false;
                        };
                        _view.strategyWar.show();
                        break;
                    case TextLinkType.CopyReport:
                        _view.strategyWar.warType = WarType.SuperSportWar;
                        _view.strategyWar.reportId = list[1];
                        _view.strategyWar.nickName = list[2];
                        _view.strategyWar.version = list[3];
                        Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, _view.strategyWar.reportUrl);
                        break;
                    default:
                        _view.toolbar.onTextLink(e);
                };
            };
            this._superSport.onAwardCount = function ():void{
                get_ranking_top();
            };
            this._superSport.onSendFlower = function (_arg1:Object):void{
                _view.sendFlower.sendPlayerID = _arg1.id;
                _view.sendFlower.show();
            };
            this._superSport.onCheckHero = function (_arg1:Object):void{
                if (_arg1.id == _ctrl.player.playerId){
                    return;
                };
                _view.otherRoleMsg.init(_arg1.id, _arg1.name);
                _view.otherRoleMsg.show();
            };
            this._superSport.onAddFriend = function (_arg1:Object):void{
                if (_arg1.id == _ctrl.player.playerId){
                    return;
                };
                _view.friendList.addFriend(_arg1.name);
            };
            this.reposition();
        }
        public function reposition(_arg1:Boolean=true):void{
            if (inStage == false){
                return;
            };
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._superSport.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageClip);
            };
        }
        public function onClearCdTimer(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.clear_cd_time();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function onAddChallenge(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.buy_challenge_times();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function set renderIngot(_arg1:Number):void{
            if (inStage){
                this._superSport.renderIngot = _arg1;
            };
        }
        public function set renderCoins(_arg1:Number):void{
            if (inStage){
                this._superSport.renderCoins = _arg1;
            };
        }
        public function clear():void{
            this._superSport.clear();
            this.startChallenge = false;
        }
        public function close():void{
            this._isBatton = false;
            this.clear();
            this.close_super_sport();
            _data.cancelPatch(Mod_SuperSport_Base.notify_new_sport_war_report);
            _data.cancelPatch(Mod_SuperSport_Base.notify);
            _data.cancelPatch(Mod_SuperSport_Base.notify_update_win_top);
            _popup.closeView(this);
            _view.openEvent();
        }
        private function renderShow():void{
            if (this._isLoaded){
                this.render([]);
            } else {
                this.getPlayerUrl();
                this.loadSportPlayer();
            };
            this._isLoaded = true;
        }
        private function loadSportPlayer():void{
            File.loadList(this._sportPlayerList, this.render);
        }
        private function getPlayerUrl():void{
            this._sportPlayerList = [];
            var _local1:int = _view.ctrl.player.mainRoleId;
            this._playerSign = RoleType.getRoleSign(_local1);
            var _local2:String = ((URI.sportIconUrl + this._playerSign) + ".swf");
            this._sportPlayerList.push(_local2);
        }
        private function renderUrl(_arg1:Array):Object{
            var _local4:Object;
            this._playerData = {};
            var _local2:int = this._playerList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._playerList[_local3];
                if (_local4.sign == this._playerSign){
                    this._playerData = _local4;
                    if (_arg1.length <= 0){
                        this._playerData.loader = this._loader;
                    } else {
                        this._loader = _arg1[0].loader;
                        this._playerData.loader = _arg1[0].loader;
                    };
                    return (this._playerData);
                };
                _local3++;
            };
            return ({});
        }

    }
}//package com.views 
