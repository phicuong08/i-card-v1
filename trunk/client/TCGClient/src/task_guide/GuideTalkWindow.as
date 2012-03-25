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
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import flashx.textLayout.elements.*;
    import SoundSystem.*;
    import flash.utils.*;
    import flash.accessibility.*;
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

    public class GuideTalkWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _GuideTalkWindow_GlowFilter1:GlowFilter;
        private var _1020166578fadeInEffect:Fade;
        private var _733607779fadeOutEffect:Fade;
        private var _3198432head:MyImage;
        private var _1115960181headName:Label;
        private var _586331138mouseSign:GuideMouseSign;
        private var _3560248tips:RichText;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _stepInfo:Object;
        private var _1312067479tipFlow:TextFlow;
        private var _795280835headImg:String;
        private var _897300392headNameText:String;
        private var _embed_mxml_source_commonUI_________png_1086246204:Class;
        private var _embed_mxml_source_commonUI_________png_2092283682:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function GuideTalkWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI_________png_1086246204 = GuideTalkWindow__embed_mxml_source_commonUI_________png_1086246204;
            this._embed_mxml_source_commonUI_________png_2092283682 = GuideTalkWindow__embed_mxml_source_commonUI_________png_2092283682;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GuideTalkWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_guide_GuideTalkWindowWatcherSetupUtil");
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
            this.width = 673;
            this.height = 185;
            this.layout = this._GuideTalkWindow_BasicLayout1_c();
            this.mxmlContent = [this._GuideTalkWindow_SmoothBitmapImage1_c(), this._GuideTalkWindow_MyImage1_i(), this._GuideTalkWindow_SmoothBitmapImage2_c(), this._GuideTalkWindow_Label1_i(), this._GuideTalkWindow_RichText1_i(), this._GuideTalkWindow_GuideMouseSign1_i()];
            this._GuideTalkWindow_Fade1_i();
            this._GuideTalkWindow_Fade2_i();
            this.addEventListener("initialize", this.___GuideTalkWindow_Group1_initialize);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GuideTalkWindow._watcherSetupUtil = _arg1;
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
        public function set stepInfo(_arg1:Object):void{
            this._stepInfo = _arg1;
            this.setTipContent(this._stepInfo["content"]);
            this.headNameText = this._stepInfo["head_name"];
            this.headImg = this._stepInfo["head_icon"];
            if ((((this._stepInfo["x_position"] == "")) || (!(this._stepInfo["x_position"])))){
                x = 240;
            } else {
                x = GuideSystem.getInstance().getPosById(this._stepInfo["x_position"]);
            };
            if ((((this._stepInfo["y_position"] == "")) || (!(this._stepInfo["y_position"])))){
                y = 600;
            } else {
                y = GuideSystem.getInstance().getPosById(this._stepInfo["y_position"]);
            };
            GuideFunctions.createGuideLine(this);
            if (this._stepInfo["display_func"]){
                var _local2 = GuideFunctions;
                _local2[this._stepInfo["display_func"]](this);
            };
            if (this._stepInfo["click_remove"] != "false"){
                this.mouseSign.visible = true;
                TCGClient.getInstance().addEventListener(MouseEvent.CLICK, this.clickHandler);
            } else {
                this.mouseSign.visible = false;
            };
        }
        public function get stepInfo():Object{
            return (this._stepInfo);
        }
        public function setTipContent(_arg1:String):void{
            this.tipFlow = StringUtils.createTFByHtmlText(_arg1);
        }
        public function removeSelf():void{
            if (!this.fadeOutEffect.isPlaying){
                this.fadeOutEffect.play();
            };
        }
        private function fadeEffectEnd():void{
            this.visible = false;
            dispatchEvent(new Event("finishTask"));
        }
        protected function clickHandler(_arg1:MouseEvent):void{
            if (((this.fadeInEffect.isPlaying) || (this.fadeOutEffect.isPlaying))){
                return;
            };
            TCGClient.getInstance().removeEventListener(MouseEvent.CLICK, this.clickHandler);
            GuideSystem.getInstance().hideAll();
        }
        private function addMask():void{
            var _local1:UIComponent = new UIComponent();
            addElement(_local1);
            _local1.graphics.beginFill(0);
            _local1.graphics.drawCircle(((this.head.width / 2) + this.head.x), ((this.head.width / 2) + this.head.y), (this.head.width / 2));
            _local1.graphics.endFill();
            this.head.mask = _local1;
        }
        private function _GuideTalkWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            _local1.addEventListener("effectStart", this.__fadeInEffect_effectStart);
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        public function __fadeInEffect_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("window_show");
        }
        private function _GuideTalkWindow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 0;
            _local1.duration = 300;
            _local1.addEventListener("effectEnd", this.__fadeOutEffect_effectEnd);
            this.fadeOutEffect = _local1;
            BindingManager.executeBindings(this, "fadeOutEffect", this.fadeOutEffect);
            return (_local1);
        }
        public function __fadeOutEffect_effectEnd(_arg1:EffectEvent):void{
            this.fadeEffectEnd();
        }
        private function _GuideTalkWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideTalkWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_________png_1086246204;
            _local1.x = 74;
            _local1.y = 42;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideTalkWindow_MyImage1_i():MyImage{
            var _local1:MyImage;
            _local1 = new MyImage();
            _local1.width = 140;
            _local1.height = 140;
            _local1.x = 21;
            _local1.y = 22;
            _local1.addEventListener("creationComplete", this.__head_creationComplete);
            _local1.id = "head";
            if (!_local1.document){
                _local1.document = this;
            };
            this.head = _local1;
            BindingManager.executeBindings(this, "head", this.head);
            return (_local1);
        }
        public function __head_creationComplete(_arg1:FlexEvent):void{
            this.addMask();
        }
        private function _GuideTalkWindow_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_________png_2092283682;
            _local1.x = 4;
            _local1.y = 0;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideTalkWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.width = 130;
            _local1.height = 35;
            _local1.x = 166;
            _local1.y = 17;
            _local1.filters = [this._GuideTalkWindow_GlowFilter1_i()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "headName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.headName = _local1;
            BindingManager.executeBindings(this, "headName", this.headName);
            return (_local1);
        }
        private function _GuideTalkWindow_GlowFilter1_i():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.strength = 6;
            this._GuideTalkWindow_GlowFilter1 = _local1;
            BindingManager.executeBindings(this, "_GuideTalkWindow_GlowFilter1", this._GuideTalkWindow_GlowFilter1);
            return (_local1);
        }
        private function _GuideTalkWindow_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 205;
            _local1.y = 41;
            _local1.width = 424;
            _local1.height = 130;
            _local1.content = "\n\t";
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 16);
            _local1.id = "tips";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tips = _local1;
            BindingManager.executeBindings(this, "tips", this.tips);
            return (_local1);
        }
        private function _GuideTalkWindow_GuideMouseSign1_i():GuideMouseSign{
            var _local1:GuideMouseSign = new GuideMouseSign();
            _local1.x = 612;
            _local1.y = 122;
            _local1.id = "mouseSign";
            if (!_local1.document){
                _local1.document = this;
            };
            this.mouseSign = _local1;
            BindingManager.executeBindings(this, "mouseSign", this.mouseSign);
            return (_local1);
        }
        public function ___GuideTalkWindow_Group1_initialize(_arg1:FlexEvent):void{
            alpha = 0;
        }
        private function _GuideTalkWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():uint{
                return (GuideFunctions.GUIDE_FONT_COLOR);
            }, function (_arg1:uint):void{
                this.setStyle("color", _arg1);
            }, "this.color");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeInEffect");
            result[2] = new Binding(this, function ():Object{
                return (this);
            }, null, "fadeOutEffect.target");
            result[3] = new Binding(this, null, null, "head.source", "headImg");
            result[4] = new Binding(this, null, null, "headName.text", "headNameText");
            result[5] = new Binding(this, function ():uint{
                return (GuideFunctions.GUIDE_GLOW_COLOR);
            }, null, "_GuideTalkWindow_GlowFilter1.color");
            result[6] = new Binding(this, null, null, "tips.textFlow", "tipFlow");
            return (result);
        }
        public function get fadeInEffect():Fade{
            return (this._1020166578fadeInEffect);
        }
        public function set fadeInEffect(_arg1:Fade):void{
            var _local2:Object = this._1020166578fadeInEffect;
            if (_local2 !== _arg1){
                this._1020166578fadeInEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeInEffect", _local2, _arg1));
                };
            };
        }
        public function get fadeOutEffect():Fade{
            return (this._733607779fadeOutEffect);
        }
        public function set fadeOutEffect(_arg1:Fade):void{
            var _local2:Object = this._733607779fadeOutEffect;
            if (_local2 !== _arg1){
                this._733607779fadeOutEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeOutEffect", _local2, _arg1));
                };
            };
        }
        public function get head():MyImage{
            return (this._3198432head);
        }
        public function set head(_arg1:MyImage):void{
            var _local2:Object = this._3198432head;
            if (_local2 !== _arg1){
                this._3198432head = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "head", _local2, _arg1));
                };
            };
        }
        public function get headName():Label{
            return (this._1115960181headName);
        }
        public function set headName(_arg1:Label):void{
            var _local2:Object = this._1115960181headName;
            if (_local2 !== _arg1){
                this._1115960181headName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headName", _local2, _arg1));
                };
            };
        }
        public function get mouseSign():GuideMouseSign{
            return (this._586331138mouseSign);
        }
        public function set mouseSign(_arg1:GuideMouseSign):void{
            var _local2:Object = this._586331138mouseSign;
            if (_local2 !== _arg1){
                this._586331138mouseSign = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mouseSign", _local2, _arg1));
                };
            };
        }
        public function get tips():RichText{
            return (this._3560248tips);
        }
        public function set tips(_arg1:RichText):void{
            var _local2:Object = this._3560248tips;
            if (_local2 !== _arg1){
                this._3560248tips = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tips", _local2, _arg1));
                };
            };
        }
        public function get tipFlow():TextFlow{
            return (this._1312067479tipFlow);
        }
        public function set tipFlow(_arg1:TextFlow):void{
            var _local2:Object = this._1312067479tipFlow;
            if (_local2 !== _arg1){
                this._1312067479tipFlow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipFlow", _local2, _arg1));
                };
            };
        }
        public function get headImg():String{
            return (this._795280835headImg);
        }
        public function set headImg(_arg1:String):void{
            var _local2:Object = this._795280835headImg;
            if (_local2 !== _arg1){
                this._795280835headImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headImg", _local2, _arg1));
                };
            };
        }
        public function get headNameText():String{
            return (this._897300392headNameText);
        }
        public function set headNameText(_arg1:String):void{
            var _local2:Object = this._897300392headNameText;
            if (_local2 !== _arg1){
                this._897300392headNameText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headNameText", _local2, _arg1));
                };
            };
        }

    }
}//package task_guide 
