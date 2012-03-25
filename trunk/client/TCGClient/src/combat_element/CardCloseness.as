//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import __AS3__.vec.*;
    import spark.effects.*;
    import spark.filters.*;
    import card_ui.*;
    import custom_effect.*;
    import SoundSystem.*;
    import flash.utils.*;
    import combat_element_script.*;
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

    public class CardCloseness extends CardImage implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1020166578fadeInEffect:Fade;
        private var _207684226glowEffect:AnimateFilter;
        private var _1267520715removeEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        public var type:int = 1;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardCloseness(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardCloseness_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_CardClosenessWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
              //  return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this._CardCloseness_Fade1_i();
            this._CardCloseness_AnimateFilter1_i();
            this._CardCloseness_Fade2_i();
            this.addEventListener("creationComplete", this.___CardCloseness_CardImage1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardCloseness._watcherSetupUtil = _arg1;
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
        protected function group_creationCompleteHandler(_arg1:FlexEvent):void{
            this.x = 598;
            this.y = 344;
            this.transformX = 42;
            this.transformY = 56;
            this.scaleX = 3;
            this.scaleY = 3;
            SoundMgr.getInstance().playEffectSound("cast");
            switch (this.type){
                case 1:
                    this.showGlowEffect();
                    break;
                case 2:
                    this.showBrightnessEffect();
                    break;
                case 3:
                    this.showWaveEffect();
                    break;
                case 4:
                    this.showShakeEffect();
                    break;
            };
        }
        private function showGlowEffect():void{
            var fadeInEffectEndHandler:* = null;
            fadeInEffectEndHandler = function (_arg1:EffectEvent):void{
                fadeInEffect.removeEventListener(EffectEvent.EFFECT_END, fadeInEffectEndHandler);
                glowEffect.play();
            };
            this.fadeInEffect.play();
            this.fadeInEffect.addEventListener(EffectEvent.EFFECT_END, fadeInEffectEndHandler);
        }
        private function showBrightnessEffect():void{
            var target:* = null;
            var s:* = null;
            var scaleEndHandler:* = null;
            scaleEndHandler = function (_arg1:CustomEffectEvent):void{
                var brightEffect:* = null;
                var brightEffectEndHandler:* = null;
                var e:* = _arg1;
                brightEffectEndHandler = function (_arg1:CustomEffectEvent):void{
                    var brightEffect2EndHandler:* = null;
                    var e:* = _arg1;
                    brightEffect2EndHandler = function (_arg1:CustomEffectEvent):void{
                        brightEffect.removeEventListener(CustomEffectEvent.END, brightEffect2EndHandler);
                        removeEffect.play();
                    };
                    brightEffect.removeEventListener(CustomEffectEvent.END, brightEffectEndHandler);
                    brightEffect = new BrightnessFilterEffect(target, 250, 0.7, 0);
                    brightEffect.play();
                    brightEffect.addEventListener(CustomEffectEvent.END, brightEffect2EndHandler);
                };
                s.removeEventListener(CustomEffectEvent.END, scaleEndHandler);
                brightEffect = new BrightnessFilterEffect(target, 150, 0, 0.7);
                brightEffect.play();
                brightEffect.addEventListener(CustomEffectEvent.END, brightEffectEndHandler);
            };
            target = this;
            target.scaleX = 0.01;
            s = new ScaleEffect(target, 100, 3, 3);
            s.play();
            s.addEventListener(CustomEffectEvent.END, scaleEndHandler);
        }
        private function showWaveEffect():void{
            var waveEffect:* = null;
            var waveEffectEndHandler:* = null;
            waveEffectEndHandler = function (_arg1:CustomEffectEvent):void{
                var t:* = null;
                var timerHandler:* = null;
                var e:* = _arg1;
                timerHandler = function (_arg1:TimerEvent):void{
                    t.stop();
                    t.removeEventListener(TimerEvent.TIMER, timerHandler);
                    removeEffect.play();
                };
                waveEffect.removeEventListener(CustomEffectEvent.END, waveEffectEndHandler);
                t = new Timer(300, 1);
                t.addEventListener(TimerEvent.TIMER, timerHandler);
                t.start();
            };
            this.fadeInEffect.play();
            waveEffect = new PixelBenderWaveReflectionEffect(this, 500);
            waveEffect.progressFrom = 0;
            waveEffect.progressTo = 0.1;
            waveEffect.amplitudeFrom = 1;
            waveEffect.amplitudeTo = 0;
            waveEffect.play();
            waveEffect.addEventListener(CustomEffectEvent.END, waveEffectEndHandler);
        }
        private function showShakeEffect():void{
            var shakeEffect:* = null;
            var shakeEffectEndHandler:* = null;
            shakeEffectEndHandler = function (_arg1:CustomEffectEvent):void{
                var t:* = null;
                var timerHandler:* = null;
                var e:* = _arg1;
                timerHandler = function (_arg1:TimerEvent):void{
                    t.stop();
                    t.removeEventListener(TimerEvent.TIMER, timerHandler);
                    removeEffect.play();
                };
                shakeEffect.removeEventListener(CustomEffectEvent.END, shakeEffectEndHandler);
                t = new Timer(300, 1);
                t.addEventListener(TimerEvent.TIMER, timerHandler);
                t.start();
            };
            this.fadeInEffect.play();
            shakeEffect = new ShakeEffect(this, 500, 15);
            shakeEffect.play();
            shakeEffect.addEventListener(CustomEffectEvent.END, shakeEffectEndHandler);
        }
        protected function removeSelf():void{
            var _local1:* = parent;
            if (_local1 != null){
                _local1.removeElement(this);
            };
        }
        private function _CardCloseness_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 200;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        private function _CardCloseness_AnimateFilter1_i():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 500;
            _local1.bitmapFilter = this._CardCloseness_GlowFilter1_c();
            new Vector.<MotionPath>(3)[0] = this._CardCloseness_SimpleMotionPath1_c();
            new Vector.<MotionPath>(3)[1] = this._CardCloseness_SimpleMotionPath2_c();
            new Vector.<MotionPath>(3)[2] = this._CardCloseness_SimpleMotionPath3_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            _local1.addEventListener("effectEnd", this.__glowEffect_effectEnd);
            this.glowEffect = _local1;
            BindingManager.executeBindings(this, "glowEffect", this.glowEffect);
            return (_local1);
        }
        private function _CardCloseness_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF0000;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardCloseness_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 0.8;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardCloseness_SimpleMotionPath2_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 200;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardCloseness_SimpleMotionPath3_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 200;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function __glowEffect_effectEnd(_arg1:EffectEvent):void{
            this.removeEffect.play();
        }
        private function _CardCloseness_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.startDelay = 200;
            _local1.duration = 300;
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            this.removeSelf();
        }
        public function ___CardCloseness_CardImage1_creationComplete(_arg1:FlexEvent):void{
            this.group_creationCompleteHandler(_arg1);
        }
        private function _CardCloseness_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_CARD_CLOSENESS);
            }, null, "this.depth");
            result[1] = new Binding(this, function ():Object{
                return (this);
            }, null, "fadeInEffect.target");
            result[2] = new Binding(this, function ():Object{
                return (this);
            }, null, "glowEffect.target");
            result[3] = new Binding(this, function ():Object{
                return (this);
            }, null, "removeEffect.target");
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

    }
}//package combat_element 
