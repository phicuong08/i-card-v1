//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
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
    import spark.effects.*;
    import combat_element.*;
    import flash.utils.*;
    import combat_element_script.*;
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

	use namespace mx_internal;
    public class GuideMaskWindow extends UIComponent implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function GuideMaskWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GuideMaskWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_guide_GuideMaskWindowWatcherSetupUtil");
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
            this.x = -385;
            this.y = -380;
            this.width = 2050;
            this.height = 1250;
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this._GuideMaskWindow_Fade1_i();
            this.addEventListener("creationComplete", this.___GuideMaskWindow_UIComponent1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GuideMaskWindow._watcherSetupUtil = _arg1;
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
        public function playAddEffect():void{
            this.addEffect.stop();
            this.addEffect.play();
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function uicomponent1_creationCompleteHandler(_arg1:FlexEvent):void{
            var _local2:BitmapData = new BitmapData(width, height, true, 4278190080);
            addChild(new Bitmap(_local2));
        }
        private function _GuideMaskWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 0.4;
            _local1.duration = 200;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function ___GuideMaskWindow_UIComponent1_creationComplete(_arg1:FlexEvent):void{
            this.uicomponent1_creationCompleteHandler(_arg1);
        }
        private function _GuideMaskWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_GUIDE_MASK_WINDOW);
            }, null, "this.depth");
            result[1] = new Binding(this, function ():Object{
                return (this);
            }, null, "addEffect.target");
            return (result);
        }
        public function get addEffect():Fade{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Fade):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }

    }
}//package task_guide 
