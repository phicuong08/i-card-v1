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
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import social_contact.*;
    import skins.*;
    import mx.filters.*;
    import flash.ui.*;
    import trade_system.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class PlayerViewMenu extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Scale;
        private var _1302963395addFriendBtn:Button;
        private var _206007144btnMask:Rect;
        private var _765878507followBtn:Button;
        private var _1901031789inviteBtn:Button;
        private var _1271196248tradeBtn:Button;
        private var _308570246whisperBtn:Button;
        private var __moduleFactoryInitialized:Boolean = false;
        public var playerName:String;
        private var moveEffect:MoveEffect;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function PlayerViewMenu(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._PlayerViewMenu_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_player_view_PlayerViewMenuWatcherSetupUtil");
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
            this.width = 84;
            this.height = 112;
            this.depth = 150;
            this.mxmlContent = [this._PlayerViewMenu_PlayViewMenuImage1_c(), this._PlayerViewMenu_Rect1_i(), this._PlayerViewMenu_Button1_c(), this._PlayerViewMenu_Button2_i(), this._PlayerViewMenu_Button3_i(), this._PlayerViewMenu_Button4_i(), this._PlayerViewMenu_Button5_i(), this._PlayerViewMenu_Button6_i()];
            this._PlayerViewMenu_Scale1_i();
            this.addEventListener("remove", this.___PlayerViewMenu_Group1_remove);
            this.addEventListener("creationComplete", this.___PlayerViewMenu_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            PlayerViewMenu._watcherSetupUtil = _arg1;
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
        public function removeSelf():void{
            TCGClient.getInstance().removeEventListener(MouseEvent.CLICK, this.clickHandler);
            TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.stateChangeHandler);
            if (PlayViewMgr.getInstance().menuWindow == this){
                PlayViewMgr.getInstance().menuWindow = null;
            };
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function group_creationCompleteHandler():void{
            TCGClient.getInstance().addEventListener(MouseEvent.CLICK, this.clickHandler);
            if (this.playerName != UserObject.name){
                TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.stateChangeHandler);
                this.enabelBtnByState(TCGClient.getInstance().customCurrentState);
            } else {
                this.inviteBtn.enabled = false;
                this.followBtn.enabled = false;
                this.tradeBtn.enabled = false;
                this.whisperBtn.enabled = false;
                this.addFriendBtn.enabled = false;
            };
            this.moveEffect = new MoveEffect(this.btnMask);
            this.moveEffect.duration = 150;
            this.moveEffect.xTo = this.btnMask.x;
        }
        private function clickHandler(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        private function stateChangeHandler(_arg1:CustomStateChangeEvent=null):void{
            this.enabelBtnByState(_arg1.newState);
        }
        private function enabelBtnByState(_arg1:String):void{
            if ((((_arg1 == "roomWindow")) || ((_arg1 == "combatStage")))){
                this.followBtn.enabled = false;
                this.followBtn.toolTip = "在房间或战场时无法使用本功能。";
            } else {
                this.followBtn.enabled = true;
                this.followBtn.toolTip = "若对方不在房间或训练中，\n则无法成功加入。";
            };
            if ((((_arg1 == "roomWindow")) || ((_arg1 == "roomsList")))){
                this.inviteBtn.enabled = true;
                this.inviteBtn.toolTip = "若对方已在房间中，\n则无法成功邀请。";
            } else {
                this.inviteBtn.enabled = false;
                this.inviteBtn.toolTip = "只当处于大厅或房间界面时，\n才能使用本功能。";
            };
        }
        protected function button_rollOverHandler(_arg1:MouseEvent):void{
            var _local2:Button = (_arg1.currentTarget as Button);
            this.playMoveMaskEffect(_local2.y);
        }
        private function playMoveMaskEffect(_arg1:Number):void{
            if (((((this.moveEffect.isPlaying) && ((this.moveEffect.yTo == _arg1)))) || (((!(this.moveEffect.isPlaying)) && ((this.btnMask.y == _arg1)))))){
                return;
            };
            this.moveEffect.yTo = _arg1;
            this.moveEffect.play();
        }
        private function playFakeRemoveEffect():void{
            var _local1:FakeFadeEffect = new FakeFadeEffect(this, 200, 1, 0);
            _local1.effectContainer.depth = depth;
            _local1.play();
        }
        private function _PlayerViewMenu_Scale1_i():Scale{
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
        private function _PlayerViewMenu_PlayViewMenuImage1_c():PlayViewMenuImage{
            var _local1:PlayViewMenuImage = new PlayViewMenuImage();
            _local1.width = 84;
            _local1.height = 132;
            _local1.filters = [this._PlayerViewMenu_DropShadowFilter1_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewMenu_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewMenu_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 2;
            _local1.y = 6;
            _local1.width = 80;
            _local1.height = 20;
            _local1.fill = this._PlayerViewMenu_LinearGradient1_c();
            _local1.initialized(this, "btnMask");
            this.btnMask = _local1;
            BindingManager.executeBindings(this, "btnMask", this.btnMask);
            return (_local1);
        }
        private function _PlayerViewMenu_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._PlayerViewMenu_GradientEntry1_c(), this._PlayerViewMenu_GradientEntry2_c(), this._PlayerViewMenu_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewMenu_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 6248005;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewMenu_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 6248005;
            _local1.alpha = 1;
            _local1.ratio = 0.5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewMenu_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 6248005;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewMenu_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.x = 2;
            _local1.y = 6;
            _local1.label = "查看信息";
            _local1.width = 80;
            _local1.height = 20;
            _local1.setStyle("skinClass", playerViewMenuBtnSkin);
            _local1.addEventListener("click", this.___PlayerViewMenu_Button1_click);
            _local1.addEventListener("rollOver", this.___PlayerViewMenu_Button1_rollOver);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___PlayerViewMenu_Button1_click(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().getDetailInfo(this.playerName);
        }
        public function ___PlayerViewMenu_Button1_rollOver(_arg1:MouseEvent):void{
            this.button_rollOverHandler(_arg1);
        }
        private function _PlayerViewMenu_Button2_i():Button{
            var _local1:Button = new Button();
            _local1.x = 2;
            _local1.y = 26;
            _local1.width = 80;
            _local1.height = 20;
            _local1.label = "邀请对战";
            _local1.setStyle("skinClass", playerViewMenuBtnSkin);
            _local1.addEventListener("click", this.__inviteBtn_click);
            _local1.addEventListener("rollOver", this.__inviteBtn_rollOver);
            _local1.id = "inviteBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.inviteBtn = _local1;
            BindingManager.executeBindings(this, "inviteBtn", this.inviteBtn);
            return (_local1);
        }
        public function __inviteBtn_click(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().inviteDuel(this.playerName);
        }
        public function __inviteBtn_rollOver(_arg1:MouseEvent):void{
            this.button_rollOverHandler(_arg1);
        }
        private function _PlayerViewMenu_Button3_i():Button{
            var _local1:Button = new Button();
            _local1.x = 2;
            _local1.y = 46;
            _local1.width = 80;
            _local1.height = 20;
            _local1.label = "跟随加入";
            _local1.setStyle("skinClass", playerViewMenuBtnSkin);
            _local1.addEventListener("click", this.__followBtn_click);
            _local1.addEventListener("rollOver", this.__followBtn_rollOver);
            _local1.id = "followBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.followBtn = _local1;
            BindingManager.executeBindings(this, "followBtn", this.followBtn);
            return (_local1);
        }
        public function __followBtn_click(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().followPlayer(this.playerName);
        }
        public function __followBtn_rollOver(_arg1:MouseEvent):void{
            this.button_rollOverHandler(_arg1);
        }
        private function _PlayerViewMenu_Button4_i():Button{
            var _local1:Button = new Button();
            _local1.x = 2;
            _local1.y = 66;
            _local1.width = 80;
            _local1.height = 20;
            _local1.label = "私聊";
            _local1.setStyle("skinClass", playerViewMenuBtnSkin);
            _local1.addEventListener("click", this.__whisperBtn_click);
            _local1.addEventListener("rollOver", this.__whisperBtn_rollOver);
            _local1.id = "whisperBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.whisperBtn = _local1;
            BindingManager.executeBindings(this, "whisperBtn", this.whisperBtn);
            return (_local1);
        }
        public function __whisperBtn_click(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().clickWhisperHandler(this.playerName);
        }
        public function __whisperBtn_rollOver(_arg1:MouseEvent):void{
            this.button_rollOverHandler(_arg1);
        }
        private function _PlayerViewMenu_Button5_i():Button{
            var _local1:Button = new Button();
            _local1.x = 2;
            _local1.y = 86;
            _local1.width = 80;
            _local1.height = 20;
            _local1.label = "交易";
            _local1.setStyle("skinClass", playerViewMenuBtnSkin);
            _local1.addEventListener("click", this.__tradeBtn_click);
            _local1.addEventListener("rollOver", this.__tradeBtn_rollOver);
            _local1.id = "tradeBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tradeBtn = _local1;
            BindingManager.executeBindings(this, "tradeBtn", this.tradeBtn);
            return (_local1);
        }
        public function __tradeBtn_click(_arg1:MouseEvent):void{
            TradeMgr.getInstance().tryStartDeal(this.playerName);
        }
        public function __tradeBtn_rollOver(_arg1:MouseEvent):void{
            this.button_rollOverHandler(_arg1);
        }
        private function _PlayerViewMenu_Button6_i():Button{
            var _local1:Button = new Button();
            _local1.x = 2;
            _local1.y = 106;
            _local1.width = 80;
            _local1.height = 20;
            _local1.label = "加为好友";
            _local1.setStyle("skinClass", playerViewMenuBtnSkin);
            _local1.addEventListener("click", this.__addFriendBtn_click);
            _local1.addEventListener("rollOver", this.__addFriendBtn_rollOver);
            _local1.id = "addFriendBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.addFriendBtn = _local1;
            BindingManager.executeBindings(this, "addFriendBtn", this.addFriendBtn);
            return (_local1);
        }
        public function __addFriendBtn_click(_arg1:MouseEvent):void{
            SocialContactMgr.getInstance().tryAddFriend(this.playerName);
        }
        public function __addFriendBtn_rollOver(_arg1:MouseEvent):void{
            this.button_rollOverHandler(_arg1);
        }
        public function ___PlayerViewMenu_Group1_remove(_arg1:FlexEvent):void{
            this.playFakeRemoveEffect();
        }
        public function ___PlayerViewMenu_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group_creationCompleteHandler();
        }
        private function _PlayerViewMenu_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
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
        public function get addFriendBtn():Button{
            return (this._1302963395addFriendBtn);
        }
        public function set addFriendBtn(_arg1:Button):void{
            var _local2:Object = this._1302963395addFriendBtn;
            if (_local2 !== _arg1){
                this._1302963395addFriendBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addFriendBtn", _local2, _arg1));
                };
            };
        }
        public function get btnMask():Rect{
            return (this._206007144btnMask);
        }
        public function set btnMask(_arg1:Rect):void{
            var _local2:Object = this._206007144btnMask;
            if (_local2 !== _arg1){
                this._206007144btnMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnMask", _local2, _arg1));
                };
            };
        }
        public function get followBtn():Button{
            return (this._765878507followBtn);
        }
        public function set followBtn(_arg1:Button):void{
            var _local2:Object = this._765878507followBtn;
            if (_local2 !== _arg1){
                this._765878507followBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "followBtn", _local2, _arg1));
                };
            };
        }
        public function get inviteBtn():Button{
            return (this._1901031789inviteBtn);
        }
        public function set inviteBtn(_arg1:Button):void{
            var _local2:Object = this._1901031789inviteBtn;
            if (_local2 !== _arg1){
                this._1901031789inviteBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteBtn", _local2, _arg1));
                };
            };
        }
        public function get tradeBtn():Button{
            return (this._1271196248tradeBtn);
        }
        public function set tradeBtn(_arg1:Button):void{
            var _local2:Object = this._1271196248tradeBtn;
            if (_local2 !== _arg1){
                this._1271196248tradeBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tradeBtn", _local2, _arg1));
                };
            };
        }
        public function get whisperBtn():Button{
            return (this._308570246whisperBtn);
        }
        public function set whisperBtn(_arg1:Button):void{
            var _local2:Object = this._308570246whisperBtn;
            if (_local2 !== _arg1){
                this._308570246whisperBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "whisperBtn", _local2, _arg1));
                };
            };
        }

    }
}//package player_view 
