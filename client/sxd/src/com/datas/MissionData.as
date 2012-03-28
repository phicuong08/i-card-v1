//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.assist.view.*;
    import flash.utils.*;
    import com.assist.data.mission.*;
    import com.assist.view.info.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.datas.*;

    public class MissionData extends Base {

        private var _sectionsList:Array;
        private var _warData:WarData;
        private var _warStatus:int;
        private var _worship:int;
        public var warAura:int;
        private var _heroMissionList:Array;
        private var _buyHeroChallenge:Array;
        private var _strategyList:Array;
        private var _masterMonsterId:int;
        private var _strategyWarData:ByteArray;
        public var result:int;
        public var missionId:int;
        public var isPass:Boolean;
        public var missionLock:int = 0;
        public var monsterLock:int = 0;
        public var rank:Object;
        public var awardList:Array;
        public var pickupAward:int;

        public function MissionData(){
            this._strategyList = [];
            this.rank = {};
            this.awardList = [];
            super();
        }
        public function get sectionsList():Array{
            return (this._sectionsList);
        }
        public function get warData():WarData{
            return (this._warData);
        }
        public function get warStatus():int{
            return (this._warStatus);
        }
        public function get worship():int{
            return (this._worship);
        }
        public function get getHeroMissionList():Array{
            return (this._heroMissionList);
        }
        public function get buyHeroChallenge():Array{
            return (this._buyHeroChallenge);
        }
        public function get strategyList():Array{
            return (this._strategyList);
        }
        public function get masterMonsterId():int{
            return (this._masterMonsterId);
        }
        public function get strategyWarData():ByteArray{
            return (this._strategyWarData);
        }
        public function get_sections(_arg1:Array):void{
            this._sectionsList = _arg1[0];
        }
        public function get_hero_mission_list(_arg1:Array):void{
            this._heroMissionList = _arg1[0];
        }
        public function buy_hero_challenge(_arg1:Array):void{
            this._buyHeroChallenge = _arg1;
        }
        public function enter_mission(_arg1:Array):void{
            this.result = _arg1[0];
            if (this.result != Mod_Mission_Base.SUCCESS){
                return;
            };
            this.missionId = _arg1[1];
            this.isPass = _arg1[3];
            this.missionLock = _arg1[4];
            this.monsterLock = _arg1[5];
        }
        public function fight_monster(_arg1:Array):void{
            this._warStatus = _arg1[(_arg1.length - 3)];
            this._warData = new WarData();
            if (this.warStatus == Mod_Mission_Base.SUCCESS){
                this._warData.format(_arg1);
            };
            this._worship = _arg1[(_arg1.length - 2)];
            this.warAura = _arg1[(_arg1.length - 1)];
        }
        public function rank_mission(_arg1:Array):void{
            var _local2:Array;
            var _local3:Object;
            this.rank.score = _arg1[0];
            this.rank.full_score = _arg1[1];
            this.rank.score_flag = _arg1[2];
            this.rank.attack_score = _arg1[3];
            this.rank.defense_score = _arg1[4];
            this.rank.award_experience = _arg1[5];
            this.rank.award_skill = _arg1[6];
            this.rank.name = _data.player.playerInfo.name;
            this.rank.url = _data.player.playerInfo.fullHeadUrl;
            this.rank.list = [];
            for each (_local2 in _arg1[7]) {
                _local3 = {};
                _local3.name = RoleType.getRoleName(_local2[0]);
                _local3.exp = _local2[1];
                _local3.url = ((URI.iconsUrl + RoleType.getRoleSign(_local2[0])) + ".png");
                this.rank.list.push(_local3);
            };
            this.rank.worship = null;
            if (_arg1[8] > 0){
                this.rank.worship = {
                    name:HtmlText.yellow2(MissionDataLang.MarsExp),
                    exp:HtmlText.yellow2((((MissionDataLang.Exp + " +") + _arg1[8]) + "%")),
                    url:(URI.iconsUrl + "WorShip.png")
                };
            };
        }
        public function open_box(_arg1:Array):void{
            var _local7:Object;
            var _local8:Array;
            var _local9:ItemInfo;
            var _local2:int = _arg1[0];
            var _local3:int = _arg1[1];
            var _local4:int = _arg1[3];
            _arg1 = _arg1[2];
            var _local5:int;
            var _local6:int;
            this.awardList = [];
            if ((_arg1[0] is Array)){
                _local8 = _arg1[0];
                _local9 = new ItemInfo();
                _local9.parseSee(_local8[0]);
                _local7 = {};
                _local7.num = _local8.pop();
                _local7.name = htmlFormat(_local9.name, 13, _local9.color);
                _local7.url = _local9.basic.getImgUrl(0);
                _local7.tip = _local9.getTipsSprite1("", "");
                this.awardList.push(_local7);
            };
            if (_local2 > 0){
                _local7 = {};
                _local7.num = _local2;
                _local7.name = htmlFormat(MissionDataLang.Ingot, 13, 16764006);
                _local7.url = (URI.goodsIconUrl + "99998.png");
                this.awardList.push(_local7);
            };
            if (_local3 > 0){
                _local7 = {};
                _local7.num = _local3;
                _local7.name = htmlFormat(MissionDataLang.Coin, 13, 0xFFFFFF);
                _local7.url = (URI.goodsIconUrl + "99999.png");
                this.awardList.push(_local7);
                if (_local4 > 0){
                    _local7.name = ((_local7.name + "\n") + htmlFormat(((MissionDataLang.Blessing + _local4) + "%"), 12, 0xCC00));
                };
            };
        }
        public function pickup_award(_arg1:Array):void{
            this.pickupAward = _arg1[0];
        }
        public function sign_play_mission_video(_arg1:Array):void{
        }
        public function get_monster_strategy_list(_arg1:Array):void{
            var _local2:int;
            while (_local2 > 0) {
                _local2--;
                _arg1[1][_local2][0] = _data.player.removeNickNameSuffix(_arg1[1][_local2][0]);
            };
            this._masterMonsterId = _arg1[0];
            this._strategyList = _arg1[1];
        }
        public function get_player_war_report(_arg1:ByteArray):void{
            this._strategyWarData = _arg1;
        }

    }
}//package com.datas 
