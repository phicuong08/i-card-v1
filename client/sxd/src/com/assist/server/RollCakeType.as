//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {
    import com.haloer.net.*;
    import com.adobe.serialization.json.*;
    import com.assist.*;

    public class RollCakeType {

        private static var _rollCake:Object;
        private static var _rollCount:Object;

        public static function loadData(_arg1:Function, _arg2:Function=null):void{
            var callback:* = _arg1;
            var error:Function = _arg2;
            if (_rollCake){
                callback();
                return;
            };
            var url:* = (URI.assetsUrl + "templet/roll_cake/roll_cake.txt");
            url = (url + ("?v=" + URI.getVersion(url)));
            var http:* = new HTTP();
            http.onComplete = function (_arg1:String):void{
                formatData(com.adobe.serialization.json.JSON.decode(_arg1));
                callback();
            };
            http.load(url);
        }
        private static function formatData(_arg1:Array):void{
            _rollCake = _arg1[0];
            _rollCount = _arg1[1];
        }
        public static function getRollCakeName(_arg1:int):String{
            return ((_rollCake[_arg1]) ? _rollCake[_arg1][0] : "");
        }
        public static function getRollCakeNickName(_arg1:int):String{
            return ((_rollCake[_arg1]) ? _rollCake[_arg1][1] : "");
        }
        public static function getRollCakeSkill(_arg1:int):int{
            return ((_rollCake[_arg1]) ? _rollCake[_arg1][2] : 0);
        }
        public static function getRollCakeStatePoint(_arg1:int):int{
            return ((_rollCake[_arg1]) ? _rollCake[_arg1][3] : 0);
        }
        public static function getRollCountText(_arg1:int):String{
            return ((_rollCount[_arg1]) ? _rollCount[_arg1][0] : "");
        }
        public static function getRollCountPicture(_arg1:int):String{
            return ((_rollCount[_arg1]) ? _rollCount[_arg1][1] : "");
        }

    }
}//package com.assist.server 
