//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import spark.filters.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import tool.*;
    import flash.net.*;
    import spark.skins.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class universalImageButtonSkin extends SparkSkin implements IBindingClient, IStateClient2 {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1779941047buttonImage:SmoothBitmapImage;
        private var _599691451colorFilter:ColorMatrixFilter;
        private var _121676534glowImg:SmoothBitmapImage;
        private var _1184053038labelDisplay:Label;
        private var _1959277521labelImg:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:Button;

        public function universalImageButtonSkin(){
            var bindings:* = null;
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            bindings = this._universalImageButtonSkin_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_skins_universalImageButtonSkinWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
 //               return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.filters = [this._universalImageButtonSkin_ColorMatrixFilter1_i()];
            this.mxmlContent = [this._universalImageButtonSkin_SmoothBitmapImage1_i(), this._universalImageButtonSkin_SmoothBitmapImage2_i(), this._universalImageButtonSkin_Label1_i(), this._universalImageButtonSkin_SmoothBitmapImage3_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___universalImageButtonSkin_SparkSkin1_creationComplete);
            this.addEventListener("currentStateChange", this.___universalImageButtonSkin_SparkSkin1_currentStateChange);
            states = [new State({
                name:"up",
                overrides:[]
            }), new State({
                name:"over",
                overrides:[]
            }), new State({
                name:"down",
                overrides:[]
            }), new State({
                name:"disabled",
                overrides:[]
            })];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            universalImageButtonSkin._watcherSetupUtil = _arg1;
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
        protected function init():void{
            this.labelImg.source = this.hostComponent.getStyle("labelImage");
            this.glowImg.source = this.hostComponent.getStyle("glowImage");
            this.setImage();
        }
        protected function setImage():void{
            var _local1:String;
            var _local2:*;
            if (this.buttonImage){
                _local1 = (this.currentState + "Image");
                _local2 = this.hostComponent.getStyle(_local1);
                _local2 = (_local2) ? _local2 : this.hostComponent.getStyle("upImage");
                if (_local2){
                    this.buttonImage.source = _local2;
                };
                this.glowImg.visible = (((currentState == "over")) || ((currentState == "down")));
            };
            if (this.colorFilter){
                if (currentState == "disabled"){
                    this.colorFilter.matrix = ColorUtil.getGrayColorMatrix();
                } else {
                    this.colorFilter.matrix = ColorUtil.getColorMatrixByBrightness(0);
                };
            };
        }
        private function _universalImageButtonSkin_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this.colorFilter = _local1;
            BindingManager.executeBindings(this, "colorFilter", this.colorFilter);
            return (_local1);
        }
        private function _universalImageButtonSkin_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.transformX = 80;
            _local1.transformY = 22;
            _local1.initialized(this, "buttonImage");
            this.buttonImage = _local1;
            BindingManager.executeBindings(this, "buttonImage", this.buttonImage);
            return (_local1);
        }
        private function _universalImageButtonSkin_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.verticalCenter = -2;
            _local1.horizontalCenter = 0;
            _local1.initialized(this, "labelImg");
            this.labelImg = _local1;
            BindingManager.executeBindings(this, "labelImg", this.labelImg);
            return (_local1);
        }
        private function _universalImageButtonSkin_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.maxDisplayedLines = 1;
            _local1.top = 0;
            _local1.bottom = 6;
            _local1.left = 0;
            _local1.right = 0;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("color", 15058785);
            _local1.id = "labelDisplay";
            if (!_local1.document){
                _local1.document = this;
            };
            this.labelDisplay = _local1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return (_local1);
        }
        private function _universalImageButtonSkin_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.transformX = 80;
            _local1.transformY = 22;
            _local1.initialized(this, "glowImg");
            this.glowImg = _local1;
            BindingManager.executeBindings(this, "glowImg", this.glowImg);
            return (_local1);
        }
        public function ___universalImageButtonSkin_SparkSkin1_creationComplete(_arg1:FlexEvent):void{
            this.init();
        }
        public function ___universalImageButtonSkin_SparkSkin1_currentStateChange(_arg1:StateChangeEvent):void{
            this.setImage();
        }
        private function _universalImageButtonSkin_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (hostComponent.getStyle("btnScale"));
            }, null, "buttonImage.scaleX");
            result[1] = new Binding(this, function ():Number{
                return (hostComponent.getStyle("btnScale"));
            }, null, "buttonImage.scaleY");
            result[2] = new Binding(this, function ():Number{
                return (hostComponent.getStyle("btnScale"));
            }, null, "glowImg.scaleX");
            result[3] = new Binding(this, function ():Number{
                return (hostComponent.getStyle("btnScale"));
            }, null, "glowImg.scaleY");
            return (result);
        }
        public function get buttonImage():SmoothBitmapImage{
            return (this._1779941047buttonImage);
        }
        public function set buttonImage(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1779941047buttonImage;
            if (_local2 !== _arg1){
                this._1779941047buttonImage = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buttonImage", _local2, _arg1));
                };
            };
        }
        public function get colorFilter():ColorMatrixFilter{
            return (this._599691451colorFilter);
        }
        public function set colorFilter(_arg1:ColorMatrixFilter):void{
            var _local2:Object = this._599691451colorFilter;
            if (_local2 !== _arg1){
                this._599691451colorFilter = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorFilter", _local2, _arg1));
                };
            };
        }
        public function get glowImg():SmoothBitmapImage{
            return (this._121676534glowImg);
        }
        public function set glowImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._121676534glowImg;
            if (_local2 !== _arg1){
                this._121676534glowImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowImg", _local2, _arg1));
                };
            };
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
        public function get labelImg():SmoothBitmapImage{
            return (this._1959277521labelImg);
        }
        public function set labelImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1959277521labelImg;
            if (_local2 !== _arg1){
                this._1959277521labelImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelImg", _local2, _arg1));
                };
            };
        }
        public function get hostComponent():Button{
            return (this._213507019hostComponent);
        }
        public function set hostComponent(_arg1:Button):void{
            var _local2:Object = this._213507019hostComponent;
            if (_local2 !== _arg1){
                this._213507019hostComponent = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _local2, _arg1));
                };
            };
        }

    }
}//package skins 
