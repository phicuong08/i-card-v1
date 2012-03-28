//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.haloer.data.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.datas.*;

    public class QuestData extends Base {

        public var listPlayerQuest:Array = null;
        public var canReceiveQuest:Array = null;
        public var acceptQuest:int;
        public var npcInfoByNPCId:Array = null;
        public var npcInfoByQuestId:Object = null;
        public var townQuest:Array = null;
        public var completedState:int;
        public var awardItemId:int;
        public var hasQuestForNPC:Boolean = false;
        public var finishQuest:int;

        public function npc_info_by_npcid(_arg1:Array):void{
            this.npcInfoByNPCId = (this.format_npc_info(_arg1[0], true) as Array);
        }
        public function npc_info_by_questid(_arg1:Array):void{
            this.npcInfoByQuestId = this.format_npc_info(_arg1, false);
        }
        public function accept_quest(_arg1:Array):void{
            this.acceptQuest = _arg1[0];
        }
        public function complete_quest(_arg1:Array):void{
            var _local2:Object = {};
            oObject.list(_arg1, _local2, ["state", "experience", "coins", "itemId", "townKey", "questKey", "newQuest"]);
            this.completedState = _local2["state"];
            this.awardItemId = _local2["itemId"];
            this.hasQuestForNPC = (_local2["newQuest"] == Mod_Quest_Base.NEWQUEST);
        }
        public function giveup_quest(_arg1:Array):void{
        }
        public function list_player_quest(_arg1:Array):void{
            this.listPlayerQuest = _arg1[0];
        }
        public function can_receive_quest(_arg1:Array):void{
            this.canReceiveQuest = _arg1[0];
        }
        public function town_quest_show(_arg1:Array):void{
            this.format_town_quest_show(_arg1[0]);
        }
        public function finish_quest(_arg1:Array):void{
            this.finishQuest = _arg1[0];
        }
        private function format_npc_info(_arg1:Array, _arg2:Boolean):Object{
            var _local6:Array;
            var _local7:Object;
            var _local8:int;
            var _local9:String;
            var _local3:Array = [];
            if (_arg2 == false){
                _arg1 = [_arg1];
            };
            var _local4:int = _arg1.length;
            var _local5:int;
            while (_local5 < _local4) {
                _local3[_local5] = {};
                _local6 = ["quest_id", "state"];
                if (false == _arg2){
                    _local6.push("need_type", "quest_need");
                };
                oObject.list(_arg1[_local5], _local3[_local5], _local6);
                _local7 = _local3[_local5];
                _local8 = _local7["quest_id"];
                _local7["name"] = QuestType.getTitle(_local8);
                _local7["content"] = QuestType.getContent(_local8);
                _local7["begin_npc_id"] = QuestType.getBeginNPCId(_local8);
                _local7["begin_town_id"] = TownType.getIdByTownNPCId(QuestType.getBeginNPCId(_local8));
                _local7["end_npc_id"] = QuestType.getEndNPCId(_local8);
                _local7["end_town_id"] = TownType.getIdByTownNPCId(QuestType.getEndNPCId(_local8));
                _local7["award_experience"] = QuestType.getAwardExperience(_local8);
                _local7["award_coins"] = QuestType.getAwardCoins(_local8);
                _local7["award_item"] = QuestType.getAwardItemIdByRoleId(_local8, _data.player.mainRoleId);
                if (_arg2){
                    _local7["quest_type"] = QuestType.getType(_local8);
                    _local7["quest_lock"] = QuestType.getLock(_local8);
                    _local7["is_talk_quest"] = QuestType.getIsTalkQuest(_local8);
                    switch (_local7["state"]){
                        case QuestType.Acceptable:
                            _local9 = QuestType.getAcceptTalk(_local8);
                            break;
                        case QuestType.LevelLimit:
                        case QuestType.Accepted:
                            _local9 = QuestType.getAcceptedTalk(_local8);
                            break;
                        case QuestType.Completed:
                        default:
                            _local9 = QuestType.getCompletedTalk(_local8);
                    };
                    _local7["npc_talk"] = _local9.split("|");
                    _local7["name"] = (((QuestType.Master == _local7["quest_type"])) ? QuestDataLang.Main : QuestDataLang.Branch + _local7["name"]);
                } else {
                    _local7["award_item_count"] = QuestType.getAwardItemCount(_local8);
                    _local7["town_text"] = QuestType.getTownText(_local8);
                    _local7["mission_id"] = QuestType.getMissionId(_local8);
                    _local7["mission_name"] = MissionType.getMissionName(QuestType.getMissionId(_local8));
                    _local7["mission_monster_name"] = MissionType.getMissionMonsterId(QuestType.getMissionId(_local8));
                    _local7["is_talk_quest"] = QuestType.getIsTalkQuest(_local8);
                };
                _local5++;
            };
            if (_arg2){
                return (this.sortNPCInfo(_local3));
            };
            return (_local3[0]);
        }
        private function sortNPCInfo(_arg1:Array):Array{
            var _local2:Array = [];
            var _local3:Array = [];
            var _local4:Array = [];
            var _local5:Array = [];
            var _local6:Array = [];
            var _local7:Array = [];
            var _local8:Array = [];
            var _local9:Array = [];
            var _local10:Array = [];
            this.classQuest(_arg1, _local2, _local3, _local4, _local5, _local6, _local7, _local8, _local9, _local10);
            _local6.sortOn("quest_lock", Array.NUMERIC);
            _local7.sortOn("quest_lock", Array.NUMERIC);
            var _local11:Array = [].concat(_local2, _local5, _local8, _local4, _local7, _local10, _local3, _local6, _local9);
            return (_local11);
        }
        private function format_town_quest_show(_arg1:Array):void{
            var _local4:int;
            var _local5:Object;
            this.townQuest = [];
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                this.townQuest[_local3] = [];
                oObject.list(_arg1[_local3], this.townQuest[_local3], ["quest_id", "state", "need_type", "quest_need"]);
                _local4 = this.townQuest[_local3]["quest_id"];
                _local5 = this.townQuest[_local3];
                _local5["quest_lock"] = QuestType.getLock(_local4);
                _local5["quest_lv"] = QuestType.getLevel(_local4);
                _local5["name"] = QuestType.getTitle(_local4);
                _local5["begin_npc_id"] = QuestType.getBeginNPCId(_local4);
                _local5["begin_town_id"] = TownType.getIdByTownNPCId(QuestType.getBeginNPCId(_local4));
                _local5["end_npc_id"] = QuestType.getEndNPCId(_local4);
                _local5["end_town_id"] = TownType.getIdByTownNPCId(QuestType.getEndNPCId(_local4));
                _local5["quest_type"] = QuestType.getType(_local4);
                _local5["conditions"] = QuestType.getConditions(_local4);
                _local5["town_text"] = QuestType.getTownText(_local4);
                _local5["mission_id"] = QuestType.getMissionId(_local4);
                _local5["mission_name"] = MissionType.getMissionName(QuestType.getMissionId(_local4));
                _local5["mission_monster_name"] = MissionType.getMissionMonsterId(QuestType.getMissionId(_local4));
                _local5["is_talk_quest"] = QuestType.getIsTalkQuest(_local4);
                _local3++;
            };
            this.townQuest = this.sortQuest(this.townQuest);
        }
        public function sortQuest(_arg1:Array):Array{
            return (this.sortNPCInfo(_arg1));
        }
        public function classQuest(_arg1:Array, _arg2:Array, _arg3:Array, _arg4:Array, _arg5:Array, _arg6:Array, _arg7:Array, _arg8:Array, _arg9:Array, _arg10:Array):void{
            var _local13:Object;
            var _local11:int = _arg1.length;
            var _local12:int;
            while (_local12 < _local11) {
                _local13 = _arg1[_local12];
                if (_local13["quest_type"] == QuestType.Master){
                    if (QuestType.Completed == _local13["state"]){
                        _arg2.push(_local13);
                    } else {
                        if (QuestType.Accepted == _local13["state"]){
                            _arg3.push(_local13);
                        } else {
                            _arg4.push(_local13);
                        };
                    };
                } else {
                    if (_local13["quest_type"] == QuestType.Slave){
                        if (QuestType.Completed == _local13["state"]){
                            _arg5.push(_local13);
                        } else {
                            if (QuestType.Accepted == _local13["state"]){
                                _arg6.push(_local13);
                            } else {
                                _arg7.push(_local13);
                            };
                        };
                    } else {
                        if (QuestType.Completed == _local13["state"]){
                            _arg8.push(_local13);
                        } else {
                            if (QuestType.Accepted == _local13["state"]){
                                _arg9.push(_local13);
                            } else {
                                _arg10.push(_local13);
                            };
                        };
                    };
                };
                _local12++;
            };
        }

    }
}//package com.datas 
