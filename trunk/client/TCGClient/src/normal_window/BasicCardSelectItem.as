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
    import spark.effects.*;
    import spark.layouts.*;
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

    public class BasicCardSelectItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _BasicCardSelectItem_SmoothBitmapImage1:SmoothBitmapImage;
        private var _1267520715removeEffect:Fade;
        private var _1161518163rollOutFade:Fade;
        private var _1149430515rollOverFade:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _2124133034imageSource:Class;
        public var isSelected:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function BasicCardSelectItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._BasicCardSelectItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_BasicCardSelectItemWatcherSetupUtil");
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
            this.width = 414;
            this.height = 800;
            this.buttonMode = true;
            this.layout = this._BasicCardSelectItem_BasicLayout1_c();
            this.mxmlContent = [this._BasicCardSelectItem_SmoothBitmapImage1_i()];
            this._BasicCardSelectItem_Fade1_i();
            this._BasicCardSelectItem_Fade3_i();
            this._BasicCardSelectItem_Fade2_i();
            this.addEventListener("initialize", this.___BasicCardSelectItem_Group1_initialize);
            this.addEventListener("rollOver", this.___BasicCardSelectItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___BasicCardSelectItem_Group1_rollOut);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            BasicCardSelectItem._watcherSetupUtil = _arg1;
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
        protected function group1_initializeHandler(_arg1:FlexEvent):void{
            alpha = 0.4;
        }
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            if (this.isSelected){
                return;
            };
            this.rollOutFade.stop();
            this.rollOverFade.play();
        }
        protected function group1_rollOutHandler(_arg1:MouseEvent):void{
            if (this.isSelected){
                return;
            };
            this.rollOverFade.stop();
            this.rollOutFade.play();
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function _BasicCardSelectItem_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 0;
            _local1.duration = 250;
            _local1.addEventListener("effectStart", this.__removeEffect_effectStart);
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        public function __removeEffect_effectStart(_arg1:EffectEvent):void{
            mouseChildren = false;
            mouseEnabled = false;
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            this.removeSelf();
        }
        private function _BasicCardSelectItem_Fade3_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 0.4;
            _local1.duration = 200;
            this.rollOutFade = _local1;
            BindingManager.executeBindings(this, "rollOutFade", this.rollOutFade);
            return (_local1);
        }
        private function _BasicCardSelectItem_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 1;
            _local1.duration = 100;
            this.rollOverFade = _local1;
            BindingManager.executeBindings(this, "rollOverFade", this.rollOverFade);
            return (_local1);
        }
        private function _BasicCardSelectItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BasicCardSelectItem_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "_BasicCardSelectItem_SmoothBitmapImage1");
            this._BasicCardSelectItem_SmoothBitmapImage1 = _local1;
            BindingManager.executeBindings(this, "_BasicCardSelectItem_SmoothBitmapImage1", this._BasicCardSelectItem_SmoothBitmapImage1);
            return (_local1);
        }
        public function ___BasicCardSelectItem_Group1_initialize(_arg1:FlexEvent):void{
            this.group1_initializeHandler(_arg1);
        }
        public function ___BasicCardSelectItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        public function ___BasicCardSelectItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.group1_rollOutHandler(_arg1);
        }
        private function _BasicCardSelectItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "removeEffect.target");
            result[1] = new Binding(this, function ():Object{
                return (this);
            }, null, "rollOverFade.target");
            result[2] = new Binding(this, function ():Object{
                return (this);
            }, null, "rollOutFade.target");
            result[3] = new Binding(this, null, null, "_BasicCardSelectItem_SmoothBitmapImage1.source", "imageSource");
            return (result);
        }
        public function get removeEffect():Fade{
            return (this._1267520715removeEffect);
        }
        public function set removeEffect(_arg1:Fade):void{
            var _local2:Object = this._1267520715removeEffect;
            if (_local2 !== _arg1){
                this._1267520715removeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeEffect", _local2, _arg1));
                };
            };
        }
        public function get rollOutFade():Fade{
            return (this._1161518163rollOutFade);
        }
        public function set rollOutFade(_arg1:Fade):void{
            var _local2:Object = this._1161518163rollOutFade;
            if (_local2 !== _arg1){
                this._1161518163rollOutFade = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rollOutFade", _local2, _arg1));
                };
            };
        }
        public function get rollOverFade():Fade{
            return (this._1149430515rollOverFade);
        }
        public function set rollOverFade(_arg1:Fade):void{
            var _local2:Object = this._1149430515rollOverFade;
            if (_local2 !== _arg1){
                this._1149430515rollOverFade = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rollOverFade", _local2, _arg1));
                };
            };
        }
        public function get imageSource():Class{
            return (this._2124133034imageSource);
        }
        public function set imageSource(_arg1:Class):void{
            var _local2:Object = this._2124133034imageSource;
            if (_local2 !== _arg1){
                this._2124133034imageSource = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imageSource", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
