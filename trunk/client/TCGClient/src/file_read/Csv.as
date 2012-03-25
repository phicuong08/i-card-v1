//Created by Action Script Viewer - http://www.buraks.com/asv
package file_read {
    import flash.events.*;
    import custom_control1.*;
    import flash.utils.*;
    import tool.*;
    import flash.net.*;
    import flash.errors.*;

    public class Csv extends EventDispatcher {

        private const SEMICOLON:String = "#101";
        private const DQUOTES:String = "#100";

        public var name;
        private var repeatTime:int = 0;
        private var url:String;
        private var _records:Array;

        public function getData():Array{
            return (this._records);
        }
        public function loadLocalFile(_arg1:Class):void{
            var _local2:ByteArray = (new (_arg1)() as ByteArray);
            this.parseFile(_local2.readUTFBytes(_local2.length));
        }
        public function loadURL(_arg1:String):void{
            this.url = _arg1;
            this._records = new Array();
            var _local2:URLLoader = new URLLoader();
            var _local3:URLRequest = new URLRequest(_arg1);
            _local2.addEventListener(Event.COMPLETE, this.onLoadCompleteHandler);
            _local2.addEventListener(IOErrorEvent.IO_ERROR, this.onLoadErrorHandler);
            _local2.dataFormat = "binary";
            _local2.load(_local3);
        }
        public function removeListener(_arg1:Event):void{
            var _local2:URLLoader = (_arg1.currentTarget as URLLoader);
            _local2.removeEventListener(Event.COMPLETE, this.onLoadCompleteHandler);
            _local2.removeEventListener(IOErrorEvent.IO_ERROR, this.onLoadErrorHandler);
        }
        private function onLoadCompleteHandler(_arg1:Event):void{
            var event:* = _arg1;
            this.removeListener(event);
            var byteArray:* = ByteArray(event.target.data);
            var resultStr:* = "";
            try {
                resultStr = byteArray.readUTFBytes(byteArray.length);
            } catch(e:EOFError) {
                dispatchEvent(new CsvEvent(CsvEvent.EOF_ERROR));
            };
            this.parseFile(resultStr);
        }
        private function parseFile(_arg1:String):void{
            var _local4:int;
            var _local5:uint;
            var _local6:Array;
            var _local7:Object;
            var _local8:uint;
            var _local9:String;
            this._records = new Array();
            var _local2:Array = _arg1.split(String.fromCharCode(13));
            var _local3:Array = new Array();
            if (_local2.length > 0){
                _local4 = 0;
                while (this.isCommentLine(_local2[_local4])) {
                    ++_local4;
                    if (_local4 >= _local2.length){
                        return;
                    };
                };
                _local4++;
                _local3 = _local2[_local4].match(new RegExp("\"\\w*\"", "g"));
                ++_local4;
                _local5 = _local4;
                while (_local5 < _local2.length) {
                    if (this.isCommentLine(_local2[_local5])){
                    } else {
                        _local2[_local5] = this.parse(_local2[_local5]);
                        _local6 = _local2[_local5].split(",");
                        _local7 = new Object();
                        _local8 = 0;
                        while (_local8 < _local3.length) {
                            _local9 = StringUtils.trim(_local3[_local8]);
                            _local9 = _local9.replace(new RegExp("\"", "g"), "");
                            if (_local6.length <= _local8){
                                _local7[_local9] = "";
                            } else {
                                _local6[_local8] = this.parseBack(_local6[_local8]);
                                _local7[_local9] = StringUtils.trim(_local6[_local8]);
                            };
                            _local8++;
                        };
                        this._records.push(_local7);
                    };
                    _local5++;
                };
            };
            dispatchEvent(new Event(Event.COMPLETE));
        }
        private function isCommentLine(_arg1:String):Boolean{
            var _local2:String = StringUtils.trim(_arg1);
            if ((((_local2.charAt(0) == "#")) || ((_local2.length == 0)))){
                return (true);
            };
            return (false);
        }
        private function parseBack(_arg1:String):String{
            _arg1 = _arg1.replace(new RegExp(this.SEMICOLON, "g"), ",");
            _arg1 = _arg1.replace(new RegExp(this.DQUOTES, "g"), "\"");
            return (_arg1);
        }
        private function parse(_arg1:String):String{
            var _local2:String;
            var _local4:int;
            _arg1 = _arg1.replace(new RegExp("\"\"", "g"), this.DQUOTES);
            var _local3:int = _arg1.indexOf("\"");
            while (_local3 != -1) {
                _local4 = _arg1.indexOf("\"", (_local3 + 1));
                if (_local4 == -1){
                    throw (new Error(("该行的双引号配置异常,为奇数个!!\n" + _arg1)));
                };
                _local2 = _arg1.substring(_local3, (_local4 + 1));
                _local2 = _local2.replace(new RegExp("\"", "g"), "");
                _local2 = _local2.replace(new RegExp(",", "g"), this.SEMICOLON);
                _arg1 = ((_arg1.substring(0, _local3) + _local2) + _arg1.substring((_local4 + 1)));
                _local3 = _arg1.indexOf("\"");
            };
            return (_arg1);
        }
        private function onLoadErrorHandler(_arg1:IOErrorEvent):void{
            this.repeatTime++;
            var _local2:NoticeWindow = new NoticeWindow();
            _local2.noticeText = (this.name.toString() + "载入失败！\n 重新尝试。");
            TCGClient.getInstance().mainGroup.addElement(_local2);
            if (this.repeatTime > 3){
                this.removeListener(_arg1);
                _local2.noticeText = (this.name.toString() + "载入异常！\n 无法进行游戏。");
            } else {
                (_arg1.currentTarget as URLLoader).load(new URLRequest(this.url));
            };
        }

    }
}//package file_read 
