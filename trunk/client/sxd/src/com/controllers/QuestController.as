//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.*;
    import com.assist.server.*;
    import com.assist.view.info.*;
    import com.datas.*;
    import com.haloer.data.*;
    import com.lang.client.com.controllers.*;
    import com.protocols.*;

    public class QuestController  extends com.controllers.Base {

        public var ownData:QuestData;
        private var _relatedNPC:Object;
        private var _completedQuest:Array;
        private var _hasLevelLimit:Boolean = false;
        private var _hasMasterCompleted:Boolean = false;
        private var _masterLock:uint;

        public function QuestController(){
            this._relatedNPC = {};
            this._completedQuest = [];
            super();
        }
        public function get listPlayerQuest():Array{
            return (this.format_quest_list(this.ownData.listPlayerQuest, false));
        }
        public function get canReceiveQuest():Array{
            return (this.format_quest_list(this.ownData.canReceiveQuest, true));
        }
        private function format_quest_list(_arg1:Array, _arg2:Boolean):Array{
            var _local8:int;
            var _local9:int;
            var _local10:Object;
            var _local12:int;
            var _local13:int;
            var _local3:Object = {
                name:QuestType.getTypeName(QuestType.Master),
                value:[],
                opened:true
            };
            var _local4:Object = {
                name:QuestType.getTypeName(QuestType.Slave),
                value:[],
                opened:true
            };
            var _local5:Object = {
                name:QuestType.getTypeName(QuestType.Daily),
                value:[],
                opened:true
            };
            var _local6:Object = {
                name:QuestType.getTypeName(QuestType.Elite),
                value:[],
                opened:true
            };
            var _local7:Array = [];
            _local9 = _arg1.length;
            _local8 = 0;
            while (_local8 < _local9) {
                _local12 = _arg1[_local8][0];
                _local10 = (_local7[_local8] = {
                    quest_id:_local12,
                    name:QuestType.getTitle(_local12),
                    quest_type:QuestType.getType(_local12),
                    quest_lock:QuestType.getLock(_local12)
                });
                if (_arg2){
                    _local10["quest_lv"] = QuestType.getLevel(_local12);
                } else {
                    _local10["state"] = _arg1[_local8][1];
                };
                if (_ctrl.player.level < _local10["quest_lv"]){
                    _local10["name"] = this.traceTextColor((((_local10["name"] + "{") + _local10["quest_lv"]) + "}"));
                } else {
                    _local10["name"] = this.traceTextColor(_local10["name"]);
                };
                _local8++;
            };
            _local7 = this.ownData.sortQuest(_local7);
            _local9 = _local7.length;
            _local8 = 0;
            while (_local8 < _local9) {
                _local10 = _local7[_local8];
                _local13 = _local10["quest_type"];
                if (QuestType.Master == _local13){
                    _local3.value.push(_local10);
                    this._masterLock = _local10["quest_lock"];
                } else {
                    if (QuestType.Slave == _local13){
                        _local4.value.push(_local10);
                    } else {
                        if (QuestType.Daily == _local13){
                            _local5.value.push(_local10);
                        } else {
                            if (QuestType.Elite == _local13){
                                _local6.value.push(_local10);
                            };
                        };
                    };
                };
                _local8++;
            };
            if (_local3.value.length > 0){
                _local3.value[0]["focus"] = true;
            } else {
                if (_local4.value.length > 0){
                    _local4.value[0]["focus"] = true;
                } else {
                    if (_local5.value.length > 0){
                        _local5.value[0]["focus"] = true;
                    } else {
                        if (_local6.value.length > 0){
                            _local6.value[0]["focus"] = true;
                        };
                    };
                };
            };
            var _local11:Array = [_local3];
            if ((((this._masterLock > QuestType.SlaveQuestLock)) || ((_local4.value.length > 0)))){
                _local11.push(_local4);
            };
            if ((((this._masterLock > QuestType.EliteQuestLock)) || ((_local6.value.length > 0)))){
                _local11.push(_local6);
            };
            return (_local11);
        }
        public function get isTwoCanOperate():Boolean{
            var _local1:int;
            var _local2:int;
            var _local3:Array = this.ownData.npcInfoByNPCId;
            var _local4:int = _local3.length;
            var _local5:int;
            while (_local5 < _local4) {
                if (QuestType.Completed == _local3[_local5]["state"]){
                    _local1++;
                };
                if (QuestType.Acceptable == _local3[_local5]["state"]){
                    _local2++;
                };
                _local5++;
            };
            if ((((_local1 > 1)) || ((_local2 > 1)))){
                return (true);
            };
            return (false);
        }
        public function get npcInfoByNPCId():Array{
            return (this.ownData.npcInfoByNPCId);
        }
        public function get acceptQuest():int{
            return (this.ownData.acceptQuest);
        }
        public function get completedState():int{
            return (this.ownData.completedState);
        }
        public function get awardItemId():int{
            return (this.ownData.awardItemId);
        }
        public function get hasQuestForNPC():Boolean{
            return (this.ownData.hasQuestForNPC);
        }
        public function get finishQuest():int{
            return (this.ownData.finishQuest);
        }
        public function get npcInfoByQuestId():Object{
            var _local1:int;
            var _local2:Object = this.ownData.npcInfoByQuestId;
            var _local3:Array = [];
            var _local4:String = this.formatDescription(_local2).join("");
            _local3.push(QuestControllerLang.StartNPC);
            _local3.push("<font color=\"#fff200\">");
            _local3.push("<a href=\"event:");
            _local3.push(((("npc," + _local2["begin_town_id"]) + ",") + _local2["begin_npc_id"]));
            _local3.push("\">");
            _local3.push((("<u>" + NPCType.getName(TownNPCType.getNPCId(_local2["begin_npc_id"]))) + "</u>"));
            _local3.push("</a>");
            _local3.push("</font>，");
            _local3.push(QuestControllerLang.EndNPC);
            _local3.push("<font color=\"#fff200\">");
            _local3.push("<a href=\"event:");
            _local3.push(((("npc," + _local2["end_town_id"]) + ",") + _local2["end_npc_id"]));
            _local3.push("\">");
            _local3.push((("<u>" + NPCType.getName(TownNPCType.getNPCId(_local2["end_npc_id"]))) + "</u>"));
            _local3.push("</a>");
            _local3.push("</font><br>");
            if (QuestType.LevelLimit == _local2["state"]){
                _local3.push(QuestControllerLang.LevelLimit);
                _local2["name"] = this.traceTextColor(_local2["name"]);
            } else {
                if ((((((1 == _local2["is_talk_quest"])) || (((!((_local2["state"] == QuestType.Completed))) && (!((_local2["state"] == QuestType.Accepted))))))) || ((QuestType.PartnersQuestId == _local2["quest_id"])))){
                    _local3.push((((("<a href=\"event:npc," + _local2["end_town_id"]) + ",") + _local2["end_npc_id"]) + "\">"));
                    _local3.push(_local4);
                    _local3.push("</a>");
                } else {
                    _local3.push((((("<a href=\"event:mission," + _local2["begin_town_id"]) + ",") + _local2["mission_id"]) + "\">"));
                    _local3.push(_local4);
                    _local3.push("</a>");
                };
            };
            _local2["goal"] = _local3.join("");
            return (_local2);
        }
        private function formatDescription(_arg1:Object):Array{
            var _local8:Array;
            var _local9:Object;
            var _local2:Array = [];
            var _local3:Array = [];
            var _local4:Array = _arg1["quest_need"];
            var _local5:int = _local4.length;
            var _local6:int;
            while (_local6 < _local5) {
                _local2[_local6] = [];
                _local8 = ["current_count", "max_count"];
                if (Mod_Quest_Base.NOONE == _arg1["need_type"]){
                } else {
                    if (Mod_Quest_Base.MONSTER == _arg1["need_type"]){
                        _local8.unshift("monster_id");
                    } else {
                        _local8.unshift("item_id");
                    };
                };
                oObject.list(_local4[_local6], _local2[_local6], _local8);
                _local6++;
            };
            _local3.push(this.traceTextColor(_arg1["town_text"]));
            var _local7:String = "";
            _local6 = 0;
            while (_local6 < _local5) {
                _local9 = _local2[_local6];
                switch (_arg1["need_type"]){
                    case Mod_Quest_Base.GETQUESTITEM:
                        _local7 = (_local7 + ((((((((QuestControllerLang.GetItem + "[") + ItemType.getName(_local9["item_id"])) + "(") + _local9["current_count"]) + "/") + _local9["max_count"]) + ")") + "]"));
                        break;
                    case Mod_Quest_Base.GETITEM:
                        if (_local7 != ""){
                            _local7 = (_local7 + QuestControllerLang.Pause);
                        };
                        _local7 = (_local7 + ((((((("[" + ItemType.getName(_local9["item_id"])) + "(") + _local9["current_count"]) + "/") + _local9["max_count"]) + ")") + "]"));
                        break;
                    case Mod_Quest_Base.MONSTER:
                        if (_local7 != ""){
                            _local7 = (_local7 + QuestControllerLang.Pause);
                        };
                        _local7 = (_local7 + ((((((("[" + MonsterType.getMonsterNameById(_local9["monster_id"])) + "(") + _local9["current_count"]) + "/") + _local9["max_count"]) + ")") + "]"));
                        break;
                };
                _local6++;
            };
            if (_local7 != ""){
                _local3.push(this.traceTextColor(_local7));
            };
            return (_local3);
        }
        public function get hasMasterCompleted():Boolean{
            return (this._hasMasterCompleted);
        }
        public function get masterLock():uint{
            return (this._masterLock);
        }
        public function get townQuest():Object{
            var _local11:Object;
            var _local12:int;
            var _local13:int;
            var _local14:String;
            var _local15:Array;
            this._relatedNPC = {};
            this._completedQuest = [];
            this._hasLevelLimit = false;
            var _local1:Object = this.npcQuestCounts;
            var _local2:int = _ctrl.player.mapId;
            var _local3:String = FactionType.campSign(_ctrl.player.campId);
            var _local4:int = TownType.getMaxTownId();
            var _local5:int = TownType.getPrevTownIdByTownId(_local4);
            var _local6:Object = {
                accepted:[],
                acceptable:[]
            };
            var _local7:Boolean;
            var _local8:Object = this.ownData.townQuest;
            var _local9:int = _local8.length;
            var _local10:int;
            for (;_local10 < _local9;_local10++) {
                _local11 = _local8[_local10];
                _local12 = _local11["begin_town_id"];
                _local13 = _local11["begin_npc_id"];
                _local14 = this.formatDescription(_local11).join("");
                _local15 = [];
                if (_local11["quest_type"] == QuestType.Master){
                    _local15.push(QuestControllerLang.Master);
                } else {
                    _local15.push(QuestControllerLang.Slave);
                };
                _local15.push(_local11["name"]);
                if ((((_local11["state"] == QuestType.Acceptable)) || ((_local11["state"] == QuestType.LevelLimit)))){
                    if (((((((!((this._relatedNPC[_local13] == NPCInfo.NPC_Complete))) && (!((_local11["state"] == QuestType.LevelLimit))))) && (!((_local1[_local13] == null))))) && ((_local1[_local13]-- > 0)))){
                        this._relatedNPC[_local13] = NPCInfo.NPC_Acceptable;
                    };
                    if (((!((_local12 == _local4))) && (!((_local12 == _local5))))){
                        continue;
                    };
                    _local15.unshift("<font color=\"#ffffff\">");
                    if (_local11["state"] == QuestType.Acceptable){
                        _local15.push("<br>    ");
                        _local15.push("<a href=\"event:npc,", _local11["begin_town_id"], ",", _local13, ",", _local11["state"], "\">");
                        _local15.push(QuestControllerLang.StartNPC);
                        _local15.push("<font color=\"#fff200\">");
                        _local15.push("<u>");
                        _local15.push(NPCType.getName(TownNPCType.getNPCId(_local13)));
                        _local15.push("</u>");
                        _local15.push("</font>");
                        _local15.push("</a>");
                    } else {
                        if (QuestType.LevelLimit == _local11["state"]){
                            _local15.push(((this.traceTextColor((("{" + _local11["quest_lv"].toString()) + "}")) + "<br>    ") + QuestControllerLang.LevelLimit1));
                            this._hasLevelLimit = true;
                        };
                    };
                } else {
                    if (_local11["state"] == QuestType.Accepted){
                        if (((((((!((this._relatedNPC[_local13] == NPCInfo.NPC_Complete))) && (!((this._relatedNPC[_local13] == NPCInfo.NPC_Acceptable))))) && (!((_local1[_local13] == null))))) && ((_local1[_local13]-- > 0)))){
                            this._relatedNPC[_local13] = NPCInfo.NPC_Accepted;
                        };
                        _local15.push("<br>    ");
                        if ((((1 == _local11["is_talk_quest"])) || ((QuestType.PartnersQuestId == _local11["quest_id"])))){
                            _local15.push((((((("<a href=\"event:npc," + _local11["end_town_id"]) + ",") + _local11["end_npc_id"]) + ",") + _local11["state"]) + "\">"));
                            _local15.push(_local14);
                            _local15.push("</a>");
                        } else {
                            _local15.push((((((("<a href=\"event:mission," + _local11["begin_town_id"]) + ",") + _local11["mission_id"]) + ",") + _local11["state"]) + "\">"));
                            _local15.push(_local14);
                            _local15.push("</a>");
                        };
                    } else {
                        if (_local11["state"] == QuestType.Completed){
                            this._relatedNPC[_local11["end_npc_id"]] = NPCInfo.NPC_Complete;
                            if (_local1[_local11["end_npc_id"]] != null){
                                var _local16:Object = _local1;
                                var _local17:Object = _local11["end_npc_id"];
                                var _local18:Object = (_local16[_local17] - 1);
                                _local16[_local17] = _local18;
                            };
                            _local15.unshift((((((("<a href=\"event:npc," + _local11["end_town_id"]) + ",") + _local11["end_npc_id"]) + ",") + _local11["state"]) + "\"><u>"));
                            _local15.unshift("<font color=\"#00ff00\">");
                            _local15.push("(", QuestControllerLang.EnabledComplete, ")");
                            _local15.push("</u></a></font>");
                            this._completedQuest.push(_local11["quest_id"]);
                            if (_local11["quest_type"] == QuestType.Master){
                                _local7 = true;
                            };
                        };
                    };
                };
                if ((((_local11["state"] == QuestType.Acceptable)) || ((_local11["state"] == QuestType.LevelLimit)))){
                    _local6["acceptable"].push(_local15.join(""));
                } else {
                    _local6["accepted"].push(_local15.join(""));
                };
                if (_local11["quest_type"] == QuestType.Master){
                    this._masterLock = _local11["quest_lock"];
                };
            };
            this._hasMasterCompleted = _local7;
            return (_local6);
        }
        public function get townQuestData():Array{
            return (this.ownData.townQuest);
        }
        public function get relatedNPC():Object{
            return (this._relatedNPC);
        }
        public function get completedQuest():Array{
            return (this._completedQuest);
        }
        public function get hasLevelLimit():Boolean{
            return (this._hasLevelLimit);
        }
        private function traceTextColor(_arg1:String):String{
            _arg1 = _arg1.replace(/\[/g, "<font color=\"#fff200\"><u>");
            _arg1 = _arg1.replace(/\]/g, "</u></font>");
            _arg1 = _arg1.replace(/\{/g, "<font color=\"#ff0000\">(");
            _arg1 = _arg1.replace(/\}/g, (Lang.sprintf(QuestControllerLang.TraceText, "") + ")</font>"));
            return (_arg1);
        }
        private function get npcQuestCounts():Object{
            var _local4:String;
            var _local5:Object;
            var _local6:int;
            var _local7:int;
            var _local8:int;
            var _local1:Object = {};
            var _local2:int = _ctrl.player.mapId;
            var _local3:Object = TownType.getNPCList(_local2);
            for (_local4 in _local3) {
                _local5 = _local3[_local4];
                _local6 = _local5["id"];
                _local7 = NPCType.getId(TownType.getNPCSignByTownNPCId(_local6));
                _local8 = NPCType.getFunction(_local7);
				if(_local8 == NPCType.NonFunction)
					_local1[_local6] = 4;
				else
					_local1[_local6] = 3;
                //_local1[_local6] = (4 - ((_local8)!=NPCType.NonFunction) ? 1 : 0);
            };
            return (_local1);
        }

    }
}//package com.controllers 
