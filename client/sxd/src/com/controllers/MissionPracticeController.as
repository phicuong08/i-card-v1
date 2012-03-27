//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.protocols.*;
    import com.assist.server.*;

    public class MissionPracticeController extends Base {

        private var _startPractice:Array;
        private var _cancelPractice:Array;
        private var _quickly:Array;

        public function get practiceInfo():Object{
            var _local1:Array = _data.missionPractice.practiceInfo;
            var _local2:Object = this.renderPracticeInfo(_local1);
            return (_local2);
        }
        private function renderPracticeInfo(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.hourPower = _arg1[0];
            _local2.monsterList = this.renderMonster(_arg1[1]);
            _local2.isBoss = _arg1[2];
            if (_local2.isBoss == 0){
                _local2.monsterLen = 3;
            } else {
                _local2.monsterLen = 1;
            };
            _local2.attackPower = _arg1[3];
            return (_local2);
        }
        private function renderMonster(_arg1:Array):Array{
            var _local5:Object;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local5.monsterId = _arg1[_local4][0];
                _local5.monsterName = MonsterType.getMonsterNameById(_arg1[_local4][0]);
                _local5.level = _arg1[_local4][1];
                _local5.number = _arg1[_local4][2];
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        public function get startPractice():Object{
            var _local1:Array = _data.missionPractice.startPractice;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.practiceTime = _local1[1];
            _local2.remainWarTimes = _local1[2];
            return (_local2);
        }
        public function get cancelPractice():Array{
            return (this._cancelPractice);
        }
        public function get quickly():Object{
            var _local1:Array = _data.missionPractice.getQuickly;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.timer = _local1[1];
            return (_local2);
        }
        public function get notify():Object{
            var _local1:Array = _data.missionPractice.getNotify;
            var _local2:Object = {};
            _local2.type = _local1[0];
            _local2.newWarReport = this.renderNewWar(_local1[1]);
            _local2.rankReport = this.renderAwardItem(_local1[2]);
            _local2.remainTime = _local1[3];
            _local2.remainWarTimes = _local1[4];
            return (_local2);
        }
        private function renderNewWar(_arg1:Array):Array{
            var _local5:Object;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local5.type = Mod_MissionPractice_Base.NEW_WAR_REPORT;
                _local5.warMissionIndex = _arg1[_local4][0];
                _local5.warMonsterTeamIndex = _arg1[_local4][1];
                if (_local5.warMonsterTeamIndex == 1){
                    _local5.isFirst = true;
                } else {
                    _local5.isFirst = false;
                };
                _local5.remainWarTimes = _arg1[_local4][2];
                _local5.awardExperience = this.renderExp(_arg1[_local4][3]);
                _local5.awardItem = this.renderAward(_arg1[_local4][4]);
                _local5.worship = _arg1[_local4][5];
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        private function renderAwardItem(_arg1:Array):Array{
            var _local5:Object;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local5.type = Mod_MissionPractice_Base.RANK_REPORT;
                _local5.awardCoin = _arg1[_local4][0];
                _local5.awardIngot = _arg1[_local4][1];
                _local5.awardSkill = _arg1[_local4][2];
                _local5.awardExperience = this.renderExp(_arg1[_local4][3]);
                _local5.awardItem = this.renderAward(_arg1[_local4][4]);
                _local5.bless = _arg1[_local4][5];
                _local5.worship = _arg1[_local4][6];
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        private function renderExp(_arg1:Array):Array{
            var _local5:Object;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local5.roleId = _arg1[_local4][0];
                _local5.experience = _arg1[_local4][1];
                if (_local5.roleId == this._ctrl.player.mainRoleId){
                    _local5.isPlayer = true;
                    _local5.PlayerName = this._ctrl.player.nickname;
                } else {
                    _local5.isPlayer = false;
                    _local5.PlayerName = RoleType.getRoleName(_local5.roleId);
                };
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        private function renderAward(_arg1:Array):Array{
            var _local5:Object;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local5.awardId = _arg1[_local4][0];
                _local5.awardName = ItemType.getName(_local5.awardId);
                _local5.color = ItemType.getItemColor(_local5.awardId);
                _local5.isQuest = (_arg1[_local4][2] == ItemType.QuestItemTypeId);
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        public function get continuePracticeInfo():Object{
            var _local1:Array = _data.missionPractice.continuePracticeInfo;
            var _local2:Object = {};
            _local2.practiceInfo = this.renderPracticeInfo(_local1);
            _local2.missionId = _local1[4];
            _local2.timeType = _local1[5];
            _local2.remainWarTimes = _local1[6];
            _local2.remainTime = _local1[7];
            _local2.isAutoSaleItem = _local1[8];
            return (_local2);
        }
        public function get cancelAutoSale():Object{
            var _local1:Array = _data.missionPractice.CancelAutoSale;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get setAutoSale():Object{
            var _local1:Array = _data.missionPractice.SetAutoSale;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }

    }
}//package com.controllers 
