//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class VIPType {

        private static const Levels:Object = {
            1:100,
            2:500,
            3:1000,
            4:2000,
            5:5000,
            6:10000,
            7:20000,
            8:50000,
            9:100000,
            10:200000,
            11:500000,
            12:1000000
        };
        public static const Level0:int = 0;
        public static const Level1:int = 1;
        public static const Level2:int = 2;
        public static const Level3:int = 3;
        public static const Level4:int = 4;
        public static const Level5:int = 5;
        public static const Level6:int = 6;
        public static const Level7:int = 7;
        public static const Level8:int = 8;
        public static const Level9:int = 9;
        public static const Level10:int = 10;
        public static const Level11:int = 11;
        public static const Level12:int = 12;
        public static const MaxLevel:int = 12;

        private static var _level:int = -1;

        public static function set level(_arg1:int):void{
            _level = _arg1;
        }
        public static function check(_arg1:int):Boolean{
            if (_level >= _arg1){
                return (true);
            };
            return (false);
        }
        public static function get enabled():Boolean{
            return (check(Level0));
        }
        public static function getVIPInfo(_arg1:int, _arg2:int=100):String{
            var _local4:int;
            var _local5:int;
            var _local3:String = "";
            if (infos[_arg1]){
                _local4 = infos[_arg1].length;
                _local5 = 0;
                while ((((_local5 < _local4)) && ((_local5 < _arg2)))) {
                    if (_local3 != ""){
                        _local3 = (_local3 + "\n");
                    };
                    _local3 = (_local3 + (((_local5 + 1) + ".") + infos[_arg1][_local5]));
                    _local5++;
                };
            };
            return (_local3);
        }
        public static function getRequireMoney(_arg1:int):int{
            return (((Levels[_arg1]) || (0)));
        }
        public static function test():void{
            var _local2:String;
            var _local3:Array;
            var _local4:int;
            var _local1:String = "";
            for (_local2 in infos) {
                _local1 = (_local1 + (("infos[VIPType.Level" + _local2) + "] = [\n"));
                _local3 = infos[_local2];
                _local4 = 0;
                while (_local4 < _local3.length) {
                    _local1 = (_local1 + ((("\tVIPTypeData0Lang.Level" + _local2) + "_") + _local4));
                    if (_local4 < (_local3.length - 1)){
                        _local1 = (_local1 + ",");
                    };
                    _local1 = (_local1 + "\n");
                    _local4++;
                };
                _local1 = (_local1 + "];\n");
            };
        }

    }
//    infos = {};
//    infos[VIPType.Level0] = [VIPTypeData0Lang.Level0_0, VIPTypeData0Lang.Level0_1, VIPTypeData0Lang.Level0_2, VIPTypeData0Lang.Level0_3, VIPTypeData0Lang.Level0_4, VIPTypeData0Lang.Level0_5];
//    infos[VIPType.Level1] = [VIPTypeData0Lang.Level1_0, VIPTypeData0Lang.Level1_1, VIPTypeData0Lang.Level1_2, VIPTypeData0Lang.Level1_3, VIPTypeData0Lang.Level1_4, VIPTypeData0Lang.Level1_5];
//    infos[VIPType.Level2] = [VIPTypeData0Lang.Level2_0, VIPTypeData0Lang.Level2_1, VIPTypeData0Lang.Level2_2, VIPTypeData0Lang.Level2_3, VIPTypeData0Lang.Level2_4, VIPTypeData0Lang.Level2_5];
//    infos[VIPType.Level3] = [VIPTypeData0Lang.Level3_0, VIPTypeData0Lang.Level3_1, VIPTypeData0Lang.Level3_2, VIPTypeData0Lang.Level3_3, VIPTypeData0Lang.Level3_4, VIPTypeData0Lang.Level3_5, VIPTypeData0Lang.Level3_6, VIPTypeData0Lang.Level3_7, VIPTypeData0Lang.Level3_8, VIPTypeData0Lang.Level3_9];
//    infos[VIPType.Level4] = [VIPTypeData0Lang.Level4_0, VIPTypeData0Lang.Level4_1, VIPTypeData0Lang.Level4_2, VIPTypeData0Lang.Level4_3, VIPTypeData0Lang.Level4_4, VIPTypeData0Lang.Level4_5, VIPTypeData0Lang.Level4_6, VIPTypeData0Lang.Level4_7, VIPTypeData0Lang.Level4_8];
//    infos[VIPType.Level5] = [VIPTypeData0Lang.Level5_0, VIPTypeData0Lang.Level5_1, VIPTypeData0Lang.Level5_2, VIPTypeData0Lang.Level5_3, VIPTypeData0Lang.Level5_4, VIPTypeData0Lang.Level5_5, VIPTypeData0Lang.Level5_6, VIPTypeData0Lang.Level5_7, VIPTypeData0Lang.Level5_8, VIPTypeData0Lang.Level5_9];
//    infos[VIPType.Level6] = [VIPTypeData0Lang.Level6_0, VIPTypeData0Lang.Level6_1, VIPTypeData0Lang.Level6_2, VIPTypeData0Lang.Level6_3, VIPTypeData0Lang.Level6_4];
//    infos[VIPType.Level7] = [VIPTypeData0Lang.Level7_0, VIPTypeData0Lang.Level7_1, VIPTypeData0Lang.Level7_2, VIPTypeData0Lang.Level7_3];
//    infos[VIPType.Level8] = [VIPTypeData0Lang.Level8_0];
//    infos[VIPType.Level9] = [VIPTypeData0Lang.Level9_0];
//    infos[VIPType.Level10] = [VIPTypeData0Lang.Level10_0, VIPTypeData0Lang.Level10_1, VIPTypeData0Lang.Level10_2];
//    infos[VIPType.Level11] = [VIPTypeData0Lang.Level11_0];
//    var _local1:* = (infos[VIPType.Level12] = [VIPTypeData0Lang.Level12_0]);
//    return (_local1);
}//package com.assist.server 

import com.lang.client.com.assist.server.source.*;

var infos:Object;
