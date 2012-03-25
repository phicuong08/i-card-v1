//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import ui_element.*;
    import spark.skins.*;

    public class dataGridTitleButtonSkin extends SparkSkin implements IStateClient2 {

        private var _1378831417btnImg:DataGridTitleButtonImage;
        private var _1184053038labelDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:Button;

        public function dataGridTitleButtonSkin(){
            this.mxmlContent = [this._dataGridTitleButtonSkin_DataGridTitleButtonImage1_i(), this._dataGridTitleButtonSkin_Label1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___dataGridTitleButtonSkin_SparkSkin1_creationComplete);
            this.addEventListener("resize", this.___dataGridTitleButtonSkin_SparkSkin1_resize);
            states = [new State({
                name:"up",
                overrides:[new SetStyle().initializeFromObject({
                    target:"labelDisplay",
                    name:"color",
                    value:14728581
                })]
            }), new State({
                name:"over",
                overrides:[]
            }), new State({
                name:"down",
                overrides:[new SetProperty().initializeFromObject({
                    target:"labelDisplay",
                    name:"top",
                    value:3
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
        protected function sparkskin1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.btnImg.size = [width, height];
        }
        protected function sparkskin1_resizeHandler(_arg1:ResizeEvent):void{
            if (this.btnImg){
                this.btnImg.size = [width, height];
            };
        }
        private function _dataGridTitleButtonSkin_DataGridTitleButtonImage1_i():DataGridTitleButtonImage{
            var _local1:DataGridTitleButtonImage = new DataGridTitleButtonImage();
            _local1.id = "btnImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.btnImg = _local1;
            BindingManager.executeBindings(this, "btnImg", this.btnImg);
            return (_local1);
        }
        private function _dataGridTitleButtonSkin_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.maxDisplayedLines = 1;
            _local1.left = 0;
            _local1.right = 0;
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("color", 15126902);
            _local1.id = "labelDisplay";
            if (!_local1.document){
                _local1.document = this;
            };
            this.labelDisplay = _local1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return (_local1);
        }
        public function ___dataGridTitleButtonSkin_SparkSkin1_creationComplete(_arg1:FlexEvent):void{
            this.sparkskin1_creationCompleteHandler(_arg1);
        }
        public function ___dataGridTitleButtonSkin_SparkSkin1_resize(_arg1:ResizeEvent):void{
            this.sparkskin1_resizeHandler(_arg1);
        }
        public function get btnImg():DataGridTitleButtonImage{
            return (this._1378831417btnImg);
        }
        public function set btnImg(_arg1:DataGridTitleButtonImage):void{
            var _local2:Object = this._1378831417btnImg;
            if (_local2 !== _arg1){
                this._1378831417btnImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnImg", _local2, _arg1));
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
