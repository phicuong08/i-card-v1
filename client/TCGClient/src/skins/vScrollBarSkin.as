//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import spark.skins.spark.*;
    import spark.skins.*;

    public class vScrollBarSkin extends SparkSkin implements IStateClient2 {

        private static const exclusions:Array = ["track", "thumb", "decrementButton", "incrementButton"];

        private var _853009829decrementButton:Button;
        private var _454226047incrementButton:Button;
        private var _110342614thumb:Button;
        private var _110621003track:Button;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:VScrollBar;

        public function vScrollBarSkin(){
            this.minWidth = 15;
            this.minHeight = 35;
            this.mxmlContent = [this._vScrollBarSkin_Button1_i(), this._vScrollBarSkin_Button2_i(), this._vScrollBarSkin_Button3_i(), this._vScrollBarSkin_Button4_i()];
            this.currentState = "normal";
            states = [new State({
                name:"normal",
                overrides:[]
            }), new State({
                name:"disabled",
                overrides:[new SetProperty().initializeFromObject({
                    name:"alpha",
                    value:0.5
                })]
            }), new State({
                name:"inactive",
                overrides:[new SetProperty().initializeFromObject({
                    name:"alpha",
                    value:0.5
                }), new SetProperty().initializeFromObject({
                    target:"thumb",
                    name:"visible",
                    value:false
                }), new SetProperty().initializeFromObject({
                    target:"decrementButton",
                    name:"enabled",
                    value:false
                }), new SetProperty().initializeFromObject({
                    target:"incrementButton",
                    name:"enabled",
                    value:false
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
        override public function get colorizeExclusions():Array{
            return (exclusions);
        }
        override protected function initializationComplete():void{
            useChromeColor = true;
            super.initializationComplete();
        }
        private function _vScrollBarSkin_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.top = 16;
            _local1.bottom = 15;
            _local1.height = 54;
            _local1.focusEnabled = false;
            _local1.setStyle("chromeColor", 2893350);
            _local1.setStyle("skinClass", VScrollBarTrackSkin);
            _local1.id = "track";
            if (!_local1.document){
                _local1.document = this;
            };
            this.track = _local1;
            BindingManager.executeBindings(this, "track", this.track);
            return (_local1);
        }
        private function _vScrollBarSkin_Button2_i():Button{
            var _local1:Button = new Button();
            _local1.focusEnabled = false;
            _local1.setStyle("chromeColor", 4138260);
            _local1.setStyle("skinClass", VScrollBarThumbSkin);
            _local1.id = "thumb";
            if (!_local1.document){
                _local1.document = this;
            };
            this.thumb = _local1;
            BindingManager.executeBindings(this, "thumb", this.thumb);
            return (_local1);
        }
        private function _vScrollBarSkin_Button3_i():Button{
            var _local1:Button = new Button();
            _local1.top = 0;
            _local1.focusEnabled = false;
            _local1.setStyle("chromeColor", 4138260);
            _local1.setStyle("skinClass", ScrollBarUpButtonSkin);
            _local1.id = "decrementButton";
            if (!_local1.document){
                _local1.document = this;
            };
            this.decrementButton = _local1;
            BindingManager.executeBindings(this, "decrementButton", this.decrementButton);
            return (_local1);
        }
        private function _vScrollBarSkin_Button4_i():Button{
            var _local1:Button = new Button();
            _local1.bottom = 0;
            _local1.focusEnabled = false;
            _local1.setStyle("chromeColor", 4138260);
            _local1.setStyle("skinClass", ScrollBarDownButtonSkin);
            _local1.id = "incrementButton";
            if (!_local1.document){
                _local1.document = this;
            };
            this.incrementButton = _local1;
            BindingManager.executeBindings(this, "incrementButton", this.incrementButton);
            return (_local1);
        }
        public function get decrementButton():Button{
            return (this._853009829decrementButton);
        }
        public function set decrementButton(_arg1:Button):void{
            var _local2:Object = this._853009829decrementButton;
            if (_local2 !== _arg1){
                this._853009829decrementButton = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decrementButton", _local2, _arg1));
                };
            };
        }
        public function get incrementButton():Button{
            return (this._454226047incrementButton);
        }
        public function set incrementButton(_arg1:Button):void{
            var _local2:Object = this._454226047incrementButton;
            if (_local2 !== _arg1){
                this._454226047incrementButton = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "incrementButton", _local2, _arg1));
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
        public function get hostComponent():VScrollBar{
            return (this._213507019hostComponent);
        }
        public function set hostComponent(_arg1:VScrollBar):void{
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
