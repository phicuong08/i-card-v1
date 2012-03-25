//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import mx.core.*;
    import mx.events.*;
    import flash.events.*;
    import spark.components.*;
    import mx.binding.*;
    import beginner_guide.*;
    import skins.*;

    public class MainMenuWindowShopAuctionItem extends MainMenuWindowItem {

        private var _1851369401btnAuction:Button;
        private var _206192498btnShop:Button;
        private var __moduleFactoryInitialized:Boolean = false;

        public function MainMenuWindowShopAuctionItem(){
            this._MainMenuWindowShopAuctionItem_Button2_i();
            this._MainMenuWindowShopAuctionItem_Button1_i();
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
        override protected function rollOverHandler():void{
            mainGroup.addElement(this.btnShop);
            mainGroup.addElement(this.btnAuction);
            super.rollOverHandler();
        }
        override protected function rollOutHandler():void{
            if (this.btnShop.parent){
                mainGroup.removeElement(this.btnShop);
            };
            if (this.btnAuction.parent){
                mainGroup.removeElement(this.btnAuction);
            };
            super.rollOutHandler();
        }
        protected function btnShop_clickHandler(_arg1:MouseEvent):void{
            TCGClient.getInstance().showShopWindow();
            BeginnerGuideUtil.dispatchLuaEvent("mainMenuEnterShop");
        }
        protected function btnAuction_clickHandler(_arg1:MouseEvent):void{
            TCGClient.getInstance().showAuctionWindow();
            BeginnerGuideUtil.dispatchLuaEvent("mainMenuEnterAuction");
        }
        private function _MainMenuWindowShopAuctionItem_Button2_i():Button{
            var _local1:Button;
            _local1 = new Button();
            _local1.x = 99;
            _local1.y = 106;
            _local1.label = "拍卖行";
            _local1.setStyle("skinClass", combatCardButtonSkin);
            _local1.addEventListener("click", this.__btnAuction_click);
            _local1.id = "btnAuction";
            if (!_local1.document){
                _local1.document = this;
            };
            this.btnAuction = _local1;
            BindingManager.executeBindings(this, "btnAuction", this.btnAuction);
            return (_local1);
        }
        public function __btnAuction_click(_arg1:MouseEvent):void{
            this.btnAuction_clickHandler(_arg1);
        }
        private function _MainMenuWindowShopAuctionItem_Button1_i():Button{
            var _local1:Button;
            _local1 = new Button();
            _local1.x = 99;
            _local1.y = 66;
            _local1.label = "商  城";
            _local1.setStyle("skinClass", combatCardButtonSkin);
            _local1.addEventListener("click", this.__btnShop_click);
            _local1.id = "btnShop";
            if (!_local1.document){
                _local1.document = this;
            };
            this.btnShop = _local1;
            BindingManager.executeBindings(this, "btnShop", this.btnShop);
            return (_local1);
        }
        public function __btnShop_click(_arg1:MouseEvent):void{
            this.btnShop_clickHandler(_arg1);
        }
        public function get btnAuction():Button{
            return (this._1851369401btnAuction);
        }
        public function set btnAuction(_arg1:Button):void{
            var _local2:Object = this._1851369401btnAuction;
            if (_local2 !== _arg1){
                this._1851369401btnAuction = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnAuction", _local2, _arg1));
                };
            };
        }
        public function get btnShop():Button{
            return (this._206192498btnShop);
        }
        public function set btnShop(_arg1:Button):void{
            var _local2:Object = this._206192498btnShop;
            if (_local2 !== _arg1){
                this._206192498btnShop = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnShop", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
