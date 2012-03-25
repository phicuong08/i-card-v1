//Created by Action Script Viewer - http://www.buraks.com/asv
package tool {
    import flashx.textLayout.elements.*;
    import flash.utils.*;
    import flashx.textLayout.conversion.*;

    public class StringUtils {

        public static const NEWLINE_TOKENS:Array = new Array("\n", "\r");
        public static const WHITESPACE_TOKENS:Array = new Array(" ", "\t");

        public static function trim(_arg1:String, _arg2:Array=null):String{
            var _local3:Array;
            if (_arg2){
                _local3 = _arg2;
            } else {
                _local3 = WHITESPACE_TOKENS.concat(NEWLINE_TOKENS);
            };
            _arg1 = trimLeft(_arg1, _local3);
            _arg1 = trimRight(_arg1, _local3);
            return (_arg1);
        }
        public static function trimLeft(_arg1:String, _arg2:Array=null):String{
            var _local3:Array;
            if (_arg2){
                _local3 = _arg2;
            } else {
                _local3 = WHITESPACE_TOKENS.concat(NEWLINE_TOKENS);
            };
            while ((((_local3.toString().indexOf(_arg1.substr(0, 1)) > -1)) && ((_arg1.length > 0)))) {
                _arg1 = _arg1.substr(1);
            };
            return (_arg1);
        }
        public static function trimRight(_arg1:String, _arg2:Array=null):String{
            var _local3:Array;
            if (_arg2){
                _local3 = _arg2;
            } else {
                _local3 = WHITESPACE_TOKENS.concat(NEWLINE_TOKENS);
            };
            while ((((_local3.toString().indexOf(_arg1.substr((_arg1.length - 1))) > -1)) && ((_arg1.length > 0)))) {
                _arg1 = _arg1.substr(0, (_arg1.length - 1));
            };
            return (_arg1);
        }
        public static function createTFByHtmlText(_arg1:String):TextFlow{
            return (TextConverter.importToFlow(parseColor(_arg1), TextConverter.TEXT_FIELD_HTML_FORMAT));
        }
        public static function parseColor(_arg1:String):String{
            _arg1 = _arg1.replace(/\n/g, "<br>");
            _arg1 = _arg1.replace(/#n/g, "</font>");
            _arg1 = _arg1.replace(/#w/g, "<font color='0xffffff'>");
            _arg1 = _arg1.replace(/#r/g, "<font color='0xff3727'>");
            _arg1 = _arg1.replace(/#g/g, "<font color='0x7bff2b'>");
            _arg1 = _arg1.replace(/#d/g, "<font color='0xcf6d03'>");
            _arg1 = _arg1.replace(/#o/g, "<font color='0xffa405'>");
            _arg1 = _arg1.replace(/#s/g, "<font color='0x888888'>");
            _arg1 = _arg1.replace(/#y/g, "<font color='0xffe283'>");
            _arg1 = _arg1.replace(/#h/g, "<font color='0xfff4d1'>");
            _arg1 = _arg1.replace(/#p/g, "<font color='0xb400ff'>");
            return (_arg1);
        }
        public static function addIndent(_arg1:String, _arg2:int):String{
            return ((((("<textformat indent='" + _arg2) + "'>") + _arg1) + "</textformat>"));
        }
        public static function addLeftmargin(_arg1:String, _arg2:int):String{
            return ((((("<textformat leftmargin='" + _arg2) + "'>") + _arg1) + "</textformat>"));
        }
        public static function addRightmargin(_arg1:String, _arg2:int):String{
            return ((((("<textformat rightmargin='" + _arg2) + "'>") + _arg1) + "</textformat>"));
        }
        public static function translateAnsiToUtf8(_arg1:Array):String{
            var _local2:ByteArray = new ByteArray();
            var _local3:int;
            while (_local3 < _arg1.length) {
                _local2.writeByte(_arg1[_local3]);
                _local3++;
            };
            _local2.position = 0;
            return (_local2.readMultiByte(_local2.length, "gb2312"));
        }
        public static function getFileType(_arg1:ByteArray):String{
            _arg1.position = 0;
            var _local2:int = _arg1.readUnsignedByte();
            var _local3:int = _arg1.readUnsignedByte();
            var _local4 = "default";
            if ((((_local2 == 0xFF)) && ((_local3 == 254)))){
                _local4 = "Unicode";
            } else {
                if ((((_local2 == 254)) && ((_local3 == 0xFF)))){
                    _local4 = "Unicode big endian";
                } else {
                    if ((((_local2 == 239)) && ((_local3 == 187)))){
                        _local4 = "UTF-8";
                    } else {
                        if ((((_local2 == 91)) && ((_local3 == 116)))){
                            _local4 = "ANSI";
                        };
                    };
                };
            };
            return (_local4);
        }

    }
}//package tool 
