package {
    import flash.display.*;
    import com.lang.client_resources.chat.*;
    import com.assist.view.interfaces.*;
    import flash.events.*;
    import flash.utils.*;
    import com.protocols.*;
    import flash.text.*;
    import com.riaidea.text.*;
    import flash.filters.*;
    import flash.ui.*;
    import flash.geom.*;

    public class Chat extends MovieClip implements IChat {

        public var _PostBox:MovieClip;
        public var _PunishmentPostBox:MovieClip;
        public var _ChatBox:MovieClip;
        private var _systemChatInfo:String;
        private var _onTextLink:Function;
        private var _onOpenGm:Function;
        private var _tip:ITip;
        private var _allType:int = 99;
        private var _chatShow:int;
        private var _worldList:Array;
        private var _activityList:Array;
        private var _factionList:Array;
        private var _allList:Array;
        private var _timer:Timer;
        private var _btnMcTimer:Timer;
        private var _btnTimerNum:int = 0;
        private var _btnList:Array;
        private var _gotoMc:MovieClip;
        private var _showChatScale:int = 1;
        private var _showSize:int = 130;
        private var _chatMc:MovieClip;
        private var _chatText:RichTextField;
        private var _textFormat:TextFormat;
        private var _sendDataPlayerId:int = 0;
        private var _sendText:RichTextField;
        private var _sendTextFormat:TextFormat;
        private var _scrollbar:Scrollbar;
        private var _playerId:int = 0;
        private var _nickName:String = "";
        private var _removeSuffix:Function;
        private var _onSendChat:Function;
        private var _timerNum:int = 0;
        private var _sendChatList:Array;
        private var _sendChatId:int = 0;
        private var _isSendEvent:Boolean = false;
        private var _isNewText:Boolean = true;
        private var _limitNum:int = 60;
        private var _isIntoEip:Boolean = true;
        private var _sendTxt:String = "";
        private var _onCheckData:Function;
        private var _onSendFriendChat:Function;
        private var _showActivityList:Array;
        private var _showFactionList:Array;
        private var _downBox:ChatDownBox;
        private var _tipContent:Sprite;
        private var _messageType:int = 1;
        private var _eipDataId:Object;
        private var _eipBar:EipBar;
        private var _eipList:Array;
        private var _postTimer:Timer;
        private var _isClosePost:Boolean = false;
        private var _teceivePostList:Array;
        private var _isMainPostShow:Boolean = false;
        private var _postTimerNum:int = 180;
        private var _postMcNum:int = 0;
        private var _postShowNum:int = 0;
        private var _isEmptyStr:Boolean = false;
        private var _onSendTownFile:Function;
        private var _townFormat:TextFormat;
        private var _xy:Array;
        private var _serverWarXy:Array;
        private var _postXY:Array;
        private var _punishmentPostXY:Array;
        private var _stageOffsetX:Number;
        private var _stageOffsetY:Number;
        private var w:int;
        private var h:int;
        private var _stageClip:Point;
        private var _changeType:int = 0;
        private var _typeMultiMission:int = 99;
        private var _chatType:int = 99;

        public function Chat(){
            this._systemChatInfo = (("<font color=\"#FFF100\">" + ChatLang.SystemChat) + "\n</font>");
            this._onTextLink = new Function();
            this._onOpenGm = new Function();
            this._chatShow = this._allType;
            this._timer = new Timer(1000);
            this._btnMcTimer = new Timer(100);
            this._btnList = [{
                name:"All",
                type:this._allType,
                list:this._allList
            }, {
                name:"World",
                type:Mod_Chat_Base.WORLD,
                list:this._worldList
            }, {
                name:"Faction",
                type:Mod_Chat_Base.FACTION,
                list:this._factionList
            }, {
                name:"Activity",
                type:Mod_Chat_Base.ACTIVITY,
                list:this._activityList
            }, {
                name:"Gm",
                type:"GM"
            }];
            this._onSendChat = new Function();
            this._onCheckData = new Function();
            this._onSendFriendChat = new Function();
            this._showActivityList = [{
                label:ChatLang.World,
                type:Mod_Chat_Base.WORLD
            }, {
                label:ChatLang.Activity,
                type:Mod_Chat_Base.ACTIVITY
            }];
            this._showFactionList = [{
                label:ChatLang.World,
                type:Mod_Chat_Base.WORLD
            }, {
                label:ChatLang.Activity,
                type:Mod_Chat_Base.ACTIVITY
            }, {
                label:ChatLang.Faction,
                type:Mod_Chat_Base.FACTION
            }];
            this._postTimer = new Timer(1000);
            this._onSendTownFile = new Function();
            this._xy = [0, 207];
            this._serverWarXy = [350, 130];
            this._postXY = [321, -90];
            this._punishmentPostXY = [300, -50];
            super();
            x = this._xy[0];
            y = this._xy[1];
            this.addMc();
            this.addEvent();
            this.addInputFile();
            this.addSendFile();
            this.createScorllbar();
            this.addCountenance();
            this.addBoxData();
            this.addEipBar();
            this.scrollbarTxt();
            this.addFilters();
            this._ChatBox._Black.alpha = 0;
            this._chatShow = this._allType;
            this._allList = [];
            this._worldList = [];
            this._activityList = [];
            this._factionList = [];
            this._sendChatList = [];
            this.defaultInfo();
            this._ChatBox._BtnFaction.visible = false;
            this._ChatBox._BtnActivity.visible = false;
        }
        private static function isEmptyStr(_arg1:String):Boolean{
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                if (((!((_arg1.charAt(_local3) == " "))) && (!((_arg1.charAt(_local3) == "　"))))){
                    return (false);
                };
                _local3++;
            };
            return (true);
        }

        public function get content():MovieClip{
            return (this);
        }
        public function set onTextLink(_arg1:Function):void{
            this._onTextLink = _arg1;
        }
        public function set onOpenGm(_arg1:Function):void{
            this._onOpenGm = _arg1;
        }
        public function getShieldPlayerInfo(_arg1:String, _arg2:int):String{
            return (chatDataChange.getShieldPlayerInfo(_arg1, _arg2));
        }
        public function isSendTrue(_arg1:Object, _arg2:int, _arg3:int):Boolean{
            return (ChatLimit.isSendTrue(_arg1, _arg2, _arg3));
        }
        public function wordsLimit(_arg1:Object):Boolean{
            return (ChatLimit.wordsLimit(_arg1));
        }
        public function isShieldPlayer(_arg1:Object):Boolean{
            return (chatDataChange.isShieldPlayer(_arg1, true));
        }
        public function set tip(_arg1:ITip):void{
            this._tip = _arg1;
            this._tip.addTarget(this._ChatBox._Btnmax, ChatLang.BtnMax);
            this._tip.addTarget(this._ChatBox._Btnmin, ChatLang.BtnMin);
            this._tip.addTarget(this._ChatBox._BtnEip, ChatLang.BtnEip);
            this._tip.addTarget(this._ChatBox._BtnAll, ChatLang.BtnAll);
            this._tip.addTarget(this._ChatBox._BtnWorld, ChatLang.World);
            this._tip.addTarget(this._ChatBox._BtnFaction, ChatLang.Faction);
            this._tip.addTarget(this._ChatBox._BtnActivity, ChatLang.Activity);
            this._tip.addTarget(this._ChatBox._BtnGm, "GM");
        }
        public function clear():void{
            this.clearSendTestEvent();
            this.clearFile();
            this.clearSendFile();
            this.clearScrollbar();
            this.clearScrollberTxt();
            this.clearMc();
            this.clearBox();
            this._tip.removeTarget(this._ChatBox._Btnmax);
            this._tip.removeTarget(this._ChatBox._Btnmin);
            this._tip.removeTarget(this._ChatBox._BtnEip);
            this._tip.removeTarget(this._ChatBox._BtnAll);
            this._tip.removeTarget(this._ChatBox._BtnWorld);
            this._tip.removeTarget(this._ChatBox._BtnFaction);
            this._tip.removeTarget(this._ChatBox._BtnActivity);
            this._tip.removeTarget(this._ChatBox._BtnGm);
            this._ChatBox._Btnmax.removeEventListener(MouseEvent.CLICK, this.btnMaxClick);
            this._ChatBox._Btnmin.removeEventListener(MouseEvent.CLICK, this.btnMinClick);
            this._ChatBox._Send.removeEventListener(MouseEvent.CLICK, this.sendClick);
            this._ChatBox._CheckType.removeEventListener(MouseEvent.CLICK, this.checkTypeClick);
            this._ChatBox._BtnEip.removeEventListener(MouseEvent.CLICK, this.btnEipClick);
            this.removeEventListener(MouseEvent.MOUSE_OVER, this.targetOver);
            this._btnMcTimer.removeEventListener(TimerEvent.TIMER, this.btnTimerEvent);
            this.removeEventListener(MouseEvent.MOUSE_OUT, this.targetOut);
            this.clearBtn();
        }
        private function addEvent():void{
            this.addEventListener(MouseEvent.MOUSE_OVER, this.targetOver);
            this.addEventListener(MouseEvent.MOUSE_OUT, this.targetOut);
            this._ChatBox._Btnmax.addEventListener(MouseEvent.CLICK, this.btnMaxClick);
            this._ChatBox._Btnmin.addEventListener(MouseEvent.CLICK, this.btnMinClick);
            this._ChatBox._Send.addEventListener(MouseEvent.CLICK, this.sendClick);
            this._ChatBox._CheckType.addEventListener(MouseEvent.CLICK, this.checkTypeClick);
            this._ChatBox._BtnEip.addEventListener(MouseEvent.CLICK, this.btnEipClick);
            this._timer.addEventListener(TimerEvent.TIMER, this.timerEvent);
            this._btnMcTimer.addEventListener(TimerEvent.TIMER, this.btnTimerEvent);
            this._ChatBox._BtnEip.buttonMode = true;
            this._ChatBox._CheckType.buttonMode = true;
            this.renderBtn();
        }
        private function defaultInfo():void{
            this.directlyChatData(this._systemChatInfo, this._allType, true);
        }
        private function btnTimerEvent(_arg1:TimerEvent):void{
            if ((this._btnTimerNum % 2) == 0){
                this._ChatBox._BtnFaction._ShowBtn.alpha = 0;
            } else {
                this._ChatBox._BtnFaction._ShowBtn.alpha = 1;
            };
            this._btnTimerNum++;
        }
        public function set isOpenActivity(_arg1:Boolean):void{
            if (this._ChatBox._BtnFaction.visible == true){
                return;
            };
            if (_arg1){
                this._ChatBox._BtnActivity.x = 110;
                this._ChatBox._BtnGm.x = 163;
            } else {
                this._ChatBox._BtnGm.x = 110;
            };
            this._ChatBox._BtnActivity.visible = _arg1;
        }
        public function set isOpenFaction(_arg1:Boolean):void{
            if (this._ChatBox._BtnActivity.visible == false){
                return;
            };
            if (_arg1){
                this._ChatBox._BtnActivity.x = 163;
                this._ChatBox._BtnGm.x = 216;
            } else {
                this._ChatBox._BtnActivity.x = 110;
                this._ChatBox._BtnGm.x = 163;
            };
            this._ChatBox._BtnFaction.visible = _arg1;
        }
        public function set changeChat(_arg1:int):void{
            this.changeChatType(_arg1);
        }
        private function targetOver(_arg1:MouseEvent):void{
            this._ChatBox._Black.alpha = 0.3;
        }
        private function targetOut(_arg1:MouseEvent):void{
            this._ChatBox._Black.alpha = 0;
        }
        private function renderBtn():void{
            var _local3:Object;
            var _local1:int = this._btnList.length;
            var _local2:int;
            while (_local2 < _local1) {
                _local3 = this._btnList[_local2];
                _local3.btn = this._ChatBox[("_Btn" + _local3.name)];
                _local3.handler = this.btnClick(_local3);
                _local3.btn.addEventListener(MouseEvent.CLICK, _local3.handler);
                if (_local3.type != "GM"){
                    _local3.btn.buttonMode = true;
                    _local3.btn._ShowBtn.alpha = 0;
                    _local3.btn._ShowBtn.mouseEnabled = false;
                    if (_local3.type != this._allType){
                        _local3.btn.gotoAndStop(2);
                    } else {
                        this._gotoMc = _local3.btn;
                    };
                };
                _local2++;
            };
        }
        private function btnClick(_arg1:Object):Function{
            var data:* = _arg1;
            var func:* = function (_arg1:MouseEvent):void{
                if (data.type != "GM"){
                    changeChatType(data.type);
                } else {
                    _onOpenGm();
                };
            };
            return (func);
        }
        private function clearBtn():void{
            var _local3:Object;
            var _local1:int = this._btnList.length;
            var _local2:int;
            while (_local2 < _local1) {
                _local3 = this._btnList[_local2];
                _local3.btn.removeEventListener(MouseEvent.CLICK, _local3.handler);
                _local2++;
            };
        }
        private function btnMaxClick(_arg1:MouseEvent):void{
            if (this._showChatScale >= 2){
                return;
            };
            this._showChatScale++;
            this.changeShowChat();
        }
        private function btnMinClick(_arg1:MouseEvent):void{
            if (this._showChatScale <= 0){
                return;
            };
            this._showChatScale--;
            this.changeShowChat();
        }
        private function changeShowChat():void{
            if (this._showChatScale == 0){
                this._scrollbar.visible = false;
                this._chatMc.visible = false;
                this._ChatBox._Black.height = 0;
                this._ChatBox._Black.y = 181;
            };
            if (this._showChatScale == 1){
                this._scrollbar.visible = true;
                this._chatMc.visible = true;
                this._scrollbar.scrollbarY = 10;
                this._ChatBox._Black.height = 197;
                this._ChatBox._Black.y = -11.5;
                this._chatMc.y = -5;
                this._scrollbar.targetY = this._chatMc.y;
                this._scrollbar.showHeight = this._showSize;
            };
            if (this._showChatScale == 2){
                this._scrollbar.scrollbarY = -120;
                this._ChatBox._Black.height = 330;
                this._ChatBox._Black.y = -144;
                this._chatMc.y = -130;
                this._scrollbar.targetY = this._chatMc.y;
                this._scrollbar.showHeight = 260;
            };
        }
        private function addMc():void{
            this._chatMc = new MovieClip();
            this._chatMc.y = -5;
            this._chatMc.x = 25;
            this._ChatBox.addChild(this._chatMc);
        }
        private function clearMc():void{
            if (((!((this._chatMc == null))) && (this._chatMc.parent))){
                this._chatMc.parent.removeChild(this._chatMc);
                this._chatMc = null;
            };
        }
        private function addInputFile():void{
            this._textFormat = new TextFormat("新宋体", 13);
            this._textFormat.leading = 5;
            this._chatText = new RichTextField();
            this._chatText.textfield.selectable = false;
            this._chatText.textfield.autoSize = TextFieldAutoSize.LEFT;
            this._chatText.placeholderMarginH = 1;
            this._chatText.textfield.textColor = 0xFFFFFF;
            this._chatText.textfield.mouseWheelEnabled = false;
            this._chatText.html = true;
            this._chatText.mouseEnabled = false;
            this._chatText.defaultTextFormat = this._textFormat;
            this._chatMc.addChild(this._chatText);
            this._chatText.addEventListener(TextEvent.LINK, this.textLink);
        }
        private function textLink(_arg1:TextEvent):void{
            var _local2:String = _arg1.text;
            if (/^Player|^Item|^Fate|^ViewReport|^FactionSeal|^Soul|^Achievement/.test(_local2)){
                this._onTextLink(_arg1);
            } else {
                this.changeChatType(int(_local2));
            };
        }
        private function changeChatType(_arg1:int):void{
            if (this._chatShow == _arg1){
                return;
            };
            this._chatShow = _arg1;
            this._gotoMc._ShowBtn.alpha = 0;
            this._gotoMc.gotoAndStop(2);
            switch (_arg1){
                case Mod_Chat_Base.WORLD:
                    this._messageType = Mod_Chat_Base.WORLD;
                    this._ChatBox._CheckType._Type.gotoAndStop(1);
                    this._gotoMc = this._ChatBox._BtnWorld;
                    this._ChatBox._BtnWorld.gotoAndStop(1);
                    this.renderChatData(this._worldList);
                    break;
                case Mod_Chat_Base.FACTION:
                    this._messageType = Mod_Chat_Base.FACTION;
                    this._ChatBox._CheckType._Type.gotoAndStop(2);
                    this._btnTimerNum = 0;
                    this._btnMcTimer.stop();
                    this._gotoMc = this._ChatBox._BtnFaction;
                    this._ChatBox._BtnFaction.gotoAndStop(1);
                    this.renderChatData(this._factionList);
                    break;
                case Mod_Chat_Base.ACTIVITY:
                    this._messageType = Mod_Chat_Base.ACTIVITY;
                    this._ChatBox._CheckType._Type.gotoAndStop(3);
                    this._gotoMc = this._ChatBox._BtnActivity;
                    this._ChatBox._BtnActivity.gotoAndStop(1);
                    this.renderChatData(this._activityList);
                    break;
                case this._allType:
                    this._messageType = Mod_Chat_Base.WORLD;
                    this._ChatBox._CheckType._Type.gotoAndStop(1);
                    this._gotoMc = this._ChatBox._BtnAll;
                    this._ChatBox._BtnAll.gotoAndStop(1);
                    this.renderChatData(this._allList);
                    break;
            };
        }
        private function addSendFile():void{
            this._sendText = new RichTextField();
            this._sendText.x = 55;
            this._sendText.y = 157;
            this._sendText.setSize(178, 28);
            this._sendText.type = RichTextField.INPUT;
            this._sendText.focusRect = false;
            this._sendText.textfield.multiline = false;
            this._sendTextFormat = new TextFormat("新宋体", 16, 0xFFFFFF);
            this._sendText.defaultTextFormat = this._sendTextFormat;
            this._ChatBox.addChild(this._sendText);
            this._sendText.addEventListener(MouseEvent.CLICK, this.sendTextClick);
        }
        private function clearSendFile():void{
            if (((!((this._sendText == null))) && (this._sendText.parent))){
                this._sendTextFormat = null;
                this._sendText.removeEventListener(MouseEvent.CLICK, this.sendTextClick);
                this._sendText.parent.removeChild(this._sendText);
                this._sendText = null;
            };
        }
        private function addFilters():void{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.blurX = 3;
            _local1.blurY = 3;
            _local1.distance = 0;
            _local1.alpha = 0.6;
            _local1.strength = 10;
            _local1.color = 0;
            _local1.quality = 1;
            this._chatText.textfield.filters = [_local1];
        }
        private function clearFile():void{
            if (((!((this._chatText == null))) && (this._chatText.parent))){
                this._chatText.clear();
                this._chatText.parent.removeChild(this._chatText);
                this._chatText = null;
                this._textFormat = null;
            };
        }
        private function createScorllbar():void{
            this._scrollbar = new Scrollbar();
            this._scrollbar.showWidth = 350;
            this._scrollbar.showHeight = this._showSize;
            this._scrollbar.moveNum = 7;
            this._scrollbar.speed = 8;
            this._scrollbar.scrollbarX = 5;
            this._scrollbar.showBottom = true;
            this._scrollbar.visibleScrollbar = false;
        }
        private function clearScrollbar():void{
            if (this._scrollbar != null){
                this._scrollbar.target = null;
                this._scrollbar = null;
            };
        }
        public function set playerId(_arg1:int):void{
            this._playerId = _arg1;
        }
        public function set nickName(_arg1:String):void{
            this._nickName = _arg1;
        }
        public function set getRemoveSuffixData(_arg1:Function):void{
            this._removeSuffix = _arg1;
        }
        public function set sendSelf(_arg1:Object):void{
            var _local2:Object = {};
            _local2.eipIndex = _arg1.eipIndex;
            _local2.eipNum = _arg1.eipNum;
            _local2.fileColor = 0xFFFFFF;
            _local2.msgTxt = _arg1.message;
            _local2.msgType = _arg1.messageType;
            _local2.playId = this._playerId;
            _local2.playName = this._nickName;
            _local2.showName = this._removeSuffix(_local2.playName);
            _local2.sex = _arg1.sex;
            this.getChatData = [_local2];
            this.getTownPlaySay = [_local2];
        }
        public function set getChatData(_arg1:Array):void{
            var _local2:Array = chatDataChange.renderMessage(_arg1, this._typeMultiMission);
            this.autoChatData(_local2, true);
        }
        private function autoChatData(_arg1:Array, _arg2:Boolean):void{
            var _local5:Object;
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = _arg1[_local4];
                this.renderChat(_local5, _arg2);
                _local4++;
            };
        }
        public function directlyChatData(_arg1:String, _arg2:int, _arg3:Boolean):void{
            var _local4:Array = this.chatDataToList(_arg1, _arg2);
            this.autoChatData(_local4, _arg3);
        }
        public function addMainShow(_arg1:String, _arg2:int, _arg3:Boolean):void{
            var _local7:Object;
            var _local4:Array = this.chatDataToList(_arg1, _arg2);
            var _local5:int = _local4.length;
            var _local6:int;
            while (_local6 < _local5) {
                _local7 = _local4[_local6];
                _local7.type = this._chatShow;
                this.renderChat(_local7, _arg3, true);
                _local6++;
            };
        }
        private function chatDataToList(_arg1:String, _arg2:int):Array{
            var _local3:XML = <rtf>
							<text></text>
							<sprites>
							</sprites>
							</rtf>
            ;
            _local3.text[0] = _arg1;
            var _local4:Object = {};
            _local4.type = _arg2;
            _local4.xmlInfo = _local3;
            return ([_local4]);
        }
        private function addCountenance():void{
            RichTextField.addCountenance("eip1", eip1);
            RichTextField.addCountenance("eip2", eip2);
            RichTextField.addCountenance("eip3", eip3);
            RichTextField.addCountenance("eip4", eip4);
            RichTextField.addCountenance("eip5", eip5);
            RichTextField.addCountenance("eip6", eip6);
            RichTextField.addCountenance("eip7", eip7);
            RichTextField.addCountenance("eip8", eip8);
            RichTextField.addCountenance("eip9", eip9);
            RichTextField.addCountenance("eip10", eip10);
            RichTextField.addCountenance("eip11", eip11);
            RichTextField.addCountenance("eip12", eip12);
            RichTextField.addCountenance("eip13", eip13);
            RichTextField.addCountenance("eip14", eip14);
            RichTextField.addCountenance("eip15", eip15);
            RichTextField.addCountenance("eip16", eip16);
            RichTextField.addCountenance("eip17", eip17);
            RichTextField.addCountenance("eip18", eip18);
            RichTextField.addCountenance("eip19", eip19);
            RichTextField.addCountenance("eip20", eip20);
            RichTextField.addCountenance("eip21", eip21);
            RichTextField.addCountenance("eip22", eip22);
            RichTextField.addCountenance("eip23", eip23);
            RichTextField.addCountenance("eip24", eip24);
            RichTextField.addCountenance("eip25", eip25);
            RichTextField.addCountenance("Male", Male);
            RichTextField.addCountenance("Female", Female);
            RichTextField.addCountenance("Star", Star);
        }
        private function renderChat(_arg1:Object, _arg2:Boolean, _arg3:Boolean=false, _arg4:Boolean=true):void{
            if (this._typeMultiMission == this._chatType){
                switch (_arg1.type){
                    case this._allType:
                        if (_arg3){
                            this.renderAll(_arg1, this._allList, this._allType, _arg4);
                            return;
                        };
                        break;
                    case Mod_Chat_Base.WORLD:
                        this.renderAll(_arg1, this._worldList, Mod_Chat_Base.WORLD, _arg4);
                        break;
                    case Mod_Chat_Base.ACTIVITY:
                        this.renderAll(_arg1, this._activityList, Mod_Chat_Base.ACTIVITY, _arg4);
                        break;
                    case Mod_Chat_Base.FACTION:
                        this.renderAll(_arg1, this._factionList, Mod_Chat_Base.FACTION, _arg4);
                        if (this._chatShow != _arg1.type){
                            this._btnMcTimer.start();
                        };
                        break;
                };
                if (_arg2 == false){
                    return;
                };
                this.renderAll(_arg1, this._allList, this._allType, _arg4);
            } else {
                if (_arg1.type == Mod_Chat_Base.ACTIVITY){
                    this.renderAll(_arg1, this._allList, Mod_Chat_Base.ACTIVITY, _arg4);
                };
            };
        }
        private function renderAll(_arg1:Object, _arg2:Array, _arg3:int, _arg4:Boolean=true):void{
            var _local6:int;
            var _local5:Boolean;
            if (_arg4){
                _arg2.push(_arg1);
                if (_arg2.length > 40){
                    _local6 = 0;
                    while (_local6 < 20) {
                        _arg2.shift();
                        _local6++;
                    };
                    _local5 = true;
                } else {
                    _local5 = false;
                };
            };
            if (this._chatShow != _arg3){
                return;
            };
            if (_arg4){
                if (_local5 == false){
                    this._chatText.importXML(_arg1.xmlInfo);
                } else {
                    this.renderChatData(_arg2);
                };
            } else {
                this.renderChatData(_arg2);
            };
            this._chatText.setSize(300, this._chatText.textfield.height);
            this._scrollbar.mainHeight = (this._chatText.textfield.height - 2);
            this._scrollbar.target = this._chatMc;
        }
        private function renderChatData(_arg1:Array):void{
            this._chatText.clear();
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                this._chatText.importXML(_arg1[_local3].xmlInfo);
                _local3++;
            };
            this._chatText.setSize(300, this._chatText.textfield.height);
            this._scrollbar.mainHeight = (this._chatText.textfield.height - 2);
            this._scrollbar.target = this._chatMc;
        }
        public function set onSendChat(_arg1:Function):void{
            this._onSendChat = _arg1;
        }
        private function timerEvent(_arg1:TimerEvent):void{
            if (this._timerNum <= 0){
                this._timer.stop();
            } else {
                this._timerNum--;
            };
        }
        private function sendClick(_arg1:MouseEvent):void{
            this.sendChatData();
        }
        private function sendChatData():void{
            var _local1:XML = <rtf>
							<text></text>
							<sprites>
							</sprites>
							</rtf>
            ;
            var _local2:Object = {};
            _local2.type = this._chatShow;
            _local2.xmlInfo = _local1;
            if (this._sendText.textfield.text.length <= 0){
                _local1.text[0] = (("<font color=\"#ffffff\">" + ChatLang.NoEmpty) + "</font>");
                this.renderChat(_local2, false, true);
                return;
            };
            if (this._timerNum > 0){
                _local1.text[0] = (("<font color=\"#ffffff\">" + ChatLang.ToNag) + "</font>");
                this.renderChat(_local2, false, true);
                return;
            };
            this._timerNum = 4;
            this._timer.start();
            this.renderSendData();
        }
        private function renderSendData():void{
            var _local1:XML = this._sendText.exportXML();
            var _local2:String = _local1.text[0];
            var _local3:int = _local1.sprites.sprite.length();
            var _local4:Array = [];
            var _local5:Array = [];
            var _local6:int;
            while (_local6 < _local3) {
                _local4.push(this._eipDataId[_local1.sprites.sprite[_local6].@src].id);
                _local5.push(_local1.sprites.sprite[_local6].@index);
                _local6++;
            };
            var _local7:String = _local4.join(",");
            var _local8:String = _local5.join(",");
            var _local9:Object = {};
            _local9.messageType = this._messageType;
            _local9.message = _local2;
            _local9.eipNum = _local7;
            _local9.eipIndex = _local8;
            this._onSendChat(_local9);
            this._sendText.clear();
            this._sendChatList.push(_local1);
            if (this._sendChatList.length > 10){
                this._sendChatList.splice(0, 1);
            };
        }
        private function sendTextClick(_arg1:MouseEvent):void{
            this.clickFile();
        }
        private function clickFile():void{
            if (this._isSendEvent == false){
                stage.focus = this._sendText.textfield;
                stage.addEventListener(KeyboardEvent.KEY_UP, this.onKeyUpHandler);
                stage.addEventListener(MouseEvent.MOUSE_DOWN, this.stageMouseDown);
                this._sendText.addEventListener(Event.CHANGE, this.sendTextChange);
                this._sendText.textfield.addEventListener(KeyboardEvent.KEY_UP, this.chatInfoKeyUp);
                this._isSendEvent = true;
            };
        }
        private function chatInfoKeyUp(_arg1:KeyboardEvent):void{
            if (_arg1.keyCode == Keyboard.SPACE){
                _arg1.stopPropagation();
            };
        }
        private function clearSendTestEvent():void{
            stage.removeEventListener(KeyboardEvent.KEY_UP, this.onKeyUpHandler);
            stage.removeEventListener(MouseEvent.MOUSE_DOWN, this.stageMouseDown);
            this._sendText.removeEventListener(Event.CHANGE, this.sendTextChange);
            this._sendText.textfield.removeEventListener(KeyboardEvent.KEY_UP, this.chatInfoKeyUp);
        }
        private function checkTypeClick(_arg1:MouseEvent):void{
            if (this._ChatBox._CheckType.buttonMode == false){
                return;
            };
            if (this._ChatBox._BtnFaction.visible){
                this.renderBoxData("showType", this._showFactionList);
            } else {
                if (this._ChatBox._BtnActivity.visible){
                    this.renderBoxData("showType", this._showActivityList);
                };
            };
        }
        private function onKeyUpHandler(_arg1:KeyboardEvent):void{
            if (_arg1.keyCode == 17){
                return;
            };
            if (_arg1.keyCode == 13){
                this.sendChatData();
                return;
            };
            if (this._sendChatList.length <= 0){
                return;
            };
            if (_arg1.keyCode == Keyboard.UP){
                this._isNewText = false;
                this._sendText.clear();
                this._sendText.importXML(this._sendChatList[this._sendChatId]);
                this._sendText.caretIndex = this._sendText.textfield.length;
                this._sendChatId--;
            };
            if (_arg1.keyCode == Keyboard.DOWN){
                this._isNewText = false;
                this._sendText.clear();
                this._sendText.importXML(this._sendChatList[this._sendChatId]);
                this._sendText.caretIndex = this._sendText.textfield.length;
                this._sendChatId++;
            };
            this.limitNum();
        }
        private function limitNum():void{
            var _local1:int = (this._sendChatList.length - 1);
            if (this._sendChatId > _local1){
                this._sendChatId = 0;
            };
            if (this._sendChatId < 0){
                this._sendChatId = _local1;
            };
        }
        private function stageMouseDown(_arg1:MouseEvent):void{
            if (((((((!(this._sendText.hitTestPoint(stage.mouseX, stage.mouseY))) && (!(this._ChatBox._BtnEip.hitTestPoint(stage.mouseX, stage.mouseY))))) && (!(this._eipBar.hitTestPoint(stage.mouseX, stage.mouseY))))) && (!(this._ChatBox._Send.hitTestPoint(stage.mouseX, stage.mouseY))))){
                this.clearSendTestEvent();
                stage.focus = null;
                this._isSendEvent = false;
            };
        }
        private function sendTextChange(_arg1:Event):void{
            this.testLimit();
        }
        private function testLimit():void{
            var _local1:XML = this._sendText.exportXML();
            var _local2:String = _local1.text[0];
            var _local3:int = this._sendTxt.length;
            var _local4:int = _local1.sprites.sprite.length();
            var _local5:int = this.countStr(_local2);
            if (_local5 >= 60){
                this._sendText.textfield.maxChars = _local3;
            } else {
                this._sendText.textfield.maxChars = 60;
                this._sendTxt = _local2;
            };
            if (_local4 > 1){
                this._sendText.y = 150;
            } else {
                this._sendText.y = 157;
            };
            if (_local4 >= 10){
                this._isIntoEip = false;
            } else {
                this._isIntoEip = true;
            };
        }
        private function countStr(_arg1:String):int{
            var _local2:int;
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                if (_arg1.charCodeAt(_local4) > 127){
                    _local2 = (_local2 + 2);
                } else {
                    _local2++;
                };
                _local4++;
            };
            return (_local2);
        }
        public function set onCheckData(_arg1:Function):void{
            this._onCheckData = _arg1;
        }
        public function set onSendFriendChat(_arg1:Function):void{
            this._onSendFriendChat = _arg1;
        }
        private function addBoxData():void{
            this._downBox = new ChatDownBox();
            addChild(this._downBox);
            this._downBox.onSendData = function (_arg1:Object, _arg2:Object):void{
                _messageType = _arg1.type;
                changeChatType(_arg1.type);
                removeTipContent();
            };
            this._downBox.visible = false;
        }
        private function renderBoxData(_arg1:String, _arg2:Array):void{
            var newPoint:* = null;
            var handler:* = null;
            var type:* = _arg1;
            var list:* = _arg2;
            this._downBox.boxWidth = 50;
            this._downBox.getBoxList = list;
            newPoint = localToGlobal(new Point(this._ChatBox.x, this._ChatBox.y));
            newPoint.y = (newPoint.y - (this._downBox.height + 10));
            if (this._downBox.parent){
                handler = function ():void{
                    _tipContent = _tip.clickToOpen(_downBox);
                    _tipContent.x = ((newPoint.x - _tip.stageOffset.x) + _ChatBox._CheckType.x);
                    _tipContent.y = ((newPoint.y - _tip.stageOffset.y) + _ChatBox._CheckType.y);
                    _downBox.visible = true;
                };
                setTimeout(handler, 10);
            };
        }
        private function removeTipContent():void{
            if (((this._tipContent) && (this._tipContent.parent))){
                this._tipContent.parent.removeChild(this._tipContent);
                this._tipContent = null;
            };
        }
        private function clearBox():void{
            if (((!((this._downBox == null))) && (this._downBox.parent))){
                this._downBox.clear();
                this._downBox.parent.removeChild(this._downBox);
                this._downBox = null;
            };
        }
        private function btnEipClick(_arg1:MouseEvent):void{
            this.renderEipBar();
        }
        private function renderEipData():void{
            this._eipDataId = {};
            var _local1:int = 1;
            while (_local1 <= 25) {
                this._eipDataId[("eip" + _local1)] = {};
                this._eipDataId[("eip" + _local1)].id = _local1;
                _local1++;
            };
        }
        private function addEipBar():void{
            this.renderEipData();
            this._eipBar = new EipBar();
            this._ChatBox.addChild(this._eipBar);
            this._eipBar.visible = false;
            this._eipBar.onSendEip = function (_arg1:Object):void{
                var _local2:XML;
                var _local3:Object;
                testLimit();
                if (_isIntoEip == true){
                    clickFile();
                    _sendText.insertSprite(_arg1.name, _sendText.textfield.caretIndex);
                    _sendText.caretIndex++;
                } else {
                    _local2 = <rtf>
									<text></text>
									<sprites>
									</sprites>
									</rtf>
                    ;
                    _local3 = {};
                    _local3.type = _chatShow;
                    _local3.xmlInfo = _local2;
                    _local2.text[0] = (("<font color=\"#ffffff\">" + ChatLang.IconOver) + "</font>");
                    renderChat(_local3, false, true);
                };
            };
        }
        private function renderEipBar():void{
            var newPoint:* = null;
            var handler:* = null;
            newPoint = localToGlobal(new Point(this._ChatBox.x, this._ChatBox.y));
            if (this._eipBar.parent){
                handler = function ():void{
                    _tipContent = _tip.clickToOpen(_eipBar);
                    _tipContent.x = ((newPoint.x - _tip.stageOffset.x) + _ChatBox._BtnEip.x);
                    _tipContent.y = ((((newPoint.y - _tip.stageOffset.y) + _ChatBox._BtnEip.y) - _eipBar.height) - 10);
                    _eipBar.visible = true;
                };
                setTimeout(handler, 10);
            };
        }
        private function scrollbarTxt():void{
            this._PostBox._PostInfo.autoSize = TextFieldAutoSize.LEFT;
            this._PostBox._PostClose.addEventListener(MouseEvent.CLICK, this.postCloseHandler);
            this._postTimer.addEventListener(TimerEvent.TIMER, this.postTimerEvent);
            this._postTimer.start();
        }
        private function clearScrollberTxt():void{
            this._PostBox._PostClose.removeEventListener(MouseEvent.CLICK, this.postCloseHandler);
            this._postTimer.removeEventListener(TimerEvent.TIMER, this.postTimerEvent);
            this._postTimer.stop();
        }
        private function postCloseHandler(_arg1:MouseEvent):void{
            this._PostBox.visible = false;
            this._isClosePost = true;
            this.showPost();
        }
        public function set getReceivePostList(_arg1:Array):void{
            if (this._teceivePostList == null){
                this._teceivePostList = [];
            };
            this._isClosePost = false;
            this._teceivePostList = _arg1;
            this._postMcNum = 0;
            this.renderPostTxt();
        }
        public function set visiblePost(_arg1:Boolean):void{
            this._isMainPostShow = _arg1;
            this.showPost();
        }
        private function postTimerEvent(_arg1:TimerEvent):void{
            if (this._postTimerNum <= 0){
                this._postTimerNum = 180;
                if (this._postMcNum == 1){
                    this._postMcNum = 0;
                } else {
                    this._postMcNum = 1;
                };
                this.showPost();
            } else {
                this._postTimerNum--;
            };
            if (((this._postTimerNum) && (((this._postTimerNum % 10) == 0)))){
                this._postShowNum++;
                this.renderPostTxt();
            };
        }
        private function renderPostTxt():void{
            var _local5:int;
            if ((((this._teceivePostList == null)) || ((this._teceivePostList[0] == null)))){
                this._isEmptyStr = true;
                this.showPost();
                return;
            };
            if (this._teceivePostList[this._postShowNum] == null){
                this._postShowNum = 0;
            };
            var _local1:Object = this._teceivePostList[this._postShowNum];
            var _local2:RegExp = /<a/;
            var _local3:Boolean = _local2.test(_local1.html);
            var _local4:String = "";
            this._isEmptyStr = isEmptyStr(_local1.html);
            this.showPost();
            _local1.html = (("<b>" + _local1.html) + "</b>");
            if (_local3 == false){
                _local4 = _local1.html;
            } else {
                _local4 = (("<u>" + _local1.html) + "</u>");
            };
            this._PostBox._PostInfo.htmlText = _local4;
            this._PostBox._PostMiddle.width = (this._PostBox._PostInfo.width + 10);
            this._PostBox._PostRight.x = (this._PostBox._PostMiddle.width + this._PostBox._PostLeft.width);
            this._PostBox._PostClose.x = ((this._PostBox._PostMiddle.width + this._PostBox._PostLeft.width) - 5);
            this._PostBox.x = ((stage.stageWidth - this._PostBox.width) / 2);
            if (this._stageClip != null){
                _local5 = (y - this._xy[1]);
                this._PostBox.x = (((this.w - this._stageClip.x) - this._PostBox.width) / 2);
                this._PostBox.y = (this._postXY[1] - _local5);
            };
        }
        private function showPost():void{
            if (this._isClosePost){
                this._PostBox.visible = false;
                return;
            };
            if (this._isMainPostShow){
                if (((this._isEmptyStr) || ((this._postMcNum == 1)))){
                    this._PostBox.visible = false;
                } else {
                    this._PostBox.visible = true;
                };
            } else {
                this._PostBox.visible = false;
            };
        }
        public function set getPunishmentPostList(_arg1:String):void{
            if (isEmptyStr(_arg1)){
                this._PunishmentPostBox.visible = false;
            } else {
                this._PunishmentPostBox._PostInfo.autoSize = TextFieldAutoSize.LEFT;
                this._PunishmentPostBox.visible = true;
                this.renderPunishmentPostTxt(_arg1);
            };
        }
        private function renderPunishmentPostTxt(_arg1:String):void{
            var _local5:int;
            var _local2:RegExp = /<a/;
            var _local3:Boolean = _local2.test(_arg1);
            var _local4:String = "";
            _local4 = (("<b>" + _arg1) + "</b>");
            if (_local3){
                _local4 = (("<u>" + _local4) + "</u>");
            };
            this._PunishmentPostBox._PostInfo.htmlText = _local4;
            this._PunishmentPostBox._PostMiddle.width = (this._PostBox._PostInfo.width + 10);
            this._PunishmentPostBox._PostRight.x = (this._PostBox._PostMiddle.width + this._PostBox._PostLeft.width);
            this._PunishmentPostBox.x = ((stage.stageWidth - this._PostBox.width) / 2);
            if (this._stageClip != null){
                _local5 = (y - this._xy[1]);
                this._ChatBox._PunishmentPostBox.x = (((this.w - this._stageClip.x) - this._ChatBox._PunishmentPostBox.width) / 2);
                this._ChatBox._PunishmentPostBox.y = (this._punishmentPostXY[1] - _local5);
            };
        }
        public function set getTownPlaySay(_arg1:Array):void{
            var _local2:Array = chatDataChange.townChatInfo(_arg1);
            this.towmMsgFile(_local2[0]);
        }
        public function set onSendTownFile(_arg1:Function):void{
            this._onSendTownFile = _arg1;
        }
        private function towmMsgFile(_arg1:Object):void{
            var _local2:Sprite = new Sprite();
            var _local3:RichTextField = new RichTextField();
            _local3.textfield.autoSize = TextFieldAutoSize.LEFT;
            _local3.textfield.selectable = false;
            _local3.setSize(155, _local3.textfield.height);
            _local3.html = true;
            this._townFormat = new TextFormat("", 13, 16114847);
            _local3.defaultTextFormat = this._townFormat;
            _local2.addChild(_local3);
            _local3.clear();
            _local3.importXML(_arg1.xmlInfo);
            if (_local3.textfield.width >= 155){
                _local3.textfield.wordWrap = true;
                _local3.setSize(155, _local3.textfield.height);
            } else {
                _local3.setSize(_local3.textfield.width, _local3.textfield.height);
            };
            _arg1.file = _local2;
            this._onSendTownFile(_arg1);
        }
        public function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void{
            if (stage == null){
                return;
            };
            this.w = Math.max(_arg1, Math.min(_arg3, stage.stageWidth));
            this.h = Math.max(_arg2, Math.min(_arg4, stage.stageHeight));
            this._stageClip = _arg5;
            var _local6:Array = [];
            if (this._changeType == 0){
                _local6 = this._xy;
                this._ChatBox.y = Math.max((_local6[1] - _arg5.y), (Math.min(_arg4, stage.stageHeight) - (_arg2 - _local6[1])));
            };
            this._PostBox.x = (((this.w - this._stageClip.x) - this._PostBox.width) / 2);
            this._PostBox.y = this._postXY[1];
            this._PunishmentPostBox.x = (((this.w - this._stageClip.x) - this._PunishmentPostBox.width) / 2);
            this._PunishmentPostBox.y = this._punishmentPostXY[1];
        }
        public function set changePoint(_arg1:int):void{
            this._changeType = _arg1;
            this._ChatBox._Btnmax.visible = (_arg1 == 0);
            this._ChatBox._Btnmin.visible = (_arg1 == 0);
            if (_arg1 == 0){
                this._ChatBox.x = 0;
            } else {
                this._ChatBox.x = 468;
                this._ChatBox.y = 180;
                this._showChatScale = 1;
                this.changeShowChat();
            };
        }
        public function set chatVisible(_arg1:Boolean):void{
            this._ChatBox.visible = _arg1;
        }
        public function get chatVisible():Boolean{
            return (this._ChatBox.visible);
        }
        public function set visibleFunction(_arg1:int):void{
            this._PostBox.visible = false;
            this._ChatBox._BtnAll.visible = false;
            this._ChatBox._BtnWorld.visible = false;
            this._ChatBox._BtnFaction.visible = false;
            this._ChatBox._BtnActivity.visible = false;
            this._ChatBox._BtnGm.visible = false;
            this._ChatBox._Btnmax.visible = false;
            this._ChatBox._Btnmin.visible = false;
            if (_arg1 == 0){
                this._ChatBox._CheckType._Type.gotoAndStop(5);
            };
            this._typeMultiMission = _arg1;
            this._chatMc.y = 18;
            this._ChatBox._CheckType.mouseEnabled = false;
            this._ChatBox._CheckType.buttonMode = false;
            this._ChatBox._CheckType._Down.visible = false;
        }

    }
}//package 
