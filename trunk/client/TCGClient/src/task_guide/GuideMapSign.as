//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import SoundSystem.*;
    
    import __AS3__.vec.*;
    
    import custom_control1.*;
    
    import flash.accessibility.*;
    import flash.debugger.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;
    
    import mx.binding.*;
    import mx.core.*;
//    import mx.effects.*;
	import mx.effects.Parallel;
	import mx.effects.Sequence;
    import mx.events.*;
    import mx.filters.*;
    import mx.styles.*;
    
    import source_manager.*;
    
    import spark.components.*;
    import spark.effects.*;
    import spark.effects.animation.*;
    import spark.filters.*;
    import spark.layouts.*;
    
    import tool.*;
    
    import ui_element.*;

	use namespace mx_internal;
    public class GuideMapSign extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _GuideMapSign_ColorMatrixFilter1:ColorMatrixFilter;
        public var _GuideMapSign_CommonHeadImageFrame1:CommonHeadImageFrame;
        private var _207684226glowEffect:AnimateFilter;
        private var _102727412label:Label;
        private var _718385373label_filter:GlowFilter;
        private var _1215907182passSign:SmoothBitmapImage;
        private var _1234104453scaleEffect:Scale;
        private var _2067269510showImg:MyImage;
        private var _915373822signGlowFilter:GlowFilter;
        private var _1530771443signInEffect:Sequence;
        private var _1159841921unknowSign:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _91291148_text:String;
        private var _2934532_img:String;
        private var _714582971grayFilter:Array;
        private var _active:Boolean = true;
        private var _840442044unlock:Boolean = true;
        public var disableTooltip:String = "？？？";
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function GuideMapSign(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GuideMapSign_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_guide_GuideMapSignWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                //return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 170;
            this.height = 170;
            this.mouseEnabled = false;
            this.transformX = 100;
            this.transformY = 95;
            this.layout = this._GuideMapSign_BasicLayout1_c();
            this.filters = [this._GuideMapSign_DropShadowFilter1_c()];
            this.mxmlContent = [this._GuideMapSign_MyImage1_i(), this._GuideMapSign_SmoothBitmapImage1_i(), this._GuideMapSign_Label1_i(), this._GuideMapSign_CommonHeadImageFrame1_i(), this._GuideMapSign_SmoothBitmapImage2_i()];
            this._GuideMapSign_AnimateFilter1_i();
            this._GuideMapSign_Scale1_i();
            this._GuideMapSign_Sequence1_i();
            this.addEventListener("mouseDown", this.___GuideMapSign_Group1_mouseDown);
            this.addEventListener("toolTipShow", this.___GuideMapSign_Group1_toolTipShow);
            this.addEventListener("creationComplete", this.___GuideMapSign_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GuideMapSign._watcherSetupUtil = _arg1;
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
            this.unknowSign.source = GuideMapWindowSourceMgr.getInstance().getSourceClass("unknowSign");
            this.passSign.source = GuideMapWindowSourceMgr.getInstance().getSourceClass("completeSign");
        }
        public function set active(_arg1:Boolean):void{
            this._active = _arg1;
            if (!_arg1){
                this.grayFilter = ColorUtil.getGrayColorMatrix();
            } else {
                this.grayFilter = ColorUtil.getColorMatrixByBrightness(0);
            };
        }
        public function get active():Boolean{
            return (this._active);
        }
        public function set text(_arg1:String):void{
            this._text = _arg1;
        }
        public function set img(_arg1:String):void{
            this._img = _arg1;
        }
        protected function mouseOverHandler():void{
            if (this._active){
                SoundMgr.getInstance().playEffectSound("click_4");
                this.scaleEffect.play();
                this.glowEffect.play();
            };
        }
        protected function mouseOutHandler():void{
            if (this._active){
                this.scaleEffect.play(null, true);
                this.glowEffect.end();
            };
        }
        public function showSign():void{
            this.passSign.visible = true;
            this.signInEffect.play();
        }
        protected function group1_toolTipShowHandler(_arg1:ToolTipEvent):void{
            var _local2:IToolTip;
            if (!this._active){
                _local2 = _arg1.toolTip;
                if (_local2){
                    _local2.text = this.disableTooltip;
                };
            };
        }
        private function _GuideMapSign_AnimateFilter1_i():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 1000;
            _local1.repeatCount = 0;
            _local1.bitmapFilter = this._GuideMapSign_GlowFilter1_c();
            new Vector.<MotionPath>(3)[0] = this._GuideMapSign_SimpleMotionPath1_c();
            new Vector.<MotionPath>(3)[1] = this._GuideMapSign_SimpleMotionPath2_c();
            new Vector.<MotionPath>(3)[2] = this._GuideMapSign_SimpleMotionPath3_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            this.glowEffect = _local1;
            BindingManager.executeBindings(this, "glowEffect", this.glowEffect);
            return (_local1);
        }
        private function _GuideMapSign_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xC000FF;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapSign_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 0.8;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapSign_SimpleMotionPath2_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapSign_SimpleMotionPath3_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapSign_Scale1_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 1;
            _local1.scaleXTo = 1.05;
            _local1.scaleYFrom = 1;
            _local1.scaleYTo = 1.05;
            _local1.duration = 200;
            this.scaleEffect = _local1;
            BindingManager.executeBindings(this, "scaleEffect", this.scaleEffect);
            return (_local1);
        }
        private function _GuideMapSign_Sequence1_i():Sequence{
            var _local1:Sequence = new Sequence();
            _local1.children = [this._GuideMapSign_Parallel1_c(), this._GuideMapSign_AnimateFilter2_c()];
            this.signInEffect = _local1;
            BindingManager.executeBindings(this, "signInEffect", this.signInEffect);
            return (_local1);
        }
        private function _GuideMapSign_Parallel1_c():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.duration = 300;
            _local1.children = [this._GuideMapSign_Fade1_c(), this._GuideMapSign_Scale2_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapSign_Fade1_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectStart", this.___GuideMapSign_Fade1_effectStart);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GuideMapSign_Fade1_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("light_drum");
        }
        private function _GuideMapSign_Scale2_c():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 15;
            _local1.scaleYFrom = 15;
            _local1.scaleXTo = 1;
            _local1.scaleYTo = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapSign_AnimateFilter2_c():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 300;
            _local1.bitmapFilter = this._GuideMapSign_GlowFilter2_i();
            new Vector.<MotionPath>(3)[0] = this._GuideMapSign_SimpleMotionPath4_c();
            new Vector.<MotionPath>(3)[1] = this._GuideMapSign_SimpleMotionPath5_c();
            new Vector.<MotionPath>(3)[2] = this._GuideMapSign_SimpleMotionPath6_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapSign_GlowFilter2_i():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF0000;
            _local1.strength = 2;
            this.signGlowFilter = _local1;
            BindingManager.executeBindings(this, "signGlowFilter", this.signGlowFilter);
            return (_local1);
        }
        private function _GuideMapSign_SimpleMotionPath4_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 1;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapSign_SimpleMotionPath5_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 50;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapSign_SimpleMotionPath6_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 50;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapSign_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapSign_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.color = 0;
            _local1.distance = 5;
            _local1.alpha = 0.7;
            _local1.quality = 4;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMapSign_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.width = 170;
            _local1.height = 170;
            _local1.filters = [this._GuideMapSign_ColorMatrixFilter1_i()];
            _local1.addEventListener("rollOver", this.__showImg_rollOver);
            _local1.addEventListener("rollOut", this.__showImg_rollOut);
            _local1.id = "showImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.showImg = _local1;
            BindingManager.executeBindings(this, "showImg", this.showImg);
            return (_local1);
        }
        private function _GuideMapSign_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this._GuideMapSign_ColorMatrixFilter1 = _local1;
            BindingManager.executeBindings(this, "_GuideMapSign_ColorMatrixFilter1", this._GuideMapSign_ColorMatrixFilter1);
            return (_local1);
        }
        public function __showImg_rollOver(_arg1:MouseEvent):void{
            this.mouseOverHandler();
        }
        public function __showImg_rollOut(_arg1:MouseEvent):void{
            this.mouseOutHandler();
        }
        private function _GuideMapSign_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 7;
            _local1.y = 8;
            _local1.initialized(this, "unknowSign");
            this.unknowSign = _local1;
            BindingManager.executeBindings(this, "unknowSign", this.unknowSign);
            return (_local1);
        }
        private function _GuideMapSign_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.mouseEnabled = false;
            _local1.width = 170;
            _local1.height = 70;
            _local1.x = 0;
            _local1.y = 18;
            _local1.filters = [this._GuideMapSign_GlowFilter3_i()];
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 28);
            _local1.setStyle("color", 0);
            _local1.setStyle("textAlign", "center");
            _local1.id = "label";
            if (!_local1.document){
                _local1.document = this;
            };
            this.label = _local1;
            BindingManager.executeBindings(this, "label", this.label);
            return (_local1);
        }
        private function _GuideMapSign_GlowFilter3_i():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            _local1.strength = 4;
            this.label_filter = _local1;
            BindingManager.executeBindings(this, "label_filter", this.label_filter);
            return (_local1);
        }
        private function _GuideMapSign_CommonHeadImageFrame1_i():CommonHeadImageFrame{
            var _local1:CommonHeadImageFrame = new CommonHeadImageFrame();
            _local1.id = "_GuideMapSign_CommonHeadImageFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._GuideMapSign_CommonHeadImageFrame1 = _local1;
            BindingManager.executeBindings(this, "_GuideMapSign_CommonHeadImageFrame1", this._GuideMapSign_CommonHeadImageFrame1);
            return (_local1);
        }
        private function _GuideMapSign_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 96;
            _local1.y = 98;
            _local1.visible = false;
            _local1.initialized(this, "passSign");
            this.passSign = _local1;
            BindingManager.executeBindings(this, "passSign", this.passSign);
            return (_local1);
        }
        public function ___GuideMapSign_Group1_mouseDown(_arg1:MouseEvent):void{
            SoundMgr.getInstance().playEffectSound("click_3");
        }
        public function ___GuideMapSign_Group1_toolTipShow(_arg1:ToolTipEvent):void{
            this.group1_toolTipShowHandler(_arg1);
        }
        public function ___GuideMapSign_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _GuideMapSign_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, null, "glowEffect.target", "showImg");
            result[1] = new Binding(this, function ():Object{
                return (this);
            }, null, "scaleEffect.target");
            result[2] = new Binding(this, null, null, "signInEffect.target", "passSign");
            result[3] = new Binding(this, function ():Object{
                return (_img);
            }, null, "showImg.source");
            result[4] = new Binding(this, function ():Object{
                return (grayFilter);
            }, null, "_GuideMapSign_ColorMatrixFilter1.matrix");
            result[5] = new Binding(this, function ():Boolean{
                return (!(unlock));
            }, null, "unknowSign.visible");
            result[6] = new Binding(this, null, null, "label.visible", "unlock");
            result[7] = new Binding(this, function ():String{
                var _local1:* = _text;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "label.text");
            result[8] = new Binding(this, function ():Array{
                var _local1:* = [170, 170];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_GuideMapSign_CommonHeadImageFrame1.size");
            return (result);
        }
        public function get glowEffect():AnimateFilter{
            return (this._207684226glowEffect);
        }
        public function set glowEffect(_arg1:AnimateFilter):void{
            var _local2:Object = this._207684226glowEffect;
            if (_local2 !== _arg1){
                this._207684226glowEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowEffect", _local2, _arg1));
                };
            };
        }
        public function get label():Label{
            return (this._102727412label);
        }
        public function set label(_arg1:Label):void{
            var _local2:Object = this._102727412label;
            if (_local2 !== _arg1){
                this._102727412label = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label", _local2, _arg1));
                };
            };
        }
        public function get label_filter():GlowFilter{
            return (this._718385373label_filter);
        }
        public function set label_filter(_arg1:GlowFilter):void{
            var _local2:Object = this._718385373label_filter;
            if (_local2 !== _arg1){
                this._718385373label_filter = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label_filter", _local2, _arg1));
                };
            };
        }
        public function get passSign():SmoothBitmapImage{
            return (this._1215907182passSign);
        }
        public function set passSign(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1215907182passSign;
            if (_local2 !== _arg1){
                this._1215907182passSign = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "passSign", _local2, _arg1));
                };
            };
        }
        public function get scaleEffect():Scale{
            return (this._1234104453scaleEffect);
        }
        public function set scaleEffect(_arg1:Scale):void{
            var _local2:Object = this._1234104453scaleEffect;
            if (_local2 !== _arg1){
                this._1234104453scaleEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scaleEffect", _local2, _arg1));
                };
            };
        }
        public function get showImg():MyImage{
            return (this._2067269510showImg);
        }
        public function set showImg(_arg1:MyImage):void{
            var _local2:Object = this._2067269510showImg;
            if (_local2 !== _arg1){
                this._2067269510showImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showImg", _local2, _arg1));
                };
            };
        }
        public function get signGlowFilter():GlowFilter{
            return (this._915373822signGlowFilter);
        }
        public function set signGlowFilter(_arg1:GlowFilter):void{
            var _local2:Object = this._915373822signGlowFilter;
            if (_local2 !== _arg1){
                this._915373822signGlowFilter = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "signGlowFilter", _local2, _arg1));
                };
            };
        }
        public function get signInEffect():Sequence{
            return (this._1530771443signInEffect);
        }
        public function set signInEffect(_arg1:Sequence):void{
            var _local2:Object = this._1530771443signInEffect;
            if (_local2 !== _arg1){
                this._1530771443signInEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "signInEffect", _local2, _arg1));
                };
            };
        }
        public function get unknowSign():SmoothBitmapImage{
            return (this._1159841921unknowSign);
        }
        public function set unknowSign(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1159841921unknowSign;
            if (_local2 !== _arg1){
                this._1159841921unknowSign = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "unknowSign", _local2, _arg1));
                };
            };
        }
        private function get _text():String{
            return (this._91291148_text);
        }
        private function set _text(_arg1:String):void{
            var _local2:Object = this._91291148_text;
            if (_local2 !== _arg1){
                this._91291148_text = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_text", _local2, _arg1));
                };
            };
        }
        private function get _img():String{
            return (this._2934532_img);
        }
        private function set _img(_arg1:String):void{
            var _local2:Object = this._2934532_img;
            if (_local2 !== _arg1){
                this._2934532_img = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_img", _local2, _arg1));
                };
            };
        }
        private function get grayFilter():Array{
            return (this._714582971grayFilter);
        }
        private function set grayFilter(_arg1:Array):void{
            var _local2:Object = this._714582971grayFilter;
            if (_local2 !== _arg1){
                this._714582971grayFilter = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "grayFilter", _local2, _arg1));
                };
            };
        }
        public function get unlock():Boolean{
            return (this._840442044unlock);
        }
        public function set unlock(_arg1:Boolean):void{
            var _local2:Object = this._840442044unlock;
            if (_local2 !== _arg1){
                this._840442044unlock = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "unlock", _local2, _arg1));
                };
            };
        }

    }
}//package task_guide 
