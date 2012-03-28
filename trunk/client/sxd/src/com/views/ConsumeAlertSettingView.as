//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class ConsumeAlertSettingView extends Base implements IView {

        private var _consumeAlertSetting:IConsumeAlertSetting;
        private var _aryData:Array;

        public function ConsumeAlertSettingView(){
            this._aryData = [];
            super();
        }
        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._consumeAlertSetting.clear();
        }
        public function isAlert(_arg1:int):Boolean{
            var _local2:Object;
            for each (_local2 in this._aryData) {
                if (_local2["id"] == _arg1){
                    return ((_local2["state"] == 1));
                };
            };
            return (false);
        }
        public function saveSetting(_arg1:int, _arg2:Boolean):void{
            var _local3:Object;
            for each (_local3 in this._aryData) {
                if (_local3["id"] == _arg1){
                    _local3["state"] = (_arg2) ? 1 : 0;
                    break;
                };
            };
            this.player_consume_alert_set(_arg1, (_arg2) ? 1 : 0);
        }
        public function loadSettingInfo():void{
            var loadSettingInfoCallBack:* = null;
            loadSettingInfoCallBack = function ():void{
                _aryData = _ctrl.consumeAlertSetting.playerConsumeAlertSetInfo;
            };
            this.player_consume_alert_set_info(loadSettingInfoCallBack);
        }
        private function loadData():void{
            this.player_consume_alert_set_info(this.loadDataCallBack);
        }
        private function loadDataCallBack():void{
            loadAssets("ConsumeAlertSetting", this.render, ConsumeAlertSettingViewLang.LoadInfo);
        }
        private function showUI():void{
            _popup.addView(this, this._consumeAlertSetting.content);
            _view.center(sign, this._consumeAlertSetting.content);
        }
        private function render():void{
            if (this._consumeAlertSetting == null){
                this._consumeAlertSetting = (_view.getAssetsObject("ConsumeAlertSetting", "ConsumeAlertSetting") as IConsumeAlertSetting);
            };
            this.init();
            this.playerConsumeAlertSetInfoCallBack();
            this.showUI();
        }
        private function init():void{
            this._consumeAlertSetting.tip = this._view.tip.iTip;
            this._consumeAlertSetting.drag = this._view.drag.iDrag;
            this._consumeAlertSetting.onClose = this.close;
            this._consumeAlertSetting.onSubmit = this.saveData;
            this._consumeAlertSetting.init();
        }
        private function saveData(_arg1:Array):void{
            var _local2:Object;
            var _local3:Object;
            for each (_local2 in _arg1) {
                for each (_local3 in this._aryData) {
                    if ((((_local2["id"] == _local3["id"])) && (!((_local2["state"] == _local3["state"]))))){
                        _local3["state"] = _local2["state"];
                        this.player_consume_alert_set(_local3["id"], _local3["state"]);
                        break;
                    };
                };
            };
            _view.showTip(ConsumeAlertSettingViewLang.SaveSuccess, null, TipType.Success);
            this._consumeAlertSetting.renderSubmit();
            this.close();
        }
        private function getIsOpen(_arg1:int):Boolean{
            var _local2:Boolean;
            switch (_arg1){
                case ConsumeAlertSetType.UpgradeClearCdTime:
                    _local2 = FunctionType.isOpened(FunctionType.Upgrade);
                    break;
                case ConsumeAlertSetType.ResearchClearCdTime:
                    _local2 = FunctionType.isOpened(FunctionType.Research);
                    break;
                case ConsumeAlertSetType.BatchRune:
                    _local2 = FunctionType.isOpened(FunctionType.Rune);
                    break;
                case ConsumeAlertSetType.FarmRefreshHerbsSeed:
                    _local2 = FunctionType.isOpened(FunctionType.Farm);
                    break;
                case ConsumeAlertSetType.FarmGetTopHerbsSeed:
                    _local2 = FunctionType.isOpened(FunctionType.Farm);
                    break;
                case ConsumeAlertSetType.FarmClearFarmlandCD:
                    _local2 = FunctionType.isOpened(FunctionType.Farm);
                    break;
                case ConsumeAlertSetType.BuyCoinTreeCount:
                    _local2 = FunctionType.isOpened(FunctionType.CoinTree);
                    break;
                case ConsumeAlertSetType.FarmFieldLevelUp:
                    _local2 = FunctionType.isOpened(FunctionType.Farm);
                    break;
                case ConsumeAlertSetType.FarmBatPlant:
                    _local2 = FunctionType.isOpened(FunctionType.Farm);
                    break;
                case ConsumeAlertSetType.AddChallenge:
                    _local2 = FunctionType.isOpened(FunctionType.SuperSport);
                    break;
                case ConsumeAlertSetType.SportClearCd:
                    _local2 = FunctionType.isOpened(FunctionType.SuperSport);
                    break;
                case ConsumeAlertSetType.RefreshDailyQuest:
                    _local2 = FunctionType.isOpened(FunctionType.DailyQuest);
                    break;
                case ConsumeAlertSetType.RefineZhiZhuo1001:
                    _local2 = (this._ctrl.player.townKey >= TownType.getLock(TownType.getId(TownType.JingCheng)));
                    break;
                case ConsumeAlertSetType.ImmortalityCookie:
                    _local2 = (this._ctrl.player.townKey >= TownType.getLock(TownType.getId(TownType.JingCheng)));
                    break;
                case ConsumeAlertSetType.RefineZhiZhuo1002:
                    _local2 = (this._ctrl.player.townKey >= TownType.getLock(TownType.getId(TownType.JingCheng)));
                    break;
                case ConsumeAlertSetType.CampWarIngotBuyBuff:
                    _local2 = FunctionType.isOpened(FunctionType.CampWar);
                    break;
                case ConsumeAlertSetType.MissionPracticeQuickly:
                    _local2 = FunctionType.isOpened(FunctionType.MissionPractice);
                    break;
                case ConsumeAlertSetType.BossCookie1:
                    _local2 = FunctionType.isOpened(FunctionType.WorldBoss);
                    break;
                case ConsumeAlertSetType.BossCookie4:
                    _local2 = FunctionType.isOpened(FunctionType.WorldBoss);
                    break;
                case ConsumeAlertSetType.BossCookie3:
                    _local2 = FunctionType.isOpened(FunctionType.WorldBoss);
                    break;
                case ConsumeAlertSetType.BuyFateNpc:
                    _local2 = FunctionType.isOpened(FunctionType.Fate);
                    break;
                case ConsumeAlertSetType.HeroPracticeQuickly:
                    _local2 = FunctionType.isOpened(FunctionType.HeroMissionPractice);
                    break;
                case ConsumeAlertSetType.BuyHeroChallenge:
                    _local2 = FunctionType.isOpened(FunctionType.HeroMission);
                    break;
                case ConsumeAlertSetType.TravelEventCD:
                    _local2 = FunctionType.isOpened(FunctionType.TravelEvent);
                    break;
                case ConsumeAlertSetType.FactionSealCallNpc:
                    _local2 = FunctionType.isOpened(FunctionType.Faction);
                    break;
                case ConsumeAlertSetType.TakeBibleSpeedUp:
                    _local2 = FunctionType.isOpened(FunctionType.TakeBible);
                    break;
                case ConsumeAlertSetType.TakeBibleRefreshAngel:
                    _local2 = FunctionType.isOpened(FunctionType.TakeBible);
                    break;
                case ConsumeAlertSetType.TakeBibleInspire:
                    _local2 = FunctionType.isOpened(FunctionType.TakeBible);
                    break;
                case ConsumeAlertSetType.TakeBibleMaxSpeedUp:
                    _local2 = FunctionType.isOpened(FunctionType.TakeBible);
                    break;
                case ConsumeAlertSetType.SummerTS:
                    _local2 = FunctionType.isOpened(FunctionType.TakeBible);
                    break;
                case ConsumeAlertSetType.TakeBibleClearCd:
                    _local2 = FunctionType.isOpened(FunctionType.TakeBible);
                    break;
                case ConsumeAlertSetType.CallRuLai:
                    _local2 = FunctionType.isOpened(FunctionType.TakeBible);
                    break;
                case ConsumeAlertSetType.SoulSuccinct:
                    _local2 = FunctionType.isOpened(FunctionType.SealSoul);
                    break;
                case ConsumeAlertSetType.SoulActivation:
                    _local2 = FunctionType.isOpened(FunctionType.SealSoul);
                    break;
                case ConsumeAlertSetType.SoulTraining2:
                    _local2 = FunctionType.isOpened(FunctionType.SealSoul);
                    break;
                case ConsumeAlertSetType.TowerViewReset:
                    _local2 = FunctionType.isOpened(FunctionType.Tower);
                    break;
                case ConsumeAlertSetType.TowerViewAuto:
                    _local2 = FunctionType.isOpened(FunctionType.Tower);
                    break;
                case ConsumeAlertSetType.BackFreeSealTraining:
                    _local2 = FunctionType.isOpened(FunctionType.SealSoul);
                    break;
                case ConsumeAlertSetType.BackCampSalary:
                    _local2 = FunctionType.isOpened(FunctionType.CampSalary);
                    break;
                case ConsumeAlertSetType.BackDailyQuest:
                    _local2 = FunctionType.isOpened(FunctionType.DailyQuest);
                    break;
                case ConsumeAlertSetType.BackFactionBlessing:
                    _local2 = ((FunctionType.isOpened(FunctionType.Faction)) && ((ActivityType.FactionLevel > 0)));
                    break;
                case ConsumeAlertSetType.BackTakeBible:
                    _local2 = FunctionType.isOpened(FunctionType.TakeBible);
                    break;
                case ConsumeAlertSetType.BackFateFree:
                    _local2 = FunctionType.isOpened(FunctionType.Fate);
                    break;
                case ConsumeAlertSetType.BackFateIngot:
                    _local2 = FunctionType.isOpened(FunctionType.Fate);
                    break;
                case ConsumeAlertSetType.BackSendFlower:
                    _local2 = FunctionType.isOpened(FunctionType.SendFlower);
                    break;
                case ConsumeAlertSetType.BackCoinTree:
                    _local2 = FunctionType.isOpened(FunctionType.CoinTree);
                    break;
                case ConsumeAlertSetType.BackRollCake:
                    _local2 = FunctionType.isOpened(FunctionType.RollCake);
                    break;
                case ConsumeAlertSetType.BackWorshipMars:
                    _local2 = FunctionType.isOpened(FunctionType.WorshipMars);
                    break;
                case ConsumeAlertSetType.RobelRedirection:
                    _local2 = FunctionType.isOpened(FunctionType.TakeBible);
                    break;
                case ConsumeAlertSetType.practiceSpeed1:
                    _local2 = (this._ctrl.player.level >= 40);
                    break;
                case ConsumeAlertSetType.practiceSpeed24:
                    _local2 = (this._ctrl.player.level >= 40);
                    break;
                case ConsumeAlertSetType.BackGetPeach:
                    _local2 = FunctionType.isOpened(FunctionType.GetPeach);
                    break;
                case ConsumeAlertSetType.RefreshLuckyShop:
                    _local2 = FunctionType.isOpened(FunctionType.LuckyShop);
                    break;
                case ConsumeAlertSetType.BackSealStone:
                    _local2 = FunctionType.isOpened(FunctionType.SealSoul);
                    break;
                case ConsumeAlertSetType.GetSealStoneTwo:
                    _local2 = FunctionType.isOpened(FunctionType.SealSoul);
                    break;
                case ConsumeAlertSetType.GetSealStoneThree:
                    _local2 = FunctionType.isOpened(FunctionType.SealSoul);
                    break;
                case ConsumeAlertSetType.BackPetAnimal:
                    _local2 = FunctionType.isOpened(FunctionType.PetAnimal);
                    break;
            };
            return (_local2);
        }
        private function player_consume_alert_set_info(_arg1:Function):void{
            _data.call(Mod_Player_Base.player_consume_alert_set_info, _arg1, []);
        }
        private function playerConsumeAlertSetInfoCallBack():void{
            var _local2:Object;
            var _local3:int;
            var _local4:Object;
            var _local5:Object;
            this._aryData = this._ctrl.consumeAlertSetting.playerConsumeAlertSetInfo;
            var _local1:Array = [];
            for each (_local2 in this._aryData) {
                _local4 = {};
                _local4["id"] = _local2["id"];
                _local4["state"] = _local2["state"];
                _local4["text"] = _local2["text"];
                _local4["vip"] = _local2["vip"];
                _local1.push(_local4);
            };
            _local1.sortOn("id", Array.NUMERIC);
            _local3 = (_local1.length - 1);
            while (_local3 >= 0) {
                _local5 = (_local1[_local3] as Object);
                _local5["isOpened"] = this.getIsOpen(_local5["id"]);
                if (((!(VIPType.check(_local5["vip"]))) || ((_local5["isOpened"] == false)))){
                    _local1.splice(_local3, 1);
                };
                _local3--;
            };
            this._consumeAlertSetting.render(_local1);
        }
        private function player_consume_alert_set(_arg1:int, _arg2:int):void{
            _data.call(Mod_Player_Base.player_consume_alert_set, this.playerConsumeAlertSetCallBack, [_arg1, _arg2]);
        }
        private function playerConsumeAlertSetCallBack():void{
        }

    }
}//package com.views 
