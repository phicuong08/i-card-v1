//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class UpgradeView extends Base implements IView {

        private var _upgrade:IUpgrade;
        private var _aryUpgradeList:Array;
        private var _intPreviousEquipID:int;
        private var _pageSize:int = 15;
        private var _blnFirstOpenUI:Boolean = true;
        private var _blnInUpgrade:Boolean = false;

        public function UpgradeView(){
            this._aryUpgradeList = [];
            super();
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        public function show():void{
            if (_view.factionWarMap.isFactionWarStart == true){
                return;
            };
            this.loadData();
        }
        public function close():void{
            this.clear();
            this._intPreviousEquipID = this._upgrade.previousEquipID;
            _popup.closeView(this);
            this._view.guide.trackUpgrade(4, _view.toolbar.questTraceContent);
        }
        public function clear():void{
            this._upgrade.clear();
            this.dialog.hide();
            Helper.gc();
        }
        public function set updateCoins(_arg1:Number):void{
            if (inStage){
                this._upgrade.myCoins = _arg1;
                this._upgrade.updateCoins();
            };
        }
        private function loadData():void{
            _data.call(Mod_Role_Base.get_simple_role_list, this.loadDataCallBack, [this._ctrl.player.playerId], false);
        }
        private function loadDataCallBack():void{
            loadAssets("Upgrade", this.render, UpgradeViewLang.LoadInfo);
        }
        private function render():void{
            if (this._upgrade == null){
                this._upgrade = (_view.getAssetsObject("Upgrade", "Upgrade") as IUpgrade);
            };
            this.init();
            this.get_equipment_list();
            this.getSimpleRoleListCallBack();
        }
        private function init():void{
            this._blnFirstOpenUI = true;
            this._upgrade.myLevel = this._ctrl.player.level;
            this._upgrade.myCoins = this._ctrl.player.coins;
            this._upgrade.tip = _view.tip.iTip;
            this._upgrade.drag = _view.drag.iDrag;
            this._upgrade.onCloseBtn = this.close;
            this._upgrade.onEquipmentData = this.get_equipment_list;
            this._upgrade.onLevelUpBtn = this.upgrade_equip;
            this._upgrade.onShowInsufficientCoins = this.showInsufficientCoins;
            this._upgrade.pageCurrent = 1;
            this._upgrade.init(this._intPreviousEquipID, 0);
        }
        private function showUI():void{
            _popup.addView(this, this._upgrade.content);
            _view.center(sign, this._upgrade.content);
        }
        private function getPageCount(_arg1:Array):int{
            return (Math.ceil((_arg1.length / this._pageSize)));
        }
        private function setCurrentPage(_arg1:Array):int{
            var _local5:Object;
            var _local2:int = this._upgrade.pageCurrent;
            if (this._intPreviousEquipID == 0){
                return (_local2);
            };
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = _arg1[_local4];
                if (this._intPreviousEquipID == _local5["player_item_id"]){
                    _local2 = Math.ceil(((_local4 + 1) / this._pageSize));
                    break;
                };
                _local4++;
            };
            return (_local2);
        }
        private function showInsufficientCoins():void{
            if (((((this._view.activities.isLoaderActivitie(FunctionType.Rune)) && (this.inStage))) && (!(this._view.rune.inStage)))){
                this._view.processTip.openCoinsInsufficient();
            };
        }
        private function get_simple_role_list():void{
            this._data.call(Mod_Role_Base.get_simple_role_list, this.getSimpleRoleListCallBack, [this._ctrl.player.playerId], false);
        }
        private function getSimpleRoleListCallBack():void{
            var _local1:Array = this._ctrl.upgrade.getSimpleRoleList();
            this._upgrade.renderRoleList(_local1);
        }
        private function get_equipment_list():void{
            this._upgrade.myLevel = this._ctrl.player.level;
            this._upgrade.myCoins = this._ctrl.player.coins;
            var _local1:Array = [];
            if (this._blnFirstOpenUI){
                _local1 = [this._intPreviousEquipID, this._ctrl.player.mainPlayerRoleId];
            } else {
                _local1 = [0, this._upgrade.currentRoleID];
            };
            this._data.call(Mod_Item_Base.get_equipment_list, this.getEquipmentListTimeOut, _local1);
        }
        private function getEquipmentListTimeOut():void{
            if (this._ctrl.upgrade.isEquipDataReturn){
                this.equipmentListCallBack();
            } else {
                setTimeout(this.getEquipmentListTimeOut, 20);
            };
        }
        private function equipmentListCallBack():void{
            var _local1:Object = this._ctrl.upgrade.getEquipmentListRoleID();
            this._upgrade.currentRoleID = _local1["player_role_id"];
            var _local2:Array = this._ctrl.upgrade.getEquipmentList();
            this._upgrade.pageCount = this.getPageCount(_local2);
            this._upgrade.pageCurrent = this.setCurrentPage(_local2);
            this._intPreviousEquipID = 0;
            _local2 = _local2.slice(((this._upgrade.pageCurrent - 1) * this._pageSize), (this._upgrade.pageCurrent * this._pageSize));
            this._upgrade.renderEquipmentList(_local2);
            if (this._blnFirstOpenUI){
                this.showUI();
                this._blnFirstOpenUI = false;
            };
            _view.guide.trackUpgrade(2, this._upgrade.content);
            if (_local2.length == 0){
                _view.guide.trackUpgrade(3, this._upgrade.content);
            };
        }
        private function upgrade_equip():void{
            if (this._blnInUpgrade){
                return;
            };
            this._blnInUpgrade = true;
            var _local1:Array = [this._upgrade.equipmentID, 100, 0];
            this._data.call(Mod_Item_Base.upgrade_equip, this.upgradeEquipmentCallBacek, _local1);
        }
        private function upgradeEquipmentCallBacek():void{
            var _local1:Object = this._ctrl.upgrade.upgradeEquipment();
            var _local2:Object = this._ctrl.upgrade.upgradeEquipmentInfo();
            if (_local1["result"] == Mod_Item_Base.ACTION_SUCCESS){
                this._upgrade.renderUpgradeSuccess(_local2);
                this._upgrade.showUpgrageMessage(this.upgradeMessage(_local1["result"]), 0xFFF200);
            } else {
                if (_local1["result"] == Mod_Item_Base.LOW_SUCCESS_RATE){
                    this._upgrade.renderUpgradeUnSucess();
                    this._upgrade.showUpgrageMessage(Lang.sprintf(UpgradeViewLang.UpgradeReturn, this.upgradeMessage(_local1["result"]), Math.floor((_local2["upgrade_price"] / 2))), 15073811);
                } else {
                    _view.showTip(this.upgradeMessage(_local1["result"]));
                };
            };
            this._blnInUpgrade = false;
            this._view.guide.trackUpgrade(3, this._upgrade.content);
        }
        private function upgradeMessage(_arg1:int):String{
            var _local2:String;
            switch (_arg1){
                case Mod_Item_Base.ACTION_SUCCESS:
                    _local2 = UpgradeViewLang.ActionSuccess;
                    break;
                case Mod_Item_Base.PLAYER_ITEM_NO_EXIST:
                    _local2 = UpgradeViewLang.PlayerItemNoExist;
                    break;
                case Mod_Item_Base.LEVEL_LIMIT:
                    _local2 = UpgradeViewLang.LevelLimit;
                    break;
                case Mod_Item_Base.INSUFFICIENT_COINS:
                case Mod_Item_Base.INSUFFICIENT_COIN:
                    _local2 = UpgradeViewLang.InsufficientCoin;
                    break;
                case Mod_Item_Base.PROBABILITY_CHANGE:
                    _local2 = UpgradeViewLang.ProbabilityChange;
                    break;
                case Mod_Item_Base.COOLDOWN_TIME:
                    _local2 = UpgradeViewLang.CoolDownTime;
                    break;
                case Mod_Item_Base.LOW_SUCCESS_RATE:
                    _local2 = UpgradeViewLang.LowSuccessRate;
                    break;
                case Mod_Item_Base.INSUFFICIENT_INGOT:
                    _local2 = UpgradeViewLang.InsufficientIngot;
                    break;
                case Mod_Item_Base.ZERO_CD_TIME:
                    _local2 = UpgradeViewLang.ZeroCdTime;
                    break;
                case Mod_Item_Base.ALREADY_HAVE:
                    _local2 = UpgradeViewLang.AlreadyHave;
                    break;
                case Mod_Item_Base.NOSUITEROLELEVEL:
                    _local2 = UpgradeViewLang.NoSuiteroLelevel;
                    break;
                case Mod_Item_Base.NOVIPLEVEL:
                    _local2 = UpgradeViewLang.NoVipLevel;
                    break;
                case Mod_Item_Base.NOUPGRADEQUEUE:
                    _local2 = UpgradeViewLang.NoUpgradeQueue;
                    break;
                default:
                    _local2 = (UpgradeViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 
