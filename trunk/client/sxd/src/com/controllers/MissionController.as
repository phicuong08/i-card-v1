//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import flash.utils.*;
    import com.datas.*;
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;

    public class MissionController extends com.controllers.Base {

        public var ownData:MissionData;
        private var _rankobj:Object;

        public function MissionController():void{
            this._rankobj = {};
            super();
            this._rankobj[Mod_Mission_Base.SCORE_A] = "A";
            this._rankobj[Mod_Mission_Base.SCORE_B] = "B";
            this._rankobj[Mod_Mission_Base.SCORE_C] = "C";
        }
        public function get result():int{
            return (_data.mission.result);
        }
        public function get missionId():int{
            return (_data.mission.missionId);
        }
        public function get missionLock():int{
            return (_data.mission.missionLock);
        }
        public function get monsterLock():int{
            return (_data.mission.monsterLock);
        }
        public function renderTownMission(_arg1:int):Array{
            return (MissionType.getNormalMissionListByTownId(_arg1));
        }
        public function renderTownHeroMission(_arg1:int):Array{
            return (MissionType.getHeroMissionListByTownId(_arg1));
        }
        public function get openMission():Array{
            var _local3:int;
            var _local4:int;
            var _local1:Array = [];
            var _local2:Array = this.ownData.sectionsList;
            if (_local2 != null){
                _local3 = _local2.length;
                _local4 = 0;
                while (_local4 < _local3) {
                    _local1.push(this.missions(_local2[_local4]));
                    _local4++;
                };
            };
            return (_local1);
        }
        public function get openHeroMission():Array{
            var _local3:int;
            var _local4:int;
            var _local1:Array = [];
            var _local2:Array = this.ownData.getHeroMissionList;
            if (_local2 != null){
                _local3 = _local2.length;
                _local4 = 0;
                while (_local4 < _local3) {
                    _local1.push(this.heroMissions(_local2[_local4]));
                    _local4++;
                };
            };
            return (_local1);
        }
        private function heroMissions(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.id = _arg1[0];
            _local2.status = _arg1[1];
            _local2.isVip3 = VIPType.check(VIPType.Level3);
            _local2.buyStatus = _arg1[2];
            _local2.buyPrice = _arg1[3];
            _local2.rank = this._rankobj[_arg1[4]];
            _local2.isFinished = _arg1[5];
            _local2.allBuyTimes = _arg1[6];
            _local2.remainBuyTimes = _arg1[7];
            var _local3:int = MissionType.getMissionMonsterId(_local2.id);
            var _local4:String = MonsterType.getMonsterSign(_local3);
            if (_local4.length <= 1){
                _local4 = "Temp";
            };
            _local2.iconUrl = ((URI.bossUrl + _local4) + ".swf");
            _local2.mousterId = _local3;
            return (_local2);
        }
        private function missions(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.id = _arg1[0];
            _local2.status = _arg1[1];
            _local2.rank = this._rankobj[_arg1[2]];
            _local2.isBoss = _arg1[3];
            _local2.iconUrl = "";
            if (_local2.status != 0){
                _local2.isPractice = true;
            } else {
                _local2.isPractice = false;
            };
            if (_local2.isBoss == 0){
                _local2.monsterLen = 3;
            } else {
                _local2.monsterLen = 1;
            };
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
        public function get warData():WarData{
            return (this.ownData.warData);
        }
        public function get warStatus():int{
            return (this.ownData.warStatus);
        }
        public function get worship():int{
            return (this.ownData.worship);
        }
        public function get warAura():int{
            return (this.ownData.warAura);
        }
        public function zeroWarAura():void{
            this.ownData.warAura = 0;
        }
        public function get rank():Object{
            return (this.ownData.rank);
        }
        public function get awardlist():Array{
            return (this.ownData.awardList);
        }
        public function get pickupAward():int{
            return (this.ownData.pickupAward);
        }
        public function get strategyList():Array{
            return (this.ownData.strategyList);
        }
        public function get masterMonsterId():int{
            return (this.ownData.masterMonsterId);
        }
        public function get strategyWarData():ByteArray{
            return (this.ownData.strategyWarData);
        }

    }
}//package com.controllers 
