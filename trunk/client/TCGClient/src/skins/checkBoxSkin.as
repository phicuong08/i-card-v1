//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import spark.skins.*;

    public class checkBoxSkin extends SparkSkin implements IStateClient2 {

        private static const focusExclusions:Array = ["labelDisplay"];

        public var _checkBoxSkin_SmoothBitmapImage1:SmoothBitmapImage;
        public var _checkBoxSkin_SmoothBitmapImage2:SmoothBitmapImage;
        private var _1184053038labelDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml_source_commonUI___png_6149180:Class;
        private var _embed_mxml_source_commonUI_____png_1080943940:Class;
        private var _213507019hostComponent:CheckBox;

        public function checkBoxSkin(){
            this._embed_mxml_source_commonUI___png_6149180 = checkBoxSkin__embed_mxml_source_commonUI___png_6149180;
            this._embed_mxml_source_commonUI_____png_1080943940 = checkBoxSkin__embed_mxml_source_commonUI_____png_1080943940;
            super();
            this.mxmlContent = [this._checkBoxSkin_SmoothBitmapImage1_i(), this._checkBoxSkin_Label1_i()];
            this.currentState = "up";
            var _local1:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._checkBoxSkin_SmoothBitmapImage2_i);
            states = [new State({
                name:"up",
                overrides:[]
            }), new State({
                name:"over",
                stateGroups:["overStates"],
                overrides:[]
            }), new State({
                name:"down",
                stateGroups:["downStates"],
                overrides:[]
            }), new State({
                name:"disabled",
                stateGroups:["disabledStates"],
                overrides:[new SetProperty().initializeFromObject({
                    name:"alpha",
                    value:0.5
                })]
            }), new State({
                name:"upAndSelected",
                stateGroups:["selectedStates"],
                overrides:[new AddItems().initializeFromObject({
                    itemsFactory:_local1,
                    destination:null,
                    propertyName:"mxmlContent",
                    position:"after",
                    relativeTo:["_checkBoxSkin_SmoothBitmapImage1"]
                })]
            }), new State({
                name:"overAndSelected",
                stateGroups:["selectedStates", "overStates"],
                overrides:[new AddItems().initializeFromObject({
                    itemsFactory:_local1,
                    destination:null,
                    propertyName:"mxmlContent",
                    position:"after",
                    relativeTo:["_checkBoxSkin_SmoothBitmapImage1"]
                })]
            }), new State({
                name:"downAndSelected",
                stateGroups:["selectedStates", "downStates"],
                overrides:[new AddItems().initializeFromObject({
                    itemsFactory:_local1,
                    destination:null,
                    propertyName:"mxmlContent",
                    position:"after",
                    relativeTo:["_checkBoxSkin_SmoothBitmapImage1"]
                })]
            }), new State({
                name:"disabledAndSelected",
                stateGroups:["selectedStates", "disabledStates"],
                overrides:[new AddItems().initializeFromObject({
                    itemsFactory:_local1,
                    destination:null,
                    propertyName:"mxmlContent",
                    position:"after",
                    relativeTo:["_checkBoxSkin_SmoothBitmapImage1"]
                }), new SetProperty().initializeFromObject({
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
        private function _checkBoxSkin_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_____png_1080943940;
            _local1.initialized(this, "_checkBoxSkin_SmoothBitmapImage1");
            this._checkBoxSkin_SmoothBitmapImage1 = _local1;
            BindingManager.executeBindings(this, "_checkBoxSkin_SmoothBitmapImage1", this._checkBoxSkin_SmoothBitmapImage1);
            return (_local1);
        }
        private function _checkBoxSkin_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI___png_6149180;
            _local1.y = 2;
            _local1.initialized(this, "_checkBoxSkin_SmoothBitmapImage2");
            this._checkBoxSkin_SmoothBitmapImage2 = _local1;
            BindingManager.executeBindings(this, "_checkBoxSkin_SmoothBitmapImage2", this._checkBoxSkin_SmoothBitmapImage2);
            return (_local1);
        }
        private function _checkBoxSkin_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.maxDisplayedLines = 1;
            _local1.left = 40;
            _local1.right = 0;
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.setStyle("color", 14401698);
            _local1.setStyle("textAlign", "start");
            _local1.setStyle("verticalAlign", "middle");
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
        public function get hostComponent():CheckBox{
            return (this._213507019hostComponent);
        }
        public function set hostComponent(_arg1:CheckBox):void{
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
