//Created by Action Script Viewer - http://www.buraks.com/asv
package buff_system {
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
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import flash.utils.*;
    import spark.effects.animation.*;
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

    public class BuffIconWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _BuffIconWindow_SmoothImage1:SmoothImage;
        private var _207684226glowEffect:AnimateFilter;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _738054082iconPath:String;
        private var buffId:int;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function BuffIconWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._BuffIconWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_buff_system_BuffIconWindowWatcherSetupUtil");
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
            this.width = 37;
            this.height = 37;
            this.layout = this._BuffIconWindow_BasicLayout1_c();
            this.mxmlContent = [this._BuffIconWindow_SmoothImage1_i()];
            this._BuffIconWindow_AnimateFilter1_i();
            this.addEventListener("rollOver", this.___BuffIconWindow_Group1_rollOver);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            BuffIconWindow._watcherSetupUtil = _arg1;
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
        public function setBuffId(_arg1:int):void{
            this.buffId = _arg1;
            this.iconPath = (("source/buffImages/" + _arg1) + ".png");
            callLater(this.buildTooltip);
        }
        private function buildTooltip():void{
            toolTip = BuffFunctions.createTooltip(this.buffId);
        }
        public function playRefreshEffect():void{
            this.glowEffect.stop();
            this.glowEffect.play();
            if (this.buffId){
                callLater(this.buildTooltip);
            };
        }
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            if (this.buffId){
                this.buildTooltip();
            };
        }
        private function _BuffIconWindow_AnimateFilter1_i():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.repeatCount = 2;
            _local1.duration = 500;
            _local1.repeatBehavior = "reverse";
            _local1.bitmapFilter = this._BuffIconWindow_GlowFilter1_c();
            new Vector.<MotionPath>(1)[0] = this._BuffIconWindow_SimpleMotionPath1_c();
            _local1.motionPaths = new Vector.<MotionPath>(1);
            this.glowEffect = _local1;
            BindingManager.executeBindings(this, "glowEffect", this.glowEffect);
            return (_local1);
        }
        private function _BuffIconWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 16776492;
            _local1.blurX = 100;
            _local1.blurY = 100;
            _local1.inner = true;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BuffIconWindow_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 0;
            _local1.valueTo = 0.4;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BuffIconWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BuffIconWindow_SmoothImage1_i():SmoothImage{
            var _local1:SmoothImage = new SmoothImage();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.id = "_BuffIconWindow_SmoothImage1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._BuffIconWindow_SmoothImage1 = _local1;
            BindingManager.executeBindings(this, "_BuffIconWindow_SmoothImage1", this._BuffIconWindow_SmoothImage1);
            return (_local1);
        }
        public function ___BuffIconWindow_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        private function _BuffIconWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "glowEffect.target");
            result[1] = new Binding(this, function ():Object{
                return (iconPath);
            }, null, "_BuffIconWindow_SmoothImage1.source");
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
        private function get iconPath():String{
            return (this._738054082iconPath);
        }
        private function set iconPath(_arg1:String):void{
            var _local2:Object = this._738054082iconPath;
            if (_local2 !== _arg1){
                this._738054082iconPath = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconPath", _local2, _arg1));
                };
            };
        }

    }
}//package buff_system 
