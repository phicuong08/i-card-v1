//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.server {
    import ICard.haloer.net.*;
    import ICard.adobe.serialization.json.*;
    import ICard.assist.*;
    import ICard.haloer.data.*;

    public class AchievementType {

        private static var _achievement:Object;
        private static var _tag:Object;

        public static function loadData(_arg1:Function, _arg2:Function=null):void{
            var callback:* = _arg1;
            var error = _arg2;
            if (_achievement){
                callback();
                return;
            };
            var url:* = (URI.assetsUrl + "templet/achievement/achievement.txt");
            url = (url + ("?v=" + URI.getVersion(url)));
            var http:* = new HTTP();
            http.onComplete = function (_arg1:String):void{
                formatData(JSON.decode(_arg1));
                callback();
            };
            http.load(url);
        }
        private static function formatData(_arg1:Array):void{
            _achievement = _arg1[0];
            _tag = _arg1[1];
        }
        public static function getAchievementIds():Array{
            return (oObject.getKeys(_achievement));
        }
        public static function getSign(_arg1:int):String{
            return ((_achievement[_arg1]) ? _achievement[_arg1][0] : "");
        }
        public static function getName(_arg1:int):String{
            return ((_achievement[_arg1]) ? _achievement[_arg1][1] : "");
        }
        public static function getContent(_arg1:int):String{
            return ((_achievement[_arg1]) ? _achievement[_arg1][2] : "");
        }
        public static function getTotal(_arg1:int):int{
            return ((_achievement[_arg1]) ? _achievement[_arg1][3] : 0);
        }
        public static function getPoint(_arg1:int):int{
            return ((_achievement[_arg1]) ? _achievement[_arg1][4] : 0);
        }
        public static function getSpecialAward(_arg1:int):String{
            return ((_achievement[_arg1]) ? _achievement[_arg1][5] : "");
        }
        public static function getSortOrder(_arg1:int):int{
            return ((_achievement[_arg1]) ? _achievement[_arg1][6] : 0);
        }
        public static function getAchievementTagId(_arg1:int):int{
            return ((_achievement[_arg1]) ? _achievement[_arg1][7] : 0);
        }
        public static function getAchievementTagName(_arg1:int):String{
            return ((_tag[_arg1]) ? _tag[_arg1][1] : "");
        }
        public static function getMasterTagIds():Array{
            var _local2:String;
            var _local1:Array = [];
            for (_local2 in _tag) {
                if (_tag[_local2][0] == 0){
                    _local1.push(parseInt(_local2));
                };
            };
            return (_local1);
        }
        public static function getSlaveTagIds(_arg1:int):Array{
            var _local3:String;
            var _local2:Array = [];
            for (_local3 in _tag) {
                if ((((_tag[_local3][2] == _arg1)) && ((_tag[_local3][0] == 1)))){
                    _local2.push(parseInt(_local3));
                };
            };
            return (_local2);
        }

    }
}//package com.assist.server 
