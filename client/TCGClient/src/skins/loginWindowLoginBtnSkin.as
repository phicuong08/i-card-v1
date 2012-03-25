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

    public class loginWindowLoginBtnSkin extends SparkSkin implements IStateClient2 {

        private var _1779941047buttonImage:SmoothImage;
        private var _599691451colorFilter:ColorMatrixFilter;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml_source_loginWindowUI______png_759103046:Class;
        private var _213507019hostComponent:Button;

        public function loginWindowLoginBtnSkin(){
            this._embed_mxml_source_loginWindowUI______png_759103046 = loginWindowLoginBtnSkin__embed_mxml_source_loginWindowUI______png_759103046;
            super();
            this.filters = [this._loginWindowLoginBtnSkin_ColorMatrixFilter1_i()];
            this.mxmlContent = [this._loginWindowLoginBtnSkin_SmoothImage1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___loginWindowLoginBtnSkin_SparkSkin1_creationComplete);
            this.addEventListener("currentStateChange", this.___loginWindowLoginBtnSkin_SparkSkin1_currentStateChange);
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
            if (this.colorFilter){
                if (currentState == "up"){
                    this.colorFilter.matrix = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
                } else {
                    this.colorFilter.matrix = ColorUtil.getColorMatrixByBrightness(0.7);
                };
                if (currentState == "down"){
                    this.buttonImage.x = 2;
                    this.buttonImage.y = 2;
                } else {
                    this.buttonImage.x = 0;
                    this.buttonImage.y = 0;
                };
            };
        }
        protected function sparkskin1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.graphics.clear();
            this.graphics.beginFill(0, 0);
            this.graphics.drawRect(0, 0, this.buttonImage.width, this.buttonImage.height);
            this.graphics.endFill();
        }
        private function _loginWindowLoginBtnSkin_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this.colorFilter = _local1;
            BindingManager.executeBindings(this, "colorFilter", this.colorFilter);
            return (_local1);
        }
        private function _loginWindowLoginBtnSkin_SmoothImage1_i():SmoothImage{
            var _local1:SmoothImage = new SmoothImage();
            _local1.source = this._embed_mxml_source_loginWindowUI______png_759103046;
            _local1.id = "buttonImage";
            if (!_local1.document){
                _local1.document = this;
            };
            this.buttonImage = _local1;
            BindingManager.executeBindings(this, "buttonImage", this.buttonImage);
            return (_local1);
        }
        public function ___loginWindowLoginBtnSkin_SparkSkin1_creationComplete(_arg1:FlexEvent):void{
            this.sparkskin1_creationCompleteHandler(_arg1);
        }
        public function ___loginWindowLoginBtnSkin_SparkSkin1_currentStateChange(_arg1:StateChangeEvent):void{
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
