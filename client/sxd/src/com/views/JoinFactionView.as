//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.lang.client.com.views.*;

    public class JoinFactionView extends Base implements IView {

        private var _factionData:Object;
        private var _newMemberList:Array;
        private var _joinFaction:IJoinFaction;
        private var _seleteFaction:String = "";
        private var _seleteMaster:String = "";
        private var _listPageNum:int = 3;
        private var _listPage:int = 1;
        private var _applyStr:int = 0;
        private var _applyBool:Boolean = false;
        private var _isCheckOver:Boolean = true;
        private var _checkData:Object;
        private var _factionType:Boolean = false;

        public function JoinFactionView(){
            this._checkData = {};
            super();
        }
        private function faction_List():void{
            _data.call(Mod_Faction_Base.faction_list, this.factionListCallback, [this._seleteFaction, this._seleteMaster, this._applyStr, this._listPage]);
        }
        private function create_faction(_arg1:String):void{
            _data.call(Mod_Faction_Base.found_faction, this.createFactionCallback, [_arg1, ""]);
        }
        private function apply_faction(_arg1:int):void{
            _data.call(Mod_Faction_Base.faction_request, this.applyFactionCallback, [_arg1]);
        }
        private function cancel_apply(_arg1:int):void{
            _data.call(Mod_Faction_Base.cancel_request, this.cancelApplyCallback, [_arg1]);
        }
        public function found_faction_coin():void{
            _data.call(Mod_Faction_Base.found_faction_coin, this.foundFactionCoinCallBack, []);
        }
        public function member_list(_arg1:int):void{
            _data.call(Mod_Faction_Base.member_list, this.memeberListCoinCallBack, [_arg1, ""]);
        }
        private function factionListCallback():void{
            this._factionData = this._ctrl.faction.factionList;
            this._listPageNum = this._factionData.allPage;
            this._listPage = this._factionData.page;
            if (this.inStage){
                this.joinFactionInfo(this._factionData.list);
            } else {
                loadAssets("JoinFaction", this.render, JoinFactionViewLang.LoadAssets);
            };
        }
        private function createFactionCallback():void{
            var _local1:Object = this._ctrl.faction.createFaction;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                _view.showTip(JoinFactionViewLang.CreateFactionSuccess, null, TipType.Success);
                _view.myFaction.switchSelf();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function applyFactionCallback():void{
            var _local1:Object = this._ctrl.faction.factionApply;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                this.faction_List();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function cancelApplyCallback():void{
            var _local1:Object = this._ctrl.faction.cancelApply;
            if (_local1.msg == Mod_Faction_Base.ACTION_SUCCESS){
                this.faction_List();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function foundFactionCoinCallBack():void{
            var _local1:Object = this._ctrl.faction.foundFactionCoin;
            this._joinFaction.foundFactionCoin = _local1.coin;
        }
        private function memeberListCoinCallBack():void{
            this._isCheckOver = true;
            var _local1:Array = this._ctrl.faction.memberList;
            this._joinFaction.checkFactionData = this._checkData;
            var _local2:Array = this.sortPosition(_local1, 1);
            var _local3:Array = this.sortPosition(_local1, 2);
            var _local4:Array = this.sortPosition(_local1, 0);
            _local2.sortOn("playerLevel", (Array.NUMERIC | Array.DESCENDING));
            _local3.sortOn("playerLevel", (Array.NUMERIC | Array.DESCENDING));
            _local4.sortOn("playerLevel", (Array.NUMERIC | Array.DESCENDING));
            this._newMemberList = [];
            this.mergerList(_local2);
            this.mergerList(_local3);
            this.mergerList(_local4);
            this._joinFaction.getFactionPersonList = this._newMemberList;
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
        private function renderMsg(_arg1:int):void{
            switch (_arg1){
                case Mod_Faction_Base.CAMP_ERR:
                    _view.showTip(JoinFactionViewLang.CampErr);
                    break;
                case Mod_Faction_Base.INSUFFICIENT_COIN:
                    _view.showTip(JoinFactionViewLang.InsuffictentCoin);
                    break;
                case Mod_Faction_Base.NOT_FREE_PLAYER:
                    _view.showTip(JoinFactionViewLang.NotFreePlayer);
                    break;
                case Mod_Faction_Base.FOUND_ONE_FACTION:
                    _view.showTip(JoinFactionViewLang.FoundOneFaction);
                    break;
                case Mod_Faction_Base.FACTION_NAME_EXISTED:
                    _view.showTip(JoinFactionViewLang.FactionNameExisted);
                    break;
                case Mod_Faction_Base.FACTION_NAME_INVALID:
                    _view.showTip(JoinFactionViewLang.FactionNameInvalid);
                    break;
                case Mod_Faction_Base.FACTION_DESC_INVALID:
                    _view.showTip(JoinFactionViewLang.FactionDescInvalid);
                    break;
                case Mod_Faction_Base.FACTION_NOT_EXIST:
                    _view.showTip(JoinFactionViewLang.FactionNotExist);
                    break;
                case Mod_Faction_Base.NOT_FREE_PLAYER:
                    _view.showTip(JoinFactionViewLang.NotFreePlayer);
                    break;
                case Mod_Faction_Base.REQUEST_NUM_LIMIT:
                    _view.showTip(JoinFactionViewLang.RequestNumLimit);
                    break;
                case Mod_Faction_Base.REQUEST_NOT_EXIST:
                    _view.showTip(JoinFactionViewLang.RequestNumLimit);
                    break;
            };
        }
        public function show():void{
            this.faction_List();
        }
        public function render():void{
            this._joinFaction = (_view.getAssetsObject("JoinFaction", "JoinFaction") as IJoinFaction);
            _popup.addView(this, this._joinFaction.content);
            _view.center(sign, this._joinFaction.content);
            this.found_faction_coin();
            this._joinFaction.tip = _view.tip.iTip;
            this._joinFaction.drag = _view.drag.iDrag;
            this._joinFaction.joinFactionType = this._factionType;
            this.joinFactionInfo(this._factionData.list);
            this._joinFaction.onApply = function (_arg1:int):void{
                apply_faction(_arg1);
            };
            this._joinFaction.onRevok = function (_arg1:int):void{
                cancel_apply(_arg1);
            };
            this._joinFaction.onPage = function (_arg1:int):void{
                _listPage = _arg1;
                _seleteFaction = "";
                _seleteMaster = "";
                faction_List();
            };
            this._joinFaction.onAddFriend = function (_arg1:Object):void{
                if (_arg1.playerId == _ctrl.player.playerId){
                    return;
                };
                _view.friendList.addFriend(_arg1.playerName);
            };
            this._joinFaction.onPk = function (_arg1:Object):void{
                _view.pkWar.defenderPlayerId = _arg1.playerId;
                _view.pkWar.show();
            };
            this._joinFaction.onSendMessige = function (_arg1:Object):void{
                if (_arg1.playerId == _ctrl.player.playerId){
                    return;
                };
                _view.friendChat.get_friendinfo_chatrecord_list(_arg1.playerId);
            };
            this._joinFaction.onPersonCheck = function (_arg1:Object):void{
                if (_arg1.playerId == _ctrl.player.playerId){
                    return;
                };
                if (_view.otherRoleMsg.inStage){
                    _view.otherRoleMsg.close();
                };
                _view.otherRoleMsg.init(_arg1.playerId, _arg1.name);
                _view.otherRoleMsg.show();
            };
            this._joinFaction.onSelect = function (_arg1:String, _arg2:String):void{
                _seleteFaction = _arg1;
                _seleteMaster = _arg2;
                if (((!((_arg1 == ""))) && (!((_arg2 == ""))))){
                    _seleteFaction = _arg1;
                    _seleteMaster = "";
                };
                faction_List();
            };
            this._joinFaction.onCreate = function (_arg1:String, _arg2:String):void{
                create_faction(_arg1);
            };
            this._joinFaction.onApplyIng = function (_arg1:Boolean):void{
                if (_arg1){
                    _applyStr = 1;
                } else {
                    _applyStr = 0;
                };
                _applyBool = _arg1;
                _seleteFaction = "";
                _seleteMaster = "";
                faction_List();
            };
            this._joinFaction.onCheckFaction = function (_arg1:Object):void{
                if (_isCheckOver == false){
                    return;
                };
                _isCheckOver = false;
                _checkData = _arg1;
                member_list(_arg1.id);
            };
            this._joinFaction.onSendFlower = function (_arg1:Object):void{
                _view.sendFlower.sendPlayerID = _arg1.playerId;
                _view.sendFlower.show();
            };
            this._joinFaction.onClose = function (_arg1:Boolean):void{
                if (_arg1){
                    _view.myFaction.switchSelf();
                } else {
                    close();
                };
            };
        }
        private function joinFactionInfo(_arg1:Array):void{
            this._joinFaction.factionData(_arg1, this._listPageNum, this._listPage, _ctrl.player.nickname, this._applyBool);
        }
        public function set joinFactionType(_arg1:Boolean):void{
            this._factionType = _arg1;
        }
        public function clear():void{
            this._isCheckOver = true;
            this._joinFaction.close();
        }
        public function close():void{
            this._seleteFaction = "";
            this._seleteMaster = "";
            this._factionType = false;
            this.clear();
            _popup.closeView(this);
        }

    }
}//package com.views 
