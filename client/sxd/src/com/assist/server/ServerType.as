//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {
    import com.haloer.net.*;
    import com.assist.data.mission.*;

    public class ServerType {

        private var _list:Array;

        public function ServerType(){
            this._list = [AchievementType, ActivityType, ConsumeAlertSetType, DelayNotifyType, DeployType, DuJieType, FactionType, FameLevel, FateType, FunctionType, GoldOilType, HerbsType, ItemType, MarsType, MissionFailedTipsType, MissionType, MonsterType, MultipleMissionType, NPCType, PeachType, PetType, PlayerType, ProcessTipsType, QuestType, ResearchType, RoleStunt, RoleType, RollCakeType, ServerType, SoulType, StudyStuntType, TowerType, TownNPCType, TownType, VIPType, WorldBossType, ZodiacType, 0];
            super();
        }
        public static function format(_arg1:File):void{
            var file:* = _arg1;
            var format:* = function (_arg1:Class, _arg2:String, _arg3:Array):void{
                var _local7:String;
                var _local4:Object = file.getClassByName(("com.assist.server.source." + _arg2));
                var _local5:int = _arg3.length;
                var _local6:int;
                while (_local6 < _local5) {
                    _local7 = _arg3[_local6];
                    if (false == _local4.hasOwnProperty(_local7)){
                        throw (new Error(((_arg2 + "不存在") + _local7)));
                    };
                    _arg1[_local7] = _local4[_local7];
                    _local6++;
                };
            };
            format(FateType, "FateTypeData", ["Fates", "FateLevel"]);
            format(FunctionType, "FunctionTypeData", ["List"]);
            format(ItemType, "ItemTypeData", ["Types", "Items", "Qualitys", "EquipJob", "AvatarItemMonster", "ItemUpgrade"]);
            format(MissionType, "MissionTypeData", ["Sections", "Missions", "MissionItems"]);
            format(MonsterType, "MonsterTypeData", ["Monsters", "Same"]);
            format(QuestType, "QuestTypeData", ["Quests"]);
            format(RoleStunt, "RoleStuntData", ["Stunts", "RoleWithStunt"]);
            format(SoulType, "SoulTypeData", ["Soul"]);
            format(TowerType, "TowerTypeData", ["Layer", "LayerSoul"]);
            format(TownType, "TownTypeData", ["Towns"]);
            WarData.getItemSuffix = ItemType.getItemSuffix;
        }

    }
}//package com.assist.server 
