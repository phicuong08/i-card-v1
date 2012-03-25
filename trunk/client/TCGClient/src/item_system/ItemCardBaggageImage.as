//Created by Action Script Viewer - http://www.buraks.com/asv
package item_system {
    import mx.core.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import card_ui.*;
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

    public class ItemCardBaggageImage extends Group {

        private var __moduleFactoryInitialized:Boolean = false;
        private var _targetInfo:Object;
        private var cardImage:CardImage;
        private var itemImage:ItemImage;
        private var cardBaggageImage:CardBaggageImage;

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
        public function set targetInfo(_arg1:Object):void{
            this._targetInfo = _arg1;
            this.changeDisplayMode();
            if (_arg1.isCard){
                this.cardImage.setCardById(this._targetInfo.id);
            } else {
                if (_arg1.type == "card_baggage"){
                    this.cardBaggageImage.setItemById(this._targetInfo.id);
                } else {
                    this.itemImage.setItemById(this._targetInfo.id);
                };
            };
        }
        public function get targetInfo():Object{
            return (this._targetInfo);
        }
        private function changeDisplayMode():void{
            if (((this.cardImage) && ((this.cardImage.parent == this)))){
                removeElement(this.cardImage);
            };
            if (((this.itemImage) && ((this.itemImage.parent == this)))){
                removeElement(this.itemImage);
            };
            if (((this.cardBaggageImage) && ((this.cardBaggageImage.parent == this)))){
                removeElement(this.cardBaggageImage);
            };
            if (this._targetInfo.isCard){
                if (!this.cardImage){
                    this.cardImage = new CardImage();
                    this.cardImage.alwaysUseSmallFontSize = true;
                };
                addElement(this.cardImage);
            } else {
                if (this._targetInfo.type == "card_baggage"){
                    if (!this.cardBaggageImage){
                        this.cardBaggageImage = new CardBaggageImage();
                    };
                    addElement(this.cardBaggageImage);
                } else {
                    if (!this.itemImage){
                        this.itemImage = new ItemImage();
                    };
                    addElement(this.itemImage);
                };
            };
        }
        public function refreshCardBaggageCollenctionRate():void{
            if (((((this._targetInfo) && ((this._targetInfo.type == "card_baggage")))) && (this.cardBaggageImage))){
                this.cardBaggageImage.setCollectionRateInfo();
            };
        }

    }
}//package item_system 
