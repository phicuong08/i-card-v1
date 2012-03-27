//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class DailyQuestView extends Base implements IView {

        private var _dailyQuest:IDailyQuest;
        private var _dialog:IAlert = null;
        private var _inRefreshQuest:Boolean = false;
        private var _intFullStarIngot:int;

        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._dialog.hide();
            this._dailyQuest.clear();
        }
        private function loadData():void{
            _data.call(Mod_Quest_Base.day_quest_list, this.loadDataCallBack, [], false);
        }
        private function loadDataCallBack():void{
            var callBack:* = function ():void{
                render();
                dayQuestListCallBack();
                showUI();
            };
            loadAssets("DailyQuest", callBack, DailyQuestViewLang.LoadInfo);
        }
        private function showUI():void{
            _popup.addView(this, this._dailyQuest.content);
            _view.center(sign, this._dailyQuest.content);
        }
        private function render():void{
            if (this._dailyQuest == null){
                this._dailyQuest = (_view.getAssetsObject("DailyQuest", "DailyQuest") as IDailyQuest);
            };
            this._dailyQuest.onCloseBtn = this.close;
            this.init();
            this._dailyQuest.render();
        }
        private function init():void{
            this._dialog = this._view.alert.iAlert;
            this._dailyQuest.tip = this._view.tip.iTip;
            this._dailyQuest.drag = this._view.drag.iDrag;
            this._dailyQuest.onCloseBtn = this.close;
            this._dailyQuest.onAbortBtn = this.day_giveup_quest;
            this._dailyQuest.onAcceptBtn = this.day_accept_quest;
            this._dailyQuest.onCompleteBtn = this.day_get_award;
            this._dailyQuest.onImmeCompleteBtn = this.day_now_complete;
            this._dailyQuest.onRefreshBtn = this.dayQuestRefresh;
            this._dailyQuest.onFullStarBtn = this.day_quest_refresh_star;
            this._dailyQuest.serverTime = this._ctrl.player.serverTime;
        }
        private function renderDialuQuestInfo(_arg1:Object):void{
            this._dailyQuest.serverTime = this._ctrl.player.serverTime;
            if (_arg1["result"] == Mod_Quest_Base.SUCCEED){
                this._dailyQuest.renderDailyQuestInfo(_arg1);
            } else {
                _view.showTip(this.message(_arg1["result"]));
            };
        }
        private function dayQuestRefresh():void{
            if (!_view.ingotEnough(10)){
                return;
            };
            if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.RefreshDailyQuest)){
                var callBack:* = function (_arg1:uint):void{
                    if (_arg1 == AlertButtonType.Yes){
                        day_quest_refresh();
                    };
                    if (_dialog.checked){
                        _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.RefreshDailyQuest, true);
                    };
                };
                this._dialog.yesLabel = DailyQuestViewLang.DialogYes;
                this._dialog.cancelLabel = DailyQuestViewLang.DialogCancel;
                this._dialog.hasCheckbox = true;
                this._dialog.show(Lang.sprintf(DailyQuestViewLang.RefreshQuest, HtmlText.yellow(("10" + DailyQuestViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callBack);
            } else {
                this.day_quest_refresh();
            };
        }
        private function funllStarIngot():int{
            var _local1:Number = new Date((this._ctrl.player.serverTime * 1000)).day;
            if (_local1 == 0){
                _local1 = 7;
            };
            return (((350 / 7) * ((7 - _local1) + 1)));
        }
        private function day_quest_list():void{
            this._data.call(Mod_Quest_Base.day_quest_list, this.dayQuestListCallBack, [], false);
        }
        private function dayQuestListCallBack():void{
            var _local1:Object = this._ctrl.dailyQuest.getDayQuestList();
            this._dailyQuest.renderDailyQuestInfo(_local1);
        }
        private function day_accept_quest():void{
            this._data.call(Mod_Quest_Base.day_accept_quest, this.dayAcceptQuestCallBack, [this._dailyQuest.questID], false);
        }
        private function dayAcceptQuestCallBack():void{
            var _local1:Object = this._ctrl.dailyQuest.acceptDayQuest();
            this.renderDialuQuestInfo(_local1);
        }
        private function day_giveup_quest():void{
            this._data.call(Mod_Quest_Base.day_giveup_quest, this.dayGiveupQuestCallBack, [this._dailyQuest.questID], false);
        }
        private function dayGiveupQuestCallBack():void{
            var _local1:Object = this._ctrl.dailyQuest.giveupDayQuest();
            this.renderDialuQuestInfo(_local1);
        }
        private function day_quest_refresh():void{
            if (this._inRefreshQuest){
                return;
            };
            this._inRefreshQuest = true;
            _data.call(Mod_Quest_Base.day_quest_refresh, this.dayQuestRefreshCallBack, []);
        }
        private function dayQuestRefreshCallBack():void{
            var _local1:Object = this._ctrl.dailyQuest.refreshDayQuest();
            this.renderDialuQuestInfo(_local1);
            this._inRefreshQuest = false;
        }
        private function day_now_complete():void{
            if (!_view.ingotEnough(20)){
                return;
            };
            this._data.call(Mod_Quest_Base.day_now_complete, this.dayNowCompleteCallBack, [this._dailyQuest.questID], false);
        }
        private function dayNowCompleteCallBack():void{
            var _local1:Object = this._ctrl.dailyQuest.nowCompleteDay();
            this.renderDialuQuestInfo(_local1);
            this.finish_all_day_quest();
            _view.gameHelper.updateGameAssistant();
        }
        private function day_get_award():void{
            this._data.call(Mod_Quest_Base.day_get_award, this.dayGetAwardCallBack, [this._dailyQuest.questID], false);
        }
        private function dayGetAwardCallBack():void{
            var _local1:Object = this._ctrl.dailyQuest.getAwardDay();
            this.renderDialuQuestInfo(_local1);
            this.finish_all_day_quest();
            _view.gameHelper.updateGameAssistant();
        }
        private function day_quest_refresh_star():void{
            var callBack:* = null;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    _data.call(Mod_Quest_Base.day_quest_refresh_star, dayQuestRefreshStarCallBack, [], false);
                };
            };
            if (!_view.ingotEnough(this.funllStarIngot())){
                return;
            };
            this._dialog.yesLabel = DailyQuestViewLang.DialogYes;
            this._dialog.cancelLabel = DailyQuestViewLang.DialogCancel;
            this._dialog.show(Lang.sprintf(DailyQuestViewLang.FullStar, HtmlText.yellow(this.funllStarIngot().toString())), (AlertButtonType.Yes | AlertButtonType.Cancel), callBack);
        }
        private function dayQuestRefreshStarCallBack():void{
            var _local1:Object = this._ctrl.dailyQuest.refreshStarDayQuest();
            this.renderDialuQuestInfo(_local1);
        }
        public function finish_all_day_quest():void{
            this._data.call(Mod_Quest_Base.finish_all_day_quest, this.finishAllDayQuestCallBack, []);
        }
        private function finishAllDayQuestCallBack():void{
            var _local1:Object = this._ctrl.dailyQuest.finishAllDayQuest;
            if (_local1["state"] == 1){
                this._view.activities.removeActivity(FunctionType.DailyQuest);
            } else {
                if ((((_local1["state"] == 0)) && (FunctionType.isOpened(FunctionType.DailyQuest)))){
                    this._view.activities.addActivity(FunctionType.DailyQuest);
                };
            };
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Quest_Base.SUCCEED:
                    _local2 = DailyQuestViewLang.Succeed;
                    break;
                case Mod_Quest_Base.FAILED:
                    _local2 = DailyQuestViewLang.Failed;
                    break;
                case Mod_Quest_Base.EXITSQUEST:
                    _local2 = DailyQuestViewLang.ExitsQuest;
                    break;
                case Mod_Quest_Base.NOENOUGHLEVEL:
                    _local2 = DailyQuestViewLang.NoEnoughLevel;
                    break;
                case Mod_Quest_Base.NOENOUGHINGOT:
                    _local2 = DailyQuestViewLang.NoEnoughIngot;
                    break;
                case Mod_Quest_Base.COMPLETELIMIT:
                    _local2 = DailyQuestViewLang.CompleteLimit;
                    break;
                case Mod_Quest_Base.PACK_FULL:
                    _local2 = DailyQuestViewLang.PackFull;
                    break;
                default:
                    _local2 = (DailyQuestViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 
