//Created by Action Script Viewer - http://www.buraks.com/asv
package task {
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
	use namespace mx_internal;
    public class TaskScenarioTalkWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1020166578fadeInEffect:Fade;
        private var _733607779fadeOutEffect:Fade;
        private var _3198432head:MyImage;
        private var _1115960181headName:Label;
        private var _3560248tips:RichText;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1115900379headPath:String;
        private var _897300392headNameText:String;
        private var _1312067479tipFlow:TextFlow;
        private var _embed_mxml_source_commonUI_________png_1086246204:Class;
        private var _embed_mxml_source_commonUI_________png_2092283682:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function TaskScenarioTalkWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI_________png_1086246204 = TaskScenarioTalkWindow__embed_mxml_source_commonUI_________png_1086246204;
            this._embed_mxml_source_commonUI_________png_2092283682 = TaskScenarioTalkWindow__embed_mxml_source_commonUI_________png_2092283682;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._TaskScenarioTalkWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_TaskScenarioTalkWindowWatcherSetupUtil");
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
            this.x = 303;
            this.y = 307;
            this.depth = 21;
            this.mouseChildren = false;
            this.layout = this._TaskScenarioTalkWindow_BasicLayout1_c();
            this.mxmlContent = [this._TaskScenarioTalkWindow_SmoothBitmapImage1_c(), this._TaskScenarioTalkWindow_MyImage1_i(), this._TaskScenarioTalkWindow_SmoothBitmapImage2_c(), this._TaskScenarioTalkWindow_Label1_i(), this._TaskScenarioTalkWindow_RichText1_i(), this._TaskScenarioTalkWindow_MouseFlashSign1_c()];
            this._TaskScenarioTalkWindow_Fade1_i();
            this._TaskScenarioTalkWindow_Fade2_i();
            this.addEventListener("initialize", this.___TaskScenarioTalkWindow_Group1_initialize);
            this.addEventListener("click", this.___TaskScenarioTalkWindow_Group1_click);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            TaskScenarioTalkWindow._watcherSetupUtil = _arg1;
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
                this.color = 16767396;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function setInfo(_arg1:Object):void{
            this.headPath = _arg1.headPath;
            this.headNameText = _arg1.headName;
            this.setTipContent(_arg1.content);
        }
        private function setTipContent(_arg1:String):void{
            this.tipFlow = StringUtils.createTFByHtmlText(_arg1);
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function addMask():void{
            var _local1:UIComponent = new UIComponent();
            addElement(_local1);
            _local1.graphics.beginFill(0);
            _local1.graphics.drawCircle(((this.head.width / 2) + this.head.x), ((this.head.width / 2) + this.head.y), (this.head.width / 2));
            _local1.graphics.endFill();
            this.head.mask = _local1;
        }
        protected function group1_clickHandler(_arg1:MouseEvent):void{
            this.fadeOutEffect.play();
        }
        private function _TaskScenarioTalkWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            _local1.addEventListener("effectStart", this.__fadeInEffect_effectStart);
            _local1.addEventListener("effectEnd", this.__fadeInEffect_effectEnd);
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        public function __fadeInEffect_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("window_show");
        }
        public function __fadeInEffect_effectEnd(_arg1:EffectEvent):void{
            mouseChildren = true;
        }
        private function _TaskScenarioTalkWindow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            _local1.duration = 300;
            _local1.addEventListener("effectStart", this.__fadeOutEffect_effectStart);
            _local1.addEventListener("effectEnd", this.__fadeOutEffect_effectEnd);
            this.fadeOutEffect = _local1;
            BindingManager.executeBindings(this, "fadeOutEffect", this.fadeOutEffect);
            return (_local1);
        }
        public function __fadeOutEffect_effectStart(_arg1:EffectEvent):void{
            mouseChildren = false;
        }
        public function __fadeOutEffect_effectEnd(_arg1:EffectEvent):void{
            dispatchEvent(new Event("finishTask"));
        }
        private function _TaskScenarioTalkWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskScenarioTalkWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_________png_1086246204;
            _local1.x = 74;
            _local1.y = 42;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskScenarioTalkWindow_MyImage1_i():MyImage{
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
        private function _TaskScenarioTalkWindow_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_________png_2092283682;
            _local1.x = 4;
            _local1.y = 0;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskScenarioTalkWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.width = 130;
            _local1.height = 35;
            _local1.x = 166;
            _local1.y = 17;
            _local1.filters = [this._TaskScenarioTalkWindow_GlowFilter1_c()];
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
        private function _TaskScenarioTalkWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 1387371;
            _local1.strength = 6;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskScenarioTalkWindow_RichText1_i():RichText{
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
        private function _TaskScenarioTalkWindow_MouseFlashSign1_c():MouseFlashSign{
            var _local1:MouseFlashSign = new MouseFlashSign();
            _local1.x = 612;
            _local1.y = 122;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TaskScenarioTalkWindow_Group1_initialize(_arg1:FlexEvent):void{
            alpha = 0;
        }
        public function ___TaskScenarioTalkWindow_Group1_click(_arg1:MouseEvent):void{
            this.group1_clickHandler(_arg1);
        }
        private function _TaskScenarioTalkWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "fadeInEffect.target");
            result[1] = new Binding(this, function ():Object{
                return (this);
            }, null, "fadeOutEffect.target");
            result[2] = new Binding(this, function ():Object{
                return (headPath);
            }, null, "head.source");
            result[3] = new Binding(this, function ():String{
                var _local1:* = headNameText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "headName.text");
            result[4] = new Binding(this, function ():TextFlow{
                return (tipFlow);
            }, null, "tips.textFlow");
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
        private function get headPath():String{
            return (this._1115900379headPath);
        }
        private function set headPath(_arg1:String):void{
            var _local2:Object = this._1115900379headPath;
            if (_local2 !== _arg1){
                this._1115900379headPath = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headPath", _local2, _arg1));
                };
            };
        }
        private function get headNameText():String{
            return (this._897300392headNameText);
        }
        private function set headNameText(_arg1:String):void{
            var _local2:Object = this._897300392headNameText;
            if (_local2 !== _arg1){
                this._897300392headNameText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headNameText", _local2, _arg1));
                };
            };
        }
        private function get tipFlow():TextFlow{
            return (this._1312067479tipFlow);
        }
        private function set tipFlow(_arg1:TextFlow):void{
            var _local2:Object = this._1312067479tipFlow;
            if (_local2 !== _arg1){
                this._1312067479tipFlow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipFlow", _local2, _arg1));
                };
            };
        }

    }
}//package task 
