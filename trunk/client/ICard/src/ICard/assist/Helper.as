//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist {
    import ICard.*;
    import ICard.haloer.data.*;
    import ICard.haloer.net.*;
    
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.text.*;

    public class Helper {

        public static const REQUEST:int = 1;
        public static const RESPONSE:int = 2;

        private static var _stage:Stage;
        public static var test:Boolean = true;
        private static var _tf:TextField;
        private static var _down:Point;
        private static var _up:Point;
        private static var _isDown:Boolean = false;
        private static var _trace:TextField;
        private static var _interaction:Object;
        private static var _shortcut:MovieClip;
        private static var _selectedLabel:String;
        private static var _lastSelectedLabel:String;
        private static var _ip:String;
        private static var _protocols:Array = [];
        private static var _pList:Array = [];
        private static var _pHash:Object = {};
        private static var _rnd:String;
        private static var _send:LocalConnection = new LocalConnection();
        private static var _instance:Helper = new (Helper)();
;

        private var _stage:Stage;
        private var _maxLines:int = 300;
        private var _list:Array;
        private var _tfList:Array;
        private var _tfTips:TextField;
        private var _tfSp:Sprite;
        private var _mainSp:Sprite;

        public function Helper(){
            var _local3:*;
            var _local4:Sprite;
            var _local5:BitmapData;
            var _local6:TextField;
            this._list = [];
            this._tfList = [];
            this._tfTips = new TextField();
            this._tfSp = new Sprite();
            this._mainSp = new Sprite();
            super();
            if (false == test){
                return;
            };
            this._mainSp.graphics.beginFill(0, 0.8);
            this._mainSp.graphics.drawRect(0, 0, 1000, 600);
            this._mainSp.graphics.endFill();
            this._list[8] = "lyx";
            var _local1:TextFormat = new TextFormat();
            _local1.size = 13;
            _local1.leading = 2;
            var _local2:int = 20;
            for (_local3 in this._list) {
                _local4 = new Sprite();
                _local5 = new BitmapData(100, 25, true, 4284927231);
                _local6 = new TextField();
                _local6.width = 100;
                _local6.htmlText = (("<p align='center'><font size='17'>" + this._list[_local3]) + "</font></p>");
                _local5.draw(_local6, new Matrix(1, 0, 0, 1, 0, 1), null, null, null, true);
                _local5.applyFilter(_local5, _local5.rect, new Point(), Filter.filter2);
                _local4.addEventListener(MouseEvent.MOUSE_OUT, this.btnMouseOut);
                _local4.addEventListener(MouseEvent.MOUSE_OVER, this.btnMouseIn);
                _local4.addEventListener(MouseEvent.CLICK, this.btnClick);
                _local4.addChild(new Bitmap(_local5));
                _local4.x = _local2;
                _local4.y = 20;
                _local4.name = String(_local3);
                _local4.buttonMode = true;
                this._mainSp.addChild(_local4);
                _local2 = (_local2 + 120);
                _local6 = new TextField();
                this._tfList[_local3] = _local6;
                _local6.width = 960;
                _local6.height = 500;
                _local6.x = 20;
                _local6.y = 80;
                _local6.type = TextFieldType.INPUT;
                _local6.multiline = true;
                _local6.background = true;
                _local6.defaultTextFormat = _local1;
            };
            this._mainSp.addChild(this._tfSp);
            this._mainSp.addChild(this._tfTips);
            this._tfTips.width = 500;
            this._tfTips.y = 50;
            this._tfTips.x = 20;
            this._tfTips.mouseEnabled = false;
        }
        public static function output(... _args):void{
            printToConsole("output", _args);
        }
        public static function alert(... _args):void{
            printToConsole("alert", _args);
        }
        public static function error(... _args):void{
            printToConsole("error", _args);
        }
        public static function debug(... _args):void{
            printToConsole("debug", _args);
        }
        private static function printToConsole(_arg1:String, _arg2:Array):void{
            _arg1 = _arg1.toUpperCase();
            var _local3:String = repeat("-", (_arg1.length + 2));
        }
        private static function repeat(_arg1:String, _arg2:int):String{
            if (_arg2 > 1){
                return ((_arg1 + repeat(_arg1, (_arg2 - 1))));
            };
            return (_arg1);
        }
        public static function gc():void{
            try {
                new LocalConnection().connect("age");
                new LocalConnection().connect("age");
            } catch(error:Error) {
            };
        }
        private static function assist():void{
            _stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
            _stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
            _stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
            _stage.addEventListener(MouseEvent.CLICK, onClick);
        }
        private static function onMouseDown(_arg1:MouseEvent):void{
            _down = new Point(_stage.mouseX, _stage.mouseY);
            _isDown = true;
        }
        private static function onMouseUp(_arg1:MouseEvent):void{
            _isDown = false;
        }
        private static function onMouseMove(_arg1:MouseEvent):void{
            if (_isDown){
                _up = new Point(_stage.mouseX, _stage.mouseY);
                draw();
            };
        }
        private static function onClick(_arg1:MouseEvent):void{
            if (((_tf) && (_tf.parent))){
                _tf.parent.removeChild(_tf);
            };
        }
        private static function draw():void{
            if (_tf == null){
                _tf = new TextField();
                _tf.border = true;
                _tf.borderColor = 0xFFFFFF;
                _tf.textColor = 0xFFFFFF;
                _tf.selectable = false;
            };
            _stage.addChild(_tf);
            var _local1:Number = ((_up.x - _down.x) - 2);
            var _local2:Number = ((_up.y - _down.y) - 2);
            _tf.x = _down.x;
            _tf.y = _down.y;
            _tf.width = _local1;
            _tf.height = _local2;
            _tf.text = [_local1, _local2].join();
        }
        public static function backtrace(... _args):void{
        }
        private static function initInteraction():void{
            _shortcut = new MovieClip();
            _shortcut.buttonMode = true;
            _shortcut.useHandCursor = true;
            _shortcut.tabEnabled = false;
            _shortcut.graphics.beginFill(0x333333, 0);
            _shortcut.graphics.drawRect(0, 0, 20, 20);
            var callback:* = function (_arg1:MouseEvent):void{
                switchInteraction();
            };
            var over:* = function (_arg1:MouseEvent):void{
                _shortcut.graphics.clear();
                _shortcut.graphics.beginFill(0xFF0000, 0.2);
                _shortcut.graphics.drawRect(0, 0, 20, 20);
            };
            var out:* = function (_arg1:MouseEvent):void{
                _shortcut.graphics.clear();
                _shortcut.graphics.beginFill(0x333333, 0);
                _shortcut.graphics.drawRect(0, 0, 20, 20);
            };
            var everyFrame:* = function (_arg1:Event):void{
                _stage.addChild(_shortcut);
            };
            _shortcut.addEventListener(MouseEvent.CLICK, callback);
            _shortcut.addEventListener(MouseEvent.MOUSE_OVER, over);
            _shortcut.addEventListener(MouseEvent.MOUSE_OUT, out);
            _shortcut.addEventListener(Event.ENTER_FRAME, everyFrame);
        }
        public static function switchInteraction():void{
            var file:* = null;
            if (false == test){
                return;
            };
            _ip = ((", <u>Domain</u>:<font color=\"#FF0000\">" + URI.domain) + "</font>");
            if (null == _interaction){
                file = new File();
                file.onComplete = function ():void{
                    _interaction = file.getClassObject("Interaction");
                    _interaction._Name.htmlText = _ip;
                    _interaction.pList = _pList;
                    _interaction.pHash = _pHash;
                    _interaction.onItemClick = function (_arg1:Object):void{
                        _selectedLabel = _arg1.label;
                        _interaction.renderSelectedLabel(_selectedLabel, _pHash, _pList, _ip);
                    };
                    updateInteraction();
                    if (null == _selectedLabel){
                        _interaction._List.dataProvider.addItems(_protocols);
                        _interaction.renderSelectedLabel(_lastSelectedLabel, _pHash, _pList, _ip);
                    };
                };
                file.load(((URI.assetsUrl + "interaction.swf?rnd=") + Math.random()));
            } else {
                updateInteraction();
            };
        }
        public static function recordInteraction(_arg1:int, _arg2:int, _arg3:int, _arg4:Array):void{
            var _local5:Date = new Date();
            var _local6:Object = Protocol.lookupProtocol(_arg2, _arg3);
            var _local7:String = [(((((((("[" + _local5.getHours()) + ":") + _local5.getMinutes()) + ":") + _local5.getSeconds()) + ".") + _local5.getMilliseconds()) + "]"), ((("[" + ((_arg1 == REQUEST)) ? "Request" : "Response") + "] ") + Protocol.getProtocolDescription(_local6["request"])), "[__Tree__]", "----------------------------------", "[__Content__]", "================================================================="].join("\n");
            var _local8:String = ((Protocol.modName + ".") + Protocol.funName);
            var _local9:int = ((_pHash[_local8]) || (_pList.length));
            if (null == _pHash[_local8]){
                _pHash[_local8] = _local9;
                _protocols.push({
                    label:_local8,
                    data:1
                });
            };
            if (undefined == _pList[_local9]){
                _pList[_local9] = [];
                getModuleList();
            } else {
                if (_pList[_local9].length > 6){
                    _pList[_local9].shift();
                    getModuleList();
                };
            };
            _lastSelectedLabel = _local8;
            _pList[_local9].push([_local7, _arg4]);
            if (_interaction != null){
                _interaction._List.dataProvider.removeAll();
                _interaction._List.dataProvider.addItems(_protocols);
                if (_selectedLabel){
                    _interaction.renderSelectedLabel(_selectedLabel, _pHash, _pList, _ip);
                } else {
                    _interaction._Name.htmlText = (_local8 + _ip);
                    _interaction._Info.text = _local7.replace("[__Content__]", Dumper(_arg4));
                };
            };
        }
        private static function updateInteraction():void{
            if (null == _interaction.parent){
                _stage.addChild((_interaction as Sprite));
            } else {
                _stage.removeChild((_interaction as Sprite));
            };
        }
        public static function startConnect(_arg1:String):void{
            _rnd = _arg1;
            if (!_send.hasEventListener(StatusEvent.STATUS)){
                _send.addEventListener(StatusEvent.STATUS, statusHandler);
            };
            getModuleList();
        }
        private static function statusHandler(_arg1:StatusEvent):void{
        }
        public static function getModuleList():void{
            if (!_rnd){
                return;
            };
            try {
                _send.send(_rnd, "setModuleList", _pHash, _pList);
            } catch(e:ErrorEvent) {
            };
        }
        public static function initStage(_arg1:Stage):void{
            _stage = _arg1;
            _instance.initStage(_arg1);
        }
        public static function Trace1(... _args):void{
            _instance.showTrace(1, (_args.join("  ") + "\n"));
        }
        public static function Trace2(... _args):void{
            _instance.showTrace(2, (_args.join("  ") + "\n"));
        }
        public static function Trace3(... _args):void{
            _instance.showTrace(3, (_args.join("  ") + "\n"));
        }
        public static function Trace4(... _args):void{
            _instance.showTrace(4, (_args.join("  ") + "\n"));
        }
        public static function Trace5(... _args):void{
            _instance.showTrace(5, (_args.join("  ") + "\n"));
        }
        public static function Trace6(... _args):void{
            _instance.showTrace(6, (_args.join("  ") + "\n"));
        }
        public static function Trace7(... _args):void{
            _instance.showTrace(7, (_args.join("  ") + "\n"));
        }
        public static function Trace8(... _args):void{
            _instance.showTrace(8, (_args.join("  ") + "\n"));
        }

        public function initStage(_arg1:Stage):void{
            if (false == test){
                return;
            };
            this._stage = _arg1;
            _arg1.addEventListener(KeyboardEvent.KEY_UP, this.stageKeyUp);
            initInteraction();
        }
        private function stageKeyUp(_arg1:KeyboardEvent):void{
            if (_arg1.keyCode == 113){
                if (this._mainSp.stage == null){
                    this._stage.addChild(this._mainSp);
                } else {
                    this._stage.removeChild(this._mainSp);
                };
            };
        }
        private function btnMouseIn(_arg1:Event):void{
            _arg1.currentTarget.alpha = 0.7;
        }
        private function btnMouseOut(_arg1:Event):void{
            _arg1.currentTarget.alpha = 1;
        }
        private function btnClick(_arg1:Event):void{
            while (this._tfSp.numChildren) {
                this._tfSp.removeChildAt(0);
            };
            var _local2:int = int(_arg1.currentTarget.name);
            this._tfSp.addChild(this._tfList[_local2]);
            this.txTips = ("当前显示  " + this._list[_local2]);
        }
        private function set txTips(_arg1:String):void{
            this._tfTips.htmlText = (("<font color='#ffffff' size='17'>" + _arg1) + "</font>");
        }
        private function showTrace(_arg1:int, _arg2:String):void{
            var _local4:String;
            var _local5:int;
            var _local6:int;
            if (false == test){
                return;
            };
            var _local3:TextField = (this._tfList[_arg1] as TextField);
            if (_local3 == null){
                return;
            };
            _local3.appendText(_arg2);
            if (_local3.numLines > this._maxLines){
                _local4 = "";
                _local5 = 100;
                _local6 = _local3.numLines;
                while (_local5 < _local6) {
                    _local4 = (_local4 + _local3.getLineText(_local5));
                    _local5++;
                };
                _local3.text = _local4;
            };
            _local3.scrollV = _local3.maxScrollV;
        }

    }
}//package com.assist 
