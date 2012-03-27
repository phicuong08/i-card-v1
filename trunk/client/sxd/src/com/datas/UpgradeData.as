//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import flash.utils.*;
    import com.assist.view.pack.*;
    import com.haloer.data.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.datas.*;

    public class UpgradeData extends Base {

        private var _aryEquipUpgradeStat:Array;
        private var _aryUpgradeEquipment:Array;
        private var _aryClearUpgradeCdTime:Array;
        private var _aryOpenUpgradeOpportunity:Array;
        private var _aryEquipUpgradeStatList:Array;
        private var _aryGetEquipmentList:Array;
        private var _aryUpgradeEquip:Array;
        private var _objPermanentCleanItemUpdateCd:Object;
        private var _objGetPermanentCleanItemUpdateCd:Object;
        private var _timeId:int = 0;
        private var _reqList:Array;
        public var isEquipDataReturn:Boolean = true;

        public function UpgradeData(){
            this._objPermanentCleanItemUpdateCd = {};
            this._objGetPermanentCleanItemUpdateCd = {};
            this._reqList = [];
            super();
        }
        public function getEquipmentList():Array{
            var _local2:Object;
            var _local3:Array;
            var _local1:Array = [];
            for each (_local3 in this._aryGetEquipmentList[1]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["player_item_id", "item_id", "player_role_id", "upgrade_level", "upgrade_price", "gold_oil_id"]);
                this.getItemInfo(_local2);
                if (_local2["type_id"] == ItemType.WuQi){
                    _local2["sort"] = 1;
                };
                if (_local2["type_id"] == ItemType.HunQi){
                    _local2["sort"] = 2;
                };
                if (_local2["type_id"] == ItemType.TouKui){
                    _local2["sort"] = 3;
                };
                if (_local2["type_id"] == ItemType.YiFu){
                    _local2["sort"] = 4;
                };
                if (_local2["type_id"] == ItemType.XieZi){
                    _local2["sort"] = 5;
                };
                if (_local2["type_id"] == ItemType.HuFu){
                    _local2["sort"] = 6;
                };
                _local1.push(_local2);
            };
            _local1.sortOn(["sort", "item_id"], Array.NUMERIC);
            return (_local1);
        }
        public function getEquipmentListRoleID():Object{
            var _local1:Object = {player_role_id:this._aryGetEquipmentList[0]};
            return (_local1);
        }
        public function getUpgradeEquipResult():Object{
            var _local1:Object = {};
            oObject.list(this._aryUpgradeEquip, _local1, ["result"]);
            return (_local1);
        }
        public function getUpgradeEquipInfo():Object{
            if (this._aryUpgradeEquip[1][0] == undefined){
                return (null);
            };
            var _local1:Object = {};
            oObject.list(this._aryUpgradeEquip[1][0], _local1, ["player_item_id", "item_id", "player_role_id", "upgrade_level", "upgrade_price", "gold_oil_id"]);
            this.getItemInfo(_local1);
            return (_local1);
        }
        public function get getUpgradeProbability():int{
            var _local1:int = this._aryEquipUpgradeStat[0];
            return (_local1);
        }
        public function get getUpgradeTyep():int{
            var _local1:int = this._aryEquipUpgradeStat[1];
            return (_local1);
        }
        public function get getFullProbIngot():int{
            var _local1:int = this._aryEquipUpgradeStat[2];
            return (_local1);
        }
        public function get clearUpgradeCdTime():int{
            var _local1:int = this._aryClearUpgradeCdTime[0];
            return (_local1);
        }
        public function openUpgradeOpportunity():Object{
            var _local1:Object = {};
            oObject.list(this._aryOpenUpgradeOpportunity, _local1, ["reslut", "upgrade_id", "cd_time"]);
            return (_local1);
        }
        public function getEquipUpgradeStatList():Array{
            var _local2:Object;
            var _local3:Array;
            var _local1:Array = [];
            for each (_local3 in this._aryEquipUpgradeStatList[1]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["upgrade_id", "cd_time", "ingot"]);
                _local1.push(_local2);
            };
            _local1.sort(this.sortByCdTime);
            return (_local1);
        }
        public function openMoreIngot():int{
            return (this._aryEquipUpgradeStatList[0]);
        }
        public function permanentCleanItemUpdateCd():Object{
            return (this._objPermanentCleanItemUpdateCd);
        }
        public function getPermanentCleanItemUpdateCd():Object{
            return (this._objGetPermanentCleanItemUpdateCd);
        }
        private function getItemInfo(_arg1:Object):void{
            _arg1["type_id"] = ItemType.getTypeId(_arg1["item_id"]);
            _arg1["upgrade_level_name"] = ItemType.getItemUpgrade(_arg1["upgrade_level"]);
            _arg1["description"] = ItemType.getDescription(_arg1["item_id"]);
            var _local2:ItemBasically = ItemBasically.empty;
            _local2 = ItemBasically.getBasic(_arg1["item_id"]);
            _arg1["name"] = _local2.getItemName(_arg1["gold_oil_id"]);
            _arg1["color"] = _local2.getItemColor(_arg1["gold_oil_id"]);
            _arg1["health"] = _local2.getHealthValue(_arg1["upgrade_level"], _arg1["gold_oil_id"]);
            _arg1["attack"] = _local2.getPAttackValue(_arg1["upgrade_level"], _arg1["gold_oil_id"]);
            _arg1["defense"] = _local2.getPDefenseValue(_arg1["upgrade_level"], _arg1["gold_oil_id"]);
            _arg1["stunt_attack"] = _local2.getSAttackValue(_arg1["upgrade_level"], _arg1["gold_oil_id"]);
            _arg1["stunt_defense"] = _local2.getSDefenseValue(_arg1["upgrade_level"], _arg1["gold_oil_id"]);
            _arg1["magic_attack"] = _local2.getMAttackValue(_arg1["upgrade_level"], _arg1["gold_oil_id"]);
            _arg1["magic_defense"] = _local2.getMDefenseValue(_arg1["upgrade_level"], _arg1["gold_oil_id"]);
            _arg1["url"] = _local2.getImgUrl(_arg1["gold_oil_id"]);
            this.setAttrib(_arg1);
        }
        private function setAttrib(_arg1:Object):Object{
            var _local2:String = "";
            if (_arg1["health"] != 0){
                if (_local2 != ""){
                    _local2 = (_local2 + "\r");
                };
                _local2 = (_local2 + (UpgradeDataLang.Health + _arg1["health"]));
            };
            if (_arg1["attack"] != 0){
                if (_local2 != ""){
                    _local2 = (_local2 + "\r");
                };
                _local2 = (_local2 + (UpgradeDataLang.Attack + _arg1["attack"]));
            };
            if (_arg1["defense"] != 0){
                if (_local2 != ""){
                    _local2 = (_local2 + "\r");
                };
                _local2 = (_local2 + (UpgradeDataLang.Defense + _arg1["defense"]));
            };
            if (_arg1["stunt_attack"] != 0){
                if (_local2 != ""){
                    _local2 = (_local2 + "\r");
                };
                _local2 = (_local2 + (UpgradeDataLang.StuntAttack + _arg1["stunt_attack"]));
            };
            if (_arg1["stunt_defense"] != 0){
                if (_local2 != ""){
                    _local2 = (_local2 + "\r");
                };
                _local2 = (_local2 + (UpgradeDataLang.StuntDefense + _arg1["stunt_defense"]));
            };
            if (_arg1["magic_attack"] != 0){
                if (_local2 != ""){
                    _local2 = (_local2 + "\r");
                };
                _local2 = (_local2 + (UpgradeDataLang.MagicAttack + _arg1["magic_attack"]));
            };
            if (_arg1["magic_defense"] != 0){
                if (_local2 != ""){
                    _local2 = (_local2 + "\r");
                };
                _local2 = (_local2 + (UpgradeDataLang.MagicDefense + _arg1["magic_defense"]));
            };
            _arg1.attrib = _local2;
            return (_arg1);
        }
        private function sortByCdTime(_arg1:Object, _arg2:Object):int{
            var _local3:int = _arg1["cd_time"];
            var _local4:int = _arg2["cd_time"];
            if (_local3 < _local4){
                return (1);
            };
            if (_local3 > _local4){
                return (-1);
            };
            return (0);
        }
        public function get_equipment_list(_arg1:Array):void{
            var _local2:Array;
            var _local3:int;
            this._aryGetEquipmentList = _arg1;
            for each (_local2 in this._aryGetEquipmentList[1]) {
                _local3 = _local2[1];
                this.isEquipDataReturn = false;
                this._reqList[_local3] = [_local3];
                if (this._timeId == 0){
                    this._timeId = setTimeout(this.get_item_basical_infos, 20);
                };
            };
        }
        private function get_item_basical_infos():void{
            var _local2:Array;
            this._timeId = 0;
            var _local1:Array = [];
            for each (_local2 in this._reqList) {
                _local1.push(_local2);
            };
            _data.call(Mod_Item_Base.get_item_basical_infos, this.getItemBasicalInfosCallBack, [_local1]);
        }
        private function getItemBasicalInfosCallBack():void{
            this.isEquipDataReturn = true;
        }
        public function upgrade_equip(_arg1:Array):void{
            this._aryUpgradeEquip = _arg1;
        }
        public function equip_upgrade_stat(_arg1:Array):void{
            this._aryEquipUpgradeStat = _arg1;
        }
        public function clear_upgrade_cd_time(_arg1:Array):void{
            this._aryClearUpgradeCdTime = _arg1;
        }
        public function open_upgrade_opportunity(_arg1:Array):void{
            this._aryOpenUpgradeOpportunity = _arg1;
        }
        public function equip_upgrade_stat_list(_arg1:Array):void{
            this._aryEquipUpgradeStatList = _arg1;
        }
        public function permanent_clean_item_update_cd(_arg1:Array):void{
            this._objPermanentCleanItemUpdateCd = {result:_arg1[0]};
        }
        public function get_permanent_clean_item_update_cd(_arg1:Array):void{
            this._objGetPermanentCleanItemUpdateCd = {state:_arg1[0]};
        }

    }
}//package com.datas 
