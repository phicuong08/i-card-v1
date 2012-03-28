//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class PeachType {

        private static const PeachData:Object = {
            1:[750000],
            2:[1000000],
            3:[1400000],
            4:[1800000],
            5:[5000000],
            6:[0xB71B00],
            7:[13000000],
            8:[13500000],
            9:[14000000],
            10:[14250000],
            11:[14500000],
            12:[14750000],
            13:[15000000],
            14:[15250000]
        };
        public static const MaxLevel:int = 14;

        public static function getExp(_arg1:int):int{
            return ((PeachData[_arg1]) ? PeachData[_arg1][0] : 0);
        }

    }
}//package com.assist.server 
