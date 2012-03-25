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
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.filters.*;
    import custom_effect.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import social_contact.*;
    import skins.*;
    import mx.filters.*;
    import flash.ui.*;
    import trade_system.*;
    import tool.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class PlayerViewDetailInfoWindow extends AutoDepthGroup implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var _1302963395addFriendBtn:Button;
        private var _765878507followBtn:Button;
        private var _839690148followBtnTooltipMask:EasyMaskWindow;
        private var _1901031789inviteBtn:Button;
        private var _311893764inviteBtnTooltipMask:EasyMaskWindow;
        private var _1872068927playerEsP:Label;
        private var _2095481953playerHead:MyImage;
        private var _539145507playerLevel:Label;
        private var _2095657228playerName:Label;
        private var _2095789916playerRoom:Label;
        private var _546037296playerState:Label;
        private var _2095933045playerWinP:Label;
        private var _201757112pvpLevelInfo:Label;
        private var _822204373pvpWinLoseInfo:Label;
        private var _1271196248tradeBtn:Button;
        private var _308570246whisperBtn:Button;
        private var __moduleFactoryInitialized:Boolean = false;
        private var info:Object;
        private var creationHasComplete:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function PlayerViewDetailInfoWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._PlayerViewDetailInfoWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_player_view_PlayerViewDetailInfoWindowWatcherSetupUtil");
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
            this.width = 380;
            this.height = 339;
            this.mxmlContent = [this._PlayerViewDetailInfoWindow_CommonOuterFrame1_c(), this._PlayerViewDetailInfoWindow_CommonMiddleFrame1_c(), this._PlayerViewDetailInfoWindow_GrayLine1_c(), this._PlayerViewDetailInfoWindow_GrayLine2_c(), this._PlayerViewDetailInfoWindow_GrayLine3_c(), this._PlayerViewDetailInfoWindow_GrayLine4_c(), this._PlayerViewDetailInfoWindow_GrayLine5_c(), this._PlayerViewDetailInfoWindow_GrayLine6_c(), this._PlayerViewDetailInfoWindow_GrayLine7_c(), this._PlayerViewDetailInfoWindow_GrayLine8_c(), this._PlayerViewDetailInfoWindow_MyImage1_i(), this._PlayerViewDetailInfoWindow_Button1_i(), this._PlayerViewDetailInfoWindow_Button2_i(), this._PlayerViewDetailInfoWindow_Button3_i(), this._PlayerViewDetailInfoWindow_Button4_i(), this._PlayerViewDetailInfoWindow_EasyMaskWindow1_i(), this._PlayerViewDetailInfoWindow_Button5_i(), this._PlayerViewDetailInfoWindow_EasyMaskWindow2_i(), this._PlayerViewDetailInfoWindow_CloseSignBtn1_c(), this._PlayerViewDetailInfoWindow_Label1_c(), this._PlayerViewDetailInfoWindow_Label2_i(), this._PlayerViewDetailInfoWindow_Label3_c(), this._PlayerViewDetailInfoWindow_Label4_i(), this._PlayerViewDetailInfoWindow_Label5_c(), this._PlayerViewDetailInfoWindow_Label6_i(), this._PlayerViewDetailInfoWindow_Label7_c(), this._PlayerViewDetailInfoWindow_Label8_i(), this._PlayerViewDetailInfoWindow_Label9_i(), this._PlayerViewDetailInfoWindow_Label10_i(), this._PlayerViewDetailInfoWindow_Label11_i(), this._PlayerViewDetailInfoWindow_Label12_i()];
            this._PlayerViewDetailInfoWindow_Fade1_i();
            this.addEventListener("creationComplete", this.___PlayerViewDetailInfoWindow_AutoDepthGroup1_creationComplete);
            this.addEventListener("remove", this.___PlayerViewDetailInfoWindow_AutoDepthGroup1_remove);
            this.addEventListener("mouseDown", this.___PlayerViewDetailInfoWindow_AutoDepthGroup1_mouseDown);
            this.addEventListener("mouseUp", this.___PlayerViewDetailInfoWindow_AutoDepthGroup1_mouseUp);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            PlayerViewDetailInfoWindow._watcherSetupUtil = _arg1;
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
                this.fontSize = 14;
                this.color = 12039317;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_creationCompleteHandler():void{
            this.creationHasComplete = true;
            this.tryToDisplay();
        }
        private function stateChangeHandler(_arg1:CustomStateChangeEvent=null):void{
            this.enabelBtnByState(_arg1.newState);
        }
        private function enabelBtnByState(_arg1:String):void{
            if ((((_arg1 == "roomWindow")) || ((_arg1 == "combatStage")))){
                this.followBtn.enabled = false;
                this.followBtnTooltipMask.visible = true;
            } else {
                this.followBtn.enabled = true;
                this.followBtn.toolTip = "若对方不在房间或训练中，\n则无法成功加入。";
                this.followBtnTooltipMask.visible = false;
            };
            if ((((_arg1 == "roomWindow")) || ((_arg1 == "roomsList")))){
                this.inviteBtn.enabled = true;
                this.inviteBtn.toolTip = "若对方已在房间中，\n则无法成功邀请。";
                this.inviteBtnTooltipMask.visible = false;
            } else {
                this.inviteBtn.enabled = false;
                this.inviteBtnTooltipMask.visible = true;
            };
        }
        public function setInfo(_arg1:Object):void{
            this.info = _arg1;
            this.tryToDisplay();
        }
        private function tryToDisplay():void{
            var _local1:Object;
            var _local2:Object;
            if (((this.info) && (this.creationHasComplete))){
                if (this.info.name != UserObject.name){
                    TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.stateChangeHandler);
                    this.enabelBtnByState(TCGClient.getInstance().customCurrentState);
                } else {
                    this.inviteBtn.enabled = false;
                    this.followBtn.enabled = false;
                    this.tradeBtn.enabled = false;
                    this.whisperBtn.enabled = false;
                    this.addFriendBtn.enabled = false;
                    UserPropertyChangeEventDispatcher.getInstance().addEventListener(UserPropertyChangeEventDispatcher.WIN_LOSE_ESCAPE_DUEL_CHANGED, this.refreshSelf);
                };
                this.playerHead.source = (("source/userHead/" + this.info.head_icon) + ".jpg");
                this.playerName.text = this.info.name;
                this.playerLevel.text = (this.info.level + " 级");
                if (this.info.room_number){
                    this.playerRoom.text = RoomUtil.getRoomNameByInfo(this.info);
                } else {
                    this.playerRoom.text = "----";
                };
                _local1 = UserObject.transUserState(this.info.state);
                this.playerState.text = _local1["state_desc"];
                this.playerState.setStyle("color", _local1["state_color"]);
                this.playerWinP.text = ("获胜概率：" + UserObject.transUserWinPercent(this.info.win_duel, this.info.lose_duel, this.info.escape_duel));
                this.playerEsP.text = ("逃跑概率：" + UserObject.transUserEscapePercent(this.info.win_duel, this.info.lose_duel, this.info.escape_duel));
                _local2 = UserObject.getPvpInfo(this.info.name);
                if (_local2){
                    this.pvpWinLoseInfo.text = (((("与你的对战记录：你获胜 " + _local2.win) + " 场，负 ") + _local2.lose) + " 场。");
                    this.pvpLevelInfo.text = (("上一场对战时，对方等级为 " + _local2.duel_level) + " 级。");
                } else {
                    this.pvpWinLoseInfo.text = "与你的对战记录：无。";
                    this.pvpLevelInfo.text = "未与该角色进行过决斗。";
                };
            };
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function refreshSelf(_arg1):void{
            this.setInfo(UserObject.meDetailInfo);
        }
        private function removeHandler():void{
            TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.stateChangeHandler);
            UserPropertyChangeEventDispatcher.getInstance().removeEventListener(UserPropertyChangeEventDispatcher.WIN_LOSE_ESCAPE_DUEL_CHANGED, this.refreshSelf);
            var _local1:FakeFadeEffect = new FakeFadeEffect(this, 300, 1, 0);
            _local1.play();
        }
        private function _PlayerViewDetailInfoWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 500;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_CommonOuterFrame1_c():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.width = 380;
            _local1.height = 339;
            _local1.filters = [this._PlayerViewDetailInfoWindow_DropShadowFilter1_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_CommonMiddleFrame1_c():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 31;
            _local1.y = 34;
            _local1.width = 318;
            _local1.height = 245;
            _local1.alpha = 0.7;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_GrayLine1_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.percentWidth = 100;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_GrayLine2_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.bottom = 0;
            _local1.percentWidth = 100;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_GrayLine3_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.y = 33;
            _local1.width = 318;
            _local1.height = 3;
            _local1.horizontalCenter = 0;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_GrayLine4_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.y = 277;
            _local1.width = 318;
            _local1.height = 3;
            _local1.horizontalCenter = 0;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_GrayLine5_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.y = 203;
            _local1.width = 318;
            _local1.height = 3;
            _local1.horizontalCenter = 0;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_GrayLine6_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 202;
            _local1.y = 84;
            _local1.width = 147;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_GrayLine7_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 202;
            _local1.y = 118;
            _local1.width = 147;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_GrayLine8_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 202;
            _local1.y = 152;
            _local1.width = 147;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 43;
            _local1.y = 45;
            _local1.width = 150;
            _local1.height = 150;
            _local1.filters = [this._PlayerViewDetailInfoWindow_DropShadowFilter2_c()];
            _local1.id = "playerHead";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerHead = _local1;
            BindingManager.executeBindings(this, "playerHead", this.playerHead);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_DropShadowFilter2_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.angle = 40;
            _local1.distance = 5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.label = "私聊";
            _local1.x = 30;
            _local1.y = 280;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__whisperBtn_click);
            _local1.id = "whisperBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.whisperBtn = _local1;
            BindingManager.executeBindings(this, "whisperBtn", this.whisperBtn);
            return (_local1);
        }
        public function __whisperBtn_click(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().clickWhisperHandler(this.info.name);
        }
        private function _PlayerViewDetailInfoWindow_Button2_i():Button{
            var _local1:Button = new Button();
            _local1.label = "加为好友";
            _local1.horizontalCenter = 0;
            _local1.y = 294;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__addFriendBtn_click);
            _local1.id = "addFriendBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.addFriendBtn = _local1;
            BindingManager.executeBindings(this, "addFriendBtn", this.addFriendBtn);
            return (_local1);
        }
        public function __addFriendBtn_click(_arg1:MouseEvent):void{
            SocialContactMgr.getInstance().tryAddFriend(this.info.name);
        }
        private function _PlayerViewDetailInfoWindow_Button3_i():Button{
            var _local1:Button = new Button();
            _local1.label = "交易";
            _local1.right = 30;
            _local1.y = 280;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__tradeBtn_click);
            _local1.id = "tradeBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tradeBtn = _local1;
            BindingManager.executeBindings(this, "tradeBtn", this.tradeBtn);
            return (_local1);
        }
        public function __tradeBtn_click(_arg1:MouseEvent):void{
            TradeMgr.getInstance().tryStartDeal(this.info.name);
        }
        private function _PlayerViewDetailInfoWindow_Button4_i():Button{
            var _local1:Button = new Button();
            _local1.label = "跟随加入";
            _local1.x = 30;
            _local1.y = 309;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__followBtn_click);
            _local1.id = "followBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.followBtn = _local1;
            BindingManager.executeBindings(this, "followBtn", this.followBtn);
            return (_local1);
        }
        public function __followBtn_click(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().followPlayer(this.info.name);
        }
        private function _PlayerViewDetailInfoWindow_EasyMaskWindow1_i():EasyMaskWindow{
            var _local1:EasyMaskWindow = new EasyMaskWindow();
            _local1.x = 30;
            _local1.y = 309;
            _local1.width = 77;
            _local1.height = 27;
            _local1.toolTip = "在房间或战场时无法使用本功能。";
            _local1.id = "followBtnTooltipMask";
            if (!_local1.document){
                _local1.document = this;
            };
            this.followBtnTooltipMask = _local1;
            BindingManager.executeBindings(this, "followBtnTooltipMask", this.followBtnTooltipMask);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Button5_i():Button{
            var _local1:Button = new Button();
            _local1.label = "邀请对战";
            _local1.right = 30;
            _local1.y = 309;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__inviteBtn_click);
            _local1.id = "inviteBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.inviteBtn = _local1;
            BindingManager.executeBindings(this, "inviteBtn", this.inviteBtn);
            return (_local1);
        }
        public function __inviteBtn_click(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().inviteDuel(this.info.name);
        }
        private function _PlayerViewDetailInfoWindow_EasyMaskWindow2_i():EasyMaskWindow{
            var _local1:EasyMaskWindow = new EasyMaskWindow();
            _local1.right = 30;
            _local1.y = 309;
            _local1.width = 77;
            _local1.height = 27;
            _local1.toolTip = "只当处于大厅或房间界面时，\r才能使用本功能。";
            _local1.id = "inviteBtnTooltipMask";
            if (!_local1.document){
                _local1.document = this;
            };
            this.inviteBtnTooltipMask = _local1;
            BindingManager.executeBindings(this, "inviteBtnTooltipMask", this.inviteBtnTooltipMask);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 4;
            _local1.top = 4;
            _local1.addEventListener("click", this.___PlayerViewDetailInfoWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___PlayerViewDetailInfoWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        private function _PlayerViewDetailInfoWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 206;
            _local1.y = 53;
            _local1.height = 30;
            _local1.text = "玩家名称：";
            _local1.setStyle("verticalAlign", "middle");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 260;
            _local1.y = 53;
            _local1.height = 30;
            _local1.width = 86;
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("textAlign", "center");
            _local1.id = "playerName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerName = _local1;
            BindingManager.executeBindings(this, "playerName", this.playerName);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Label3_c():Label{
            var _local1:Label = new Label();
            _local1.x = 206;
            _local1.y = 87;
            _local1.height = 30;
            _local1.text = "玩家等级：";
            _local1.setStyle("verticalAlign", "middle");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Label4_i():Label{
            var _local1:Label = new Label();
            _local1.x = 260;
            _local1.y = 87;
            _local1.height = 30;
            _local1.width = 86;
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("textAlign", "center");
            _local1.id = "playerLevel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerLevel = _local1;
            BindingManager.executeBindings(this, "playerLevel", this.playerLevel);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Label5_c():Label{
            var _local1:Label = new Label();
            _local1.x = 206;
            _local1.y = 121;
            _local1.height = 30;
            _local1.text = "所在房间：";
            _local1.setStyle("verticalAlign", "middle");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Label6_i():Label{
            var _local1:Label = new Label();
            _local1.x = 260;
            _local1.y = 121;
            _local1.height = 30;
            _local1.width = 86;
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("textAlign", "center");
            _local1.id = "playerRoom";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerRoom = _local1;
            BindingManager.executeBindings(this, "playerRoom", this.playerRoom);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Label7_c():Label{
            var _local1:Label = new Label();
            _local1.x = 206;
            _local1.y = 155;
            _local1.height = 30;
            _local1.text = "当前状态：";
            _local1.setStyle("verticalAlign", "middle");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Label8_i():Label{
            var _local1:Label = new Label();
            _local1.x = 260;
            _local1.y = 155;
            _local1.height = 30;
            _local1.width = 86;
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("textAlign", "center");
            _local1.id = "playerState";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerState = _local1;
            BindingManager.executeBindings(this, "playerState", this.playerState);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Label9_i():Label{
            var _local1:Label = new Label();
            _local1.x = 70;
            _local1.y = 206;
            _local1.height = 30;
            _local1.width = 130;
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "playerWinP";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerWinP = _local1;
            BindingManager.executeBindings(this, "playerWinP", this.playerWinP);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Label10_i():Label{
            var _local1:Label = new Label();
            _local1.x = 220;
            _local1.y = 206;
            _local1.height = 30;
            _local1.width = 130;
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "playerEsP";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerEsP = _local1;
            BindingManager.executeBindings(this, "playerEsP", this.playerEsP);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Label11_i():Label{
            var _local1:Label = new Label();
            _local1.y = 231;
            _local1.height = 30;
            _local1.percentWidth = 100;
            _local1.x = 0;
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("textAlign", "center");
            _local1.id = "pvpWinLoseInfo";
            if (!_local1.document){
                _local1.document = this;
            };
            this.pvpWinLoseInfo = _local1;
            BindingManager.executeBindings(this, "pvpWinLoseInfo", this.pvpWinLoseInfo);
            return (_local1);
        }
        private function _PlayerViewDetailInfoWindow_Label12_i():Label{
            var _local1:Label = new Label();
            _local1.y = 248;
            _local1.height = 30;
            _local1.percentWidth = 100;
            _local1.x = 0;
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("textAlign", "center");
            _local1.id = "pvpLevelInfo";
            if (!_local1.document){
                _local1.document = this;
            };
            this.pvpLevelInfo = _local1;
            BindingManager.executeBindings(this, "pvpLevelInfo", this.pvpLevelInfo);
            return (_local1);
        }
        public function ___PlayerViewDetailInfoWindow_AutoDepthGroup1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        public function ___PlayerViewDetailInfoWindow_AutoDepthGroup1_remove(_arg1:FlexEvent):void{
            this.removeHandler();
        }
        public function ___PlayerViewDetailInfoWindow_AutoDepthGroup1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
        }
        public function ___PlayerViewDetailInfoWindow_AutoDepthGroup1_mouseUp(_arg1:MouseEvent):void{
            this.stopDrag();
        }
        private function _PlayerViewDetailInfoWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
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
        public function get followBtnTooltipMask():EasyMaskWindow{
            return (this._839690148followBtnTooltipMask);
        }
        public function set followBtnTooltipMask(_arg1:EasyMaskWindow):void{
            var _local2:Object = this._839690148followBtnTooltipMask;
            if (_local2 !== _arg1){
                this._839690148followBtnTooltipMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "followBtnTooltipMask", _local2, _arg1));
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
        public function get inviteBtnTooltipMask():EasyMaskWindow{
            return (this._311893764inviteBtnTooltipMask);
        }
        public function set inviteBtnTooltipMask(_arg1:EasyMaskWindow):void{
            var _local2:Object = this._311893764inviteBtnTooltipMask;
            if (_local2 !== _arg1){
                this._311893764inviteBtnTooltipMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteBtnTooltipMask", _local2, _arg1));
                };
            };
        }
        public function get playerEsP():Label{
            return (this._1872068927playerEsP);
        }
        public function set playerEsP(_arg1:Label):void{
            var _local2:Object = this._1872068927playerEsP;
            if (_local2 !== _arg1){
                this._1872068927playerEsP = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerEsP", _local2, _arg1));
                };
            };
        }
        public function get playerHead():MyImage{
            return (this._2095481953playerHead);
        }
        public function set playerHead(_arg1:MyImage):void{
            var _local2:Object = this._2095481953playerHead;
            if (_local2 !== _arg1){
                this._2095481953playerHead = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerHead", _local2, _arg1));
                };
            };
        }
        public function get playerLevel():Label{
            return (this._539145507playerLevel);
        }
        public function set playerLevel(_arg1:Label):void{
            var _local2:Object = this._539145507playerLevel;
            if (_local2 !== _arg1){
                this._539145507playerLevel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerLevel", _local2, _arg1));
                };
            };
        }
        public function get playerName():Label{
            return (this._2095657228playerName);
        }
        public function set playerName(_arg1:Label):void{
            var _local2:Object = this._2095657228playerName;
            if (_local2 !== _arg1){
                this._2095657228playerName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerName", _local2, _arg1));
                };
            };
        }
        public function get playerRoom():Label{
            return (this._2095789916playerRoom);
        }
        public function set playerRoom(_arg1:Label):void{
            var _local2:Object = this._2095789916playerRoom;
            if (_local2 !== _arg1){
                this._2095789916playerRoom = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerRoom", _local2, _arg1));
                };
            };
        }
        public function get playerState():Label{
            return (this._546037296playerState);
        }
        public function set playerState(_arg1:Label):void{
            var _local2:Object = this._546037296playerState;
            if (_local2 !== _arg1){
                this._546037296playerState = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerState", _local2, _arg1));
                };
            };
        }
        public function get playerWinP():Label{
            return (this._2095933045playerWinP);
        }
        public function set playerWinP(_arg1:Label):void{
            var _local2:Object = this._2095933045playerWinP;
            if (_local2 !== _arg1){
                this._2095933045playerWinP = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerWinP", _local2, _arg1));
                };
            };
        }
        public function get pvpLevelInfo():Label{
            return (this._201757112pvpLevelInfo);
        }
        public function set pvpLevelInfo(_arg1:Label):void{
            var _local2:Object = this._201757112pvpLevelInfo;
            if (_local2 !== _arg1){
                this._201757112pvpLevelInfo = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pvpLevelInfo", _local2, _arg1));
                };
            };
        }
        public function get pvpWinLoseInfo():Label{
            return (this._822204373pvpWinLoseInfo);
        }
        public function set pvpWinLoseInfo(_arg1:Label):void{
            var _local2:Object = this._822204373pvpWinLoseInfo;
            if (_local2 !== _arg1){
                this._822204373pvpWinLoseInfo = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pvpWinLoseInfo", _local2, _arg1));
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
