//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import flash.events.*;
    import combat_element_script.*;
    import file_read.*;
    import tool.*;

    public class GuideLib {

        public static const guide101Name:String = "初战";
        public static const guide102Name:String = "围困";
        public static const guide103Name:String = "坚守";
        public static const guide104Name:String = "补给";
        public static const guide105Name:String = "埋伏";
        public static const guide106Name:String = "克敌";
        public static const guide107Name:String = "决战";
        public static const guide1Name:String = "义军的团结\n(编外篇)";
        public static const guide2Name:String = "温酒斩华雄";
        public static const guide3Name:String = "三英战吕布";
        public static const guide4Name:String = "跨江击刘表";
        public static const guide5Name:String = "星夜奔袭";
        public static const guide6Name:String = "深沟高垒";
        public static const guide7Name:String = "长安攻坚战";
        public static const guide108Name:String = "大战公孙瓒";
        public static const guide8Name:String = "武者之道";
        public static const guide9Name:String = "小霸王平江东";
        public static const guide10Name:String = "驱虎吞狼";
        public static const guide11Name:String = "皇帝梦";
        public static const guide12Name:String = "白马坡";
        public static const guide13Name:String = "官渡之战";
        public static const guide14Name:String = "千里走单骑";

        private static var guideSectionIds:Array = [1, 2, 3, 4, 5, 6, 7, 108, 8, 9, 10, 11, 12, 13, 14, 101, 102, 103, 104, 105, 106, 107];
        public static var guideConfig:Object;
        public static var guideFlashConfig:Object;
        private static var guideConfigFile1:Class = GuideLib_guideConfigFile1;
        private static var guideConfigFile2:Class = GuideLib_guideConfigFile2;
        private static var guideConfigFile3:Class = GuideLib_guideConfigFile3;
        private static var guideConfigFile4:Class = GuideLib_guideConfigFile4;
        private static var guideConfigFile5:Class = GuideLib_guideConfigFile5;
        private static var guideConfigFile6:Class = GuideLib_guideConfigFile6;
        private static var guideConfigFile7:Class = GuideLib_guideConfigFile7;
        private static var guideConfigFile108:Class = GuideLib_guideConfigFile108;
        private static var guideConfigFile8:Class = GuideLib_guideConfigFile8;
        private static var guideConfigFile9:Class = GuideLib_guideConfigFile9;
        private static var guideConfigFile10:Class = GuideLib_guideConfigFile10;
        private static var guideConfigFile11:Class = GuideLib_guideConfigFile11;
        private static var guideConfigFile12:Class = GuideLib_guideConfigFile12;
        private static var guideConfigFile13:Class = GuideLib_guideConfigFile13;
        private static var guideConfigFile14:Class = GuideLib_guideConfigFile14;
        private static var guideConfigFile101:Class = GuideLib_guideConfigFile101;
        private static var guideConfigFile102:Class = GuideLib_guideConfigFile102;
        private static var guideConfigFile103:Class = GuideLib_guideConfigFile103;
        private static var guideConfigFile104:Class = GuideLib_guideConfigFile104;
        private static var guideConfigFile105:Class = GuideLib_guideConfigFile105;
        private static var guideConfigFile106:Class = GuideLib_guideConfigFile106;
        private static var guideConfigFile107:Class = GuideLib_guideConfigFile107;
        private static var guideFlashConfigFile1:Class = GuideLib_guideFlashConfigFile1;
        private static var guideFlashConfigFile2:Class = GuideLib_guideFlashConfigFile2;
        private static var guideFlashConfigFile3:Class = GuideLib_guideFlashConfigFile3;
        private static var guideFlashConfigFile4:Class = GuideLib_guideFlashConfigFile4;
        private static var guideFlashConfigFile5:Class = GuideLib_guideFlashConfigFile5;
        private static var guideFlashConfigFile6:Class = GuideLib_guideFlashConfigFile6;
        private static var guideFlashConfigFile7:Class = GuideLib_guideFlashConfigFile7;
        private static var guideFlashConfigFile108:Class = GuideLib_guideFlashConfigFile108;
        private static var guideFlashConfigFile8:Class = GuideLib_guideFlashConfigFile8;
        private static var guideFlashConfigFile9:Class = GuideLib_guideFlashConfigFile9;
        private static var guideFlashConfigFile10:Class = GuideLib_guideFlashConfigFile10;
        private static var guideFlashConfigFile11:Class = GuideLib_guideFlashConfigFile11;
        private static var guideFlashConfigFile12:Class = GuideLib_guideFlashConfigFile12;
        private static var guideFlashConfigFile13:Class = GuideLib_guideFlashConfigFile13;
        private static var guideFlashConfigFile14:Class = GuideLib_guideFlashConfigFile14;
        private static var guideFlashConfigFile101:Class = GuideLib_guideFlashConfigFile101;
        private static var guideFlashConfigFile102:Class = GuideLib_guideFlashConfigFile102;
        private static var guideFlashConfigFile103:Class = GuideLib_guideFlashConfigFile103;
        private static var guideFlashConfigFile104:Class = GuideLib_guideFlashConfigFile104;
        private static var guideFlashConfigFile105:Class = GuideLib_guideFlashConfigFile105;
        private static var guideFlashConfigFile106:Class = GuideLib_guideFlashConfigFile106;
        private static var guideFlashConfigFile107:Class = GuideLib_guideFlashConfigFile107;

        public static function buildGuideConfig():void{
            var _local1:int;
            var _local2:Csv;
            guideConfig = new Object();
            for each (_local1 in guideSectionIds) {
                _local2 = new Csv();
                _local2.name = _local1;
                debugWindow.myTrace((("开始读取 guide_config_" + _local1) + ".csv 文件\n"));
                _local2.addEventListener(Event.COMPLETE, guideConfigLoadComplete);
                if (TCGClient.isDebugMode){
                    _local2.loadURL((("../src/source/etc/guide_config_" + _local1) + ".csv"));
                } else {
                    _local2.loadLocalFile(GuideLib[("guideConfigFile" + _local1)]);
                };
            };
        }
        private static function guideConfigLoadComplete(_arg1:Event):void{
            var _local4:Object;
            var _local2:Csv = (_arg1.currentTarget as Csv);
            _local2.removeEventListener(Event.COMPLETE, guideConfigLoadComplete);
            var _local3:int = _local2.name;
            guideConfig[_local3] = new Object();
            for each (_local4 in _local2.getData()) {
                guideConfig[_local3][_local4["step"]] = _local4;
            };
            debugWindow.myTrace((("guide_config.csv_" + _local3) + " 表载入成功!"));
        }
        public static function buildGuideFlashConfig():void{
            var _local1:int;
            var _local2:Csv;
            guideFlashConfig = new Object();
            for each (_local1 in guideSectionIds) {
                _local2 = new Csv();
                _local2.name = _local1;
                debugWindow.myTrace((("开始读取 guide_flash_config_" + _local1) + ".csv 文件\n"));
                _local2.addEventListener(Event.COMPLETE, guideFlashConfigLoadComplete);
                if (TCGClient.isDebugMode){
                    _local2.loadURL((("../src/source/etc/guide_flash_config_" + _local1) + ".csv"));
                } else {
                    _local2.loadLocalFile(GuideLib[("guideFlashConfigFile" + _local1)]);
                };
            };
        }
        private static function guideFlashConfigLoadComplete(_arg1:Event):void{
            var _local7:Object;
            var _local2:Csv = (_arg1.currentTarget as Csv);
            _local2.removeEventListener(Event.COMPLETE, guideFlashConfigLoadComplete);
            var _local3:int = _local2.name;
            guideFlashConfig[_local3] = new Object();
            var _local4:Array = _local2.getData();
            var _local5:int;
            var _local6:int;
            while (_local6 < _local4.length) {
                _local7 = _local4[_local6];
                if (guideFlashConfig[_local3][_local7["step"]] == null){
                    guideFlashConfig[_local3][int(_local7["step"])] = new Array();
                    _local5 = 0;
                };
                var _temp1 = _local5;
                _local5 = (_local5 + 1);
                _local7["sub_step"] = _temp1;
                _local7["content"] = StringUtils.parseColor(_local7["content"]);
                analyzeExtraInfo(_local7);
                guideFlashConfig[_local3][int(_local7["step"])].push(_local7);
                _local6++;
            };
            debugWindow.myTrace((("guide_flash_config_" + _local3) + ".csv 表载入成功!"));
        }
        private static function analyzeExtraInfo(_arg1:Object):void{
            var _local2:String = _arg1["extra_info"];
            var _local3:Array = _local2.split("@");
            var _local4:int;
            while (_local4 < (_local3.length - 1)) {
                var _temp1 = _local4;
                _local4 = (_local4 + 1);
                var _temp2 = _local4;
                _local4 = (_local4 + 1);
                _arg1[StringUtils.trim(_local3[_temp1])] = StringUtils.trim(_local3[_temp2]);
            };
        }
        public static function analyzeSpecialInfo(_arg1:Object):void{
            analyzeContent(_arg1);
            analyzeHeadIcon(_arg1);
            analyzeHeadName(_arg1);
        }
        private static function analyzeContent(_arg1:Object):void{
            var _local2:String;
            var _local3:String;
            var _local4:String;
            var _local5:String;
            var _local6:String;
            var _local7:String;
            var _local8:String;
            var _local9:String;
            var _local10:String;
            if (_arg1["content"]){
                _local2 = _arg1["content"];
                _local3 = UserObject.camp;
                switch (_local3){
                    case "曹操":
                        _local4 = "曹操、夏侯惇、夏侯渊";
                        _local5 = "曹操";
                        _local6 = "荀彧";
                        _local7 = "刘备";
                        _local8 = "曹魏";
                        _local9 = "乐进";
                        _local10 = "曹仁";
                        break;
                    case "刘备":
                        _local4 = "刘备、张飞、关羽";
                        _local5 = "刘备";
                        _local6 = "关羽";
                        _local7 = "曹操";
                        _local8 = "蜀汉";
                        _local9 = "张飞";
                        _local10 = "关羽";
                        break;
                    case "孙权":
                        _local4 = "孙坚、孙策、程普";
                        _local5 = "孙坚";
                        _local6 = "程普";
                        _local7 = "曹操";
                        _local8 = "孙吴";
                        _local9 = "黄盖";
                        _local10 = "韩当";
                        break;
                };
                _local2 = _local2.replace(/_qitajunzhu/g, _local7);
                _local2 = _local2.replace(/_junzhu/g, _local5);
                _local2 = _local2.replace(/_junshi/g, _local6);
                _local2 = _local2.replace(/_wujiang/g, _local4);
                _local2 = _local2.replace(/_wanjia/g, UserObject.name);
                _local2 = _local2.replace(/_kazu/g, _local8);
                _local2 = _local2.replace(/_monster_1_1/g, _local9);
                _local2 = _local2.replace(/_monster_1_2/g, _local10);
                _arg1["content"] = _local2;
            };
        }
        private static function analyzeHeadIcon(_arg1:Object):void{
            var _local2:String;
            var _local3:String;
            var _local4:String;
            var _local5:String;
            if (_arg1["head_icon"]){
                _local2 = _arg1["head_icon"];
                if (_local2.indexOf("_wanjia") != -1){
                    _local2 = (("source/userHead/" + UserObject.headIcon) + ".jpg");
                } else {
                    _local3 = UserObject.camp;
                    switch (_local3){
                        case "曹操":
                            _local4 = "7";
                            _local5 = "315";
                            break;
                        case "刘备":
                            _local4 = "41";
                            _local5 = "42";
                            break;
                        case "孙权":
                            _local4 = "81";
                            _local5 = "84";
                            break;
                    };
                    _local2 = _local2.replace(/_junzhu/g, _local4);
                    _local2 = _local2.replace(/_junshi/g, _local5);
                    _local2 = (("source/cardImages/" + _local2) + ".jpg");
                };
                _arg1["head_icon"] = _local2;
            };
        }
        private static function analyzeHeadName(_arg1:Object):void{
            var _local2:String;
            var _local3:String;
            var _local4:String;
            var _local5:String;
            if (_arg1["head_name"]){
                _local2 = _arg1["head_name"];
                _local3 = UserObject.camp;
                switch (_local3){
                    case "曹操":
                        _local4 = "曹操";
                        _local5 = "荀彧";
                        break;
                    case "刘备":
                        _local4 = "刘备";
                        _local5 = "关羽";
                        break;
                    case "孙权":
                        _local4 = "孙坚";
                        _local5 = "程普";
                        break;
                };
                _local2 = _local2.replace(/_junzhu/g, _local4);
                _local2 = _local2.replace(/_junshi/g, _local5);
                _local2 = _local2.replace(/_wanjia/g, UserObject.name);
                _arg1["head_name"] = _local2;
            };
        }

    }
}//package task_guide 
