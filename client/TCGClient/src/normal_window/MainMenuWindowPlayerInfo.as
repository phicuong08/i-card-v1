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
    import spark.effects.easing.*;
    import spark.layouts.*;
    import custom_effect.*;
    import flashx.textLayout.elements.*;
    import mouse_keyboard_mgr.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class MainMenuWindowPlayerInfo extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private const playerCardXPos:Number = 40;
        private const playerCardYPos:Number = 65;

        public var _MainMenuWindowPlayerInfo_CommonHeadImageFrame1:CommonHeadImageFrame;
        public var _MainMenuWindowPlayerInfo_CommonHeadImageFrameDown1:CommonHeadImageFrameDown;
        private var _989505632elasticEasing:Elastic;
        private var _1994587966moveEffect:Move;
        private var _2095329681playerCard:Group;
        private var _2095481953playerHead:MyImage;
        private var _264324307userBasicCard:Label;
        private var _252051467userCardNum:Label;
        private var _147157422userExp:ExpBar;
        private var _321545849userLevel:Label;
        private var _322759605userMoney:Label;
        private var _266666762userName:Label;
        private var _327944583userScore:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var creationHasComplete:Boolean = false;
        private var _embed_mxml_source_commonUI______png_2111310210:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function MainMenuWindowPlayerInfo(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI______png_2111310210 = MainMenuWindowPlayerInfo__embed_mxml_source_commonUI______png_2111310210;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._MainMenuWindowPlayerInfo_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_MainMenuWindowPlayerInfoWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (MainMenuWindowPlayerInfo[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 382;
            this.height = 275;
            this.depth = 10;
            this.layout = this._MainMenuWindowPlayerInfo_BasicLayout1_c();
            this.mxmlContent = [this._MainMenuWindowPlayerInfo_MetalFrameWith4Sign1_c(), this._MainMenuWindowPlayerInfo_SmoothBitmapImage1_c(), this._MainMenuWindowPlayerInfo_GrayLine1_c(), this._MainMenuWindowPlayerInfo_GrayLine2_c(), this._MainMenuWindowPlayerInfo_GrayLine3_c(), this._MainMenuWindowPlayerInfo_GrayLine4_c(), this._MainMenuWindowPlayerInfo_Label1_i(), this._MainMenuWindowPlayerInfo_ExpBar1_i(), this._MainMenuWindowPlayerInfo_Label2_i(), this._MainMenuWindowPlayerInfo_Label3_i(), this._MainMenuWindowPlayerInfo_Label4_i(), this._MainMenuWindowPlayerInfo_Label5_i(), this._MainMenuWindowPlayerInfo_Group2_i()];
            this._MainMenuWindowPlayerInfo_Elastic1_i();
            this._MainMenuWindowPlayerInfo_Move1_i();
            this.addEventListener("creationComplete", this.___MainMenuWindowPlayerInfo_Group1_creationComplete);
            this.addEventListener("click", this.___MainMenuWindowPlayerInfo_Group1_click);
            this.addEventListener("addedToStage", this.___MainMenuWindowPlayerInfo_Group1_addedToStage);
            this.addEventListener("removedFromStage", this.___MainMenuWindowPlayerInfo_Group1_removedFromStage);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            MainMenuWindowPlayerInfo._watcherSetupUtil = _arg1;
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
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            var _local2:PerspectiveProjection = new PerspectiveProjection();
            _local2.fieldOfView = 55;
            _local2.projectionCenter = new Point((width / 2), (height / 2));
            this.transform.perspectiveProjection = _local2;
        }
        public function setUserInfo():void{
            if (!this.creationHasComplete){
                return;
            };
            this.userLevel.text = ("等级：" + UserObject.level);
            this.userScore.text = ("积分：" + UserObject.remainScore);
            this.userMoney.text = ("金币：" + UserObject.money);
            this.userCardNum.text = ("卡牌总数：" + UserObject.allCardsNum);
            this.userBasicCard.text = ("初始卡组：" + UserObject.camp);
            this.userExp.setValue(UserObject.allScore, UserObject.getLevelUpScore(UserObject.level));
            this.userName.text = UserObject.name;
            this.playerHead.source = (("source/userHead/" + UserObject.headIcon) + ".jpg");
        }
        public function clearUserInfo():void{
            this.playerHead.source = null;
            this.userName.text = null;
            this.userLevel.text = "";
            this.userScore.text = "";
            this.userCardNum.text = "";
            this.userBasicCard.text = "";
            this.userExp.reset();
        }
        private function playerCardMouseDownHandler():void{
            this.moveEffect.stop();
            this.playerCard.startDrag();
            MouseMgr.getInstance().setCursor("drag");
            this.playerCard.addEventListener(MouseEvent.MOUSE_UP, this.playerCardMouseUpHandler);
            addEventListener(Event.ENTER_FRAME, this.checkDistance);
        }
        private function cleanAction():void{
            removeEventListener(Event.ENTER_FRAME, this.checkDistance);
            this.playerCard.removeEventListener(MouseEvent.MOUSE_UP, this.playerCardMouseUpHandler);
            this.playerCard.stopDrag();
            MouseMgr.getInstance().clearCursor("drag");
        }
        private function playerCardMouseUpHandler(_arg1:MouseEvent):void{
            this.cleanAction();
            this.moveEffect.play();
        }
        private function checkDistance(_arg1:Event):void{
            var _local4:BreakPiecesEffect;
            var _local2:Number = ((mouseX - this.playerCardXPos) - (this.playerCard.width / 2));
            var _local3:Number = ((mouseY - this.playerCardYPos) - (this.playerCard.height / 2));
            if (((_local2 * _local2) + (_local3 * _local3)) > 400000){
                this.cleanAction();
                _local4 = new BreakPiecesEffect(this.playerCard, 2000, 8, 6);
                _local4.initSpeedArg = 30;
                _local4.ySpeedArg = 1;
                _local4.rotateArg = 6;
                _local4.play();
                _local4.addEventListener(CustomEffectEvent.END, this.breakPiecesEffectEndHandler);
                this.playerCard.visible = false;
            };
        }
        private function breakPiecesEffectEndHandler(_arg1:CustomEffectEvent):void{
            (_arg1.currentTarget as BreakPiecesEffect).removeEventListener(CustomEffectEvent.END, this.breakPiecesEffectEndHandler);
            var _local2:FoldEffect = new FoldEffect(this.playerCard, 100, 8, 6);
            _local2.effectContainer.x = this.playerCardXPos;
            _local2.effectContainer.y = this.playerCardYPos;
            _local2.play();
            _local2.addEventListener(CustomEffectEvent.END, this.foldEffectEndHandler);
        }
        private function foldEffectEndHandler(_arg1:CustomEffectEvent):void{
            (_arg1.currentTarget as FoldEffect).removeEventListener(CustomEffectEvent.END, this.foldEffectEndHandler);
            this.playerCard.visible = true;
            this.playerCard.x = this.playerCardXPos;
            this.playerCard.y = this.playerCardYPos;
        }
        protected function group1_addedToStageHandler(_arg1:Event):void{
            UserPropertyChangeEventDispatcher.getInstance().addEventListener(UserPropertyChangeEventDispatcher.ALL_CARD_CHANGED, this.refresh);
            UserPropertyChangeEventDispatcher.getInstance().addEventListener(UserPropertyChangeEventDispatcher.MONEY_CHANGED, this.refresh);
            UserPropertyChangeEventDispatcher.getInstance().addEventListener(UserPropertyChangeEventDispatcher.SCORE_CHANGED, this.refresh);
        }
        protected function refresh(_arg1:Event):void{
            this.setUserInfo();
        }
        protected function group1_removedFromStageHandler(_arg1:Event):void{
            UserPropertyChangeEventDispatcher.getInstance().removeEventListener(UserPropertyChangeEventDispatcher.ALL_CARD_CHANGED, this.refresh);
            UserPropertyChangeEventDispatcher.getInstance().removeEventListener(UserPropertyChangeEventDispatcher.MONEY_CHANGED, this.refresh);
            UserPropertyChangeEventDispatcher.getInstance().removeEventListener(UserPropertyChangeEventDispatcher.SCORE_CHANGED, this.refresh);
        }
        private function _MainMenuWindowPlayerInfo_Elastic1_i():Elastic{
            var _local1:Elastic = new Elastic();
            this.elasticEasing = _local1;
            BindingManager.executeBindings(this, "elasticEasing", this.elasticEasing);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_Move1_i():Move{
            var _local1:Move = new Move();
            _local1.duration = 1000;
            this.moveEffect = _local1;
            BindingManager.executeBindings(this, "moveEffect", this.moveEffect);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_MetalFrameWith4Sign1_c():MetalFrameWith4Sign{
            var _local1:MetalFrameWith4Sign = new MetalFrameWith4Sign();
            _local1.x = 11;
            _local1.y = 21;
            _local1.topSignVisible = false;
            _local1.width = 360;
            _local1.height = 240;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 132;
            _local1.y = 31;
            _local1.source = this._embed_mxml_source_commonUI______png_2111310210;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_GrayLine1_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 210;
            _local1.y = 111;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_GrayLine2_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 210;
            _local1.y = 146;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_GrayLine3_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 210;
            _local1.y = 181;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_GrayLine4_c():GrayLine{
            var _local1:GrayLine = new GrayLine();
            _local1.x = 210;
            _local1.y = 216;
            _local1.width = 110;
            _local1.height = 3;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 210;
            _local1.y = 67;
            _local1.id = "userLevel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userLevel = _local1;
            BindingManager.executeBindings(this, "userLevel", this.userLevel);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_ExpBar1_i():ExpBar{
            var _local1:ExpBar = new ExpBar();
            _local1.x = 210;
            _local1.y = 85;
            _local1.width = 125;
            _local1.id = "userExp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userExp = _local1;
            BindingManager.executeBindings(this, "userExp", this.userExp);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 210;
            _local1.y = 124;
            _local1.id = "userScore";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userScore = _local1;
            BindingManager.executeBindings(this, "userScore", this.userScore);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 210;
            _local1.y = 159;
            _local1.id = "userMoney";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userMoney = _local1;
            BindingManager.executeBindings(this, "userMoney", this.userMoney);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_Label4_i():Label{
            var _local1:Label = new Label();
            _local1.x = 210;
            _local1.y = 194;
            _local1.id = "userCardNum";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userCardNum = _local1;
            BindingManager.executeBindings(this, "userCardNum", this.userCardNum);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_Label5_i():Label{
            var _local1:Label = new Label();
            _local1.x = 210;
            _local1.y = 229;
            _local1.id = "userBasicCard";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userBasicCard = _local1;
            BindingManager.executeBindings(this, "userBasicCard", this.userBasicCard);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.width = 155;
            _local1.height = 169;
            _local1.mxmlContent = [this._MainMenuWindowPlayerInfo_MyImage1_i(), this._MainMenuWindowPlayerInfo_CommonHeadImageFrameDown1_i(), this._MainMenuWindowPlayerInfo_CommonHeadImageFrame1_i(), this._MainMenuWindowPlayerInfo_Label6_i()];
            _local1.addEventListener("mouseDown", this.__playerCard_mouseDown);
            _local1.id = "playerCard";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerCard = _local1;
            BindingManager.executeBindings(this, "playerCard", this.playerCard);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 4.5;
            _local1.y = 5;
            _local1.width = 145;
            _local1.height = 145;
            _local1.id = "playerHead";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerHead = _local1;
            BindingManager.executeBindings(this, "playerHead", this.playerHead);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_CommonHeadImageFrameDown1_i():CommonHeadImageFrameDown{
            var _local1:CommonHeadImageFrameDown = new CommonHeadImageFrameDown();
            _local1.x = 5.5;
            _local1.y = 152;
            _local1.id = "_MainMenuWindowPlayerInfo_CommonHeadImageFrameDown1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._MainMenuWindowPlayerInfo_CommonHeadImageFrameDown1 = _local1;
            BindingManager.executeBindings(this, "_MainMenuWindowPlayerInfo_CommonHeadImageFrameDown1", this._MainMenuWindowPlayerInfo_CommonHeadImageFrameDown1);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_CommonHeadImageFrame1_i():CommonHeadImageFrame{
            var _local1:CommonHeadImageFrame = new CommonHeadImageFrame();
            _local1.id = "_MainMenuWindowPlayerInfo_CommonHeadImageFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._MainMenuWindowPlayerInfo_CommonHeadImageFrame1 = _local1;
            BindingManager.executeBindings(this, "_MainMenuWindowPlayerInfo_CommonHeadImageFrame1", this._MainMenuWindowPlayerInfo_CommonHeadImageFrame1);
            return (_local1);
        }
        private function _MainMenuWindowPlayerInfo_Label6_i():Label{
            var _local1:Label = new Label();
            _local1.x = 5.5;
            _local1.y = 157;
            _local1.width = 142;
            _local1.setStyle("color", 14337414);
            _local1.setStyle("textAlign", "center");
            _local1.id = "userName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userName = _local1;
            BindingManager.executeBindings(this, "userName", this.userName);
            return (_local1);
        }
        public function __playerCard_mouseDown(_arg1:MouseEvent):void{
            this.playerCardMouseDownHandler();
        }
        public function ___MainMenuWindowPlayerInfo_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function ___MainMenuWindowPlayerInfo_Group1_click(_arg1:MouseEvent):void{
            UserDetailInfoWindow.autoShowHideWindow();
        }
        public function ___MainMenuWindowPlayerInfo_Group1_addedToStage(_arg1:Event):void{
            this.group1_addedToStageHandler(_arg1);
        }
        public function ___MainMenuWindowPlayerInfo_Group1_removedFromStage(_arg1:Event):void{
            this.group1_removedFromStageHandler(_arg1);
        }
        private function _MainMenuWindowPlayerInfo_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, null, "moveEffect.easer", "elasticEasing");
            result[1] = new Binding(this, function ():Number{
                return (playerCardXPos);
            }, null, "moveEffect.xTo");
            result[2] = new Binding(this, function ():Number{
                return (playerCardYPos);
            }, null, "moveEffect.yTo");
            result[3] = new Binding(this, null, null, "moveEffect.target", "playerCard");
            result[4] = new Binding(this, function ():Number{
                return (playerCardXPos);
            }, null, "playerCard.x");
            result[5] = new Binding(this, function ():Number{
                return (playerCardYPos);
            }, null, "playerCard.y");
            result[6] = new Binding(this, function ():Array{
                var _local1:* = [144, 27];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_MainMenuWindowPlayerInfo_CommonHeadImageFrameDown1.size");
            result[7] = new Binding(this, function ():Array{
                var _local1:* = [155, 156];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_MainMenuWindowPlayerInfo_CommonHeadImageFrame1.size");
            return (result);
        }
        public function get elasticEasing():Elastic{
            return (this._989505632elasticEasing);
        }
        public function set elasticEasing(_arg1:Elastic):void{
            var _local2:Object = this._989505632elasticEasing;
            if (_local2 !== _arg1){
                this._989505632elasticEasing = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "elasticEasing", _local2, _arg1));
                };
            };
        }
        public function get moveEffect():Move{
            return (this._1994587966moveEffect);
        }
        public function set moveEffect(_arg1:Move):void{
            var _local2:Object = this._1994587966moveEffect;
            if (_local2 !== _arg1){
                this._1994587966moveEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveEffect", _local2, _arg1));
                };
            };
        }
        public function get playerCard():Group{
            return (this._2095329681playerCard);
        }
        public function set playerCard(_arg1:Group):void{
            var _local2:Object = this._2095329681playerCard;
            if (_local2 !== _arg1){
                this._2095329681playerCard = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerCard", _local2, _arg1));
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

    }
}//package normal_window 
