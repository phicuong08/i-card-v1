//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class WorshipMarsView extends Base implements IView {

        private var _worshipMars:IWorshipMars;
        private var _intIncenseID:int;
        private var objIncenseColor:Object;

        public function WorshipMarsView(){
            this.objIncenseColor = {
                1:HtmlText.White,
                2:44783,
                3:HtmlText.Yellow
            };
            super();
        }
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
            this._worshipMars.clear();
            this.dialog.hide();
        }
        public function getBlessingTimesAndExpAdd():void{
            if (FunctionType.isOpened(FunctionType.WorshipMars)){
                this.get_blessing_times_and_exp_add();
            };
        }
        public function getRemainIncenseTimes():void{
            if (FunctionType.isOpened(FunctionType.WorshipMars)){
                this.get_remain_incense_times();
                this.getBlessingTimesAndExpAdd();
            };
        }
        private function showUI():void{
            _popup.addView(this, this._worshipMars.content);
            _view.center(sign, this._worshipMars.content);
        }
        private function render():void{
            if (this._worshipMars == null){
                this._worshipMars = (_view.getAssetsObject("WorshipMars", "WorshipMars") as IWorshipMars);
            };
            this.init();
            this._worshipMars.render();
            this.marsInfoCallBack();
            this.showUI();
        }
        private function init():void{
            this._worshipMars.tip = this._view.tip.iTip;
            this._worshipMars.drag = this._view.drag.iDrag;
            this._worshipMars.onCloseBtn = this.close;
            this._worshipMars.onTextLink = this._view.toolbar.onTextLink;
            this._worshipMars.onIncenseBtn = this.incense;
        }
        private function getIncenseNameHtmlText(_arg1:String, _arg2:uint):String{
            return (HtmlText.format((("[" + _arg1) + "]"), _arg2));
        }
        private function loadData():void{
            this.mars_info(this.loadDataCallBack);
        }
        private function loadDataCallBack():void{
            loadAssets("WorshipMars", this.render, WorshipMarsViewLang.LoadInfo);
        }
        private function mars_info(_arg1:Function):void{
            _data.call(Mod_WorshipMars_Base.mars_info, _arg1, [], false);
        }
        private function marsInfoCallBack():void{
            var _local1:Object = this._ctrl.worshipMars.marsInfo;
            var _local2:Array = this._ctrl.worshipMars.incenseLog;
            this._worshipMars.renderGod(_local1);
            this._worshipMars.renderRecordList(_local2);
        }
        private function incense(_arg1:int):void{
            var dialogCallBack:* = null;
            var intIncenseId:* = _arg1;
            dialogCallBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    worshipMarsIncense();
                };
            };
            var worshipMarsIncense:* = function ():void{
                if (!_view.ingotEnough(MarsType.getOfferingIngot(intIncenseId))){
                    return;
                };
                _intIncenseID = intIncenseId;
                _data.call(Mod_WorshipMars_Base.incense, incenseCallBack, [intIncenseId], false);
            };
            if (this._ctrl.worshipMars.marsInfo["is_cover"] == 1){
                this.dialog.yesLabel = WorshipMarsViewLang.DialogYes;
                this.dialog.cancelLabel = WorshipMarsViewLang.DialogNo;
                this.dialog.show(WorshipMarsViewLang.IsCover, (AlertButtonType.Yes | AlertButtonType.Cancel), dialogCallBack);
            } else {
                worshipMarsIncense();
            };
        }
        private function incenseCallBack():void{
            var strName:* = null;
            var intCount:* = 0;
            var intExp:* = 0;
            var intFame:* = 0;
            var strTitle:* = null;
            var strMessage:* = null;
            var obj:* = this._ctrl.worshipMars.marsIncense;
            if (obj["result"] == Mod_WorshipMars_Base.SUCCESS){
                var callBack:* = function (_arg1:uint):void{
                    mars_info(marsInfoCallBack);
                    get_remain_incense_times();
                };
                strName = MarsType.getOfferingName(this._intIncenseID);
                intCount = MarsType.getOfferingBlessingCount(this._intIncenseID);
                intExp = MarsType.getOfferingExp(this._intIncenseID);
                intFame = MarsType.getOfferingFame(this._intIncenseID);
                strTitle = Lang.sprintf(WorshipMarsViewLang.Incense, this.getIncenseNameHtmlText(strName, this.objIncenseColor[this._intIncenseID]));
                strMessage = Lang.sprintf(WorshipMarsViewLang.IncenseGetInfo, HtmlText.yellow(intCount.toString()), HtmlText.yellow(("+" + intFame)), HtmlText.yellow(("+" + intExp)));
                this._view.activities.showWinEffect();
                this._view.alert.confirm((strTitle + strMessage), callBack);
            } else {
                this._view.showTip(this.message(obj["result"]));
            };
        }
        private function get_blessing_times_and_exp_add():void{
            _data.call(Mod_WorshipMars_Base.get_blessing_times_and_exp_add, this.getBlessingTimesAndExpAddCountCallBack, []);
        }
        private function getBlessingTimesAndExpAddCountCallBack():void{
            var _local1:Object = this._ctrl.worshipMars.getBlessingTimesAndExpAdd;
            this._view.toolbar.updateMarsBlessing(_local1);
        }
        private function get_remain_incense_times():void{
            _data.call(Mod_WorshipMars_Base.get_remain_incense_times, this.getRemainIncenseTimesCallBack, []);
        }
        private function getRemainIncenseTimesCallBack():void{
            var _local1:Object = this._ctrl.worshipMars.getRemainIncenseTimes;
            if (_local1["remain_incense_times"] > 0){
                this._view.activities.addActivity(FunctionType.WorshipMars);
            } else {
                this._view.activities.removeActivity(FunctionType.WorshipMars);
            };
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_WorshipMars_Base.SUCCESS:
                    _local2 = WorshipMarsViewLang.Success;
                    break;
                case Mod_WorshipMars_Base.OFFERINGS_NO_EXIST:
                    _local2 = WorshipMarsViewLang.OfferingsNoExist;
                    break;
                case Mod_WorshipMars_Base.COUNT_USED:
                    _local2 = WorshipMarsViewLang.CountUsed;
                    break;
                case Mod_WorshipMars_Base.INSUFFICIENT_INGOT:
                    _local2 = WorshipMarsViewLang.InsufficientIngot;
                    break;
                case Mod_WorshipMars_Base.INSUFFICIENT_SKILL:
                    _local2 = WorshipMarsViewLang.InsufficientSkill;
                    break;
                case Mod_WorshipMars_Base.NO_ENOUGTH_VIP:
                    _local2 = WorshipMarsViewLang.NoEnougthVip;
                    break;
                default:
                    _local2 = (WorshipMarsViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 
