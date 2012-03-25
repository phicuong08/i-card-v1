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
	import mx.effects.Sequence;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.filters.*;
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
	import mx.effects.AnimateProperty;
	
    public class GuideMessageWindow extends Label implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _GuideMessageWindow_AnimateProperty1:AnimateProperty;
        public var _GuideMessageWindow_AnimateProperty2:AnimateProperty;
        private var _1971174280messageEffect:Sequence;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _stepInfo:Object;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function GuideMessageWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GuideMessageWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_guide_GuideMessageWindowWatcherSetupUtil");
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
            this.mouseEnabled = false;
            this.alpha = 0.5;
            this.verticalCenter = 0;
            this.filters = [this._GuideMessageWindow_GlowFilter1_c()];
            this._GuideMessageWindow_Sequence1_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GuideMessageWindow._watcherSetupUtil = _arg1;
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
                this.fontWeight = "bold";
                this.fontSize = 50;
                this.color = 0;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function set stepInfo(_arg1:Object):void{
            this._stepInfo = _arg1;
            text = this._stepInfo["content"];
        }
        private function removeSelf():void{
            var _local1:* = parent;
            if (_local1 != null){
                _local1.removeElement(this);
            };
            dispatchEvent(new Event("finishTask"));
        }
        private function _GuideMessageWindow_Sequence1_i():Sequence{
            var _local1:Sequence = new Sequence();
            _local1.children = [this._GuideMessageWindow_AnimateProperty1_i(), this._GuideMessageWindow_Fade1_c(), this._GuideMessageWindow_Fade2_c(), this._GuideMessageWindow_AnimateProperty2_i()];
            _local1.addEventListener("effectEnd", this.__messageEffect_effectEnd);
            this.messageEffect = _local1;
            BindingManager.executeBindings(this, "messageEffect", this.messageEffect);
            return (_local1);
        }
		
        private function _GuideMessageWindow_AnimateProperty1_i():AnimateProperty{
            var _local1:AnimateProperty = new AnimateProperty();
            _local1.property = "horizontalCenter";
            _local1.toValue = 0;
            _local1.duration = 300;
            _local1.addEventListener("effectStart", this.___GuideMessageWindow_AnimateProperty1_effectStart);
            this._GuideMessageWindow_AnimateProperty1 = _local1;
            BindingManager.executeBindings(this, "_GuideMessageWindow_AnimateProperty1", this._GuideMessageWindow_AnimateProperty1);
            return (_local1);
        }
        public function ___GuideMessageWindow_AnimateProperty1_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("step");
        }
        private function _GuideMessageWindow_Fade1_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0.5;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMessageWindow_Fade2_c():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 1000;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMessageWindow_AnimateProperty2_i():AnimateProperty{
            var _local1:AnimateProperty = new AnimateProperty();
            _local1.property = "horizontalCenter";
            _local1.fromValue = 0;
            _local1.duration = 300;
            _local1.addEventListener("effectStart", this.___GuideMessageWindow_AnimateProperty2_effectStart);
            this._GuideMessageWindow_AnimateProperty2 = _local1;
            BindingManager.executeBindings(this, "_GuideMessageWindow_AnimateProperty2", this._GuideMessageWindow_AnimateProperty2);
            return (_local1);
        }
        public function ___GuideMessageWindow_AnimateProperty2_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("step");
        }
        public function __messageEffect_effectEnd(_arg1:EffectEvent):void{
            this.removeSelf();
        }
        private function _GuideMessageWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            _local1.strength = 30;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideMessageWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "messageEffect");
            result[1] = new Binding(this, function ():Number{
                return ((640 + (width / 2)));
            }, null, "_GuideMessageWindow_AnimateProperty1.fromValue");
            result[2] = new Binding(this, function ():Number{
                return ((-640 - (width / 2)));
            }, null, "_GuideMessageWindow_AnimateProperty2.toValue");
            return (result);
        }
        public function get messageEffect():Sequence{
            return (this._1971174280messageEffect);
        }
        public function set messageEffect(_arg1:Sequence):void{
            var _local2:Object = this._1971174280messageEffect;
            if (_local2 !== _arg1){
                this._1971174280messageEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "messageEffect", _local2, _arg1));
                };
            };
        }

    }
}//package task_guide 
