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
    import flash.system.*;
    import flash.media.*;
    import spark.filters.*;
    import spark.primitives.*;
    import mx.graphics.*;
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

	use namespace mx_internal;
    public class LevelUpEffect extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _LevelUpEffect_Label2:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1149824338_levelText:String;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function LevelUpEffect(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._LevelUpEffect_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_LevelUpEffectWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (LevelUpEffect[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 456;
            this.height = 254;
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.mxmlContent = [this._LevelUpEffect_Rect1_c(), this._LevelUpEffect_Rect2_c(), this._LevelUpEffect_Label1_c(), this._LevelUpEffect_HGroup1_c()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            LevelUpEffect._watcherSetupUtil = _arg1;
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
        public function set levelText(_arg1:String):void{
            this._levelText = _arg1;
        }
        public function get levelText():String{
            return (this._levelText);
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function _LevelUpEffect_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.top = 5;
            _local1.percentWidth = 100;
            _local1.height = 5;
            _local1.fill = this._LevelUpEffect_LinearGradient1_c();
            _local1.filters = [this._LevelUpEffect_GlowFilter1_c()];
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._LevelUpEffect_GradientEntry1_c(), this._LevelUpEffect_GradientEntry2_c(), this._LevelUpEffect_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 13679985;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 13679985;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 13679985;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_Rect2_c():Rect{
            var _local1:Rect = new Rect();
            _local1.bottom = 5;
            _local1.percentWidth = 100;
            _local1.height = 5;
            _local1.fill = this._LevelUpEffect_LinearGradient2_c();
            _local1.filters = [this._LevelUpEffect_GlowFilter2_c()];
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_LinearGradient2_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._LevelUpEffect_GradientEntry4_c(), this._LevelUpEffect_GradientEntry5_c(), this._LevelUpEffect_GradientEntry6_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_GradientEntry4_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 13679985;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_GradientEntry5_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 13679985;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_GradientEntry6_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 13679985;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.text = "等级提升！！";
            _local1.horizontalCenter = 0;
            _local1.y = 47;
            _local1.filters = [this._LevelUpEffect_BevelFilter1_c()];
            _local1.setStyle("fontSize", 50);
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("color", 16699961);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_BevelFilter1_c():BevelFilter{
            var _local1:BevelFilter = new BevelFilter();
            _local1.distance = 5;
            _local1.angle = 45;
            _local1.highlightColor = 0xE6E6E6;
            _local1.highlightAlpha = 0.8;
            _local1.shadowColor = 0;
            _local1.shadowAlpha = 0.8;
            _local1.blurX = 3;
            _local1.blurY = 3;
            _local1.strength = 1;
            _local1.quality = 5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_HGroup1_c():HGroup{
            var _local1:HGroup = new HGroup();
            _local1.horizontalCenter = 0;
            _local1.y = 134;
            _local1.mxmlContent = [this._LevelUpEffect_Label2_i(), this._LevelUpEffect_Label3_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.filters = [this._LevelUpEffect_BevelFilter2_c()];
            _local1.setStyle("fontSize", 100);
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontFamily", "Georgia");
            _local1.setStyle("color", 16699961);
            _local1.id = "_LevelUpEffect_Label2";
            if (!_local1.document){
                _local1.document = this;
            };
            this._LevelUpEffect_Label2 = _local1;
            BindingManager.executeBindings(this, "_LevelUpEffect_Label2", this._LevelUpEffect_Label2);
            return (_local1);
        }
        private function _LevelUpEffect_BevelFilter2_c():BevelFilter{
            var _local1:BevelFilter = new BevelFilter();
            _local1.distance = 5;
            _local1.angle = 45;
            _local1.highlightColor = 0xE6E6E6;
            _local1.highlightAlpha = 0.8;
            _local1.shadowColor = 0;
            _local1.shadowAlpha = 0.8;
            _local1.blurX = 3;
            _local1.blurY = 3;
            _local1.strength = 1;
            _local1.quality = 5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_Label3_c():Label{
            var _local1:Label = new Label();
            _local1.text = "级";
            _local1.x = 285;
            _local1.filters = [this._LevelUpEffect_BevelFilter3_c()];
            _local1.setStyle("fontSize", 30);
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("color", 16699961);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_BevelFilter3_c():BevelFilter{
            var _local1:BevelFilter = new BevelFilter();
            _local1.distance = 5;
            _local1.angle = 45;
            _local1.highlightColor = 0xE6E6E6;
            _local1.highlightAlpha = 0.8;
            _local1.shadowColor = 0;
            _local1.shadowAlpha = 0.8;
            _local1.blurX = 3;
            _local1.blurY = 3;
            _local1.strength = 1;
            _local1.quality = 5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LevelUpEffect_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():String{
                var _local1:* = _levelText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_LevelUpEffect_Label2.text");
            return (result);
        }
        private function get _levelText():String{
            return (this._1149824338_levelText);
        }
        private function set _levelText(_arg1:String):void{
            var _local2:Object = this._1149824338_levelText;
            if (_local2 !== _arg1){
                this._1149824338_levelText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_levelText", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
