//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import ui_element.*;
    import spark.filters.*;
    import SoundSystem.*;
    import tool.*;
    import spark.skins.*;

    public class brownNormalButtonSkin extends SparkSkin implements IStateClient2 {

        private var _1378831417btnImg:BrownNormalButtonImage;
        private var _599691451colorFilter:ColorMatrixFilter;
        private var _1184053038labelDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:Button;

        public function brownNormalButtonSkin(){
            this.filters = [this._brownNormalButtonSkin_ColorMatrixFilter1_i()];
            this.mxmlContent = [this._brownNormalButtonSkin_BrownNormalButtonImage1_i(), this._brownNormalButtonSkin_Label1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___brownNormalButtonSkin_SparkSkin1_creationComplete);
            this.addEventListener("resize", this.___brownNormalButtonSkin_SparkSkin1_resize);
            this.addEventListener("currentStateChange", this.___brownNormalButtonSkin_SparkSkin1_currentStateChange);
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
        protected function setImageSize():void{
            this.graphics.clear();
            this.graphics.beginFill(0, 0);
            this.graphics.drawRect(0, 0, width, height);
            this.graphics.endFill();
            if (this.btnImg){
                this.btnImg.size = [width, height];
            };
            if (this.labelDisplay){
                this.labelDisplay.width = width;
                this.labelDisplay.height = height;
            };
        }
        private function changeFilter():void{
            if (((((!(this.colorFilter)) || (!(this.labelDisplay)))) || (!(this.btnImg)))){
                return;
            };
            if (currentState == "disabled"){
                this.colorFilter.matrix = ColorUtil.getGrayColorMatrix();
            } else {
                if (currentState == "up"){
                    this.colorFilter.matrix = ColorUtil.getColorMatrixByBrightness(0);
                } else {
                    this.colorFilter.matrix = ColorUtil.getColorMatrixByBrightness(0.15);
                };
            };
            if (currentState == "down"){
                SoundMgr.getInstance().playEffectSound("click_2");
                this.labelDisplay.x = 2;
                this.labelDisplay.y = 2;
                this.btnImg.x = 2;
                this.btnImg.y = 2;
            } else {
                this.labelDisplay.x = 0;
                this.labelDisplay.y = 0;
                this.btnImg.x = 0;
                this.btnImg.y = 0;
            };
        }
        private function _brownNormalButtonSkin_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this.colorFilter = _local1;
            BindingManager.executeBindings(this, "colorFilter", this.colorFilter);
            return (_local1);
        }
        private function _brownNormalButtonSkin_BrownNormalButtonImage1_i():BrownNormalButtonImage{
            var _local1:BrownNormalButtonImage = new BrownNormalButtonImage();
            _local1.id = "btnImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.btnImg = _local1;
            BindingManager.executeBindings(this, "btnImg", this.btnImg);
            return (_local1);
        }
        private function _brownNormalButtonSkin_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.maxDisplayedLines = 1;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("color", 15971955);
            _local1.setStyle("fontSize", 14);
            _local1.id = "labelDisplay";
            if (!_local1.document){
                _local1.document = this;
            };
            this.labelDisplay = _local1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return (_local1);
        }
        public function ___brownNormalButtonSkin_SparkSkin1_creationComplete(_arg1:FlexEvent):void{
            this.setImageSize();
        }
        public function ___brownNormalButtonSkin_SparkSkin1_resize(_arg1:ResizeEvent):void{
            this.setImageSize();
        }
        public function ___brownNormalButtonSkin_SparkSkin1_currentStateChange(_arg1:StateChangeEvent):void{
            this.changeFilter();
        }
        public function get btnImg():BrownNormalButtonImage{
            return (this._1378831417btnImg);
        }
        public function set btnImg(_arg1:BrownNormalButtonImage):void{
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
