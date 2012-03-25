//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import spark.skins.*;

    public class playerViewMenuBtnSkin extends SparkSkin implements IStateClient2 {

        private var _1184053038labelDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:Button;

        public function playerViewMenuBtnSkin(){
            this.mxmlContent = [this._playerViewMenuBtnSkin_Label1_i()];
            this.currentState = "up";
            states = [new State({
                name:"up",
                overrides:[]
            }), new State({
                name:"over",
                overrides:[new SetStyle().initializeFromObject({
                    target:"labelDisplay",
                    name:"color",
                    value:0xFFFFFF
                })]
            }), new State({
                name:"down",
                overrides:[new SetProperty().initializeFromObject({
                    target:"labelDisplay",
                    name:"left",
                    value:2
                }), new SetProperty().initializeFromObject({
                    target:"labelDisplay",
                    name:"top",
                    value:2
                })]
            }), new State({
                name:"disabled",
                overrides:[new SetStyle().initializeFromObject({
                    target:"labelDisplay",
                    name:"color",
                    value:0x8A8A8A
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
        private function _playerViewMenuBtnSkin_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.maxDisplayedLines = 1;
            _local1.left = 0;
            _local1.right = 0;
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 12235670);
            _local1.id = "labelDisplay";
            if (!_local1.document){
                _local1.document = this;
            };
            this.labelDisplay = _local1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return (_local1);
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
