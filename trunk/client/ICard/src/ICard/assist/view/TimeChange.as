//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view {
    import ICard.*;
    import ICard.lang.client.com.assist.view.*;

    public class TimeChange {

        public static const lastDay:String = TimeChangeLang.OutOfSeven;

        public static function timeFormat(_arg1:Object, _arg2:Boolean=true, _arg3:Boolean=true):Object{
            var _local4:Date = new Date((_arg1.startTime * 1000));
            var _local5:Date = new Date((_arg1.endTime * 1000));
            var _local6 = "";
            if (((_arg2) && (_arg3))){
                _local6 = " - ";
            };
            var _local7 = "";
            if (_arg2){
                _local7 = (_local7 + ((_local4.hours + ":") + hoursFormat(_local4.minutes)));
            };
            _local7 = (_local7 + _local6);
            if (_arg3){
                _local7 = (_local7 + ((_local5.hours + ":") + hoursFormat(_local5.minutes)));
            };
            return ({
                openTime:_local7,
                time:((_local4.hours + ".") + _local4.minutes)
            });
        }
        public static function hoursFormat(_arg1:Number):String{
            var _local2:String;
            if (_arg1 < 10){
                _local2 = ("0" + _arg1);
            } else {
                _local2 = (_arg1 + "");
            };
            return (_local2);
        }
        public static function countStr(_arg1:String):int{
            var _local2:int;
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                if (_arg1.charCodeAt(_local4) > 127){
                    _local2 = (_local2 + 2);
                } else {
                    _local2++;
                };
                _local4++;
            };
            return (_local2);
        }
        public static function mainTimerDate(_arg1:Number, _arg2:Boolean=true, _arg3:Boolean=true, _arg4:Boolean=true, _arg5:Boolean=true, _arg6:Boolean=true, _arg7:Boolean=true, _arg8:String=""):String{
            var _local12:String;
            var _local13:String;
            var _local14:String;
            var _local15:String;
            var _local16:String;
            var _local17:String;
            var _local9:Date = new Date((_arg1 * 1000));
            var _local10:Array = [];
            var _local11 = "";
            if (_arg2){
                _local12 = hoursFormat(_local9.fullYear);
                _local11 = (_local11 + (_local12 + TimeChangeLang.Year));
                _local10.push(_local12);
            };
            if (_arg3){
                _local13 = hoursFormat((_local9.month + 1));
                _local11 = (_local11 + (_local13 + TimeChangeLang.Month));
                _local10.push(_local13);
            };
            if (_arg4){
                _local14 = hoursFormat(_local9.getDate());
                _local11 = (_local11 + (_local14 + TimeChangeLang.Date));
                _local10.push(_local14);
            };
            if (_arg5){
                _local15 = hoursFormat(_local9.hours);
                _local11 = (_local11 + (_local15 + TimeChangeLang.Hour));
                _local10.push(_local15);
            };
            if (_arg6){
                _local16 = hoursFormat(_local9.minutes);
                _local11 = (_local11 + (_local16 + TimeChangeLang.Minute));
                _local10.push(_local16);
            };
            if (_arg7){
                _local17 = hoursFormat(_local9.seconds);
                _local11 = (_local11 + (_local17 + TimeChangeLang.Second));
                _local10.push(_local17);
            };
            if (_arg8.length >= 1){
                _local11 = _local10.join(_arg8);
            };
            return (_local11);
        }
        public static function timerToNum(_arg1:Number):String{
            var _local2:Date = new Date((_arg1 * 1000));
            var _local3:String = ((hoursFormat(_local2.hours) + ".") + hoursFormat(_local2.minutes));
            return (_local3);
        }
        public static function timerInfo(_arg1:Number, _arg2:Number, _arg3:String="Current"):String{
            if (_arg3 == "Current"){
                _arg3 = TimeChangeLang.Current;
            };
            var _local4:int = (_arg2 - _arg1);
            var _local5:int = (_local4 / 86400);
            var _local6:int = (_local4 / 3600);
            var _local7:int = (_local4 / 60);
            if (_local5 >= 7){
                return (lastDay);
            };
            if ((((_local5 >= 2)) && ((_local5 < 7)))){
                return (Lang.sprintf(TimeChangeLang.DaysAgo, _local5));
            };
            if (_local5 >= 1){
                return (TimeChangeLang.Yesterday);
            };
            if (_local6 >= 1){
                return (Lang.sprintf(TimeChangeLang.HoursAgo, _local6));
            };
            if (_local7 >= 30){
                return (TimeChangeLang.HalfHourAgo);
            };
            if (_local7 <= 0){
                return (_arg3);
            };
            return (Lang.sprintf(TimeChangeLang.MinutesAgo, _local7));
        }
        public static function diffTimerInfo(_arg1:Number, _arg2:Number):Object{
            var _local3:Date = new Date((_arg1 * 1000));
            var _local4:Date = new Date((_arg2 * 1000));
            var _local5:Number = (_local4.getDate() - _local3.getDate());
            var _local6:Number = (_local4.hours - _local3.hours);
            var _local7:Number = (_local4.minutes - _local3.minutes);
            var _local8:Object = {};
            _local8.date = _local5;
            _local8.hours = _local6;
            _local8.minutes = _local7;
            return (_local8);
        }
        public static function mainTime(_arg1:int, _arg2:String, _arg3:Boolean=true, _arg4:Boolean=true, _arg5:Boolean=true):String{
            var _local6:int = _arg1;
            var _local7:int;
            var _local8:int;
            var _local9:int;
            var _local10 = "";
            var _local11 = "";
            var _local12 = "";
            if ((_local6 / 3600) > 0){
                _local7 = Math.floor((_local6 / 3600));
                _local6 = (_local6 - (_local7 * 3600));
            };
            if ((_local6 / 60) > 0){
                _local8 = Math.floor((_local6 / 60));
                _local6 = (_local6 - (_local8 * 60));
            };
            _local9 = _local6;
            _local10 = hoursFormat(_local7);
            _local11 = hoursFormat(_local8);
            _local12 = hoursFormat(_local9);
            var _local13:Array = [];
            if (_arg3){
                _local13.push(_local10);
            };
            if (_arg4){
                _local13.push(_local11);
            };
            if (_arg5){
                _local13.push(_local12);
            };
            if (_local7 >= 72){
                return (TimeChangeLang.ThreeDaysLater);
            };
            if ((((_local7 >= 48)) && ((_local7 < 72)))){
                return (TimeChangeLang.Acquired);
            };
            if ((((_local7 >= 24)) && ((_local7 < 48)))){
                return (TimeChangeLang.Tomorrow);
            };
            var _local14:String = _local13.join(_arg2);
            return (_local14);
        }
        public static function mainTime2(_arg1:int, _arg2:String, _arg3:Boolean=false, _arg4:Boolean=true, _arg5:Boolean=true, _arg6:Boolean=true):Array{
            var _local7:int = _arg1;
            var _local8:int;
            var _local9:int;
            var _local10:int;
            var _local11 = "";
            var _local12 = "";
            var _local13 = "";
            if ((_local7 / 3600) > 0){
                _local8 = Math.floor((_local7 / 3600));
                _local7 = (_local7 - (_local8 * 3600));
            };
            if ((_local7 / 60) > 0){
                _local9 = Math.floor((_local7 / 60));
                _local7 = (_local7 - (_local9 * 60));
            };
            _local10 = _local7;
            if (_arg3){
                _local11 = hoursFormat(_local8);
                _local12 = hoursFormat(_local9);
                _local13 = hoursFormat(_local10);
            } else {
                _local11 = (_local8 + "");
                _local12 = (_local9 + "");
                _local13 = (_local10 + "");
            };
            var _local14:Array = [];
            if (_arg4){
                _local14.push(_local11);
            };
            if (_arg5){
                _local14.push(_local12);
            };
            if (_arg6){
                _local14.push(_local13);
            };
            return (_local14);
        }

    }
}//package com.assist.view 
