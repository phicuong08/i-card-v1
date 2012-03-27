//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.data.mission {
    import com.haloer.data.*;
    import com.assist.server.*;

    public class MultiWarData {

        public var multipleTeamId:int;
        public var multipleMissionId:int;
        public var winner:int;
        public var attackerInfo:Array;
        public var attackerIndexes:Object;
        public var defenderInfo:Array;
        public var defenderIndexes:Object;
        public var lineOne:Array;
        public var lineTwo:Array;
        public var lineThree:Array;
        public var awardSkill:int = 0;
        public var awardExperiences:Array;
        public var awardItems:Array;
        public var studyStuntIds:Array;

        public function MultiWarData(){
            this.attackerInfo = [];
            this.attackerIndexes = {};
            this.defenderInfo = [];
            this.defenderIndexes = {};
            this.lineOne = [];
            this.lineTwo = [];
            this.lineThree = [];
            super();
        }
        public function format(_arg1:Array):void{
            var _local2:Object = {};
            oObject.list(_arg1, _local2, ["multipleTeamId", "multipleMissionId", "winner", "attackerInfo", "defenderInfo", "fightResult", "award", "studyStuntIds"]);
            this.multipleTeamId = _local2["multipleTeamId"];
            this.multipleMissionId = _local2["multipleMissionId"];
            this.winner = _local2["winner"];
            this.attackerInfo = this.formatPlayerInfo(_local2["attackerInfo"], true);
            this.defenderInfo = this.formatPlayerInfo(_local2["defenderInfo"], false);
            var _local3:Array = this.formatFightResult(_local2["fightResult"][0]);
            this.lineOne = ((_local3[0]) || ([]));
            this.lineTwo = ((_local3[1]) || ([]));
            this.lineThree = ((_local3[2]) || ([]));
            _local3 = this.formatAward(_local2["award"][0]);
            this.awardSkill = _local3[0];
            this.awardExperiences = _local3[1];
            this.awardItems = _local3[2];
            this.studyStuntIds = _local2["studyStuntIds"];
        }
        private function formatPlayerInfo(_arg1:Array, _arg2:Boolean):Array{
            var _local6:Array;
            var _local7:Array;
            var _local8:int;
            var _local9:int;
            var _local10:String;
            var _local3:Array = [];
            var _local4:int = _arg1.length;
            var _local5:int;
            while (_local5 < _local4) {
                _local6 = _arg1[_local5];
                _local3[_local5] = {};
                oObject.list(_local6, _local3[_local5], ["playerId", "nickName", "mainRoleSign", "level"]);
                _local3[_local5]["nickName"] = WarData.removeNickNameSuffix(((_local3[_local5]["nickName"]) || ("")));
                _local3[_local5]["roleList"] = {};
                _local3[_local5]["mainRoleSuffix"] = WarData.getItemSuffix(parseInt(_local6[5]));
                _local7 = _local6[4];
                _local8 = _local7.length;
                _local9 = 0;
                while (_local9 < _local8) {
                    _local10 = _local7[_local9][1];
                    _local3[_local5]["roleList"][_local10] = {};
                    oObject.list(_local7[_local9], _local3[_local5]["roleList"][_local10], ["sign", "stations", "health", "maxHealth"]);
                    _local3[_local5]["roleList"][_local10]["stations"] = ("A" + _local3[_local5]["roleList"][_local10]["stations"]);
                    _local9++;
                };
                if (_arg2){
                    this.attackerIndexes[_local3[_local5]["playerId"]] = _local5;
                } else {
                    this.defenderIndexes[_local3[_local5]["playerId"]] = _local5;
                };
                _local5++;
            };
            return (_local3);
        }
        private function formatFightResult(_arg1:Array):Array{
            var _local5:Array;
            var _local6:int;
            var _local7:int;
            var _local8:WarData;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = _arg1[_local4];
                _local6 = _local5.length;
                _local7 = 0;
                while (_local7 < _local6) {
                    _local8 = new WarData();
                    _local8.format([0, 0, 0, [_local5[_local7]]]);
                    if (_local2[_local4] == undefined){
                        _local2[_local4] = [];
                    };
                    _local2[_local4].push(_local8);
                    _local7++;
                };
                _local4++;
            };
            return (_local2);
        }
        private function formatAward(_arg1:Array):Array{
            if (_arg1.length == 0){
                return ([0, [], []]);
            };
            return ([_arg1[0], this.formatAwardExperiences(_arg1[1]), this.formatAwardItems(_arg1[2])]);
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
        public function isAttacker(_arg1:int):Boolean{
            return (!((this.attackerIndexes[_arg1] == null)));
        }

    }
}//package com.assist.data.mission 
