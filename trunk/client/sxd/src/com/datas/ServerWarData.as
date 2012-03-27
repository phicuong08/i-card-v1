//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.*;
    import com.assist.view.info.*;
    import com.assist.*;
    import com.haloer.data.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.datas.*;

    public class ServerWarData extends Base {

        public var info:ServerWarInfo;
        public var result:int = 0;

        public function ServerWarData():void{
            this.info = new ServerWarInfo();
            super();
        }
        public function get_race_step(_arg1:Array):void{
            var _local2:Array;
            ServerWarInfo.removeNickNameSuffix = _data.player.removeNickNameSuffix;
            ServerWarInfo.serverWarType = _arg1[0];
            this.info.playerName = _data.player.removeNickNameSuffix(_data.player.nickname);
            this.info.serverState = _arg1[1];
            this.info.userState = _arg1[2];
            this.info.playerId = _arg1[7];
            this.info.groupPlayer = _arg1[8];
            if (this.info.groupCup == Mod_ServerWar_Base.GROUP_NULL){
                this.info.groupCup = _arg1[8];
            };
            this.info.zoneName = _arg1[10];
            this.info.roundTimeInterval = _arg1[6];
            for each (_local2 in _arg1[5]) {
                this.info.roundTimeList[_local2[0]] = _local2[1];
            };
            this.info.setKnockoutTip(_arg1[3], _arg1[4]);
            this.info.serverNameList = [];
            for each (_local2 in _arg1[11]) {
                this.info.serverNameList.push(_local2.join(" "));
            };
        }
        public function get_standings(_arg1:Array):void{
            this.info.serverState = _arg1[0];
            this.info.groupCup = _arg1[3];
            this.info.setKnockoutTip(_arg1[1], _arg1[2], _arg1[4]);
            _arg1[5].sortOn("3", Array.NUMERIC);
            this.info.setKnockoutList(_arg1[5]);
        }
        public function apply(_arg1:Array):void{
            this.info.signupState = _arg1[0];
        }
        public function get_race_list(_arg1:Array):void{
            var _local3:Array;
            var _local4:Object;
            var _local2:Object = {};
            oObject.list(_arg1, _local2, ["group", "level", "player_list", "current_war_result", "top_16", "top_8", "top_4", "top_2", "top_player_id", "can_bet_coin_list"]);
            this.info.setCupGroupType(_local2.group);
            this.info.setCupRoundWar(_local2.current_war_result);
            this.info.setCupCanBet(_local2.can_bet_coin_list);
            this.info.userList = [];
            this.info.groupList = [null];
            this.info.winList = [];
            this.info.hasWinList = [];
            this.info.idList = [];
            for each (_local3 in _local2.player_list) {
                _local4 = {};
                oObject.list(_local3, _local4, ["idA", "idB", "nameA", "nameB", "roleIdA", "roleIdB", "dpsA", "dpsB", "fameA", "fameB", "levelA", "levelB", "stageNameA", "stageNameB", "serverNameA", "serverNameB", "betNumA", "betNumB"]);
                _local4.headUrlA = ((URI.iconsUrl + RoleType.getRoleSign(_local4.roleIdA)) + ".png");
                _local4.headUrlB = ((URI.iconsUrl + RoleType.getRoleSign(_local4.roleIdB)) + ".png");
                this.info.addCupGroup(_local4);
            };
            if (this.info.serverState != Mod_ServerWar_Base.SERVER_WAR_1_COMPLETE){
                _local2.top_player_id = 0;
            };
            this.info.pushRoundWin(16, _local2.top_16);
            this.info.pushRoundWin(8, _local2.top_8);
            this.info.pushRoundWin(4, _local2.top_4);
            this.info.pushRoundWin(2, _local2.top_2);
            this.info.pushRoundWin(1, [[_local2.top_player_id]]);
            this.info.winnerId = _local2.top_player_id;
        }
        public function get_war_result_list(_arg1:Array):void{
            _arg1[0].sortOn("3", (Array.NUMERIC | Array.DESCENDING));
            this.info.pushRecordSee(_arg1[0]);
        }
        public function get_race_standings(_arg1:Array):void{
            var _local6:Array;
            var _local7:Array;
            this.info.resetRecord();
            var _local2:String = "";
            var _local3:int;
            var _local4:Array = [];
            var _local5:Array = [];
            for each (_local6 in _arg1[0]) {
                _local6[2] = _data.player.removeNickNameSuffix(_local6[2]);
                for each (_local7 in _local6[3]) {
                    switch (_local6[0]){
                        case Mod_ServerWar_Base.SERVER_WAR_16:
                            this.info.pushRecord(16, _local6[1], _local6[2], _local7[0], _local7[1], _local7[2], this.info.getSerStateName(_local6[0], _local6[4]));
                            break;
                        case Mod_ServerWar_Base.SERVER_WAR_8:
                            this.info.pushRecord(8, _local6[1], _local6[2], _local7[0], _local7[1], _local7[2], this.info.getSerStateName(_local6[0], _local6[4]));
                            break;
                        case Mod_ServerWar_Base.SERVER_WAR_4:
                            this.info.pushRecord(4, _local6[1], _local6[2], _local7[0], _local7[1], _local7[2], this.info.getSerStateName(_local6[0], _local6[4]));
                            break;
                        case Mod_ServerWar_Base.SERVER_WAR_2:
                            this.info.pushRecord(2, _local6[1], _local6[2], _local7[0], _local7[1], _local7[2], this.info.getSerStateName(_local6[0], _local6[4]));
                            break;
                        case Mod_ServerWar_Base.SERVER_WAR_1:
                            this.info.pushRecord(1, _local6[1], _local6[2], _local7[0], _local7[1], _local7[2], this.info.getSerStateName(_local6[0], _local6[4]));
                            break;
                        case Mod_ServerWar_Base.SERVER_WAR_TIANBANG:
                            _local4.push([0, _local6[1], _local6[2], _local7[0], _local7[1], _local7[2], this.info.getSerStateName(_local6[0], _local6[4])]);
                            break;
                        case Mod_ServerWar_Base.SERVER_WAR_DIBANG:
                            _local5.push([0, _local6[1], _local6[2], _local7[0], _local7[1], _local7[2], this.info.getSerStateName(_local6[0], _local6[4])]);
                            break;
                    };
                };
            };
            _local4.sortOn("4", (Array.NUMERIC | Array.DESCENDING));
            _local5.sortOn("4", (Array.NUMERIC | Array.DESCENDING));
            _local3 = _local5.length;
            for each (_local6 in _local5) {
                this.info.pushRecord(_local6[0], _local6[1], _local6[2], _local6[3], _local6[4], _local6[5], (_local6[6] + Lang.sprintf(ServerWarDataLang.RoundIdx, _local3)));
                _local3--;
            };
            _local3 = _local4.length;
            for each (_local6 in _local4) {
                this.info.pushRecord(_local6[0], _local6[1], _local6[2], _local6[3], _local6[4], _local6[5], (_local6[6] + Lang.sprintf(ServerWarDataLang.RoundIdx, _local3)));
                _local3--;
            };
        }
        public function bet(_arg1:Array):void{
            this.result = _arg1[0];
        }
        public function get_player_bet(_arg1:Array):void{
            this.info.setCupGuessList(_arg1[0]);
        }
        public function get_bet_coin_rank(_arg1:Array):void{
            this.info.setBetRank(_arg1[0]);
        }

    }
}//package com.datas 
