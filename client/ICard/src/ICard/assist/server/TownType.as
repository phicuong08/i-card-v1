//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.server {
    import ICard.haloer.data.*;

    public class TownType {

        public static const XiaoYuCun:String = "XiaoYuCun";
        public static const SuZhou:String = "SuZhou";
        public static const JingCheng:String = "JingCheng";
        public static const ShuShanCheng:String = "ShuShanCheng";
        public static const KunLunCheng:String = "KunLunCheng";
        public static const GuDaoCheng:String = "GuDaoCheng";
        public static const YuXuCheng:String = "YuXuCheng";
        public static const JiMo:String = "JiMo";
        public static const BossQingTianMu:String = "BossQingTianMu";
        public static const BossChiYanShou:String = "BossChiYanShou";
        public static const BossDaoBaTu:String = "BossDaoBaTu";
        public static const LiShuShan:String = "LiShuShan";
        public static const YangZhouCheng:String = "YangZhouCheng";
        public static const YueYaCheng:String = "YueYaCheng";
        public static const JiHuiSuo:String = "JiHuiSuo";
        public static const BaiHuFactionWar:String = "BaiHuFactionWar";
        public static const XuanWuFactionWar:String = "XuanWuFactionWar";
        public static const ZhuQueFactionWar:String = "ZhuQueFactionWar";
        public static const QingLongFactionWar:String = "QingLongFactionWar";
        public static const PengLaiCheng:String = "PengLaiCheng";
        public static const ChangAnCheng:String = "ChangAnCheng";
        public static const TaiYiCheng:String = "TaiYiCheng";
        public static const GaoLiCheng:String = "GaoLiCheng";
        public static const MoDu:String = "MoDu";
        public static const DaLi:String = "DaLi";
        public static const ZhengZhou:String = "ZhengZhou";
        public static const MultiMission:String = "MultiMission";
        public static const HorseRace:String = "HorseRace";
        public static const DailyQuest:String = "DailyQuest";
        public static const Sport:String = "Sport";
        public static const OfflineExp:String = "OfflineExp";
        public static const PreventIndulge:String = "PreventIndulge";
        public static const OnlineGift:String = "OnlineGift";
        public static const CampWar:String = "CampWar";
        public static const SendIngot:String = "SendIngot";
        public static const CampSalary:String = "CampSalary";
        public static const All:String = "All";
        public static const AllTown:Boolean = true;

        private static var _Towns:Object;
        private static var _lock:int = 0;
        private static var _campSign:String = "";

        public static function get Towns():Object{
            if (_Towns == null){
                throw (new Error("还未赋值！"));
            };
            return (_Towns);
        }
        public static function set Towns(_arg1:Object):void{
            if (_Towns != null){
                throw (new Error("非法赋值"));
            };
            _Towns = _arg1;
        }
        public static function set lock(_arg1:int):void{
            _lock = _arg1;
        }
        public static function set campSign(_arg1:String):void{
            _campSign = _arg1;
        }
        public static function getId(_arg1:String):int{
            var _local3:Object;
            var _local2:int;
            for (_local3 in Towns) {
                if (Towns[_local3][0] == _arg1){
                    _local2 = (_local3 as int);
                    break;
                };
            };
            return (_local2);
        }
        public static function getIdByTownNPCId(_arg1:int):int{
            var _local2:Object;
            var _local3:Object;
            var _local4:Object;
            for (_local2 in Towns) {
                _local3 = Towns[_local2][2];
                for each (_local4 in _local3) {
                    if (_arg1 == _local4[0]){
                        return ((_local2 as int));
                    };
                };
            };
            return (0);
        }
        public static function getSign(_arg1:int):String{
            return ((Towns[_arg1]) ? Towns[_arg1][0] : "");
        }
        public static function getName(_arg1:int):String{
            return ((Towns[_arg1]) ? Towns[_arg1][1] : "");
        }
        public static function getNameBySign(_arg1:String):String{
            var _local2:int = getId(_arg1);
            return (getName(_local2));
        }
        public static function getLock(_arg1:int):int{
            return ((Towns[_arg1]) ? Towns[_arg1][3] : 0);
        }
        public static function getOpenedTownSigns(_arg1:Boolean=false):Array{
            var _local2:Array = getOpenedTownIds(_arg1);
            var _local3:int = _local2.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local2[_local4] = Towns[_local2[_local4]][0];
                _local4++;
            };
            return (_local2);
        }
        public static function getOpenedTownIds(_arg1:Boolean=false):Array{
            var _local7:Object;
            var _local8:int;
            var _local9:int;
            var _local10:int;
            var _local11:Object;
            var _local12:int;
            var _local2:Array = [];
            var _local3:int;
            var _local4:int;
            var _local5:int = TownType.getId(_campSign);
            var _local6:int = TownType.getLock(_local5);
            for (_local7 in Towns) {
                _local10 = (_local7 as int);
                _local11 = Towns[_local10];
                _local12 = _local11[3];
                if ((((((_arg1 == false)) && ((_local12 == _local6)))) && (!((_local5 == _local10))))){
                } else {
                    if ((((_local12 <= _lock)) && (isTownById(_local10)))){
                        _local2.push({
                            id:_local10,
                            lock:_local12
                        });
                    };
                };
            };
            _local2.sortOn("lock", Array.NUMERIC);
            _local8 = _local2.length;
            _local9 = 0;
            while (_local9 < _local8) {
                _local2[_local9] = _local2[_local9]["id"];
                _local9++;
            };
            return (_local2);
        }
        public static function getOpenedTownInfo():Array{
            var _local2:Array;
            var _local1:Array = [];
            for each (_local2 in Towns) {
                if ((((_local2[3] > _lock)) || ((isTownBySign(_local2[0]) == false)))){
                } else {
                    _local1.push({
                        name:_local2[0],
                        info:_local2[4],
                        level:""
                    });
                };
            };
            return (_local1);
        }
        public static function getMaxTownId():int{
            var _local5:Object;
            var _local6:int;
            var _local7:Object;
            var _local8:int;
            var _local1:int;
            var _local2:int;
            var _local3:int = TownType.getId(_campSign);
            var _local4:int = TownType.getLock(_local3);
            for (_local5 in Towns) {
                _local6 = (_local5 as int);
                _local7 = Towns[_local6];
                _local8 = _local7[3];
                if ((((_local8 == _local4)) && (!((_local3 == _local6))))){
                } else {
                    if ((((_local8 <= _lock)) && ((_local8 > _local1)))){
                        _local1 = _local8;
                        _local2 = _local6;
                    };
                };
            };
            return (_local2);
        }
        public static function getPrevTownIdByTownId(_arg1:int):int{
            var _local7:Object;
            var _local8:Object;
            var _local9:int;
            var _local2:int = getLock(_arg1);
            var _local3:int;
            var _local4:int;
            var _local5:int = TownType.getId(_campSign);
            var _local6:int = TownType.getLock(_local5);
            for (_local7 in Towns) {
                _arg1 = (_local7 as int);
                _local8 = Towns[_arg1];
                _local9 = _local8[3];
                if ((((_local9 == _local6)) && (!((_local5 == _arg1))))){
                } else {
                    if ((((_local9 < _local2)) && ((_local9 > _local3)))){
                        _local3 = _local9;
                        _local4 = _arg1;
                    };
                };
            };
            return (_local4);
        }
        public static function getNextTownIdByTownId(_arg1:int):int{
            var _local7:Object;
            var _local8:Object;
            var _local9:int;
            var _local2:int = getLock(_arg1);
            var _local3:int = 10000000;
            var _local4:int;
            var _local5:int = TownType.getId(_campSign);
            var _local6:int = TownType.getLock(_local5);
            for (_local7 in Towns) {
                _arg1 = (_local7 as int);
                _local8 = Towns[_arg1];
                _local9 = _local8[3];
                if ((((_local9 == _local6)) && (!((_local5 == _arg1))))){
                } else {
                    if ((((_local9 > _local2)) && ((_local9 < _local3)))){
                        _local3 = _local9;
                        _local4 = _arg1;
                    };
                };
            };
            return (_local4);
        }
        public static function isTownBySign(_arg1:String):Boolean{
            return (((((((((((((((!((_arg1 == BossChiYanShou))) && (!((_arg1 == BossQingTianMu))))) && (!((_arg1 == BossDaoBaTu))))) && (!((_arg1 == JiHuiSuo))))) && (!((_arg1 == BaiHuFactionWar))))) && (!((_arg1 == XuanWuFactionWar))))) && (!((_arg1 == ZhuQueFactionWar))))) && (!((_arg1 == QingLongFactionWar)))));
        }
        public static function isTownById(_arg1:int):Boolean{
            return (isTownBySign(getSign(_arg1)));
        }
        public static function isOpened(_arg1:String):Boolean{
            var _local2:int = getId(_arg1);
            var _local3:int = getLock(_local2);
            return ((_lock >= _local3));
        }
        public static function isOpenedByTownId(_arg1:int):Boolean{
            var _local2:int = getLock(_arg1);
            return ((_lock >= _local2));
        }
        public static function getTownIdByLock(_arg1:int):int{
            var _local3:Object;
            var _local4:Object;
            var _local5:int;
            var _local2:int;
            for (_local3 in Towns) {
                _local4 = Towns[_local3];
                _local5 = _local4[3];
                if ((((_local5 <= _arg1)) && (isTownById((_local3 as int))))){
                    _local2 = Math.max((_local3 as int), _local2);
                };
            };
            return (_local2);
        }
        private static function getTownInfo(_arg1:int):Array{
            var _local2:Array = Towns[_arg1];
            if (!_local2){
                throw (new Error((("不存在townId为的 " + _arg1) + " 城镇！")));
            };
            return (_local2);
        }
        public static function getNPCSignByTownNPCId(_arg1:int):String{
            var _local2:Object;
            var _local3:Object;
            var _local4:String;
            for each (_local2 in Towns) {
                _local3 = _local2[2];
                for (_local4 in _local3) {
                    if (_local3[_local4][0] == _arg1){
                        return (_local4);
                    };
                };
            };
            return ("");
        }
        public static function getTownNPCId(_arg1:int, _arg2:String):int{
            var _local3:Array = getTownInfo(_arg1);
            if (!_local3[2][_arg2]){
                throw (new Error(((_local3[1] + "不存在npc:") + _arg2)));
            };
            return (_local3[2][_arg2][0]);
        }
//        public static function getTownNPCIdByFunc(_arg1:int, _arg2:int):int{
//            var _local5:String;
//            var _local3:Array = getTownInfo(_arg1);
//            var _local4:int;
//            for (_local5 in _local3[2]) {
//                if (NPCType.getFunctionBySign(_local5) == _arg2){
//                    _local4 = _local3[2][_local5][0];
//                    break;
//                };
//            };
//            return (_local4);
//        }
        public static function hasNPCInTown(_arg1:int, _arg2:String):Boolean{
            var _local3:Array = getTownInfo(_arg1);
            return (!(!(_local3[2][_arg2])));
        }
        public static function getNPCSign(_arg1:int, _arg2:int):String{
            var _local5:String;
            var _local3:Array = getTownInfo(_arg1);
            var _local4:String = "";
            for (_local5 in _local3[2]) {
                if (_local3[2][_local5][0] == _arg2){
                    _local4 = _local5;
                };
            };
            if (_local4 == ""){
                throw (new Error(((_local3[1] + "不存在towNPCId:") + _arg2)));
            };
            return (_local4);
        }
//        public static function getNPCList(_arg1:int):Object{
//            var _local5:String;
//            var _local2:Object = {};
//            var _local3:Array = getTownInfo(_arg1);
//            var _local4:Object = _local3[2];
//            for (_local5 in _local4) {
//                if (_local2[_local5] == null){
//                    _local2[_local5] = {};
//                };
//                oObject.list(_local4[_local5], _local2[_local5], ["id", "x", "y", "lock"]);
//                _local2[_local5]["name"] = NPCType.getNameBySign(_local5);
//                _local2[_local5]["type"] = NPCType.getFunctionBySign(_local5);
//            };
//            return (_local2);
//        }

    }
}//package com.assist.server 
