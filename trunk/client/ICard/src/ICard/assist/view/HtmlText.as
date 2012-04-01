//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view {

    public class HtmlText {

        public static const Yellow:uint = 0xFFFF00;
        public static const Red:uint = 0xFF0000;
        public static const White:uint = 0xFFFFFF;
        public static const Green:uint = 0xFF00;
        public static const Blue:uint = 0xFF;
        public static const Orange:uint = 16225309;
        public static const Blue2:uint = 44783;
        public static const Yellow2:uint = 0xFFF200;
        public static const Purple:uint = 0xFF00FF;

        public static function yellow(_arg1:String):String{
            return (format(_arg1, Yellow));
        }
        public static function red(_arg1:String):String{
            return (format(_arg1, Red));
        }
        public static function white(_arg1:String):String{
            return (format(_arg1, White));
        }
        public static function green(_arg1:String):String{
            return (format(_arg1, Green));
        }
        public static function blue(_arg1:String):String{
            return (format(_arg1, Blue));
        }
        public static function orange(_arg1:String):String{
            return (format(_arg1, Orange));
        }
        public static function blue2(_arg1:String):String{
            return (format(_arg1, Blue2));
        }
        public static function yellow2(_arg1:String):String{
            return (format(_arg1, Yellow2));
        }
        public static function purple(_arg1:String):String{
            return (format(_arg1, Purple));
        }
        public static function format(_arg1:String, _arg2:uint=0, _arg3:uint=12, _arg4:String="", _arg5:Boolean=false, _arg6:Boolean=false, _arg7:Boolean=false, _arg8:String=null, _arg9:String=null):String{
            if (_arg5){
                _arg1 = (("<b>" + _arg1) + "</b>");
            };
            if (_arg6){
                _arg1 = (("<i>" + _arg1) + "</i>");
            };
            if (_arg7){
                _arg1 = (("<u>" + _arg1) + "</u>");
            };
            var _local10 = "";
            if (_arg4){
                _local10 = (_local10 + ((" font=\"" + _arg4) + "\""));
            };
            if (_arg3 > 0){
                _local10 = (_local10 + ((" size=\"" + _arg3) + "\""));
            };
            _local10 = (_local10 + ((" color=\"#" + _arg2.toString(16)) + "\""));
            _arg1 = (((("<font" + _local10) + ">") + _arg1) + "</font>");
            if (_arg8){
                _arg1 = (((("<a href=\"" + _arg8) + "\" target=\"_blank\">") + _arg1) + "</a>");
            };
            if (_arg9){
                _arg1 = (((("<p align=\"" + _arg9) + "\">") + _arg1) + "</p>");
            };
            return (_arg1);
        }

    }
}//package com.assist.view 
