//Created by Action Script Viewer - http://www.buraks.com/asv
package auction_system {
    import combat_element_script.*;
    
    import flash.accessibility.*;
    import flash.debugger.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;
    
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.filters.*;
    import mx.graphics.*;
    import mx.styles.*;
    
    import spark.components.*;
    import spark.layouts.*;
    import spark.primitives.*;
    
    import ui_element.*;
	use namespace mx_internal;
    public class AuctionConfigWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _681653738buyWindow:AuctionConfigBuyWindow;
        private var _91336222sellWindow:AuctionConfigSellWindow;
        private var _1709687781tabWindow:CommonTabWindow;
        private var _250462850userMoneyText:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function AuctionConfigWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._AuctionConfigWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_auction_system_AuctionConfigWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
              //  return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 250;
            this.height = 550;
            this.layout = this._AuctionConfigWindow_BasicLayout1_c();
            this.mxmlContent = [this._AuctionConfigWindow_CommonMiddleFrame1_c(), this._AuctionConfigWindow_Rect1_c(), this._AuctionConfigWindow_CommonTabWindow1_i(), this._AuctionConfigWindow_AuctionConfigBuyWindow1_i(), this._AuctionConfigWindow_AuctionConfigSellWindow1_i(), this._AuctionConfigWindow_Label1_i()];
            this.addEventListener("creationComplete", this.___AuctionConfigWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            AuctionConfigWindow._watcherSetupUtil = _arg1;
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
            this.tabWindow.setSelectItemByIndex(0);
            this.refreshMoney(null);
        }
        protected function tabWindow_select_item_changedHandler(_arg1:Event):void{
            this.buyWindow.visible = (this.tabWindow.selectItemText == "我要购买");
            this.sellWindow.visible = !(this.buyWindow.visible);
            AuctionMgr.displayType = (this.buyWindow.visible) ? "buy" : "sell";
            if (AuctionMgr.displayType == "sell"){
                AuctionMgr.getInstance().getMyAuctionInfo();
            } else {
                if (AuctionMgr.getInstance().lastSearchInfo){
                    AuctionMgr.getInstance().setSearchItemInfo(AuctionMgr.getInstance().lastSearchInfo);
                } else {
                    AuctionMgr.getInstance().resetItemContainer();
                };
            };
        }
        protected function refreshMoney(_arg1:Event):void{
            this.userMoneyText.text = ("当前金币：" + UserObject.money);
        }
        public function putGoodsInDeal(_arg1:String, _arg2:int):void{
            this.sellWindow.putGoodsInDeal(_arg1, _arg2);
        }
        public function setSearchLabelText(_arg1:String):void{
            this.buyWindow.setSearchLabelText(_arg1);
        }
        private function _AuctionConfigWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigWindow_CommonMiddleFrame1_c():CommonMiddleFrame{
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
        private function _AuctionConfigWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 28;
            _local1.y = 72;
            _local1.alpha = 0.4;
            _local1.width = 188;
            _local1.height = 439;
            _local1.radiusX = 5;
            _local1.radiusY = 5;
            _local1.fill = this._AuctionConfigWindow_SolidColor1_c();
            _local1.stroke = this._AuctionConfigWindow_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigWindow_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigWindow_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 13156254;
            _local1.weight = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigWindow_CommonTabWindow1_i():CommonTabWindow{
            var _local1:CommonTabWindow;
            _local1 = new CommonTabWindow();
            _local1.x = 22;
            _local1.y = 36;
            _local1.addEventListener("select_item_changed", this.__tabWindow_select_item_changed);
            _local1.id = "tabWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tabWindow = _local1;
            BindingManager.executeBindings(this, "tabWindow", this.tabWindow);
            return (_local1);
        }
        public function __tabWindow_select_item_changed(_arg1:Event):void{
            this.tabWindow_select_item_changedHandler(_arg1);
        }
        private function _AuctionConfigWindow_AuctionConfigBuyWindow1_i():AuctionConfigBuyWindow{
            var _local1:AuctionConfigBuyWindow;
            _local1 = new AuctionConfigBuyWindow();
            _local1.x = 0;
            _local1.y = 77;
            _local1.id = "buyWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.buyWindow = _local1;
            BindingManager.executeBindings(this, "buyWindow", this.buyWindow);
            return (_local1);
        }
        private function _AuctionConfigWindow_AuctionConfigSellWindow1_i():AuctionConfigSellWindow{
            var _local1:AuctionConfigSellWindow;
            _local1 = new AuctionConfigSellWindow();
            _local1.x = 0;
            _local1.y = 77;
            _local1.visible = false;
            _local1.id = "sellWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.sellWindow = _local1;
            BindingManager.executeBindings(this, "sellWindow", this.sellWindow);
            return (_local1);
        }
        private function _AuctionConfigWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 48;
            _local1.y = 477;
            _local1.text = "我的金币：";
            _local1.setStyle("fontSize", 16);
            _local1.addEventListener("addedToStage", this.__userMoneyText_addedToStage);
            _local1.addEventListener("removedFromStage", this.__userMoneyText_removedFromStage);
            _local1.id = "userMoneyText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userMoneyText = _local1;
            BindingManager.executeBindings(this, "userMoneyText", this.userMoneyText);
            return (_local1);
        }
        public function __userMoneyText_addedToStage(_arg1:Event):void{
            UserPropertyChangeEventDispatcher.getInstance().addEventListener(UserPropertyChangeEventDispatcher.MONEY_CHANGED, this.refreshMoney);
        }
        public function __userMoneyText_removedFromStage(_arg1:Event):void{
            UserPropertyChangeEventDispatcher.getInstance().removeEventListener(UserPropertyChangeEventDispatcher.MONEY_CHANGED, this.refreshMoney);
        }
        public function ___AuctionConfigWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _AuctionConfigWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Array{
                var _local1:* = ["我要购买", "我要出售"];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "tabWindow.tabItemDataProvider");
            return (result);
        }
        public function get buyWindow():AuctionConfigBuyWindow{
            return (this._681653738buyWindow);
        }
        public function set buyWindow(_arg1:AuctionConfigBuyWindow):void{
            var _local2:Object = this._681653738buyWindow;
            if (_local2 !== _arg1){
                this._681653738buyWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buyWindow", _local2, _arg1));
                };
            };
        }
        public function get sellWindow():AuctionConfigSellWindow{
            return (this._91336222sellWindow);
        }
        public function set sellWindow(_arg1:AuctionConfigSellWindow):void{
            var _local2:Object = this._91336222sellWindow;
            if (_local2 !== _arg1){
                this._91336222sellWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sellWindow", _local2, _arg1));
                };
            };
        }
        public function get tabWindow():CommonTabWindow{
            return (this._1709687781tabWindow);
        }
        public function set tabWindow(_arg1:CommonTabWindow):void{
            var _local2:Object = this._1709687781tabWindow;
            if (_local2 !== _arg1){
                this._1709687781tabWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabWindow", _local2, _arg1));
                };
            };
        }
        public function get userMoneyText():Label{
            return (this._250462850userMoneyText);
        }
        public function set userMoneyText(_arg1:Label):void{
            var _local2:Object = this._250462850userMoneyText;
            if (_local2 !== _arg1){
                this._250462850userMoneyText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userMoneyText", _local2, _arg1));
                };
            };
        }

    }
}//package auction_system 
