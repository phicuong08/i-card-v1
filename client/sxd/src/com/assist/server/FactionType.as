//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class FactionType {

        private static const Camps:Object = {
            1:[WeiKaiFang, "未开放"],
            2:[WeiXuanZe, "未选择"],
            3:[ShuShanCheng, "蜀山"],
            4:[KunLunCheng, "昆仑"],
            5:[PengLaiDao, "蓬莱"]
        };
        public static const WeiKaiFang:String = "WeiKaiFang";
        public static const WeiXuanZe:String = "WeiXuanZe";
        public static const ShuShanCheng:String = "ShuShanCheng";
        public static const KunLunCheng:String = "KunLunCheng";
        public static const PengLaiDao:String = "PengLaiDao";
        private static const FactionJobs:Object = {
            1:["HuiZhang", "会长"],
            2:["FuHuiZhang", "副会长"]
        };
        private static const FactionLevels:Object = {};
        private static const GodOfferings:Object = {
            1:["白檀香", 0, 5, 10, 10, 0, 100],
            2:["苏合香", 30, 50, 100, 30, 1, 0],
            3:["天木香", 90, 1000, 1000, 100, 2, 0]
        };

        public static function campId(_arg1:String):int{
            var _local2:int;
            var _local3:Object;
            var _local4:Object;
            for (_local3 in Camps) {
                _local4 = Camps[_local3];
                if (_local4[0] == _arg1){
                    _local2 = (_local3 as int);
                    break;
                };
            };
            return (_local2);
        }
        public static function campSign(_arg1:int):String{
            var _local2:String;
            var _local3:Object;
            for (_local3 in Camps) {
                if (_local3 == _arg1){
                    _local2 = Camps[_local3][0];
                    break;
                };
            };
            return (_local2);
        }
        public static function campName(_arg1:int):String{
            var _local2:String = "";
            if (hasCamp(_arg1)){
                _local2 = Camps[_arg1][1];
            };
            return (_local2);
        }
        public static function hasCamp(_arg1:int):Boolean{
            var _local2:String = campSign(_arg1);
            return (((((_local2) && (!((_local2 == WeiXuanZe))))) && (!((_local2 == WeiKaiFang)))));
        }
        public static function getOfferName(_arg1:int):String{
            return ((GodOfferings[_arg1]) ? GodOfferings[_arg1][0] : "");
        }
        public static function getOfferIngot(_arg1:int):int{
            return ((GodOfferings[_arg1]) ? GodOfferings[_arg1][1] : 0);
        }
        public static function getOfferExp(_arg1:int):int{
            return ((GodOfferings[_arg1]) ? GodOfferings[_arg1][2] : 0);
        }
        public static function getOfferFame(_arg1:int):int{
            return ((GodOfferings[_arg1]) ? GodOfferings[_arg1][3] : 0);
        }
        public static function getOfferBlessingCount(_arg1:int):int{
            return ((GodOfferings[_arg1]) ? GodOfferings[_arg1][4] : 0);
        }
        public static function getOffsetVIPLevel(_arg1:int):int{
            return ((GodOfferings[_arg1]) ? GodOfferings[_arg1][5] : 0);
        }
        public static function getOffsetSkill(_arg1:int):int{
            return ((GodOfferings[_arg1]) ? GodOfferings[_arg1][6] : 0);
        }

    }
}//package com.assist.server 
