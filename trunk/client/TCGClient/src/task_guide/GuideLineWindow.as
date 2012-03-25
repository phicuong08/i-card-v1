//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
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
    
    import spark.components.*;
    import spark.effects.*;

	use namespace mx_internal;
    public class GuideLineWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private const LINE_HEIGHT:int = 120;

        private var _1020166578fadeInEffect:Fade;
        private var _733607779fadeOutEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function GuideLineWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GuideLineWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_guide_GuideLineWindowWatcherSetupUtil");
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
            this.height = 1;
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this._GuideLineWindow_Fade1_i();
            this._GuideLineWindow_Fade2_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GuideLineWindow._watcherSetupUtil = _arg1;
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
        private function fadeEffectEnd():void{
        }
        public function removeSelf():void{
            if (!this.fadeOutEffect.isPlaying){
                this.fadeOutEffect.play();
            };
        }
        override public function set width(_arg1:Number):void{
            super.width = width;
            this.graphics.clear();
            var _local2:Matrix = new Matrix();
            _local2.createGradientBox(_arg1, this.LINE_HEIGHT, 0, 0, (-(this.LINE_HEIGHT) / 2));
            this.graphics.beginGradientFill(GradientType.LINEAR, [GuideFunctions.GUIDE_COLOR, GuideFunctions.GUIDE_COLOR, GuideFunctions.GUIDE_COLOR], [0.6, 0.4, 0], [0, 200, 0xFF], _local2);
            this.graphics.moveTo(0, (this.LINE_HEIGHT / 2));
            this.graphics.lineTo(0, (-(this.LINE_HEIGHT) / 2));
            this.graphics.lineTo(_arg1, -3);
            this.graphics.lineTo(_arg1, 3);
            this.graphics.lineTo(0, (this.LINE_HEIGHT / 2));
            this.graphics.endFill();
        }
        private function _GuideLineWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 1;
            _local1.duration = 300;
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        private function _GuideLineWindow_Fade2_i():Fade{
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
        private function _GuideLineWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeInEffect");
            result[1] = new Binding(this, function ():Object{
                return (this);
            }, null, "fadeOutEffect.target");
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

    }
}//package task_guide 
