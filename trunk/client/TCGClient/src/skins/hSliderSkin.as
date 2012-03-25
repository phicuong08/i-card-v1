//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import spark.skins.spark.*;
    import spark.skins.*;

    public class hSliderSkin extends SparkSkin implements IStateClient2 {

        private var _1443184785dataTip:ClassFactory;
        private var _110342614thumb:Button;
        private var _110621003track:Button;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:HSlider;

        public function hSliderSkin(){
            this.minHeight = 11;
            this.mxmlContent = [this._hSliderSkin_Button1_i(), this._hSliderSkin_Button2_i()];
            this.currentState = "normal";
            this._hSliderSkin_ClassFactory1_i();
            states = [new State({
                name:"normal",
                overrides:[]
            }), new State({
                name:"disabled",
                overrides:[new SetProperty().initializeFromObject({
                    name:"alpha",
                    value:0.5
                })]
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
        override protected function measure():void{
            var _local1:Number = this.thumb.getLayoutBoundsX();
            this.thumb.setLayoutBoundsPosition(0, this.thumb.getLayoutBoundsY());
            super.measure();
            this.thumb.setLayoutBoundsPosition(_local1, this.thumb.getLayoutBoundsY());
        }
        private function _hSliderSkin_ClassFactory1_i():ClassFactory{
            var _local1:ClassFactory = new ClassFactory();
            _local1.generator = hSliderSkinInnerClass0;
            _local1.properties = {outerDocument:this};
            this.dataTip = _local1;
            BindingManager.executeBindings(this, "dataTip", this.dataTip);
            return (_local1);
        }
        private function _hSliderSkin_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.left = 0;
            _local1.right = 0;
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.minWidth = 33;
            _local1.width = 100;
            _local1.setStyle("chromeColor", 2893350);
            _local1.setStyle("skinClass", HSliderTrackSkin);
            _local1.id = "track";
            if (!_local1.document){
                _local1.document = this;
            };
            this.track = _local1;
            BindingManager.executeBindings(this, "track", this.track);
            return (_local1);
        }
        private function _hSliderSkin_Button2_i():Button{
            var _local1:Button;
            _local1 = new Button();
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.width = 11;
            _local1.height = 11;
            _local1.setStyle("chromeColor", 4138260);
            _local1.setStyle("skinClass", HSliderThumbSkin);
            _local1.id = "thumb";
            if (!_local1.document){
                _local1.document = this;
            };
            this.thumb = _local1;
            BindingManager.executeBindings(this, "thumb", this.thumb);
            return (_local1);
        }
        public function get dataTip():ClassFactory{
            return (this._1443184785dataTip);
        }
        public function set dataTip(_arg1:ClassFactory):void{
            var _local2:Object = this._1443184785dataTip;
            if (_local2 !== _arg1){
                this._1443184785dataTip = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataTip", _local2, _arg1));
                };
            };
        }
        public function get thumb():Button{
            return (this._110342614thumb);
        }
        public function set thumb(_arg1:Button):void{
            var _local2:Object = this._110342614thumb;
            if (_local2 !== _arg1){
                this._110342614thumb = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "thumb", _local2, _arg1));
                };
            };
        }
        public function get track():Button{
            return (this._110621003track);
        }
        public function set track(_arg1:Button):void{
            var _local2:Object = this._110621003track;
            if (_local2 !== _arg1){
                this._110621003track = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "track", _local2, _arg1));
                };
            };
        }
        public function get hostComponent():HSlider{
            return (this._213507019hostComponent);
        }
        public function set hostComponent(_arg1:HSlider):void{
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
