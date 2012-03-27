//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import flash.display.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;
    import com.assist.view.standaloneChat.*;

    public class StandaloneChatView extends Base implements IView {

        private var _chat:IChat;
        private var _type:int;
        private var _parent:Sprite;
        private var _relatedView:IView;
        private var _onSend:Function;
        public var channelId:int;

        override public function get inStage():Boolean{
            return (((this._chat) && (this._chat.content.parent)));
        }
        public function show():void{
            loadAssets("Chat", this.render, StandaloneChatViewLang.LoadInfo, true, true);
        }
        public function sendChatCallBack():void{
        }
        public function render():void{
            if (this._relatedView == null){
                return;
            };
            this._chat = (_view.getAssetsObject("Chat", "Chat") as IChat);
            this._parent.addChild(this._chat.content);
            this._chat.tip = _view.tip.iTip;
            this._chat.content.x = 1;
            this._chat.content.y = (600 - 187);
            this._chat.onSendChat = function (_arg1:Object):void{
                _arg1.channelId = (10000 + _ctrl.multiMission.multiWarData.multipleTeamId);
                _view.chat.chat_with_players(_arg1, sendChatCallBack);
            };
            this._chat.onTextLink = function (_arg1:TextEvent):void{
            };
            _view.chat.patchChat(this.broToPlayerCallBack);
            this._chat.visibleFunction = 0;
            this.initSystemMsg();
        }
        private function initSystemMsg():void{
            var _local1:String = "<font color=\"#FFF100\">";
            switch (this._type){
                case StandaloneChatType.MultiWar:
                    _local1 = (_local1 + StandaloneChatViewLang.WelcomeMulti);
                    break;
            };
            _local1 = (_local1 + "</font>");
            this.sendInfo(_local1);
        }
        public function open(_arg1:IView, _arg2:Sprite, _arg3:Function, _arg4:int):void{
            this._relatedView = _arg1;
            this._parent = _arg2;
            this._onSend = _arg3;
            this._type = _arg4;
            this.show();
        }
        public function broToPlayerCallBack():void{
            var _local1:Array = this._ctrl.chat.message;
            this._chat.getChatData = _local1;
        }
        public function receiveSysMsg(_arg1:String):void{
            this.sendInfo(_arg1);
        }
        private function sendInfo(_arg1:String):void{
            this._chat.addMainShow(_arg1, Mod_Chat_Base.ACTIVITY, true);
        }
        private function get typeName():String{
            var _local1:String;
            switch (this._type){
                case StandaloneChatType.MultiWar:
                    _local1 = StandaloneChatViewLang.War;
                    break;
            };
            return (_local1);
        }
        public function clear():void{
        }
        public function close():void{
            _view.chat.resetPatchChat();
            if (this.inStage){
                this._chat.content.parent.removeChild(this._chat.content);
            };
            this._parent = null;
            this._relatedView = null;
        }
        public function reposition():void{
            if (this.inStage == false){
                return;
            };
            this._chat.content.y = (Structure.stageHeight - 187);
        }

    }
}//package com.views 
