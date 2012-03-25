//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import spark.skins.*;

    public class textInputSkin extends SparkSkin implements IStateClient2 {

        private static const focusExclusions:Array = ["textDisplay"];

        private var _831827669textDisplay:MyRichEditableText;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:TextInput;

        public function textInputSkin(){
            this.blendMode = "normal";
            this.mxmlContent = [this._textInputSkin_MyRichEditableText1_i()];
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
        override public function get focusSkinExclusions():Array{
            return (focusExclusions);
        }
        private function _textInputSkin_MyRichEditableText1_i():MyRichEditableText{
            var _local1:MyRichEditableText = new MyRichEditableText();
            _local1.widthInChars = 10;
            _local1.left = 1;
            _local1.right = 1;
            _local1.top = 1;
            _local1.bottom = 1;
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "textDisplay";
            if (!_local1.document){
                _local1.document = this;
            };
            this.textDisplay = _local1;
            BindingManager.executeBindings(this, "textDisplay", this.textDisplay);
            return (_local1);
        }
        public function get textDisplay():MyRichEditableText{
            return (this._831827669textDisplay);
        }
        public function set textDisplay(_arg1:MyRichEditableText):void{
            var _local2:Object = this._831827669textDisplay;
            if (_local2 !== _arg1){
                this._831827669textDisplay = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textDisplay", _local2, _arg1));
                };
            };
        }
        public function get hostComponent():TextInput{
            return (this._213507019hostComponent);
        }
        public function set hostComponent(_arg1:TextInput):void{
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
