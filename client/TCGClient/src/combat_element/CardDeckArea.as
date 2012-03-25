//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
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

    public class CardDeckArea extends Group {

        private const allCardNum:int = 10;

        private var _1431782237cardNumText:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var cardArray:Array;
        private var lastVisibleCard:MyImage;
        public var cardImage:String = "source/cardImages/card_back.png";

        public function CardDeckArea(){
            this.cardArray = new Array();
            super();
            this.width = 84;
            this.height = 112;
            this.layout = this._CardDeckArea_BasicLayout1_c();
            this.mxmlContent = [this._CardDeckArea_Label1_i()];
            this.addEventListener("creationComplete", this.___CardDeckArea_Group1_creationComplete);
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
        public function setCardImage(_arg1:String):void{
            var _local2:MyImage;
            for each (_local2 in this.cardArray) {
                _local2.source = _arg1;
            };
            this.cardImage = _arg1;
        }
        public function setCardNum(_arg1:int):void{
            var _local4:MyImage;
            visible = true;
            var _local2:int = this.allCardNum;
            if (_arg1 == 0){
                this.cardNumText.text = "";
                toolTip = null;
                _local2 = 0;
            } else {
                if (_arg1 > 80){
                    this.cardNumText.text = "--";
                    toolTip = "剩余 -- 张";
                } else {
                    _local2 = ((_arg1 / 4) + 1);
                    this.cardNumText.text = (_arg1 + " 张");
                    toolTip = (("剩余 " + _arg1) + " 张");
                };
            };
            var _local3:int;
            while (_local3 < this.allCardNum) {
                _local4 = (this.cardArray[_local3] as MyImage);
                _local4.visible = (_local2 > _local3);
                _local3++;
            };
            this.drawShadow((((_local2 > this.allCardNum)) ? this.allCardNum : _local2 * 4));
            this.setLastVisibelCard(((_local2 >= this.allCardNum)) ? this.cardArray[(this.allCardNum - 1)] : this.cardArray[_local2]);
        }
        public function reset():void{
            var _local1:MyImage;
            for each (_local1 in this.cardArray) {
                _local1.visible = false;
            };
            this.setLastVisibelCard(this.cardArray[0]);
            this.cardNumText.text = "";
            toolTip = null;
            this.drawShadow(0);
        }
        private function drawShadow(_arg1:Number):void{
            this.graphics.clear();
            this.graphics.beginFill(0, 0.4);
            this.graphics.drawRoundRect((-12 - _arg1), -23, _arg1, 157, 5, 5);
            this.graphics.endFill();
        }
        public function getXPos():Number{
            return ((x + this.lastVisibleCard.x));
        }
        public function getYPos():Number{
            return ((y + this.lastVisibleCard.y));
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            var _local2:int;
            var _local3:MyImage;
            _local2 = 0;
            while (_local2 < this.allCardNum) {
                _local3 = new MyImage();
                _local3.source = this.cardImage;
                _local3.width = 84;
                _local3.height = 112;
                _local3.transformX = 42;
                _local3.transformY = 56;
                _local3.scaleX = GameCard.CARD_IMAGE_SCALE;
                _local3.scaleY = GameCard.CARD_IMAGE_SCALE;
                _local3.x = (-(_local2) * 1.6);
                _local3.y = (-(_local2) * 4);
                addElement(_local3);
                this.cardArray.push(_local3);
                _local3.visible = false;
                _local2++;
            };
            this.setLastVisibelCard(this.cardArray[0]);
        }
        private function setLastVisibelCard(_arg1:MyImage):void{
            this.lastVisibleCard = _arg1;
            this.cardNumText.x = (this.lastVisibleCard.x + 15);
            this.cardNumText.y = (this.lastVisibleCard.y + 95);
        }
        private function _CardDeckArea_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDeckArea_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.depth = 1;
            _local1.width = 70;
            _local1.height = 25;
            _local1.filters = [this._CardDeckArea_GlowFilter1_c()];
            _local1.setStyle("color", 13947602);
            _local1.setStyle("fontSize", 25);
            _local1.setStyle("textAlign", "right");
            _local1.id = "cardNumText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardNumText = _local1;
            BindingManager.executeBindings(this, "cardNumText", this.cardNumText);
            return (_local1);
        }
        private function _CardDeckArea_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardDeckArea_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function get cardNumText():Label{
            return (this._1431782237cardNumText);
        }
        public function set cardNumText(_arg1:Label):void{
            var _local2:Object = this._1431782237cardNumText;
            if (_local2 !== _arg1){
                this._1431782237cardNumText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardNumText", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
