//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view {

    public class HtmlText {
				// 颜色
        public static const Yellow:uint = 0xFFFF00;
        public static const Red:uint = 0xFF0000;
        public static const White:uint = 0xFFFFFF;
        public static const Green:uint = 0xFF00;
        public static const Blue:uint = 0xFF;
        public static const Orange:uint = 16225309;
        public static const Blue2:uint = 44783;
        public static const Yellow2:uint = 0xFFF200;
        public static const Purple:uint = 0xFF00FF;
      	public static const SKYBLUE:uint = 0x0080FF;		// 淡蓝，天空蓝--不建议
		public static const PURPLE:uint = 0x7600EC;		    // 紫--不建议
		public static const JACINTH:uint = 0xFFA042;		// 桔红
		public static const DARKYELLOW:uint = 0xD5D500;	// 暗黄--不建议
		public static const GREY:uint = 0x999999;		//灰

        //字体大小
		public static const FONTSIZE_1:uint = 24	// 大号
		public static const FONTSIZE_2:uint = 19	// 偏大号
		public static const FONTSIZE_3:uint = 15	// 中号
		public static const FONTSIZE_4:uint = 10	// 偏小号
		public static const FONTSIZE_5:uint = 7	// 小号
				
		//换行
		private static const _newLineSign:String = "<br>";
		private static const _tabSign:String = "<tab>";
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
        public static function format(_arg1:String, colorVal:uint=0, fontsize:uint=12, fontstyle:String="", 
        								bBlod:Boolean=false, bItalic:Boolean=false, bUnderline:Boolean=false, urlLink:String=null, alignStyle:String=null):String{
            if (bBlod){
                _arg1 = (("<b>" + _arg1) + "</b>");
            };
            if (bItalic){
                _arg1 = (("<i>" + _arg1) + "</i>");
            };
            if (bUnderline){
                _arg1 = (("<u>" + _arg1) + "</u>");
            };
            var _local10:String = "";
            if (fontstyle){
                _local10 = (_local10 + ((" font=\"" + fontstyle) + "\""));
            };
            if (fontsize > 0){
                _local10 = (_local10 + ((" size=\"" + fontsize) + "\""));
            };
            _local10 = (_local10 + ((" color=\"#" + colorVal.toString(16)) + "\""));
            _arg1 = (((("<font" + _local10) + ">") + _arg1) + "</font>");
            if (urlLink){
                _arg1 = (((("<a href=\"" + urlLink) + "\" target=\"_blank\">") + _arg1) + "</a>");
            };
            if (alignStyle){
                _arg1 = (((("<p align=\"" + alignStyle) + "\">") + _arg1) + "</p>");
            };
            return (_arg1);
        }
				//Html标签包装
				public static function HtmlWraper(arg1:String):String{
        		return "<html><body>" + arg1 + "</body></html>";
        }
        //粗体字标签包装
        public static function BlodWraper(arg1:String):String{
        		return "<b>" + arg1 + "</b>";
        }
        //斜体字标签包装
        public static function ItalicWraper(arg1:String):String{
        		return "<i>" + arg1 + "</i>";
        }
        //段落标记包装
        public static function ParagraphWraper(arg1:String):String{
        		return "<p>" + arg1 + "</p>";
        }
        //list标签包装
//        public static function ParagraphWraper(arg1:String):String{
//        		return "<li>" + arg1 + "</li>";
//        }
//        //字体标签包装
//				public static function FontWraper(str:String, size:uint, color:uint):String{
//						if (size==0){
//								size = defaultFontSize
//						}
//						if(color==0){
//								color = defaultFontColor
//						}
//	
//						return "<font size='" + size + "' color='" + color.toString(16) + "'>" + str + "</font>"
//				}
    }
}//package com.assist.view 
