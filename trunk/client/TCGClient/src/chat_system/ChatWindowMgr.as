//Created by Action Script Viewer - http://www.buraks.com/asv
package chat_system {
    import spark.components.*;
    import web_service.*;
    import flashx.textLayout.elements.*;
    import combat_element_script.*;
    import player_view.*;
    import flashx.textLayout.events.*;
    import flashx.textLayout.conversion.*;
    import tool.*;

    public class ChatWindowMgr {

        private static var _instance:ChatWindowMgr = new (ChatWindowMgr)();
;

        public var chatContent:String;
        private var lastWhisperTargetName:String;

        public function ChatWindowMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():ChatWindowMgr{
            return (_instance);
        }

        private function get chatWindow():ChatWindow{
            return (TCGClient.getInstance().chatWindow);
        }
        public function handleChatMsg(_arg1:String):void{
            var _local2:int = _arg1.indexOf(";");
            var _local3:String = _arg1.substr(0, _local2);
            var _local4:String = _arg1.substr((_local2 + 1));
            var _local5:Object = LuaAgent.getInstance().run((("return as3.toobject(" + _local3) + ")"))[1];
            if (_local5["channel"] == "system"){
                this.addSystemContent(_local4);
            } else {
                this.addChatContent(_local5, _local4);
            };
        }
        public function sendChatMessage(_arg1:String, _arg2:String):Boolean{
            var _local3:String = ((_arg1 == "whisper")) ? this.lastWhisperTargetName : "";
            var _local4:String = _arg2;
            if ((((_arg1 == "room")) && ((UserObject.roomName == null)))){
                this.addSystemContent("当前不在房间中，无法使用该频道！");
                return (false);
            };
            var _local5:RegExp = /^\s*$/;
            if (_local5.test(_local4)){
                return (false);
            };
            _local4 = HeXie.heXieString(_local4);
            var _local6:String = LuaAgent.objectToLuaString({
                channel:_arg1,
                name_to:_local3
            });
            var _local7:Array = LuaAgent.getInstance().run((("return u.chat_mgr:check_send_chat_message(" + _local6) + ");"));
            if (_local7[1] != true){
                return (false);
            };
            MySocket.getInstance().sendMsgToServer(((("chat:" + _local6) + ";") + _local4));
            LuaAgent.getInstance().run((("u.chat_mgr:dispatch_send_chat_message_event(" + _local6) + ");"));
            return (true);
        }
        public function userInputTextChangeHandler(_arg1:TextInput):void{
            var _local2:int;
            if (_arg1.text.indexOf("/w ") == 0){
                _local2 = _arg1.text.indexOf(" ", 4);
                if (_local2 != -1){
                    if (this.setWhisperPlayer(_arg1.text.slice(3, _local2))){
                        _arg1.text = _arg1.text.slice((_local2 + 1));
                    };
                };
            } else {
                if (_arg1.text.indexOf("/1 ") == 0){
                    this.chatWindow.setChatChannel("world");
                    _arg1.text = _arg1.text.slice(3);
                } else {
                    if (_arg1.text.indexOf("/2 ") == 0){
                        this.chatWindow.setChatChannel("room");
                        _arg1.text = _arg1.text.slice(3);
                    };
                };
            };
        }
        public function setWhisperPlayer(_arg1:String):Boolean{
            if (!this.chatWindow){
                return (false);
            };
            if (_arg1 == UserObject.name){
                ChatWindowMgr.getInstance().addSystemContent("请不要尝试和自己进行私聊⊙﹏⊙");
                return (false);
            };
            if (UserObject.checkUserName(_arg1) != true){
                ChatWindowMgr.getInstance().addSystemContent("私聊对象名称输入有误。");
                return (false);
            };
            this.chatWindow.setChatChannel("whisper", _arg1);
            this.lastWhisperTargetName = _arg1;
            return (true);
        }
        public function addSystemContent(_arg1):void{
            if (!this.chatWindow){
                return;
            };
            var _local2 = "system";
            var _local3:ParagraphElement = new ParagraphElement();
            var _local4:InlineGraphicElement = new InlineGraphicElement();
            _local4.source = new ChatWindowNameSprite("系统", _local2);
            _local3.addChild(_local4);
            if (!(_arg1 is Array)){
                _arg1 = [{content:_arg1}];
            };
            this.addFlowElementByArray(_arg1, _local3, 0xFF9600);
            this.chatWindow.addParagraphElementWithChannel(_local3, _local2);
        }
        public function addChatContent(_arg1:Object, _arg2):void{
            var linkNameArg:* = null;
            var contentColor:* = 0;
            var headInfo:* = _arg1;
            var content:* = _arg2;
            if (((!(this.chatWindow)) || (UserObject.checkIgnore(headInfo["name_from"])))){
                return;
            };
            var p:* = new ParagraphElement();
            linkNameArg = headInfo["name_from"];
            var nameText:* = headInfo["name_from"];
            switch (headInfo["channel"]){
                case "world":
                    contentColor = 0xFFCC00;
                    break;
                case "room":
                    contentColor = 5356543;
                    break;
                case "whisper":
                    contentColor = 0xFF0072;
                    if (headInfo["name_from"] != UserObject.name){
                        nameText = (headInfo["name_from"] + "悄悄地说");
                    } else {
                        linkNameArg = headInfo["name_to"];
                        nameText = ("发送给" + headInfo["name_to"]);
                    };
                    break;
            };
            var l:* = this.createLinkElement(function ():void{
                PlayViewMgr.getInstance().showOpMenu(linkNameArg, true);
            });
            var img:* = new InlineGraphicElement();
            img.textDecoration = "none";
            img.source = new ChatWindowNameSprite(nameText, headInfo["style"]);
            l.addChild(img);
            p.addChild(l);
            this.addFlowElementByArray([content], p, contentColor);
            this.chatWindow.addParagraphElementWithChannel(p, headInfo["channel"]);
        }
        private function addFlowElementByArray(_arg1:Array, _arg2:ParagraphElement, _arg3:uint):void{
            var _local5:*;
            var _local6:LinkElement;
            var _local7:LinkElement;
            var _local8:SpanElement;
            var _local4:int;
            while (_local4 < _arg1.length) {
                _local5 = _arg1[_local4];
                if ((_local5 is String)){
                    _local5 = {content:_local5};
                };
                if (_local5.color == null){
                    _local5.color = _arg3;
                };
                switch (_local5.type){
                    case "hrefLink":
                        _local6 = this.createLinkElement(_local5.content);
                        _local6.addChild(this.createSpanElement(_local5.content, _local5.color));
                        _arg2.addChild(_local6);
                        break;
                    case "clickLink":
                        _local7 = this.createLinkElement(_local5.clickFunc);
                        _local8 = this.createSpanElement(_local5.content, _local5.color);
                        _local8.textDecoration = "none";
                        _local7.addChild(_local8);
                        _arg2.addChild(_local7);
                        break;
                    default:
                        _arg2.addChild(this.createSpanElement(_local5.content, _local5.color));
                };
                _local4++;
            };
        }
        private function createSpanElement(_arg1:String, _arg2:uint):SpanElement{
            var _local3:SpanElement = new SpanElement();
            _local3.text = _arg1;
            _local3.color = _arg2;
            return (_local3);
        }
        private function createLinkElement(_arg1):LinkElement{
            var _local2:LinkElement = new LinkElement();
            if ((_arg1 is String)){
                _local2.href = _arg1;
            } else {
                if ((_arg1 is Function)){
                    _local2.addEventListener(FlowElementMouseEvent.CLICK, _arg1);
                };
            };
            return (_local2);
        }
        public function showScoreCostEffect(_arg1:int):void{
            var _local2:ScoreCostEffect;
            _local2 = new ScoreCostEffect();
            _local2.setInfo(_arg1);
            _local2.x = 50;
            _local2.y = (this.chatWindow.height - 50);
            this.chatWindow.addElement(_local2);
        }

    }
}//package chat_system 
