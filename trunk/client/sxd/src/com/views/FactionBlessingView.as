//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class FactionBlessingView extends Base implements IView {

        private var _factionBlessing:IFactionBlessing;
        private var _intIncenseID:int;
        private var objIncenseColor:Object;

        public function FactionBlessingView(){
            this.objIncenseColor = {
                1:HtmlText.White,
                2:44783,
                3:0xFFFF00
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
            this._factionBlessing.clear();
            this.dialog.hide();
        }
        public function checkIncense():void{
            if (!this._view.townMap.inStage){
                return;
            };
            var _local1:int = TownType.getTownNPCIdByFunc(_ctrl.player.mapId, NPCType.FactionGodNPC);
            if (_local1 != 0){
                _view.townMap.setBuildGetVisible(1, (_ctrl.player.canIncenseCount > 0));
            };
            this.getBlessingCount();
        }
        public function getBlessingCount():void{
            this.get_blessing_count();
        }
        public function gotoFactionBlessing():void{
            var _local1:int = TownType.getTownNPCIdByFunc(_ctrl.player.mapId, NPCType.FactionGodNPC);
            if (_local1 == 0){
                _view.townMap.gotoTownAtId(TownType.getId(TownType.JiHuiSuo));
            };
            this.showFactionBlessing();
        }
        public function getFactionBlessingCount():void{
            var _local1:Object = {
                sign:ActivityType.FactionBlessing,
                isStart:((_ctrl.player.canIncenseCount > 0)) ? 1 : 2,
                isShowTimer:false,
                explain:Lang.sprintf(FactionBlessingViewLang.EverydayBlessingTimes, _ctrl.player.canIncenseCount),
                isShowBtnEffic:false,
                btnInfo:((_ctrl.player.canIncenseCount > 0)) ? FactionBlessingViewLang.ImmeJoin : "",
                btnType:1
            };
            this._view.factionWindow.getActivityState(_local1);
        }
        private function showUI():void{
            _popup.addView(this, this._factionBlessing.content);
            _view.center(sign, this._factionBlessing.content);
        }
        private function render():void{
            if (this._factionBlessing == null){
                this._factionBlessing = (_view.getAssetsObject("FactionBlessing", "FactionBlessing") as IFactionBlessing);
            };
            this.init();
            this._factionBlessing.render();
            this.factionGodInfoCallBack();
            this.showUI();
        }
        private function init():void{
            this._factionBlessing.tip = this._view.tip.iTip;
            this._factionBlessing.drag = this._view.drag.iDrag;
            this._factionBlessing.onCloseBtn = this.close;
            this._factionBlessing.onTextLink = this._view.toolbar.onTextLink;
            this._factionBlessing.onIncenseBtn = this.incense;
        }
        private function getIncenseNameHtmlText(_arg1:String, _arg2:uint):String{
            return (HtmlText.format((("[" + _arg1) + "]"), _arg2));
        }
        private function showFactionBlessing():void{
            if (_view.initLoading.inStage){
                setTimeout(this.showFactionBlessing, 500);
            } else {
                _view.factionBlessing.show();
            };
        }
        private function loadData():void{
            _data.call(Mod_Faction_Base.faction_god_info, this.loadDataCallBack, [], false);
        }
        private function loadDataCallBack():void{
            loadAssets("FactionBlessing", this.render, FactionBlessingViewLang.Loadinfo);
        }
        private function faction_god_info():void{
            _data.call(Mod_Faction_Base.faction_god_info, this.factionGodInfoCallBack, [], false);
        }
        private function factionGodInfoCallBack():void{
            var _local1:Object = this._ctrl.faction.godInfo;
            var _local2:Array = this._ctrl.faction.incenseLog;
            this._factionBlessing.renderGod(_local1);
            this._factionBlessing.renderRecordList(_local2);
        }
        private function incense(_arg1:int):void{
            var callBack:* = null;
            var intIncenseId:* = _arg1;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    factionIncense();
                };
            };
            var factionIncense:* = function ():void{
                if (!_view.ingotEnough(FactionType.getOfferIngot(intIncenseId))){
                    return;
                };
                _intIncenseID = intIncenseId;
                _data.call(Mod_Faction_Base.incense, incenseCallBack, [intIncenseId], false);
            };
            if (this._ctrl.faction.godInfo["is_cover"] == 1){
                this.dialog.yesLabel = FactionBlessingViewLang.DialogYes;
                this.dialog.cancelLabel = FactionBlessingViewLang.DialogNo;
                this.dialog.show(FactionBlessingViewLang.IsCover, (AlertButtonType.Yes | AlertButtonType.Cancel), callBack);
            } else {
                factionIncense();
            };
        }
        private function incenseCallBack():void{
            var strName:* = null;
            var intCount:* = 0;
            var intExp:* = 0;
            var intFame:* = 0;
            var strTitle:* = null;
            var strMessage:* = null;
            var obj:* = this._ctrl.faction.incense;
            if (obj["result"] == Mod_Faction_Base.SUCCESS){
                var callBack:* = function (_arg1:uint):void{
                    faction_god_info();
                };
                strName = FactionType.getOfferName(this._intIncenseID);
                intCount = FactionType.getOfferBlessingCount(this._intIncenseID);
                intExp = FactionType.getOfferExp(this._intIncenseID);
                intFame = FactionType.getOfferFame(this._intIncenseID);
                strTitle = Lang.sprintf(FactionBlessingViewLang.Incense, this.getIncenseNameHtmlText(strName, this.objIncenseColor[this._intIncenseID]));
                strMessage = Lang.sprintf(FactionBlessingViewLang.IncenseGetInfo, HtmlText.yellow(intCount.toString()), HtmlText.yellow(("+" + intFame)), HtmlText.yellow(("+" + intExp)));
                this.dialog.yesLabel = FactionBlessingViewLang.DialogYes;
                this.dialog.show((strTitle + strMessage), AlertButtonType.Yes, callBack);
                this._view.activities.showWinEffect();
            } else {
                this._view.showTip(this.message(obj["result"]));
            };
        }
        private function get_blessing_count():void{
            _data.call(Mod_Faction_Base.get_blessing_count, this.getBlessingCountCallBack, []);
        }
        private function getBlessingCountCallBack():void{
            var _local1:Object = this._ctrl.faction.blessingCount;
            this._view.toolbar.updateFactionBlessing(_local1);
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Faction_Base.SUCCESS:
                    _local2 = FactionBlessingViewLang.Success;
                    break;
                case Mod_Faction_Base.MEMBER_NO_EXIST:
                    _local2 = FactionBlessingViewLang.MemberNoExist;
                    break;
                case Mod_Faction_Base.FACTION_NO_EXIST:
                    _local2 = FactionBlessingViewLang.FactionNoExist;
                    break;
                case Mod_Faction_Base.OFFERINGS_NO_EXIST:
                    _local2 = FactionBlessingViewLang.OfferingsNoExist;
                    break;
                case Mod_Faction_Base.COUNT_USED:
                    _local2 = FactionBlessingViewLang.CountUsed;
                    break;
                case Mod_Faction_Base.INSUFFICIENT_INGOT:
                    _local2 = FactionBlessingViewLang.InsufficientIngot;
                    break;
                case Mod_Faction_Base.INSUFFICIENT_SKILL:
                    _local2 = FactionBlessingViewLang.InsufficientSkill;
                    break;
                default:
                    _local2 = (FactionBlessingViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 
