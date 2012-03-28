//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class HeroMissionView extends Base implements IView {

        private var _heroMission:IHeroMission;
        private var _alert:IAlert;
        private var _campName:String = "";
        private var _showTownId:int = 0;
        private var _missionId:int = 0;
        private var _isUser:Boolean = false;
        private var _autoMissionId:int = 0;
        private var _autoMissionLock:int = 0;
        private var _autoMissionInfo:String = "";
        public var mainMissionInfo:String = "MainMissionInfo";
        private var _autoType:int = 0;

        public function HeroMissionView():void{
            _inStageTipTitle = HeroMissionViewLang.inStageTipTitle;
        }
        public function show():void{
            var _local1:int;
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.multiMission.inStageWithTip){
                return;
            };
            if (_view.missionPractice.inStageWithTip){
                return;
            };
            if (_view.heroPractice.inStageWithTip){
                return;
            };
            if (_view.getPeach.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            if (FunctionType.isOpened(FunctionType.HeroMission) == false){
                _view.showTip(HeroMissionViewLang.MissionOpen);
                return;
            };
            if (this._showTownId == 0){
                _local1 = TownType.getMaxTownId();
                this._showTownId = _local1;
            };
            this.get_hero_mission_list(this._showTownId);
        }
        public function set alert(_arg1:IAlert):void{
            this._alert = _arg1;
        }
        public function checkCampAndLoad():void{
            var _local1:String;
            var _local2:String;
            this._campName = FactionType.campName(_ctrl.player.campId);
            if (_ctrl.player.inSelfTown){
                if (this._showTownId == 0){
                    this._showTownId = _ctrl.player.mapId;
                };
                this.get_hero_mission_list(this._showTownId);
            } else {
                _local1 = TownType.getName(_ctrl.player.mapId);
                _local2 = Lang.sprintf(HeroMissionViewLang.CampLimit, this._campName, _local1);
                _view.alert.confirm(_local2);
            };
        }
        private function get_hero_mission_list(_arg1:int):void{
            _data.call(Mod_HeroMission_Base.get_hero_mission_list, this.heroMissionListCallBack, [_arg1]);
        }
        private function buy_hero_challenge():void{
            this._isUser = true;
            _data.call(Mod_HeroMission_Base.buy_hero_challenge, this.buyHeroChallengeCallBack, [this._showTownId]);
        }
        private function heroMissionListCallBack():void{
            var _local1:Array;
            var _local2:Object;
            if (this.inStage){
                _local1 = _ctrl.heroMission.renderTownHeroMission(this._showTownId);
                _local2 = _ctrl.heroMission.openHeroMission;
                this._heroMission.getRefreshData = _local2;
                this._heroMission.townHeroMission = _local1;
                this._heroMission.openHeroMission = _local2.heroList;
            } else {
                loadAssets("HeroMission", this.render, HeroMissionViewLang.LoadAssets);
            };
        }
        private function buyHeroChallengeCallBack():void{
            this._isUser = false;
            var _local1:Object = _ctrl.heroMission.buyHeroChallenge;
            switch (_local1.msg){
                case Mod_HeroMission_Base.SUCCESS:
                    _view.showTip(HeroMissionViewLang.RefreshSuccess, null, TipType.Success);
                    this.get_hero_mission_list(this._showTownId);
                    break;
                case Mod_HeroMission_Base.NOT_ENOUGH_INGOT:
                    _view.showTip(HeroMissionViewLang.NotEnoughIngot);
                    break;
                case Mod_HeroMission_Base.FULL_BUY_TIMES:
                    _view.showTip(HeroMissionViewLang.FullBuyTimes);
                    break;
            };
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        private function render():void{
            this._heroMission = (_view.getAssetsObject("HeroMission", "HeroMission") as IHeroMission);
            _popup.addView(this, this._heroMission.content);
            _view.center(sign, this._heroMission.content);
            this._heroMission.tip = _view.tip.iTip;
            this._heroMission.drag = _view.drag.iDrag;
            this.alert = _view.alert.iAlert;
            var isHeroPractice:* = FunctionType.isOpened(FunctionType.HeroMissionPractice);
            this._heroMission.isShowPractice = isHeroPractice;
            this.heroMissionListCallBack();
            if (this._autoMissionLock != 0){
                this._heroMission.autoMissionId(this._autoMissionLock, this._autoMissionInfo, this._autoType);
            };
            this._heroMission.onClose = function ():void{
                close();
            };
            this._heroMission.onRefresh = function (_arg1:int):void{
                var callback:* = null;
                var buyPrice:* = _arg1;
                if (_isUser){
                    _isUser = false;
                    return;
                };
                var str:* = "";
                if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.BuyHeroChallenge)){
                    dialog.yesLabel = HeroMissionViewLang.Sure;
                    dialog.cancelLabel = HeroMissionViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            buy_hero_challenge();
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.BuyHeroChallenge, true);
                        };
                    };
                    dialog.show(Lang.sprintf(HeroMissionViewLang.BuyHeroChallenge, HtmlText.yellow((buyPrice + HeroMissionViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    buy_hero_challenge();
                };
            };
            this._heroMission.onChangeTown = function (_arg1:int):void{
                _showTownId = _arg1;
                get_hero_mission_list(_arg1);
                townInfo(_arg1);
            };
            this._heroMission.onStartMission = function (_arg1:Object):void{
                _view.missionMap.gotoMissionAtId(_arg1.id);
                close();
            };
            this._heroMission.onPractice = function (_arg1:Array):void{
                if (FunctionType.isOpened(FunctionType.HeroMissionPractice)){
                    _view.heroPractice.showTownId = _showTownId;
                    _view.heroPractice.getHeroPracticeList = _arg1;
                } else {
                    _view.showTip(HeroMissionViewLang.FunctionNoOpen);
                };
            };
            this._heroMission.onRefreshHeroMission = function (_arg1:Object):void{
                _missionId = _arg1.id;
                if (_arg1.buyStatus == 1){
                } else {
                    _view.showTip(HeroMissionViewLang.CantRefresh);
                };
            };
            var townIdList:* = TownType.getOpenedTownIds();
            this._heroMission.getTownIdList = townIdList;
            this.townInfo(this._showTownId);
        }
        public function changeTownKey():void{
            this._showTownId = 0;
        }
        private function townInfo(_arg1:int):void{
            var _local2:Object = {};
            _local2.townName = TownType.getName(_arg1);
            _local2.townId = _arg1;
            _local2.nextId = TownType.getNextTownIdByTownId(_arg1);
            _local2.nextTownName = TownType.getName(_local2.nextId);
            _local2.prevId = TownType.getPrevTownIdByTownId(_arg1);
            _local2.prevTownName = TownType.getName(_local2.prevId);
            this._heroMission.getTownInfo = _local2;
        }
        public function onBuyPriceHandler(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.buy_hero_challenge();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function autoMissionId(_arg1:int, _arg2:int, _arg3:String="MainMissionInfo"):void{
            this._showTownId = _arg1;
            this._autoMissionId = _arg2;
            this._autoMissionInfo = _arg3;
            if (_arg3 == this.mainMissionInfo){
                this._autoMissionInfo = HeroMissionViewLang.MainMission;
                this._autoType = 0;
            } else {
                this._autoType = 1;
            };
            this._autoMissionLock = MissionType.getMissionLock(this._autoMissionId);
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._isUser = false;
            this._heroMission.clear();
            this._autoMissionId = 0;
            this._autoMissionLock = 0;
            this._heroMission = null;
        }

    }
}//package com.views 
