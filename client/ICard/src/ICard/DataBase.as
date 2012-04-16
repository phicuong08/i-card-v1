//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
    import ICard.assist.*;
    import ICard.haloer.utils.*;
    import ICard.lang.client.*;
    import ICard.protocols.*;
    import com.smartfoxserver.v2.SmartFox;
    import com.smartfoxserver.v2.core.SFSEvent;
    import com.smartfoxserver.v2.entities.*;
    import com.smartfoxserver.v2.entities.data.*;
    import com.smartfoxserver.v2.requests.*;
    
    import flash.errors.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    public class DataBase extends SuperMgr {

        protected var _ctrl:ControllerMgr;
        protected var _view:ViewMgr;
        protected var _notAllowList:Object;
 //       protected var _sock:Socket;
        private var _host:String;
        private var _port:int;
		protected var _useProxy:Boolean = false;
        protected var _onConnect:Function;
        protected var _onClose:Function;
		protected var _connectSucceed:Boolean = false;
        private var pack_len:int = -1;
        private var buffer:ByteArray;
        private var _event:EventDispatcher;
        private var _eventList:Object;
		public var _smartFox : SmartFox;
		
        public function DataBase():void{
            this._notAllowList = {};
//            this._sock = new Socket();
            this._onConnect = new Function();
            this.buffer = new ByteArray();
            this._event = new EventDispatcher();
			_smartFox = new SmartFox;

            this._eventList = {};
            super();
        }
        public function get controller():ControllerMgr{
            return (this._ctrl);
        }
		public function get SFS():SmartFox{
			return _smartFox;
		}
		
        public function init(_arg1:ViewMgr, _arg2:ControllerMgr):void{
            this._view = _arg1;
            this._ctrl = _arg2;
			
        }
        protected function createObject(_arg1:Class, _arg2:String=""):Object{
            _arg2 = (_arg1 + "");
            _arg2 = _arg2.replace(/Data\]$/, "");
            return (createObjectBase(_arg1, _arg2, this._view, this._ctrl, (this as Data)));
        }
        protected function hasNotAllow(_arg1:int, _arg2:int):Boolean{
			return false;
//            var _local4:Object;
//            var _local3:Number = ((this._notAllowList[Protocol.concat(_arg1, _arg2)]) || (0));
//            if ((((_local3 == 0)) || (((new Date().getTime() - _local3) > 900)))){
//                return (false);
//            };
//            _local4 = Protocol.lookupProtocol(_arg1, _arg2);
//            Helper.alert((Protocol.getProtocolDescription(_local4["request"]) + " 请求间隔太短。"));
//            return (true);
        }
        protected function addNotAllow(_arg1:int, _arg2:int):void{
           // this._notAllowList[Protocol.concat(_arg1, _arg2)] = new Date().getTime();
        }
        protected function removeNotAllow(_arg1:int, _arg2:int):void{
        }
		public function callSFS(_arg1:Object, _arg2:Function, _arg3:Array, _arg4:Boolean=true):void{
			
		}
        public function call(_arg1:Object, _arg2:Function, _arg3:Array, _arg4:Boolean=true):void{
            if (_connectSucceed == false){
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
			var _tmp:int = 0;
//            this._sock.writeInt((_local5.length + _local6.length));
//            this._sock.writeBytes(_local5, 0, _local5.length);
//            this._sock.writeBytes(_local6, 0, _local6.length);
//            this._sock.flush();
        }
        public function set onConnect(_arg1:Function):void{
            this._onConnect = _arg1;
        }
        public function set onClose(_arg1:Function):void{
            this._onClose = _arg1;
        }
        public function connect():void{
            this.addListener();
			_smartFox.loadConfig("config/sfs-config_http.xml", true);
        }
		
        public function close():void{
//            if (((this._sock) && (this._sock.connected))){
//                this._sock.close();
//            };
        }
        private function addListener():void{
			
			_smartFox.addEventListener(SFSEvent.CONNECTION, onConnectHandler); 
			_smartFox.addEventListener(SFSEvent.CONNECTION_LOST, onIoErrorHandler); 
			_smartFox.addEventListener(SFSEvent.CONFIG_LOAD_SUCCESS, onConfigLoadSuccess);
			_smartFox.addEventListener(SFSEvent.CONFIG_LOAD_FAILURE, onConfigLoadFailure);

				
//            this._sock.addEventListener(Event.CONNECT, this.onConnectHandler);
//            this._sock.addEventListener(IOErrorEvent.IO_ERROR, this.onIoErrorHandler);
//            this._sock.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityErrorHandler);
//            this._sock.addEventListener(ProgressEvent.SOCKET_DATA, this.onSocketDataHandler);
//            this._sock.addEventListener(Event.CLOSE, this.onCloseHandler);
        }
		
		
		
        private function removeListener():void{
			_smartFox.removeEventListener(SFSEvent.CONNECTION, onConnectHandler); 
			_smartFox.removeEventListener(SFSEvent.CONNECTION_LOST, onIoErrorHandler); 
			_smartFox.removeEventListener(SFSEvent.CONFIG_LOAD_SUCCESS, onConfigLoadSuccess);
			_smartFox.removeEventListener(SFSEvent.CONFIG_LOAD_FAILURE, onConfigLoadFailure);
			
//            this._sock.removeEventListener(Event.CONNECT, this.onConnectHandler);
//            this._sock.removeEventListener(IOErrorEvent.IO_ERROR, this.onIoErrorHandler);
//            this._sock.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityErrorHandler);
//            this._sock.removeEventListener(ProgressEvent.SOCKET_DATA, this.onSocketDataHandler);
//            this._sock.removeEventListener(Event.CLOSE, this.onCloseHandler);
        }
        private function onConnectHandler(_arg1:SFSEvent):void{

			Helper.backtrace("onConnectHandler");
			this._connectSucceed = true;
			if ((this._onConnect is Function)){
				this._onConnect();
				this._onConnect = null;
			};
//			this._view.login.show();
			
//            var _local2:ByteArray;
//            if (this._useProxy){
//                _local2 = new ByteArray();
//                _local2.writeInt(6);
//                _local2.writeByte(100);
//                _local2.writeByte(0);
//                _local2.writeInt(this._port);
//                this._sock.writeBytes(_local2, 0, _local2.length);
//                this.onConnectHandlerReal();
//            } else {
//                this.onConnectHandlerReal();
//            };
        }
 
        private function onCloseHandler(_arg1:SFSEvent):void{
            Helper.backtrace("onCloseHandler");
            
            this._view.resetHost();
            if ((this._onClose is Function)){
                this._onClose();
            };
        }
        private function onIoErrorHandler(_arg1:SFSEvent):void{
            if (this._useProxy == false){
                this.connectProxy();
            } else {
                Helper.backtrace("onIoErrorHandler");
                //this._view.alert.socketClosed("连接不到服务器！", (((("Socket 错误。 URL: " + this._host) + ":") + this._port) + "，该地址没有提供Socket服务。"));
                this._view.resetHost();
            };
        }
        private function onSecurityErrorHandler(_arg1:SecurityErrorEvent):void{
//            if (this._useProxy == false){
//                this.connectProxy();
//            } else {
//                Helper.backtrace("onSecurityErrorHandler");
//               // this._view.alert.socketClosed("安全沙箱冲突！", (((("安全沙箱冲突: 不能从" + this._host) + ":") + this._port) + "加载数据。"));
//                this._view.resetHost();
//            };
        }
        private function connectProxy():void{
//            if (true == this.connectSucceed){
//               // this._view.tip2.showAlert(DataBaseLang.connected);
//                return;
//            };
//            this._sock.close();
//            this.removeListener();
//            this._useProxy = true;
//            this._sock = new Socket();
//            this.addListener();
//            this._sock.connect(this._host, 443);
//        }
//        private function onSocketDataHandler(_arg1:ProgressEvent):void{
//            while (this._sock.bytesAvailable >= this.pack_len) {
//                if ((((this.pack_len == -1)) && ((this._sock.bytesAvailable >= 4)))){
//                    this.pack_len = this._sock.readUnsignedInt();
//                };
//                if (this.pack_len == -1){
//                    return;
//                };
//                if (this._sock.bytesAvailable < this.pack_len){
//                    return;
//                };
//                this.buffer = new ByteArray();
//                this._sock.readBytes(this.buffer, 0, this.pack_len);
//                this.parseSocketData(this.buffer);
//                this.pack_len = -1;
//                this.onSocketDataHandler(null);
//            };
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
		
		private function onConfigLoadSuccess(evt:SFSEvent):void
		{ 
			dTrace("Config load success!") 
			dTrace("Server settings: " + _smartFox.config.host + ":" + _smartFox.config.port) 
		} 
		
		private function onConfigLoadFailure(evt:SFSEvent):void
		{ 
			dTrace("Config load failure!!!") 
		} 

		private function dTrace(msg:String):void
		{ 
			//ta_debug.text += "-- " + msg + "\n"; 
		} 

    }
}//package com 
