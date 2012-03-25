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

    public class combatCardButtonSkin extends SparkSkin implements IStateClient2 {

        private var _488861027_combatCardButtonSkin_DropShadowFilter1:DropShadowFilter;
        private var _1378831417btnImg:SmoothImage;
        private var _599691451colorFilter:ColorMatrixFilter;
        private var _1184053038labelDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml_source_buttonImages________down_png_1971474304:Class;
        private var _embed_mxml_source_buttonImages________over_png_1535512060:Class;
        private var _embed_mxml_source_buttonImages________up_png_2124005170:Class;
        private var _213507019hostComponent:Button;

        public function combatCardButtonSkin(){
            this._embed_mxml_source_buttonImages________down_png_1971474304 = combatCardButtonSkin__embed_mxml_source_buttonImages________down_png_1971474304;
            this._embed_mxml_source_buttonImages________over_png_1535512060 = combatCardButtonSkin__embed_mxml_source_buttonImages________over_png_1535512060;
            this._embed_mxml_source_buttonImages________up_png_2124005170 = combatCardButtonSkin__embed_mxml_source_buttonImages________up_png_2124005170;
            super();
            this.filters = [this._combatCardButtonSkin_ColorMatrixFilter1_i()];
            this.mxmlContent = [this._combatCardButtonSkin_SmoothImage1_i(), this._combatCardButtonSkin_Label1_i()];
            this.currentState = "up";
            this.addEventListener("currentStateChange", this.___combatCardButtonSkin_SparkSkin1_currentStateChange);
            states = [new State({
                name:"up",
                overrides:[]
            }), new State({
                name:"over",
                overrides:[new SetProperty().initializeFromObject({
                    target:"btnImg",
                    name:"source",
                    value:this._embed_mxml_source_buttonImages________over_png_1535512060
                }), new SetStyle().initializeFromObject({
                    target:"labelDisplay",
                    name:"color",
                    value:0xFFFFFF
                }), new SetProperty().initializeFromObject({
                    target:"_combatCardButtonSkin_DropShadowFilter1",
                    name:"color",
                    value:0xFFFFFF
                })]
            }), new State({
                name:"down",
                overrides:[new SetProperty().initializeFromObject({
                    target:"btnImg",
                    name:"source",
                    value:this._embed_mxml_source_buttonImages________down_png_1971474304
                }), new SetStyle().initializeFromObject({
                    target:"labelDisplay",
                    name:"color",
                    value:0xFFFFFF
                }), new SetProperty().initializeFromObject({
                    target:"_combatCardButtonSkin_DropShadowFilter1",
                    name:"color",
                    value:0xFFFFFF
                })]
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
        private function changeFilter():void{
            if (!this.colorFilter){
                return;
            };
            if (currentState == "disabled"){
                this.colorFilter.matrix = ColorUtil.getGrayColorMatrix();
            } else {
                this.colorFilter.matrix = ColorUtil.getColorMatrixByBrightness(0);
            };
        }
        private function _combatCardButtonSkin_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this.colorFilter = _local1;
            BindingManager.executeBindings(this, "colorFilter", this.colorFilter);
            return (_local1);
        }
        private function _combatCardButtonSkin_SmoothImage1_i():SmoothImage{
            var _local1:SmoothImage = new SmoothImage();
            _local1.source = this._embed_mxml_source_buttonImages________up_png_2124005170;
            _local1.id = "btnImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.btnImg = _local1;
            BindingManager.executeBindings(this, "btnImg", this.btnImg);
            return (_local1);
        }
        private function _combatCardButtonSkin_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.maxDisplayedLines = 1;
            _local1.width = 70;
            _local1.height = 40;
            _local1.filters = [this._combatCardButtonSkin_DropShadowFilter1_i()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("color", 15971955);
            _local1.setStyle("fontSize", 16);
            _local1.id = "labelDisplay";
            if (!_local1.document){
                _local1.document = this;
            };
            this.labelDisplay = _local1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return (_local1);
        }
        private function _combatCardButtonSkin_DropShadowFilter1_i():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.strength = 1;
            _local1.distance = 2;
            _local1.alpha = 0.75;
            _local1.color = 0;
            this._combatCardButtonSkin_DropShadowFilter1 = _local1;
            BindingManager.executeBindings(this, "_combatCardButtonSkin_DropShadowFilter1", this._combatCardButtonSkin_DropShadowFilter1);
            return (_local1);
        }
        public function ___combatCardButtonSkin_SparkSkin1_currentStateChange(_arg1:StateChangeEvent):void{
            this.changeFilter();
        }
        public function get _combatCardButtonSkin_DropShadowFilter1():DropShadowFilter{
            return (this._488861027_combatCardButtonSkin_DropShadowFilter1);
        }
        public function set _combatCardButtonSkin_DropShadowFilter1(_arg1:DropShadowFilter):void{
            var _local2:Object = this._488861027_combatCardButtonSkin_DropShadowFilter1;
            if (_local2 !== _arg1){
                this._488861027_combatCardButtonSkin_DropShadowFilter1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_combatCardButtonSkin_DropShadowFilter1", _local2, _arg1));
                };
            };
        }
        public function get btnImg():SmoothImage{
            return (this._1378831417btnImg);
        }
        public function set btnImg(_arg1:SmoothImage):void{
            var _local2:Object = this._1378831417btnImg;
            if (_local2 !== _arg1){
                this._1378831417btnImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnImg", _local2, _arg1));
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
