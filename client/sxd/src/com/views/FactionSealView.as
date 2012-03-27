//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.haloer.display.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class FactionSealView extends Base implements IView {

        private var _factionSeal:IFactionSeal;
        private var _intMaxJoinCont:int;
        private var _intIsCompleteSeal:int;
        private var _intIsInSeal:int;
        private var _imgSealedCartoon:Image;
        private var _blnIsJoined:Boolean = false;
        private var _blnInCallNpc:Boolean = false;

        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        public function show():void{
            if (ActivityType.getOpenLevelToSign(ActivityType.FactionSeal) > ActivityType.FactionLevel){
                return;
            };
            this.loadData();
        }
        public function close():void{
            this.close_seal_satan();
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._data.cancelPatch(Mod_Faction_Base.seal_satan_join_notify);
            this._data.cancelPatch(Mod_Faction_Base.seal_satan_award_notify);
            this._factionSeal.clear();
            this.dialog.hide();
            this._imgSealedCartoon = null;
            Helper.gc();
        }
        private function showUI():void{
            _popup.addView(this, this._factionSeal.content);
            _view.center(sign, this._factionSeal.content);
        }
        private function render():void{
            if (this._factionSeal == null){
                this._factionSeal = (_view.getAssetsObject("FactionSeal", "FactionSeal") as IFactionSeal);
            };
            this.init();
            this._factionSeal.render();
            this.sealSatanMemberListCallBack();
            this.showUI();
        }
        private function init():void{
            this._blnIsJoined = false;
            this._factionSeal.tip = this._view.tip.iTip;
            this._factionSeal.drag = this._view.drag.iDrag;
            this._factionSeal.playerID = this._ctrl.player.playerId;
            this._factionSeal.onCloseBtn = this.close;
            this._factionSeal.onCallPlayerBtn = this.seal_satan_call_faction_member;
            this._factionSeal.onCallNpcBtn = this.callNpc;
            this._factionSeal.onJoinBtn = this.join_seal_satan;
            this.loadSealingCartoon();
        }
        private function callNpc():void{
            if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.FactionSealCallNpc)){
                var callBack:* = function (_arg1:uint):void{
                    if (_arg1 == AlertButtonType.Yes){
                        seal_satan_call_npc();
                    };
                    if (dialog.checked){
                        _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.FactionSealCallNpc, true);
                    };
                };
                this.dialog.yesLabel = FactionSealViewLang.DialogYes;
                this.dialog.noLabel = FactionSealViewLang.DialogNo;
                this.dialog.hasCheckbox = true;
                this.dialog.show(Lang.sprintf(FactionSealViewLang.CallNpc, HtmlText.yellow(("5" + FactionSealViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.No), callBack);
            } else {
                this.seal_satan_call_npc();
            };
        }
        private function updateFactionSealActivity(_arg1:Object):void{
            var _local2:String = "";
            var _local3:String = "";
            var _local4:Boolean;
            var _local5:String = "";
            if (this._intIsInSeal == Mod_Faction_Base.YES){
                _local2 = (Lang.sprintf(FactionSealViewLang.NumberOfPeople, _arg1["join_member_count"], _arg1["max_join_count"]) + HtmlText.green(FactionSealViewLang.Sealing));
                _local3 = FactionSealViewLang.Query;
            } else {
                _local2 = Lang.sprintf(FactionSealViewLang.NumberOfPeople, _arg1["join_member_count"], _arg1["max_join_count"]);
                _local3 = FactionSealViewLang.ImmeJoin;
            };
            if (this._intIsCompleteSeal == Mod_Faction_Base.YES){
                _local2 = (Lang.sprintf(FactionSealViewLang.NumberOfPeople, _arg1["join_member_count"], _arg1["max_join_count"]) + HtmlText.green(FactionSealViewLang.Joined));
            };
            var _local6:Object = this._ctrl.faction.isCanJoinActivity;
            if (_local6["result"] == Mod_Faction_Base.YES){
                _local4 = false;
            } else {
                _local4 = true;
                _local5 = FactionSealViewLang.NewMember;
            };
            var _local7:Object = {
                sign:ActivityType.FactionSeal,
                isStart:1,
                isShowTimer:false,
                isShowBtnEffic:false,
                explain:_local2,
                btnInfo:_local3,
                btnType:1,
                isFilter:_local4,
                btnTipInfo:_local5
            };
            this._view.factionWindow.getActivityState(_local7);
        }
        private function loadSealingCartoon():void{
            var img:* = null;
            img = new Image((URI.assetsUrl + "faction_sealing_cartoon.swf"));
            img.onComplete = function ():void{
                _factionSeal.renderSealingCartoon(img);
                loadSealedCartoon();
            };
        }
        private function loadSealedCartoon():void{
            var img:* = null;
            img = new Image((URI.assetsUrl + "faction_sealed_cartoon.swf"));
            img.onComplete = function ():void{
                _imgSealedCartoon = img;
            };
        }
        private function joinSealAward():void{
            var cartoonCallBack:* = null;
            var callBack:* = null;
            cartoonCallBack = function ():void{
                var _local1:Object = _ctrl.faction.sealSatanAwardNotify;
                var _local2:String = "";
                if (_local1["result"] == Mod_Faction_Base.AWARD){
                    _local2 = Lang.sprintf(FactionSealViewLang.SealAward, HtmlText.yellow((_local1["award_fame"] + FactionSealViewLang.Fame)));
                } else {
                    if (_local1["result"] == Mod_Faction_Base.HELP){
                        _local2 = FactionSealViewLang.SealHelp;
                    };
                };
                dialog.yesLabel = FactionSealViewLang.DialogYes;
                dialog.show(_local2, AlertButtonType.Yes, callBack);
            };
            callBack = function (_arg1:uint):void{
                close();
            };
            if (this._imgSealedCartoon != null){
                this._factionSeal.renderSealedCartoon(this._imgSealedCartoon, cartoonCallBack);
            } else {
                setTimeout(this.joinSealAward, 100);
                return;
            };
        }
        private function unJoinSealAward():void{
            var callBack:* = null;
            callBack = function (_arg1:uint):void{
                seal_satan_member_list();
            };
            this.dialog.yesLabel = FactionSealViewLang.DialogYes;
            this.dialog.show(FactionSealViewLang.SealFinish, AlertButtonType.Yes, callBack);
        }
        private function renderFactionSealInfo(_arg1:Array):void{
            var _local2:Object;
            this._blnIsJoined = false;
            for each (_local2 in _arg1) {
                if (_local2["id"] == this._ctrl.player.playerId){
                    this._blnIsJoined = true;
                    break;
                };
            };
            this._factionSeal.renderFactionSealInfo(_arg1, this._intMaxJoinCont, this._blnIsJoined);
        }
        private function renderSealSatanInfo(_arg1:Object):void{
            if (_arg1["is_complete_seal"] != Mod_Faction_Base.KEEP){
                this._intIsCompleteSeal = _arg1["is_complete_seal"];
            };
            if (_arg1["is_in_seal"] != Mod_Faction_Base.KEEP){
                this._intIsInSeal = _arg1["is_in_seal"];
            };
            if ((((_arg1["join_member_count"] == 0)) && ((((_arg1["is_complete_seal"] == Mod_Faction_Base.KEEP)) || ((this._intIsInSeal == Mod_Faction_Base.KEEP)))))){
                this.seal_satan_info();
                return;
            };
            this.updateFactionSealActivity(_arg1);
            this._intMaxJoinCont = _arg1["max_join_count"];
        }
        private function loadData():void{
            var callBack:* = null;
            callBack = function ():void{
                if (_ctrl.faction.isCanJoinActivity["result"] == Mod_Faction_Base.YES){
                    _data.call(Mod_Faction_Base.seal_satan_member_list, loadDataCallBack, []);
                } else {
                    _view.alert.confirm(FactionSealViewLang.NewMember);
                };
            };
            this._data.call(Mod_Faction_Base.is_can_join_activity, callBack, []);
        }
        private function loadDataCallBack():void{
            loadAssets("FactionSeal", this.render, FactionSealViewLang.LoadInfo);
        }
        public function seal_satan_member_list():void{
            this._data.call(Mod_Faction_Base.seal_satan_member_list, this.sealSatanMemberListCallBack, []);
        }
        private function sealSatanMemberListCallBack():void{
            this.seal_satan_join_notify();
            this.seal_satan_award_notify();
            this.renderFactionSealInfo(this._ctrl.faction.sealSatanMemberList);
        }
        private function close_seal_satan():void{
            this._data.call(Mod_Faction_Base.close_seal_satan, null, []);
        }
        private function join_seal_satan():void{
            this._data.call(Mod_Faction_Base.join_seal_satan, this.joinSealSatanCallBack, []);
        }
        private function joinSealSatanCallBack():void{
            var _local1:Object = this._ctrl.faction.joinSealSatan;
            if (_local1["result"] == Mod_Faction_Base.JOIN_SUCCESS){
                this._view.showTip(this.message(_local1["result"]), null, TipType.Success);
            } else {
                this._view.showTip(this.message(_local1["result"]));
            };
        }
        private function seal_satan_call_npc():void{
            if (this._blnInCallNpc){
                return;
            };
            this._blnInCallNpc = true;
            this._data.call(Mod_Faction_Base.seal_satan_call_npc, this.sealSatanCallNpcCallBack, []);
        }
        private function sealSatanCallNpcCallBack():void{
            var _local1:Object = this._ctrl.faction.sealSatanCallNpc;
            if (_local1["result"] == Mod_Faction_Base.CALL_SUCCESS){
                this._view.showTip(this.message(_local1["result"]), null, TipType.Success);
            } else {
                this._view.showTip(this.message(_local1["result"]));
            };
            this._blnInCallNpc = false;
        }
        private function seal_satan_join_notify():void{
            this._data.patch(Mod_Faction_Base.seal_satan_join_notify, this.sealSatanJoinNotifyCallBack);
        }
        private function sealSatanJoinNotifyCallBack():void{
            this.renderFactionSealInfo(this._ctrl.faction.sealSatanJoinNotify);
        }
        private function seal_satan_award_notify():void{
            this._data.patch(Mod_Faction_Base.seal_satan_award_notify, this.sealSatanAwardNotifyCallBack);
        }
        private function sealSatanAwardNotifyCallBack():void{
            this._data.cancelPatch(Mod_Faction_Base.seal_satan_join_notify);
            this._data.cancelPatch(Mod_Faction_Base.seal_satan_award_notify);
            if (this._blnIsJoined){
                this.joinSealAward();
            } else {
                this.unJoinSealAward();
            };
        }
        private function seal_satan_call_faction_member():void{
            this._data.call(Mod_Faction_Base.seal_satan_call_faction_member, this.sealSatanCallFactionMemberCallBack, [], false);
        }
        private function sealSatanCallFactionMemberCallBack():void{
            var _local1:Object = this._ctrl.faction.sealSatanCallFactionMember;
            if (_local1["result"] == Mod_Faction_Base.SUCCESS){
                this._view.chat.changeChannel(Mod_Chat_Base.FACTION);
            } else {
                this._view.showTip(this.message(_local1["result"]));
            };
        }
        public function seal_satan_info():void{
            if (ActivityType.getOpenLevelToSign(ActivityType.FactionSeal) > ActivityType.FactionLevel){
                return;
            };
            this._data.call(Mod_Faction_Base.seal_satan_info, this.sealSatanInfoCallBack, []);
        }
        public function sealSatanInfoCallBack():void{
            this.renderSealSatanInfo(this._ctrl.faction.sealSatanInfo);
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Faction_Base.CALL_SUCCESS:
                    _local2 = FactionSealViewLang.CallSuccess;
                    break;
                case Mod_Faction_Base.IS_JOIN:
                    _local2 = FactionSealViewLang.IsJoin;
                    break;
                case Mod_Faction_Base.NOT_JOIN:
                    _local2 = FactionSealViewLang.NotJoin;
                    break;
                case Mod_Faction_Base.TEAM_EXPIRED:
                    _local2 = FactionSealViewLang.TeamExpired;
                    break;
                case Mod_Faction_Base.INSUFFICIENT_INGOT:
                    _local2 = FactionSealViewLang.InsufficientIngot;
                    break;
                case Mod_Faction_Base.JOIN_SUCCESS:
                    _local2 = FactionSealViewLang.JoinSuccess;
                    break;
                case Mod_Faction_Base.FULL_MEMBER:
                    _local2 = FactionSealViewLang.FullMember;
                    break;
                case Mod_Faction_Base.FULL_NPC:
                    _local2 = FactionSealViewLang.FullNpc;
                    break;
                case Mod_Faction_Base.ERROR:
                    _local2 = FactionSealViewLang.Error1;
                    break;
                default:
                    _local2 = (FactionSealViewLang.Error2 + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 
