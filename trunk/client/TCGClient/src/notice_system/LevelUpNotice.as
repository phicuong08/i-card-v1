//Created by Action Script Viewer - http://www.buraks.com/asv
package notice_system {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import normal_window.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import custom_effect.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import tool.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

	use namespace mx_internal;
    public class LevelUpNotice extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _LevelUpNotice_LevelUpEffect1:LevelUpEffect;
        private var _413245038addEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1656229167levelText:String;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function LevelUpNotice(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._LevelUpNotice_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_notice_system_LevelUpNoticeWatcherSetupUtil");
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
            this.horizontalCenter = 0;
            this.verticalCenter = 0;
            this.width = 456;
            this.height = 254;
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.depth = 30;
            this.mxmlContent = [this._LevelUpNotice_Rect1_c(), this._LevelUpNotice_LevelUpEffect1_i()];
            this._LevelUpNotice_Fade1_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            LevelUpNotice._watcherSetupUtil = _arg1;
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
        protected function addEffect_effectEndHandler():void{
            CommonUtil.addTimerLaterCall(600, this.removeSelf);
        }
        public function removeSelf():void{
            var _local1:FakeFadeEffect = new FakeFadeEffect(this, 500, 1, 0);
            _local1.effectContainer.depth = this.depth;
            _local1.play();
            var _local2:* = parent;
            if (_local2){
                _local2.removeElement(this);
            };
        }
        private function _LevelUpNotice_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 500;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.addEffect_effectEndHandler();
        }
        private function _LevelUpNotice_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.top = 8;
            _local1.bottom = 8;
            _local1.percentWidth = 100;
            _local1.fill = this._LevelUpNotice_LinearGradient1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpNotice_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._LevelUpNotice_GradientEntry1_c(), this._LevelUpNotice_GradientEntry2_c(), this._LevelUpNotice_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpNotice_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpNotice_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0;
            _local1.alpha = 0.6;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpNotice_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpNotice_LevelUpEffect1_i():LevelUpEffect{
            var _local1:LevelUpEffect = new LevelUpEffect();
            _local1.id = "_LevelUpNotice_LevelUpEffect1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._LevelUpNotice_LevelUpEffect1 = _local1;
            BindingManager.executeBindings(this, "_LevelUpNotice_LevelUpEffect1", this._LevelUpNotice_LevelUpEffect1);
            return (_local1);
        }
        private function _LevelUpNotice_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, null, "_LevelUpNotice_LevelUpEffect1.levelText", "levelText");
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
        public function get levelText():String{
            return (this._1656229167levelText);
        }
        public function set levelText(_arg1:String):void{
            var _local2:Object = this._1656229167levelText;
            if (_local2 !== _arg1){
                this._1656229167levelText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelText", _local2, _arg1));
                };
            };
        }

    }
}//package notice_system 
