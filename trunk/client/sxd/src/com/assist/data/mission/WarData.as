//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.data.mission {
    import com.assist.server.*;
    import com.haloer.data.*;

    public class WarData {

        public static var getItemSuffix:Function;
        public static var removeNickNameSuffix:Function;

        public var offset:Array;
        public var challenged:Boolean;
        public var winId:int;
        public var attackerId:int;
        public var attackerName:String;
        public var attackerSoldiers:Object;
        public var attackerMainPlayerRoleId:String;
        public var attackerMainRoleSuffix:String;
        public var attackerMainRoleId:int;
        public var attackerLevel:int;
        public var attackerFirstAttack:int;
        public var attackerPetName:String;
        public var attackerPetLevel:int;
        public var attackerPetStep:int;
        public var defenderId:int;
        public var defenderName:String;
        public var defenderSoldiers:Object;
        public var defenderMainPlayerRoleId:String;
        public var defenderMainRoleSuffix:String;
        public var defenderMainRoleId:int;
        public var defenderLevel:int;
        public var defenderFirstAttack:int;
        public var defenderPetName:String;
        public var defenderPetLevel:int;
        public var defenderPetStep:int;
        public var processes:Array;
        public var usedStunt:Array;
        public var awardExperiences:Array;
        public var awardItems:Array;
        public var failureAwardItem:Array;
        public var debugInfo:Array;
        public var reportId:int;

        public function format(_arg1:Array):void{
            var _local2:Object = {};
            oObject.list(_arg1, _local2, ["offX", "offY", "challenged", "warResult", "awardExp", "awardItems", "failureAwardItem", "debugInfo", "reportId"]);
            this.offset = [_local2["offX"], _local2["offY"]];
            this.challenged = _local2["challenged"];
            this.formatWarResult(_local2["warResult"][0]);
            this.awardExperiences = this.formatAwardExperiences(((_local2["awardExp"]) || ([])));
            this.awardItems = this.formatAwardItems(((_local2["awardItems"]) || ([])));
            this.failureAwardItem = this.formatAwardItems(((_local2["failureAwardItem"]) || ([])));
            this.debugInfo = ((_local2["debugInfo"]) || ([]));
            this.reportId = ((_local2["reportId"]) || (0));
        }
        private function formatWarResult(_arg1:Array):void{
            var _local2:Array;
            var _local3:int;
            var _local4:int;
            this.winId = _arg1[0];
            _local2 = _arg1[1][0];
            this.attackerId = _local2[0];
            this.attackerName = removeNickNameSuffix(_local2[1]);
            this.attackerSoldiers = this.formatFighter(_local2[2], true);
            this.attackerMainPlayerRoleId = _local2[3];
            this.attackerMainRoleSuffix = getItemSuffix(parseInt(_local2[4]));
            this.attackerMainRoleId = _local2[5];
            this.attackerLevel = _local2[6];
            this.attackerFirstAttack = _local2[7];
            this.attackerPetName = _local2[8];
            this.attackerPetLevel = _local2[9];
            this.attackerPetStep = _local2[10];
            _local2 = _arg1[1][1];
            this.defenderId = _local2[0];
            this.defenderName = removeNickNameSuffix(_local2[1]);
            this.defenderSoldiers = this.formatFighter(_local2[2], false);
            this.defenderMainPlayerRoleId = _local2[3];
            this.defenderMainRoleSuffix = getItemSuffix(parseInt(_local2[4]));
            this.defenderMainRoleId = _local2[5];
            this.defenderLevel = _local2[6];
            this.defenderFirstAttack = _local2[7];
            this.defenderPetName = _local2[8];
            this.defenderPetLevel = _local2[9];
            this.defenderPetStep = _local2[10];
            this.formatProcesses(_arg1[2]);
        }
        private function formatFighter(_arg1:Array, _arg2:Boolean):Object{
            var _local6:String;
            var _local3:Object = {};
            var _local4:int = _arg1.length;
            var _local5:int;
            while (_local5 < _local4) {
                _local6 = _arg1[_local5][0];
                _local3[_local6] = {};
                oObject.list(_arg1[_local5], _local3[_local6], ["id", "sign", "name", "jobId", "health", "maxHealth", "level", "stations", "momentum"]);
                _local3[_local6]["tempHealth"] = _local3[_local6]["health"];
                _local3[_local6]["stations"] = ((_arg2) ? "A" : "B" + _local3[_local6]["stations"]);
                _local5++;
            };
            return (_local3);
        }
        private function formatProcesses(_arg1:Array):void{
            var _local4:Array;
            var _local5:int;
            var _local6:int;
            var _local7:Array;
            var _local8:Object;
            var _local9:int;
            var _local10:Array;
            var _local11:Array;
            var _local12:Array;
            var _local13:Array;
            var _local14:int;
            var _local2:int = _arg1.length;
            this.processes = [];
            var _local3:int;
            while (_local3 < _local2) {
                this.processes[_local3] = [];
                _local4 = _arg1[_local3][0];
                _local5 = _local4.length;
                _local6 = 0;
                while (_local6 < _local5) {
                    _local7 = _local4[_local6];
                    _local8 = (this.processes[_local3][_local6] = {});
                    oObject.list(_local7, _local8, ["masterId", "masterSoldierId", "stunt", "beStunt", "masterMomentum", "leftHealth", "selfHurt", "slaveId", "attackType", "slaveSignList", "addonItem"]);
                    _local8["stunt"] = this.getStuntSign(_local8["stunt"]);
                    _local10 = _local8["beStunt"];
                    _local8["beStunt"] = [];
                    _local9 = 0;
                    while (_local9 < _local10.length) {
                        _local8["beStunt"].push(this.getStuntSign(((_local10[_local9] is Array)) ? _local10[_local9][0] : _local10[_local9]));
                        _local9++;
                    };
                    _local11 = _local8["addonItem"];
                    _local8["addonItem"] = [];
                    _local9 = 0;
                    while (_local9 < _local11.length) {
                        _local8["addonItem"].push({
                            type:_local11[_local9][0],
                            data:_local11[_local9][1]
                        });
                        _local9++;
                    };
                    _local12 = _local8.slaveSignList;
                    _local13 = [];
                    _local14 = 0;
                    while (_local14 < _local12.length) {
                        _local13[_local14] = {};
                        oObject.list(_local12[_local14], _local13[_local14], ["id", "stunt", "beStunt", "momentum", "hurt", "leftHealth", "hit", "block", "critical"]);
                        _local13[_local14]["stunt"] = this.getStuntSign(_local13[_local14]["stunt"]);
                        _local10 = _local13[_local14]["beStunt"];
                        _local13[_local14]["beStunt"] = [];
                        _local9 = 0;
                        while (_local9 < _local10.length) {
                            _local13[_local14]["beStunt"].push(this.getStuntSign(((_local10[_local9] is Array)) ? _local10[_local9][0] : _local10[_local9]));
                            _local9++;
                        };
                        _local14++;
                    };
                    _local8.slaveSignList = _local13;
                    _local6++;
                };
                _local3++;
            };
        }
        private function getStuntSign(_arg1:Object):String{
 //           return ((/^\d+$/.test(_arg1)) ? RoleStunt.getStuntSign((_arg1 as int)) : (_arg1 as String));
			return "";
        }
        private function formatAwardExperiences(_arg1:Array):Array{
            var _local2:Array = [];
            if (_arg1 == null){
                return (_local2);
            };
            var _local3:int;
            while (_local3 < _arg1.length) {
                _local2[_local3] = {
                    roleId:_arg1[_local3][0],
                    exps:_arg1[_local3][1]
                };
                _local3++;
            };
            return (_local2);
        }
        private function formatAwardItems(_arg1:Array):Array{
            var _local5:Array;
            var _local6:int;
            var _local7:int;
            var _local8:int;
            var _local2:Array = [];
            var _local3:Object = {};
            var _local4:int;
            while (_local4 < _arg1.length) {
                _local5 = _arg1[_local4];
                _local6 = _local5[0];
                _local7 = _local5[(_local5.length - 1)];
                _local8 = ((_local3[_local6] == null)) ? -1 : _local3[_local6];
                if (_local8 == -1){
                    _local8 = _local2.length;
                    _local3[_local6] = _local8;
                    _local2.push({
                        id:_local6,
                        name:ItemType.getName(_local6),
                        count:_local7
                    });
                } else {
                    _local2[_local8]["count"] = (_local2[_local8]["count"] + _local7);
                };
                _local4++;
            };
            return (_local2);
        }
        public function getArmyName(_arg1:Boolean):String{
            return ((_arg1) ? this.attackerName : this.defenderName);
        }

    }
}//package com.assist.data.mission 
