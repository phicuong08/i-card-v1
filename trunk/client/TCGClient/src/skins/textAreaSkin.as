//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import spark.skins.*;

    public class textAreaSkin extends SparkSkin implements IStateClient2 {

        private static const focusExclusions:Array = ["textDisplay"];

        private var _402164678scroller:Scroller;
        private var _831827669textDisplay:TextAreaSkinRET;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:TextArea;

        public function textAreaSkin(){
            this.blendMode = "normal";
            this.mxmlContent = [this._textAreaSkin_Scroller1_i()];
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
        private function _textAreaSkin_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.left = 0;
            _local1.top = 0;
            _local1.right = 0;
            _local1.bottom = 0;
            _local1.minViewportInset = 1;
            _local1.measuredSizeIncludesScrollBars = false;
            _local1.hasFocusableChildren = false;
            _local1.viewport = this._textAreaSkin_TextAreaSkinRET1_i();
            _local1.id = "scroller";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scroller = _local1;
            BindingManager.executeBindings(this, "scroller", this.scroller);
            return (_local1);
        }
        private function _textAreaSkin_TextAreaSkinRET1_i():TextAreaSkinRET{
            var _local1:TextAreaSkinRET = new TextAreaSkinRET();
            _local1.heightInLines = 10;
            _local1.widthInChars = 15;
            _local1.id = "textDisplay";
            if (!_local1.document){
                _local1.document = this;
            };
            this.textDisplay = _local1;
            BindingManager.executeBindings(this, "textDisplay", this.textDisplay);
            return (_local1);
        }
        public function get scroller():Scroller{
            return (this._402164678scroller);
        }
        public function set scroller(_arg1:Scroller):void{
            var _local2:Object = this._402164678scroller;
            if (_local2 !== _arg1){
                this._402164678scroller = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scroller", _local2, _arg1));
                };
            };
        }
        public function get textDisplay():TextAreaSkinRET{
            return (this._831827669textDisplay);
        }
        public function set textDisplay(_arg1:TextAreaSkinRET):void{
            var _local2:Object = this._831827669textDisplay;
            if (_local2 !== _arg1){
                this._831827669textDisplay = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textDisplay", _local2, _arg1));
                };
            };
        }
        public function get hostComponent():TextArea{
            return (this._213507019hostComponent);
        }
        public function set hostComponent(_arg1:TextArea):void{
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
