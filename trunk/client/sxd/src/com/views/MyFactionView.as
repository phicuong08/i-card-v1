//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class MyFactionView extends Base implements IView {

        private var _factionId:int = 0;
        private var _myFactionData:Object;
        private var _newMemberList:Array;
        private var _applyList:Array;
        private var _myFaction:IMyFaction;
        private var _showType:String = "member";
        private var _kickoutMemberData:Object;

        private function my_faction_info():void{
            _data.call(Mod_Faction_Base.my_faction_info, this.myFactionInfoCallback, []);
        }
        private function member_list():void{
            _data.call(Mod_Faction_Base.member_list, this.memberListCallback, [this._factionId, ""]);
        }
        private function request_list():void{
            _data.call(Mod_Faction_Base.request_list, this.applyListCallback, [this._factionId]);
        }
        public function accept_request(_arg1:int):void{
            _data.call(Mod_Faction_Base.accept_request, this.acceptRequestCallback, [_arg1]);
        }
        public function quit_faction():void{
            _data.call(Mod_Faction_Base.quit_faction, this.quitFactionCallback, []);
        }
        public function deny_request(_arg1:int):void{
            _data.call(Mod_Faction_Base.deny_request, this.denyRequestCallback, [_arg1], false);
        }
        public function appoint_job(_arg1:int):void{
            _data.call(Mod_Faction_Base.appoint_job, this.appointJobCallback, [_arg1]);
        }
        public function kickout_member(_arg1:int):void{
            _data.call(Mod_Faction_Base.kickout_member, this.kickoutMemberCallback, [_arg1]);
        }
        public function dismiss_job(_arg1:int):void{
            _data.call(Mod_Faction_Base.dismiss_job, this.dismissJobCallback, [_arg1]);
        }
        public function master_transfer(_arg1:int):void{
            _data.call(Mod_Faction_Base.master_transfer, this.masterTransferJobCallback, [_arg1]);
        }
        private function modify_notice(_arg1:String):void{
            _data.call(Mod_Faction_Base.modify_faction_notice, this.modifyNoticeCallBack, [this._factionId, _arg1]);
        }
        private function modify_desc(_arg1:String):void{
            _data.call(Mod_Faction_Base.modify_faction_desc, this.modifyDescCallBack, [this._factionId, _arg1]);
        }
        private function disband_faction():void{
            _data.call(Mod_Faction_Base.disband_faction, this.disbandFactionCallBack, [this._factionId]);
        }
        private function modify_group_number(_arg1:String):void{
            _data.call(Mod_Faction_Base.modify_group_number, this.groupNumberCallBack, [this._factionId, _arg1]);
        }
        private function faction_contribution_list():void{
            _data.call(Mod_Faction_Base.faction_contribution_list, this.contributionListCallBack, []);
        }
        private function clean_faction_request():void{
            _data.call(Mod_Faction_Base.clean_faction_request, this.cleanFactionRequestCallBack, [this._factionId]);
        }
        private function get_faction_master_trace():void{
            _data.call(Mod_Faction_Base.get_faction_master_trace, this.factionMasterTraceCallBack, []);
        }
        private function seize_the_throne():void{
            _data.call(Mod_Faction_Base.seize_the_throne, this.seizeTheThroneCallBack, []);
        }
        private function myFactionInfoCallback():void{
            var _local1:Object = this._ctrl.faction.myFactionInfo;
            if (_local1.msg == "myFaction"){
                this._myFactionData = _local1.factionData;
                this._factionId = _local1.factionData.factionId;
                this._ctrl.player.playerInfo.factionId = _local1.factionData.factionId;
                this._ctrl.player.playerInfo.factionName = _local1.factionData.factionName;
                if (this.inStage){
                    this._myFaction.getFactionData = _local1.factionData;
                } else {
                    loadAssets("MyFaction", this.render, MyFactionViewLang.LoadAssets);
                };
            } else {
                _view.joinFaction.switchSelf();
            };
        }
        private function memberListCallback():void{
            var _local1:Array = this._ctrl.faction.memberList;
            var _local2:Array = this.sortPosition(_local1, 1);
            var _local3:Array = this.sortPosition(_local1, 2);
            var _local4:Array = this.sortPosition(_local1, 0);
            _local2.sortOn("contribution", (Array.NUMERIC | Array.DESCENDING));
            _local3.sortOn("contribution", (Array.NUMERIC | Array.DESCENDING));
            _local4.sortOn("contribution", (Array.NUMERIC | Array.DESCENDING));
            this._newMemberList = [];
            this.mergerList(_local2);
            this.mergerList(_local3);
            this.mergerList(_local4);
            this._myFaction.getFactionPersonList = this._newMemberList;
        }
        private function sortPosition(_arg1:Array, _arg2:int):Array{
            var _local6:Object;
            var _local3:int = _arg1.length;
            var _local4:Array = [];
            var _local5:int;
            while (_local5 < _local3) {
                _local6 = _arg1[_local5];
                if (_local6.positionNum == _arg2){
                    _local4.push(_local6);
                };
                _local5++;
            };
            return (_local4);
        }
        private function mergerList(_arg1:Array):void{
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                this._newMemberList.push(_arg1[_local3]);
                _local3++;
            };
        }
        private function kickoutMemberCallback():void{
            var _local1:Object = this._ctrl.faction.kickoutMember;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                this.member_list();
                this.my_faction_info();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function applyListCallback():void{
            var _local1:Array = this._ctrl.faction.applyList;
            this._myFaction.getFactionApplyList = _local1;
        }
        private function joinPlayer(_arg1:String):void{
            var _local4:Object;
            var _local2:int = this._applyList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._applyList[_local3];
                if (_arg1 == _local4.name){
                    this.accept_request(_local4.applyId);
                    return;
                };
                _local3++;
            };
        }
        private function acceptRequestCallback():void{
            var _local1:Object = this._ctrl.faction.acceptApply;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                this.request_list();
                this.my_faction_info();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function quitFactionCallback():void{
            var _local1:Object = this._ctrl.faction.quitFaction;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                this.close();
                _view.townMap.quitJiHuiSuo();
                _ctrl.player.playerInfo.factionId = 0;
                _ctrl.player.playerInfo.factionName = "";
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function denyRequestCallback():void{
            var _local1:Object = this._ctrl.faction.denyApply;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                this.request_list();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function cleanFactionRequestCallBack():void{
            var _local1:Object = this._ctrl.faction.cleanFactionRequest;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                this.request_list();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function appointJobCallback():void{
            var _local1:Object = this._ctrl.faction.appointJob;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                this.member_list();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function dismissJobCallback():void{
            var _local1:Object = this._ctrl.faction.dismissJob;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                this.member_list();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function modifyNoticeCallBack():void{
            var _local1:Object = this._ctrl.faction.modifyNotice;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                this._myFaction.getFactionData = _local1.factionData;
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function modifyDescCallBack():void{
            var _local1:Object = this._ctrl.faction.modifyInfo;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                _view.showTip(MyFactionViewLang.SubmitSuccess, MyFactionViewLang.SystemInfo, TipType.Success);
                this._myFaction.getFactionData = _local1.factionData;
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        public function masterTransferJobCallback():void{
            var _local1:Object = this._ctrl.faction.transfer;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                _view.showTip(MyFactionViewLang.TransferSuccess, MyFactionViewLang.SystemInfo, TipType.Success);
                this.my_faction_info();
                switch (this._showType){
                    case "log":
                        this.faction_contribution_list();
                        break;
                    case "member":
                    case "audit":
                        this.member_list();
                        break;
                };
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function disbandFactionCallBack():void{
            var _local1:Object = this._ctrl.faction.disbandFaction;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                _view.showTip(MyFactionViewLang.DisbandSuccess, MyFactionViewLang.SystemInfo, TipType.Success);
                _view.joinFaction.switchSelf();
                _view.townMap.quitJiHuiSuo();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function groupNumberCallBack():void{
            var _local1:Object = this._ctrl.faction.groupNumber;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                this._myFaction.getFactionData = _local1.factionData;
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function contributionListCallBack():void{
            var _local1:Array = this._ctrl.faction.contributionList;
            this._myFaction.getFactionLogList = _local1;
        }
        private function factionMasterTraceCallBack():void{
            var _local1:Object = this._ctrl.faction.factionMasterTracel;
        }
        private function seizeTheThroneCallBack():void{
            var _local1:Object = this._ctrl.faction.seizeTheThrone;
            if (_local1.msg == Mod_Faction_Base.SUCCESS){
                _view.showTip(MyFactionViewLang.ThroneSuccess, MyFactionViewLang.TransferSuccess, TipType.Success);
                this.my_faction_info();
                switch (this._showType){
                    case "log":
                        this.faction_contribution_list();
                        break;
                    case "member":
                        this.member_list();
                        break;
                    case "audit":
                        this.request_list();
                        break;
                };
                this.get_faction_master_trace();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function renderMsg(_arg1:int):void{
            switch (_arg1){
                case Mod_Faction_Base.CAMP_ERR:
                    _view.showTip(MyFactionViewLang.CampErr);
                    break;
                case Mod_Faction_Base.INSUFFICIENT_COIN:
                    _view.showTip(MyFactionViewLang.InsufficientCoin);
                    break;
                case Mod_Faction_Base.NOT_FREE_PLAYER:
                    _view.showTip(MyFactionViewLang.NoFreePlayer);
                    break;
                case Mod_Faction_Base.FOUND_ONE_FACTION:
                    _view.showTip(MyFactionViewLang.FoundOneFaction);
                    break;
                case Mod_Faction_Base.NOT_FACTION_MASTER:
                    _view.showTip(MyFactionViewLang.NotFactionMaster);
                    break;
                case Mod_Faction_Base.FACTION_NAME_EXISTED:
                    _view.showTip(MyFactionViewLang.FactionNameExisted);
                    break;
                case Mod_Faction_Base.FACTION_NAME_INVALID:
                    _view.showTip(MyFactionViewLang.FactionNameInvalid);
                    break;
                case Mod_Faction_Base.FACTION_DESC_INVALID:
                    _view.showTip(MyFactionViewLang.FactionDescInvalid);
                    break;
                case Mod_Faction_Base.FACTION_NOT_EXIST:
                    _view.showTip(MyFactionViewLang.FactionNotExist);
                    break;
                case Mod_Faction_Base.NOT_FREE_PLAYER:
                    _view.showTip(MyFactionViewLang.NotFreePlayer);
                    break;
                case Mod_Faction_Base.REQUEST_NUM_LIMIT:
                    _view.showTip(MyFactionViewLang.RequestNumLimit);
                    break;
                case Mod_Faction_Base.REQUEST_NOT_EXIST:
                    _view.showTip(MyFactionViewLang.RequestNotExist);
                    break;
                case Mod_Faction_Base.NO_FACTION_JOB:
                    _view.showTip(MyFactionViewLang.NoFactionJob);
                    break;
                case Mod_Faction_Base.IN_FACTION_WAR:
                    _view.showTip(MyFactionViewLang.InFactionWar);
                    break;
                case Mod_Faction_Base.MANAGER_NUM_LIMIT:
                    _view.showTip(MyFactionViewLang.ManagerNumLimit);
                    break;
                case Mod_Faction_Base.INSUFFICIENT_INGOT:
                    _view.showTip(MyFactionViewLang.InsufficientIngot);
                    break;
                case Mod_Faction_Base.FAIL:
                    _view.showTip(MyFactionViewLang.Fail);
                    break;
                case Mod_Faction_Base.IS_MASTER:
                    _view.showTip(MyFactionViewLang.IsMaster);
                    break;
            };
        }
        public function show():void{
            if (_view.factionWarMap.isFactionWarStart == true){
                return;
            };
            this.my_faction_info();
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        public function render():void{
            this._myFaction = (_view.getAssetsObject("MyFaction", "MyFaction") as IMyFaction);
            _popup.addView(this, this._myFaction.content);
            _view.center(sign, this._myFaction.content);
            this._myFaction.tip = _view.tip.iTip;
            this._myFaction.drag = _view.drag.iDrag;
            this._myFaction.getFactionData = this._myFactionData;
            this.member_list();
            this.get_faction_master_trace();
            this._myFaction.isInAssembly = !((_ctrl.player.jihuisuoId == 0));
            this._myFaction.onAddFriend = function (_arg1:Object):void{
                if (_arg1.playerId == _ctrl.player.playerId){
                    return;
                };
                _view.friendList.addFriend(_arg1.playerName);
            };
            this._myFaction.onAppointJob = function (_arg1:Object):void{
                appoint_job(_arg1.memberId);
            };
            this._myFaction.onDismissJob = function (_arg1:Object):void{
                dismiss_job(_arg1.factionJobId);
            };
            this._myFaction.onTanHe = function ():void{
                if ((((_view.vipEnabled == false)) || ((_view.ingotEnough(100) == false)))){
                    return;
                };
                var _local1:String = Lang.sprintf(MyFactionViewLang.TanHeInfo, (HtmlText.yellow("100") + MyFactionViewLang.Ingot));
                _view.alert.showYesNoMsg(_local1, MyFactionViewLang.Sure, MyFactionViewLang.Cancel, onTanHe);
            };
            this._myFaction.onkickoutMember = function (_arg1:Object):void{
                _kickoutMemberData = _arg1;
                _view.alert.showYesNoMsg(Lang.sprintf(MyFactionViewLang.KickoutMember, _arg1.showName), MyFactionViewLang.Sure, MyFactionViewLang.Cancel, onKickoutFaction);
            };
            this._myFaction.onOpenJoinFaction = function ():void{
                _view.joinFaction.joinFactionType = true;
                _view.joinFaction.show();
            };
            this._myFaction.onOpenSsembly = function ():void{
                if (_view.missionPractice.inStageWithTip){
                    return;
                };
                if (_view.heroPractice.inStageWithTip){
                    return;
                };
                _view.townMap.gotoTownAtId(TownType.getId(TownType.JiHuiSuo));
            };
            this._myFaction.onPk = function (_arg1:Object):void{
                _view.pkWar.defenderPlayerId = _arg1.playerId;
                _view.pkWar.show();
            };
            this._myFaction.onQuit = function ():void{
                _view.alert.showYesNoMsg(MyFactionViewLang.QuitFaction, MyFactionViewLang.Sure, MyFactionViewLang.Cancel, onQuitFaction);
            };
            this._myFaction.onSendMessige = function (_arg1:Object):void{
                if (_arg1.playerId == _ctrl.player.playerId){
                    return;
                };
                _view.friendChat.get_friendinfo_chatrecord_list(_arg1.playerId);
            };
            this._myFaction.onSendFlower = function (_arg1:Object):void{
                _view.sendFlower.sendPlayerID = _arg1.playerId;
                _view.sendFlower.show();
            };
            this._myFaction.onPersonCheck = function (_arg1:Object):void{
                if (_arg1.playerId == _ctrl.player.playerId){
                    return;
                };
                if (_view.otherRoleMsg.inStage){
                    _view.otherRoleMsg.close();
                };
                _view.otherRoleMsg.init(_arg1.playerId, _arg1.name);
                _view.otherRoleMsg.show();
            };
            this._myFaction.onRefuse = function (_arg1:Object):void{
                deny_request(_arg1.applyId);
            };
            this._myFaction.onThrough = function (_arg1:Object, _arg2:Boolean):void{
                if (_arg2 == false){
                    _view.showTip(MyFactionViewLang.FactionFull);
                    return;
                };
                accept_request(_arg1.applyId);
            };
            this._myFaction.onShowAudit = function ():void{
                request_list();
                _showType = "audit";
            };
            this._myFaction.onShowLog = function ():void{
                faction_contribution_list();
                _showType = "log";
            };
            this._myFaction.onShowPerson = function ():void{
                member_list();
                _showType = "member";
            };
            this._myFaction.onTextLink = function (_arg1:TextEvent):void{
                _view.toolbar.onTextLink(_arg1);
            };
            this._myFaction.onTransferFaction = function (_arg1:Object):void{
                master_transfer(_arg1.factionJobId);
            };
            this._myFaction.onDismissSure = function (_arg1:String):void{
                _view.alert.showYesNoMsg(MyFactionViewLang.DismissSure, MyFactionViewLang.Sure, MyFactionViewLang.Cancel, onDismissFaction);
            };
            this._myFaction.onNoticeInfo = function (_arg1:String):void{
                modify_notice(_arg1);
            };
            this._myFaction.onDescInfo = function (_arg1:String):void{
                modify_desc(_arg1);
            };
            this._myFaction.onGroupNumber = function (_arg1:String):void{
                modify_group_number(_arg1);
            };
            this._myFaction.onClose = function ():void{
                close();
            };
            this._myFaction.onReturnTown = function ():void{
                _view.townMap.quitJiHuiSuo();
            };
            this._myFaction.onAllRefuse = function (_arg1:int):void{
                if (_arg1 <= 0){
                    _view.showTip(MyFactionViewLang.AllRefuse);
                } else {
                    clean_faction_request();
                };
            };
        }
        public function onQuitFaction(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.quit_faction();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function onDismissFaction(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.disband_faction();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function onKickoutFaction(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.kickout_member(this._kickoutMemberData.memberId);
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function onTanHe(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.seize_the_throne();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function clear():void{
            this._myFaction.clear();
        }
        public function close():void{
            this._showType = "member";
            this.clear();
            _popup.closeView(this);
        }

    }
}//package com.views 
