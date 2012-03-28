//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class GameHelperView extends Base implements IView {

        private var _gameHelper:IGameHelper;
        private var _intSuperSportTime:int;
        private var _intTakeBibleTime:int;

        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._gameHelper.clear();
            this._intSuperSportTime = 0;
            this._intTakeBibleTime = 0;
            this._view.removeFromTimerProcessList(this.sign);
            this.dialog.hide();
            Helper.gc();
        }
        public function updateGameAssistant():void{
            if (this.inStage){
                this._gameHelper.level = this._ctrl.player.level;
                this.get_game_assistant_info();
            };
        }
        private function showUI():void{
            _popup.addView(this, this._gameHelper.content);
            _view.center(sign, this._gameHelper.content);
        }
        private function render():void{
            if (this._gameHelper == null){
                this._gameHelper = (_view.getAssetsObject("GameHelper", "GameHelper") as IGameHelper);
            };
            this.init();
            this.getGameAssistantInfoCallBack();
            this.showUI();
        }
        private function init():void{
            this._gameHelper.tip = this._view.tip.iTip;
            this._gameHelper.drag = this._view.drag.iDrag;
            this._gameHelper.onCloseBtn = this.close;
            this._gameHelper.onBuyPowerBtn = this.buyPower;
            this._gameHelper.onCampSalaryBtn = this.get_player_camp_salary;
            this._gameHelper.onDailyQuestBtn = this.showDailyQuest;
            this._gameHelper.onFateFreeBtn = this.gotoFateLodge;
            this._gameHelper.onFateIngotBtn = this.gotoFateLodge;
            this._gameHelper.onGetPeachBtn = this.showGetPeach;
            this._gameHelper.onRuneBtn = this.showRune;
            this._gameHelper.onSportBtn = this.showSport;
            this._gameHelper.onFactionBlessingBtn = this.gotoFactionBlessing;
            this._gameHelper.onStroyPlayBtn = this.storyPlay;
            this._gameHelper.onTakeBibleBtn = this.showTakeBibleRoad;
            this._gameHelper.onSendFlowerBtn = this.showFriendList;
            this._gameHelper.onFreeSealTrainingBtn = this.showSealSoul;
            this._gameHelper.onCoinTreeBtn = this.showFarm;
            this._gameHelper.onRollCakeBtn = this.showRollCake;
            this._gameHelper.onWorshipMarsBtn = this.showWorshipMars;
            this._gameHelper.onPetAnimalBtn = this.showPetAnimal;
            this._gameHelper.onBackBtn = this.backTimes;
            this._gameHelper.onAchievementBtn = this.showAchievement;
            this._gameHelper.onMissionBtn = this.showChooseMission;
            this._gameHelper.onSealStoneBtn = this.showSealStone;
            this._gameHelper.power = this._ctrl.player.power;
            this._gameHelper.level = this._ctrl.player.level;
            this._gameHelper.render();
        }
        private function buyPower():void{
            if (!_view.vipEnabled){
                return;
            };
            var _local1:Object = this._ctrl.player.getGameAssistantInfo;
            if (!_view.ingotEnough(_local1["buy_power_ingot"])){
                return;
            };
            this._view.toolbar.buy_power();
        }
        private function get_player_camp_salary():void{
            this._view.activities.get_player_camp_salary();
        }
        private function showRune():void{
            if (!_view.vipEnabled){
                return;
            };
            this._view.rune.show();
        }
        private function showDailyQuest():void{
            this._view.dailyQuest.show();
        }
        private function gotoFactionBlessing():void{
            if (this._view.missionPractice.inStageWithTip){
                return;
            };
            if (this._view.heroPractice.inStageWithTip){
                return;
            };
            this._view.factionBlessing.gotoFactionBlessing();
        }
        private function showSport():void{
            if (this._view.missionPractice.inStageWithTip){
                return;
            };
            if (this._view.heroPractice.inStageWithTip){
                return;
            };
            if (this._view.tower.inStageWithTip){
                return;
            };
            if (FunctionType.isOpened(FunctionType.SuperSport)){
                this._view.superSport.show();
            };
        }
        private function gotoFateLodge():void{
            if (this._view.missionPractice.inStageWithTip){
                return;
            };
            if (this._view.heroPractice.inStageWithTip){
                return;
            };
            this._view.lodge.show();
        }
        private function showTakeBibleRoad():void{
            if (this._view.missionPractice.inStageWithTip){
                return;
            };
            if (this._view.heroPractice.inStageWithTip){
                return;
            };
            if (this._view.tower.inStageWithTip){
                return;
            };
            if (FunctionType.isOpened(FunctionType.TakeBible)){
                this._view.takeBibleRoad.show();
            };
        }
        private function showFriendList():void{
            if (FunctionType.isOpened(FunctionType.SendFlower)){
                this._view.friendList.show();
            };
        }
        private function showSealSoul():void{
            if (FunctionType.isOpened(FunctionType.SealSoul)){
                this._view.sealSoul.show();
            };
        }
        private function showFarm():void{
            if (FunctionType.isOpened(FunctionType.CoinTree)){
                this._view.farm.show();
            };
        }
        private function showAchievement():void{
            this._view.achievement.show();
        }
        private function showRollCake():void{
            if (FunctionType.isOpened(FunctionType.RollCake)){
                this._view.rollCake.show();
            };
        }
        private function showWorshipMars():void{
            if (FunctionType.isOpened(FunctionType.WorshipMars)){
                this._view.worshipMars.show();
            };
        }
        private function showPetAnimal():void{
            if (FunctionType.isOpened(FunctionType.PetAnimal)){
                this._view.pet.show();
            };
        }
        private function showChooseMission():void{
            if (FunctionType.isOpened(FunctionType.MissionPractice)){
                this._view.chooseMission.showTownMission = TownType.getMaxTownId();
            };
        }
        private function showGetPeach():void{
            if (FunctionType.isOpened(FunctionType.GetPeach)){
                this._view.getPeach.show();
            };
        }
        private function showSealStone():void{
            if (FunctionType.isOpened(FunctionType.SealSoul)){
                this._view.sealStone.getDayStone();
            };
        }
        private function storyPlay():void{
            _view.dramaPlayBack.show();
        }
        private function timer():void{
            if (this._intSuperSportTime > 0){
                this._intSuperSportTime--;
                this._gameHelper.updateSuperSportTime(this._intSuperSportTime);
            };
            if (this._intTakeBibleTime > 0){
                this._intTakeBibleTime--;
                this._gameHelper.updateTakeBibleTime(this._intTakeBibleTime);
            };
            if ((((this._intSuperSportTime < 0)) && ((this._intTakeBibleTime < 0)))){
                this._view.removeFromTimerProcessList(this.sign);
            };
        }
        private function backTimes(_arg1:int):void{
            var intCookie:* = 0;
            var intType:* = _arg1;
            var strMessage:* = "";
            var ingot:* = 10;
            switch (intType){
                case 1:
                    strMessage = Lang.sprintf(GameHelperViewLang.DailyQuestBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackDailyQuest;
                    break;
                case 2:
                    strMessage = Lang.sprintf(GameHelperViewLang.FactionBlessingBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackFactionBlessing;
                    break;
                case 3:
                    ingot = 2;
                    strMessage = Lang.sprintf(GameHelperViewLang.CampSalaryBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackCampSalary;
                    break;
                case 4:
                    strMessage = Lang.sprintf(GameHelperViewLang.FreeSealTrainingBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackFreeSealTraining;
                    break;
                case 5:
                    strMessage = Lang.sprintf(GameHelperViewLang.TakeBibleBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackTakeBible;
                    break;
                case 6:
                    strMessage = Lang.sprintf(GameHelperViewLang.FateFreeBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackFateFree;
                    break;
                case 7:
                    strMessage = Lang.sprintf(GameHelperViewLang.SendFlowerBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackSendFlower;
                    break;
                case 8:
                    strMessage = Lang.sprintf(GameHelperViewLang.CoinTreeBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackCoinTree;
                    break;
                case 9:
                    strMessage = Lang.sprintf(GameHelperViewLang.RollCakeBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackRollCake;
                    break;
                case 10:
                    strMessage = Lang.sprintf(GameHelperViewLang.WorshipMarsBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackWorshipMars;
                    break;
                case 11:
                    strMessage = Lang.sprintf(GameHelperViewLang.FateIngotBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackFateIngot;
                    break;
                case 12:
                    strMessage = Lang.sprintf(GameHelperViewLang.GetPeachBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackGetPeach;
                    break;
                case 13:
                    strMessage = Lang.sprintf(GameHelperViewLang.SealStoneBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackSealStone;
                    break;
                case 14:
                    strMessage = Lang.sprintf(GameHelperViewLang.PetAnimalBackTimes, HtmlText.yellow((ingot + GameHelperViewLang.Ingto)));
                    intCookie = ConsumeAlertSetType.BackPetAnimal;
                    break;
            };
            if (ingot > _ctrl.player.ingot){
                _view.showTip(GameHelperViewLang.NoIngot);
                return;
            };
            if (!_view.consumeAlertSetting.isAlert(intCookie)){
                var callBack:* = function (_arg1:uint):void{
                    if (_arg1 == AlertButtonType.Yes){
                        back_times(intType);
                    };
                    if (dialog.checked){
                        _view.consumeAlertSetting.saveSetting(intCookie, true);
                    };
                };
                this.dialog.yesLabel = GameHelperViewLang.DialogYes;
                this.dialog.noLabel = GameHelperViewLang.DialogNo;
                this.dialog.hasCheckbox = true;
                this.dialog.show(strMessage, (AlertButtonType.Yes | AlertButtonType.No), callBack);
            } else {
                this.back_times(intType);
            };
        }
        private function loadData():void{
            _data.call(Mod_Player_Base.get_game_assistant_info, this.loadDataCallBack, []);
        }
        private function loadDataCallBack():void{
            loadAssets("GameHelper", this.render, GameHelperViewLang.LoadInfo);
        }
        private function get_game_assistant_info():void{
            this._gameHelper.power = this._ctrl.player.power;
            _data.call(Mod_Player_Base.get_game_assistant_info, this.getGameAssistantInfoCallBack, []);
        }
        private function getGameAssistantInfoCallBack():void{
            var _local1:Object = this._ctrl.player.getGameAssistantInfo;
            this._gameHelper.renderGameHelper(_local1);
            this._intSuperSportTime = _local1["super_sports_cd_time"];
            this._intTakeBibleTime = _local1["takebible_arrival_remain"];
            if ((((this._intSuperSportTime > 0)) || ((this._intTakeBibleTime > 0)))){
                this._view.addToTimerProcessList(this.sign, this.timer);
            };
        }
        private function back_times(_arg1:int):void{
            _data.call(Mod_Player_Base.back_times, this.backTimesCallBack, [_arg1]);
        }
        private function backTimesCallBack():void{
            var _local1:Object = this._ctrl.player.backTimesResult;
            if (_local1["result"] == Mod_Player_Base.SUCCEED){
                this.updateGameAssistant();
                if (_local1["back_times_type"] == 1){
                    this._view.activities.addActivity(FunctionType.DailyQuest);
                };
                if (_local1["back_times_type"] == 9){
                    this._view.activities.addActivity(FunctionType.RollCake);
                };
                if (_local1["back_times_type"] == 10){
                    this._view.activities.addActivity(FunctionType.WorshipMars);
                };
                if (_local1["back_times_type"] == 12){
                    this._view.activities.addActivity(FunctionType.GetPeach);
                };
                if (_local1["back_times_type"] == 13){
                    this._view.activities.addActivity(FunctionType.SealSoul);
                };
            } else {
                this._view.showTip(this.message(_local1["result"]));
            };
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Player_Base.SUCCEED:
                    _local2 = GameHelperViewLang.Succeed;
                    break;
                case Mod_Player_Base.NO_INGOT:
                    _local2 = GameHelperViewLang.NoIngot;
                    break;
                case Mod_Player_Base.CAN_NOT_BACK_TIMES:
                    _local2 = GameHelperViewLang.CanNotBackTimes;
                    break;
                default:
                    _local2 = (GameHelperViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 
