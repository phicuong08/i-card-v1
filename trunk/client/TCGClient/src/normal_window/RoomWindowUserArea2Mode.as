//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import source_manager.*;
    import spark.effects.*;
    import spark.filters.*;
    import custom_effect.*;
    import mx.collections.*;
    import flash.utils.*;
    import combat_element_script.*;
    import player_view.*;
    import flash.accessibility.*;
    import skins.*;
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

    public class RoomWindowUserArea2Mode extends RoomWindowUserArea implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _RoomWindowUserArea2Mode_CommonHeadImageFrame1:CommonHeadImageFrame;
        public var _RoomWindowUserArea2Mode_CommonMiddleFrame1:CommonMiddleFrame;
        public var _RoomWindowUserArea2Mode_CommonOuterFrame1:CommonOuterFrame;
        public var _RoomWindowUserArea2Mode_WordWithCircle1:WordWithCircle;
        private var _304919812cardGroups:ComboBox;
        private var _989314119changeSeatBtn:Button;
        private var _437317695defaultHead:SmoothBitmapImage;
        private var _611930002headAddEffect:Fade;
        private var _239298725headImage:MyImage;
        private var _2043214976prepareOkImg:SmoothImage;
        private var _943571677selectCardDesc:Label;
        private var _1867778946startDuelBtn:ClickScaleButton;
        private var _589992986userInfoText:SmoothBitmapImage;
        private var _321545849userLevel:Label;
        private var _266666762userName:Label;
        private var _620237124userPrepare:Group;
        private var _601586520userPrepareFade:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        private var creationHasComplete:Boolean = false;
        private var _1059420975userCardGroups:ArrayCollection;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        private var _embed_mxml_source_commonUI_______png_425445134:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function RoomWindowUserArea2Mode(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._1059420975userCardGroups = new ArrayCollection();
            this._embed_mxml_source_commonUI____png_1538356188 = RoomWindowUserArea2Mode__embed_mxml_source_commonUI____png_1538356188;
            this._embed_mxml_source_commonUI_______png_425445134 = RoomWindowUserArea2Mode__embed_mxml_source_commonUI_______png_425445134;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._RoomWindowUserArea2Mode_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_RoomWindowUserArea2ModeWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (RoomWindowUserArea2Mode[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 617;
            this.height = 321;
            this.mxmlContent = [this._RoomWindowUserArea2Mode_CommonOuterFrame1_i(), this._RoomWindowUserArea2Mode_CommonMiddleFrame1_i(), this._RoomWindowUserArea2Mode_SmoothBitmapImage1_c(), this._RoomWindowUserArea2Mode_SmoothBitmapImage2_i(), this._RoomWindowUserArea2Mode_SmoothBitmapImage3_c(), this._RoomWindowUserArea2Mode_SmoothBitmapImage4_c(), this._RoomWindowUserArea2Mode_SmoothBitmapImage5_i(), this._RoomWindowUserArea2Mode_CommonHeadImageFrame1_i(), this._RoomWindowUserArea2Mode_WordWithCircle1_i(), this._RoomWindowUserArea2Mode_Label2_i(), this._RoomWindowUserArea2Mode_Label3_i(), this._RoomWindowUserArea2Mode_Label4_i(), this._RoomWindowUserArea2Mode_Button2_i()];
            this._RoomWindowUserArea2Mode_Fade1_i();
            this._RoomWindowUserArea2Mode_MyImage1_i();
            this._RoomWindowUserArea2Mode_SmoothImage1_i();
            this._RoomWindowUserArea2Mode_Group1_i();
            this._RoomWindowUserArea2Mode_Fade2_i();
            this.addEventListener("creationComplete", this.___RoomWindowUserArea2Mode_RoomWindowUserArea1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            RoomWindowUserArea2Mode._watcherSetupUtil = _arg1;
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
                this.color = 14466179;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.userInfoText.source = RoomWindowSourceMgr.getInstance().getSourceClass("userInfoText");
            this.prepareOkImg.source = RoomWindowSourceMgr.getInstance().getSourceClass("prepareOKText");
            this.defaultHead.source = RoomWindowSourceMgr.getInstance().getSourceClass("defaultPlayerHead");
            this.displayUserInfo();
            new MyDragManager(this, dragStartHandler);
        }
        override public function set userInfo(_arg1:Object):void{
            super.userInfo = _arg1;
            this.displayUserInfo();
        }
        private function displayUserInfo():void{
            if (((_userInfo) && (this.creationHasComplete))){
                isEmpty = false;
                this.userName.text = ("玩家名称：" + _userInfo.name);
                this.userLevel.text = (("玩家等级：" + _userInfo.level) + " 级");
                this.setPrepareOkSign((((_userInfo.state == "prepare_ok")) || ((_userInfo.state == "competition_prepare_ok"))), _userInfo.duel_group_name);
                this.headImage.source = (("source/userHead/" + _userInfo.head_icon) + ".jpg");
                addElement(this.headImage);
                this.showChangeSeatBtn(false);
            };
        }
        override public function clearUserInfo():void{
            var _local1:FakeFadeEffect;
            if (this.creationHasComplete){
                _isMainUserWindow = false;
                isEmpty = true;
                isMeFlag = false;
                _userInfo = null;
                this.userName.text = "";
                this.userLevel.text = "";
                this.setPrepareOkSign(false);
                this.showUserPrepare(false);
                this.showChangeSeatBtn(true);
                if (this.headImage.parent == this){
                    _local1 = new FakeFadeEffect(this.headImage, 300, 1, 0);
                    _local1.play();
                    this.headImage.source = null;
                    removeElement(this.headImage);
                };
                this.userCardGroups.removeAll();
            };
        }
        protected function headImage_clickHandler():void{
            if (((_userInfo) && (_userInfo.name))){
                PlayViewMgr.getInstance().showOpMenu(_userInfo.name);
            };
        }
        protected function userPrepareFade_effectEndHandler(_arg1:EffectEvent):void{
            var _local3:String;
            this.userCardGroups.removeAll();
            var _local2:int;
            for (_local3 in UserObject.groupCardsInfo) {
                this.userCardGroups.addItem({label:_local3});
                if (UserObject.selectCardGroup == _local3){
                    _local2 = (this.userCardGroups.length - 1);
                };
            };
            this.cardGroups.selectedIndex = _local2;
        }
        private function prepareDuel():void{
            if (this.userPrepareFade.isPlaying){
                return;
            };
            if (((this.cardGroups.selectedItem) && (this.userCardGroups.contains(this.cardGroups.selectedItem)))){
                if (!RoomUtil.isCompetitionModeRoom(RoomWindow.getInstance().roomType)){
                    LuaAgent.getInstance().run((("u.hall_room_mgr:prepare_duel(\"" + this.cardGroups.selectedItem.label) + "\");"));
                } else {
                    LuaAgent.getInstance().run((("u.competition_mgr:prepare_duel(\"" + this.cardGroups.selectedItem.label) + "\");"));
                };
            } else {
                MessageBox.showMessageBox(MessageBox.NOTICE, "提醒：", "请选择正确的卡组用于对战！");
            };
        }
        override public function getSelectCardName():String{
            if (((this.cardGroups.selectedItem) && (this.userCardGroups.contains(this.cardGroups.selectedItem)))){
                return (this.cardGroups.selectedItem.label);
            };
            return (null);
        }
        override public function changeUserState(_arg1:String, _arg2:String=null):void{
            if (!_userInfo){
                return;
            };
            _userInfo.state = _arg1;
            this.setPrepareOkSign((((_userInfo.state == "prepare_ok")) || ((_userInfo.state == "competition_prepare_ok"))), _arg2);
        }
        private function setPrepareOkSign(_arg1:Boolean, _arg2:String=null):void{
            if (_arg1){
                this.prepareOkImg.buttonMode = isMeFlag;
                if (this.prepareOkImg.parent != this){
                    addElement(this.prepareOkImg);
                };
                this.showUserPrepare(false);
                this.selectCardDesc.text = (_arg2) ? ("使用卡组：" + _arg2) : null;
            } else {
                if (this.prepareOkImg.parent == this){
                    removeElement(this.prepareOkImg);
                };
                if (isMeFlag){
                    this.showUserPrepare(true);
                };
                this.selectCardDesc.text = null;
            };
        }
        private function showUserPrepare(_arg1:Boolean):void{
            if (_arg1){
                if (this.userPrepare.parent != this){
                    addElement(this.userPrepare);
                };
            } else {
                if (this.userPrepare.parent == this){
                    removeElement(this.userPrepare);
                };
            };
        }
        private function playFakeRemoveEffect():void{
            var _local1:FakeFadeEffect = new FakeFadeEffect(this.userPrepare, 300, 1, 0);
            _local1.play();
        }
        protected function cardGroups_removedFromStageHandler(_arg1:Event):void{
            var name:* = null;
            var event:* = _arg1;
            if (((this.cardGroups.selectedItem) && (this.userCardGroups.contains(this.cardGroups.selectedItem)))){
                var setSelectCardGroup:* = function ():void{
                    UserObject.selectCardGroup = name;
                };
                name = this.cardGroups.selectedItem.label;
                callLater(setSelectCardGroup);
            };
        }
        protected function prepareOkImg_clickHandler(_arg1:MouseEvent):void{
            if (isMeFlag){
                if (!RoomUtil.isCompetitionModeRoom(RoomWindow.getInstance().roomType)){
                    LuaAgent.getInstance().run("u.hall_room_mgr:cancel_prepare()");
                } else {
                    LuaAgent.getInstance().run("u.competition_mgr:cancel_prepare()");
                };
            };
        }
        private function showChangeSeatBtn(_arg1:Boolean):void{
            if (((_arg1) && (!(RoomUtil.isCompetitionModeRoom(RoomWindow.getInstance().roomType))))){
                this.changeSeatBtn.visible = true;
            } else {
                this.changeSeatBtn.visible = false;
            };
        }
        private function _RoomWindowUserArea2Mode_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 1;
            _local1.duration = 300;
            this.headAddEffect = _local1;
            BindingManager.executeBindings(this, "headAddEffect", this.headAddEffect);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_MyImage1_i():MyImage{
            var _local1:MyImage;
            _local1 = new MyImage();
            _local1.x = 31;
            _local1.y = 58.5;
            _local1.alpha = 0;
            _local1.width = 240;
            _local1.height = 240;
            _local1.addEventListener("click", this.__headImage_click);
            _local1.id = "headImage";
            if (!_local1.document){
                _local1.document = this;
            };
            this.headImage = _local1;
            BindingManager.executeBindings(this, "headImage", this.headImage);
            return (_local1);
        }
        public function __headImage_click(_arg1:MouseEvent):void{
            this.headImage_clickHandler();
        }
        private function _RoomWindowUserArea2Mode_SmoothImage1_i():SmoothImage{
            var _local1:SmoothImage = new SmoothImage();
            _local1.x = 339;
            _local1.y = 228;
            _local1.addEventListener("click", this.__prepareOkImg_click);
            _local1.id = "prepareOkImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.prepareOkImg = _local1;
            BindingManager.executeBindings(this, "prepareOkImg", this.prepareOkImg);
            return (_local1);
        }
        public function __prepareOkImg_click(_arg1:MouseEvent):void{
            this.prepareOkImg_clickHandler(_arg1);
        }
        private function _RoomWindowUserArea2Mode_Group1_i():Group{
            var _local1:Group = new Group();
            _local1.visible = false;
            _local1.mxmlContent = [this._RoomWindowUserArea2Mode_Label1_c(), this._RoomWindowUserArea2Mode_ComboBox1_i(), this._RoomWindowUserArea2Mode_Button1_c(), this._RoomWindowUserArea2Mode_ClickScaleButton1_i()];
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 14466179);
            _local1.addEventListener("remove", this.__userPrepare_remove);
            _local1.id = "userPrepare";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userPrepare = _local1;
            BindingManager.executeBindings(this, "userPrepare", this.userPrepare);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 325;
            _local1.y = 148;
            _local1.text = "卡组选择：";
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_ComboBox1_i():ComboBox{
            var _local1:ComboBox = new ComboBox();
            _local1.x = 322;
            _local1.y = 173;
            _local1.addEventListener("focusIn", this.__cardGroups_focusIn);
            _local1.addEventListener("removedFromStage", this.__cardGroups_removedFromStage);
            _local1.id = "cardGroups";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardGroups = _local1;
            BindingManager.executeBindings(this, "cardGroups", this.cardGroups);
            return (_local1);
        }
        public function __cardGroups_focusIn(_arg1:FocusEvent):void{
            IME.enabled = true;
        }
        public function __cardGroups_removedFromStage(_arg1:Event):void{
            this.cardGroups_removedFromStageHandler(_arg1);
        }
        private function _RoomWindowUserArea2Mode_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.label = "卡组编辑";
            _local1.x = 490;
            _local1.y = 171;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomWindowUserArea2Mode_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomWindowUserArea2Mode_Button1_click(_arg1:MouseEvent):void{
            TCGClient.getInstance().enterJudgeCardsWindow("roomWindow");
        }
        private function _RoomWindowUserArea2Mode_ClickScaleButton1_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.x = 320;
            _local1.y = 225;
            _local1.addEventListener("initialize", this.__startDuelBtn_initialize);
            _local1.addEventListener("click", this.__startDuelBtn_click);
            _local1.id = "startDuelBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.startDuelBtn = _local1;
            BindingManager.executeBindings(this, "startDuelBtn", this.startDuelBtn);
            return (_local1);
        }
        public function __startDuelBtn_initialize(_arg1:FlexEvent):void{
            this.startDuelBtn.buttonImage = RoomWindowSourceMgr.getInstance().getSourceClass("startDuelBtnImg");
        }
        public function __startDuelBtn_click(_arg1:MouseEvent):void{
            this.prepareDuel();
        }
        public function __userPrepare_remove(_arg1:FlexEvent):void{
            this.playFakeRemoveEffect();
        }
        private function _RoomWindowUserArea2Mode_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            _local1.addEventListener("effectEnd", this.__userPrepareFade_effectEnd);
            this.userPrepareFade = _local1;
            BindingManager.executeBindings(this, "userPrepareFade", this.userPrepareFade);
            return (_local1);
        }
        public function __userPrepareFade_effectEnd(_arg1:EffectEvent):void{
            this.userPrepareFade_effectEndHandler(_arg1);
        }
        private function _RoomWindowUserArea2Mode_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.filters = [this._RoomWindowUserArea2Mode_DropShadowFilter1_c()];
            _local1.id = "_RoomWindowUserArea2Mode_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._RoomWindowUserArea2Mode_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_RoomWindowUserArea2Mode_CommonOuterFrame1", this._RoomWindowUserArea2Mode_CommonOuterFrame1);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 10;
            _local1.alpha = 0.4;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 12;
            _local1.y = 48;
            _local1.alpha = 0.5;
            _local1.id = "_RoomWindowUserArea2Mode_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._RoomWindowUserArea2Mode_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_RoomWindowUserArea2Mode_CommonMiddleFrame1", this._RoomWindowUserArea2Mode_CommonMiddleFrame1);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = -8;
            _local1.y = 23;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 15;
            _local1.y = 14;
            _local1.initialized(this, "userInfoText");
            this.userInfoText = _local1;
            BindingManager.executeBindings(this, "userInfoText", this.userInfoText);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_SmoothBitmapImage3_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_______png_425445134;
            _local1.x = 318;
            _local1.y = 70;
            _local1.scaleX = 1.3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_SmoothBitmapImage4_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_______png_425445134;
            _local1.x = 318;
            _local1.y = 106;
            _local1.scaleX = 1.3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_SmoothBitmapImage5_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 31;
            _local1.y = 58.5;
            _local1.width = 240;
            _local1.height = 240;
            _local1.initialized(this, "defaultHead");
            this.defaultHead = _local1;
            BindingManager.executeBindings(this, "defaultHead", this.defaultHead);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_CommonHeadImageFrame1_i():CommonHeadImageFrame{
            var _local1:CommonHeadImageFrame = new CommonHeadImageFrame();
            _local1.x = 29;
            _local1.y = 57;
            _local1.depth = 5;
            _local1.id = "_RoomWindowUserArea2Mode_CommonHeadImageFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._RoomWindowUserArea2Mode_CommonHeadImageFrame1 = _local1;
            BindingManager.executeBindings(this, "_RoomWindowUserArea2Mode_CommonHeadImageFrame1", this._RoomWindowUserArea2Mode_CommonHeadImageFrame1);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_WordWithCircle1_i():WordWithCircle{
            var _local1:WordWithCircle = new WordWithCircle();
            _local1.wordText = "主";
            _local1.wordColor = 14466179;
            _local1.x = 36;
            _local1.y = 64;
            _local1.depth = 5;
            _local1.scaleX = 1.2;
            _local1.scaleY = 1.2;
            _local1.filters = [this._RoomWindowUserArea2Mode_GlowFilter1_c()];
            _local1.id = "_RoomWindowUserArea2Mode_WordWithCircle1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._RoomWindowUserArea2Mode_WordWithCircle1 = _local1;
            BindingManager.executeBindings(this, "_RoomWindowUserArea2Mode_WordWithCircle1", this._RoomWindowUserArea2Mode_WordWithCircle1);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 325;
            _local1.y = 75;
            _local1.id = "userName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userName = _local1;
            BindingManager.executeBindings(this, "userName", this.userName);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 325;
            _local1.y = 111;
            _local1.id = "userLevel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userLevel = _local1;
            BindingManager.executeBindings(this, "userLevel", this.userLevel);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_Label4_i():Label{
            var _local1:Label = new Label();
            _local1.x = 325;
            _local1.y = 147;
            _local1.id = "selectCardDesc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.selectCardDesc = _local1;
            BindingManager.executeBindings(this, "selectCardDesc", this.selectCardDesc);
            return (_local1);
        }
        private function _RoomWindowUserArea2Mode_Button2_i():Button{
            var _local1:Button = new Button();
            _local1.depth = 5;
            _local1.label = "更换位置";
            _local1.x = 113;
            _local1.y = 260;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__changeSeatBtn_click);
            _local1.id = "changeSeatBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.changeSeatBtn = _local1;
            BindingManager.executeBindings(this, "changeSeatBtn", this.changeSeatBtn);
            return (_local1);
        }
        public function __changeSeatBtn_click(_arg1:MouseEvent):void{
            changeSeat();
        }
        public function ___RoomWindowUserArea2Mode_RoomWindowUserArea1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _RoomWindowUserArea2Mode_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                headImage.setStyle("addedEffect", _arg1);
            }, "headImage.addedEffect", "headAddEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                userPrepare.setStyle("addedEffect", _arg1);
            }, "userPrepare.addedEffect", "userPrepareFade");
            result[2] = new Binding(this, function ():IList{
                return (userCardGroups);
            }, null, "cardGroups.dataProvider");
            result[3] = new Binding(this, function ():Array{
                var _local1:* = [617, 321];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RoomWindowUserArea2Mode_CommonOuterFrame1.size");
            result[4] = new Binding(this, function ():Array{
                var _local1:* = [593, 262];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RoomWindowUserArea2Mode_CommonMiddleFrame1.size");
            result[5] = new Binding(this, function ():Array{
                var _local1:* = [244, 243];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RoomWindowUserArea2Mode_CommonHeadImageFrame1.size");
            result[6] = new Binding(this, function ():Boolean{
                return (_isMainUserWindow);
            }, null, "_RoomWindowUserArea2Mode_WordWithCircle1.visible");
            return (result);
        }
        public function get cardGroups():ComboBox{
            return (this._304919812cardGroups);
        }
        public function set cardGroups(_arg1:ComboBox):void{
            var _local2:Object = this._304919812cardGroups;
            if (_local2 !== _arg1){
                this._304919812cardGroups = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardGroups", _local2, _arg1));
                };
            };
        }
        public function get changeSeatBtn():Button{
            return (this._989314119changeSeatBtn);
        }
        public function set changeSeatBtn(_arg1:Button):void{
            var _local2:Object = this._989314119changeSeatBtn;
            if (_local2 !== _arg1){
                this._989314119changeSeatBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeSeatBtn", _local2, _arg1));
                };
            };
        }
        public function get defaultHead():SmoothBitmapImage{
            return (this._437317695defaultHead);
        }
        public function set defaultHead(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._437317695defaultHead;
            if (_local2 !== _arg1){
                this._437317695defaultHead = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "defaultHead", _local2, _arg1));
                };
            };
        }
        public function get headAddEffect():Fade{
            return (this._611930002headAddEffect);
        }
        public function set headAddEffect(_arg1:Fade):void{
            var _local2:Object = this._611930002headAddEffect;
            if (_local2 !== _arg1){
                this._611930002headAddEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headAddEffect", _local2, _arg1));
                };
            };
        }
        public function get headImage():MyImage{
            return (this._239298725headImage);
        }
        public function set headImage(_arg1:MyImage):void{
            var _local2:Object = this._239298725headImage;
            if (_local2 !== _arg1){
                this._239298725headImage = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headImage", _local2, _arg1));
                };
            };
        }
        public function get prepareOkImg():SmoothImage{
            return (this._2043214976prepareOkImg);
        }
        public function set prepareOkImg(_arg1:SmoothImage):void{
            var _local2:Object = this._2043214976prepareOkImg;
            if (_local2 !== _arg1){
                this._2043214976prepareOkImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prepareOkImg", _local2, _arg1));
                };
            };
        }
        public function get selectCardDesc():Label{
            return (this._943571677selectCardDesc);
        }
        public function set selectCardDesc(_arg1:Label):void{
            var _local2:Object = this._943571677selectCardDesc;
            if (_local2 !== _arg1){
                this._943571677selectCardDesc = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectCardDesc", _local2, _arg1));
                };
            };
        }
        public function get startDuelBtn():ClickScaleButton{
            return (this._1867778946startDuelBtn);
        }
        public function set startDuelBtn(_arg1:ClickScaleButton):void{
            var _local2:Object = this._1867778946startDuelBtn;
            if (_local2 !== _arg1){
                this._1867778946startDuelBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "startDuelBtn", _local2, _arg1));
                };
            };
        }
        public function get userInfoText():SmoothBitmapImage{
            return (this._589992986userInfoText);
        }
        public function set userInfoText(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._589992986userInfoText;
            if (_local2 !== _arg1){
                this._589992986userInfoText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userInfoText", _local2, _arg1));
                };
            };
        }
        public function get userLevel():Label{
            return (this._321545849userLevel);
        }
        public function set userLevel(_arg1:Label):void{
            var _local2:Object = this._321545849userLevel;
            if (_local2 !== _arg1){
                this._321545849userLevel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userLevel", _local2, _arg1));
                };
            };
        }
        public function get userName():Label{
            return (this._266666762userName);
        }
        public function set userName(_arg1:Label):void{
            var _local2:Object = this._266666762userName;
            if (_local2 !== _arg1){
                this._266666762userName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userName", _local2, _arg1));
                };
            };
        }
        public function get userPrepare():Group{
            return (this._620237124userPrepare);
        }
        public function set userPrepare(_arg1:Group):void{
            var _local2:Object = this._620237124userPrepare;
            if (_local2 !== _arg1){
                this._620237124userPrepare = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userPrepare", _local2, _arg1));
                };
            };
        }
        public function get userPrepareFade():Fade{
            return (this._601586520userPrepareFade);
        }
        public function set userPrepareFade(_arg1:Fade):void{
            var _local2:Object = this._601586520userPrepareFade;
            if (_local2 !== _arg1){
                this._601586520userPrepareFade = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userPrepareFade", _local2, _arg1));
                };
            };
        }
        private function get userCardGroups():ArrayCollection{
            return (this._1059420975userCardGroups);
        }
        private function set userCardGroups(_arg1:ArrayCollection):void{
            var _local2:Object = this._1059420975userCardGroups;
            if (_local2 !== _arg1){
                this._1059420975userCardGroups = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userCardGroups", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
