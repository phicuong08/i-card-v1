//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import spark.filters.*;
    import tool.*;
    import spark.skins.*;

    public class imageButtonSkin extends SparkSkin implements IStateClient2 {

        private var _1779941047buttonImage:SmoothBitmapImage;
        private var _1184053038labelDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var f:ColorMatrixFilter;
        private var _213507019hostComponent:Button;

        public function imageButtonSkin(){
            this.mxmlContent = [this._imageButtonSkin_SmoothBitmapImage1_i(), this._imageButtonSkin_Label1_i()];
            this.currentState = "up";
            this.addEventListener("initialize", this.___imageButtonSkin_SparkSkin1_initialize);
            this.addEventListener("creationComplete", this.___imageButtonSkin_SparkSkin1_creationComplete);
            this.addEventListener("currentStateChange", this.___imageButtonSkin_SparkSkin1_currentStateChange);
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
        protected function sparkskin1_initializeHandler(_arg1:FlexEvent):void{
            var _local2:Array;
            if (this.hostComponent.getStyle("userColorMatrixFilter")){
                this.f = new ColorMatrixFilter();
                _local2 = this.filters;
                if (_local2){
                    _local2.push(this.f);
                    this.filters = _local2;
                } else {
                    this.filters = [this.f];
                };
            };
        }
        protected function setImage():void{
            var _local1 = (this.currentState + "Image");
            var _local2:* = this.hostComponent.getStyle(_local1);
            if (_local2){
                this.buttonImage.source = _local2;
            };
            if (this.f){
                if (currentState == "disabled"){
                    this.f.matrix = ColorUtil.getGrayColorMatrix();
                } else {
                    this.f.matrix = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
                };
            };
        }
        private function _imageButtonSkin_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.left = 0;
            _local1.right = 0;
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.initialized(this, "buttonImage");
            this.buttonImage = _local1;
            BindingManager.executeBindings(this, "buttonImage", this.buttonImage);
            return (_local1);
        }
        private function _imageButtonSkin_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.maxDisplayedLines = 1;
            _local1.left = 10;
            _local1.right = 10;
            _local1.top = 2;
            _local1.bottom = 2;
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
        public function ___imageButtonSkin_SparkSkin1_initialize(_arg1:FlexEvent):void{
            this.sparkskin1_initializeHandler(_arg1);
        }
        public function ___imageButtonSkin_SparkSkin1_creationComplete(_arg1:FlexEvent):void{
            this.setImage();
        }
        public function ___imageButtonSkin_SparkSkin1_currentStateChange(_arg1:StateChangeEvent):void{
            this.setImage();
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
