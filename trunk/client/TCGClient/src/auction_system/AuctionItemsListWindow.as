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
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
    import spark.filters.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import combat_element_script.*;
    import item_system.*;
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

    public class AuctionItemsListWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        public static const ITEM_HEIGHT:Number = 62;

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _AuctionItemsListWindow_CommonInnerFrame1:CommonInnerFrame;
        private var _1844067398interactBtn:Button;
        private var _1478417739itemAmount:Label;
        private var _1177037892itemDesc:RichText;
        private var _2116183984itemImg:MyImage;
        private var _2139896310itemPrice:Label;
        private var _1982472839itemSailor:Label;
        private var _2142719294itemState:Label;
        private var _1337219493mouseOverMask:Rect;
        private var __moduleFactoryInitialized:Boolean = false;
        public var _itemSource:Object;
        private var creationHasComplete:Boolean = false;
        private var _embed_mxml_source_commonUI______png_1985530244:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function AuctionItemsListWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._itemSource = new Object();
            this._embed_mxml_source_commonUI______png_1985530244 = AuctionItemsListWindow__embed_mxml_source_commonUI______png_1985530244;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._AuctionItemsListWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_auction_system_AuctionItemsListWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (AuctionItemsListWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 570;
            this.height = 62;
            this.layout = this._AuctionItemsListWindow_BasicLayout1_c();
            this.mxmlContent = [this._AuctionItemsListWindow_CommonInnerFrame1_i(), this._AuctionItemsListWindow_SmoothBitmapImage1_c(), this._AuctionItemsListWindow_MyImage1_i(), this._AuctionItemsListWindow_RichText1_i(), this._AuctionItemsListWindow_Label1_i(), this._AuctionItemsListWindow_Label2_i(), this._AuctionItemsListWindow_Label3_i(), this._AuctionItemsListWindow_Label4_i(), this._AuctionItemsListWindow_Rect1_i(), this._AuctionItemsListWindow_Button1_i()];
            this.addEventListener("rollOver", this.___AuctionItemsListWindow_Group1_rollOver);
            this.addEventListener("rollOut", this.___AuctionItemsListWindow_Group1_rollOut);
            this.addEventListener("creationComplete", this.___AuctionItemsListWindow_Group1_creationComplete);
            this.addEventListener("click", this.___AuctionItemsListWindow_Group1_click);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            AuctionItemsListWindow._watcherSetupUtil = _arg1;
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
                this.color = 15318650;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function reset():void{
            if (this.creationHasComplete){
                this._itemSource = new Object();
                this.mouseOverMask.visible = false;
                this.interactBtn.visible = false;
            };
        }
        protected function mainGroup_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.buildInfo();
        }
        public function set itemSource(_arg1:Object):void{
            this._itemSource = _arg1;
            this.buildInfo();
        }
        public function get itemSource():Object{
            return (this._itemSource);
        }
        private function buildInfo():void{
            var _local1:Object;
            var _local2:int;
            if (((this._itemSource) && (this.creationHasComplete))){
                _local1 = ItemCardLib.getItemInfoById(this._itemSource.item_id);
                this.itemImg.source = (("source/cardImages/" + _local1.image) + ".jpg");
                this.itemDesc.textFlow = StringUtils.createTFByHtmlText(((ItemCardLib.getItemFullName(this._itemSource.item_id) + "<br>") + ItemCardLib.getItemTypeText(this._itemSource.item_id)));
                this.itemAmount.text = this._itemSource.num;
                this.itemSailor.text = this._itemSource.user_name;
                if (this._itemSource.state == "auction"){
                    _local2 = ((this._itemSource.auction_start_time + this._itemSource.auction_duration_time) - (new Date().time / 1000));
                    if (_local2 > (8 * 3600)){
                        this.itemState.text = "非常长";
                        this.itemState.toolTip = "大于 8 小时";
                    } else {
                        if (_local2 > (4 * 3600)){
                            this.itemState.text = "长";
                            this.itemState.toolTip = "大于 4 小时";
                        } else {
                            if (_local2 > (1 * 3600)){
                                this.itemState.text = "中";
                                this.itemState.toolTip = "大于 1 小时";
                            } else {
                                this.itemState.text = "短";
                                this.itemState.toolTip = "小于 1 小时";
                            };
                        };
                    };
                    this.itemState.setStyle("color", getStyle("color"));
                } else {
                    if (this._itemSource.state == "sell_out"){
                        this.itemState.text = "已售出";
                        this.itemState.setStyle("color", 8126251);
                        this.itemState.toolTip = "物品已售出，请领取金币";
                    } else {
                        if (this._itemSource.state == "time_out"){
                            this.itemState.text = "已超时";
                            this.itemState.setStyle("color", 16725799);
                            this.itemState.toolTip = "物品拍卖超时，请取回拍卖物";
                        };
                    };
                };
                this.itemPrice.text = this._itemSource.price;
                this.setBtnLabel();
            };
        }
        protected function bordercontainer_rollOverHandler(_arg1:MouseEvent):void{
            this.mouseOverMask.visible = true;
            this.interactBtn.visible = true;
            AuctionMgr.getInstance().setItemInfoWindow(this._itemSource);
        }
        protected function setBtnLabel():void{
            if (this._itemSource.state == "auction"){
                this.interactBtn.label = ((AuctionMgr.displayType == "sell")) ? "取消拍卖" : "购买";
            } else {
                if (this._itemSource.state == "sell_out"){
                    this.interactBtn.label = "领取金钱";
                } else {
                    if (this._itemSource.state == "time_out"){
                        this.interactBtn.label = "取回物品";
                    };
                };
            };
        }
        protected function bordercontainer_rollOutHandler(_arg1:MouseEvent):void{
            this.mouseOverMask.visible = false;
            this.interactBtn.visible = false;
        }
        protected function interactBtn_clickHandler(_arg1:MouseEvent):void{
            var descText:* = null;
            var event:* = _arg1;
            if ((((this._itemSource.state == "auction")) && ((AuctionMgr.displayType == "buy")))){
                var dealFunc:* = function (_arg1:Array):Boolean{
                    if (_arg1[0]){
                        LuaAgent.getInstance().run((("u.auction_mgr:try_purchase(" + _itemSource.auction_id) + ")"));
                        AuctionMgr.getInstance().startSearh();
                    };
                    return (true);
                };
                if (this._itemSource.user_name == UserObject.name){
                    MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "确认提示：", "你无法购买自己的拍卖物品！");
                    return;
                };
                if (this._itemSource.price > UserObject.money){
                    MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "确认提示：", "你的金币不足！");
                    return;
                };
                descText = (((((("您确认要购买“" + ItemCardLib.getItemFullName(this._itemSource.item_id)) + "(") + ItemCardLib.getItemTypeText(this._itemSource.item_id)) + ")×") + this._itemSource.num) + "”吗？");
                descText = (descText + (("<br>购买将花费 #r" + this._itemSource.price) + "#n 金币！"));
                MessageBox.showMessageBox(MessageBox.SELECT, "确认提示：", descText, dealFunc);
            } else {
                LuaAgent.getInstance().run((("u.auction_mgr:remove_auction_item(" + this._itemSource.auction_id) + ")"));
            };
        }
        protected function group1_clickHandler(_arg1:MouseEvent):void{
            if (!(_arg1.target is Button)){
                AuctionMgr.getInstance().setSearchLabelText(ItemCardLib.getItemFullName(this._itemSource.item_id));
            };
        }
        private function _AuctionItemsListWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemsListWindow_CommonInnerFrame1_i():CommonInnerFrame{
            var _local1:CommonInnerFrame = new CommonInnerFrame();
            _local1.id = "_AuctionItemsListWindow_CommonInnerFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AuctionItemsListWindow_CommonInnerFrame1 = _local1;
            BindingManager.executeBindings(this, "_AuctionItemsListWindow_CommonInnerFrame1", this._AuctionItemsListWindow_CommonInnerFrame1);
            return (_local1);
        }
        private function _AuctionItemsListWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI______png_1985530244;
            _local1.x = 3;
            _local1.y = 4;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemsListWindow_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 6;
            _local1.y = 7;
            _local1.width = 50;
            _local1.height = 50;
            _local1.id = "itemImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemImg = _local1;
            BindingManager.executeBindings(this, "itemImg", this.itemImg);
            return (_local1);
        }
        private function _AuctionItemsListWindow_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 54;
            _local1.y = 0;
            _local1.width = 155;
            _local1.percentHeight = 100;
            _local1.filters = [this._AuctionItemsListWindow_GlowFilter1_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "itemDesc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemDesc = _local1;
            BindingManager.executeBindings(this, "itemDesc", this.itemDesc);
            return (_local1);
        }
        private function _AuctionItemsListWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemsListWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 200;
            _local1.y = 7;
            _local1.width = 80;
            _local1.height = 52;
            _local1.filters = [this._AuctionItemsListWindow_GlowFilter2_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.id = "itemAmount";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemAmount = _local1;
            BindingManager.executeBindings(this, "itemAmount", this.itemAmount);
            return (_local1);
        }
        private function _AuctionItemsListWindow_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemsListWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 280;
            _local1.width = 110;
            _local1.percentHeight = 100;
            _local1.filters = [this._AuctionItemsListWindow_GlowFilter3_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "itemSailor";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemSailor = _local1;
            BindingManager.executeBindings(this, "itemSailor", this.itemSailor);
            return (_local1);
        }
        private function _AuctionItemsListWindow_GlowFilter3_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemsListWindow_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 390;
            _local1.width = 80;
            _local1.percentHeight = 100;
            _local1.filters = [this._AuctionItemsListWindow_GlowFilter4_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "itemState";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemState = _local1;
            BindingManager.executeBindings(this, "itemState", this.itemState);
            return (_local1);
        }
        private function _AuctionItemsListWindow_GlowFilter4_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemsListWindow_Label4_i():Label{
            var _local1:Label = new Label();
            _local1.x = 470;
            _local1.y = 7;
            _local1.width = 100;
            _local1.height = 52;
            _local1.filters = [this._AuctionItemsListWindow_GlowFilter5_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.id = "itemPrice";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemPrice = _local1;
            BindingManager.executeBindings(this, "itemPrice", this.itemPrice);
            return (_local1);
        }
        private function _AuctionItemsListWindow_GlowFilter5_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemsListWindow_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.visible = false;
            _local1.left = 0;
            _local1.top = 0;
            _local1.right = 0;
            _local1.bottom = 0;
            _local1.stroke = this._AuctionItemsListWindow_SolidColorStroke1_c();
            _local1.initialized(this, "mouseOverMask");
            this.mouseOverMask = _local1;
            BindingManager.executeBindings(this, "mouseOverMask", this.mouseOverMask);
            return (_local1);
        }
        private function _AuctionItemsListWindow_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.weight = 3;
            _local1.color = 8376063;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemsListWindow_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.visible = false;
            _local1.x = 355;
            _local1.verticalCenter = 0;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__interactBtn_click);
            _local1.id = "interactBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.interactBtn = _local1;
            BindingManager.executeBindings(this, "interactBtn", this.interactBtn);
            return (_local1);
        }
        public function __interactBtn_click(_arg1:MouseEvent):void{
            this.interactBtn_clickHandler(_arg1);
        }
        public function ___AuctionItemsListWindow_Group1_rollOver(_arg1:MouseEvent):void{
            this.bordercontainer_rollOverHandler(_arg1);
        }
        public function ___AuctionItemsListWindow_Group1_rollOut(_arg1:MouseEvent):void{
            this.bordercontainer_rollOutHandler(_arg1);
        }
        public function ___AuctionItemsListWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.mainGroup_creationCompleteHandler(_arg1);
        }
        public function ___AuctionItemsListWindow_Group1_click(_arg1:MouseEvent):void{
            this.group1_clickHandler(_arg1);
        }
        private function _AuctionItemsListWindow_bindingsSetup():Array{
            var _local1:Array = [];
            _local1[0] = new Binding(this, null, null, "_AuctionItemsListWindow_CommonInnerFrame1.width", "width");
            _local1[1] = new Binding(this, null, null, "_AuctionItemsListWindow_CommonInnerFrame1.height", "height");
            return (_local1);
        }
        public function get interactBtn():Button{
            return (this._1844067398interactBtn);
        }
        public function set interactBtn(_arg1:Button):void{
            var _local2:Object = this._1844067398interactBtn;
            if (_local2 !== _arg1){
                this._1844067398interactBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "interactBtn", _local2, _arg1));
                };
            };
        }
        public function get itemAmount():Label{
            return (this._1478417739itemAmount);
        }
        public function set itemAmount(_arg1:Label):void{
            var _local2:Object = this._1478417739itemAmount;
            if (_local2 !== _arg1){
                this._1478417739itemAmount = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemAmount", _local2, _arg1));
                };
            };
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
        public function get itemImg():MyImage{
            return (this._2116183984itemImg);
        }
        public function set itemImg(_arg1:MyImage):void{
            var _local2:Object = this._2116183984itemImg;
            if (_local2 !== _arg1){
                this._2116183984itemImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemImg", _local2, _arg1));
                };
            };
        }
        public function get itemPrice():Label{
            return (this._2139896310itemPrice);
        }
        public function set itemPrice(_arg1:Label):void{
            var _local2:Object = this._2139896310itemPrice;
            if (_local2 !== _arg1){
                this._2139896310itemPrice = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemPrice", _local2, _arg1));
                };
            };
        }
        public function get itemSailor():Label{
            return (this._1982472839itemSailor);
        }
        public function set itemSailor(_arg1:Label):void{
            var _local2:Object = this._1982472839itemSailor;
            if (_local2 !== _arg1){
                this._1982472839itemSailor = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemSailor", _local2, _arg1));
                };
            };
        }
        public function get itemState():Label{
            return (this._2142719294itemState);
        }
        public function set itemState(_arg1:Label):void{
            var _local2:Object = this._2142719294itemState;
            if (_local2 !== _arg1){
                this._2142719294itemState = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemState", _local2, _arg1));
                };
            };
        }
        public function get mouseOverMask():Rect{
            return (this._1337219493mouseOverMask);
        }
        public function set mouseOverMask(_arg1:Rect):void{
            var _local2:Object = this._1337219493mouseOverMask;
            if (_local2 !== _arg1){
                this._1337219493mouseOverMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mouseOverMask", _local2, _arg1));
                };
            };
        }

    }
}//package auction_system 
