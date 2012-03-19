//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
    import flash.events.*;
    import flash.utils.*;
    import flash.net.*;
    import ICard.assist.*;
    import ICard.protocols.*;
    import ICard.lang.client.*;
    import ICard.haloer.utils.*;
    import flash.errors.*;

    public class DataBase extends SuperBase {

        protected var _ctrl:Controller;
        protected var _view:View;
        protected var _notAllowList:Object;
        protected var _sock:Socket;
        private var _host:String;
        private var _port:int;
        private var _useProxy:Boolean = false;
        protected var _onConnect:Function;
        protected var _onClose:Function;
        private var connectSucceed:Boolean = false;
        private var pack_len:int = -1;
        private var buffer:ByteArray;
        private var _event:EventDispatcher;
        private var _eventList:Object;

        public function DataBase():void{
            this._notAllowList = {};
            this._sock = new Socket();
            this._onConnect = new Function();
            this.buffer = new ByteArray();
            this._event = new EventDispatcher();
            this._eventList = {};
            super();
        }
        public function get controller():Controller{
            return (this._ctrl);
        }
        public function init(_arg1:View, _arg2:Controller):void{
            this._view = _arg1;
            this._ctrl = _arg2;
        }
        protected function createObject(_arg1:Class, _arg2:String=""):Object{
            _arg2 = (_arg1 + "");
            _arg2 = _arg2.replace(/Data\]$/, "");
            return (createObjectBase(_arg1, _arg2, this._view, this._ctrl, (this as Data)));
        }
        protected function hasNotAllow(_arg1:int, _arg2:int):Boolean{
            var _local4:Object;
            var _local3:Number = ((this._notAllowList[Protocol.concat(_arg1, _arg2)]) || (0));
            if ((((_local3 == 0)) || (((new Date().getTime() - _local3) > 900)))){
                return (false);
            };
            _local4 = Protocol.lookupProtocol(_arg1, _arg2);
            Helper.alert((Protocol.getProtocolDescription(_local4["request"]) + " 请求间隔太短。"));
            return (true);
        }
        protected function addNotAllow(_arg1:int, _arg2:int):void{
            this._notAllowList[Protocol.concat(_arg1, _arg2)] = new Date().getTime();
        }
        protected function removeNotAllow(_arg1:int, _arg2:int):void{
        }
        public function call(_arg1:Object, _arg2:Function, _arg3:Array, _arg4:Boolean=true):void{
            if (this._sock.connected == false){
                this._view.tip2.showAlert(DataBaseLang.connected);
                return;
            };
            var _local5:int = _arg1["module"];
            var _local6:int = _arg1["action"];
            if (this.hasNotAllow(_local5, _local6)){
                return;
            };
            if (false == _arg4){
                this.addNotAllow(_local5, _local6);
            };
            if ((_arg2 is Function)){
                this.patchBase(_local5, _local6, this.patchHandler(_local5, _local6, _arg2));
            };
            Helper.recordInteraction(Helper.REQUEST, _local5, _local6, _arg3);
            this.netCall(_local5, _local6, _arg1["request"], _arg3);
        }
        private function patchHandler(_arg1:uint, _arg2:uint, _arg3:Function):Function{
            var modId:* = _arg1;
            var funId:* = _arg2;
            var callback:* = _arg3;
            return (function (_arg1:Event):void{
                if (!Protocol.keepAlive(modId, funId)){
                    cancelPatchBase(modId, funId);
                };
                callback();
            });
        }
        private function netCall(_arg1:uint, _arg2:uint, _arg3:Array, _arg4:Array):void{
            var _local5:ByteArray = new ByteArray();
            _local5.writeByte(_arg1);
            _local5.writeByte(_arg2);
            var _local6:ByteArray = Protocol.synthesize(_arg4, _arg3);
            this._sock.writeInt((_local5.length + _local6.length));
            this._sock.writeBytes(_local5, 0, _local5.length);
            this._sock.writeBytes(_local6, 0, _local6.length);
            this._sock.flush();
        }
        public function set onConnect(_arg1:Function):void{
            this._onConnect = _arg1;
        }
        public function set onClose(_arg1:Function):void{
            this._onClose = _arg1;
        }
        public function connect(_arg1:String, _arg2:int):void{
            this._host = _arg1;
            this._port = _arg2;
            this.addListener();
            if (this._sock.connected){
                this._sock.close();
            };
            this._sock.connect(_arg1, this._port);
        }
        public function close():void{
            if (((this._sock) && (this._sock.connected))){
                this._sock.close();
            };
        }
        private function addListener():void{
            this._sock.addEventListener(Event.CONNECT, this.onConnectHandler);
            this._sock.addEventListener(IOErrorEvent.IO_ERROR, this.onIoErrorHandler);
            this._sock.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityErrorHandler);
            this._sock.addEventListener(ProgressEvent.SOCKET_DATA, this.onSocketDataHandler);
            this._sock.addEventListener(Event.CLOSE, this.onCloseHandler);
        }
        private function removeListener():void{
            this._sock.removeEventListener(Event.CONNECT, this.onConnectHandler);
            this._sock.removeEventListener(IOErrorEvent.IO_ERROR, this.onIoErrorHandler);
            this._sock.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityErrorHandler);
            this._sock.removeEventListener(ProgressEvent.SOCKET_DATA, this.onSocketDataHandler);
            this._sock.removeEventListener(Event.CLOSE, this.onCloseHandler);
        }
        private function onConnectHandler(_arg1:Event):void{
            var _local2:ByteArray;
            if (this._useProxy){
                _local2 = new ByteArray();
                _local2.writeInt(6);
                _local2.writeByte(100);
                _local2.writeByte(0);
                _local2.writeInt(this._port);
                this._sock.writeBytes(_local2, 0, _local2.length);
                this.onConnectHandlerReal();
            } else {
                this.onConnectHandlerReal();
            };
        }
        private function onConnectHandlerReal():void{
            Helper.backtrace("onConnectHandler");
            this.connectSucceed = true;
            if ((this._onConnect is Function)){
                this._onConnect();
                this._onConnect = null;
            };
        }
        private function onCloseHandler(_arg1:Event):void{
            Helper.backtrace("onCloseHandler");
            this._view.tip2.showAlert(DataBaseLang.connected);
            this._view.resetHost();
            if ((this._onClose is Function)){
                this._onClose();
            };
        }
        private function onIoErrorHandler(_arg1:IOErrorEvent):void{
            if (this._useProxy == false){
                this.connectProxy();
            } else {
                Helper.backtrace("onIoErrorHandler");
                this._view.alert.socketClosed("连接不到服务器！", (((("Socket 错误。 URL: " + this._host) + ":") + this._port) + "，该地址没有提供Socket服务。"));
                this._view.resetHost();
            };
        }
        private function onSecurityErrorHandler(_arg1:SecurityErrorEvent):void{
            if (this._useProxy == false){
                this.connectProxy();
            } else {
                Helper.backtrace("onSecurityErrorHandler");
                this._view.alert.socketClosed("安全沙箱冲突！", (((("安全沙箱冲突: 不能从" + this._host) + ":") + this._port) + "加载数据。"));
                this._view.resetHost();
            };
        }
        private function connectProxy():void{
            if (true == this.connectSucceed){
                this._view.tip2.showAlert(DataBaseLang.connected);
                return;
            };
            this._sock.close();
            this.removeListener();
            this._useProxy = true;
            this._sock = new Socket();
            this.addListener();
            this._sock.connect(this._host, 443);
        }
        private function onSocketDataHandler(_arg1:ProgressEvent):void{
            while (this._sock.bytesAvailable >= this.pack_len) {
                if ((((this.pack_len == -1)) && ((this._sock.bytesAvailable >= 4)))){
                    this.pack_len = this._sock.readUnsignedInt();
                };
                if (this.pack_len == -1){
                    return;
                };
                if (this._sock.bytesAvailable < this.pack_len){
                    return;
                };
                this.buffer = new ByteArray();
                this._sock.readBytes(this.buffer, 0, this.pack_len);
                this.parseSocketData(this.buffer);
                this.pack_len = -1;
                this.onSocketDataHandler(null);
            };
        }
        protected function parseSocketData(_arg1:ByteArray):void{
        }
        public function patch(_arg1:Object, _arg2:Function):void{
            var _local3:int = _arg1["module"];
            var _local4:int = _arg1["action"];
            this.patchBase(_local3, _local4, this.patchHandler(_local3, _local4, _arg2));
            Protocol.addWired(_arg1);
        }
        private function patchBase(_arg1:uint, _arg2:uint, _arg3:Function):void{
            var _local4:String = Protocol.concat(_arg1, _arg2);
            if ((this._eventList[_local4] is Function)){
                this.cancelPatchBase(_arg1, _arg2);
            };
            this._eventList[_local4] = _arg3;
            this._event.addEventListener(_local4, _arg3);
        }
        public function cancelPatch(_arg1:Object):void{
            var _local2:int = _arg1["module"];
            var _local3:int = _arg1["action"];
            Protocol.removeWired(_local2, _local3);
            this.cancelPatchBase(_local2, _local3);
        }
        private function cancelPatchBase(_arg1:uint, _arg2:uint):void{
            var _local3:String = Protocol.concat(_arg1, _arg2);
            var _local4:Function = this._eventList[_local3];
            if ((_local4 is Function)){
                this._event.removeEventListener(_local3, _local4);
            };
        }
        protected function dispatch(_arg1:uint, _arg2:uint):void{
            var _local4:Object;
            var _local3:String = Protocol.concat(_arg1, _arg2);
            if ((this._eventList[_local3] is Function)){
                this._event.dispatchEvent(new Event(_local3));
            } else {
                _local4 = Protocol.lookupProtocol(_arg1, _arg2);
                Helper.alert("[response]接口没有注册UI回调方法：", Protocol.getProtocolDescription(_local4["request"]));
            };
        }

    }
}//package com 
