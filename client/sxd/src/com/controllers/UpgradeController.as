//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.server.*;

    public class UpgradeController extends Base {

        public function getEquipmentList():Array{
            return (this._data.upgrade.getEquipmentList());
        }
        public function getEquipmentListRoleID():Object{
            return (this._data.upgrade.getEquipmentListRoleID());
        }
        public function getUpgradeProbability():int{
            return (this._data.upgrade.getUpgradeProbability);
        }
        public function getUpgradeTyep():int{
            return (this._data.upgrade.getUpgradeTyep);
        }
        public function getFullProbIngot():int{
            return (this._data.upgrade.getFullProbIngot);
        }
        public function upgradeEquipment():Object{
            return (this._data.upgrade.getUpgradeEquipResult());
        }
        public function clearUpgradeCdTime():int{
            return (this._data.upgrade.clearUpgradeCdTime);
        }
        public function upgradeEquipmentInfo():Object{
            return (this._data.upgrade.getUpgradeEquipInfo());
        }
        public function openUpgradeOpportunity():Object{
            return (this._data.upgrade.openUpgradeOpportunity());
        }
        public function getEquipUpgradeStatList():Array{
            return (this._data.upgrade.getEquipUpgradeStatList());
        }
        public function openMoreIngot():int{
            return (this._data.upgrade.openMoreIngot());
        }
        public function permanentCleanItemUpdateCd():Object{
            return (this._data.upgrade.permanentCleanItemUpdateCd());
        }
        public function getPermanentCleanItemUpdateCd():Object{
            return (this._data.upgrade.getPermanentCleanItemUpdateCd());
        }
        public function getSimpleRoleList():Array{
            var _local1:Object;
            for each (_local1 in _data.rolemsg.simpleRoleList) {
                if (_local1["id"] == this._ctrl.player.mainPlayerRoleId){
                    _local1["name"] = this._ctrl.player.removeNickNameSuffix(this._ctrl.player.nickname);
                    _local1["sign"] = RoleType.getRoleSign(_local1.roleId);
                    _local1["signSuffix"] = this._ctrl.player.playerInfo.signSuffix;
                } else {
                    _local1["name"] = RoleType.getRoleName(_local1["roleId"]);
                    _local1["sign"] = RoleType.getRoleSign(_local1.roleId);
                    _local1["signSuffix"] = "";
                };
                _local1["old_name"] = _local1["name"];
                _local1["name"] = this.changStringLength(_local1["name"]);
            };
            this._data.rolemsg.simpleRoleList.sort(this.roleSort);
            return (this._data.rolemsg.simpleRoleList);
        }
        private function roleSort(_arg1:Object, _arg2:Object):int{
            if (_arg1["id"] == this._ctrl.player.mainPlayerRoleId){
                return (-1);
            };
            if (_arg2["id"] == this._ctrl.player.mainPlayerRoleId){
                return (1);
            };
            if (_arg1["is_deploy"] < _arg2["is_deploy"]){
                return (-1);
            };
            if (_arg1["is_deploy"] > _arg2["is_deploy"]){
                return (1);
            };
            if (_arg1["level"] > _arg2["level"]){
                return (-1);
            };
            if (_arg1["level"] < _arg2["level"]){
                return (1);
            };
            return (0);
        }
        public function get isEquipDataReturn():Boolean{
            return (this._data.upgrade.isEquipDataReturn);
        }
        private function changStringLength(_arg1:String):String{
            var _local2:int;
            var _local3:int;
            while (_local3 < _arg1.length) {
                if (_arg1.charCodeAt(_local3) > 127){
                    _local2 = (_local2 + 2);
                } else {
                    _local2 = (_local2 + 1);
                };
                if (_local2 > 8){
                    if (_arg1.charCodeAt((_local3 - 1)) > 127){
                        return ((_arg1.substr(0, (_local3 - 1)) + "..."));
                    };
                    return ((_arg1.substr(0, (_local3 - 2)) + "..."));
                };
                _local3++;
            };
            return (_arg1);
        }

    }
}//package com.controllers 
