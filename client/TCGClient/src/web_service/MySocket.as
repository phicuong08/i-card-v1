//Created by Action Script Viewer - http://www.buraks.com/asv
package web_service {
    import flash.events.*;
    import custom_control1.*;
    import chat_system.*;
    import combat_element.*;
    import combat_element_script.*;
    import tool.*;
    import flash.net.*;

    public class MySocket extends EventDispatcher {

        public static const SOCKET_FAILED:String = "socket_failed";

        private static var _instance:MySocket = new (MySocket)();
;

        private var socketServer:Socket;
        private var msgList:Array;
        private var msgBuffer:String = "";

        public function MySocket(){
            this.socketServer = new Socket();
            this.msgList = new Array();
            super();
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():MySocket{
            return (_instance);
        }

        public function builderSocket():void{
            var _local1:String;
            var _local2:int;
            if (this.socketServer.connected != true){
                _local1 = UrlTool.getIp();
                _local2 = 6600;
                this.removeConfigListeners();
                this.socketServer.connect(_local1, _local2);
                this.setConfigListeners();
                debugWindow.myTrace(((("新建立 socket 连接:" + _local1) + ":") + _local2));
            };
        }
        private function setConfigListeners():void{
            this.socketServer.addEventListener(Event.CLOSE, this.closeHandler);
            this.socketServer.addEventListener(Event.CONNECT, this.connectHandler);
            this.socketServer.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.socketServer.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
            this.socketServer.addEventListener(ProgressEvent.SOCKET_DATA, this.socketDataHandler);
        }
        private function removeConfigListeners():void{
            if (this.socketServer){
                this.socketServer.removeEventListener(Event.CLOSE, this.closeHandler);
                this.socketServer.removeEventListener(Event.CONNECT, this.connectHandler);
                this.socketServer.removeEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
                this.socketServer.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
                this.socketServer.removeEventListener(ProgressEvent.SOCKET_DATA, this.socketDataHandler);
            };
        }
        private function closeHandler(_arg1:Event):void{
            TCGClient.getInstance().logout(false);
            debugWindow.myTrace(("与服务器连接断开！: " + _arg1));
            NoticeWindow.showNotice("与服务器失去连接！");
        }
        private function connectHandler(_arg1:Event):void{
            var _local3:Object;
            var _local4:Array;
            debugWindow.myTrace(("成功连接服务器！connectHandler: " + _arg1));
            if (JavaScriptUtil.isAvailable){
                _local3 = JavaScriptUtil.getBrowserData();
                _local4 = [JavaScriptUtil.getScreenData(), JavaScriptUtil.getOsData(), _local3.name, _local3.version];
                this.sendMsgToServer(("user_config:" + _local4.join(",")), true);
            };
            var _local2:int;
            while (_local2 < this.msgList.length) {
                this.sendMsgToServer(this.msgList[_local2]);
                _local2++;
            };
            this.msgList = new Array();
        }
        private function ioErrorHandler(_arg1:IOErrorEvent):void{
            dispatchEvent(new Event(SOCKET_FAILED));
            NoticeWindow.showNotice("与服务器连接失败！");
        }
        private function securityErrorHandler(_arg1:SecurityErrorEvent):void{
            debugWindow.myTrace(("安全错误！securityErrorHandler: " + _arg1));
        }
        private function socketDataHandler(_arg1:ProgressEvent):void{
            var _local4:Array;
            var _local2:String = this.socketServer.readUTFBytes(this.socketServer.bytesAvailable);
            var _local3:int;
            if (_local2.length == 0){
                return;
            };
            this.msgBuffer = (this.msgBuffer + _local2);
            if (this.msgBuffer.substring((this.msgBuffer.length - 3)) == "t#l"){
                _local4 = this.msgBuffer.split("h#d");
                this.msgBuffer = "";
                _local4.forEach(this.dispatchMessage);
            };
        }
        private function dispatchMessage(_arg1:String, _arg2:int, _arg3:Array):void{
            var refresh:* = null;
            var spliter:* = 0;
            var key:* = null;
            var param:* = null;
            var errorMsg:* = null;
            var confirmFunc:* = null;
            var str:* = null;
            var msg:* = _arg1;
            var index:* = _arg2;
            var arr:* = _arg3;
            refresh = function ():void{
                navigateToURL(new URLRequest("javascript:window.location.reload( false );"), "_self");
            };
            if (msg.length > 0){
                msg = msg.substring(0, (msg.length - 3));
                msg = msg.replace(new RegExp("##", "g"), "#");
                spliter = msg.indexOf(":");
                if (spliter < 0){
                    return;
                };
                key = msg.substring(0, spliter);
                param = msg.substring((spliter + 1));
                if (key != "heart_beat"){
                    debugWindow.myTrace(((("处理消息：key = " + key) + "   param = ") + param));
                };
                switch (key){
                    case "login_ok":
                        LuaAgent.getInstance().run((("u = create_user('name', '" + param) + "');"));
                        break;
                    case "login_failed":
                        switch (param){
                            case "sqlError":
                                errorMsg = "登录失败，游戏数据获取异常。";
                                break;
                            case "noUser":
                                errorMsg = "登录失败，用户名不存在。";
                                break;
                            case "passwordError":
                                errorMsg = "登录失败，密码错误。";
                                break;
                            case "versionError":
                                errorMsg = "游戏版本已升级，需要刷新网页。";
                                confirmFunc = refresh;
                                CommonUtil.addTimerLaterCall(1500, refresh);
                                break;
                            default:
                                errorMsg = ("登录失败，error:" + param.toString());
                        };
                        MessageBox.showMessageBox(MessageBox.NOTICE, "提示", errorMsg, confirmFunc);
                        break;
                    case "register_ok":
                        break;
                    case "register_failed":
                        break;
                    case "create_user":
                        TCGClient.getInstance().showCreateUserWindow();
                        break;
                    case "name_exist":
                        break;
                    case "heart_beat":
                        this.sendMsgToServer(("heart_beat:" + param), true);
                        break;
                    case "lua_duel":
                        LuaAgent.getInstance().run((("if d then d:handle_msg(\"" + param) + "\"); end"));
                        break;
                    case "lua_user":
                        str = (("if u then u:handle_msg(\"" + param) + "\"); end");
                        LuaAgent.getInstance().run(str);
                        break;
                    case "chat":
                        ChatWindowMgr.getInstance().handleChatMsg(param);
                        break;
                    case "notice":
                        MessageBox.showMessageBox(MessageBox.NOTICE, "提示：", param);
                        break;
                };
                dispatchEvent(new MySocketEvent(key, param));
            };
        }
        public function sendMsgToServer(_arg1:String, _arg2:Boolean=false):void{
            var str:* = _arg1;
            var silence:Boolean = _arg2;
            if (this.socketServer.connected == true){
                str.replace(new RegExp("#", "g"), "##");
                str = (("h#d" + str) + "t#l");
                try {
                    this.socketServer.writeUTFBytes(str);
                } catch(e:IOErrorEvent) {
                    debugWindow.myTrace(("sendMsgToserver Error:" + e));
                };
                if (!silence){
                    debugWindow.myTrace(("send_data_to_server:" + str));
                };
                this.socketServer.flush();
            } else {
                debugWindow.myTrace("未与服务器建立连接：\n");
                if (this.msgList.indexOf(str) == -1){
                    if (this.msgList.length > 0){
                        this.msgList.shift();
                    };
                    this.msgList.push(str);
                };
                this.builderSocket();
            };
        }
        public function sendLuaDuelMsg(_arg1:String):void{
            this.sendMsgToServer(("lua_duel:" + _arg1));
        }
        public function sendLuaUserMsg(_arg1:String):void{
            this.sendMsgToServer(("lua_user:" + _arg1));
        }

    }
}//package web_service 
