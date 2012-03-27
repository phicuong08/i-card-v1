//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class PetType {

        public static const PetData:Object = {
            1:["岩龙", 70, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            2:["木龙", 80, 500, 3000, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0],
            3:["水龙", 90, 700, 8000, 0, 0, 0, 10, 0, 0, 0, 0, 0, 10, 0, 0],
            4:["火龙", 100, 900, 15000, 0, 0, 0, 10, 0, 10, 0, 0, 0, 10, 0, 0],
            5:["风龙", 110, 1200, 24000, 0, 0, 0, 10, 0, 10, 0, 20, 0, 10, 0, 0],
            6:["雷龙", 120, 0, 36000, 1000, 0, 0, 10, 20, 10, 0, 20, 0, 10, 5000, 0],
            7:["冰龙", 130, 0, 36000, 1000, 10000, 0, 10, 20, 10, 0, 20, 30, 10, 5000, 50000],
            8:["飞龙", 140, 0, 36000, 1000, 20000, 0, 10, 20, 10, 30, 20, 30, 10, 5000, 100000],
            9:["黑龙", 150, 1000, 36000, 1000, 30000, 10000, 10, 20, 10, 30, 20, 30, 10, 5000, 150000],
            10:["金龙", 160, 2000, 46000, 1000, 40000, 20000, 10, 20, 10, 30, 20, 30, 10, 5000, 200000]
        };
        public static const PetIngot:Object = {
            70:[200, 20000],
            80:[200, 20000],
            90:[200, 20000],
            100:[200, 20000],
            110:[200, 20000],
            120:[200, 20000],
            130:[200, 20000],
            140:[200, 20000],
            150:[200, 20000],
            160:[200, 20000]
        };
        public static const PetCoin:Object = {
            70:[10000, 5000],
            80:[20000, 5000],
            90:[30000, 5000],
            100:[40000, 5000],
            110:[50000, 5000],
            120:[60000, 5000],
            130:[70000, 5000],
            140:[80000, 5000],
            150:[90000, 5000],
            160:[100000, 5000]
        };
        public static const PetExp:Object = {
            1:[0, 25000, 25000, 50000, 50000, 50000, 100000, 100000, 100000, 100000, 250000, 0],
            2:[0, 200000, 200000, 200000, 200000, 200000, 300000, 300000, 300000, 300000, 600000, 0],
            3:[0, 500000, 500000, 500000, 500000, 500000, 700000, 700000, 700000, 700000, 1200000, 0],
            4:[0, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000, 1500000, 0],
            5:[0, 1300000, 1300000, 1300000, 1300000, 1300000, 1300000, 1300000, 1300000, 1300000, 2200000, 0],
            6:[0, 1800000, 1800000, 1800000, 1800000, 1800000, 1800000, 1800000, 1800000, 1800000, 3000000, 0],
            7:[0, 2500000, 2500000, 2500000, 2500000, 2500000, 2500000, 2500000, 2500000, 2500000, 5000000, 0],
            8:[0, 0x30D400, 0x30D400, 0x30D400, 0x30D400, 0x30D400, 0x30D400, 0x30D400, 0x30D400, 0x30D400, 7000000, 0],
            9:[0, 0x493E00, 0x493E00, 0x493E00, 0x493E00, 0x493E00, 0x493E00, 0x493E00, 0x493E00, 0x493E00, 9000000, 0],
            10:[0, 7000000, 7000000, 7000000, 7000000, 7000000, 7000000, 7000000, 7000000, 7000000, 7000000, 0]
        };

        public static function getName(_arg1:int):String{
            var _local2:Array = ((PetData[_arg1]) || ([]));
            return (String(_local2[0]));
        }
        public static function getReqLv(_arg1:int):int{
            var _local2:Array = ((PetData[_arg1]) || ([]));
            return (int(_local2[1]));
        }
        public static function getAttack(_arg1:int, _arg2:int):int{
            var _local3:Array = ((PetData[_arg1]) || ([]));
            return ((int(_local3[3]) + (int(_local3[2]) * _arg2)));
        }
        public static function getDefense(_arg1:int, _arg2:int):int{
            var _local3:Array = ((PetData[_arg1]) || ([]));
            return ((int(_local3[5]) + (int(_local3[4]) * _arg2)));
        }
        public static function getLife(_arg1:int, _arg2:int):int{
            var _local3:Array = ((PetData[_arg1]) || ([]));
            return ((int(_local3[15]) + (int(_local3[14]) * _arg2)));
        }
        public static function getStuntAttack(_arg1:int):int{
            var _local2:Array = ((PetData[_arg1]) || ([]));
            return (int(_local2[6]));
        }
        public static function getCritical(_arg1:int):int{
            var _local2:Array = ((PetData[_arg1]) || ([]));
            return (int(_local2[7]));
        }
        public static function getDodge(_arg1:int):int{
            var _local2:Array = ((PetData[_arg1]) || ([]));
            return (int(_local2[8]));
        }
        public static function getBlock(_arg1:int):int{
            var _local2:Array = ((PetData[_arg1]) || ([]));
            return (int(_local2[9]));
        }
        public static function getBreakCritical(_arg1:int):int{
            var _local2:Array = ((PetData[_arg1]) || ([]));
            return (int(_local2[10]));
        }
        public static function getBreakBlock(_arg1:int):int{
            var _local2:Array = ((PetData[_arg1]) || ([]));
            return (int(_local2[11]));
        }
        public static function getHit(_arg1:int):int{
            var _local2:Array = ((PetData[_arg1]) || ([]));
            return (int(_local2[12]));
        }
        public static function getKill(_arg1:int):int{
            var _local2:Array = ((PetData[_arg1]) || ([]));
            return (int(_local2[13]));
        }
        public static function getExp(_arg1:int, _arg2:int):int{
            var _local3:Array = ((PetExp[_arg1]) || ([]));
            return (int(_local3[_arg2]));
        }
        public static function getCoin(_arg1:int):int{
            var _local2:Array = ((PetCoin[_arg1]) || ([]));
            return (int(_local2[0]));
        }
        public static function getCoinExp(_arg1:int):int{
            var _local2:Array = ((PetCoin[_arg1]) || ([]));
            return (int(_local2[1]));
        }
        public static function getIngot(_arg1:int):int{
            var _local2:Array = ((PetIngot[_arg1]) || ([]));
            return (int(_local2[0]));
        }
        public static function getIngotExp(_arg1:int):int{
            var _local2:Array = ((PetIngot[_arg1]) || ([]));
            return (int(_local2[1]));
        }
        public static function getSignByLevel(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case 1:
                    _local2 = "YanLong";
                    break;
                case 2:
                    _local2 = "MuLong";
                    break;
                case 3:
                    _local2 = "ShuiLong";
                    break;
                case 4:
                    _local2 = "HuoLong";
                    break;
                case 5:
                    _local2 = "FengLong";
                    break;
                case 6:
                    _local2 = "LeiLong";
                    break;
                case 7:
                    _local2 = "BingLong";
                    break;
                case 8:
                    _local2 = "FeiLong";
                    break;
                case 9:
                    _local2 = "HeiLong";
                    break;
                case 10:
                    _local2 = "JinLong";
                    break;
            };
            return (_local2);
        }
        public static function getColor(_arg1:int):int{
            var _local2:int = 0xFFFFFF;
            switch (_arg1){
                case 1:
                case 2:
                case 3:
                    _local2 = 41193;
                    break;
                case 4:
                case 5:
                case 6:
                    _local2 = 0xFF00FF;
                    break;
                case 7:
                case 8:
                case 9:
                case 10:
                    _local2 = 0xFFF200;
                    break;
            };
            return (_local2);
        }

    }
}//package com.assist.server 
