//Created by Action Script Viewer - http://www.buraks.com/asv
package shop_system {
    import mx.core.*;
    import mx.events.*;
    import flash.events.*;
    import spark.components.*;
    import mx.binding.*;

    public class ShopColorTabButtonWindow extends Group {

        private var _225512976cardBaggage:ShopColorTabButtonWindowItem;
        private var _690865825rarelyCard:ShopColorTabButtonWindowItem;
        private var __moduleFactoryInitialized:Boolean = false;
        public var selectedItem:ShopColorTabButtonWindowItem;

        public function ShopColorTabButtonWindow(){
            this.width = 360;
            this.height = 27;
            this.mxmlContent = [this._ShopColorTabButtonWindow_ShopColorTabButtonWindowItem1_i(), this._ShopColorTabButtonWindow_ShopColorTabButtonWindowItem2_i(), this._ShopColorTabButtonWindow_ShopColorTabButtonWindowItem3_c()];
            this.addEventListener("creationComplete", this.___ShopColorTabButtonWindow_Group1_creationComplete);
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
        protected function item_clickHandler(_arg1:MouseEvent):void{
            var _local2:ShopColorTabButtonWindowItem = (_arg1.currentTarget as ShopColorTabButtonWindowItem);
            if (_local2 != this.selectedItem){
                if (this.selectedItem){
                    this.selectedItem.isSelected = false;
                };
                this.selectedItem = _local2;
                this.selectedItem.isSelected = true;
            };
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.selectedItem = this.cardBaggage;
            this.selectedItem.isSelected = true;
        }
        private function _ShopColorTabButtonWindow_ShopColorTabButtonWindowItem1_i():ShopColorTabButtonWindowItem{
            var _local1:ShopColorTabButtonWindowItem = new ShopColorTabButtonWindowItem();
            _local1.title = "卡包";
            _local1.addEventListener("click", this.__cardBaggage_click);
            _local1.id = "cardBaggage";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardBaggage = _local1;
            BindingManager.executeBindings(this, "cardBaggage", this.cardBaggage);
            return (_local1);
        }
        public function __cardBaggage_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        private function _ShopColorTabButtonWindow_ShopColorTabButtonWindowItem2_i():ShopColorTabButtonWindowItem{
            var _local1:ShopColorTabButtonWindowItem;
            _local1 = new ShopColorTabButtonWindowItem();
            _local1.x = 72;
            _local1.title = "卡片";
            _local1.addEventListener("click", this.__rarelyCard_click);
            _local1.id = "rarelyCard";
            if (!_local1.document){
                _local1.document = this;
            };
            this.rarelyCard = _local1;
            BindingManager.executeBindings(this, "rarelyCard", this.rarelyCard);
            return (_local1);
        }
        public function __rarelyCard_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        private function _ShopColorTabButtonWindow_ShopColorTabButtonWindowItem3_c():ShopColorTabButtonWindowItem{
            var _local1:ShopColorTabButtonWindowItem;
            _local1 = new ShopColorTabButtonWindowItem();
            _local1.x = 144;
            _local1.title = "道具";
            _local1.addEventListener("click", this.___ShopColorTabButtonWindow_ShopColorTabButtonWindowItem3_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___ShopColorTabButtonWindow_ShopColorTabButtonWindowItem3_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        public function ___ShopColorTabButtonWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function get cardBaggage():ShopColorTabButtonWindowItem{
            return (this._225512976cardBaggage);
        }
        public function set cardBaggage(_arg1:ShopColorTabButtonWindowItem):void{
            var _local2:Object = this._225512976cardBaggage;
            if (_local2 !== _arg1){
                this._225512976cardBaggage = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardBaggage", _local2, _arg1));
                };
            };
        }
        public function get rarelyCard():ShopColorTabButtonWindowItem{
            return (this._690865825rarelyCard);
        }
        public function set rarelyCard(_arg1:ShopColorTabButtonWindowItem):void{
            var _local2:Object = this._690865825rarelyCard;
            if (_local2 !== _arg1){
                this._690865825rarelyCard = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rarelyCard", _local2, _arg1));
                };
            };
        }

    }
}//package shop_system 
