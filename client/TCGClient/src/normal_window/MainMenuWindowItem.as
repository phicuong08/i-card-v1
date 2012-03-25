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
    import flash.system.*;
    import flash.media.*;
    import __AS3__.vec.*;
    import source_manager.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import SoundSystem.*;
    import flash.utils.*;
    import spark.effects.animation.*;
    import flash.accessibility.*;
    import mx.filters.*;
	import mx.effects.Sequence;
    import flash.ui.*;
    import tool.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;
	use namespace mx_internal;
    public class MainMenuWindowItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _MainMenuWindowItem_Label1:Label;
        public var _MainMenuWindowItem_SmoothBitmapImage1:SmoothBitmapImage;
        private var _599691451colorFilter:ColorMatrixFilter;
        private var _1178662216itemBg:SmoothBitmapImage;
        private var _273241018mainGroup:Group;
        private var _1845177213newSign:SmoothBitmapImage;
        private var _448593538rollOutEffect:Animate;
        private var _820078622rollOverEffect:Animate;
        private var _988719247showNewSignEffect:Sequence;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _553912979cardImg:Object;
        private var _82271676_cardText:String;
        private var _945616586_newSignFlag:Boolean = false;
        private var _embed_mxml_source_commonUI_new_flag_png_1013362274:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function MainMenuWindowItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI_new_flag_png_1013362274 = MainMenuWindowItem__embed_mxml_source_commonUI_new_flag_png_1013362274;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._MainMenuWindowItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_MainMenuWindowItemWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (MainMenuWindowItem[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 158;
            this.height = 213;
            this.transformX = 79;
            this.transformY = 106.5;
            this.layout = this._MainMenuWindowItem_BasicLayout1_c();
            this.filters = [this._MainMenuWindowItem_ColorMatrixFilter1_i()];
            this.mxmlContent = [this._MainMenuWindowItem_Group2_i()];
            this._MainMenuWindowItem_Animate2_i();
            this._MainMenuWindowItem_Animate1_i();
            this._MainMenuWindowItem_Sequence1_i();
            this.addEventListener("mouseDown", this.___MainMenuWindowItem_Group1_mouseDown);
            this.addEventListener("rollOver", this.___MainMenuWindowItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___MainMenuWindowItem_Group1_rollOut);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            MainMenuWindowItem._watcherSetupUtil = _arg1;
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
        public function set cardImage(_arg1:Object):void{
            this.cardImg = _arg1;
        }
        public function set newSignFlag(_arg1:Boolean):void{
            if (_arg1 == this._newSignFlag){
                return;
            };
            this._newSignFlag = _arg1;
            if (_arg1){
                this.showNewSignEffect.play();
            };
        }
        public function set cardText(_arg1:String):void{
            this._cardText = _arg1;
        }
        protected function rollOverHandler():void{
            SoundMgr.getInstance().playEffectSound("item_weapon");
            this.colorFilter.matrix = ColorUtil.getColorMatrixByBrightness(0.3);
            this.rollOverEffect.play();
        }
        protected function rollOutHandler():void{
            this.colorFilter.matrix = ColorUtil.getColorMatrixByBrightness(0);
            this.rollOutEffect.play();
        }
        private function _MainMenuWindowItem_Animate2_i():Animate{
            var _local1:Animate = new Animate();
            _local1.duration = 200;
            new Vector.<MotionPath>(2)[0] = this._MainMenuWindowItem_SimpleMotionPath3_c();
            new Vector.<MotionPath>(2)[1] = this._MainMenuWindowItem_SimpleMotionPath4_c();
            _local1.motionPaths = new Vector.<MotionPath>(2);
            this.rollOutEffect = _local1;
            BindingManager.executeBindings(this, "rollOutEffect", this.rollOutEffect);
            return (_local1);
        }
        private function _MainMenuWindowItem_SimpleMotionPath3_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "x";
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowItem_SimpleMotionPath4_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "y";
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowItem_Animate1_i():Animate{
            var _local1:Animate = new Animate();
            _local1.duration = 200;
            new Vector.<MotionPath>(2)[0] = this._MainMenuWindowItem_SimpleMotionPath1_c();
            new Vector.<MotionPath>(2)[1] = this._MainMenuWindowItem_SimpleMotionPath2_c();
            _local1.motionPaths = new Vector.<MotionPath>(2);
            this.rollOverEffect = _local1;
            BindingManager.executeBindings(this, "rollOverEffect", this.rollOverEffect);
            return (_local1);
        }
        private function _MainMenuWindowItem_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "x";
            _local1.valueTo = -3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowItem_SimpleMotionPath2_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "y";
            _local1.valueTo = -3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowItem_Sequence1_i():Sequence{
            var _local1:Sequence = new Sequence();
            _local1.children = [this._MainMenuWindowItem_Fade1_c(), this._MainMenuWindowItem_AnimateFilter1_c()];
            this.showNewSignEffect = _local1;
            BindingManager.executeBindings(this, "showNewSignEffect", this.showNewSignEffect);
            return (_local1);
        }
        private function _MainMenuWindowItem_Fade1_c():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 300;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowItem_AnimateFilter1_c():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 1000;
            _local1.bitmapFilter = this._MainMenuWindowItem_GlowFilter1_c();
            new Vector.<MotionPath>(3)[0] = this._MainMenuWindowItem_SimpleMotionPath5_c();
            new Vector.<MotionPath>(3)[1] = this._MainMenuWindowItem_SimpleMotionPath6_c();
            new Vector.<MotionPath>(3)[2] = this._MainMenuWindowItem_SimpleMotionPath7_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowItem_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF0000;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowItem_SimpleMotionPath5_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 1;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowItem_SimpleMotionPath6_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowItem_SimpleMotionPath7_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindowItem_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this.colorFilter = _local1;
            BindingManager.executeBindings(this, "colorFilter", this.colorFilter);
            return (_local1);
        }
        private function _MainMenuWindowItem_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.mxmlContent = [this._MainMenuWindowItem_SmoothBitmapImage1_i(), this._MainMenuWindowItem_SmoothBitmapImage2_i(), this._MainMenuWindowItem_Label1_i(), this._MainMenuWindowItem_SmoothBitmapImage3_i()];
            _local1.addEventListener("creationComplete", this.__mainGroup_creationComplete);
            _local1.id = "mainGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.mainGroup = _local1;
            BindingManager.executeBindings(this, "mainGroup", this.mainGroup);
            return (_local1);
        }
        private function _MainMenuWindowItem_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 17;
            _local1.y = 39;
            _local1.initialized(this, "_MainMenuWindowItem_SmoothBitmapImage1");
            this._MainMenuWindowItem_SmoothBitmapImage1 = _local1;
            BindingManager.executeBindings(this, "_MainMenuWindowItem_SmoothBitmapImage1", this._MainMenuWindowItem_SmoothBitmapImage1);
            return (_local1);
        }
        private function _MainMenuWindowItem_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "itemBg");
            this.itemBg = _local1;
            BindingManager.executeBindings(this, "itemBg", this.itemBg);
            return (_local1);
        }
        private function _MainMenuWindowItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.y = 168;
            _local1.width = 158;
            _local1.setStyle("fontSize", 16);
            _local1.setStyle("color", 16710646);
            _local1.setStyle("textAlign", "center");
            _local1.id = "_MainMenuWindowItem_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._MainMenuWindowItem_Label1 = _local1;
            BindingManager.executeBindings(this, "_MainMenuWindowItem_Label1", this._MainMenuWindowItem_Label1);
            return (_local1);
        }
        private function _MainMenuWindowItem_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 22;
            _local1.y = 22;
            _local1.source = this._embed_mxml_source_commonUI_new_flag_png_1013362274;
            _local1.initialized(this, "newSign");
            this.newSign = _local1;
            BindingManager.executeBindings(this, "newSign", this.newSign);
            return (_local1);
        }
        public function __mainGroup_creationComplete(_arg1:FlexEvent):void{
            this.itemBg.source = MainMenuWindowSourceMgr.getInstance().getSourceClass("cardMenu");
        }
        public function ___MainMenuWindowItem_Group1_mouseDown(_arg1:MouseEvent):void{
            SoundMgr.getInstance().playEffectSound("click_3");
        }
        public function ___MainMenuWindowItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.rollOverHandler();
        }
        public function ___MainMenuWindowItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.rollOutHandler();
        }
        private function _MainMenuWindowItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, null, "rollOverEffect.target", "mainGroup");
            result[1] = new Binding(this, null, null, "rollOutEffect.target", "mainGroup");
            result[2] = new Binding(this, null, null, "showNewSignEffect.target", "newSign");
            result[3] = new Binding(this, function ():Object{
                return (cardImg);
            }, null, "_MainMenuWindowItem_SmoothBitmapImage1.source");
            result[4] = new Binding(this, function ():String{
                var _local1:* = _cardText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_MainMenuWindowItem_Label1.text");
            result[5] = new Binding(this, null, null, "newSign.visible", "_newSignFlag");
            return (result);
        }
        public function get colorFilter():ColorMatrixFilter{
            return (this._599691451colorFilter);
        }
        public function set colorFilter(_arg1:ColorMatrixFilter):void{
            var _local2:Object = this._599691451colorFilter;
            if (_local2 !== _arg1){
                this._599691451colorFilter = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorFilter", _local2, _arg1));
                };
            };
        }
        public function get itemBg():SmoothBitmapImage{
            return (this._1178662216itemBg);
        }
        public function set itemBg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1178662216itemBg;
            if (_local2 !== _arg1){
                this._1178662216itemBg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemBg", _local2, _arg1));
                };
            };
        }
        public function get mainGroup():Group{
            return (this._273241018mainGroup);
        }
        public function set mainGroup(_arg1:Group):void{
            var _local2:Object = this._273241018mainGroup;
            if (_local2 !== _arg1){
                this._273241018mainGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainGroup", _local2, _arg1));
                };
            };
        }
        public function get newSign():SmoothBitmapImage{
            return (this._1845177213newSign);
        }
        public function set newSign(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1845177213newSign;
            if (_local2 !== _arg1){
                this._1845177213newSign = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newSign", _local2, _arg1));
                };
            };
        }
        public function get rollOutEffect():Animate{
            return (this._448593538rollOutEffect);
        }
        public function set rollOutEffect(_arg1:Animate):void{
            var _local2:Object = this._448593538rollOutEffect;
            if (_local2 !== _arg1){
                this._448593538rollOutEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rollOutEffect", _local2, _arg1));
                };
            };
        }
        public function get rollOverEffect():Animate{
            return (this._820078622rollOverEffect);
        }
        public function set rollOverEffect(_arg1:Animate):void{
            var _local2:Object = this._820078622rollOverEffect;
            if (_local2 !== _arg1){
                this._820078622rollOverEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rollOverEffect", _local2, _arg1));
                };
            };
        }
        public function get showNewSignEffect():Sequence{
            return (this._988719247showNewSignEffect);
        }
        public function set showNewSignEffect(_arg1:Sequence):void{
            var _local2:Object = this._988719247showNewSignEffect;
            if (_local2 !== _arg1){
                this._988719247showNewSignEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showNewSignEffect", _local2, _arg1));
                };
            };
        }
        private function get cardImg():Object{
            return (this._553912979cardImg);
        }
        private function set cardImg(_arg1:Object):void{
            var _local2:Object = this._553912979cardImg;
            if (_local2 !== _arg1){
                this._553912979cardImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardImg", _local2, _arg1));
                };
            };
        }
        private function get _cardText():String{
            return (this._82271676_cardText);
        }
        private function set _cardText(_arg1:String):void{
            var _local2:Object = this._82271676_cardText;
            if (_local2 !== _arg1){
                this._82271676_cardText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_cardText", _local2, _arg1));
                };
            };
        }
        public function get _newSignFlag():Boolean{
            return (this._945616586_newSignFlag);
        }
        public function set _newSignFlag(_arg1:Boolean):void{
            var _local2:Object = this._945616586_newSignFlag;
            if (_local2 !== _arg1){
                this._945616586_newSignFlag = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_newSignFlag", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
