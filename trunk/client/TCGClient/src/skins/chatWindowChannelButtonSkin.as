//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import spark.skins.*;

    public class chatWindowChannelButtonSkin extends SparkSkin implements IStateClient2 {

        private var _1023260935_chatWindowChannelButtonSkin_SmoothBitmapImage1:SmoothBitmapImage;
        private var _1184053038labelDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml_source_chatWindowUI________png_216223682:Class;
        private var _embed_mxml_source_chatWindowUI________png_1929165232:Class;
        private var _213507019hostComponent:Button;

        public function chatWindowChannelButtonSkin(){
            this._embed_mxml_source_chatWindowUI________png_216223682 = chatWindowChannelButtonSkin__embed_mxml_source_chatWindowUI________png_216223682;
            this._embed_mxml_source_chatWindowUI________png_1929165232 = chatWindowChannelButtonSkin__embed_mxml_source_chatWindowUI________png_1929165232;
            super();
            this.width = 34;
            this.height = 17;
            this.mxmlContent = [this._chatWindowChannelButtonSkin_SmoothBitmapImage1_i(), this._chatWindowChannelButtonSkin_Label1_i()];
            this.currentState = "up";
            states = [new State({
                name:"up",
                overrides:[]
            }), new State({
                name:"over",
                overrides:[new SetProperty().initializeFromObject({
                    target:"_chatWindowChannelButtonSkin_SmoothBitmapImage1",
                    name:"source",
                    value:this._embed_mxml_source_chatWindowUI________png_216223682
                })]
            }), new State({
                name:"down",
                overrides:[new SetProperty().initializeFromObject({
                    target:"_chatWindowChannelButtonSkin_SmoothBitmapImage1",
                    name:"source",
                    value:this._embed_mxml_source_chatWindowUI________png_216223682
                }), new SetProperty().initializeFromObject({
                    target:"labelDisplay",
                    name:"top",
                    value:3
                })]
            }), new State({
                name:"disabled",
                overrides:[new SetStyle().initializeFromObject({
                    target:"labelDisplay",
                    name:"color",
                    value:0xA7A7A7
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
        private function _chatWindowChannelButtonSkin_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_chatWindowUI________png_1929165232;
            _local1.initialized(this, "_chatWindowChannelButtonSkin_SmoothBitmapImage1");
            this._chatWindowChannelButtonSkin_SmoothBitmapImage1 = _local1;
            BindingManager.executeBindings(this, "_chatWindowChannelButtonSkin_SmoothBitmapImage1", this._chatWindowChannelButtonSkin_SmoothBitmapImage1);
            return (_local1);
        }
        private function _chatWindowChannelButtonSkin_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.maxDisplayedLines = 1;
            _local1.left = 0;
            _local1.right = 0;
            _local1.top = 0;
            _local1.bottom = 0;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("color", 15906677);
            _local1.id = "labelDisplay";
            if (!_local1.document){
                _local1.document = this;
            };
            this.labelDisplay = _local1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return (_local1);
        }
        public function get _chatWindowChannelButtonSkin_SmoothBitmapImage1():SmoothBitmapImage{
            return (this._1023260935_chatWindowChannelButtonSkin_SmoothBitmapImage1);
        }
        public function set _chatWindowChannelButtonSkin_SmoothBitmapImage1(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1023260935_chatWindowChannelButtonSkin_SmoothBitmapImage1;
            if (_local2 !== _arg1){
                this._1023260935_chatWindowChannelButtonSkin_SmoothBitmapImage1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_chatWindowChannelButtonSkin_SmoothBitmapImage1", _local2, _arg1));
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
