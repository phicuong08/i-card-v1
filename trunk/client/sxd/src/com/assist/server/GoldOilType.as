//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class GoldOilType {

        private static const Oils:Object = {
            1203:["一星", 90, 1, 0, 5000000, 0, 60],
            1204:["二星", 100, 2, 1203, 5000000, 0, 90],
            1205:["三星", 110, 3, 1204, 5000000, 0, 120],
            1206:["四星", 120, 4, 1205, 5000000, 0, 150],
            1207:["五星", 130, 5, 1206, 5000000, 0, 180],
            1208:["六星", 140, 6, 1207, 5000000, 0, 210],
            1209:["七星", 150, 7, 1208, 5000000, 0, 240],
            1210:["八星", 160, 8, 1209, 5000000, 0, 270],
            1211:["九星", 170, 9, 1210, 5000000, 0, 300]
        };
        private static const Data:Array = [[1203, 1, 0, 20, 0, 30, 0, 0, 0], [1203, 2, 30, 0, 7, 0, 30, 0, 0], [1203, 3, 0, 0, 30, 0, 0, 0, 0], [1203, 4, 0, 60, 0, 0, 0, 0, 0], [1203, 5, 0, 0, 0, 0, 0, 0, 80], [1203, 6, 0, 0, 0, 80, 0, 0, 0], [1204, 1, 0, 30, 0, 40, 0, 0, 0], [1204, 2, 40, 0, 8, 0, 40, 0, 0], [1204, 3, 0, 0, 40, 0, 0, 0, 0], [1204, 4, 0, 80, 0, 0, 0, 0, 0], [1204, 5, 0, 0, 0, 0, 0, 0, 100], [1204, 6, 0, 0, 0, 100, 0, 0, 0], [1205, 1, 0, 40, 0, 50, 0, 0, 0], [1205, 2, 50, 0, 9, 0, 50, 0, 0], [1205, 3, 0, 0, 50, 0, 0, 0, 0], [1205, 4, 0, 100, 0, 0, 0, 0, 0], [1205, 5, 0, 0, 0, 0, 0, 0, 120], [1205, 6, 0, 0, 0, 120, 0, 0, 0], [1206, 1, 0, 50, 0, 60, 0, 0, 0], [1206, 2, 60, 0, 10, 0, 60, 0, 0], [1206, 3, 0, 0, 60, 0, 0, 0, 0], [1206, 4, 0, 120, 0, 0, 0, 0, 0], [1206, 5, 0, 0, 0, 0, 0, 0, 140], [1206, 6, 0, 0, 0, 140, 0, 0, 0], [1207, 1, 0, 60, 0, 70, 0, 0, 0], [1207, 2, 70, 0, 11, 0, 70, 0, 0], [1207, 3, 0, 0, 70, 0, 0, 0, 0], [1207, 4, 0, 140, 0, 0, 0, 0, 0], [1207, 5, 0, 0, 0, 0, 0, 0, 160], [1207, 6, 0, 0, 0, 160, 0, 0, 0]];

        public static function getAllOilItemIds():Array{
            var _local2:String;
            var _local1:Array = [];
            for (_local2 in Oils) {
                _local1[(Oils[_local2][2] - 1)] = parseInt(_local2);
            };
            return (_local1);
        }
        public static function getOilName(_arg1:int):String{
            return (ItemType.getName(_arg1));
        }
        public static function getItemLevel(_arg1:int):int{
            var _local2:Array = Oils[_arg1];
            return ((_local2) ? _local2[1] : 0);
        }
        public static function getOilLevel(_arg1:int):int{
            var _local2:Array = Oils[_arg1];
            return ((_local2) ? _local2[2] : 0);
        }
        public static function getPrevOilItemId(_arg1:int):int{
            var _local2:Array = Oils[_arg1];
            return ((_local2) ? _local2[3] : 0);
        }
        public static function getUseCoin(_arg1:int):int{
            var _local2:Array = Oils[_arg1];
            return ((_local2) ? _local2[4] : 0);
        }
        public static function getUseStatePoint(_arg1:int):int{
            var _local2:Array = Oils[_arg1];
            return ((_local2) ? _local2[5] : 0);
        }
        public static function getExchangeStatePoint(_arg1:int):int{
            var _local2:Array = Oils[_arg1];
            return ((_local2) ? _local2[6] : 0);
        }
        public static function getOilAttr(_arg1:int, _arg2:int):Object{
            var _local3:Array = [];
            var _local4:int = Data.length;
            var _local5:int;
            while (_local5 < _local4) {
                if ((((Data[_local5][0] == _arg1)) && ((Data[_local5][1] == _arg2)))){
                    _local3 = Data[_local5];
                    break;
                };
                _local5++;
            };
            return ({
                attackUp:((_local3[2]) || (0)),
                defenseUp:((_local3[3]) || (0)),
                stuntAttackUp:((_local3[4]) || (0)),
                stuntDefenseUp:((_local3[5]) || (0)),
                magicAttackUp:((_local3[6]) || (0)),
                magicDefenseUp:((_local3[7]) || (0)),
                healthUp:((_local3[8]) || (0))
            });
        }

    }
}//package com.assist.server 
