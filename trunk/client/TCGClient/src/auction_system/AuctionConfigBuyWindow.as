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
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import skins.*;
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

    public class AuctionConfigBuyWindow extends Group {

        private var _1150999361defaultTypeBtn:AuctionConfigBuyTypeListItem;
        private var _780061140itemNameInput:TextInput;
        private var __moduleFactoryInitialized:Boolean = false;
        public var selectTypeListItem:AuctionConfigBuyTypeListItem;
        private var _embed_mxml_source_commonUI_______png_425445134:Class;

        public function AuctionConfigBuyWindow(){
            this._embed_mxml_source_commonUI_______png_425445134 = AuctionConfigBuyWindow__embed_mxml_source_commonUI_______png_425445134;
            super();
            this.width = 250;
            this.height = 400;
            this.layout = this._AuctionConfigBuyWindow_BasicLayout1_c();
            this.mxmlContent = [this._AuctionConfigBuyWindow_Label1_c(), this._AuctionConfigBuyWindow_VGroup1_c(), this._AuctionConfigBuyWindow_Label2_c(), this._AuctionConfigBuyWindow_SmoothBitmapImage1_c(), this._AuctionConfigBuyWindow_TextInput1_i(), this._AuctionConfigBuyWindow_Button1_c(), this._AuctionConfigBuyWindow_Button2_c()];
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
        public function reset():void{
            this.itemNameInput.text = "";
            this.setSelectTypeBtn(this.defaultTypeBtn);
            AuctionMgr.getInstance().resetItemContainer();
            AuctionMgr.getInstance().lastSearchInfo = null;
        }
        public function setSearchLabelText(_arg1:String):void{
            this.itemNameInput.text = _arg1;
        }
        protected function auctionconfigbuytypelistitem1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.selectTypeListItem = (_arg1.currentTarget as AuctionConfigBuyTypeListItem);
            this.selectTypeListItem.isSelect = true;
        }
        protected function listItemClickHandler(_arg1:MouseEvent):void{
            this.setSelectTypeBtn((_arg1.currentTarget as AuctionConfigBuyTypeListItem));
        }
        protected function setSelectTypeBtn(_arg1:AuctionConfigBuyTypeListItem):void{
            if (this.selectTypeListItem){
                this.selectTypeListItem.isSelect = false;
            };
            this.selectTypeListItem = _arg1;
            this.selectTypeListItem.isSelect = true;
        }
        protected function startSearch():void{
            var _local1:String = StringUtils.trim(String(this.itemNameInput.text));
            var _local2:String = this.getSearchType();
            AuctionMgr.getInstance().startSearh(_local2, _local1, 1, AuctionItemsContainer.PAGE_LIST_NUM);
        }
        protected function getSearchType():String{
            switch (this.selectTypeListItem.descText){
                case "全部":
                    return ("all");
                case "道具":
                    return ("item");
                case "金色武将卡":
                    return ("gold");
                case "银色武将卡":
                    return ("silver");
                case "计策卡":
                    return ("green");
                default:
                    return ("red");
            };
        }
        private function _AuctionConfigBuyWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigBuyWindow_Label1_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.text = "商品类型：";
            _local1.x = 40;
            _local1.y = 17;
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigBuyWindow_VGroup1_c():VGroup{
            var _local1:VGroup;
            _local1 = new VGroup();
            _local1.x = 40;
            _local1.y = 43;
            _local1.gap = 0;
            _local1.mxmlContent = [this._AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem1_i(), this._AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem2_c(), this._AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem3_c(), this._AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem4_c(), this._AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem5_c(), this._AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem6_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem1_i():AuctionConfigBuyTypeListItem{
            var _local1:AuctionConfigBuyTypeListItem = new AuctionConfigBuyTypeListItem();
            _local1.descText = "全部";
            _local1.addEventListener("click", this.__defaultTypeBtn_click);
            _local1.addEventListener("creationComplete", this.__defaultTypeBtn_creationComplete);
            _local1.id = "defaultTypeBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.defaultTypeBtn = _local1;
            BindingManager.executeBindings(this, "defaultTypeBtn", this.defaultTypeBtn);
            return (_local1);
        }
        public function __defaultTypeBtn_click(_arg1:MouseEvent):void{
            this.listItemClickHandler(_arg1);
        }
        public function __defaultTypeBtn_creationComplete(_arg1:FlexEvent):void{
            this.auctionconfigbuytypelistitem1_creationCompleteHandler(_arg1);
        }
        private function _AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem2_c():AuctionConfigBuyTypeListItem{
            var _local1:AuctionConfigBuyTypeListItem = new AuctionConfigBuyTypeListItem();
            _local1.descText = "道具";
            _local1.addEventListener("click", this.___AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem2_click(_arg1:MouseEvent):void{
            this.listItemClickHandler(_arg1);
        }
        private function _AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem3_c():AuctionConfigBuyTypeListItem{
            var _local1:AuctionConfigBuyTypeListItem = new AuctionConfigBuyTypeListItem();
            _local1.descText = "金色武将卡";
            _local1.addEventListener("click", this.___AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem3_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem3_click(_arg1:MouseEvent):void{
            this.listItemClickHandler(_arg1);
        }
        private function _AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem4_c():AuctionConfigBuyTypeListItem{
            var _local1:AuctionConfigBuyTypeListItem = new AuctionConfigBuyTypeListItem();
            _local1.descText = "银色武将卡";
            _local1.addEventListener("click", this.___AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem4_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem4_click(_arg1:MouseEvent):void{
            this.listItemClickHandler(_arg1);
        }
        private function _AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem5_c():AuctionConfigBuyTypeListItem{
            var _local1:AuctionConfigBuyTypeListItem = new AuctionConfigBuyTypeListItem();
            _local1.descText = "计策卡";
            _local1.addEventListener("click", this.___AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem5_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem5_click(_arg1:MouseEvent):void{
            this.listItemClickHandler(_arg1);
        }
        private function _AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem6_c():AuctionConfigBuyTypeListItem{
            var _local1:AuctionConfigBuyTypeListItem = new AuctionConfigBuyTypeListItem();
            _local1.descText = "陷阱卡";
            _local1.addEventListener("click", this.___AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem6_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionConfigBuyWindow_AuctionConfigBuyTypeListItem6_click(_arg1:MouseEvent):void{
            this.listItemClickHandler(_arg1);
        }
        private function _AuctionConfigBuyWindow_Label2_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.text = "商品名称：";
            _local1.x = 40;
            _local1.y = 207;
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigBuyWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 40;
            _local1.y = 233;
            _local1.width = 150;
            _local1.height = 25;
            _local1.source = this._embed_mxml_source_commonUI_______png_425445134;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigBuyWindow_TextInput1_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 45;
            _local1.y = 208;
            _local1.width = 140;
            _local1.height = 75;
            _local1.setStyle("skinClass", textInputSkin);
            _local1.id = "itemNameInput";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemNameInput = _local1;
            BindingManager.executeBindings(this, "itemNameInput", this.itemNameInput);
            return (_local1);
        }
        private function _AuctionConfigBuyWindow_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.label = "搜 索 商 品";
            _local1.x = 54;
            _local1.y = 273;
            _local1.width = 121;
            _local1.height = 30;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___AuctionConfigBuyWindow_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionConfigBuyWindow_Button1_click(_arg1:MouseEvent):void{
            this.startSearch();
        }
        private function _AuctionConfigBuyWindow_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.label = "重    置";
            _local1.x = 54;
            _local1.y = 321;
            _local1.width = 121;
            _local1.height = 30;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___AuctionConfigBuyWindow_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionConfigBuyWindow_Button2_click(_arg1:MouseEvent):void{
            this.reset();
        }
        public function get defaultTypeBtn():AuctionConfigBuyTypeListItem{
            return (this._1150999361defaultTypeBtn);
        }
        public function set defaultTypeBtn(_arg1:AuctionConfigBuyTypeListItem):void{
            var _local2:Object = this._1150999361defaultTypeBtn;
            if (_local2 !== _arg1){
                this._1150999361defaultTypeBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "defaultTypeBtn", _local2, _arg1));
                };
            };
        }
        public function get itemNameInput():TextInput{
            return (this._780061140itemNameInput);
        }
        public function set itemNameInput(_arg1:TextInput):void{
            var _local2:Object = this._780061140itemNameInput;
            if (_local2 !== _arg1){
                this._780061140itemNameInput = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemNameInput", _local2, _arg1));
                };
            };
        }

    }
}//package auction_system 
