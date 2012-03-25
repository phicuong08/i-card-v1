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
    import spark.effects.*;
    import custom_effect.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import skins.*;
    import mx.filters.*;
    import flash.ui.*;
    import card_collection.*;
    import flash.net.*;
    import achievement_system.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class UserDetailInfoWindow extends AutoDepthGroup implements IBindingClient {
		use namespace mx_internal;
        private static var instance:UserDetailInfoWindow;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _UserDetailInfoWindow_MetalFrameWith4Sign1:MetalFrameWith4Sign;
        private var _522496670achievementReachNum:Label;
        private var _413245038addEffect:Fade;
        private var _1548114636competitionExploit:Label;
        private var _1242519365escapeNum:Label;
        private var _1117951255historyDuelResult:Label;
        private var _2095481953playerHead:MyImage;
        private var _264324307userBasicCard:Label;
        private var _252051467userCardNum:Label;
        private var _147157422userExp:ExpBar;
        private var _321545849userLevel:Label;
        private var _322759605userMoney:Label;
        private var _266666762userName:Label;
        private var _327944583userScore:Label;
        private var _425301260winCampaign:Label;
        private var _1130086516winTrain:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var creationHasCompelte:Boolean = false;
        private var _embed_mxml_source_commonUI______png_2111310210:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function UserDetailInfoWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI______png_2111310210 = UserDetailInfoWindow__embed_mxml_source_commonUI______png_2111310210;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._UserDetailInfoWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_UserDetailInfoWindowWatcherSetupUtil");
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
            this.x = 205;
            this.y = 203;
            this.width = 870;
            this.height = 394;
            this.mxmlContent = [this._UserDetailInfoWindow_MetalFrameWith4Sign1_i(), this._UserDetailInfoWindow_SmoothBitmapImage1_c(), this._UserDetailInfoWindow_CloseSignBtn1_c(), this._UserDetailInfoWindow_GrayLine1_c(), this._UserDetailInfoWindow_GrayLine2_c(), this._UserDetailInfoWindow_GrayLine3_c(), this._UserDetailInfoWindow_MyImage1_i(), this._UserDetailInfoWindow_CommonHeadImageFrameDown1_c(), this._UserDetailInfoWindow_CommonHeadImageFrame1_c(), this._UserDetailInfoWindow_Label1_i(), this._UserDetailInfoWindow_GrayLine4_c(), this._UserDetailInfoWindow_GrayLine5_c(), this._UserDetailInfoWindow_GrayLine6_c(), this._UserDetailInfoWindow_GrayLine7_c(), this._UserDetailInfoWindow_Label2_i(), this._UserDetailInfoWindow_ExpBar1_i(), this._UserDetailInfoWindow_Label3_i(), this._UserDetailInfoWindow_Label4_i(), this._UserDetailInfoWindow_Label5_i(), this._UserDetailInfoWindow_Label6_i(), this._UserDetailInfoWindow_Button1_c(), this._UserDetailInfoWindow_GrayLine8_c(), this._UserDetailInfoWindow_GrayLine9_c(), this._UserDetailInfoWindow_GrayLine10_c(), this._UserDetailInfoWindow_GrayLine11_c(), this._UserDetailInfoWindow_Label7_c(), this._UserDetailInfoWindow_Label8_i(), this._UserDetailInfoWindow_Label9_i(), this._UserDetailInfoWindow_Label10_i(), this._UserDetailInfoWindow_Label11_i(), this._UserDetailInfoWindow_Label12_i(), this._UserDetailInfoWindow_Button2_c(), this._UserDetailInfoWindow_GrayLine12_c(), this._UserDetailInfoWindow_GrayLine13_c(), this._UserDetailInfoWindow_Label13_i(), this._UserDetailInfoWindow_Label14_c(), this._UserDetailInfoWindow_Label15_c(), this._UserDetailInfoWindow_Label16_c(), this._UserDetailInfoWindow_Label17_c(), this._UserDetailInfoWindow_Label18_c(), this._UserDetailInfoWindow_Button3_c()];
            this._UserDetailInfoWindow_Fade1_i();
            this.addEventListener("creationComplete", this.___UserDetailInfoWindow_AutoDepthGroup1_creationComplete);
            this.addEventListener("remove", this.___UserDetailInfoWindow_AutoDepthGroup1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function autoShowHideWindow():void{
            if (((instance) && (instance.parent))){
                instance.removeSelf();
            } else {
                if (TCGClient.getInstance().customCurrentState != "loadingWindow"){
                    instance = new (UserDetailInfoWindow)();
                    TCGClient.getInstance().mainGroup.addElement(instance);
                };
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            UserDetailInfoWindow._watcherSetupUtil = _arg1;
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
                this.color = 11907998;
                this.fontSize = 14;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function superdraggroup1_creationCompleteHandler(_arg1:FlexEvent):void{
            BasicOperationBar.getInstance().registerWeakLeaveFunc(this.removeSelf);
            this.creationHasCompelte = true;
            this.getDataAndSetInfo();
            this.addUserProperChangeListener();
            TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.removeSelf);
        }
        protected function superdraggroup1_removeHandler(_arg1:FlexEvent):void{
            BasicOperationBar.getInstance().clearWeakLeaveFunc(this.removeSelf);
            if (instance == this){
                instance = null;
            };
            this.removeUserProperChangeListener();
            TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.removeSelf);
        }
        public function removeSelf(_arg1=null):void{
            var _local3:FakeFadeEffect;
            var _local2:* = parent;
            if (_local2){
                _local3 = new FakeFadeEffect(this, 300, 1, 0);
                _local3.effectContainer.depth = depth;
                _local3.play();
                _local2.removeElement(this);
            };
        }
        protected function getDataAndSetInfo(_arg1=null):void{
            if (!this.creationHasCompelte){
                return;
            };
            var _local2:Object = UserObject.meDetailInfo;
            this.playerHead.source = (("source/userHead/" + _local2.head_icon) + ".jpg");
            this.userName.text = _local2.name;
            this.userLevel.text = ("等级：" + _local2.level);
            this.userExp.setValue(_local2.all_score, UserObject.getLevelUpScore(_local2.level));
            this.userScore.text = ("积分：" + _local2.remain_score);
            this.userMoney.text = ("金币：" + _local2.money);
            this.userCardNum.text = ("卡牌总数：" + _local2.all_card_num);
            this.userBasicCard.text = ("初始卡组：" + UserObject.translateUserCamp(_local2.camp));
            this.historyDuelResult.text = (((("胜：" + _local2.win_duel) + " 场，负：") + _local2.lose_duel) + " 场");
            this.escapeNum.text = (("对战逃跑：" + _local2.escape_duel) + " 场");
            this.winTrain.text = (("获胜训练：" + _local2.win_train_num) + " 个");
            this.winCampaign.text = (("完成战役：" + _local2.complete_guide_num) + " 个");
            this.achievementReachNum.text = (("达成成就：" + _local2.achievement_reach_num) + " 个");
            this.competitionExploit.text = ("战功：" + _local2.competition_exploit);
        }
        private function addUserProperChangeListener():void{
            UserPropertyChangeEventDispatcher.getInstance().addEventListener(UserPropertyChangeEventDispatcher.ALL_CARD_CHANGED, this.getDataAndSetInfo);
            UserPropertyChangeEventDispatcher.getInstance().addEventListener(UserPropertyChangeEventDispatcher.MONEY_CHANGED, this.getDataAndSetInfo);
            UserPropertyChangeEventDispatcher.getInstance().addEventListener(UserPropertyChangeEventDispatcher.SCORE_CHANGED, this.getDataAndSetInfo);
            UserPropertyChangeEventDispatcher.getInstance().addEventListener(UserPropertyChangeEventDispatcher.WIN_LOSE_ESCAPE_DUEL_CHANGED, this.getDataAndSetInfo);
        }
        private function removeUserProperChangeListener():void{
            UserPropertyChangeEventDispatcher.getInstance().removeEventListener(UserPropertyChangeEventDispatcher.ALL_CARD_CHANGED, this.getDataAndSetInfo);
            UserPropertyChangeEventDispatcher.getInstance().removeEventListener(UserPropertyChangeEventDispatcher.MONEY_CHANGED, this.getDataAndSetInfo);
            UserPropertyChangeEventDispatcher.getInstance().removeEventListener(UserPropertyChangeEventDispatcher.SCORE_CHANGED, this.getDataAndSetInfo);
            UserPropertyChangeEventDispatcher.getInstance().removeEventListener(UserPropertyChangeEventDispatcher.WIN_LOSE_ESCAPE_DUEL_CHANGED, this.getDataAndSetInfo);
        }
        private function _UserDetailInfoWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 500;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _UserDetailInfoWindow_MetalFrameWith4Sign1_i():MetalFrameWith4Sign{
            var _local1:MetalFrameWith4Sign = new MetalFrameWith4Sign();
            _local1.addEventListener("mouseDown", this.___UserDetailInfoWindow_MetalFrameWith4Sign1_mouseDown);
            _local1.addEventListener("mouseUp", this.___UserDetailInfoWindow_MetalFrameWith4Sign1_mouseUp);
            _local1.id = "_UserDetailInfoWindow_MetalFrameWith4Sign1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._UserDetailInfoWindow_MetalFrameWith4Sign1 = _local1;
            BindingManager.executeBindings(this, "_UserDetailInfoWindow_MetalFrameWith4Sign1", this._UserDetailInfoWindow_MetalFrameWith4Sign1);
            return (_local1);
        }
        public function ___UserDetailInfoWindow_MetalFrameWith4Sign1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
        }
        public function ___UserDetailInfoWindow_MetalFrameWith4Sign1_mouseUp(_arg1:MouseEvent):void{
            this.stopDrag();
        }
        private function _UserDetailInfoWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.y = 23;
            _local1.horizontalCenter = 0;
            _local1.source = this._embed_mxml_source_commonUI______png_2111310210;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 5;
            _local1.top = 5;
            _local1.addEventListener("click", this.___UserDetailInfoWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___UserDetailInfoWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        private function _UserDetailInfoWindow_GrayLine1_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 110;
            _local1.y = 60;
            _local1.width = 650;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_GrayLine2_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 445;
            _local1.y = 99;
            _local1.width = 230;
            _local1.height = 3;
            _local1.rotation = 90;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_GrayLine3_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 655;
            _local1.y = 99;
            _local1.width = 230;
            _local1.height = 3;
            _local1.rotation = 90;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 26;
            _local1.y = 99;
            _local1.width = 209;
            _local1.height = 209;
            _local1.mouseEnabled = false;
            _local1.id = "playerHead";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerHead = _local1;
            BindingManager.executeBindings(this, "playerHead", this.playerHead);
            return (_local1);
        }
        private function _UserDetailInfoWindow_CommonHeadImageFrameDown1_c():CommonHeadImageFrameDown{
            var _local1:CommonHeadImageFrameDown = new CommonHeadImageFrameDown();
            _local1.x = 28;
            _local1.y = 308;
            _local1.width = 205;
            _local1.height = 35;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_CommonHeadImageFrame1_c():CommonHeadImageFrame{
            var _local1:CommonHeadImageFrame = new CommonHeadImageFrame();
            _local1.x = 23;
            _local1.y = 96;
            _local1.width = 215;
            _local1.height = 216;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 28;
            _local1.y = 316;
            _local1.width = 203;
            _local1.mouseEnabled = false;
            _local1.setStyle("color", 14337414);
            _local1.setStyle("fontSize", 16);
            _local1.setStyle("textAlign", "center");
            _local1.id = "userName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userName = _local1;
            BindingManager.executeBindings(this, "userName", this.userName);
            return (_local1);
        }
        private function _UserDetailInfoWindow_GrayLine4_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 280;
            _local1.y = 165;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_GrayLine5_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 280;
            _local1.y = 200;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_GrayLine6_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 280;
            _local1.y = 235;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_GrayLine7_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 280;
            _local1.y = 270;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 280;
            _local1.y = 121;
            _local1.mouseEnabled = false;
            _local1.id = "userLevel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userLevel = _local1;
            BindingManager.executeBindings(this, "userLevel", this.userLevel);
            return (_local1);
        }
        private function _UserDetailInfoWindow_ExpBar1_i():ExpBar{
            var _local1:ExpBar = new ExpBar();
            _local1.x = 280;
            _local1.y = 139;
            _local1.width = 125;
            _local1.mouseEnabled = false;
            _local1.id = "userExp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userExp = _local1;
            BindingManager.executeBindings(this, "userExp", this.userExp);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 280;
            _local1.y = 178;
            _local1.mouseEnabled = false;
            _local1.id = "userScore";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userScore = _local1;
            BindingManager.executeBindings(this, "userScore", this.userScore);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label4_i():Label{
            var _local1:Label = new Label();
            _local1.x = 280;
            _local1.y = 213;
            _local1.mouseEnabled = false;
            _local1.id = "userMoney";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userMoney = _local1;
            BindingManager.executeBindings(this, "userMoney", this.userMoney);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label5_i():Label{
            var _local1:Label = new Label();
            _local1.x = 280;
            _local1.y = 248;
            _local1.mouseEnabled = false;
            _local1.id = "userCardNum";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userCardNum = _local1;
            BindingManager.executeBindings(this, "userCardNum", this.userCardNum);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label6_i():Label{
            var _local1:Label = new Label();
            _local1.x = 280;
            _local1.y = 283;
            _local1.mouseEnabled = false;
            _local1.id = "userBasicCard";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userBasicCard = _local1;
            BindingManager.executeBindings(this, "userBasicCard", this.userBasicCard);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.label = "集  卡  册";
            _local1.x = 260;
            _local1.y = 325;
            _local1.width = 139;
            _local1.height = 27;
            _local1.toolTip = "查看与收集卡片";
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___UserDetailInfoWindow_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___UserDetailInfoWindow_Button1_click(_arg1:MouseEvent):void{
            CardCollectionMgr.getInstance().showCardCollectionMainWindow();
        }
        private function _UserDetailInfoWindow_GrayLine8_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 495;
            _local1.y = 165;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_GrayLine9_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 495;
            _local1.y = 200;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_GrayLine10_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 495;
            _local1.y = 235;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_GrayLine11_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 495;
            _local1.y = 270;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label7_c():Label{
            var _local1:Label = new Label();
            _local1.x = 495;
            _local1.y = 121;
            _local1.text = "历史战绩：";
            _local1.mouseEnabled = false;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label8_i():Label{
            var _local1:Label = new Label();
            _local1.x = 495;
            _local1.y = 143;
            _local1.mouseEnabled = false;
            _local1.id = "historyDuelResult";
            if (!_local1.document){
                _local1.document = this;
            };
            this.historyDuelResult = _local1;
            BindingManager.executeBindings(this, "historyDuelResult", this.historyDuelResult);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label9_i():Label{
            var _local1:Label = new Label();
            _local1.x = 495;
            _local1.y = 178;
            _local1.mouseEnabled = false;
            _local1.id = "escapeNum";
            if (!_local1.document){
                _local1.document = this;
            };
            this.escapeNum = _local1;
            BindingManager.executeBindings(this, "escapeNum", this.escapeNum);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label10_i():Label{
            var _local1:Label = new Label();
            _local1.x = 495;
            _local1.y = 213;
            _local1.mouseEnabled = false;
            _local1.id = "winTrain";
            if (!_local1.document){
                _local1.document = this;
            };
            this.winTrain = _local1;
            BindingManager.executeBindings(this, "winTrain", this.winTrain);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label11_i():Label{
            var _local1:Label = new Label();
            _local1.x = 495;
            _local1.y = 248;
            _local1.mouseEnabled = false;
            _local1.id = "winCampaign";
            if (!_local1.document){
                _local1.document = this;
            };
            this.winCampaign = _local1;
            BindingManager.executeBindings(this, "winCampaign", this.winCampaign);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label12_i():Label{
            var _local1:Label = new Label();
            _local1.x = 495;
            _local1.y = 283;
            _local1.mouseEnabled = false;
            _local1.id = "achievementReachNum";
            if (!_local1.document){
                _local1.document = this;
            };
            this.achievementReachNum = _local1;
            BindingManager.executeBindings(this, "achievementReachNum", this.achievementReachNum);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.label = "成  就  一  览";
            _local1.x = 484;
            _local1.y = 325;
            _local1.width = 130;
            _local1.height = 27;
            _local1.toolTip = "查看所获得的成就";
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___UserDetailInfoWindow_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___UserDetailInfoWindow_Button2_click(_arg1:MouseEvent):void{
            AchievementGeneralViewWindow.autoShowHideWindow();
        }
        private function _UserDetailInfoWindow_GrayLine12_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 706;
            _local1.y = 165;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_GrayLine13_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 706;
            _local1.y = 200;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label13_i():Label{
            var _local1:Label = new Label();
            _local1.x = 706;
            _local1.y = 121;
            _local1.mouseEnabled = false;
            _local1.id = "competitionExploit";
            if (!_local1.document){
                _local1.document = this;
            };
            this.competitionExploit = _local1;
            BindingManager.executeBindings(this, "competitionExploit", this.competitionExploit);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label14_c():Label{
            var _local1:Label = new Label();
            _local1.x = 706;
            _local1.y = 143;
            _local1.mouseEnabled = false;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label15_c():Label{
            var _local1:Label = new Label();
            _local1.x = 706;
            _local1.y = 178;
            _local1.text = "排名：--";
            _local1.mouseEnabled = false;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label16_c():Label{
            var _local1:Label = new Label();
            _local1.x = 706;
            _local1.y = 213;
            _local1.text = "比赛历程：--";
            _local1.mouseEnabled = false;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label17_c():Label{
            var _local1:Label = new Label();
            _local1.x = 706;
            _local1.y = 248;
            _local1.mouseEnabled = false;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Label18_c():Label{
            var _local1:Label = new Label();
            _local1.x = 706;
            _local1.y = 283;
            _local1.mouseEnabled = false;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _UserDetailInfoWindow_Button3_c():Button{
            var _local1:Button = new Button();
            _local1.label = "对  战  记  录";
            _local1.enabled = false;
            _local1.x = 696;
            _local1.y = 325;
            _local1.width = 130;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___UserDetailInfoWindow_AutoDepthGroup1_creationComplete(_arg1:FlexEvent):void{
            this.superdraggroup1_creationCompleteHandler(_arg1);
        }
        public function ___UserDetailInfoWindow_AutoDepthGroup1_remove(_arg1:FlexEvent):void{
            this.superdraggroup1_removeHandler(_arg1);
        }
        private function _UserDetailInfoWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, null, "_UserDetailInfoWindow_MetalFrameWith4Sign1.width", "width");
            result[2] = new Binding(this, null, null, "_UserDetailInfoWindow_MetalFrameWith4Sign1.height", "height");
            return (result);
        }
        public function get achievementReachNum():Label{
            return (this._522496670achievementReachNum);
        }
        public function set achievementReachNum(_arg1:Label):void{
            var _local2:Object = this._522496670achievementReachNum;
            if (_local2 !== _arg1){
                this._522496670achievementReachNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "achievementReachNum", _local2, _arg1));
                };
            };
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
        public function get competitionExploit():Label{
            return (this._1548114636competitionExploit);
        }
        public function set competitionExploit(_arg1:Label):void{
            var _local2:Object = this._1548114636competitionExploit;
            if (_local2 !== _arg1){
                this._1548114636competitionExploit = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "competitionExploit", _local2, _arg1));
                };
            };
        }
        public function get escapeNum():Label{
            return (this._1242519365escapeNum);
        }
        public function set escapeNum(_arg1:Label):void{
            var _local2:Object = this._1242519365escapeNum;
            if (_local2 !== _arg1){
                this._1242519365escapeNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "escapeNum", _local2, _arg1));
                };
            };
        }
        public function get historyDuelResult():Label{
            return (this._1117951255historyDuelResult);
        }
        public function set historyDuelResult(_arg1:Label):void{
            var _local2:Object = this._1117951255historyDuelResult;
            if (_local2 !== _arg1){
                this._1117951255historyDuelResult = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "historyDuelResult", _local2, _arg1));
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
        public function get userBasicCard():Label{
            return (this._264324307userBasicCard);
        }
        public function set userBasicCard(_arg1:Label):void{
            var _local2:Object = this._264324307userBasicCard;
            if (_local2 !== _arg1){
                this._264324307userBasicCard = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userBasicCard", _local2, _arg1));
                };
            };
        }
        public function get userCardNum():Label{
            return (this._252051467userCardNum);
        }
        public function set userCardNum(_arg1:Label):void{
            var _local2:Object = this._252051467userCardNum;
            if (_local2 !== _arg1){
                this._252051467userCardNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userCardNum", _local2, _arg1));
                };
            };
        }
        public function get userExp():ExpBar{
            return (this._147157422userExp);
        }
        public function set userExp(_arg1:ExpBar):void{
            var _local2:Object = this._147157422userExp;
            if (_local2 !== _arg1){
                this._147157422userExp = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userExp", _local2, _arg1));
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
        public function get userMoney():Label{
            return (this._322759605userMoney);
        }
        public function set userMoney(_arg1:Label):void{
            var _local2:Object = this._322759605userMoney;
            if (_local2 !== _arg1){
                this._322759605userMoney = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userMoney", _local2, _arg1));
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
        public function get userScore():Label{
            return (this._327944583userScore);
        }
        public function set userScore(_arg1:Label):void{
            var _local2:Object = this._327944583userScore;
            if (_local2 !== _arg1){
                this._327944583userScore = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userScore", _local2, _arg1));
                };
            };
        }
        public function get winCampaign():Label{
            return (this._425301260winCampaign);
        }
        public function set winCampaign(_arg1:Label):void{
            var _local2:Object = this._425301260winCampaign;
            if (_local2 !== _arg1){
                this._425301260winCampaign = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "winCampaign", _local2, _arg1));
                };
            };
        }
        public function get winTrain():Label{
            return (this._1130086516winTrain);
        }
        public function set winTrain(_arg1:Label):void{
            var _local2:Object = this._1130086516winTrain;
            if (_local2 !== _arg1){
                this._1130086516winTrain = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "winTrain", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
