//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class MultipleMissionType {

        private static const Datas:Object = {
            2:[29, "皇宫", 90, 2000, 145],
            3:[82, "封神陵", 300, 4000, 145],
            4:[104, "炼妖塔", 380, 8000, 344],
            5:[20, "乱葬岗", 60, 1000, 145],
            6:[126, "玄冥界", 560, 16000, 344],
            7:[151, "虚天殿", 580, 0x7D00, 345],
            8:[454, "比武场", 600, 0xFA00, 346],
            9:[488, "鲲鱼之腹", 640, 68000, 346],
            10:[525, "玄净寺", 680, 72000, 346],
            11:[580, "东瀛", 700, 78000, 346],
            12:[634, "秦始皇陵", 740, 84000, 347],
            13:[0, "1", 0, 0, 0],
            14:[0, "2", 0, 0, 0],
            15:[0, "3", 0, 0, 0],
            16:[0, "4", 0, 0, 0],
            17:[0, "5", 0, 0, 0],
            18:[0, "6", 0, 0, 0],
            19:[0, "7", 0, 0, 0],
            20:[0, "8", 0, 0, 0],
            21:[0, "9", 0, 0, 0],
            22:[0, "10", 0, 0, 0],
            23:[0, "11", 0, 0, 0],
            24:[0, "12", 0, 0, 0],
            25:[0, "13", 0, 0, 0],
            26:[0, "14", 0, 0, 0],
            27:[0, "15", 0, 0, 0],
            28:[0, "16", 0, 0, 0],
            29:[0, "17", 0, 0, 0],
            30:[0, "18", 0, 0, 0],
            31:[0, "19", 0, 0, 0],
            32:[0, "20", 0, 0, 0],
            33:[0, "21", 0, 0, 0],
            34:[0, "22", 0, 0, 0],
            35:[0, "23", 0, 0, 0],
            36:[0, "24", 0, 0, 0],
            37:[0, "25", 0, 0, 0],
            38:[0, "26", 0, 0, 0],
            39:[0, "27", 0, 0, 0],
            40:[672, "古城废墟", 780, 90000, 347],
            41:[719, "黑暗皇城", 820, 96000, 347],
            42:[755, "神魔战场", 860, 102000, 347]
        };

        public static function getMissionName(_arg1:int):String{
            var _local2:Object = Datas[_arg1];
            return ((_local2) ? _local2[1] : "");
        }
        public static function getAwardSkill(_arg1:int):int{
            var _local2:Object = Datas[_arg1];
            return ((_local2) ? _local2[2] : 0);
        }
        public static function getAwardExp(_arg1:int):int{
            var _local2:Object = Datas[_arg1];
            return ((_local2) ? _local2[3] : 0);
        }
        public static function getAwardItemId(_arg1:int):int{
            var _local2:Object = Datas[_arg1];
            return ((_local2) ? _local2[4] : 0);
        }

    }
}//package com.assist.server 
