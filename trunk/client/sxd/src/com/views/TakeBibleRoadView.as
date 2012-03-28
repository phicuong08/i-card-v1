//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.*;
    import flash.display.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;
    import com.lang.client.com.views.toolbar.*;

    public class TakeBibleRoadView extends Base implements IView {

        private var _playerId:int;
        private var _ruLaiType:int;
        private var _isSelf:Boolean = false;
        private var _isMainData:Object;
        public var _rulaiStartTimeList:Array;
        private var _takeBibleRoad:ITakeBibleRoad;
        private var _isClose:Boolean = false;
        private var _robId:int = 0;
        private var _isProtect:Boolean = false;
        private var _speedUpNum:int = 0;
        private var _systemList:Array;
        private var _playerData:Object;
        private var _isShowBaiMa:Boolean = true;
        private var _reportId:int = 0;

        public function TakeBibleRoadView():void{
            this._systemList = [];
            super();
            _inStageTipTitle = TakeBibleRoadViewLang.InStageTipTitle;
            _inStageTipContent = "";
        }
        private function open_take_bible():void{
            _data.call(Mod_TakeBible_Base.open_take_bible, this.openTakeBibleCallBack, []);
        }
        private function close_take_bible():void{
            _data.call(Mod_TakeBible_Base.close_take_bible, new Function(), []);
        }
        private function notify():void{
            _data.patch(Mod_TakeBible_Base.notify, this.notifyCallBack);
        }
        private function get_player_take_bible(_arg1:int):void{
            this._playerId = _arg1;
            _data.call(Mod_TakeBible_Base.get_player_take_bible, this.getPlayerTakeBibleCallBack, [_arg1]);
        }
        private function quickly(_arg1:int):void{
            _data.call(Mod_TakeBible_Base.quickly, this.quicklyCallBack, [_arg1]);
        }
        private function rob(_arg1:int):void{
            _view.takeBibleWar.opened = true;
            _data.call(Mod_TakeBible_Base.rob, this.robCallBack, [_arg1]);
        }
        public function get_take_bible_updata_data():void{
            _data.call(Mod_TakeBible_Base.get_take_bible_updata_data, this.takeBibleUpdataDataCallBack, []);
        }
        public function get_rob_take_bible_cd_time():void{
            _data.call(Mod_TakeBible_Base.get_rob_take_bible_cd_time, this.takeBibleCdTimeCallBack, []);
        }
        public function clear_rob_take_bible_cd_time():void{
            _data.call(Mod_TakeBible_Base.clear_rob_take_bible_cd_time, this.clearTakeBibleCdTimeCallBack, []);
        }
        public function call_rulai():void{
            _data.call(Mod_TakeBible_Base.call_rulai, this.callRulaiCallBack, []);
        }
        public function get_rulai_open_time():void{
            _data.call(Mod_TakeBible_Base.get_rulai_open_time, this.getRulaiOpenTimeCallBack, []);
        }
        private function openTakeBibleCallBack():void{
            var _local1:Object;
            var _local2:Number;
            var _local3:Number;
            var _local4:Object;
            if (inStage){
                _local1 = _ctrl.TakeBible.openTakeBible;
                this._takeBibleRoad.TakeBibleRoadData(_local1);
                this._takeBibleRoad.getTakeBibleTeamList = _local1.classTakePlayer;
                this._ruLaiType = _local1.type;
                switch (_local1.type){
                    case Mod_TakeBible_Base.OPEN_FOR_CALL:
                        _view.toolbar.rulaiType(1);
                        _view.takeBibleReady.awardState = 0;
                        break;
                    case Mod_TakeBible_Base.OPEN:
                        _view.toolbar.rulaiType(2);
                        _local2 = ((_local1.isSelf == true)) ? 1 : 0.2;
                        _view.takeBibleReady.awardState = _local2;
                        break;
                    case Mod_TakeBible_Base.CLOSE:
                        _local3 = this.getStartTime;
                        if (_local3 == 0){
                            _local4 = this._rulaiStartTimeList[0];
                            _local3 = _local4.startTime;
                        };
                        _local1.time = _local3;
                        _view.toolbar.rulaiType(3);
                        break;
                };
                this._takeBibleRoad.getStartRuLaiData = _local1;
                this._takeBibleRoad.callRuLaiState = _local1;
            } else {
                this.renderShow();
            };
        }
        private function getPlayerTakeBibleCallBack():void{
            var _local4:Object;
            var _local1:Array = _ctrl.TakeBible.playerTakeBible;
            if (this.inStage == false){
                return;
            };
            var _local2:int = _local1.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = _local1[_local3];
                this._takeBibleRoad.playerData = _local4;
                _local3++;
            };
        }
        private function takeBibleUpdataDataCallBack():void{
            var _local1:Object = _ctrl.TakeBible.takeBibleUpdataData;
            if (_ctrl.TakeBible.canTakeBibleTimes <= 0){
                this._view.activities.visibleBtnEffect(FunctionType.TakeBible, keepAliveLang.CanCall, false);
                this._view.activities.visibleBtnEffect(FunctionType.TakeBible, keepAliveLang.RuLaiSpirit, false);
            };
            if (this.inStage == false){
                return;
            };
            this._takeBibleRoad.returnTakeBibleRoadData(_local1);
            this._takeBibleRoad.callRuLaiState = _local1;
        }
        private function notifyCallBack():void{
            var _local1:Object;
            var _local2:Boolean;
            if (inStage == false){
                return;
            };
            _local1 = _ctrl.TakeBible.notifyData;
            switch (_local1.type){
                case Mod_TakeBible_Base.ROB:
                    if (_local1.isMain){
                        this._isMainData = _local1;
                    } else {
                        this._takeBibleRoad.getSystemInfo = _local1;
                    };
                    break;
                case Mod_TakeBible_Base.TAKE_BIBLE:
                    this._takeBibleRoad.getSystemInfo = _local1;
                    break;
                case Mod_TakeBible_Base.NEW_TAKE_BIBLE:
                    if (this._isClose == false){
                        this._takeBibleRoad.getTakeBibleTeamData = _local1.classTakePlayer[0];
                    };
                    break;
                case Mod_TakeBible_Base.QUICKLY:
                    this._takeBibleRoad.changeTime = _local1;
                    break;
                case Mod_TakeBible_Base.ARRIVAL:
                    _local2 = (_local1.playerId == _ctrl.player.playerId);
                    this._takeBibleRoad.clearTeam(_local1.playerId, _local2);
                    if (_local2){
                        this.isUserProtection = 0;
                        if (_view.takeBibleReady.inStage){
                            _view.takeBibleReady.get_take_bible_info();
                        };
                    };
                    break;
                case Mod_TakeBible_Base.FRIEND_APPROVE_APPLY:
                    _view.takeBibleReady.hasApplyFriend(true);
                    break;
            };
        }
        private function quicklyCallBack():void{
            var _local1:Object = _ctrl.TakeBible.quicklyData;
            if (_local1.msg == Mod_TakeBible_Base.SUCCESS){
                this._takeBibleRoad.isUserSpeedUp();
                if (this._speedUpNum <= 600){
                    this._takeBibleRoad.clearTeam(_ctrl.player.playerId, true);
                    _view.showTip(TakeBibleRoadViewLang.SuccessTakeBible, "", TipType.Success);
                } else {
                    _view.showTip(TakeBibleRoadViewLang.SuccessQuickly, "", TipType.Success);
                };
            } else {
                this.renderMsg(_local1);
            };
        }
        private function robCallBack():void{
            var warData:* = null;
            var warInfo:* = null;
            var data:* = _ctrl.TakeBible.robData;
            this.get_player_take_bible(this._robId);
            this.get_rob_take_bible_cd_time();
            this.get_take_bible_updata_data();
            if (data.msg == Mod_TakeBible_Base.SUCCESS){
                warData = new WarData();
                warData.format(data["warData"]);
                _view.takeBibleWar.warData = warData;
                _view.takeBibleWar.awardFame = _ctrl.TakeBible.robData["robFame"];
                _view.takeBibleWar.awardCoin = _ctrl.TakeBible.robData["robCoin"];
                warInfo = "";
                if (this._isProtect){
                    warInfo = (data.info + "\n");
                };
                if (data.bless > 1){
                    warInfo = (warInfo + data.blessInfo);
                };
                _view.takeBibleWar.detail = {defenderFriend:warInfo};
                _view.takeBibleWar.onClose = function (_arg1:Boolean):void{
                    _popup.addChildAt(_takeBibleRoad.content, 0);
                    open_take_bible();
                    if (_isMainData){
                        _takeBibleRoad.isUserProtection = 0;
                        _takeBibleRoad.getSystemInfo = _isMainData;
                        _isMainData = null;
                    };
                    _isClose = false;
                    _view.toolbar.renderTakeBibleBerobbed();
                    _data.patch(Mod_TakeBible_Base.notify, notifyCallBack);
                };
                _view.takeBibleWar.onAfterAdded = function ():void{
                    _popup.removeChild(_takeBibleRoad.content);
                    _isClose = true;
                    _data.cancelPatch(Mod_TakeBible_Base.notify);
                };
                _view.takeBibleWar.show();
            } else {
                _view.takeBibleWar.opened = false;
                if (data.msg == Mod_TakeBible_Base.TAKE_BIBLE_STATUS){
                    _view.showTip(TakeBibleRoadViewLang.TakeBibleStatus);
                } else {
                    this.renderMsg(data);
                };
            };
            this._robId = 0;
        }
        private function takeBibleCdTimeCallBack():void{
            var _local1:Object = _ctrl.TakeBible.takeBibleCdTime;
            this._takeBibleRoad.cdTime = _local1;
        }
        private function clearTakeBibleCdTimeCallBack():void{
            var _local2:Object;
            var _local1:Object = _ctrl.TakeBible.clearTakeBibleCdTime;
            if (_local1.msg == Mod_TakeBible_Base.SUCCESS){
                _local2 = {};
                _local2.cdTime = 0;
                _local2.cleanIngot = 0;
                this._takeBibleRoad.cdTime = _local2;
                if (this._robId != 0){
                    this.robTakeBible();
                };
            } else {
                this.renderMsg(_local1);
            };
        }
        private function callRulaiCallBack():void{
            var _local1:Object = _ctrl.TakeBible.callRulai;
            if (_local1.msg == Mod_TakeBible_Base.SUCCESS){
                _view.showTip(TakeBibleRoadViewLang.CallRulaiSuccess, TakeBibleRoadViewLang.SystemInfo, TipType.Success);
            } else {
                this.renderMsg(_local1);
            };
        }
        public function getRulaiOpenTimeCallBack():void{
            var _local1:Object = _ctrl.TakeBible.getRulaiOpenTimeData;
            this._rulaiStartTimeList = _local1.timeList;
            switch (_local1.type){
                case Mod_TakeBible_Base.OPEN_FOR_CALL:
                    _view.toolbar.rulaiType(1);
                    break;
                case Mod_TakeBible_Base.OPEN:
                    _view.toolbar.rulaiType(2);
                    break;
                case Mod_TakeBible_Base.CLOSE:
                    _view.toolbar.rulaiType(3);
                    break;
            };
        }
        public function get getStartTime():int{
            var _local4:Object;
            var _local1:int = _ctrl.player.serverTime;
            var _local2:int = this._rulaiStartTimeList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._rulaiStartTimeList[_local3];
                if (_local4.startTime > _local1){
                    return (_local4.startTime);
                };
                _local3++;
            };
            return (0);
        }
        public function get getEndTime():int{
            var _local4:Object;
            var _local1:int = _ctrl.player.serverTime;
            var _local2:int = this._rulaiStartTimeList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._rulaiStartTimeList[_local3];
                if (_local4.startTime > _local1){
                    return (_local4.endTime);
                };
                _local3++;
            };
            return (0);
        }
        public function isSummer():Boolean{
            var _local5:Object;
            var _local1:Boolean;
            var _local2:int = _ctrl.player.serverTime;
            var _local3:int = this._rulaiStartTimeList.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = this._rulaiStartTimeList[_local4];
                if ((((_local5.startTime < _local2)) && ((_local2 < _local5.endTime)))){
                    _local1 = true;
                };
                _local4++;
            };
            return (_local1);
        }
        private function renderMsg(_arg1:Object):void{
            switch (_arg1.msg){
                case Mod_TakeBible_Base.CANCEL_APPLY:
                    _view.showTip(TakeBibleRoadViewLang.CancelApply);
                    break;
                case Mod_TakeBible_Base.NOT_ENOUGH_INGOT:
                    _view.showTip(TakeBibleRoadViewLang.NotEnoughIngot);
                    break;
                case Mod_TakeBible_Base.REQUEST_VIP:
                    _view.showTip(TakeBibleRoadViewLang.RequestVip);
                    break;
                case Mod_TakeBible_Base.FULL_TAKE_BIBLE_TIMES:
                    _view.showTip(TakeBibleRoadViewLang.FullTakeBibleTimes);
                    break;
                case Mod_TakeBible_Base.TAKE_BIBLE_STATUS:
                    _view.showTip(TakeBibleRoadViewLang.TakeBibleStatus);
                    break;
                case Mod_TakeBible_Base.BE_ROB_ALL:
                    _view.showTip(TakeBibleRoadViewLang.BeRobAll);
                    break;
                case Mod_TakeBible_Base.REROB:
                    _view.showTip(TakeBibleRoadViewLang.Rerob);
                    break;
                case Mod_TakeBible_Base.FULL_ROB_TIMES:
                    _view.showTip(TakeBibleRoadViewLang.FullRobTimes);
                    break;
                case Mod_TakeBible_Base.INVALID_PLAYER_ID:
                    _view.showTip(TakeBibleRoadViewLang.InvalidPlayerId);
                    break;
                case Mod_TakeBible_Base.PROTECT_STATUS:
                    _view.showTip(TakeBibleRoadViewLang.ProtectStatus);
                    break;
                case Mod_TakeBible_Base.CANCEL_APPLY:
                    _view.showTip(TakeBibleRoadViewLang.CancelApply);
                    break;
                case Mod_TakeBible_Base.FULL_PROTECT_TIMES:
                    _view.showTip(TakeBibleRoadViewLang.FullProtectTimes);
                    break;
                case Mod_TakeBible_Base.HAVE_CD_TIME:
                    _view.showTip(TakeBibleRoadViewLang.RobHandler);
                    break;
                case Mod_TakeBible_Base.CLOSE:
                    _view.showTip(TakeBibleRoadViewLang.RuLaiClose);
                    break;
                case Mod_TakeBible_Base.CALLED:
                    _view.showTip(TakeBibleRoadViewLang.RuLaiCalled);
                    break;
                case Mod_TakeBible_Base.TIMEUSED:
                    _view.showTip(TakeBibleRoadViewLang.RuLaiTimeused);
                    break;
            };
        }
        private function renderShow():void{
            _view.closeEvent();
            _view.screen.stopPlayerRun();
            loadAssets("TakeBibleRoad", this.render, TakeBibleRoadViewLang.LoadAssets);
        }
        public function show():void{
            if (_view.multiMission.inStageWithTip){
                return;
            };
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            this.open_take_bible();
        }
        public function render():void{
            _popup.closeAll();
            this._takeBibleRoad = (_view.getAssetsObject("TakeBibleRoad", "TakeBibleRoad") as ITakeBibleRoad);
            _popup.addView(this, this._takeBibleRoad.content);
            this._takeBibleRoad.tip = _view.tip.iTip;
            _view.delayMessage.checkVisible(true);
            this.renderRoad();
        }
        private function renderRoad():void{
            this._takeBibleRoad.vipLevel = _ctrl.player.vipLevel;
            this._takeBibleRoad.isShowBaiMa = this._isShowBaiMa;
            this.openTakeBibleCallBack();
            this.notify();
            this.get_rob_take_bible_cd_time();
            this._takeBibleRoad.renderIngot = _ctrl.player.ingot;
            this._takeBibleRoad.renderCoins = _ctrl.player.coins;
            this._takeBibleRoad.onPlayerData = function (_arg1:int):void{
                get_player_take_bible(_arg1);
            };
            this._takeBibleRoad.onRob = function (_arg1:Object, _arg2:int, _arg3:int, _arg4:int, _arg5:int, _arg6:Boolean, _arg7:Boolean):void{
                _playerData = _arg1;
                _robId = _arg2;
                if (_arg7){
                    _view.showTip(TakeBibleRoadViewLang.RobMainPlayer);
                    return;
                };
                if (_arg6){
                    _view.showTip(TakeBibleRoadViewLang.RobProtectPlayer);
                    return;
                };
                if (_arg5 <= 0){
                    _view.showTip(TakeBibleRoadViewLang.CanProtectTimesNum);
                    return;
                };
                if (_arg1 != null){
                    if (_arg1.isRobbed == 1){
                        _view.showTip(TakeBibleRoadViewLang.IsRobbed);
                        return;
                    };
                    if (_arg1.beRobTimes >= _arg1.totalCanRobTimes){
                        _view.showTip((_arg1.nickname + TakeBibleRoadViewLang.BeRobTimes));
                        return;
                    };
                };
                get_rob_take_bible_cd_time();
                if (_arg3 > 0){
                    clearIngot(_arg4);
                    return;
                };
                robTakeBible();
            };
            this._takeBibleRoad.onSpeedUp = function (_arg1:String, _arg2:int):void{
                var callback:* = null;
                var info:* = _arg1;
                var num:* = _arg2;
                if (_view.vipEnabled == false){
                    return;
                };
                _speedUpNum = num;
                if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.TakeBibleSpeedUp)){
                    dialog.yesLabel = TakeBibleRoadViewLang.Sure;
                    dialog.cancelLabel = TakeBibleRoadViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            quickly(0);
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.TakeBibleSpeedUp, true);
                        };
                    };
                    dialog.show(info, (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    quickly(0);
                };
            };
            this._takeBibleRoad.onMaxSpeedUp = function (_arg1:String):void{
                var callback:* = null;
                var info:* = _arg1;
                if (_view.vipEnabled == false){
                    return;
                };
                _speedUpNum = 0;
                if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.TakeBibleMaxSpeedUp)){
                    dialog.yesLabel = TakeBibleRoadViewLang.Sure;
                    dialog.cancelLabel = TakeBibleRoadViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            quickly(1);
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.TakeBibleMaxSpeedUp, true);
                        };
                    };
                    dialog.show(info, (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    quickly(1);
                };
            };
            this._takeBibleRoad.onOpenReady = function ():void{
                _view.takeBibleReady.switchSelf();
            };
            this._takeBibleRoad.onClose = function (_arg1:Array):void{
                _systemList = _arg1;
                if (_view.takeBibleReady.inStage){
                    _view.takeBibleReady.close();
                };
                close();
            };
            this.reposition();
            this._takeBibleRoad.onMoveEnd = function ():void{
            };
            this._takeBibleRoad.onMouseOver = function ():void{
                MouseCursor.showMouseCursor(MouseCursor.Map2Cursor, (_view.getAssetsObject("Map", "MCWarMouse") as Sprite));
            };
            this._takeBibleRoad.onMouseOut = function ():void{
                MouseCursor.hideMouseCursor(MouseCursor.Map2Cursor);
            };
            this._takeBibleRoad.onTextLink = function (_arg1:TextEvent):void{
                _view.toolbar.onTextLink(_arg1);
            };
            this._takeBibleRoad.onClearCdTime = function (_arg1:int):void{
                clearIngot(_arg1);
            };
            this._takeBibleRoad.onRefreshCdTime = function ():void{
                _robId = 0;
                get_rob_take_bible_cd_time();
            };
            this._takeBibleRoad.onShowBaiMa = function (_arg1:Boolean):void{
                _isShowBaiMa = _arg1;
            };
            this.renderSystemList();
            this._takeBibleRoad.onRuLaiReady = function (_arg1:Boolean):void{
                var callback:* = null;
                var bool:* = _arg1;
                if (bool == false){
                    _view.showTip(TakeBibleRoadViewLang.NoCallTime);
                    return;
                };
                if (_ctrl.TakeBible.canCalruLaiTime == 0){
                    _view.showTip(TakeBibleRoadViewLang.CallNumEnd);
                    return;
                };
                if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.CallRuLai)){
                    dialog.yesLabel = TakeBibleRoadViewLang.Sure;
                    dialog.cancelLabel = TakeBibleRoadViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            call_rulai();
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.CallRuLai, true);
                        };
                    };
                    dialog.show(Lang.sprintf(TakeBibleRoadViewLang.RuLaiReady, HtmlText.yellow((_ctrl.TakeBible.callRuLaiPrice + TakeBibleRoadViewLang.Ingot)), HtmlText.yellow(("1000" + TakeBibleRoadViewLang.Fram)), HtmlText.yellow("100%")), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    call_rulai();
                };
            };
        }
        private function robTakeBible():void{
            var _local1:String;
            if (this._playerData == null){
                _view.alert.showYesNoMsg(TakeBibleRoadViewLang.NoData, TakeBibleRoadViewLang.Sure, TakeBibleRoadViewLang.Cancel, this.onRobHandler);
                this._isProtect = false;
            } else {
                _local1 = Lang.sprintf(TakeBibleRoadViewLang.IsRobTakeBible, HtmlText.red((("【" + this._playerData.showName) + "】")), this._playerData.protectName);
                _view.alert.showYesNoMsg(_local1, TakeBibleRoadViewLang.Sure, TakeBibleRoadViewLang.Cancel, this.onRobHandler);
                this._isProtect = this._playerData.isProtect;
            };
        }
        private function renderSystemList():void{
            var _local1:int = this._systemList.length;
            var _local2:int;
            while (_local2 < _local1) {
                this._takeBibleRoad.getSystemInfo = this._systemList[_local2];
                _local2++;
            };
        }
        private function clearIngot(_arg1:int):void{
            var callback:* = null;
            var cdIngot:* = _arg1;
            if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.TakeBibleClearCd)){
                this.dialog.yesLabel = TakeBibleRoadViewLang.Sure;
                this.dialog.cancelLabel = TakeBibleRoadViewLang.Cancel;
                this.dialog.hasCheckbox = true;
                callback = function (_arg1:uint):void{
                    if (_arg1 == AlertButtonType.Yes){
                        clear_rob_take_bible_cd_time();
                    } else {
                        _robId = 0;
                    };
                    if (dialog.checked){
                        _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.TakeBibleClearCd, true);
                    };
                };
                this.dialog.show(HtmlText.yellow(Lang.sprintf(TakeBibleRoadViewLang.TakeBibleClearCd, cdIngot)), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
            } else {
                this.clear_rob_take_bible_cd_time();
            };
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        public function set getRuLaiData(_arg1:Object):void{
            if (this.inStage == false){
                return;
            };
            this._takeBibleRoad.getRuLaiData = _arg1;
        }
        public function set takeBibleStatus(_arg1:int):void{
            this._takeBibleRoad.takeBibleStatus = _arg1;
        }
        public function set renderIngot(_arg1:Number):void{
            if (inStage){
                this._takeBibleRoad.renderIngot = _arg1;
            };
        }
        public function set renderCoins(_arg1:Number):void{
            if (inStage){
                this._takeBibleRoad.renderCoins = _arg1;
            };
        }
        public function set isUserProtection(_arg1:int):void{
            this._takeBibleRoad.isUserProtection = _arg1;
        }
        public function set rulaiType(_arg1:int):void{
            this._ruLaiType = _arg1;
        }
        public function set beRob(_arg1:Object):void{
            _arg1.info = (_arg1.robberShowName + TakeBibleRoadViewLang.RobberShowName);
            this.robShow(_arg1);
        }
        public function set protectRob(_arg1:Object):void{
            _arg1.info = Lang.sprintf(TakeBibleRoadViewLang.ProtectRob, _arg1.robberShowName, _arg1.protectShowName);
            this.robShow(_arg1);
        }
        private function robShow(_arg1:Object):void{
            _view.alert.showYesNoMsg(_arg1.info, TakeBibleRoadViewLang.Sure, TakeBibleRoadViewLang.Cancel, this.onBeRob);
            this._reportId = _arg1.reportId;
        }
        private function onBeRob(_arg1:uint):void{
            var flags:* = _arg1;
            switch (flags){
                case AlertButtonType.Yes:
                    _view.strategyWar.warType = WarType.TakeBibleWar;
                    _view.strategyWar.reportId = this._reportId;
                    _view.strategyWar.show();
                    _view.chat.changePoint = 0;
                    _view.strategyWar.onClose = function ():void{
                        if (_view.serverWarCup.inStage){
                            _view.chat.changePoint = 1;
                        };
                        _view.toolbar.robShow();
                    };
                    break;
                case AlertButtonType.No:
                    _view.toolbar.robShow();
                    break;
            };
        }
        public function onRobHandler(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    if (this._takeBibleRoad.isCdTime){
                        _view.showTip(TakeBibleRoadViewLang.RobHandler);
                    } else {
                        this.rob(this._robId);
                    };
                    break;
                case AlertButtonType.No:
                    this._isProtect = false;
                    break;
            };
        }
        public function reposition(_arg1:Boolean=true):void{
            if ((((inStage == false)) || (this._isClose))){
                return;
            };
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._takeBibleRoad.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageClip);
            };
        }
        public function clear():void{
            if (this._takeBibleRoad == null){
                return;
            };
            this._takeBibleRoad.clear();
        }
        public function close():void{
            _data.cancelPatch(Mod_TakeBible_Base.notify);
            this.close_take_bible();
            this.clear();
            _popup.closeView(this);
            _popup.closeAll();
            this._takeBibleRoad = null;
            _view.openEvent();
        }

    }
}//package com.views 
