//Created by Action Script Viewer - http://www.buraks.com/asv
package auction_system {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
    import spark.filters.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import item_system.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import tool.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class AuctionItemInfoWindow extends Group {

        private var _1177037892itemDesc:RichText;
        private var _1906890994numLabel:Label;
        private var _1481293013priceLabel:Label;
        private var _2105107894targetImage:ItemCardBaggageImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _itemSource:Object;
        private var creationHasComplete:Boolean = false;

        public function AuctionItemInfoWindow(){
            this.width = 250;
            this.height = 550;
            this.layout = this._AuctionItemInfoWindow_BasicLayout1_c();
            this.mxmlContent = [this._AuctionItemInfoWindow_Label1_c(), this._AuctionItemInfoWindow_CommonMiddleFrame1_c(), this._AuctionItemInfoWindow_Rect1_c(), this._AuctionItemInfoWindow_CommonInnerFrame1_c(), this._AuctionItemInfoWindow_ItemCardBaggageImage1_i(), this._AuctionItemInfoWindow_RichText1_i(), this._AuctionItemInfoWindow_CommonInnerFrame2_c(), this._AuctionItemInfoWindow_Label2_i(), this._AuctionItemInfoWindow_CommonInnerFrame3_c(), this._AuctionItemInfoWindow_Label3_i()];
            this.addEventListener("creationComplete", this.___AuctionItemInfoWindow_Group1_creationComplete);
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
                this.color = 15124616;
                this.fontSize = 14;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function set itemSource(_arg1:Object):void{
            if (this._itemSource == _arg1){
                return;
            };
            this._itemSource = _arg1;
            this.displayItem();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.displayItem();
        }
        private function displayItem():void{
            var _local1:Object;
            var _local2:String;
            if (((this._itemSource) && (this.creationHasComplete))){
                _local1 = ItemCardLib.getItemInfoById(this._itemSource.item_id);
                this.targetImage.targetInfo = _local1;
                _local2 = (_local1.isCard) ? (_local1["info"] + _local1["skill_info"]) : _local1["desc"];
                this.itemDesc.textFlow = StringUtils.createTFByHtmlText(_local2);
                this.numLabel.text = ("商品数量：" + this._itemSource.num);
                this.priceLabel.text = ("商品价格：" + this._itemSource.price);
            };
        }
        private function _AuctionItemInfoWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_Label1_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 32;
            _local1.y = 35;
            _local1.text = "商品信息：";
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_CommonMiddleFrame1_c():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 22;
            _local1.y = 62;
            _local1.width = 200;
            _local1.height = 455;
            _local1.alpha = 0.85;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 32;
            _local1.y = 68;
            _local1.alpha = 0.4;
            _local1.width = 179;
            _local1.height = 205;
            _local1.radiusX = 5;
            _local1.radiusY = 5;
            _local1.fill = this._AuctionItemInfoWindow_SolidColor1_c();
            _local1.stroke = this._AuctionItemInfoWindow_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 13156254;
            _local1.weight = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_CommonInnerFrame1_c():CommonInnerFrame{
            var _local1:CommonInnerFrame;
            _local1 = new CommonInnerFrame();
            _local1.x = 32;
            _local1.y = 283;
            _local1.width = 180;
            _local1.height = 165;
            _local1.alpha = 0.9;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_ItemCardBaggageImage1_i():ItemCardBaggageImage{
            var _local1:ItemCardBaggageImage;
            _local1 = new ItemCardBaggageImage();
            _local1.x = 55;
            _local1.y = 81;
            _local1.scaleX = 1.6;
            _local1.scaleY = 1.6;
            _local1.filters = [this._AuctionItemInfoWindow_DropShadowFilter1_c()];
            _local1.id = "targetImage";
            if (!_local1.document){
                _local1.document = this;
            };
            this.targetImage = _local1;
            BindingManager.executeBindings(this, "targetImage", this.targetImage);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.angle = 40;
            _local1.distance = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 47;
            _local1.y = 291;
            _local1.width = 155;
            _local1.height = 155;
            _local1.id = "itemDesc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemDesc = _local1;
            BindingManager.executeBindings(this, "itemDesc", this.itemDesc);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_CommonInnerFrame2_c():CommonInnerFrame{
            var _local1:CommonInnerFrame = new CommonInnerFrame();
            _local1.x = 47;
            _local1.y = 456;
            _local1.width = 150;
            _local1.height = 25;
            _local1.alpha = 0.9;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 70;
            _local1.y = 456;
            _local1.text = "商品数量：";
            _local1.width = 150;
            _local1.height = 25;
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "numLabel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.numLabel = _local1;
            BindingManager.executeBindings(this, "numLabel", this.numLabel);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_CommonInnerFrame3_c():CommonInnerFrame{
            var _local1:CommonInnerFrame = new CommonInnerFrame();
            _local1.x = 47;
            _local1.y = 485;
            _local1.width = 150;
            _local1.height = 25;
            _local1.alpha = 0.9;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemInfoWindow_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 70;
            _local1.y = 485;
            _local1.text = "商品价格：";
            _local1.width = 150;
            _local1.height = 25;
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "priceLabel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.priceLabel = _local1;
            BindingManager.executeBindings(this, "priceLabel", this.priceLabel);
            return (_local1);
        }
        public function ___AuctionItemInfoWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function get itemDesc():RichText{
            return (this._1177037892itemDesc);
        }
        public function set itemDesc(_arg1:RichText):void{
            var _local2:Object = this._1177037892itemDesc;
            if (_local2 !== _arg1){
                this._1177037892itemDesc = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemDesc", _local2, _arg1));
                };
            };
        }
        public function get numLabel():Label{
            return (this._1906890994numLabel);
        }
        public function set numLabel(_arg1:Label):void{
            var _local2:Object = this._1906890994numLabel;
            if (_local2 !== _arg1){
                this._1906890994numLabel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numLabel", _local2, _arg1));
                };
            };
        }
        public function get priceLabel():Label{
            return (this._1481293013priceLabel);
        }
        public function set priceLabel(_arg1:Label):void{
            var _local2:Object = this._1481293013priceLabel;
            if (_local2 !== _arg1){
                this._1481293013priceLabel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "priceLabel", _local2, _arg1));
                };
            };
        }
        public function get targetImage():ItemCardBaggageImage{
            return (this._2105107894targetImage);
        }
        public function set targetImage(_arg1:ItemCardBaggageImage):void{
            var _local2:Object = this._2105107894targetImage;
            if (_local2 !== _arg1){
                this._2105107894targetImage = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetImage", _local2, _arg1));
                };
            };
        }

    }
}//package auction_system 
