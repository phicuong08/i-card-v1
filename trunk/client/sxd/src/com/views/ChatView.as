//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.*;
    import flash.display.*;
    import com.haloer.net.*;
    import com.assist.view.*;
    import flash.geom.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class ChatView extends Base implements IView {

        private var _tempChatData:Object;
        public var serverOpenTime:int = 0;
        private var _postList:Array;
        private var _chat:IChat;
        public var chatType:int = 1;
        private var _showNum:int = 0;
        private var _shieldPlayerList:Array;
        private var _cookie:Cookie;
        private var _isAllLimit:Boolean = false;
        private var _shieldTackId:int = 0;
        private var _disableTalkId:int = 0;
        public var onPassClick:Function;

        public function ChatView(){
            this.onPassClick = new Function();
            super();
        }
        public static function ljLimit(_arg1:String):Boolean{
            var _local7:String;
            var _local8:int;
            var _local9:Boolean;
            var _local10:Boolean;
            var _local2:String = _arg1;
            var _local3:int = _local2.length;
            var _local4:String = "";
            var _local5:Boolean;
            var _local6:int;
            while (_local6 < _local3) {
                _local7 = _local2.charAt(_local6);
                _local8 = _local2.charCodeAt(_local6);
                _local9 = (((_local8 > 32)) && ((_local8 < 47)));
                _local10 = (((_local8 > 58)) && ((_local8 < 63)));
                if (((((((((!((_local7 == " "))) && (!((_local7 == "　"))))) && (!((_local7 == "-"))))) && ((_local9 == false)))) && ((_local10 == false)))){
                    _local4 = (_local4 + _local7);
                };
                _local6++;
            };
            _local5 = /龙将/g.test(_local4);
            return (_local5);
        }

        public function chat_with_players(_arg1:Object, _arg2:Function):void{
            var _local3:String;
            if (_arg1.messageType == Mod_Chat_Base.ACTIVITY){
                _local3 = TownType.getSign(_ctrl.player.mapId);
                if ((((((((_local3 == TownType.ZhuQueFactionWar)) || ((_local3 == TownType.XuanWuFactionWar)))) || ((_local3 == TownType.QingLongFactionWar)))) || ((_local3 == TownType.BaiHuFactionWar)))){
                    _arg1.messageType = Mod_Chat_Base.FACTION_WAR;
                };
            };
            this._tempChatData = _arg1;
            _data.call(Mod_Chat_Base.chat_with_players, _arg2, [_arg1.messageType, _arg1.message, _arg1.eipNum, _arg1.eipIndex]);
        }
        private function bro_to_players():void{
            _data.patch(Mod_Chat_Base.bro_to_players, this.broToPlayersCallback);
        }
        private function disable_player_talk(_arg1:int):void{
            _data.call(Mod_Chat_Base.disable_player_talk, this.disableTalkCallback, [_arg1]);
        }
        private function get_affiche_list():void{
            _data.call(Mod_Player_Base.get_affiche_list, this.callbackPostData, []);
            _data.patch(Mod_Player_Base.get_affiche_list, this.callbackPostData);
        }
        private function get_warning_affiche():void{
            _data.call(Mod_Player_Base.get_warning_affiche, this.callbackWarningAffiche, []);
            _data.patch(Mod_Player_Base.get_warning_affiche, this.callbackWarningAffiche);
        }
        public function resetPatchChat():void{
            this.patchChat(this.broToPlayersCallback);
        }
        public function patchChat(_arg1:Function):void{
            _data.patch(Mod_Chat_Base.bro_to_players, _arg1);
        }
        private function chatWithPlayersCallback():void{
            var _local1:Array;
            var _local2:String;
            var _local3:String;
            var _local4:Object;
            _local1 = this._ctrl.chat.chatWithPlayers;
            switch (_local1[1]){
                case Mod_Chat_Base.TIME_DIFF:
                    _view.showTip(ChatViewLang.UnderTheRest);
                    break;
                case Mod_Chat_Base.DISABLE:
                    _local2 = TimeChange.mainTimerDate(_local1[0]);
                    _local3 = ChatViewLang.InGag;
                    _local4 = {};
                    _local4.eipIndex = this._tempChatData.eipIndex;
                    _local4.eipNum = this._tempChatData.eipNum;
                    _local4.msgTxt = this._tempChatData.message;
                    _local4.msgType = this._tempChatData.messageType;
                    _local4.playId = _ctrl.player.playerId;
                    _local4.playName = _ctrl.player.nickname;
                    _local4.showName = _ctrl.player.nickname;
                    _local4.serverTime = _ctrl.player.serverTime;
                    _local4.sex = RoleType.getRoleGender(_ctrl.player.mainRoleId);
                    _local4.nickNameSuffix = _ctrl.player.removeNickNameSuffix;
                    _local4.fileColor = ((_ctrl.player.playerInfo.starUser == 1)) ? 191967 : 0xFFFFFF;
                    this._chat.getChatData = [_local4];
                    this._chat.getTownPlaySay = [_local4];
                    if (this._isAllLimit == false){
                        this.setAllLimit();
                    };
                    break;
            };
        }
        private function broToPlayersCallback():void{
            var _local1:Array = this._ctrl.chat.message;
            var _local2:Array = this.factionWar(_local1);
            if (_local2.length <= 0){
                return;
            };
            var _local3:Object = _local1[0];
            var _local4:int = (_ctrl.player.serverTime - this.serverOpenTime);
            var _local5:int = TownType.getTownIdByLock(_local3.townKey);
            var _local6:int = _ctrl.player.townKey;
            var _local7:int = TownType.getLock(TownType.getId(TownType.ShuShanCheng));
            if (_local3.isTester < 2){
                if (_local6 >= _local7){
                    if (_local3.townKey < _local7){
                        return;
                    };
                } else {
                    if (_local3.townKey < _local6){
                        return;
                    };
                };
                if (((((!((_local3.playId == _ctrl.player.playerId))) && ((_local5 <= TownType.getId(TownType.XiaoYuCun))))) && ((_local4 > 345600)))){
                    return;
                };
            };
            if (((ljLimit(_local3.msgTxt)) && (!((_local3.playId == _ctrl.player.playerId))))){
                return;
            };
            this._chat.getChatData = _local2;
            this._chat.getTownPlaySay = _local2;
        }
        private function factionWar(_arg1:Array):Array{
            var _local3:int;
            var _local4:Array;
            var _local5:int;
            var _local6:Object;
            var _local2:String = TownType.getSign(_ctrl.player.mapId);
            if ((((((((_local2 == TownType.ZhuQueFactionWar)) || ((_local2 == TownType.XuanWuFactionWar)))) || ((_local2 == TownType.QingLongFactionWar)))) || ((_local2 == TownType.BaiHuFactionWar)))){
                _local3 = _arg1.length;
                _local4 = [];
                _local5 = 0;
                while (_local5 < _local3) {
                    _local6 = _arg1[_local5];
                    if (_local6.msgType != Mod_Chat_Base.ACTIVITY){
                        if (_local6.msgType == Mod_Chat_Base.FACTION_WAR){
                            _local6.msgType = Mod_Chat_Base.ACTIVITY;
                        };
                        _local4.push(_local6);
                    };
                    _local5++;
                };
                return (_local4);
            };
            return (_arg1);
        }
        private function disableTalkCallback():void{
            var _local1:Object = this._ctrl.chat.disableTalk;
            if (_local1.msg == Mod_Chat_Base.SUCCESS){
                _view.showTip(ChatViewLang.GagSuccess, null, TipType.Success);
            } else {
                this.renderMsg(_local1);
            };
        }
        private function callbackPostData():void{
            var _local1:Array = this._ctrl.player.afficheList;
            this._chat.getReceivePostList = _local1;
            this.reposition(false);
        }
        private function callbackWarningAffiche():void{
            var _local1:String = this._ctrl.player.warningAffiche;
            this._chat.getPunishmentPostList = _local1;
            this.reposition(false);
        }
        private function updateCallBack():void{
            this.get_affiche_list();
            this.get_warning_affiche();
        }
        public function set visiblePost(_arg1:Boolean):void{
            if (this._chat == null){
                return;
            };
            this._chat.visiblePost = _arg1;
        }
        private function renderMsg(_arg1:Object):void{
            switch (_arg1.msg){
                case Mod_Chat_Base.NORIGHT:
                    _view.showTip(ChatViewLang.NoRight);
                    break;
                case Mod_Chat_Base.ISTESTER:
                    _view.showTip(ChatViewLang.IsTester);
                    break;
                case Mod_Chat_Base.DISABLED:
                    _view.showTip(ChatViewLang.Disabled);
                    break;
            };
        }
        public function changeChannel(_arg1:int=99):void{
            this._chat.changeChat = _arg1;
        }
        public function showMsg(_arg1:Array):void{
            var _local2:Object = {
                eipIndex:"",
                eipNum:"",
                message:_arg1.join("_"),
                messageType:Mod_Chat_Base.WORLD
            };
            if (this._showNum > 0){
                _local2.messageType = 100;
                _local2.message = (this._showNum + ChatViewLang.TimeOver);
                _local2.sex = RoleType.getRoleGender(this._ctrl.player.mainRoleId);
                this._chat.sendSelf = _local2;
            } else {
                this.chat_with_players(_local2, this.chatWithPlayersCallback);
                this._showNum = 10;
            };
        }
        private function showTimerEvent():void{
            if (this._showNum > 0){
                this._showNum--;
            };
        }
        public function show():void{
            this.render();
            this.allLimit();
            this.getAllLimit();
        }
        public function render():void{
            this.serverOpenTime = URI.openTime;
            this._chat = (_view.getAssetsObject("Chat", "Chat") as IChat);
            _popup.addView(this, this._chat.content);
            this._chat.tip = _view.tip.iTip;
            _view.addToTimerProcessList(sign, this.showTimerEvent);
            this._chat.playerId = _ctrl.player.playerId;
            this._chat.nickName = _ctrl.player.nickname;
            var obj:* = {};
            obj.handler = (this._chat.getRemoveSuffixData = _ctrl.player.removeNickNameSuffix);
            this.shieldPlayerList();
            this.bro_to_players();
            this.get_affiche_list();
            this.get_warning_affiche();
            this.changeChannel();
            this._chat.onSendChat = function (_arg1:Object):void{
                var _local2:String;
                if (Config.EnableDomainSelector == true){
                    _local2 = _arg1.message;
                    if (_local2.indexOf("set drama ") == 0){
                        MissionMapView.dramaList.push(_local2.split(" ").pop());
                    };
                };
                if (/^MSG\d+/.test(_arg1.message)){
                    return;
                };
                if (_ctrl.player.isTester){
                    chat_with_players(_arg1, chatWithPlayersCallback);
                } else {
                    sendChatLimit(_arg1);
                };
            };
            this._chat.onOpenGm = function ():void{
                _view.gameMaster.switchSelf();
            };
            this._chat.onSendTownFile = function (_arg1:Object):void{
                if (_arg1.type != Mod_Chat_Base.ACTIVITY){
                    return;
                };
                if (_arg1.iconLen == 0){
                    _view.screen.currentMap.playerSay(_arg1.playerId, _arg1.info, _arg1.msgLen);
                } else {
                    _view.screen.currentMap.playerSay(_arg1.playerId, _arg1.file, _arg1.msgLen);
                };
            };
            this._chat.onTextLink = function (_arg1:TextEvent):void{
                switch (_arg1.text){
                    case ActivityType.FactionSeal:
                        _view.factionSeal.switchSelf();
                        break;
                    default:
                        _view.toolbar.onTextLink(_arg1);
                };
            };
            this._chat.content.addEventListener(MouseEvent.MOUSE_DOWN, this.passThroughHandler);
            this.changePoint = 0;
        }
        private function startTime():void{
            var _local1:Number = (new Date(2012, 0, 18).time / 1000);
            var _local2:Number = this._ctrl.player.serverTime;
            if (this._ctrl.player.serverTime >= _local1){
            };
        }
        public function chatOpenFunction():void{
            var _local1:Boolean = FunctionType.isOpened(FunctionType.MultiMission);
            this._chat.isOpenActivity = _local1;
            if (_local1){
                this._chat.isOpenFaction = FunctionType.isOpened(FunctionType.Faction);
            };
        }
        private function shieldPlayerList():void{
            this._shieldPlayerList = [];
            var _local1:Object = _view.getCookie("shieldPlayer");
            if (_local1 == null){
                return;
            };
            var _local2:String = _local1.info;
            _local1.info = this._chat.getShieldPlayerInfo(_local2, _ctrl.player.serverTime);
            _view.setCookie("shieldPlayer", _local1);
            this._shieldPlayerList = _local2.split("_");
        }
        private function allLimit():void{
            this._cookie = new Cookie("sxd");
        }
        private function setAllLimit():void{
            var _local1:Object = {};
            _local1.time = _ctrl.player.serverTime;
            this._cookie.setCookie("chatLimit", _local1);
            this._isAllLimit = true;
        }
        private function getAllLimit():void{
            var _local2:Object;
            var _local1:Object = this._cookie.getCookie("chatLimit");
            if (((!((_local1 == null))) && (!((_local1 == ""))))){
                _local2 = TimeChange.diffTimerInfo(_local1.time, _ctrl.player.serverTime);
                if (_local2.date >= 1){
                    this._isAllLimit = false;
                    this._cookie.clear("chatLimit");
                } else {
                    this._isAllLimit = true;
                };
                return;
            };
            this._isAllLimit = false;
        }
        public function isShieldPlayerTalk(_arg1:int, _arg2:String):void{
            this._shieldTackId = _arg1;
            _view.alert.showYesNoMsg(Lang.sprintf(ChatViewLang.UserGag, _arg2), ChatViewLang.Sure, ChatViewLang.Cancel, this.onShieldTalk);
        }
        private function checkShieldPlayerTalk():void{
            var _local3:String;
            var _local4:String;
            var _local5:Object;
            var _local1:Object = {};
            _local1.playId = this._shieldTackId;
            _local1.addTime = _ctrl.player.serverTime;
            var _local2:Boolean = this._chat.isShieldPlayer(_local1);
            if (_local2 == false){
                _view.showTip(ChatViewLang.ShieldPlayer);
            } else {
                _view.showTip(ChatViewLang.ShieldPlayerSuccess, null, TipType.Success);
                _local3 = ((_local1.playId + ",") + _local1.addTime);
                this._shieldPlayerList.push(_local3);
                _local4 = this._shieldPlayerList.join("_");
                _local5 = {};
                _local5.info = _local4;
                _view.setCookie("shieldPlayer", _local5);
            };
        }
        public function onShieldTalk(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    if (this._shieldTackId == 0){
                        _view.showTip(ChatViewLang.PlayerIdNo0);
                        return;
                    };
                    this.checkShieldPlayerTalk();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        private function sendChatLimit(_arg1:Object, _arg2:Boolean=false):void{
            _arg1.sex = RoleType.getRoleGender(_ctrl.player.mainRoleId);
            this.getAllLimit();
            if (this._ctrl.player.isTester == false){
                if (((this._isAllLimit) && ((_ctrl.player.level < 25)))){
                    this._chat.sendSelf = _arg1;
                    return;
                };
                if ((((_ctrl.player.level < 25)) && (this._chat.wordsLimit(_arg1)))){
                    this.setAllLimit();
                    this._chat.sendSelf = _arg1;
                    return;
                };
            };
            if (((!(this._chat.isSendTrue(_arg1, 0, 6))) && ((_arg2 == false)))){
                this._chat.sendSelf = _arg1;
            } else {
                this.chat_with_players(_arg1, this.chatWithPlayersCallback);
            };
        }
        public function set isOpenActivity(_arg1:Boolean):void{
            this._chat.isOpenActivity = _arg1;
        }
        public function set isOpenFaction(_arg1:Boolean):void{
            this._chat.isOpenFaction = _arg1;
        }
        public function receive(_arg1:String, _arg2:Boolean=false, _arg3:int=99, _arg4:Boolean=false):void{
            if (this._chat == null){
                return;
            };
            var _local5:String = (("<font color=\"#ffffff\">" + _arg1) + "</font>");
            this.sendInfo(_local5, _arg2, _arg3, _arg4);
        }
        private function sendInfo(_arg1:String, _arg2:Boolean, _arg3:int=99, _arg4:Boolean=false):void{
            if (_arg4 == false){
                this._chat.directlyChatData(_arg1, _arg3, _arg2);
            } else {
                this._chat.addMainShow(_arg1, _arg3, _arg2);
            };
        }
        public function disableTalkPlayer(_arg1:int, _arg2:String):void{
            this._disableTalkId = _arg1;
            _view.alert.showYesNoMsg(Lang.sprintf(ChatViewLang.UserGag, _arg2), ChatViewLang.Sure, ChatViewLang.Cancel, this.onDisableTalk);
        }
        public function onDisableTalk(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    if (this._disableTalkId == 0){
                        _view.showTip(ChatViewLang.PlayerIdNo0);
                        return;
                    };
                    this.disable_player_talk(this._disableTalkId);
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function get content():Sprite{
            return (this._chat.content);
        }
        public function clear():void{
            this._chat.clear();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
            _data.cancelPatch(Mod_Player_Base.get_warning_affiche);
        }
        override public function get inStage():Boolean{
            return (((this._chat) && (this._chat.content.parent)));
        }
        public function updateDepth(_arg1:IView):void{
            if (((this.inStage) && (((((((((!(((_arg1 as WarView) == null))) || (!(((_arg1 as SuperSportView) == null))))) || (!(((_arg1 as StrategyWarView) == null))))) || (!(((_arg1 as TakeBibleRoadView) == null))))) || (!(((_arg1 as StudyStuntView) == null))))))){
                _popup.addView(this, this._chat.content);
            };
        }
        public function resetDepth():void{
            if (this.inStage){
                _popup.addChildAt(this._chat.content, 0);
            };
        }
        public function set parent(_arg1:Sprite):void{
            _arg1.addChild(this._chat.content);
        }
        public function passThroughHandler(_arg1:MouseEvent):void{
            if (!this._chat.content.hitTestPoint(_view.stage.mouseX, _view.stage.mouseY)){
                return;
            };
            var _local2:BitmapData = new BitmapData(1, 1, true, 0);
            _local2.draw(this._chat.content, new Matrix(1, 0, 0, 1, -(this._chat.content.mouseX), -(this._chat.content.mouseY)));
            var _local3:uint = _local2.getPixel32(0, 0);
            if (_local3 == 1258291200){
                this.onPassClick(_arg1);
            };
        }
        public function reposition(_arg1:Boolean=true):void{
            if (this.inStage == false){
                return;
            };
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._chat.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageClip);
            };
        }
        public function set changePoint(_arg1:int):void{
            if (this._chat == null){
                return;
            };
            if (_view.serverWarCup.inStage){
                this._chat.changePoint = _arg1;
                this.visiblePost = false;
            } else {
                this._chat.changePoint = 0;
                this.visiblePost = true;
            };
            this.reposition(false);
        }
        public function set chatVisible(_arg1:Boolean):void{
            if (this._chat == null){
                return;
            };
            this._chat.chatVisible = _arg1;
        }
        public function get chatVisible():Boolean{
            return (this._chat.chatVisible);
        }
        public function addSystemMessage(_arg1:String, _arg2:uint=0xFFFFFF):void{
            var _local3:String = (((("<font color=\"#" + _arg2.toString(16)) + "\">") + _arg1) + "</font>");
            this.receive(_local3, true);
        }

    }
}//package com.views 
