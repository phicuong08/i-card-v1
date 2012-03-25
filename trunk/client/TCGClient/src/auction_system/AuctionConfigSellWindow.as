//Created by Action Script Viewer - http://www.buraks.com/asv
package auction_system {
    import mx.core.*;
    import mx.managers.*;
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
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import baggage.*;
    import skins.*;
    import mx.filters.*;
    import flash.ui.*;
    import trade_system.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class AuctionConfigSellWindow extends Group {

        private var _1070010497commissionCharge:Label;
        private var _1143994228itemPriceInput:TextInput;
        private var _1978277290sellBtn:Button;
        private var _1811769899sellItemWindow:TradeWindowGoodsItem;
        private var __moduleFactoryInitialized:Boolean = false;
        protected var sellItemId:String;
        protected var sellItemNum:int;
        private var _embed_mxml_source_commonUI_______png_425445134:Class;

        public function AuctionConfigSellWindow(){
            this._embed_mxml_source_commonUI_______png_425445134 = AuctionConfigSellWindow__embed_mxml_source_commonUI_______png_425445134;
            super();
            this.width = 250;
            this.height = 400;
            this.layout = this._AuctionConfigSellWindow_BasicLayout1_c();
            this.mxmlContent = [this._AuctionConfigSellWindow_Label1_c(), this._AuctionConfigSellWindow_TradeWindowGoodsItem1_i(), this._AuctionConfigSellWindow_Button1_c(), this._AuctionConfigSellWindow_Label2_c(), this._AuctionConfigSellWindow_SmoothBitmapImage1_c(), this._AuctionConfigSellWindow_TextInput1_i(), this._AuctionConfigSellWindow_Label3_i(), this._AuctionConfigSellWindow_Button2_i()];
            this.addEventListener("dragEnter", this.___AuctionConfigSellWindow_Group1_dragEnter);
            this.addEventListener("dragDrop", this.___AuctionConfigSellWindow_Group1_dragDrop);
            this.addEventListener("creationComplete", this.___AuctionConfigSellWindow_Group1_creationComplete);
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
                this.fontSize = 14;
                this.color = 13156254;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.reset();
        }
        public function reset():void{
            this.commissionCharge.text = "";
            this.sellItemWindow.clearItem();
            this.sellBtn.enabled = false;
        }
        protected function group1_dragEnterHandler(_arg1:DragEvent):void{
            var _local2:Object;
            var _local3:Object;
            if ((_arg1.dragInitiator is BaggageWindowItem)){
                _local2 = (_arg1.dragSource.dataForFormat("source") as Object);
                _local3 = _local2.itemLogicInfo;
                if (AuctionMgr.getInstance().checkAuctionGood(_local3.id, _local3.num)[1]){
                    DragManager.acceptDragDrop(this);
                };
            };
        }
        protected function group1_dragDropHandler(_arg1:DragEvent):void{
            var _local2:Object = (_arg1.dragSource.dataForFormat("source") as Object);
            var _local3:Object = _local2.itemLogicInfo;
            DragManager.showFeedback(DragManager.COPY);
            AuctionMgr.getInstance().showGoodsNumAddWindow(_local3);
        }
        public function putGoodsInDeal(_arg1:String, _arg2:int):void{
            this.sellBtn.enabled = true;
            this.sellItemId = _arg1;
            this.sellItemNum = _arg2;
            this.sellItemWindow.setGoodsInfo(_arg1, _arg2);
            var _local3:Array = LuaAgent.getInstance().run((((("return u.auction_mgr:get_commission_charge(" + _arg1) + ",") + _arg2) + ")"));
            this.commissionCharge.text = (("拍卖手续费：" + _local3[1].toString()) + "金币");
        }
        protected function button1_clickHandler(_arg1:MouseEvent):void{
            var _local3:Array;
            var _local2:int = int(this.itemPriceInput.text);
            if (_local2 > 0){
                _local3 = LuaAgent.getInstance().run((((((("return u.auction_mgr:add_auction_item(" + this.sellItemId) + ", ") + this.sellItemNum) + ", ") + _local2) + ")"));
                if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                    this.reset();
                };
            } else {
                MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "提示", "请正确输入商品出售价格！");
            };
        }
        protected function addCardBtn_clickHandler(_arg1:MouseEvent):void{
            AuctionMgr.getInstance().showAddCardWindow();
        }
        private function _AuctionConfigSellWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigSellWindow_Label1_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.text = "出售栏位：";
            _local1.x = 40;
            _local1.y = 17;
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigSellWindow_TradeWindowGoodsItem1_i():TradeWindowGoodsItem{
            var _local1:TradeWindowGoodsItem;
            _local1 = new TradeWindowGoodsItem();
            _local1.x = 37;
            _local1.y = 46;
            _local1.toolTip = "将要出售的商品放入这个栏位。";
            _local1.id = "sellItemWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.sellItemWindow = _local1;
            BindingManager.executeBindings(this, "sellItemWindow", this.sellItemWindow);
            return (_local1);
        }
        private function _AuctionConfigSellWindow_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.label = "添 加 卡 片";
            _local1.x = 54;
            _local1.y = 119;
            _local1.width = 121;
            _local1.height = 30;
            _local1.toolTip = "点击以打开闲置的卡片库。";
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___AuctionConfigSellWindow_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionConfigSellWindow_Button1_click(_arg1:MouseEvent):void{
            this.addCardBtn_clickHandler(_arg1);
        }
        private function _AuctionConfigSellWindow_Label2_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.text = "商品售价：";
            _local1.x = 40;
            _local1.y = 183;
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigSellWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 40;
            _local1.y = 209;
            _local1.width = 150;
            _local1.height = 25;
            _local1.source = this._embed_mxml_source_commonUI_______png_425445134;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigSellWindow_TextInput1_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 45;
            _local1.y = 184;
            _local1.width = 140;
            _local1.height = 75;
            _local1.restrict = "0-9";
            _local1.setStyle("skinClass", textInputSkin);
            _local1.id = "itemPriceInput";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemPriceInput = _local1;
            BindingManager.executeBindings(this, "itemPriceInput", this.itemPriceInput);
            return (_local1);
        }
        private function _AuctionConfigSellWindow_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 40;
            _local1.y = 253;
            _local1.toolTip = "出售商品需要支付很少的手续费用，以避免一些恶意出售行为。";
            _local1.setStyle("fontSize", 16);
            _local1.id = "commissionCharge";
            if (!_local1.document){
                _local1.document = this;
            };
            this.commissionCharge = _local1;
            BindingManager.executeBindings(this, "commissionCharge", this.commissionCharge);
            return (_local1);
        }
        private function _AuctionConfigSellWindow_Button2_i():Button{
            var _local1:Button = new Button();
            _local1.label = "确 认 出 售";
            _local1.x = 54;
            _local1.y = 285;
            _local1.width = 121;
            _local1.height = 30;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__sellBtn_click);
            _local1.id = "sellBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.sellBtn = _local1;
            BindingManager.executeBindings(this, "sellBtn", this.sellBtn);
            return (_local1);
        }
        public function __sellBtn_click(_arg1:MouseEvent):void{
            this.button1_clickHandler(_arg1);
        }
        public function ___AuctionConfigSellWindow_Group1_dragEnter(_arg1:DragEvent):void{
            this.group1_dragEnterHandler(_arg1);
        }
        public function ___AuctionConfigSellWindow_Group1_dragDrop(_arg1:DragEvent):void{
            this.group1_dragDropHandler(_arg1);
        }
        public function ___AuctionConfigSellWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function get commissionCharge():Label{
            return (this._1070010497commissionCharge);
        }
        public function set commissionCharge(_arg1:Label):void{
            var _local2:Object = this._1070010497commissionCharge;
            if (_local2 !== _arg1){
                this._1070010497commissionCharge = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "commissionCharge", _local2, _arg1));
                };
            };
        }
        public function get itemPriceInput():TextInput{
            return (this._1143994228itemPriceInput);
        }
        public function set itemPriceInput(_arg1:TextInput):void{
            var _local2:Object = this._1143994228itemPriceInput;
            if (_local2 !== _arg1){
                this._1143994228itemPriceInput = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemPriceInput", _local2, _arg1));
                };
            };
        }
        public function get sellBtn():Button{
            return (this._1978277290sellBtn);
        }
        public function set sellBtn(_arg1:Button):void{
            var _local2:Object = this._1978277290sellBtn;
            if (_local2 !== _arg1){
                this._1978277290sellBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sellBtn", _local2, _arg1));
                };
            };
        }
        public function get sellItemWindow():TradeWindowGoodsItem{
            return (this._1811769899sellItemWindow);
        }
        public function set sellItemWindow(_arg1:TradeWindowGoodsItem):void{
            var _local2:Object = this._1811769899sellItemWindow;
            if (_local2 !== _arg1){
                this._1811769899sellItemWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sellItemWindow", _local2, _arg1));
                };
            };
        }

    }
}//package auction_system 
