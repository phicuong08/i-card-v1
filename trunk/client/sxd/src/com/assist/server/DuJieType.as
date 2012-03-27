//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {
    import com.lang.client.com.assist.server.source.*;

    public class DuJieType {

        private static const SpiritState:Object = {
            1:"炼气",
            2:"筑基",
            3:"结丹",
            4:"元婴",
            5:"化神",
            6:"炼虚",
            7:"合体",
            8:"大乘",
            9:"渡劫",
            10:"仙人一阶",
            11:"仙人二阶",
            12:"仙人三阶",
            13:"仙人四阶"
        };
        private static const Require:Array = [[1, 1, 70, 3000], [1, 2, 70, 1000], [1, 3, 70, 1000], [2, 1, 70, 3000], [2, 2, 70, 1000], [2, 3, 70, 1000], [3, 1, 70, 3000], [3, 2, 70, 1000], [3, 3, 70, 1000], [4, 1, 80, 3600], [4, 2, 80, 1200], [4, 3, 80, 1200], [5, 1, 80, 3600], [5, 2, 80, 1200], [5, 3, 80, 1200], [6, 1, 80, 3600], [6, 2, 80, 1200], [6, 3, 80, 1200], [7, 1, 90, 4200], [7, 2, 90, 1400], [7, 3, 90, 1400], [8, 1, 90, 4200], [8, 2, 90, 1400], [8, 3, 90, 1400], [9, 1, 90, 4200], [9, 2, 90, 1400], [9, 3, 90, 1400], [10, 1, 100, 4800], [10, 2, 100, 1600], [10, 3, 100, 1600], [11, 1, 110, 4800], [11, 2, 110, 1600], [11, 3, 110, 1600], [12, 1, 120, 4800], [12, 2, 120, 1600], [12, 3, 120, 1600], [13, 1, 131, 5400], [13, 2, 131, 1800], [13, 3, 131, 1800]];

        public static function getSpiritLevelInfo(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case 1:
                    _local2 = DuJieTypeData0Lang.Prime;
                    break;
                case 2:
                    _local2 = DuJieTypeData0Lang.Iterim;
                    break;
                case 3:
                    _local2 = DuJieTypeData0Lang.LaterPeriod;
                    break;
                default:
                    _local2 = "";
            };
            return (_local2);
        }
        public static function getSpiritName(_arg1:int):String{
            return (((SpiritState[_arg1]) || ("")));
        }
        public static function getSpiritColor(_arg1:int):uint{
            if ((((_arg1 >= 1)) && ((_arg1 <= 3)))){
                return (41193);
            };
            if ((((_arg1 >= 4)) && ((_arg1 <= 6)))){
                return (0xFF00FF);
            };
            return (16776977);
        }
        public static function getRequireRoleLevel(_arg1:int, _arg2:int):int{
            var _local5:Array;
            var _local3:int = Require.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = Require[_local4];
                if ((((_local5[0] == _arg1)) && ((_local5[1] == _arg2)))){
                    return (_local5[2]);
                };
                _local4++;
            };
            return (0);
        }
        public static function getRequireHealth(_arg1:int, _arg2:int):int{
            var _local5:Array;
            var _local3:int = Require.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = Require[_local4];
                if ((((_local5[0] == _arg1)) && ((_local5[1] == _arg2)))){
                    return (_local5[3]);
                };
                _local4++;
            };
            return (0);
        }

    }
}//package com.assist.server 
