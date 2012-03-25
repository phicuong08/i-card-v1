//Created by Action Script Viewer - http://www.buraks.com/asv
package beginner_guide {
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

    public class HightLightEffectWindow extends UIComponent implements IBeginnerGuideOperation, IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1020166578fadeInEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function HightLightEffectWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._HightLightEffectWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_beginner_guide_HightLightEffectWindowWatcherSetupUtil");
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
            this._HightLightEffectWindow_Fade1_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            HightLightEffectWindow._watcherSetupUtil = _arg1;
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
        private function setHightLightArea(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:Number, _arg5:Number, _arg6:Number):void{
            this.graphics.clear();
            this.graphics.beginFill(0, _arg1);
            this.graphics.drawRect(0, 0, 0x0500, 800);
            this.graphics.drawRoundRect(_arg2, _arg3, _arg4, _arg5, _arg6, _arg6);
            this.graphics.endFill();
        }
        public function setInfo(_arg1:Object):void{
            this.setHightLightArea(((_arg1["maskAlpha"])!=null) ? _arg1["maskAlpha"] : 0.4, _arg1["x"], _arg1["y"], _arg1["width"], _arg1["height"], (_arg1["radio"]) ? _arg1["radio"] : 0);
            if (_arg1["mouseDisabled"]){
                mouseEnabled = false;
            };
        }
        public function removeOperation(_arg1:Object=null):void{
            this.removeSelf();
        }
        public function doCmd(_arg1:Object=null){
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function _HightLightEffectWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 500;
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        private function _HightLightEffectWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (BeginnerGuideUtil.NOTICE_WINDOW_DEPTH);
            }, null, "this.depth");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeInEffect");
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

    }
}//package beginner_guide 
