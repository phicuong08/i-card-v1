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
    import normal_window.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import custom_effect.*;
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

    public class AuctionMainWindow extends Group implements IBindingClient {

		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _AuctionMainWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _AuctionMainWindow_LargeFrameWindowWithTitle1:LargeFrameWindowWithTitle;
        private var _413245038addEffect:Fade;
        private var _303911378configWindow:AuctionConfigWindow;
        private var _1914850737itemInfoWindow:AuctionItemInfoWindow;
        private var _1102986401itemsContainer:AuctionItemsContainer;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function AuctionMainWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._AuctionMainWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_auction_system_AuctionMainWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 1082;
            this.height = 690;
            this.mouseChildren = false;
            this.layout = this._AuctionMainWindow_BasicLayout1_c();
            this.mxmlContent = [this._AuctionMainWindow_LargeFrameWindowWithTitle1_i(), this._AuctionMainWindow_CommonMiddleFrame1_i(), this._AuctionMainWindow_AuctionConfigWindow1_i(), this._AuctionMainWindow_AuctionItemsContainer1_i(), this._AuctionMainWindow_AuctionItemInfoWindow1_i()];
            this._AuctionMainWindow_Fade1_i();
            this.addEventListener("initialize", this.___AuctionMainWindow_Group1_initialize);
            this.addEventListener("remove", this.___AuctionMainWindow_Group1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            AuctionMainWindow._watcherSetupUtil = _arg1;
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
        private function addEffectCompleteHandler():void{
            mouseChildren = true;
            BasicOperationBar.getInstance().registerLeaveFunc(this.leaveWindow);
            AuctionMgr.getInstance().startSearh("all", "", 1, AuctionItemsContainer.PAGE_LIST_NUM);
        }
        private function leaveWindow():void{
            AuctionMgr.getInstance().hideAuctionMainWindow();
            TCGClient.getInstance().enterMainMenu();
            BasicOperationBar.getInstance().clearLeaveFunc(this.leaveWindow);
        }
        public function setSearchLabelText(_arg1:String):void{
            this.configWindow.setSearchLabelText(_arg1);
        }
        public function setItemInfoWindow(_arg1:Object):void{
            this.itemInfoWindow.itemSource = _arg1;
        }
        public function putGoodsInDeal(_arg1:String, _arg2:int):void{
            this.configWindow.putGoodsInDeal(_arg1, _arg2);
        }
        public function setMyAuctionItemInfo(_arg1:Array):void{
            this.itemsContainer.setMyAuctionItemInfo(_arg1);
        }
        public function setSearchItemInfo(_arg1:Object):void{
            this.itemsContainer.setSearchItemInfo(_arg1);
        }
        public function resetItemContainer():void{
            this.itemsContainer.reset();
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function group1_removeHandler(_arg1:FlexEvent):void{
            var _local2:FakeFadeEffect = new FakeFadeEffect(this, 500, 1, 0);
            _local2.play();
        }
        private function _AuctionMainWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 1;
            _local1.startDelay = 500;
            _local1.duration = 500;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.addEffectCompleteHandler();
        }
        private function _AuctionMainWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionMainWindow_LargeFrameWindowWithTitle1_i():LargeFrameWindowWithTitle{
            var _local1:LargeFrameWindowWithTitle = new LargeFrameWindowWithTitle();
            _local1.titleText = "拍卖行";
            _local1.innerFrameAlpha = 0.9;
            _local1.filters = [this._AuctionMainWindow_DropShadowFilter1_c()];
            _local1.id = "_AuctionMainWindow_LargeFrameWindowWithTitle1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AuctionMainWindow_LargeFrameWindowWithTitle1 = _local1;
            BindingManager.executeBindings(this, "_AuctionMainWindow_LargeFrameWindowWithTitle1", this._AuctionMainWindow_LargeFrameWindowWithTitle1);
            return (_local1);
        }
        private function _AuctionMainWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionMainWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 13;
            _local1.y = 61;
            _local1.alpha = 0.7;
            _local1.id = "_AuctionMainWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AuctionMainWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_AuctionMainWindow_CommonMiddleFrame1", this._AuctionMainWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _AuctionMainWindow_AuctionConfigWindow1_i():AuctionConfigWindow{
            var _local1:AuctionConfigWindow;
            _local1 = new AuctionConfigWindow();
            _local1.x = 5;
            _local1.y = 50;
            _local1.id = "configWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.configWindow = _local1;
            BindingManager.executeBindings(this, "configWindow", this.configWindow);
            return (_local1);
        }
        private function _AuctionMainWindow_AuctionItemsContainer1_i():AuctionItemsContainer{
            var _local1:AuctionItemsContainer = new AuctionItemsContainer();
            _local1.x = 230;
            _local1.y = 45;
            _local1.id = "itemsContainer";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemsContainer = _local1;
            BindingManager.executeBindings(this, "itemsContainer", this.itemsContainer);
            return (_local1);
        }
        private function _AuctionMainWindow_AuctionItemInfoWindow1_i():AuctionItemInfoWindow{
            var _local1:AuctionItemInfoWindow = new AuctionItemInfoWindow();
            _local1.x = 833;
            _local1.y = 50;
            _local1.id = "itemInfoWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemInfoWindow = _local1;
            BindingManager.executeBindings(this, "itemInfoWindow", this.itemInfoWindow);
            return (_local1);
        }
        public function ___AuctionMainWindow_Group1_initialize(_arg1:FlexEvent):void{
            alpha = 0;
        }
        public function ___AuctionMainWindow_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        private function _AuctionMainWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, null, "_AuctionMainWindow_LargeFrameWindowWithTitle1.width", "width");
            result[2] = new Binding(this, null, null, "_AuctionMainWindow_LargeFrameWindowWithTitle1.height", "height");
            result[3] = new Binding(this, function ():Number{
                return ((width - 26));
            }, null, "_AuctionMainWindow_CommonMiddleFrame1.width");
            result[4] = new Binding(this, function ():Number{
                return ((height - 70));
            }, null, "_AuctionMainWindow_CommonMiddleFrame1.height");
            return (result);
        }
        public function get addEffect():Fade{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Fade):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get configWindow():AuctionConfigWindow{
            return (this._303911378configWindow);
        }
        public function set configWindow(_arg1:AuctionConfigWindow):void{
            var _local2:Object = this._303911378configWindow;
            if (_local2 !== _arg1){
                this._303911378configWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "configWindow", _local2, _arg1));
                };
            };
        }
        public function get itemInfoWindow():AuctionItemInfoWindow{
            return (this._1914850737itemInfoWindow);
        }
        public function set itemInfoWindow(_arg1:AuctionItemInfoWindow):void{
            var _local2:Object = this._1914850737itemInfoWindow;
            if (_local2 !== _arg1){
                this._1914850737itemInfoWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemInfoWindow", _local2, _arg1));
                };
            };
        }
        public function get itemsContainer():AuctionItemsContainer{
            return (this._1102986401itemsContainer);
        }
        public function set itemsContainer(_arg1:AuctionItemsContainer):void{
            var _local2:Object = this._1102986401itemsContainer;
            if (_local2 !== _arg1){
                this._1102986401itemsContainer = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemsContainer", _local2, _arg1));
                };
            };
        }

    }
}//package auction_system 
