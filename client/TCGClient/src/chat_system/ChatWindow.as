//Created by Action Script Viewer - http://www.buraks.com/asv
package chat_system {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import spark.events.*;
    import mx.binding.*;
    import normal_window.*;
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flashx.textLayout.elements.*;
    import mouse_keyboard_mgr.*;
    import flash.utils.*;
    import player_view.*;
    import flash.accessibility.*;
    import skins.*;
    import mx.filters.*;
    import flash.ui.*;
    import flashx.textLayout.conversion.*;
    import tool.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class ChatWindow extends SuperDragGroup implements IBindingClient {
		use namespace mx_internal;
        private static const minWindowWidth:Number = 250;
        private static const defaultWindowWidth:Number = 260;
        private static const maxWindowWidth:Number = 1000;
        private static const minWindowHeight:Number = 200;
        private static const defaultWindowHeight:Number = 200;
        private static const maxWindowHeight:Number = 700;

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var _632110590bottomFrame:ChatWindowBottomFrame;
        private var _274136272channelText:RichEditableText;
        private var _94623771chats:ChatWindowTextArea;
        private var _1267520715removeEffect:Fade;
        private var _26545833searchPlayer:Button;
        private var _1474385094txtInput:TextInput;
        private var __moduleFactoryInitialized:Boolean = false;
        private var channel:String = "world";
        private var adjustStartWindowBottomPos:Number;
        private var adjustStartWindowRightPos:Number;
        private var isAdjusting:Boolean = false;
        private var isDraging:Boolean = false;
        private var _embed_mxml_source_chatWindowUI________png_1929163808:Class;
        private var _embed_mxml_source_chatWindowUI__________png_1264165860:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function ChatWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_chatWindowUI________png_1929163808 = ChatWindow__embed_mxml_source_chatWindowUI________png_1929163808;
            this._embed_mxml_source_chatWindowUI__________png_1264165860 = ChatWindow__embed_mxml_source_chatWindowUI__________png_1264165860;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._ChatWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_chat_system_ChatWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (ChatWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.depth = 150;
            this.layout = this._ChatWindow_BasicLayout1_c();
            this.mxmlContent = [this._ChatWindow_Group1_c(), this._ChatWindow_ClickScaleButton1_c(), this._ChatWindow_ChatWindowBottomFrame1_i(), this._ChatWindow_SmoothBitmapImage1_c(), this._ChatWindow_ChatWindowTextArea1_i(), this._ChatWindow_RichEditableText1_i(), this._ChatWindow_TextInput1_i(), this._ChatWindow_Button1_c(), this._ChatWindow_Button2_c(), this._ChatWindow_Button3_c(), this._ChatWindow_Button4_i()];
            this._ChatWindow_Fade1_i();
            this._ChatWindow_Fade2_i();
            this.addEventListener("initialize", this.___ChatWindow_SuperDragGroup1_initialize);
            this.addEventListener("creationComplete", this.___ChatWindow_SuperDragGroup1_creationComplete);
            this.addEventListener("addedToStage", this.___ChatWindow_SuperDragGroup1_addedToStage);
            this.addEventListener("removedFromStage", this.___ChatWindow_SuperDragGroup1_removedFromStage);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            ChatWindow._watcherSetupUtil = _arg1;
        }

        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            super.moduleFactory = _arg1;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
        }
        override public function initialize():void{
            super.initialize();
        }
        public function moveOut(_arg1:Boolean):void{
            if (_arg1){
                CommonUtil.addTimerLaterCall(1000, this.addEffect.play);
            } else {
                this.removeEffect.play();
            };
        }
        public function resetWindowXYPos():void{
            var _local1:Rectangle;
            _local1 = BasicOperationBar.getInstance().getRect(parent);
            x = (parent.width - width);
            y = (_local1.y - height);
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.reset();
            ChatWindowMgr.getInstance().addSystemContent("欢迎来到乱战世界！");
            ChatWindowMgr.getInstance().addSystemContent(["游戏论坛地址：", {
                content:"http://lz.entplay.com/bbs/",
                type:"hrefLink",
                color:0xF57300
            }]);
            ChatWindowMgr.getInstance().addSystemContent("QQ群：83912379。乱战还在开发中，非常需要您的支持和帮助！");
            ChatWindowMgr.getInstance().addSystemContent("该版本发布时间：2012.3.23 9:30，更新内容见游戏论坛。");
        }
        protected function reset():void{
            this.chats.reset();
            this.txtInput.text = "";
            this.setChatChannel("world");
            height = defaultWindowHeight;
            width = defaultWindowWidth;
            this.bottomFrame.size = [defaultWindowWidth, 41];
        }
        protected function resizeBtn_mouseDownHandler(_arg1:MouseEvent):void{
            this.isAdjusting = true;
            TCGClient.getInstance().addEventListener(MouseEvent.MOUSE_MOVE, this.changeWindowSize);
            TCGClient.getInstance().addEventListener(MouseEvent.MOUSE_UP, this.finishAdjust);
            this.adjustStartWindowBottomPos = (y + height);
            this.adjustStartWindowRightPos = (x + width);
        }
        private function changeWindowSize(_arg1:MouseEvent):void{
            var _local2:Number = parent.mouseX;
            var _local3:Number = parent.mouseY;
            var _local4:Boolean;
            if (!(((((height <= minWindowHeight)) && ((_local3 > y)))) || ((((height >= maxWindowHeight)) && ((_local3 < y)))))){
                if (y != _local3){
                    if ((this.adjustStartWindowBottomPos - _local3) < minWindowHeight){
                        _local3 = (this.adjustStartWindowBottomPos - minWindowHeight);
                    } else {
                        if ((this.adjustStartWindowBottomPos - _local3) > maxWindowHeight){
                            _local3 = (this.adjustStartWindowBottomPos - maxWindowHeight);
                        };
                    };
                    y = _local3;
                    height = (this.adjustStartWindowBottomPos - y);
                    _local4 = true;
                };
            };
            if (!(((((width <= minWindowWidth)) && ((_local2 > x)))) || ((((width >= maxWindowWidth)) && ((_local2 < x)))))){
                if (x != _local2){
                    if ((this.adjustStartWindowRightPos - _local2) < minWindowWidth){
                        _local2 = (this.adjustStartWindowRightPos - minWindowWidth);
                    } else {
                        if ((this.adjustStartWindowRightPos - _local2) > maxWindowWidth){
                            _local2 = (this.adjustStartWindowRightPos - maxWindowWidth);
                        };
                    };
                    x = _local2;
                    width = (this.adjustStartWindowRightPos - x);
                    _local4 = true;
                };
            };
            if (_local4){
                this.bottomFrame.size = [width, 41];
            };
        }
        protected function finishAdjust(_arg1:MouseEvent):void{
            this.isAdjusting = false;
            MouseMgr.getInstance().clearCursor("drag");
            TCGClient.getInstance().removeEventListener(MouseEvent.MOUSE_MOVE, this.changeWindowSize);
            TCGClient.getInstance().removeEventListener(MouseEvent.MOUSE_UP, this.finishAdjust);
        }
        protected function beginDrag():void{
            this.startDrag();
            this.isDraging = true;
        }
        protected function finishDrag():void{
            this.isDraging = false;
            this.stopDrag();
        }
        protected function chats_mouseDownHandler(_arg1:MouseEvent):void{
            var stageMouseUpHandler:* = null;
            var event:* = _arg1;
            stageMouseUpHandler = function ():void{
                chats.allowUpdateScollerPos = true;
                stage.removeEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
            };
            if (!this.chats.scroller.verticalScrollBar.contains((event.target as DisplayObject))){
                this.beginDrag();
            };
            this.chats.allowUpdateScollerPos = false;
            stage.addEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
        }
        protected function group1_addedToStageHandler(_arg1:Event):void{
            KeyboardMgr.getInstance().addEventListener(KeyboardEvent.KEY_UP, this.stageKeyUpHandler);
        }
        protected function group1_removedFromStageHandler(_arg1:Event):void{
            KeyboardMgr.getInstance().removeEventListener(KeyboardEvent.KEY_UP, this.stageKeyUpHandler);
        }
        private function stageKeyUpHandler(_arg1:KeyboardEvent):void{
            if (((visible) && ((_arg1.keyCode == 13)))){
                if (((stage.focus) && ((((stage.focus is RichEditableText)) || (this.txtInput.contains(stage.focus)))))){
                    return;
                };
                this.txtInput.setFocus();
                this.txtInput.selectRange(this.txtInput.text.length, this.txtInput.text.length);
            };
        }
        public function setChatChannel(_arg1:String, _arg2=null):void{
            this.channel = _arg1;
            switch (_arg1){
                case "world":
                    this.channelText.text = "世界：";
                    break;
                case "room":
                    this.channelText.text = "房间：";
                    break;
                case "whisper":
                    this.channelText.text = (("告诉" + _arg2) + "：");
                    break;
            };
            this.txtInput.setFocus();
            this.txtInput.selectRange(this.txtInput.text.length, this.txtInput.text.length);
        }
        protected function txtInput_keyDownHandler(_arg1:KeyboardEvent):void{
            if (_arg1.charCode == 13){
                if (ChatWindowMgr.getInstance().sendChatMessage(this.channel, this.txtInput.text)){
                    this.txtInput.text = "";
                };
            };
        }
        public function addParagraphElementWithChannel(_arg1:ParagraphElement, _arg2:String):void{
            this.chats.addParagraphElementWithChannel(_arg1, _arg2);
        }
        private function _ChatWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 500;
            _local1.addEventListener("effectStart", this.__addEffect_effectStart);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectStart(_arg1:EffectEvent):void{
            this.resetWindowXYPos();
        }
        private function _ChatWindow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 0;
            _local1.duration = 500;
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            visible = false;
            this.reset();
        }
        private function _ChatWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ChatWindow_Group1_c():Group{
            var _local1:Group = new Group();
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.left = 0;
            _local1.right = 0;
            _local1.mxmlContent = [this._ChatWindow_Rect1_c()];
            _local1.addEventListener("mouseDown", this.___ChatWindow_Group1_mouseDown);
            _local1.addEventListener("mouseUp", this.___ChatWindow_Group1_mouseUp);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ChatWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.left = 0;
            _local1.right = 0;
            _local1.fill = this._ChatWindow_LinearGradient1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ChatWindow_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.rotation = 90;
            _local1.entries = [this._ChatWindow_GradientEntry1_c(), this._ChatWindow_GradientEntry2_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ChatWindow_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0;
            _local1.alpha = 0.2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ChatWindow_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0;
            _local1.alpha = 0.4;
            _local1.ratio = 0.2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___ChatWindow_Group1_mouseDown(_arg1:MouseEvent):void{
            this.beginDrag();
        }
        public function ___ChatWindow_Group1_mouseUp(_arg1:MouseEvent):void{
            this.finishDrag();
        }
        private function _ChatWindow_ClickScaleButton1_c():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.buttonImage = this._embed_mxml_source_chatWindowUI__________png_1264165860;
            _local1.x = 0;
            _local1.y = 0;
            _local1.toolTip = "点击以拉伸窗口";
            _local1.addEventListener("mouseOver", this.___ChatWindow_ClickScaleButton1_mouseOver);
            _local1.addEventListener("mouseOut", this.___ChatWindow_ClickScaleButton1_mouseOut);
            _local1.addEventListener("mouseDown", this.___ChatWindow_ClickScaleButton1_mouseDown);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___ChatWindow_ClickScaleButton1_mouseOver(_arg1:MouseEvent):void{
            if (!this.isAdjusting){
                MouseMgr.getInstance().setCursor("drag");
            };
        }
        public function ___ChatWindow_ClickScaleButton1_mouseOut(_arg1:MouseEvent):void{
            if (!this.isAdjusting){
                MouseMgr.getInstance().clearCursor("drag");
            };
        }
        public function ___ChatWindow_ClickScaleButton1_mouseDown(_arg1:MouseEvent):void{
            this.resizeBtn_mouseDownHandler(_arg1);
        }
        private function _ChatWindow_ChatWindowBottomFrame1_i():ChatWindowBottomFrame{
            var _local1:ChatWindowBottomFrame = new ChatWindowBottomFrame();
            _local1.bottom = 0;
            _local1.id = "bottomFrame";
            if (!_local1.document){
                _local1.document = this;
            };
            this.bottomFrame = _local1;
            BindingManager.executeBindings(this, "bottomFrame", this.bottomFrame);
            return (_local1);
        }
        private function _ChatWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_chatWindowUI________png_1929163808;
            _local1.bottom = 26;
            _local1.left = 0;
            _local1.right = 0;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ChatWindow_ChatWindowTextArea1_i():ChatWindowTextArea{
            var _local1:ChatWindowTextArea = new ChatWindowTextArea();
            _local1.x = 7;
            _local1.y = 10;
            _local1.editable = false;
            _local1.selectable = false;
            _local1.setStyle("verticalScrollPolicy", "on");
            _local1.setStyle("skinClass", textAreaSkin);
            _local1.addEventListener("mouseUp", this.__chats_mouseUp);
            _local1.addEventListener("mouseDown", this.__chats_mouseDown);
            _local1.id = "chats";
            if (!_local1.document){
                _local1.document = this;
            };
            this.chats = _local1;
            BindingManager.executeBindings(this, "chats", this.chats);
            return (_local1);
        }
        public function __chats_mouseUp(_arg1:MouseEvent):void{
            this.finishDrag();
        }
        public function __chats_mouseDown(_arg1:MouseEvent):void{
            this.chats_mouseDownHandler(_arg1);
        }
        private function _ChatWindow_RichEditableText1_i():RichEditableText{
            var _local1:RichEditableText = new RichEditableText();
            _local1.editable = false;
            _local1.text = "世界：";
            _local1.left = 19;
            _local1.bottom = 8;
            _local1.height = 15;
            _local1.setStyle("color", 0xFFFFFF);
            _local1.id = "channelText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.channelText = _local1;
            BindingManager.executeBindings(this, "channelText", this.channelText);
            return (_local1);
        }
        private function _ChatWindow_TextInput1_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.height = 15;
            _local1.maxChars = 150;
            _local1.setStyle("color", 0xFFFFFF);
            _local1.setStyle("skinClass", textInputSkin);
            _local1.addEventListener("keyDown", this.__txtInput_keyDown);
            _local1.addEventListener("change", this.__txtInput_change);
            _local1.id = "txtInput";
            if (!_local1.document){
                _local1.document = this;
            };
            this.txtInput = _local1;
            BindingManager.executeBindings(this, "txtInput", this.txtInput);
            return (_local1);
        }
        public function __txtInput_keyDown(_arg1:KeyboardEvent):void{
            this.txtInput_keyDownHandler(_arg1);
        }
        public function __txtInput_change(_arg1:TextOperationEvent):void{
            ChatWindowMgr.getInstance().userInputTextChangeHandler(this.txtInput);
        }
        private function _ChatWindow_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.left = 30;
            _local1.bottom = 27;
            _local1.label = "世界";
            _local1.toolTip = "将发言区域切换为世界(/1)";
            _local1.setStyle("skinClass", chatWindowChannelButtonSkin);
            _local1.addEventListener("click", this.___ChatWindow_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___ChatWindow_Button1_click(_arg1:MouseEvent):void{
            this.setChatChannel("world");
            this.chats.changeDisplayMode("all");
        }
        private function _ChatWindow_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.left = 71;
            _local1.bottom = 27;
            _local1.label = "房间";
            _local1.toolTip = "将发言区域切换为房间(/2)";
            _local1.setStyle("skinClass", chatWindowChannelButtonSkin);
            _local1.addEventListener("click", this.___ChatWindow_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___ChatWindow_Button2_click(_arg1:MouseEvent):void{
            this.setChatChannel("room");
            this.chats.changeDisplayMode("room");
        }
        private function _ChatWindow_Button3_c():Button{
            var _local1:Button = new Button();
            _local1.left = 112;
            _local1.bottom = 27;
            _local1.label = "私聊";
            _local1.toolTip = "过滤聊天内容，使其只显示私聊信息。(/w 玩家名)";
            _local1.setStyle("skinClass", chatWindowChannelButtonSkin);
            _local1.addEventListener("click", this.___ChatWindow_Button3_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___ChatWindow_Button3_click(_arg1:MouseEvent):void{
            this.chats.changeDisplayMode("whisper");
        }
        private function _ChatWindow_Button4_i():Button{
            var _local1:Button = new Button();
            _local1.right = 30;
            _local1.bottom = 27;
            _local1.label = "查找";
            _local1.setStyle("skinClass", chatWindowChannelButtonSkin);
            _local1.addEventListener("click", this.__searchPlayer_click);
            _local1.id = "searchPlayer";
            if (!_local1.document){
                _local1.document = this;
            };
            this.searchPlayer = _local1;
            BindingManager.executeBindings(this, "searchPlayer", this.searchPlayer);
            return (_local1);
        }
        public function __searchPlayer_click(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().showSearchPlayerWindow();
        }
        public function ___ChatWindow_SuperDragGroup1_initialize(_arg1:FlexEvent):void{
            visible = false;
        }
        public function ___ChatWindow_SuperDragGroup1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function ___ChatWindow_SuperDragGroup1_addedToStage(_arg1:Event):void{
            this.group1_addedToStageHandler(_arg1);
        }
        public function ___ChatWindow_SuperDragGroup1_removedFromStage(_arg1:Event):void{
            this.group1_removedFromStageHandler(_arg1);
        }
        private function _ChatWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (defaultWindowWidth);
            }, null, "this.width");
            result[1] = new Binding(this, function ():Number{
                return (defaultWindowHeight);
            }, null, "this.height");
            result[2] = new Binding(this, function ():Object{
                return (this);
            }, null, "addEffect.target");
            result[3] = new Binding(this, function ():Object{
                return (this);
            }, null, "removeEffect.target");
            result[4] = new Binding(this, function ():Array{
                var _local1:* = [defaultWindowWidth, 41];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "bottomFrame.size");
            result[5] = new Binding(this, function ():Number{
                return ((width - 10));
            }, null, "chats.width");
            result[6] = new Binding(this, function ():Number{
                return ((height - 63));
            }, null, "chats.height");
            result[7] = new Binding(this, function ():Number{
                return (((width - channelText.width) - 34));
            }, null, "txtInput.width");
            result[8] = new Binding(this, function ():Number{
                return ((21 + channelText.width));
            }, null, "txtInput.x");
            result[9] = new Binding(this, function ():Number{
                return ((height - 24));
            }, null, "txtInput.y");
            return (result);
        }
        public function get addEffect():Fade{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Fade):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get bottomFrame():ChatWindowBottomFrame{
            return (this._632110590bottomFrame);
        }
        public function set bottomFrame(_arg1:ChatWindowBottomFrame):void{
            var _local2:Object = this._632110590bottomFrame;
            if (_local2 !== _arg1){
                this._632110590bottomFrame = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottomFrame", _local2, _arg1));
                };
            };
        }
        public function get channelText():RichEditableText{
            return (this._274136272channelText);
        }
        public function set channelText(_arg1:RichEditableText):void{
            var _local2:Object = this._274136272channelText;
            if (_local2 !== _arg1){
                this._274136272channelText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "channelText", _local2, _arg1));
                };
            };
        }
        public function get chats():ChatWindowTextArea{
            return (this._94623771chats);
        }
        public function set chats(_arg1:ChatWindowTextArea):void{
            var _local2:Object = this._94623771chats;
            if (_local2 !== _arg1){
                this._94623771chats = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chats", _local2, _arg1));
                };
            };
        }
        public function get removeEffect():Fade{
            return (this._1267520715removeEffect);
        }
        public function set removeEffect(_arg1:Fade):void{
            var _local2:Object = this._1267520715removeEffect;
            if (_local2 !== _arg1){
                this._1267520715removeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeEffect", _local2, _arg1));
                };
            };
        }
        public function get searchPlayer():Button{
            return (this._26545833searchPlayer);
        }
        public function set searchPlayer(_arg1:Button):void{
            var _local2:Object = this._26545833searchPlayer;
            if (_local2 !== _arg1){
                this._26545833searchPlayer = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "searchPlayer", _local2, _arg1));
                };
            };
        }
        public function get txtInput():TextInput{
            return (this._1474385094txtInput);
        }
        public function set txtInput(_arg1:TextInput):void{
            var _local2:Object = this._1474385094txtInput;
            if (_local2 !== _arg1){
                this._1474385094txtInput = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtInput", _local2, _arg1));
                };
            };
        }

    }
}//package chat_system 
