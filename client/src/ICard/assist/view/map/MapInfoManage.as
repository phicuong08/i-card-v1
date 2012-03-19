//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.map {
    import ICard.assist.view.info.*;
    import ICard.assist.*;
    import ICard.assist.server.*;

    public class MapInfoManage {

        private static var townCache:Object = {};
        private static var bossCache:Object = {};
        private static var jihuisuoCache:Object = {};
        private static var missionCache:Object = {};

        public static function getTownMapInfo(_arg1:String, _arg2:Function):MapInfo{
            var _local4:String;
            var _local5:String;
            var _local6:String;
            var _local3:MapInfo = (townCache[_arg1] as MapInfo);
            if (_local3 == null){
                _local3 = new MapInfo();
                townCache[_arg1] = _local3;
                _local3.name = TownType.getNameBySign(_arg1);
                _local4 = "/map.swf";
                _local5 = "/miniJPG.jpg";
                _local6 = "/config.xml";
                _local3.url = getVersion(((URI.townUrl + _arg1) + _local4));
                _local3.urlMini = getVersion(((URI.townUrl + _arg1) + _local5));
                _local3.urlXML = getVersion(((URI.townUrl + _arg1) + _local6));
                _local3.loadXML();
            };
            _local3.onComplete = _arg2;
            return (_local3);
        }
        public static function getMissionMapInfo(_arg1:int, _arg2:int, _arg3:Function):MapInfo{
            var _local4:String = MissionType.getSectionSignByMissionId(_arg1);
            var _local5:MapInfo = (missionCache[((_local4 + "_") + _arg2)] as MapInfo);
            if (_local5 == null){
                _local5 = new MapInfo();
                missionCache[((_local4 + "_") + _arg2)] = _local5;
                _local5.name = MissionType.getMissionName(_arg1);
                _local5.url = getVersion(((((URI.missionUrl + _local4) + "/map_") + _arg2) + ".swf"));
                _local5.urlMini = getVersion(((((URI.missionUrl + _local4) + "/miniJPG_") + _arg2) + ".jpg"));
                _local5.urlXML = getVersion(((((URI.missionUrl + _local4) + "/config_") + _arg2) + ".xml"));
                _local5.loadXML();
            };
            _local5.onComplete = _arg3;
            return (_local5);
        }
        private static function getVersion(_arg1:String):String{
            return (((_arg1 + "?v=") + URI.getVersion(_arg1)));
        }

    }
}//package com.assist.view.map 
