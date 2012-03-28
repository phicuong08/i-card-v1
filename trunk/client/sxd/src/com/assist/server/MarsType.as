//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class MarsType {

        private static const Offerings:Object = {
            1:["白檀香", 5, 120, 10, 0, 100, 0],
            2:["苏合香", 50, 240, 100, 30, 0, 1],
            3:["天木香", 1000, 720, 1000, 90, 0, 2]
        };

        public static function getOfferingName(_arg1:int):String{
            return ((Offerings[_arg1]) ? Offerings[_arg1][0] : "");
        }
        public static function getOfferingExp(_arg1:int):int{
            return ((Offerings[_arg1]) ? Offerings[_arg1][1] : 0);
        }
        public static function getOfferingBlessingCount(_arg1:int):int{
            return ((Offerings[_arg1]) ? Offerings[_arg1][2] : 0);
        }
        public static function getOfferingFame(_arg1:int):int{
            return ((Offerings[_arg1]) ? Offerings[_arg1][3] : 0);
        }
        public static function getOfferingIngot(_arg1:int):int{
            return ((Offerings[_arg1]) ? Offerings[_arg1][4] : 0);
        }
        public static function getOfferingSkill(_arg1:int):int{
            return ((Offerings[_arg1]) ? Offerings[_arg1][5] : 0);
        }
        public static function getOfferingVipLevel(_arg1:int):int{
            return ((Offerings[_arg1]) ? Offerings[_arg1][6] : 0);
        }

    }
}//package com.assist.server 
