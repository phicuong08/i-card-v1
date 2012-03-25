//Created by Action Script Viewer - http://www.buraks.com/asv
package player_view {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import normal_window.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.filters.*;
    import custom_effect.*;
    import flashx.textLayout.elements.*;
    import mouse_keyboard_mgr.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import flashx.textLayout.events.*;
    import mx.filters.*;
    import flash.ui.*;
    import tool.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class InviteWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _InviteWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _InviteWindow_CommonOuterFrame1:CommonOuterFrame;
        private var _413245038addEffect:Scale;
        private var _476548482cancelBtn:BlueSmallButton;
        private var _842377084confirmBtn:BlueSmallButton;
        private var _3079825desc:RichEditableText;
        private var _2135756891titleText:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var info:Object;
        private var creationHasComplete:Boolean = false;
        private var timer:Timer;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function InviteWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.timer = new Timer(20000, 1);
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._InviteWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_player_view_InviteWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.x = 364;
            this.y = 301;
            this.width = 553;
            this.height = 197;
            this.transformX = 276.5;
            this.transformY = 98.5;
            this.depth = 10;
            this.mxmlContent = [this._InviteWindow_CommonOuterFrame1_i(), this._InviteWindow_CommonMiddleFrame1_i(), this._InviteWindow_Label1_i(), this._InviteWindow_RichEditableText1_i(), this._InviteWindow_BlueSmallButton1_i(), this._InviteWindow_BlueSmallButton2_i()];
            this._InviteWindow_Scale1_i();
            this.addEventListener("remove", this.___InviteWindow_Group1_remove);
            this.addEventListener("creationComplete", this.___InviteWindow_Group1_creationComplete);
            this.addEventListener("mouseDown", this.___InviteWindow_Group1_mouseDown);
            this.addEventListener("mouseUp", this.___InviteWindow_Group1_mouseUp);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            InviteWindow._watcherSetupUtil = _arg1;
        }

        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            var factory:* = _arg1;
            super.moduleFactory = factory;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
            if (!this.styleDeclaration){
                this.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
            };
            this.styleDeclaration.defaultFactory = function ():void{
                this.color = 16178309;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.timer.addEventListener(TimerEvent.TIMER, this.removeSelf);
            this.timer.start();
            TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.removeSelf);
            this.tryToDisplay();
        }
        public function setInfo(_arg1:Object):void{
            this.info = _arg1;
            this.tryToDisplay();
        }
        private function tryToDisplay():void{
            var _local1:TextFlow;
            var _local2:ParagraphElement;
            var _local3:LinkElement;
            var _local4:SpanElement;
            var _local5:SpanElement;
            var _local6:SpanElement;
            if (((this.info) && (this.creationHasComplete))){
                _local1 = new TextFlow();
                _local2 = new ParagraphElement();
                _local3 = new LinkElement();
                _local3.id = this.info.inviter_name;
                _local3.addEventListener(FlowElementMouseEvent.CLICK, this.clickPlayerNameHandler);
                _local4 = new SpanElement();
                _local4.color = 0xFF00;
                _local4.text = (("“" + this.info.inviter_name) + "”");
                _local4.textDecoration = "none";
                _local3.addChild(_local4);
                _local2.addChild(_local3);
                _local5 = new SpanElement();
                _local5.text = "邀请你加入房间\n";
                _local2.addChild(_local5);
                _local6 = new SpanElement();
                _local6.color = 0xEDAD00;
                _local6.text = (("【" + RoomUtil.getRoomNameByInfo(this.info)) + "】");
                _local2.addChild(_local6);
                _local1.addChild(_local2);
                this.desc.textFlow = _local1;
            };
        }
        private function clickPlayerNameHandler(_arg1:FlowElementMouseEvent):void{
            var _local2:LinkElement = (_arg1.flowElement as LinkElement);
            PlayViewMgr.getInstance().showOpMenu(_local2.id);
        }
        public function removeSelf(_arg1=null):void{
            var _local2:* = parent;
            if (_local2){
                _local2.removeElement(this);
            };
        }
        private function acceptInviteHandler():void{
            if (!RoomUtil.isCompetitionModeRoom(this.info.room_type)){
                LuaAgent.getInstance().run((((("u.hall_room_mgr:enter_room(\"" + this.info.room_type) + "\", ") + this.info.room_number) + ", false)"));
            } else {
                LuaAgent.getInstance().run((((("u.competition_mgr:enter_room(" + this.info.group_index) + " , ") + this.info.room_number) + ")"));
            };
            this.removeSelf();
        }
        protected function group1_removeHandler(_arg1:FlexEvent):void{
            this.timer.removeEventListener(TimerEvent.TIMER, this.removeSelf);
            this.timer.stop();
            TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.removeSelf);
            var _local2:FakeFadeEffect = new FakeFadeEffect(this, 300, 1, 0);
            _local2.effectContainer.depth = depth;
            _local2.play();
        }
        private function _InviteWindow_Scale1_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 0.1;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 0.1;
            _local1.scaleYTo = 1;
            _local1.duration = 200;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _InviteWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.filters = [this._InviteWindow_DropShadowFilter1_c()];
            _local1.id = "_InviteWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._InviteWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_InviteWindow_CommonOuterFrame1", this._InviteWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _InviteWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _InviteWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 23;
            _local1.y = 44;
            _local1.alpha = 0.7;
            _local1.id = "_InviteWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._InviteWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_InviteWindow_CommonMiddleFrame1", this._InviteWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _InviteWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 26;
            _local1.y = 19;
            _local1.width = 503;
            _local1.text = "邀请信息：";
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("fontSize", 18);
            _local1.id = "titleText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.titleText = _local1;
            BindingManager.executeBindings(this, "titleText", this.titleText);
            return (_local1);
        }
        private function _InviteWindow_RichEditableText1_i():RichEditableText{
            var _local1:RichEditableText = new RichEditableText();
            _local1.x = 29;
            _local1.y = 48;
            _local1.height = 96;
            _local1.width = 497;
            _local1.selectable = false;
            _local1.editable = false;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 16);
            _local1.id = "desc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.desc = _local1;
            BindingManager.executeBindings(this, "desc", this.desc);
            return (_local1);
        }
        private function _InviteWindow_BlueSmallButton1_i():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.x = 414;
            _local1.y = 141;
            _local1.label = "接受";
            _local1.addEventListener("click", this.__confirmBtn_click);
            _local1.id = "confirmBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.confirmBtn = _local1;
            BindingManager.executeBindings(this, "confirmBtn", this.confirmBtn);
            return (_local1);
        }
        public function __confirmBtn_click(_arg1:MouseEvent):void{
            this.acceptInviteHandler();
        }
        private function _InviteWindow_BlueSmallButton2_i():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.x = 472;
            _local1.y = 141;
            _local1.label = "拒绝";
            _local1.addEventListener("click", this.__cancelBtn_click);
            _local1.id = "cancelBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cancelBtn = _local1;
            BindingManager.executeBindings(this, "cancelBtn", this.cancelBtn);
            return (_local1);
        }
        public function __cancelBtn_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        public function ___InviteWindow_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        public function ___InviteWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function ___InviteWindow_Group1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
            MouseMgr.getInstance().setCursor("drag");
        }
        public function ___InviteWindow_Group1_mouseUp(_arg1:MouseEvent):void{
            this.stopDrag();
            MouseMgr.getInstance().clearCursor("drag");
        }
        private function _InviteWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [553, 197];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_InviteWindow_CommonOuterFrame1.size");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [507, 125];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_InviteWindow_CommonMiddleFrame1.size");
            return (result);
        }
        public function get addEffect():Scale{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Scale):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get cancelBtn():BlueSmallButton{
            return (this._476548482cancelBtn);
        }
        public function set cancelBtn(_arg1:BlueSmallButton):void{
            var _local2:Object = this._476548482cancelBtn;
            if (_local2 !== _arg1){
                this._476548482cancelBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelBtn", _local2, _arg1));
                };
            };
        }
        public function get confirmBtn():BlueSmallButton{
            return (this._842377084confirmBtn);
        }
        public function set confirmBtn(_arg1:BlueSmallButton):void{
            var _local2:Object = this._842377084confirmBtn;
            if (_local2 !== _arg1){
                this._842377084confirmBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirmBtn", _local2, _arg1));
                };
            };
        }
        public function get desc():RichEditableText{
            return (this._3079825desc);
        }
        public function set desc(_arg1:RichEditableText):void{
            var _local2:Object = this._3079825desc;
            if (_local2 !== _arg1){
                this._3079825desc = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "desc", _local2, _arg1));
                };
            };
        }
        public function get titleText():Label{
            return (this._2135756891titleText);
        }
        public function set titleText(_arg1:Label):void{
            var _local2:Object = this._2135756891titleText;
            if (_local2 !== _arg1){
                this._2135756891titleText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleText", _local2, _arg1));
                };
            };
        }

    }
}//package player_view 
