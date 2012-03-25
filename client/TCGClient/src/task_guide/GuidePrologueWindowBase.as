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
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import custom_effect.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import SoundSystem.*;
    import flash.utils.*;
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

    public class GuidePrologueWindowBase extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1702646255bodyText:Label;
        private var _1282133823fadeIn:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var _slot1;
        public function GuidePrologueWindowBase(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GuidePrologueWindowBase_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_guide_GuidePrologueWindowBaseWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (GuidePrologueWindowBase[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.layout = this._GuidePrologueWindowBase_BasicLayout1_c();
            this.mxmlContent = [this._GuidePrologueWindowBase_Rect1_c(), this._GuidePrologueWindowBase_Label1_i(), this._GuidePrologueWindowBase_Rect2_c(), this._GuidePrologueWindowBase_Rect3_c(), this._GuidePrologueWindowBase_Rect4_c(), this._GuidePrologueWindowBase_Rect5_c()];
            this._GuidePrologueWindowBase_Fade1_i();
            this.addEventListener("creationComplete", this.___GuidePrologueWindowBase_Group1_creationComplete);
            this.addEventListener("remove", this.___GuidePrologueWindowBase_Group1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GuidePrologueWindowBase._watcherSetupUtil = _arg1;
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
        protected function creationCompleteHandler():void{
        }
        protected function fadeIn_effectEndHandler(_arg1:EffectEvent):void{
            SoundMgr.getInstance().stopBgSound();
            TCGClient.getInstance().addEventListener(MouseEvent.CLICK, this.clickHandler);
        }
        protected function clickHandler(_arg1:MouseEvent=null):void{
            if (this.fadeIn.isPlaying){
                return;
            };
            TCGClient.getInstance().removeEventListener(MouseEvent.CLICK, this.clickHandler);
            this.removeSelf();
        }
        protected function removeSelf():void{
            dispatchEvent(new Event("finishTask"));
            var _local1:* = parent;
            if (_local1 != null){
                _local1.removeElement(this);
            };
        }
        protected function group1_removeHandler():void{
            var _local1:FakeFadeEffect = new FakeFadeEffect(this, 1000, 1, 0);
            _local1.play();
        }
        private function _GuidePrologueWindowBase_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 1500;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectEnd", this.__fadeIn_effectEnd);
            this.fadeIn = _local1;
            BindingManager.executeBindings(this, "fadeIn", this.fadeIn);
            return (_local1);
        }
        public function __fadeIn_effectEnd(_arg1:EffectEvent):void{
            this.fadeIn_effectEndHandler(_arg1);
        }
        private function _GuidePrologueWindowBase_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.fill = this._GuidePrologueWindowBase_SolidColor1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 450;
            _local1.y = 680;
            _local1.setStyle("color", 0xFFFFFF);
            _local1.setStyle("fontSize", 40);
            _local1.id = "bodyText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.bodyText = _local1;
            BindingManager.executeBindings(this, "bodyText", this.bodyText);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_Rect2_c():Rect{
            var _local1:Rect = new Rect();
            _local1.width = 0x0500;
            _local1.height = 160;
            _local1.depth = 5;
            _local1.fill = this._GuidePrologueWindowBase_SolidColor2_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_SolidColor2_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_Rect3_c():Rect{
            var _local1:Rect = new Rect();
            _local1.y = 160;
            _local1.width = 0x0500;
            _local1.height = 160;
            _local1.depth = 5;
            _local1.fill = this._GuidePrologueWindowBase_LinearGradient1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.rotation = 90;
            _local1.entries = [this._GuidePrologueWindowBase_GradientEntry1_c(), this._GuidePrologueWindowBase_GradientEntry2_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0;
            _local1.alpha = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_Rect4_c():Rect{
            var _local1:Rect = new Rect();
            _local1.y = 480;
            _local1.width = 0x0500;
            _local1.height = 160;
            _local1.depth = 5;
            _local1.fill = this._GuidePrologueWindowBase_LinearGradient2_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_LinearGradient2_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.rotation = 90;
            _local1.entries = [this._GuidePrologueWindowBase_GradientEntry3_c(), this._GuidePrologueWindowBase_GradientEntry4_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_GradientEntry4_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0;
            _local1.alpha = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_Rect5_c():Rect{
            var _local1:Rect = new Rect();
            _local1.y = 640;
            _local1.width = 0x0500;
            _local1.height = 160;
            _local1.depth = 5;
            _local1.fill = this._GuidePrologueWindowBase_SolidColor3_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuidePrologueWindowBase_SolidColor3_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GuidePrologueWindowBase_Group1_creationComplete(_arg1:FlexEvent):void{
            this.creationCompleteHandler();
        }
        public function ___GuidePrologueWindowBase_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler();
        }
        private function _GuidePrologueWindowBase_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeIn");
            return (result);
        }
        public function get bodyText():Label{
            return (this._1702646255bodyText);
        }
        public function set bodyText(_arg1:Label):void{
            var _local2:Object = this._1702646255bodyText;
            if (_local2 !== _arg1){
                this._1702646255bodyText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bodyText", _local2, _arg1));
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

    }
}//package task_guide 
