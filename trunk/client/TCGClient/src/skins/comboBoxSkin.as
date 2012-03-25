//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import spark.skins.spark.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import spark.skins.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class comboBoxSkin extends SparkSkin implements IStateClient2 {

        private var _1332194002background:Rect;
        private var _1391998104bgFill:SolidColor;
        private var _385593099dataGroup:DataGroup;
        private var _433014735dropDown:Group;
        private var _906978543dropShadow:RectangularDropShadow;
        private var _137111012openButton:Button;
        private var _106851532popUp:PopUpAnchor;
        private var _402164678scroller:Scroller;
        private var _1058056547textInput:TextInput;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:ComboBox;

        public function comboBoxSkin(){
            this.mxmlContent = [this._comboBoxSkin_Button1_i(), this._comboBoxSkin_Rect3_c(), this._comboBoxSkin_Rect4_c(), this._comboBoxSkin_TextInput1_i()];
            this.currentState = "normal";
            var _local1:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._comboBoxSkin_PopUpAnchor1_i, this._comboBoxSkin_PopUpAnchor1_r);
            states = [new State({
                name:"normal",
                overrides:[new SetProperty().initializeFromObject({
                    target:"popUp",
                    name:"displayPopUp",
                    value:false
                })]
            }), new State({
                name:"open",
                overrides:[new AddItems().initializeFromObject({
                    destructionPolicy:"auto",
                    itemsFactory:_local1,
                    destination:null,
                    propertyName:"mxmlContent",
                    position:"first"
                }), new SetProperty().initializeFromObject({
                    target:"popUp",
                    name:"displayPopUp",
                    value:true
                })]
            }), new State({
                name:"disabled",
                overrides:[]
            })];
        }
        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            var factory:* = _arg1;
            super.moduleFactory = factory;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
            if (!this.styleDeclaration){
                this.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
            };
            this.styleDeclaration.defaultFactory = function ():void{
                this.color = 14400386;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        private function _comboBoxSkin_PopUpAnchor1_i():PopUpAnchor{
            var _local1:PopUpAnchor = new PopUpAnchor();
            _local1.left = 0;
            _local1.right = 0;
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.popUpPosition = "below";
            _local1.popUpWidthMatchesAnchorWidth = true;
            _local1.popUp = this._comboBoxSkin_Group1_i();
            _local1.id = "popUp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.popUp = _local1;
            BindingManager.executeBindings(this, "popUp", this.popUp);
            return (_local1);
        }
        private function _comboBoxSkin_PopUpAnchor1_r():void{
            return;
            /*not popped
            (this.dataGroup = null)
            */
            /*not popped
            (this.scroller = null)
            */
            /*not popped
            (this.bgFill = null)
            */
            /*not popped
            (this.background = null)
            */
            /*not popped
            (this.dropShadow = null)
            */
            /*not popped
            (this.dropDown = null)
            */
            /*not popped
            (this.popUp = null)
            */
        }
        private function _comboBoxSkin_Group1_i():Group{
            var _local1:Group = new Group();
            _local1.maxHeight = 134;
            _local1.minHeight = 22;
            _local1.mxmlContent = [this._comboBoxSkin_RectangularDropShadow1_i(), this._comboBoxSkin_Rect1_c(), this._comboBoxSkin_Rect2_i(), this._comboBoxSkin_Scroller1_i()];
            _local1.id = "dropDown";
            if (!_local1.document){
                _local1.document = this;
            };
            this.dropDown = _local1;
            BindingManager.executeBindings(this, "dropDown", this.dropDown);
            return (_local1);
        }
        private function _comboBoxSkin_RectangularDropShadow1_i():RectangularDropShadow{
            var _local1:RectangularDropShadow = new RectangularDropShadow();
            _local1.blurX = 20;
            _local1.blurY = 20;
            _local1.alpha = 0.45;
            _local1.distance = 7;
            _local1.angle = 90;
            _local1.color = 0;
            _local1.left = 0;
            _local1.top = 0;
            _local1.right = 0;
            _local1.bottom = 0;
            _local1.id = "dropShadow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.dropShadow = _local1;
            BindingManager.executeBindings(this, "dropShadow", this.dropShadow);
            return (_local1);
        }
        private function _comboBoxSkin_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.left = 0;
            _local1.right = 0;
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.stroke = this._comboBoxSkin_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _comboBoxSkin_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 6709332;
            _local1.weight = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _comboBoxSkin_Rect2_i():Rect{
            var _local1:Rect = new Rect();
            _local1.left = 1;
            _local1.right = 1;
            _local1.top = 1;
            _local1.bottom = 1;
            _local1.fill = this._comboBoxSkin_SolidColor1_i();
            _local1.initialized(this, "background");
            this.background = _local1;
            BindingManager.executeBindings(this, "background", this.background);
            return (_local1);
        }
        private function _comboBoxSkin_SolidColor1_i():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 2563347;
            this.bgFill = _local1;
            BindingManager.executeBindings(this, "bgFill", this.bgFill);
            return (_local1);
        }
        private function _comboBoxSkin_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.left = 0;
            _local1.top = 0;
            _local1.right = 0;
            _local1.bottom = 0;
            _local1.hasFocusableChildren = false;
            _local1.minViewportInset = 1;
            _local1.viewport = this._comboBoxSkin_DataGroup1_i();
            _local1.id = "scroller";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scroller = _local1;
            BindingManager.executeBindings(this, "scroller", this.scroller);
            return (_local1);
        }
        private function _comboBoxSkin_DataGroup1_i():DataGroup{
            var _local1:DataGroup = new DataGroup();
            _local1.itemRenderer = this._comboBoxSkin_ClassFactory1_c();
            _local1.layout = this._comboBoxSkin_VerticalLayout1_c();
            _local1.setStyle("rollOverColor", 8090474);
            _local1.setStyle("textAlign", "center");
            _local1.addEventListener("creationComplete", this.__dataGroup_creationComplete);
            _local1.id = "dataGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.dataGroup = _local1;
            BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
            return (_local1);
        }
        private function _comboBoxSkin_ClassFactory1_c():ClassFactory{
            var _local1:ClassFactory = new ClassFactory();
            _local1.generator = DefaultItemRenderer;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _comboBoxSkin_VerticalLayout1_c():VerticalLayout{
            var _local1:VerticalLayout = new VerticalLayout();
            _local1.gap = 0;
            _local1.horizontalAlign = "contentJustify";
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function __dataGroup_creationComplete(_arg1:FlexEvent):void{
            this.dataGroup.setStyle("selectionColor", 6510409);
        }
        private function _comboBoxSkin_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.width = 19;
            _local1.right = 0;
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.focusEnabled = false;
            _local1.setStyle("skinClass", ComboBoxButtonSkin);
            _local1.id = "openButton";
            if (!_local1.document){
                _local1.document = this;
            };
            this.openButton = _local1;
            BindingManager.executeBindings(this, "openButton", this.openButton);
            return (_local1);
        }
        private function _comboBoxSkin_Rect3_c():Rect{
            var _local1:Rect = new Rect();
            _local1.left = 0;
            _local1.right = 0;
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.stroke = this._comboBoxSkin_SolidColorStroke2_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _comboBoxSkin_SolidColorStroke2_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 6709332;
            _local1.weight = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _comboBoxSkin_Rect4_c():Rect{
            var _local1:Rect = new Rect();
            _local1.left = 1;
            _local1.right = 1;
            _local1.top = 1;
            _local1.bottom = 1;
            _local1.fill = this._comboBoxSkin_SolidColor2_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _comboBoxSkin_SolidColor2_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 1709581;
            _local1.alpha = 0.7;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _comboBoxSkin_TextInput1_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.left = 0;
            _local1.right = 18;
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("skinClass", textInputSkin);
            _local1.id = "textInput";
            if (!_local1.document){
                _local1.document = this;
            };
            this.textInput = _local1;
            BindingManager.executeBindings(this, "textInput", this.textInput);
            return (_local1);
        }
        public function get background():Rect{
            return (this._1332194002background);
        }
        public function set background(_arg1:Rect):void{
            var _local2:Object = this._1332194002background;
            if (_local2 !== _arg1){
                this._1332194002background = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "background", _local2, _arg1));
                };
            };
        }
        public function get bgFill():SolidColor{
            return (this._1391998104bgFill);
        }
        public function set bgFill(_arg1:SolidColor):void{
            var _local2:Object = this._1391998104bgFill;
            if (_local2 !== _arg1){
                this._1391998104bgFill = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgFill", _local2, _arg1));
                };
            };
        }
        public function get dataGroup():DataGroup{
            return (this._385593099dataGroup);
        }
        public function set dataGroup(_arg1:DataGroup):void{
            var _local2:Object = this._385593099dataGroup;
            if (_local2 !== _arg1){
                this._385593099dataGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataGroup", _local2, _arg1));
                };
            };
        }
        public function get dropDown():Group{
            return (this._433014735dropDown);
        }
        public function set dropDown(_arg1:Group):void{
            var _local2:Object = this._433014735dropDown;
            if (_local2 !== _arg1){
                this._433014735dropDown = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropDown", _local2, _arg1));
                };
            };
        }
        public function get dropShadow():RectangularDropShadow{
            return (this._906978543dropShadow);
        }
        public function set dropShadow(_arg1:RectangularDropShadow):void{
            var _local2:Object = this._906978543dropShadow;
            if (_local2 !== _arg1){
                this._906978543dropShadow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropShadow", _local2, _arg1));
                };
            };
        }
        public function get openButton():Button{
            return (this._137111012openButton);
        }
        public function set openButton(_arg1:Button):void{
            var _local2:Object = this._137111012openButton;
            if (_local2 !== _arg1){
                this._137111012openButton = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openButton", _local2, _arg1));
                };
            };
        }
        public function get popUp():PopUpAnchor{
            return (this._106851532popUp);
        }
        public function set popUp(_arg1:PopUpAnchor):void{
            var _local2:Object = this._106851532popUp;
            if (_local2 !== _arg1){
                this._106851532popUp = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popUp", _local2, _arg1));
                };
            };
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
        public function get textInput():TextInput{
            return (this._1058056547textInput);
        }
        public function set textInput(_arg1:TextInput):void{
            var _local2:Object = this._1058056547textInput;
            if (_local2 !== _arg1){
                this._1058056547textInput = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textInput", _local2, _arg1));
                };
            };
        }
        public function get hostComponent():ComboBox{
            return (this._213507019hostComponent);
        }
        public function set hostComponent(_arg1:ComboBox):void{
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
