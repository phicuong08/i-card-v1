//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {
    import com.*;
    import com.haloer.net.*;
    import flash.geom.*;
    import com.adobe.serialization.json.*;
    import com.assist.*;
    import com.lang.client.com.assist.server.source.*;

    public class MissionType {

        public static const XianLingDao:String = "XianLingDao";
        public static const ShiLiPo:String = "ShiLiPo";
        public static const ChenXiDong:String = "ChenXiDong";
        public static const YinLongKu:String = "YinLongKu";
        public static const ZhuYinShan:String = "ZhuYinShan";
        public static const LuanZangGang:String = "LuanZangGang";
        public static const YouHuaLin:String = "YouHuaLin";
        public static const QingQiuShan:String = "QingQiuShan";
        public static const HuangGong:String = "HuangGong";
        public static const XuYuHuanJing_1:String = "XuYuHuanJing_1";
        public static const ZangJianGu_1:String = "ZangJianGu_1";
        public static const FengShenLing_1:String = "FengShenLing_1";
        public static const XuYuHuanJing_2:String = "XuYuHuanJing_2";
        public static const ZangJianGu_2:String = "ZangJianGu_2";
        public static const FengShenLing_2:String = "FengShenLing_2";
        public static const LieYanDong:String = "LieYanDong";
        public static const LingShan:String = "LingShan";
        public static const LianYaoTa:String = "LianYaoTa";
        public static const DaMoHuangCheng:String = "DaMoHuangCheng";
        public static const YuDuFeng:String = "YuDuFeng";
        public static const XuanMingJie:String = "XuanMingJie";
        public static const ShuiXiaGongDian:String = "ShuiXiaGongDian";
        public static const YouMingDiFu:String = "YouMingDiFu";
        public static const XuTianDian:String = "XuTianDian";
        public static const ShuShanMiDao:String = "ShuShanMiDao";
        public static const DaLieGu:String = "DaLieGu";
        public static const FuSangShenShu:String = "FuSangShenShu";
        public static const BiWuChang:String = "BiWuChang";
        public static const ZuiHuaYin:String = "ZuiHuaYin";
        public static const LuoGongDian:String = "LuoGongDian";
        public static const KunYuZhiFu:String = "KunYuZhiFu";
        public static const BingJingHe:String = "BingJingHe";
        public static const HuoYanShan:String = "HuoYanShan";
        public static const XuanJingSi:String = "XuanJingSi";
        public static const DieShuiYa:String = "DieShuiYa";
        public static const TianJing:String = "TianJing";
        public static const DongYing:String = "DongYing";
        public static const ShuiLuDaoChang:String = "ShuiLuDaoChang";
        public static const NaiHeQiao:String = "NaiHeQiao";
        public static const QinShiHuangLing:String = "QinShiHuangLing";
        public static const ManHuangCongLin:String = "ManHuangCongLin";
        public static const TianCangCaoYuan:String = "TianCangCaoYuan";
        public static const GuChengFeiXu:String = "GuChengFeiXu";
        public static const GaoLiWangGong:String = "GaoLiWangGong";
        public static const HeiAnMuFu:String = "HeiAnMuFu";
        public static const HeiAnHuangCheng:String = "HeiAnHuangCheng";
        public static const MoDuAnXiang:String = "MoDuAnXiang";
        public static const XiuLuoTa:String = "XiuLuoTa";
        public static const ShenMoZhanChang:String = "ShenMoZhanChang";
        private static const Scenes:Object = {};
        private static const NORMAL:int = 0;
        private static const HERO:int = 1;
        private static const BOSS:int = 2;

        private static var _Sections:Object = null;
        private static var _Missions:Object = null;
        private static var _MissionItems:Object = null;
        private static var Indexes:Object = {
            1:"一",
            2:"二",
            3:"三",
            4:"四",
            5:"五",
            6:"六",
            7:"七",
            8:"八",
            9:"九",
            10:"十"
        };
        private static var _lock:int = 0;
        private static var _missionList:Object = {};
        private static var _missions:Object = {};

        public static function get Sections():Object{
            if (_Sections == null){
                throw (new Error("还未赋值！"));
            };
            return (_Sections);
        }
        public static function set Sections(_arg1:Object):void{
            if (_Sections != null){
                throw (new Error("非法赋值"));
            };
            _Sections = _arg1;
        }
        public static function get Missions():Object{
            if (_Missions == null){
                throw (new Error("还未赋值！"));
            };
            return (_Missions);
        }
        public static function set Missions(_arg1:Object):void{
            if (_Missions != null){
                throw (new Error("非法赋值"));
            };
            _Missions = _arg1;
        }
        public static function get MissionItems():Object{
            if (_MissionItems == null){
                throw (new Error("还未赋值！"));
            };
            return (_MissionItems);
        }
        public static function set MissionItems(_arg1:Object):void{
            if (_MissionItems != null){
                throw (new Error("非法赋值"));
            };
            _MissionItems = _arg1;
        }
        public static function set lock(_arg1:int):void{
            _lock = _arg1;
        }
        public static function getSectionSign(_arg1:int):String{
            return ((Sections[_arg1]) ? Sections[_arg1][0] : "");
        }
        public static function getSectionIdByMissionId(_arg1:int):int{
            return ((Missions[_arg1]) ? Missions[_arg1][0] : 0);
        }
        public static function getSectionSignByMissionId(_arg1:int):String{
            var _local2:int = getSectionIdByMissionId(_arg1);
            return (getSectionSign(_local2).replace(/(_\d+)+$/, ""));
        }
        public static function getTownIdBySectionId(_arg1:int):int{
            return ((Sections[_arg1]) ? Sections[_arg1][2] : 0);
        }
        public static function getTownIdByMissionId(_arg1:int):int{
            var _local2:int = getSectionIdByMissionId(_arg1);
            return (getTownIdBySectionId(_local2));
        }
        public static function getSectionName(_arg1:int):String{
            return ((Sections[_arg1]) ? Sections[_arg1][3] : "");
        }
        public static function getSectionNameBySign(_arg1:String):String{
            var _local2:Object;
            for each (_local2 in Sections) {
                if (_local2[0] == _arg1){
                    return (_local2[3]);
                };
            };
            return ("");
        }
        public static function getMissionSign(_arg1:int):String{
            return (getSectionSignByMissionId(_arg1));
        }
        public static function getMissionLock(_arg1:int):int{
            return ((Missions[_arg1]) ? Missions[_arg1][1] : 0);
        }
        public static function getMissionPower(_arg1:int):int{
            return ((Missions[_arg1]) ? Missions[_arg1][2] : 0);
        }
        public static function getMissionAwardCoins(_arg1:int):int{
            return ((Missions[_arg1]) ? Missions[_arg1][3] : 0);
        }
        public static function getMissionAwardSkill(_arg1:int):int{
            return ((Missions[_arg1]) ? Missions[_arg1][4] : 0);
        }
        public static function getMissionAwardExp(_arg1:int):int{
            return ((Missions[_arg1]) ? Missions[_arg1][5] : 0);
        }
        public static function getMissionMonsterId(_arg1:int):int{
            return ((Missions[_arg1]) ? Missions[_arg1][6] : 0);
        }
        public static function getMissionName(_arg1:int):String{
            return ((Missions[_arg1]) ? Missions[_arg1][7] : "");
        }
        public static function isOpenedByMissionId(_arg1:int):Boolean{
            var _local2:int = getMissionLock(_arg1);
            return ((_lock >= _local2));
        }
        public static function getLocalMissionName(_arg1:int):String{
            var _local2:String = (Missions[_arg1]) ? Missions[_arg1][7] : "";
            var _local3:Array = /(\d+)/.exec(_local2);
            if (((_local3) && ((_local3.length > 1)))){
                _local2 = _local2.replace(_local3[1], numberToChs(_local3[1]));
            };
            return (_local2);
        }
        public static function getMissionType(_arg1:int):int{
            return ((Missions[_arg1]) ? Missions[_arg1][8] : 0);
        }
        public static function isNormalMission(_arg1:int):Boolean{
            return ((getMissionType(_arg1) == NORMAL));
        }
        public static function isHeroMission(_arg1:int):Boolean{
            return ((getMissionType(_arg1) == HERO));
        }
        public static function isBossMission(_arg1:int):Boolean{
            return ((Missions[_arg1]) ? (Missions[_arg1][9] == 1) : false);
        }
        public static function getMissionAwardItems(_arg1:int):Array{
            return ((MissionItems[_arg1]) ? MissionItems[_arg1] : []);
        }
        public static function getMissionOrder(_arg1:int):int{
            var _local2:String = getMissionName(_arg1);
            return (parseInt(_local2.replace(/[^\d]/g, "")));
        }
        public static function getSectionIdsByTownId(_arg1:int):Array{
            var _local3:String;
            var _local4:int;
            var _local2:Array = [];
            for (_local3 in Sections) {
                _local4 = Sections[_local3][2];
                if (_local4 == _arg1){
                    _local2.push(parseInt(_local3));
                };
            };
            return (_local2);
        }
        public static function getMissionIdsByTownId(_arg1:int):Array{
            var _local4:Object;
            var _local5:Array;
            var _local2:Array = [];
            var _local3:Array = getSectionIdsByTownId(_arg1);
            for (_local4 in Missions) {
                _local5 = Missions[_local4];
                if (_local3.indexOf(_local5[0]) > -1){
                    _local2.push(_local4);
                };
            };
            return (_local2);
        }
        public static function getMissionDataByMissionId(_arg1:int):Object{
            var _local6:Object;
            var _local2:int = getMissionType(_arg1);
            var _local3:int = getTownIdByMissionId(_arg1);
            var _local4:Array = getMissionListByTownId(_local3, _local2);
            var _local5:Object = {};
            for each (_local6 in _local4) {
                if (_local6["id"] == _arg1){
                    _local5 = _local6;
                    break;
                };
            };
            return (_local5);
        }
        public static function getNormalMissionListByTownId(_arg1:int):Array{
            return (getMissionListByTownId(_arg1, NORMAL));
        }
        public static function getHeroMissionListByTownId(_arg1:int):Array{
            return (getMissionListByTownId(_arg1, HERO));
        }
        public static function getBossMissionListByTownId(_arg1:int):Array{
            return (getMissionListByTownId(_arg1, BOSS));
        }
        public static function getMissionListByTownId(_arg1:int, _arg2:int):Array{
            var _local6:int;
            var _local7:int;
            var _local8:Object;
            var _local9:int;
            var _local10:Array;
            var _local11:Array;
            var _local12:Array;
            var _local13:Array;
            var _local14:Object;
            if (!_missionList[_arg1]){
                _missionList[_arg1] = {};
            };
            var _local3:Array = _missionList[_arg1][_arg2];
            if (_local3){
                return (_local3);
            };
            var _local4:Array = [];
            var _local5:Array = getSectionIdsByTownId(_arg1);
            for (_local8 in Missions) {
                _local9 = (_local8 as int);
                _local10 = Missions[_local9];
                if (getMissionType(_local9) != _arg2){
                } else {
                    _local11 = getMissionAwardItems(_local9);
                    _local12 = [];
                    _local13 = [];
                    _local7 = _local11.length;
                    _local6 = 0;
                    while (_local6 < _local7) {
                        _local12.push(ItemType.getName(_local11[_local6]));
                        _local13.push(ItemType.getItemColor(_local11[_local6]));
                        _local6++;
                    };
                    if (_local5.indexOf(_local10[0]) > -1){
                        _local14 = {
                            award:_local12,
                            color:_local13,
                            coin:getMissionAwardCoins(_local9),
                            id:_local9,
                            lock:getMissionLock(_local9),
                            mainName:getMissionName(_local9).replace(/\(.+?\)/, ""),
                            minTownNum:0,
                            missionNum:numberToChs(getMissionOrder(_local9)),
                            name:getLocalMissionName(_local9),
                            power:getMissionPower(_local9),
                            skill:getMissionAwardSkill(_local9),
                            townMissionNum:"",
                            townName:TownType.getName(_arg1)
                        };
                        _local4.push(_local14);
                    };
                };
            };
            _local4.sortOn("lock", Array.NUMERIC);
            _local7 = _local4.length;
            _local6 = 0;
            while (_local6 < _local7) {
                _local4[_local6]["minTownNum"] = (_local6 + 1);
                _local4[_local6]["townMissionNum"] = numberToChs((_local6 + 1));
                _local6++;
            };
            _missionList[_arg1][_arg2] = _local4;
            return (_local4);
        }
        private static function numberToChs(_arg1:int):String{
            return ((_arg1 + ""));
        }
        public static function get startTeleport():Point{
            return (new Point(150, 450));
        }
        public static function get endTeleport():Point{
            return (new Point(2250, 450));
        }
        public static function loadMissionData(_arg1:int, _arg2:Function, _arg3:Function=null):void{
            var missionId:* = _arg1;
            var callback:* = _arg2;
            var error:Function = _arg3;
            if (_missions[missionId]){
                callback();
                return;
            };
            var url:* = (((URI.assetsUrl + "templet/mission/") + missionId) + ".txt");
            url = (url + ("?v=" + URI.getVersion(url)));
            var http:* = new HTTP();
            http.onComplete = function (_arg1:String):void{
                formatMissionData(missionId, _arg1);
                callback();
            };
            http.load(url);
        }
        private static function formatMissionData(_arg1:int, _arg2:String):void{
            var _local7:Array;
            var _local8:int;
            var _local9:int;
            var _local3:Object = com.adobe.serialization.json.JSON.decode(_arg2);
            _missions[_arg1] = _local3;
            var _local4:Array = _local3["scenes"];
            var _local5:int = _local4.length;
            var _local6:int;
            while (_local6 < _local5) {
                _local7 = _local4[_local6]["monsters"];
                _local8 = _local7.length;
                _local9 = 0;
                while (_local9 < _local8) {
                    _local7[_local9]["monster_sign"] = MonsterType.sameResource(MonsterType.getMonsterSign(_local7[_local9]["monster_id"]));
                    _local7[_local9]["monster_name"] = MonsterType.getMonsterNameById(_local7[_local9]["monster_id"]);
                    _local9++;
                };
                _local6++;
            };
        }
        private static function checkMission(_arg1:int):void{
            if (!_missions[_arg1]){
                throw (new Error(Lang.sprintf(MissionTypeDataLang.CheckMission, _arg1)));
            };
        }
        public static function getSences(_arg1:int):Array{
            checkMission(_arg1);
            return (_missions[_arg1]["scenes"]);
        }
        public static function getMissionMonsterList(_arg1:int):Array{
            var _local4:Object;
            checkMission(_arg1);
            var _local2:Array = [];
            var _local3:Object = _missions[_arg1]["monster_list"];
            for (_local4 in _local3) {
                _local2.push(MonsterType.getMonsterSign((_local4 as int)));
            };
            return (_local2);
        }
        public static function getVideoLock(_arg1:int, _arg2:int):int{
            var _local7:Array;
            var _local8:int;
            var _local9:Object;
            var _local3:Object = _missions[_arg1];
            if (((_local3) && ((_local3["video_id"] == _arg2)))){
                return (_local3["video_lock"]);
            };
            var _local4:Array = getSences(_arg1);
            var _local5:int = _local4.length;
            var _local6:int;
            while (_local6 < _local5) {
                _local7 = _local4[_local6]["monsters"];
                _local8 = 0;
                while (_local8 < _local7.length) {
                    _local9 = _local7[_local8];
                    if (_local9["start_video_id"] == _arg2){
                        return (_local9["start_video_lock"]);
                    };
                    if (_local9["end_video_id"] == _arg2){
                        return (_local9["end_video_lock"]);
                    };
                    _local8++;
                };
                _local6++;
            };
            return (0);
        }
        public static function getVideoId(_arg1:int):int{
            checkMission(_arg1);
            return (int(_missions[_arg1]["video_id"]));
        }
        public static function getVideoFile(_arg1:int):String{
            checkMission(_arg1);
            return (_missions[_arg1]["video_file"]);
        }

    }
}//package com.assist.server 
