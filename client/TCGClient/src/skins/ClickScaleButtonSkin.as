//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.events.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import spark.filters.*;
    import tool.*;
    import spark.skins.*;

    public class ClickScaleButtonSkin extends SparkSkin implements IStateClient2 {

        private var _1779941047buttonImage:SmoothImage;
        private var _599691451colorFilter:ColorMatrixFilter;
        private var _1184053038labelDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:Button;

        public function ClickScaleButtonSkin(){
            this.filters = [this._ClickScaleButtonSkin_ColorMatrixFilter1_i()];
            this.mxmlContent = [this._ClickScaleButtonSkin_SmoothImage1_i(), this._ClickScaleButtonSkin_Label1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___ClickScaleButtonSkin_SparkSkin1_creationComplete);
            this.addEventListener("currentStateChange", this.___ClickScaleButtonSkin_SparkSkin1_currentStateChange);
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
        protected function sparkskin1_currentStateChangeHandler(_arg1:StateChangeEvent):void{
            var _local2:Number;
            if (this.colorFilter){
                if (currentState == "up"){
                    this.colorFilter.matrix = ColorUtil.getColorMatrixByBrightness(0);
                } else {
                    if (currentState == "disabled"){
                        this.colorFilter.matrix = ColorUtil.getGrayColorMatrix();
                    } else {
                        this.colorFilter.matrix = ColorUtil.getColorMatrixByBrightness(0.3);
                    };
                };
                if (currentState == "down"){
                    _local2 = this.hostComponent.getStyle("scaleArg");
                    this.labelDisplay.scaleX = (this.buttonImage.scaleX = (_local2) ? _local2 : 0.95);
                    this.labelDisplay.scaleY = (this.buttonImage.scaleY = (_local2) ? _local2 : 0.95);
                } else {
                    this.labelDisplay.scaleX = (this.buttonImage.scaleX = 1);
                    this.labelDisplay.scaleY = (this.buttonImage.scaleY = 1);
                };
            };
        }
        protected function sparkskin1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.setButtonImage();
            this.hostComponent.addEventListener("buttonImageChanged", this.buttonImageChangedHandler);
        }
        protected function buttonImageChangedHandler(_arg1:Event):void{
            this.setButtonImage();
        }
        protected function setButtonImage():void{
            var _local2:Bitmap;
            var _local1:Class = this.hostComponent.getStyle("buttonImage");
            if (_local1){
                _local2 = new (_local1)();
                this.graphics.clear();
                this.graphics.beginFill(0, 0);
                this.graphics.drawRect(0, 0, _local2.width, _local2.height);
                this.graphics.endFill();
                this.buttonImage.source = _local2;
                this.labelDisplay.width = _local2.width;
                this.labelDisplay.height = _local2.height;
                this.labelDisplay.transformX = (this.buttonImage.transformX = (_local2.width / 2));
                this.labelDisplay.transformY = (this.buttonImage.transformY = (_local2.height / 2));
            };
        }
        private function _ClickScaleButtonSkin_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this.colorFilter = _local1;
            BindingManager.executeBindings(this, "colorFilter", this.colorFilter);
            return (_local1);
        }
        private function _ClickScaleButtonSkin_SmoothImage1_i():SmoothImage{
            var _local1:SmoothImage = new SmoothImage();
            _local1.id = "buttonImage";
            if (!_local1.document){
                _local1.document = this;
            };
            this.buttonImage = _local1;
            BindingManager.executeBindings(this, "buttonImage", this.buttonImage);
            return (_local1);
        }
        private function _ClickScaleButtonSkin_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.maxDisplayedLines = 1;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "labelDisplay";
            if (!_local1.document){
                _local1.document = this;
            };
            this.labelDisplay = _local1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return (_local1);
        }
        public function ___ClickScaleButtonSkin_SparkSkin1_creationComplete(_arg1:FlexEvent):void{
            this.sparkskin1_creationCompleteHandler(_arg1);
        }
        public function ___ClickScaleButtonSkin_SparkSkin1_currentStateChange(_arg1:StateChangeEvent):void{
            this.sparkskin1_currentStateChangeHandler(_arg1);
        }
        public function get buttonImage():SmoothImage{
            return (this._1779941047buttonImage);
        }
        public function set buttonImage(_arg1:SmoothImage):void{
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
