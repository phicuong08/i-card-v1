//Created by Action Script Viewer - http://www.buraks.com/asv
package card_ui {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
    import spark.filters.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class MagicCardImage extends Group {

        public static const CREATION_COMPLETE:String = "creation_complete";

        public static var darkGoldCls:Class = MagicCardImage_darkGoldCls;
        public static var goldCls:Class = MagicCardImage_goldCls;
        public static var silverCls:Class = MagicCardImage_silverCls;
        public static var red:Class = MagicCardImage_red;
        public static var green:Class = MagicCardImage_green;

        private var _1893624907backgroundImg:SmoothBitmapImage;
        private var _8429125cardName:Label;
        private var _8227222cardType:CardTypeSign;
        private var _795280835headImg:MyImage;
        private var _981596097rareImg:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var cardInfo:Object;
        public var creationHasComplete:Boolean = false;

        public function MagicCardImage(){
            this.width = 84;
            this.height = 112;
            this.clipAndEnableScrolling = true;
            this.layout = this._MagicCardImage_BasicLayout1_c();
            this.mxmlContent = [this._MagicCardImage_MyImage1_i(), this._MagicCardImage_SmoothBitmapImage1_i(), this._MagicCardImage_SmoothBitmapImage2_i(), this._MagicCardImage_CardTypeSign1_i(), this._MagicCardImage_Label1_i()];
            this.addEventListener("creationComplete", this.___MagicCardImage_Group1_creationComplete);
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
                this.fontSize = 12;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.buildCardInfo();
        }
        public function setCardInfo(_arg1:Object):void{
            this.cardInfo = _arg1;
            this.buildCardInfo();
        }
        private function buildCardInfo():void{
            if (((this.creationHasComplete) && (this.cardInfo))){
                this.cardType.cardType = this.cardInfo["type"];
                this.cardName.text = this.cardInfo["name"];
                this.backgroundImg.source = MagicCardImage[this.cardInfo["color"]];
                this.headImg.source = (("source/cardImages/" + this.cardInfo["image"]) + ".jpg");
                this.setRareImg(int(this.cardInfo["rare_level"]));
            };
        }
        private function setRareImg(_arg1:int):void{
            switch (_arg1){
                case 0:
                case 1:
                    this.rareImg.source = null;
                    break;
                case 2:
                    this.rareImg.source = silverCls;
                    break;
                case 3:
                    this.rareImg.source = goldCls;
                    break;
                default:
                    this.rareImg.source = darkGoldCls;
            };
        }
        private function _MagicCardImage_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MagicCardImage_MyImage1_i():MyImage{
            var _local1:MyImage;
            _local1 = new MyImage();
            _local1.x = 5;
            _local1.y = 16;
            _local1.width = 74;
            _local1.height = 74;
            _local1.smoothBitmapContent = true;
            _local1.id = "headImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.headImg = _local1;
            BindingManager.executeBindings(this, "headImg", this.headImg);
            return (_local1);
        }
        private function _MagicCardImage_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.width = 84;
            _local1.height = 112;
            _local1.initialized(this, "backgroundImg");
            this.backgroundImg = _local1;
            BindingManager.executeBindings(this, "backgroundImg", this.backgroundImg);
            return (_local1);
        }
        private function _MagicCardImage_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 6;
            _local1.y = 91;
            _local1.width = 72;
            _local1.height = 14;
            _local1.initialized(this, "rareImg");
            this.rareImg = _local1;
            BindingManager.executeBindings(this, "rareImg", this.rareImg);
            return (_local1);
        }
        private function _MagicCardImage_CardTypeSign1_i():CardTypeSign{
            var _local1:CardTypeSign = new CardTypeSign();
            _local1.x = 59;
            _local1.y = -2;
            _local1.width = 23;
            _local1.height = 23;
            _local1.initialized(this, "cardType");
            this.cardType = _local1;
            BindingManager.executeBindings(this, "cardType", this.cardType);
            return (_local1);
        }
        private function _MagicCardImage_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.horizontalCenter = 0;
            _local1.y = 89;
            _local1.width = 74;
            _local1.height = 19;
            _local1.filters = [this._MagicCardImage_GlowFilter1_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("color", 0xFFFFFF);
            _local1.id = "cardName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardName = _local1;
            BindingManager.executeBindings(this, "cardName", this.cardName);
            return (_local1);
        }
        private function _MagicCardImage_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 4;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___MagicCardImage_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function get backgroundImg():SmoothBitmapImage{
            return (this._1893624907backgroundImg);
        }
        public function set backgroundImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1893624907backgroundImg;
            if (_local2 !== _arg1){
                this._1893624907backgroundImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundImg", _local2, _arg1));
                };
            };
        }
        public function get cardName():Label{
            return (this._8429125cardName);
        }
        public function set cardName(_arg1:Label):void{
            var _local2:Object = this._8429125cardName;
            if (_local2 !== _arg1){
                this._8429125cardName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardName", _local2, _arg1));
                };
            };
        }
        public function get cardType():CardTypeSign{
            return (this._8227222cardType);
        }
        public function set cardType(_arg1:CardTypeSign):void{
            var _local2:Object = this._8227222cardType;
            if (_local2 !== _arg1){
                this._8227222cardType = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardType", _local2, _arg1));
                };
            };
        }
        public function get headImg():MyImage{
            return (this._795280835headImg);
        }
        public function set headImg(_arg1:MyImage):void{
            var _local2:Object = this._795280835headImg;
            if (_local2 !== _arg1){
                this._795280835headImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headImg", _local2, _arg1));
                };
            };
        }
        public function get rareImg():SmoothBitmapImage{
            return (this._981596097rareImg);
        }
        public function set rareImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._981596097rareImg;
            if (_local2 !== _arg1){
                this._981596097rareImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rareImg", _local2, _arg1));
                };
            };
        }

    }
}//package card_ui 
