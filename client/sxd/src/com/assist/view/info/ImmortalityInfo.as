//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.info {

    public class ImmortalityInfo {

        private static const WuLiDan:int = 11001;
        private static const JueJiDan:int = 11002;
        private static const FaShuDan:int = 11003;

        public static var tipsList1:Array;
        public static var tipsList2:Array;
        public static var idlist:Array = [[380, 438, 440, 444, 448, 452], [463, 466, 468, 471, 473, 475], [488, 491, 493, 496, 499, 501]];

        public var listWuli:Array;
        public var listJueJi:Array;
        public var listFaShu:Array;
        public var isSee:Boolean = false;
        public var inogteat:Boolean = false;
        public var inogteat6:Boolean = false;
        public var roleLv:int = 0;
        public var roleName:String = "";

        public function ImmortalityInfo(){
            this.listWuli = [];
            this.listJueJi = [];
            this.listFaShu = [];
            super();
            if (tipsList1 == null){
                tipsList1 = [];
                tipsList2 = [];
                addDanYaoTip(WuLiDan, idlist[0]);
                addDanYaoTip(JueJiDan, idlist[1]);
                addDanYaoTip(FaShuDan, idlist[2]);
            };
        }
        private static function addDanYaoTip(_arg1:int, _arg2:Array):void{
            var _local6:ItemInfo;
            tipsList1[_arg1] = [];
            tipsList2[_arg1] = [];
            var _local3:int;
            var _local4:int;
            var _local5:int;
            while (_local4 < 6) {
                _local3 = (10 + (_local4 * 5));
                _local5 = _arg2[_local4];
                tipsList1[_arg1][_local4] = [];
                tipsList2[_arg1][_local4] = [];
                while (_local3 > 0) {
                    _local6 = new ItemInfo();
                    _local6.propertyAdd = _local3;
                    _local6.parseSee(_local5);
                    tipsList1[_arg1][_local4].push(_local6.getTipsSprite1("", ""));
                    tipsList2[_arg1][_local4].push(_local6.getTipsSprite2("", ""));
                    _local3 = (_local3 - 5);
                };
                _local4++;
            };
        }

    }
}//package com.assist.view.info 
