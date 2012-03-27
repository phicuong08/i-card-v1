//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;

    public class HeroMissionController extends Base {

        private var _rankobj:Object;
        private var _startPractice:Array;
        private var _cancelPractice:Array;
        private var _quickly:Array;

        public function HeroMissionController():void{
            this._rankobj = {};
            super();
            this._rankobj[Mod_Mission_Base.SCORE_A] = "A";
            this._rankobj[Mod_Mission_Base.SCORE_B] = "B";
            this._rankobj[Mod_Mission_Base.SCORE_C] = "C";
        }
        public function renderTownHeroMission(_arg1:int):Array{
            var _local2:Array = MissionType.getHeroMissionListByTownId(_arg1);
            return (_local2);
        }
        public function get openHeroMission():Object{
            var _local1:Object = {};
            _local1.heroList = [];
            var _local2:Array = _data.heroMission.getHeroMissionList;
            _local1.AllBuyTimes = _local2[1];
            _local1.RemainBuyTimes = _local2[2];
            _local1.BuyPrice = _local2[3];
            var _local3:Array = _local2[0];
            var _local4:int = _local3.length;
            var _local5:int;
            while (_local5 < _local4) {
                _local1.heroList.push(this.heroMissions(_local3[_local5]));
                _local5++;
            };
            return (_local1);
        }
        private function heroMissions(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.id = _arg1[0];
            _local2.isCanChallenge = _arg1[1];
            _local2.rank = this._rankobj[_arg1[2]];
            _local2.isFinished = _arg1[3];
            var _local3:int = MissionType.getMissionMonsterId(_local2.id);
            var _local4:String = MonsterType.getMonsterSign(_local3);
            if (_local4.length <= 1){
                _local4 = "Temp";
            };
            _local2.iconUrl = ((URI.bossUrl + _local4) + ".swf");
            _local2.mousterId = _local3;
            return (_local2);
        }
        public function get buyHeroChallenge():Object{
            var _local1:Array = _data.heroMission.buyHeroChallenge;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get startPractice():Object{
            var _local1:Array = _data.heroMission.startPractice;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.practiceTime = _local1[1];
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
            var _local1:Array = _data.heroMission.getNotify;
            var _local2:Object = {};
            _local2.type = _local1[0];
            _local2.newWarReport = this.renderNewWar(_local1[1]);
            _local2.rankReport = this.renderAwardItem(_local1[2]);
            _local2.emptyBagNumber = _local1[3];
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
                _local5.awardExperience = this.renderExp(_arg1[_local4][0]);
                _local5.awardItem = this.renderAward(_arg1[_local4][1]);
                _local5.worship = _arg1[_local4][2];
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
                _local5.missionId = _arg1[_local4][0];
                _local5.missionName = MissionType.getMissionName(_local5.missionId);
                _local5.awardCoin = _arg1[_local4][1];
                _local5.awardIngot = _arg1[_local4][2];
                _local5.awardSkill = _arg1[_local4][3];
                _local5.awardExperience = this.renderExp(_arg1[_local4][4]);
                _local5.awardItem = this.renderAward(_arg1[_local4][5]);
                _local5.bless = _arg1[_local4][6];
                _local5.worship = _arg1[_local4][7];
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
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        public function get getQuickly():Object{
            var _local1:Array = _data.heroMission.getQuickly;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get continuePracticeInfo():Object{
            var _local1:Array = _data.heroMission.getContinuePracticeInfo;
            var _local2:Object = {};
            _local2.isHeroPractice = _local1[0];
            _local2.townId = _local1[1];
            _local2.missionList = this.renderMonster(_local1[2]);
            _local2.practiceTime = _local1[3];
            return (_local2);
        }
        public function renderMonster(_arg1:Array):Array{
            var _local5:Object;
            var _local2:int = _arg1.length;
            var _local3:Array = [];
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = {};
                _local5.missionId = _arg1[_local4];
                _local5.missionName = MissionType.getMissionName(_local5.missionId);
                _local3.push(_local5);
                _local4++;
            };
            return (_local3);
        }

    }
}//package com.controllers 
