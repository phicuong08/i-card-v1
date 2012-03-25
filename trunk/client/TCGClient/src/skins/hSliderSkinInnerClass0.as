//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
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

    public class hSliderSkinInnerClass0 extends DataRenderer implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1184053038labelDisplay:Label;
        private var _88844982outerDocument:hSliderSkin;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function hSliderSkinInnerClass0(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._hSliderSkinInnerClass0_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_skins_hSliderSkinInnerClass0WatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (hSliderSkinInnerClass0[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.minHeight = 24;
            this.minWidth = 40;
            this.y = -34;
            this.mxmlContent = [this._hSliderSkinInnerClass0_Rect1_c(), this._hSliderSkinInnerClass0_Label1_i()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            hSliderSkinInnerClass0._watcherSetupUtil = _arg1;
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
        private function _hSliderSkinInnerClass0_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.top = 0;
            _local1.left = 0;
            _local1.right = 0;
            _local1.bottom = 0;
            _local1.fill = this._hSliderSkinInnerClass0_SolidColor1_c();
            _local1.filters = [this._hSliderSkinInnerClass0_DropShadowFilter1_c()];
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _hSliderSkinInnerClass0_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            _local1.alpha = 0.9;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _hSliderSkinInnerClass0_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.angle = 90;
            _local1.color = 0x999999;
            _local1.distance = 3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _hSliderSkinInnerClass0_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.horizontalCenter = 0;
            _local1.verticalCenter = 1;
            _local1.left = 5;
            _local1.right = 5;
            _local1.top = 5;
            _local1.bottom = 5;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontWeight", "normal");
            _local1.setStyle("color", 0xFFFFFF);
            _local1.setStyle("fontSize", 12);
            _local1.id = "labelDisplay";
            if (!_local1.document){
                _local1.document = this;
            };
            this.labelDisplay = _local1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return (_local1);
        }
        private function _hSliderSkinInnerClass0_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():String{
                var _local1:* = int(data);
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "labelDisplay.text");
            return (result);
        }
        public function get labelDisplay():Label{
            return (this._1184053038labelDisplay);
        }
        public function set labelDisplay(_arg1:Label):void{
            var _local2:Object = this._1184053038labelDisplay;
            if (_local2 !== _arg1){
                this._1184053038labelDisplay = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelDisplay", _local2, _arg1));
                };
            };
        }
        public function get outerDocument():hSliderSkin{
            return (this._88844982outerDocument);
        }
        public function set outerDocument(_arg1:hSliderSkin):void{
            var _local2:Object = this._88844982outerDocument;
            if (_local2 !== _arg1){
                this._88844982outerDocument = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local2, _arg1));
                };
            };
        }

    }
}//package skins 
