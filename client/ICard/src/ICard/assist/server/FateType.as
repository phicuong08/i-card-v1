//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.server {

    public class FateType {

        private static const FateNPCs:Object = {
            1:["周一仙", 8000],
            2:["小仙女", 10000],
            3:["左慈", 20000],
            4:["张道陵", 40000],
            5:["姜子牙", 60000]
        };
        private static const FateQuality:Object = {
            1:["杂物", 5400, 0],
            2:["优秀", 6750, 30],
            3:["精良", 13500, 60],
            4:["传奇", 20250, 120],
            5:["神器", 27000, 720],
            6:["普通", 27000, 1200],
            7:["碎片", 27000, 0]
        };
        public static const Health:int = 1;
        public static const Attack:int = 2;
        public static const Defense:int = 3;
        public static const MagicAttack:int = 4;
        public static const MagicDefense:int = 5;
        public static const StuntAttack:int = 6;
        public static const StuntDefense:int = 7;
        public static const Hit:int = 8;
        public static const Block:int = 9;
        public static const Dodge:int = 10;
        public static const Critical:int = 11;
        public static const Momentum:int = 12;
        public static const BreakBlock:int = 13;
        public static const BreakCritical:int = 14;
        public static const Kill:int = 15;

        private static var _Fates:Object = null;
        private static var _FateLevel:Object = null;

        public static function get Fates():Object{
            if (_Fates == null){
                throw (new Error("还未赋值！"));
            };
            return (_Fates);
        }
        public static function set Fates(_arg1:Object):void{
            if (_Fates != null){
                throw (new Error("非法赋值"));
            };
            _Fates = _arg1;
        }
        public static function get FateLevel():Object{
            if (_FateLevel == null){
                throw (new Error("还未赋值！"));
            };
            return (_FateLevel);
        }
        public static function set FateLevel(_arg1:Object):void{
            if (_FateLevel != null){
                throw (new Error("非法赋值"));
            };
            _FateLevel = _arg1;
        }
        public static function getFateName(_arg1:int):String{
            return ((Fates[_arg1]) ? Fates[_arg1][0] : "");
        }
        public static function getFateSign(_arg1:int):String{
            return ((Fates[_arg1]) ? Fates[_arg1][1] : "");
        }
        public static function getFateQuality(_arg1:int):int{
            return ((Fates[_arg1]) ? Fates[_arg1][2] : 0);
        }
        public static function getFateDescription(_arg1:int):String{
            return ((Fates[_arg1]) ? Fates[_arg1][3] : "");
        }
        public static function getWarAttributeType(_arg1:int):int{
            return ((Fates[_arg1]) ? Fates[_arg1][4] : 0);
        }
        public static function getNPCName(_arg1:int):String{
            return ((FateNPCs[_arg1]) ? FateNPCs[_arg1][0] : "");
        }
        public static function getNPCFee(_arg1:int):int{
            return ((FateNPCs[_arg1]) ? FateNPCs[_arg1][1] : 0);
        }
        public static function getMaxFateLevel(_arg1:int):int{
            var _local5:Array;
            var _local2:int = FateLevel.length;
            var _local3:int;
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = FateLevel[_local4];
                if ((((_arg1 == _local5[0])) && ((_local3 < _local5[1])))){
                    _local3 = _local5[1];
                };
                _local4++;
            };
            return (_local3);
        }
        public static function getFateAddonValue(_arg1:int, _arg2:int):int{
            var _local6:Array;
            var _local3:int = FateLevel.length;
            var _local4:int;
            var _local5:int;
            while (_local5 < _local3) {
                _local6 = FateLevel[_local5];
                if ((((((_arg1 == _local6[0])) && ((_arg2 == _local6[1])))) && ((_local4 < _local6[2])))){
                    _local4 = FateLevel[_local5][2];
                };
                _local5++;
            };
            return (_local4);
        }
        public static function getSalePriceByFateId(_arg1:int):int{
            var _local2:int = getFateQuality(_arg1);
            return (getSalePriceByQualityId(_local2));
        }
        public static function getSalePriceByQualityId(_arg1:int):int{
            return ((FateQuality[_arg1]) ? FateQuality[_arg1][1] : 0);
        }
        public static function getExperienceByFateId(_arg1:int):int{
            var _local2:int = getFateQuality(_arg1);
            return (getExperienceByQualityId(_local2));
        }
        public static function getExperienceByQualityId(_arg1:int):int{
            return ((FateQuality[_arg1]) ? FateQuality[_arg1][2] : 0);
        }

    }
}//package com.assist.server 
