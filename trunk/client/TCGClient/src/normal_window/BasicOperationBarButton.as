//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import __AS3__.vec.*;
    
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
    import mx.events.*;
    import mx.filters.*;
    import mx.styles.*;
    
    import spark.effects.*;
    import spark.effects.animation.*;
    import spark.filters.*;
    
    import ui_element.*;

    public class BasicOperationBarButton extends ClickScaleButton implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;
        private static var _skinParts_:Object = {labelDisplay:false};

        private var _207684226glowEffect:AnimateFilter;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function BasicOperationBarButton(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._BasicOperationBarButton_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_BasicOperationBarButtonWatcherSetupUtil");
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
            this._BasicOperationBarButton_AnimateFilter1_i();
            this.addEventListener("click", this.___BasicOperationBarButton_ClickScaleButton1_click);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            BasicOperationBarButton._watcherSetupUtil = _arg1;
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
        public function playFlashEffect(_arg1:Boolean=true):void{
            this.glowEffect.stop();
            if (_arg1){
                this.glowEffect.play();
            };
        }
        protected function clickscalebutton1_clickHandler(_arg1:MouseEvent):void{
            this.playFlashEffect(false);
        }
        private function _BasicOperationBarButton_AnimateFilter1_i():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.repeatCount = 0;
            _local1.duration = 500;
            _local1.repeatBehavior = "reverse";
            _local1.bitmapFilter = this._BasicOperationBarButton_GlowFilter1_c();
            new Vector.<MotionPath>(1)[0] = this._BasicOperationBarButton_SimpleMotionPath1_c();
            _local1.motionPaths = new Vector.<MotionPath>(1);
            this.glowEffect = _local1;
            BindingManager.executeBindings(this, "glowEffect", this.glowEffect);
            return (_local1);
        }
        private function _BasicOperationBarButton_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 16776492;
            _local1.blurX = 100;
            _local1.blurY = 100;
            _local1.inner = true;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BasicOperationBarButton_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 0;
            _local1.valueTo = 0.4;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___BasicOperationBarButton_ClickScaleButton1_click(_arg1:MouseEvent):void{
            this.clickscalebutton1_clickHandler(_arg1);
        }
        private function _BasicOperationBarButton_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "glowEffect.target");
            return (result);
        }
//        override protected function get skinParts():Object{
//            return (_skinParts_);
//        }
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

    }
}//package normal_window 
