//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.assist.view.pack.*;
    import com.assist.*;
    import com.haloer.data.*;
    import com.assist.server.*;

    public class InheritData extends Base {

        private var _aryRoleList:Array;
        private var _objRoleAttribute:Object = null;
        private var _aryAttributeAfterInherit:Array;
        private var _objInherit:Object;
        private var _objType:Object;
        private var _objAttribute:Object;

        public function InheritData(){
            this._aryRoleList = [];
            this._aryAttributeAfterInherit = [];
            this._objInherit = {};
            this._objType = {
                1:"base_",
                2:"training_",
                3:"drug_"
            };
            this._objAttribute = {
                0:"strength",
                1:"agile",
                2:"intellect"
            };
            super();
        }
        public function get roleList():Array{
            return (this._aryRoleList);
        }
        public function get roleAttribute():Object{
            return (this._objRoleAttribute);
        }
        public function get attributeAfterInherit():Array{
            return (this._aryAttributeAfterInherit);
        }
        public function get roleInherit():Object{
            return (this._objInherit);
        }
        private function sortByLevel(_arg1:Object, _arg2:Object):int{
            var _local3:int = _arg1["level"];
            var _local4:int = _arg2["level"];
            if (_local3 < _local4){
                return (1);
            };
            if (_local3 > _local4){
                return (-1);
            };
            return (0);
        }
        public function role_list(_arg1:Array):void{
            var _local3:Array;
            this._aryRoleList = [];
            var _local2:Object = {};
            for each (_local3 in _arg1[0]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["player_role_id", "role_id", "role_name", "level", "role_job_id"]);
                _local2["role_job_name"] = RoleType.getJobName(_local2["role_job_id"]);
                _local2["url"] = ((URI.iconsUrl + RoleType.getRoleSign(_local2["role_id"])) + ".png");
                this._aryRoleList.push(_local2);
            };
            this._aryRoleList.sort(this.sortByLevel);
        }
        public function role_attribute(_arg1:Array):void{
            var _local4:Array;
            var _local5:int;
            var _local6:int;
            var _local7:int;
            this._objRoleAttribute = {};
            oObject.list(_arg1, this._objRoleAttribute, ["state_id", "state_level"]);
            this._objRoleAttribute["state_name"] = (DuJieType.getSpiritName(this._objRoleAttribute["state_id"]) + DuJieType.getSpiritLevelInfo(this._objRoleAttribute["state_level"]));
            this._objRoleAttribute["state_color"] = DuJieType.getSpiritColor(this._objRoleAttribute["state_id"]);
            var _local2:Array = (_arg1[(_arg1.length - 1)] as Array);
            var _local3:int;
            while (_local3 < _local2.length) {
                _local4 = _local2[_local3];
                _local5 = _local4[0];
                _local6 = 1;
                while (_local6 < _local4.length) {
                    this._objRoleAttribute[(this._objType[_local6] + this._objAttribute[_local5])] = _local4[_local6];
                    _local7 = (this._objRoleAttribute[("total_" + this._objAttribute[_local5])] as int);
                    _local7 = (_local7 + _local4[_local6]);
                    this._objRoleAttribute[("total_" + this._objAttribute[_local5])] = _local7;
                    _local6++;
                };
                _local3++;
            };
        }
        public function attribute_after_inherit(_arg1:Array):void{
            var _local5:Object;
            var _local6:Array;
            var _local7:int;
            var _local8:Array;
            var _local9:Array;
            var _local10:Array;
            var _local11:int;
            var _local12:int;
            var _local13:int;
            var _local14:int;
            var _local15:Array;
            var _local16:int;
            this._aryAttributeAfterInherit = [];
            var _local2:Array = [];
            var _local3:Object = {};
            var _local4:Object = {};
            for each (_local2 in _arg1[0]) {
                _local3 = {};
                oObject.list(_local2, _local3, ["inherit_type", "level", "state_id", "state_level", "ingot", "skill", "coin"]);
                _local3["state_name"] = (DuJieType.getSpiritName(_local3["state_id"]) + DuJieType.getSpiritLevelInfo(_local3["state_level"]));
                _local3["state_color"] = DuJieType.getSpiritColor(_local3["state_id"]);
                _local5 = {};
                _local6 = (_local2[(_local2.length - 2)] as Array);
                _local7 = 0;
                while (_local7 < _local6.length) {
                    _local10 = _local6[_local7];
                    _local11 = _local10[0];
                    _local12 = 1;
                    while (_local12 < _local10.length) {
                        _local5[(this._objType[_local12] + this._objAttribute[_local11])] = _local10[_local12];
                        _local13 = (_local5[("total_" + this._objAttribute[_local11])] as int);
                        _local13 = (_local13 + _local10[_local12]);
                        _local5[("total_" + this._objAttribute[_local11])] = _local13;
                        _local12++;
                    };
                    _local7++;
                };
                _local3["after_inherit_attrib_info"] = _local5;
                _local8 = [];
                _local8[ItemType.WuLiDan] = [];
                _local8[ItemType.JueJiDan] = [];
                _local8[ItemType.FaShuDan] = [];
                for each (_local9 in _local2[(_local2.length - 1)]) {
                    _local4 = {};
                    oObject.list(_local9, _local4, ["itemId", "typeId", "a", "c", "oldTimes"]);
                    _local4["gid"] = 0;
                    _local4["num"] = 0;
                    _local4["ingot"] = 0;
                    _local4["lv"] = ItemBasically.getBasic(_local9[0]).require;
                    _local4["url"] = ItemBasically.getBasic(_local9[0]).getImgUrl(0);
                    _local14 = (_local4["c"] - _local4["oldTimes"]);
                    _local15 = [];
                    _local16 = 1;
                    while (_local16 <= (_local4["a"] / 5)) {
                        if (_local16 <= _local4["oldTimes"]){
                            _local15.push(0);
                        } else {
                            if (_local16 <= _local4["c"]){
                                _local15.push(1);
                            } else {
                                _local15.push(0);
                            };
                        };
                        _local16++;
                    };
                    _local4["effectList"] = _local15;
                    _local8[_local4["typeId"]].push(_local4);
                };
                _local8[ItemType.WuLiDan].sortOn("a", Array.NUMERIC);
                _local8[ItemType.JueJiDan].sortOn("a", Array.NUMERIC);
                _local8[ItemType.FaShuDan].sortOn("a", Array.NUMERIC);
                _local3["after_inherit_drug_info"] = _local8;
                this._aryAttributeAfterInherit.push(_local3);
            };
        }
        public function inherit(_arg1:Array):void{
            this._objInherit = {result:_arg1[0]};
        }

    }
}//package com.datas 
