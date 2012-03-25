//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
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
    import source_manager.*;
    import web_service.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import custom_effect.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import combat_element_script.*;
    import beginner_guide.*;
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

    public class GuideMapWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        public static var lastShowCurtain:int = -1;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _3034452btn0:ClickScaleButton;
        private var _3034453btn1:ClickScaleButton;
        private var _3034454btn2:ClickScaleButton;
        private var _3034455btn3:ClickScaleButton;
        private var _3034456btn4:ClickScaleButton;
        private var _2002721788btnGroupfadeIn:Fade;
        private var _1781625235buttonGroup:Group;
        private var _1282133823fadeIn:Fade;
        private var _1081398073mapImg:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        protected var openInfo:Object;
        protected var completeInfo:Object;
        private var _702972858guide2UnLock:Boolean = false;
        private var _1590476539guide3UnLock:Boolean = false;
        private var _1816987076guide4UnLock:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function GuideMapWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GuideMapWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_guide_GuideMapWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (GuideMapWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.layout = this._GuideMapWindow_BasicLayout1_c();
            this.mxmlContent = [this._GuideMapWindow_SmoothBitmapImage1_i()];
            this._GuideMapWindow_Fade2_i();
            this._GuideMapWindow_Group2_i();
            this._GuideMapWindow_Fade1_i();
            this.addEventListener("initialize", this.___GuideMapWindow_Group1_initialize);
            this.addEventListener("creationComplete", this.___GuideMapWindow_Group1_creationComplete);
            this.addEventListener("remove", this.___GuideMapWindow_Group1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function checkCompleteCurtain(_arg1:int):void{
            var _local2:Array;
            if (!UserObject.isBeginnerGuideUser){
                _local2 = [GuideMapWindowCurtain0.LAST_GUIDE_SECTION_ID, GuideMapWindowCurtain1.LAST_GUIDE_SECTION_ID, GuideMapWindowCurtain2.LAST_GUIDE_SECTION_ID, GuideMapWindowCurtain3.LAST_GUIDE_SECTION_ID, GuideMapWindowCurtain4.LAST_GUIDE_SECTION_ID];
                if (_local2.indexOf(_arg1) != -1){
                    lastShowCurtain = -1;
                };
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GuideMapWindow._watcherSetupUtil = _arg1;
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
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.mapImg.source = GuideMapWindowSourceMgr.getInstance().getSourceClass("mainMap");
        }
        protected function fadeIn_effectEndHandler():void{
            BasicOperationBar.getInstance().registerLeaveFunc(this.leaveFunc);
            mouseChildren = true;
            this.openInfo = UserObject.campaignOpenInfo;
            this.completeInfo = UserObject.campaignCompleteInfo;
            if (lastShowCurtain == -1){
                if (this.completeInfo[GuideMapWindowCurtain0.LAST_GUIDE_SECTION_ID]){
                    this.guide2UnLock = !((this.completeInfo[GuideMapWindowCurtain1.LAST_GUIDE_SECTION_ID] == null));
                    this.guide3UnLock = !((this.completeInfo[GuideMapWindowCurtain2.LAST_GUIDE_SECTION_ID] == null));
                    this.guide4UnLock = !((this.completeInfo[GuideMapWindowCurtain3.LAST_GUIDE_SECTION_ID] == null));
                    addElement(this.buttonGroup);
                } else {
                    this.showGuideCurtain(0);
                };
            } else {
                this.showGuideCurtain(lastShowCurtain);
            };
        }
        protected function group1_removeHandler():void{
            var _local1:FakeFadeEffect = new FakeFadeEffect(this, 500, 1, 0);
            _local1.play();
        }
        private function leaveFunc():void{
            BasicOperationBar.getInstance().clearLeaveFunc(this.leaveFunc);
            if (!parent){
                return;
            };
            TCGClient.getInstance().enterMainMenu();
        }
        protected function selectGuideCurtrain(_arg1:int):void{
            this.removeButtonGroup();
            this.showGuideCurtain(_arg1);
        }
        private function removeButtonGroup():void{
            var _local2:FakeFadeEffect;
            var _local1:* = this.buttonGroup.parent;
            if (_local1){
                _local2 = new FakeFadeEffect(this.buttonGroup, 300, 1, 0);
                _local2.play();
                _local1.removeElement(this.buttonGroup);
            };
        }
        private function showGuideCurtain(_arg1:int):void{
            var _local2:GuideMapWindowCurtainBase;
            lastShowCurtain = _arg1;
            switch (_arg1){
                case 0:
                    _local2 = new GuideMapWindowCurtain0();
                    break;
                case 1:
                    _local2 = new GuideMapWindowCurtain1();
                    break;
                case 2:
                    _local2 = new GuideMapWindowCurtain2();
                    break;
                case 3:
                    _local2 = new GuideMapWindowCurtain3();
                    break;
                case 4:
                    _local2 = new GuideMapWindowCurtain4();
                    break;
                default:
                    _local2 = new GuideMapWindowCurtain0();
            };
            _local2.setGuideInfo(this.openInfo, this.completeInfo);
            addElement(_local2);
        }
        private function _GuideMapWindow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 300;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectEnd", this.__btnGroupfadeIn_effectEnd);
            this.btnGroupfadeIn = _local1;
            BindingManager.executeBindings(this, "btnGroupfadeIn", this.btnGroupfadeIn);
            return (_local1);
        }
        public function __btnGroupfadeIn_effectEnd(_arg1:EffectEvent):void{
            BeginnerGuideUtil.dispatchLuaEvent("guideMapBtnAdd");
        }
        private function _GuideMapWindow_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.width = 0x0500;
            _local1.height = 800;
            _local1.mxmlContent = [this._GuideMapWindow_Rect1_c(), this._GuideMapWindow_VGroup1_c()];
            _local1.id = "buttonGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.buttonGroup = _local1;
            BindingManager.executeBindings(this, "buttonGroup", this.buttonGroup);
            return (_local1);
        }
        private function _GuideMapWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.fill = this._GuideMapWindow_SolidColor1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapWindow_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            _local1.alpha = 0.6;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapWindow_VGroup1_c():VGroup{
            var _local1:VGroup = new VGroup();
            _local1.gap = 30;
            _local1.horizontalCenter = 0;
            _local1.verticalCenter = 0;
            _local1.filters = [this._GuideMapWindow_DropShadowFilter1_c()];
            _local1.mxmlContent = [this._GuideMapWindow_ClickScaleButton1_i(), this._GuideMapWindow_ClickScaleButton2_i(), this._GuideMapWindow_ClickScaleButton3_i(), this._GuideMapWindow_ClickScaleButton4_i(), this._GuideMapWindow_ClickScaleButton5_i()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.color = 0;
            _local1.distance = 5;
            _local1.alpha = 0.7;
            _local1.quality = 4;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapWindow_ClickScaleButton1_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.buttonMode = true;
            _local1.addEventListener("click", this.__btn0_click);
            _local1.addEventListener("initialize", this.__btn0_initialize);
            _local1.id = "btn0";
            if (!_local1.document){
                _local1.document = this;
            };
            this.btn0 = _local1;
            BindingManager.executeBindings(this, "btn0", this.btn0);
            return (_local1);
        }
        public function __btn0_click(_arg1:MouseEvent):void{
            this.selectGuideCurtrain(0);
        }
        public function __btn0_initialize(_arg1:FlexEvent):void{
            this.btn0.buttonImage = GuideMapWindowSourceMgr.getInstance().getSourceClass("curtainBtnImg0");
        }
        private function _GuideMapWindow_ClickScaleButton2_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.buttonMode = true;
            _local1.addEventListener("click", this.__btn1_click);
            _local1.addEventListener("initialize", this.__btn1_initialize);
            _local1.id = "btn1";
            if (!_local1.document){
                _local1.document = this;
            };
            this.btn1 = _local1;
            BindingManager.executeBindings(this, "btn1", this.btn1);
            return (_local1);
        }
        public function __btn1_click(_arg1:MouseEvent):void{
            this.selectGuideCurtrain(1);
        }
        public function __btn1_initialize(_arg1:FlexEvent):void{
            this.btn1.buttonImage = GuideMapWindowSourceMgr.getInstance().getSourceClass("curtainBtnImg1");
        }
        private function _GuideMapWindow_ClickScaleButton3_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.buttonMode = true;
            _local1.addEventListener("click", this.__btn2_click);
            _local1.addEventListener("initialize", this.__btn2_initialize);
            _local1.id = "btn2";
            if (!_local1.document){
                _local1.document = this;
            };
            this.btn2 = _local1;
            BindingManager.executeBindings(this, "btn2", this.btn2);
            return (_local1);
        }
        public function __btn2_click(_arg1:MouseEvent):void{
            this.selectGuideCurtrain(2);
        }
        public function __btn2_initialize(_arg1:FlexEvent):void{
            this.btn2.buttonImage = GuideMapWindowSourceMgr.getInstance().getSourceClass("curtainBtnImg2");
        }
        private function _GuideMapWindow_ClickScaleButton4_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.buttonMode = true;
            _local1.addEventListener("click", this.__btn3_click);
            _local1.addEventListener("initialize", this.__btn3_initialize);
            _local1.id = "btn3";
            if (!_local1.document){
                _local1.document = this;
            };
            this.btn3 = _local1;
            BindingManager.executeBindings(this, "btn3", this.btn3);
            return (_local1);
        }
        public function __btn3_click(_arg1:MouseEvent):void{
            this.selectGuideCurtrain(3);
        }
        public function __btn3_initialize(_arg1:FlexEvent):void{
            this.btn3.buttonImage = GuideMapWindowSourceMgr.getInstance().getSourceClass("curtainBtnImg3");
        }
        private function _GuideMapWindow_ClickScaleButton5_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.buttonMode = true;
            _local1.addEventListener("click", this.__btn4_click);
            _local1.addEventListener("initialize", this.__btn4_initialize);
            _local1.id = "btn4";
            if (!_local1.document){
                _local1.document = this;
            };
            this.btn4 = _local1;
            BindingManager.executeBindings(this, "btn4", this.btn4);
            return (_local1);
        }
        public function __btn4_click(_arg1:MouseEvent):void{
            this.selectGuideCurtrain(4);
        }
        public function __btn4_initialize(_arg1:FlexEvent):void{
            this.btn4.buttonImage = GuideMapWindowSourceMgr.getInstance().getSourceClass("curtainBtnImg4");
        }
        private function _GuideMapWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.startDelay = 500;
            _local1.duration = 300;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectEnd", this.__fadeIn_effectEnd);
            this.fadeIn = _local1;
            BindingManager.executeBindings(this, "fadeIn", this.fadeIn);
            return (_local1);
        }
        public function __fadeIn_effectEnd(_arg1:EffectEvent):void{
            this.fadeIn_effectEndHandler();
        }
        private function _GuideMapWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapWindow_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "mapImg");
            this.mapImg = _local1;
            BindingManager.executeBindings(this, "mapImg", this.mapImg);
            return (_local1);
        }
        public function ___GuideMapWindow_Group1_initialize(_arg1:FlexEvent):void{
            alpha = 0;
            mouseChildren = false;
        }
        public function ___GuideMapWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function ___GuideMapWindow_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler();
        }
        private function _GuideMapWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeIn");
            result[1] = new Binding(this, null, null, "btnGroupfadeIn.target", "buttonGroup");
            result[2] = new Binding(this, null, function (_arg1):void{
                buttonGroup.setStyle("addedEffect", _arg1);
            }, "buttonGroup.addedEffect", "btnGroupfadeIn");
            result[3] = new Binding(this, function ():Boolean{
                return (guide2UnLock);
            }, null, "btn2.enabled");
            result[4] = new Binding(this, function ():Boolean{
                return (guide3UnLock);
            }, null, "btn3.enabled");
            result[5] = new Binding(this, function ():Boolean{
                return (guide4UnLock);
            }, null, "btn4.enabled");
            return (result);
        }
        public function get btn0():ClickScaleButton{
            return (this._3034452btn0);
        }
        public function set btn0(_arg1:ClickScaleButton):void{
            var _local2:Object = this._3034452btn0;
            if (_local2 !== _arg1){
                this._3034452btn0 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn0", _local2, _arg1));
                };
            };
        }
        public function get btn1():ClickScaleButton{
            return (this._3034453btn1);
        }
        public function set btn1(_arg1:ClickScaleButton):void{
            var _local2:Object = this._3034453btn1;
            if (_local2 !== _arg1){
                this._3034453btn1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn1", _local2, _arg1));
                };
            };
        }
        public function get btn2():ClickScaleButton{
            return (this._3034454btn2);
        }
        public function set btn2(_arg1:ClickScaleButton):void{
            var _local2:Object = this._3034454btn2;
            if (_local2 !== _arg1){
                this._3034454btn2 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn2", _local2, _arg1));
                };
            };
        }
        public function get btn3():ClickScaleButton{
            return (this._3034455btn3);
        }
        public function set btn3(_arg1:ClickScaleButton):void{
            var _local2:Object = this._3034455btn3;
            if (_local2 !== _arg1){
                this._3034455btn3 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn3", _local2, _arg1));
                };
            };
        }
        public function get btn4():ClickScaleButton{
            return (this._3034456btn4);
        }
        public function set btn4(_arg1:ClickScaleButton):void{
            var _local2:Object = this._3034456btn4;
            if (_local2 !== _arg1){
                this._3034456btn4 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn4", _local2, _arg1));
                };
            };
        }
        public function get btnGroupfadeIn():Fade{
            return (this._2002721788btnGroupfadeIn);
        }
        public function set btnGroupfadeIn(_arg1:Fade):void{
            var _local2:Object = this._2002721788btnGroupfadeIn;
            if (_local2 !== _arg1){
                this._2002721788btnGroupfadeIn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnGroupfadeIn", _local2, _arg1));
                };
            };
        }
        public function get buttonGroup():Group{
            return (this._1781625235buttonGroup);
        }
        public function set buttonGroup(_arg1:Group):void{
            var _local2:Object = this._1781625235buttonGroup;
            if (_local2 !== _arg1){
                this._1781625235buttonGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buttonGroup", _local2, _arg1));
                };
            };
        }
        public function get fadeIn():Fade{
            return (this._1282133823fadeIn);
        }
        public function set fadeIn(_arg1:Fade):void{
            var _local2:Object = this._1282133823fadeIn;
            if (_local2 !== _arg1){
                this._1282133823fadeIn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeIn", _local2, _arg1));
                };
            };
        }
        public function get mapImg():SmoothBitmapImage{
            return (this._1081398073mapImg);
        }
        public function set mapImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1081398073mapImg;
            if (_local2 !== _arg1){
                this._1081398073mapImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mapImg", _local2, _arg1));
                };
            };
        }
        private function get guide2UnLock():Boolean{
            return (this._702972858guide2UnLock);
        }
        private function set guide2UnLock(_arg1:Boolean):void{
            var _local2:Object = this._702972858guide2UnLock;
            if (_local2 !== _arg1){
                this._702972858guide2UnLock = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guide2UnLock", _local2, _arg1));
                };
            };
        }
        private function get guide3UnLock():Boolean{
            return (this._1590476539guide3UnLock);
        }
        private function set guide3UnLock(_arg1:Boolean):void{
            var _local2:Object = this._1590476539guide3UnLock;
            if (_local2 !== _arg1){
                this._1590476539guide3UnLock = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guide3UnLock", _local2, _arg1));
                };
            };
        }
        private function get guide4UnLock():Boolean{
            return (this._1816987076guide4UnLock);
        }
        private function set guide4UnLock(_arg1:Boolean):void{
            var _local2:Object = this._1816987076guide4UnLock;
            if (_local2 !== _arg1){
                this._1816987076guide4UnLock = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guide4UnLock", _local2, _arg1));
                };
            };
        }

    }
}//package task_guide 
