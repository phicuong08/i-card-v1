//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import flash.geom.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class SealSoulView extends Base implements IView {

        private var _isUser:Boolean = false;
        private var _isTenTimes:Boolean = false;
        private var _showRoleId:int = 0;
        private var _mainRoleId:int = 0;
        private var _isAuto:Boolean = false;
        private var _succinctNum:int = 0;
        private var _alert:IAlert;
        private var _sealSoul:ISealSoul;
        private var _aciviationId:int = 0;
        private var _playerSoulId:int = 0;
        private var _attributeId:int = 0;
        private var _buyId:int = 0;
        private var _salePrice:int = 0;
        private var _stoneNum:int = 0;
        private var _oldAId:int = 0;

        public function SealSoulView(){
            _inStageTipTitle = SealSoulViewLang.inStageTipTitle;
            _inStageTipContent = "";
        }
        public function soul_info_by_location():void{
            _data.call(Mod_SealSoul_Base.soul_info_by_location, this.soulInfoListCallBack, []);
        }
        private function get_role_list():void{
            _data.call(Mod_Role_Base.get_simple_role_list, this.getRoleListCallBack, [this._ctrl.player.playerId]);
        }
        private function get_item_info_by_role_id(_arg1:int):void{
            _data.call(Mod_SealSoul_Base.get_item_info_by_role_id, this.itemInfoByRoleIdCallBack, [_arg1]);
        }
        private function swap_soul(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
            _data.call(Mod_SealSoul_Base.swap_soul, this.swapSoulCallBack, [_arg1, _arg2, _arg3, _arg4]);
        }
        private function move_soul(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
            _data.call(Mod_SealSoul_Base.move_soul, this.moveSoulCallBack, [_arg1, _arg2, _arg3, _arg4]);
        }
        private function open_player_soul_key(_arg1:int):void{
            _data.call(Mod_SealSoul_Base.open_player_soul_key, this.openPlayerSoulKeyCallBack, [_arg1]);
        }
        private function soul_attribute_reset(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
            this._isUser = true;
            _data.call(Mod_SealSoul_Base.soul_attribute_reset, this.soulAttributeResetCallBack, [_arg1, _arg2, _arg3, _arg4]);
        }
        private function get_ten_times_reset_value(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
            this._isUser = true;
            this._isTenTimes = true;
            _data.call(Mod_SealSoul_Base.get_ten_times_reset_value, this.tenTimesResetCallBack, [_arg1, _arg2, _arg3, _arg4]);
        }
        private function set_player_soul_value(_arg1:int):void{
            _data.call(Mod_SealSoul_Base.set_player_soul_value, this.playerSoulValeCallBack, [_arg1]);
        }
        public function get_tower_key():void{
            _data.call(Mod_SealSoul_Base.get_tower_key, this.getTowerKeyCallBack, []);
        }
        public function sell_player_soul(_arg1:int):void{
            _data.call(Mod_SealSoul_Base.sell_player_soul, this.sellPlayerSoulCallBack, [_arg1]);
        }
        public function get_reset_count():void{
            _data.call(Mod_SealSoul_Base.get_reset_count, this.getResetCountCallBack, []);
        }
        public function get_stone_count():void{
            _data.call(Mod_SealSoul_Base.get_stone_count, this.getStoneCountCallBack, []);
        }
        public function lock(_arg1:int):void{
            _data.call(Mod_SealSoul_Base.lock, this.lockCallBack, [_arg1]);
        }
        public function will_to_unlock(_arg1:int):void{
            _data.call(Mod_SealSoul_Base.will_to_unlock, this.willToUnlockCallBack, [_arg1]);
        }
        private function saveLock(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
            _data.call(Mod_SealSoul_Base.save_lock, this.saveLockCallBack, [_arg1, _arg2, _arg3, _arg4]);
        }
        private function getTowerKeyCallBack():void{
            this.get_role_list();
        }
        private function soulInfoListCallBack():void{
            var _local1:Array = _ctrl.sealSoul.soulInfoList;
            this._sealSoul.getWeaponList = _local1;
            var _local2:int = (16 - _local1.length);
            _view.tower.updateBagNum(_local2);
        }
        private function getRoleListCallBack():void{
            var _local1:Array;
            if (inStage){
                _local1 = _ctrl.upgrade.getSimpleRoleList();
                this.extractionRole(_local1);
            } else {
                this.renderShow();
            };
        }
        private function extractionRole(_arg1:Array):void{
            var _local6:Object;
            var _local2:int = _arg1.length;
            var _local3:int;
            var _local4:int;
            var _local5:int;
            while (_local5 < _local2) {
                _local6 = _arg1[_local5];
                if (_local6.old_name == _ctrl.player.nickname){
                    _local3 = _local6.roleId;
                    _local4 = _local6.id;
                };
                if (this._showRoleId == _local6.id){
                    this.jobForWeapon(_local6.roleId);
                    this._sealSoul.getPlayerList(_arg1, this._showRoleId);
                    return;
                };
                _local5++;
            };
            this._showRoleId = _local4;
            this.jobForWeapon(_local3);
            this._sealSoul.getPlayerList(_arg1, this._showRoleId);
        }
        private function itemInfoByRoleIdCallBack():void{
            var _local1:Object = _ctrl.sealSoul.itemInfo;
            if (inStage == false){
                return;
            };
            this._sealSoul.getPlayerWeaponInfo = _local1;
            this._sealSoul.getSealSoulList = _local1.soulSealList;
            this.soul_info_by_location();
        }
        private function jobForWeapon(_arg1:int):void{
            var _local2:String = RoleType.getJobSignByRoleId(_arg1);
            this._sealSoul.getJobToSealSoul = _local2;
            this.get_item_info_by_role_id(this._showRoleId);
        }
        private function soulAttributeResetCallBack():void{
            var _local1:Object = _ctrl.sealSoul.soulAtributeReset;
            if (_local1.msg == Mod_SealSoul_Base.SUCCEED){
                this._sealSoul.getSuccinctNum = (this._succinctNum + 1);
                this.get_reset_count();
                this.get_stone_count();
                this.get_item_info_by_role_id(this._showRoleId);
            } else {
                this.renderMsg(_local1.msg);
            };
            this._isUser = false;
        }
        private function tenTimesResetCallBack():void{
            this._isUser = false;
            this._isTenTimes = false;
            var _local1:Object = _ctrl.sealSoul.tenTimesReset;
            if (_local1.msg == Mod_SealSoul_Base.SUCCEED){
                this._sealSoul.getSuccinctNum = (this._succinctNum + 10);
                this.get_reset_count();
                this.get_stone_count();
                this._isAuto = true;
                this.set_player_soul_value(1);
                this._sealSoul.getbatchTrainingList = _local1.attributeList;
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function playerSoulValeCallBack():void{
            var _local1:Object = _ctrl.sealSoul.playerSoulValue;
            if (_local1.msg == Mod_SealSoul_Base.SUCCEED){
                if (this._isAuto == false){
                    _view.showTip(SealSoulViewLang.SaveSuccess, SealSoulViewLang.SoulVale, TipType.Success);
                };
                this.get_item_info_by_role_id(this._showRoleId);
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function sellPlayerSoulCallBack():void{
            var _local1:Object = _ctrl.sealSoul.sellPlayerSoul;
            if (_local1.msg == Mod_SealSoul_Base.SUCCEED){
                _view.showTip(SealSoulViewLang.SellPlayerSoul, Lang.sprintf(SealSoulViewLang.GetStoneSale, this._stoneNum, this._salePrice), TipType.Success);
                this.get_stone_count();
                this.get_item_info_by_role_id(this._showRoleId);
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function openPlayerSoulKeyCallBack():void{
            var _local1:Object = _ctrl.sealSoul.openSoulKey;
            if (_local1.msg == Mod_SealSoul_Base.SUCCEED){
                this.get_item_info_by_role_id(this._showRoleId);
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function swapSoulCallBack():void{
            var _local1:Object = _ctrl.sealSoul.swapSoul;
            if (_local1.msg == Mod_SealSoul_Base.SUCCEED){
            } else {
                this.renderMsg(_local1.msg);
            };
            this.get_item_info_by_role_id(this._showRoleId);
        }
        private function getResetCountCallBack():void{
            var _local1:int = _ctrl.sealSoul.getResetCount;
            this._succinctNum = _local1;
            this._sealSoul.getSuccinctNum = _local1;
        }
        private function getStoneCountCallBack():void{
            var _local1:int = _ctrl.sealSoul.getStoneCount;
            this._sealSoul.getStoneNum = _local1;
        }
        private function moveSoulCallBack():void{
            var _local1:Object = _ctrl.sealSoul.moveSoul;
            if (_local1.msg == Mod_SealSoul_Base.SUCCEED){
            } else {
                this.renderMsg(_local1.msg);
            };
            this.get_item_info_by_role_id(this._showRoleId);
        }
        private function willToUnlockCallBack():void{
            var _local1:Object = _ctrl.sealSoul.getUnLockData;
            if (_local1.msg == Mod_SealSoul_Base.SUCCEED){
                _view.showTip(SealSoulViewLang.WillToUnlock, SealSoulViewLang.SystemInfo, TipType.Success);
                this.get_item_info_by_role_id(this._showRoleId);
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function lockCallBack():void{
            var _local1:Object = _ctrl.sealSoul.getLockData;
            if (_local1.msg == Mod_SealSoul_Base.SUCCEED){
                _view.showTip(SealSoulViewLang.Lock, SealSoulViewLang.SystemInfo, TipType.Success);
                this.get_item_info_by_role_id(this._showRoleId);
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function renderMsg(_arg1:int):void{
            switch (_arg1){
                case Mod_SealSoul_Base.FAILED:
                    _view.showTip(SealSoulViewLang.Failed);
                    break;
                case Mod_SealSoul_Base.NO_ENOUGH_INGOT:
                    _view.showTip(SealSoulViewLang.NoEnoughIngot);
                    break;
                case Mod_SealSoul_Base.NO_ENOUGH_COIN:
                    _view.showTip(SealSoulViewLang.NoEnoughCoin);
                    break;
                case Mod_SealSoul_Base.NO_RECORD:
                    _view.showTip(SealSoulViewLang.NoRecord);
                    break;
            };
        }
        public function set alert(_arg1:IAlert):void{
            this._alert = _arg1;
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        public function refreshSoul():void{
            if (this.inStage == false){
                return;
            };
            this.get_item_info_by_role_id(this._showRoleId);
            this.get_reset_count();
            this.get_stone_count();
        }
        private function saveLockCallBack():void{
            var _local1:Object = _ctrl.sealSoul.saveLock;
            if (_local1.msg == Mod_SealSoul_Base.SUCCEED){
            };
        }
        public function show():void{
            if (this.inStage){
                return;
            };
            if (FunctionType.isOpened(FunctionType.SealSoul)){
                this.get_tower_key();
            } else {
                _view.showTip(SealSoulViewLang.NoOpen);
            };
        }
        public function renderShow():void{
            loadAssets("SealSoul", this.render, SealSoulViewLang.LoadAssets);
        }
        public function render():void{
            this._sealSoul = (_view.getAssetsObject("SealSoul", "SealSoul") as ISealSoul);
            _popup.addView(this, this._sealSoul.content);
            _view.center(sign, this._sealSoul.content);
            this.alert = _view.alert.iAlert;
            this._sealSoul.tip = _view.tip.iTip;
            this._sealSoul.drag = _view.drag.iDrag;
            this._sealSoul.getOpenNum = _ctrl.sealSoul.getTowerKey;
            this._sealSoul.onCheckPlayer = function (_arg1:Object):void{
                _showRoleId = _arg1.id;
                jobForWeapon(_arg1.roleId);
            };
            this._sealSoul.onClose = function ():void{
                close();
            };
            this._sealSoul.onShowChat = function (_arg1:Array):void{
                _view.chat.showMsg(_arg1);
            };
            this._sealSoul.showTip = function (_arg1:String, _arg2:Object=null):void{
                showTip(_arg1, _arg2);
            };
            this._sealSoul.onBuy = function (_arg1:Object, _arg2:int):void{
                var callback:* = null;
                var data:* = _arg1;
                var stoneNum:* = _arg2;
                _salePrice = data.salePrice;
                _stoneNum = stoneNum;
                _buyId = data.playerSoulId;
                if (!_view.getCookie("BuySealSoul")){
                    dialog.yesLabel = SealSoulViewLang.Sure;
                    dialog.cancelLabel = SealSoulViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            _sealSoul.buyLoadData();
                            sell_player_soul(_buyId);
                        };
                        if (_arg1 == AlertButtonType.Cancel){
                            _sealSoul.resetLive();
                        };
                        if (dialog.checked){
                            _view.setCookie("BuySealSoul", true);
                        };
                    };
                    dialog.show(HtmlText.yellow(Lang.sprintf(SealSoulViewLang.BuySeal, HtmlText.format(data.soulName, data.color), stoneNum, data.salePrice)), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    _sealSoul.buyLoadData();
                    sell_player_soul(_buyId);
                };
            };
            this._sealSoul.onChange = function (_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
                _sealSoul.LoadData();
                swap_soul(_arg1, _arg2, _arg3, _arg4);
            };
            this._sealSoul.onMove = function (_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
                _sealSoul.LoadData();
                move_soul(_arg1, _arg2, _arg3, _arg4);
            };
            this._sealSoul.onCloseTraining = function ():void{
                _view.alert.showYesNoMsg(SealSoulViewLang.CloseTraining, SealSoulViewLang.Sure, SealSoulViewLang.Cancel, onCloseTraining);
            };
            this._sealSoul.onSuccinct = function (_arg1:Array, _arg2:int, _arg3:int, _arg4:int, _arg5:String):void{
                var data:* = null;
                var callback:* = null;
                var value:* = 0;
                var money:* = 0;
                var list:* = _arg1;
                var playerSoulId:* = _arg2;
                var openAttributeNum:* = _arg3;
                var noMoneyNum:* = _arg4;
                var tipStr:* = _arg5;
                if (_isUser){
                    _view.showTip(SealSoulViewLang.UserWidth);
                    return;
                };
                var len:* = list.length;
                data = succinct(len, playerSoulId, list);
                if (((!(_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.SoulSuccinct))) && ((noMoneyNum <= 0)))){
                    dialog.yesLabel = SealSoulViewLang.Sure;
                    dialog.cancelLabel = SealSoulViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            soul_attribute_reset(data.playerSoulId, list[0], list[1], list[2]);
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.SoulSuccinct, true);
                        };
                    };
                    value = (10 + (len * 10));
                    money = (10000 + (len * 10000));
                    dialog.show(HtmlText.yellow(tipStr), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    soul_attribute_reset(data.playerSoulId, list[0], list[1], list[2]);
                };
            };
            this._sealSoul.onActivation = function (_arg1:int):void{
                _playerSoulId = _arg1;
                soulActivation(_arg1);
            };
            this._sealSoul.onTraining = function (_arg1:Array, _arg2:int, _arg3:int, _arg4:String):void{
                var data:* = null;
                var callback:* = null;
                var list:* = _arg1;
                var playerSoulId:* = _arg2;
                var openAttributeNum:* = _arg3;
                var tipStr:* = _arg4;
                if (_isUser){
                    _view.showTip(SealSoulViewLang.UserWidth);
                    return;
                };
                var len:* = list.length;
                data = succinct(len, playerSoulId, list);
                if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.SoulTraining2)){
                    dialog.yesLabel = SealSoulViewLang.Sure;
                    dialog.cancelLabel = SealSoulViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            get_ten_times_reset_value(data.playerSoulId, list[0], list[1], list[2]);
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.SoulTraining2, true);
                        };
                    };
                    dialog.show(HtmlText.yellow(tipStr), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    get_ten_times_reset_value(data.playerSoulId, list[0], list[1], list[2]);
                };
            };
            this._sealSoul.onSave = function (_arg1:int):void{
                _isAuto = false;
                set_player_soul_value(_arg1);
            };
            this._sealSoul.onShowBatchTraining = function ():void{
                _view.closeEvent();
                _popup.addExclusiveView(SealSoulView);
            };
            this._sealSoul.onHideBatchTraining = function ():void{
                _view.openEvent();
                _popup.removeExclusiveView(SealSoulView);
            };
            this._sealSoul.onLock = function (_arg1:Object):void{
                var callback:* = null;
                var data:* = _arg1;
                if (!_view.getCookie("sealSoulOnLock")){
                    dialog.yesLabel = SealSoulViewLang.Sure;
                    dialog.cancelLabel = SealSoulViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            lock(data.playerSoulId);
                        };
                        if (dialog.checked){
                            _view.setCookie("sealSoulOnLock", true);
                        };
                    };
                    dialog.show(Lang.sprintf(HtmlText.white(SealSoulViewLang.LockSeal), HtmlText.format(data.soulName, data.color)), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    lock(data.playerSoulId);
                };
            };
            this._sealSoul.onUnLock = function (_arg1:Object):void{
                var callback:* = null;
                var data:* = _arg1;
                if (!_view.getCookie("sealSoulUnLock")){
                    dialog.yesLabel = SealSoulViewLang.Sure;
                    dialog.cancelLabel = SealSoulViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            will_to_unlock(data.playerSoulId);
                        };
                        if (dialog.checked){
                            _view.setCookie("sealSoulUnLock", true);
                        };
                    };
                    dialog.show(Lang.sprintf(HtmlText.white(SealSoulViewLang.UnLockSeal), HtmlText.format(data.soulName, data.color)), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    will_to_unlock(data.playerSoulId);
                };
            };
            this._sealSoul.onOpenSoulShop = function ():void{
                _view.sealStoneShop.switchSelf();
            };
            this._sealSoul.onSaveSoul = function (_arg1:int, _arg2:Array):void{
                saveLock(_arg1, _arg2[0], _arg2[1], _arg2[2]);
            };
            this._sealSoul.init();
            this._sealSoul.isLevel5 = VIPType.check(VIPType.Level5);
            this.getRoleListCallBack();
            this.get_reset_count();
            this.get_stone_count();
            this.reposition();
        }
        public function reposition(_arg1:Boolean=true):void{
            if (inStage == false){
                return;
            };
            var _local2:Point = Structure.stageOffset;
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._sealSoul.reposition(_local2);
            };
        }
        private function showTip(_arg1:String, _arg2:Object):void{
            switch (_arg1){
                case "noOpen":
                    _view.showTip(SealSoulViewLang.noOpen);
                    break;
                case "lockOn":
                    _view.showTip(SealSoulViewLang.lockOn);
                    break;
                case "isNull":
                    _view.showTip(SealSoulViewLang.isNull);
                    break;
                case "noPickWeapon":
                    _view.showTip(SealSoulViewLang.noPickWeapon);
                    break;
                case "soulError":
                    this.get_item_info_by_role_id(this._showRoleId);
                    break;
                case "showTraining":
                    _view.showTip(SealSoulViewLang.showTraining);
                    break;
                case "showSuccinct":
                    _view.showTip(SealSoulViewLang.showSuccinct);
                    break;
                case "IsTrainingShow":
                    _view.showTip(SealSoulViewLang.IsTrainingShow);
                    break;
                case "oldLockOn":
                    this._attributeId = _arg2.AttributeId;
                    _view.alert.showYesNoMsg(SealSoulViewLang.oldLockOn, SealSoulViewLang.Sure, SealSoulViewLang.Cancel, this.onSave);
                    break;
                case "emptySave":
                    _view.showTip(SealSoulViewLang.emptySave);
                    break;
                case "trainingQuality":
                    this._attributeId = _arg2.attributeId;
                    this._oldAId = _arg2.oldAId;
                    if (_arg2.lockList.length < 2){
                        _view.alert.showYesNoMsg(Lang.sprintf(SealSoulViewLang.trainingQuality1, HtmlText.format(((_arg2.name + "+") + _arg2.valueInfo), _arg2.color)), SealSoulViewLang.Sure, SealSoulViewLang.Cancel, this.onLockOn);
                    } else {
                        _view.alert.showYesNoMsg(Lang.sprintf(SealSoulViewLang.trainingQuality2, HtmlText.format(((_arg2.name + "+") + _arg2.valueInfo), _arg2.color)), SealSoulViewLang.Sure, SealSoulViewLang.Cancel, this.onSave2);
                    };
                    break;
            };
            this._sealSoul.resetLive();
        }
        private function succinct(_arg1:int, _arg2:int, _arg3:Array):Object{
            var _local4:Object = {};
            _local4.playerSoulId = _arg2;
            if (_arg1 <= 0){
                _local4.l1id = 0;
                _local4.l2id = 0;
            };
            if (_arg1 == 1){
                _local4.l1id = _arg3[0];
                _local4.l2id = 0;
            };
            if (_arg1 == 2){
                _local4.l1id = _arg3[0];
                _local4.l2id = _arg3[1];
            };
            return (_local4);
        }
        private function soulActivation(_arg1:int):void{
            var callback:* = null;
            var playerSoulId:* = _arg1;
            if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.SoulActivation)){
                this.dialog.yesLabel = SealSoulViewLang.Sure;
                this.dialog.cancelLabel = SealSoulViewLang.Cancel;
                this.dialog.hasCheckbox = true;
                callback = function (_arg1:uint):void{
                    if (_arg1 == AlertButtonType.Yes){
                        open_player_soul_key(playerSoulId);
                    };
                    if (dialog.checked){
                        _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.SoulActivation, true);
                    };
                };
                this.dialog.show(HtmlText.yellow(SealSoulViewLang.SoulActivation), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
            } else {
                this.open_player_soul_key(playerSoulId);
            };
        }
        private function onLockOn(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.set_player_soul_value(this._attributeId);
                    this._sealSoul.isSave = true;
                    this._sealSoul.isLockOn(this._oldAId, true);
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        private function onSave(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this._isAuto = false;
                    this.set_player_soul_value(this._attributeId);
                    this._sealSoul.isSave = true;
                    break;
                case AlertButtonType.No:
                    this._sealSoul.isSave = false;
                    break;
            };
        }
        private function onSave2(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this._isAuto = false;
                    this.set_player_soul_value(this._attributeId);
                    this._sealSoul.isSave = true;
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        private function onCloseTraining(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this._sealSoul.hideTraining();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function clear():void{
            this._sealSoul.clear();
        }
        public function close():void{
            this._isUser = false;
            this._isTenTimes = false;
            this.clear();
            _popup.closeView(this);
            Helper.gc();
        }

    }
}//package com.views 
