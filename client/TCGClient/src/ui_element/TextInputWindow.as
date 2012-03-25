//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
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
    import mouse_keyboard_mgr.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import skins.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class TextInputWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _TextInputWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _TextInputWindow_CommonOuterFrame1:CommonOuterFrame;
        private var _413245038addEffect:Scale;
        private var _1092797764closeBtn:CloseSignBtn;
        private var _842377084confirmBtn:BlueSmallButton;
        private var _1017317214descText:Label;
        private var _1267520715removeEffect:Scale;
        private var _1058056547textInput:TextInput;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml_source_commonUI_______png_425445134:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function TextInputWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI_______png_425445134 = TextInputWindow__embed_mxml_source_commonUI_______png_425445134;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._TextInputWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_ui_element_TextInputWindowWatcherSetupUtil");
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
            this.width = 0xFF;
            this.height = 102;
            this.layout = this._TextInputWindow_BasicLayout1_c();
            this.mxmlContent = [this._TextInputWindow_CommonOuterFrame1_i(), this._TextInputWindow_CommonMiddleFrame1_i(), this._TextInputWindow_Label1_i(), this._TextInputWindow_SmoothBitmapImage1_c(), this._TextInputWindow_TextInput1_i(), this._TextInputWindow_CloseSignBtn1_i(), this._TextInputWindow_BlueSmallButton1_i()];
            this._TextInputWindow_Scale1_i();
            this._TextInputWindow_Scale2_i();
            this.addEventListener("creationComplete", this.___TextInputWindow_Group1_creationComplete);
            this.addEventListener("removedFromStage", this.___TextInputWindow_Group1_removedFromStage);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            TextInputWindow._watcherSetupUtil = _arg1;
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
                this.color = 14272435;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function addEffect_effectEndHandler(_arg1:EffectEvent):void{
            KeyboardMgr.getInstance().addEventListener(KeyboardEvent.KEY_UP, this.stageKeyUpHandler);
            if (this.textInput){
                this.textInput.setFocus();
            };
        }
        protected function group1_removedFromStageHandler(_arg1:Event):void{
            KeyboardMgr.getInstance().removeEventListener(KeyboardEvent.KEY_UP, this.stageKeyUpHandler);
        }
        protected function stageKeyUpHandler(_arg1:KeyboardEvent):void{
            if (_arg1.keyCode == 13){
                this.confirmBtn_clickHandler(null);
            };
        }
        protected function closeBtn_clickHandler(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        protected function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function confirmBtn_clickHandler(_arg1:MouseEvent):void{
        }
        protected function group_creationCompleteHandler(_arg1:FlexEvent):void{
        }
        private function _TextInputWindow_Scale1_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 0.1;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 0.1;
            _local1.scaleYTo = 1;
            _local1.duration = 200;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.addEffect_effectEndHandler(_arg1);
        }
        private function _TextInputWindow_Scale2_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 1;
            _local1.scaleXTo = 0.1;
            _local1.scaleYFrom = 1;
            _local1.scaleYTo = 0.1;
            _local1.duration = 200;
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        private function _TextInputWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TextInputWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.filters = [this._TextInputWindow_DropShadowFilter1_c()];
            _local1.id = "_TextInputWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TextInputWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_TextInputWindow_CommonOuterFrame1", this._TextInputWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _TextInputWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TextInputWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 16;
            _local1.y = 13;
            _local1.id = "_TextInputWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TextInputWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_TextInputWindow_CommonMiddleFrame1", this._TextInputWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _TextInputWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 28;
            _local1.y = 25;
            _local1.setStyle("fontSize", 16);
            _local1.id = "descText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.descText = _local1;
            BindingManager.executeBindings(this, "descText", this.descText);
            return (_local1);
        }
        private function _TextInputWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_______png_425445134;
            _local1.x = 33;
            _local1.y = 50;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TextInputWindow_TextInput1_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 37;
            _local1.y = 50;
            _local1.width = 130;
            _local1.height = 23;
            _local1.maxChars = 20;
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("skinClass", textInputSkin);
            _local1.id = "textInput";
            if (!_local1.document){
                _local1.document = this;
            };
            this.textInput = _local1;
            BindingManager.executeBindings(this, "textInput", this.textInput);
            return (_local1);
        }
        private function _TextInputWindow_CloseSignBtn1_i():CloseSignBtn{
            var _local1:CloseSignBtn;
            _local1 = new CloseSignBtn();
            _local1.x = 215;
            _local1.y = 17;
            _local1.addEventListener("click", this.__closeBtn_click);
            _local1.id = "closeBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.closeBtn = _local1;
            BindingManager.executeBindings(this, "closeBtn", this.closeBtn);
            return (_local1);
        }
        public function __closeBtn_click(_arg1:MouseEvent):void{
            this.closeBtn_clickHandler(_arg1);
        }
        private function _TextInputWindow_BlueSmallButton1_i():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.x = 179;
            _local1.y = 49;
            _local1.label = "确定";
            _local1.addEventListener("click", this.__confirmBtn_click);
            _local1.id = "confirmBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.confirmBtn = _local1;
            BindingManager.executeBindings(this, "confirmBtn", this.confirmBtn);
            return (_local1);
        }
        public function __confirmBtn_click(_arg1:MouseEvent):void{
            this.confirmBtn_clickHandler(_arg1);
        }
        public function ___TextInputWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group_creationCompleteHandler(_arg1);
        }
        public function ___TextInputWindow_Group1_removedFromStage(_arg1:Event):void{
            this.group1_removedFromStageHandler(_arg1);
        }
        private function _TextInputWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "removeEffect");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [0xFF, 102];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_TextInputWindow_CommonOuterFrame1.size");
            result[3] = new Binding(this, function ():Array{
                var _local1:* = [223, 74];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_TextInputWindow_CommonMiddleFrame1.size");
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
        public function get closeBtn():CloseSignBtn{
            return (this._1092797764closeBtn);
        }
        public function set closeBtn(_arg1:CloseSignBtn):void{
            var _local2:Object = this._1092797764closeBtn;
            if (_local2 !== _arg1){
                this._1092797764closeBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "closeBtn", _local2, _arg1));
                };
            };
        }
        public function get confirmBtn():BlueSmallButton{
            return (this._842377084confirmBtn);
        }
        public function set confirmBtn(_arg1:BlueSmallButton):void{
            var _local2:Object = this._842377084confirmBtn;
            if (_local2 !== _arg1){
                this._842377084confirmBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirmBtn", _local2, _arg1));
                };
            };
        }
        public function get descText():Label{
            return (this._1017317214descText);
        }
        public function set descText(_arg1:Label):void{
            var _local2:Object = this._1017317214descText;
            if (_local2 !== _arg1){
                this._1017317214descText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descText", _local2, _arg1));
                };
            };
        }
        public function get removeEffect():Scale{
            return (this._1267520715removeEffect);
        }
        public function set removeEffect(_arg1:Scale):void{
            var _local2:Object = this._1267520715removeEffect;
            if (_local2 !== _arg1){
                this._1267520715removeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeEffect", _local2, _arg1));
                };
            };
        }
        public function get textInput():TextInput{
            return (this._1058056547textInput);
        }
        public function set textInput(_arg1:TextInput):void{
            var _local2:Object = this._1058056547textInput;
            if (_local2 !== _arg1){
                this._1058056547textInput = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textInput", _local2, _arg1));
                };
            };
        }

    }
}//package ui_element 
