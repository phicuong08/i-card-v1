//Created by Action Script Viewer - http://www.buraks.com/asv
package chat_system {
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
	import mx.effects.Sequence;
	import mx.effects.Parallel;
    import spark.components.*;
    import spark.effects.*;
    import spark.filters.*;

	use namespace mx_internal;
    public class ScoreCostEffect extends Label implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;
		public var __slot1;
        private const foodLabelColor:uint = 0xFFD800;

        public var _ScoreCostEffect_GlowFilter1:GlowFilter;
        private var _413245038addEffect:Parallel;
        private var __moduleFactoryInitialized:Boolean = false;
        protected var _102532750moveEffectYBy:Number;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function ScoreCostEffect(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._ScoreCostEffect_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_chat_system_ScoreCostEffectWatcherSetupUtil");
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
            this.alpha = 0;
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.filters = [this._ScoreCostEffect_GlowFilter1_i()];
            this._ScoreCostEffect_Parallel1_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            ScoreCostEffect._watcherSetupUtil = _arg1;
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
                this.fontSize = 18;
                this.fontFamily = "黑体";
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function setInfo(_arg1:int):void{
            text = ("积分-" + _arg1);
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function _ScoreCostEffect_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.children = [this._ScoreCostEffect_Move1_c(), this._ScoreCostEffect_Sequence1_c()];
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _ScoreCostEffect_Move1_c():Move{
            var _local1:Move = new Move();
            _local1.yBy = -60;
            _local1.duration = 1200;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ScoreCostEffect_Sequence1_c():Sequence{
            var _local1:Sequence = new Sequence();
            _local1.children = [this._ScoreCostEffect_Fade1_c(), this._ScoreCostEffect_Fade2_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ScoreCostEffect_Fade1_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ScoreCostEffect_Fade2_c():Fade{
            var _local1:Fade = new Fade();
            _local1.startDelay = 500;
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            _local1.duration = 400;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.removeSelf();
        }
        private function _ScoreCostEffect_GlowFilter1_i():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.blurX = 2;
            _local1.blurY = 2;
            _local1.alpha = 0.6;
            this._ScoreCostEffect_GlowFilter1 = _local1;
            BindingManager.executeBindings(this, "_ScoreCostEffect_GlowFilter1", this._ScoreCostEffect_GlowFilter1);
            return (_local1);
        }
        private function _ScoreCostEffect_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():uint{
                return (foodLabelColor);
            }, function (_arg1:uint):void{
                this.setStyle("color", _arg1);
            }, "this.color");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[2] = new Binding(this, function ():uint{
                return (foodLabelColor);
            }, null, "_ScoreCostEffect_GlowFilter1.color");
            return (result);
        }
        public function get addEffect():Parallel{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Parallel):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        protected function get moveEffectYBy():Number{
            return (this._102532750moveEffectYBy);
        }
        protected function set moveEffectYBy(_arg1:Number):void{
            var _local2:Object = this._102532750moveEffectYBy;
            if (_local2 !== _arg1){
                this._102532750moveEffectYBy = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveEffectYBy", _local2, _arg1));
                };
            };
        }

    }
}//package chat_system 
