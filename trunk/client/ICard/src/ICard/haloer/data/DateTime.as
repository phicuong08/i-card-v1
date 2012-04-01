//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.haloer.data {
    import ICard.*;
    import ICard.lang.client.com.haloer.data.*;

    public class DateTime {

        public static function formatFromSecond(_arg1:uint):String{
            var _local2:uint = Math.floor((_arg1 / 3600));
            var _local3:uint = Math.floor(((_arg1 - (_local2 * 3600)) / 60));
            var _local4:uint = (_arg1 % 60);
            var _local5:String = OneDigitAddZero(_local2);
            var _local6:String = OneDigitAddZero(_local3);
            var _local7:String = OneDigitAddZero(_local4);
            if (_local5 == "00"){
                return (((_local6 + ":") + _local7));
            };
            return (((((_local5 + ":") + _local6) + ":") + _local7));
        }
        public static function formatFromSecond1(_arg1:uint):String{
            var _local2:uint = Math.floor((_arg1 / 3600));
            var _local3:uint = Math.floor(((_arg1 - (_local2 * 3600)) / 60));
            var _local4:uint = (_arg1 % 60);
            var _local5:String = _local2.toString();
            var _local6:String = _local3.toString();
            var _local7:String = _local4.toString();
            var _local8 = "";
            if (_local5 != "0"){
                _local8 = Lang.sprintf(DateTimeLang.Hour, _local5);
            };
            if (_local6 != "0"){
                _local8 = (_local8 + Lang.sprintf(DateTimeLang.Minute, _local6));
            };
            if (_local7 != "0"){
                _local8 = (_local8 + Lang.sprintf(DateTimeLang.Second, _local7));
            };
            return (_local8);
        }
        public static function formatFromSecond2(_arg1:uint, _arg2:uint):String{
            var _local3:int = (_arg2 - _arg1);
            var _local4:int = Math.floor((_local3 / (3600 * 24)));
            if (_local4 > 30){
                return (DateTimeLang.OngMonthAgo);
            };
            if ((((_local4 >= 2)) && ((_local4 <= 30)))){
                return (Lang.sprintf(DateTimeLang.DayAgo, _local4));
            };
            if (_local4 == 1){
                return (DateTimeLang.Yesterday);
            };
            var _local5:int = Math.floor((_local3 / 3600));
            if (_local5 >= 1){
                return (Lang.sprintf(DateTimeLang.HourAgo, _local5));
            };
            var _local6:int = Math.floor((_local3 / 60));
            if (_local6 >= 30){
                return (DateTimeLang.HalfAnHour);
            };
            if ((((_local6 > 0)) && ((_local6 < 30)))){
                return (Lang.sprintf(DateTimeLang.SecondAgo, _local6));
            };
            return (DateTimeLang.Just);
        }
        private static function OneDigitAddZero(_arg1:uint):String{
            if (_arg1 < 10){
                return (("0" + _arg1));
            };
            return (_arg1.toString());
        }

    }
}//package com.haloer.data 
