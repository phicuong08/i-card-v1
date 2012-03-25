//Created by Action Script Viewer - http://www.buraks.com/asv
package auction_system {
    import custom_control1.*;
    
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
    
    import skins.*;
    
    import spark.components.*;
    import spark.layouts.*;
    import spark.primitives.*;
    
    import ui_element.*;

    public class AuctionItemsContainer extends Group implements IBindingClient {
		use namespace mx_internal;
        public static const PAGE_LIST_NUM:int = 20;

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1781625235buttonGroup:HGroup;
        private var _2131590956itemGroup:FakeListGroup;
        private var _1027829652noItemNotice:Label;
        private var _680725707pageDownBtn:Button;
        private var _859134941pageInfo:Label;
        private var _874486898pageUpBtn:Button;
        private var _66803271scrollerCp:Scroller;
        private var _1446209168totalNumInfo:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var startPage:int = 0;
        private var totalPage:int = 0;
        private var sourcePool:Array;
        private var _1153258441currentDisplayItems:Array;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function AuctionItemsContainer(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.sourcePool = new Array();
            this._1153258441currentDisplayItems = new Array();
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._AuctionItemsContainer_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_auction_system_AuctionItemsContainerWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (AuctionItemsContainer[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 700;
            this.height = 640;
            this.layout = this._AuctionItemsContainer_BasicLayout1_c();
            this.mxmlContent = [this._AuctionItemsContainer_Label1_i(), this._AuctionItemsContainer_Button1_i(), this._AuctionItemsContainer_Button2_i(), this._AuctionItemsContainer_Label2_i(), this._AuctionItemsContainer_Rect1_c(), this._AuctionItemsContainer_HGroup1_i(), this._AuctionItemsContainer_Scroller1_i(), this._AuctionItemsContainer_Label3_i()];
            this.addEventListener("creationComplete", this.___AuctionItemsContainer_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            AuctionItemsContainer._watcherSetupUtil = _arg1;
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
            this.noItemNotice.visible = false;
            this.startPage = 0;
            this.totalPage = 0;
            this.totalNumInfo.text = "没有商品信息";
            this.pageUpBtn.enabled = false;
            this.pageDownBtn.enabled = false;
            this.pageInfo.text = "0/0";
            this.sourcePool = this.sourcePool.concat(this.currentDisplayItems);
            this.currentDisplayItems = new Array();
            this.itemGroup.reset();
        }
        public function setMyAuctionItemInfo(_arg1:Array):void{
            this.displayInfo(_arg1.length, 1, _arg1.length, _arg1);
        }
        public function setSearchItemInfo(_arg1:Object):void{
            this.displayInfo(_arg1.all_num, _arg1.from_index, PAGE_LIST_NUM, _arg1.detail_info);
        }
        private function displayInfo(_arg1:int, _arg2:int, _arg3:int, _arg4:Array):void{
            var _local5:AuctionItemsListWindow;
            if (_arg1 == 0){
                this.reset();
                this.noItemNotice.visible = true;
                return;
            };
            this.noItemNotice.visible = false;
            this.totalNumInfo.text = (((((("物品 " + _arg2) + " - ") + ((_arg2 + _arg4.length) - 1)) + "（总数 ") + _arg1.toString()) + "）");
            this.startPage = Math.ceil((_arg2 / _arg3));
            this.totalPage = Math.ceil((_arg1 / _arg3));
            this.pageInfo.text = ((this.startPage + "/") + this.totalPage);
            this.pageUpBtn.enabled = (this.startPage > 1);
            this.pageDownBtn.enabled = (this.startPage < this.totalPage);
            var _local6:int = this.currentDisplayItems.length;
            var _local7:int;
            while (_local7 < _arg4.length) {
                if (_local7 < _local6){
                    _local5 = (this.currentDisplayItems[_local7] as AuctionItemsListWindow);
                } else {
                    _local5 = this.newItem();
                    this.currentDisplayItems.push(_local5);
                    _local5.y = (AuctionItemsListWindow.ITEM_HEIGHT * _local7);
                };
                _local5.itemSource = _arg4[_local7];
                _local7++;
            };
            if (_local7 < _local6){
                this.sourcePool = this.sourcePool.concat(this.currentDisplayItems.splice(_local7, (_local6 - _local7)));
            };
            this.itemGroup.resetDisplayItem();
        }
        private function newItem():AuctionItemsListWindow{
            if (this.sourcePool.length > 0){
                return (this.sourcePool.pop());
            };
            return (new AuctionItemsListWindow());
        }
        protected function pageUpBtn_clickHandler(_arg1:MouseEvent):void{
            var _local2:int = (((this.startPage - 2) * PAGE_LIST_NUM) + 1);
            AuctionMgr.getInstance().startSearh(null, null, _local2, (_local2 + PAGE_LIST_NUM));
        }
        protected function pageDownBtn_clickHandler(_arg1:MouseEvent):void{
            var _local2:int = ((this.startPage * PAGE_LIST_NUM) + 1);
            AuctionMgr.getInstance().startSearh(null, null, _local2, (_local2 + PAGE_LIST_NUM));
        }
        protected function datagridtitlebutton_clickHandler(_arg1:MouseEvent):void{
            if (this.totalPage == 0){
                return;
            };
            var _local2:DataGridTitleButton = (_arg1.currentTarget as DataGridTitleButton);
            switch (_local2.label){
                case "商品名称":
                    AuctionMgr.getInstance().pushRangeKey("item_id");
                    break;
                case "商品数量":
                    AuctionMgr.getInstance().pushRangeKey("num");
                    break;
                case "出售者":
                    AuctionMgr.getInstance().pushRangeKey("user_name");
                    break;
                case "剩余售时":
                    AuctionMgr.getInstance().pushRangeKey("auction_start_time");
                    AuctionMgr.getInstance().pushRangeKey("state");
                    break;
                case "商品售价":
                    AuctionMgr.getInstance().pushRangeKey("price");
                    break;
            };
            if (this.totalPage == 1){
                AuctionMgr.getInstance().rangeSelf();
            } else {
                AuctionMgr.getInstance().startSearh();
            };
        }
        private function _AuctionItemsContainer_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemsContainer_Label1_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 90;
            _local1.y = 32;
            _local1.width = 260;
            _local1.height = 30;
            _local1.setStyle("textAlign", "right");
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "totalNumInfo";
            if (!_local1.document){
                _local1.document = this;
            };
            this.totalNumInfo = _local1;
            BindingManager.executeBindings(this, "totalNumInfo", this.totalNumInfo);
            return (_local1);
        }
        private function _AuctionItemsContainer_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.label = "上一页";
            _local1.x = 371;
            _local1.y = 32;
            _local1.width = 75;
            _local1.height = 30;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__pageUpBtn_click);
            _local1.id = "pageUpBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.pageUpBtn = _local1;
            BindingManager.executeBindings(this, "pageUpBtn", this.pageUpBtn);
            return (_local1);
        }
        public function __pageUpBtn_click(_arg1:MouseEvent):void{
            this.pageUpBtn_clickHandler(_arg1);
        }
        private function _AuctionItemsContainer_Button2_i():Button{
            var _local1:Button;
            _local1 = new Button();
            _local1.label = "下一页";
            _local1.x = 513;
            _local1.y = 32;
            _local1.width = 75;
            _local1.height = 30;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__pageDownBtn_click);
            _local1.id = "pageDownBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.pageDownBtn = _local1;
            BindingManager.executeBindings(this, "pageDownBtn", this.pageDownBtn);
            return (_local1);
        }
        public function __pageDownBtn_click(_arg1:MouseEvent):void{
            this.pageDownBtn_clickHandler(_arg1);
        }
        private function _AuctionItemsContainer_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 439;
            _local1.y = 32;
            _local1.width = 80;
            _local1.height = 30;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "pageInfo";
            if (!_local1.document){
                _local1.document = this;
            };
            this.pageInfo = _local1;
            BindingManager.executeBindings(this, "pageInfo", this.pageInfo);
            return (_local1);
        }
        private function _AuctionItemsContainer_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 15;
            _local1.y = 67;
            _local1.alpha = 0.4;
            _local1.width = 591;
            _local1.height = 541;
            _local1.radiusX = 5;
            _local1.radiusY = 5;
            _local1.fill = this._AuctionItemsContainer_SolidColor1_c();
            _local1.stroke = this._AuctionItemsContainer_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemsContainer_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemsContainer_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 13156254;
            _local1.weight = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionItemsContainer_HGroup1_i():HGroup{
            var _local1:HGroup = new HGroup();
            _local1.buttonMode = true;
            _local1.x = 18;
            _local1.y = 71;
            _local1.gap = 0;
            _local1.height = 23;
            _local1.mxmlContent = [this._AuctionItemsContainer_DataGridTitleButton1_c(), this._AuctionItemsContainer_DataGridTitleButton2_c(), this._AuctionItemsContainer_DataGridTitleButton3_c(), this._AuctionItemsContainer_DataGridTitleButton4_c(), this._AuctionItemsContainer_DataGridTitleButton5_c()];
            _local1.id = "buttonGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.buttonGroup = _local1;
            BindingManager.executeBindings(this, "buttonGroup", this.buttonGroup);
            return (_local1);
        }
        private function _AuctionItemsContainer_DataGridTitleButton1_c():DataGridTitleButton{
            var _local1:DataGridTitleButton = new DataGridTitleButton();
            _local1.label = "商品名称";
            _local1.width = 200;
            _local1.percentHeight = 100;
            _local1.addEventListener("click", this.___AuctionItemsContainer_DataGridTitleButton1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionItemsContainer_DataGridTitleButton1_click(_arg1:MouseEvent):void{
            this.datagridtitlebutton_clickHandler(_arg1);
        }
        private function _AuctionItemsContainer_DataGridTitleButton2_c():DataGridTitleButton{
            var _local1:DataGridTitleButton = new DataGridTitleButton();
            _local1.label = "商品数量";
            _local1.width = 80;
            _local1.percentHeight = 100;
            _local1.addEventListener("click", this.___AuctionItemsContainer_DataGridTitleButton2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionItemsContainer_DataGridTitleButton2_click(_arg1:MouseEvent):void{
            this.datagridtitlebutton_clickHandler(_arg1);
        }
        private function _AuctionItemsContainer_DataGridTitleButton3_c():DataGridTitleButton{
            var _local1:DataGridTitleButton = new DataGridTitleButton();
            _local1.label = "出售者";
            _local1.width = 110;
            _local1.percentHeight = 100;
            _local1.addEventListener("click", this.___AuctionItemsContainer_DataGridTitleButton3_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionItemsContainer_DataGridTitleButton3_click(_arg1:MouseEvent):void{
            this.datagridtitlebutton_clickHandler(_arg1);
        }
        private function _AuctionItemsContainer_DataGridTitleButton4_c():DataGridTitleButton{
            var _local1:DataGridTitleButton = new DataGridTitleButton();
            _local1.label = "剩余售时";
            _local1.width = 80;
            _local1.percentHeight = 100;
            _local1.addEventListener("click", this.___AuctionItemsContainer_DataGridTitleButton4_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionItemsContainer_DataGridTitleButton4_click(_arg1:MouseEvent):void{
            this.datagridtitlebutton_clickHandler(_arg1);
        }
        private function _AuctionItemsContainer_DataGridTitleButton5_c():DataGridTitleButton{
            var _local1:DataGridTitleButton = new DataGridTitleButton();
            _local1.label = "商品售价";
            _local1.width = 100;
            _local1.percentHeight = 100;
            _local1.addEventListener("click", this.___AuctionItemsContainer_DataGridTitleButton5_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionItemsContainer_DataGridTitleButton5_click(_arg1:MouseEvent):void{
            this.datagridtitlebutton_clickHandler(_arg1);
        }
        private function _AuctionItemsContainer_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 18;
            _local1.y = 95;
            _local1.width = 585;
            _local1.height = 510;
            _local1.viewport = this._AuctionItemsContainer_FakeListGroup1_i();
            _local1.setStyle("horizontalScrollPolicy", "off");
            _local1.setStyle("verticalScrollPolicy", "on");
            _local1.id = "scrollerCp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scrollerCp = _local1;
            BindingManager.executeBindings(this, "scrollerCp", this.scrollerCp);
            return (_local1);
        }
        private function _AuctionItemsContainer_FakeListGroup1_i():FakeListGroup{
            var _local1:FakeListGroup = new FakeListGroup();
            _local1.width = 575;
            _local1.height = 510;
            _local1.id = "itemGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup = _local1;
            BindingManager.executeBindings(this, "itemGroup", this.itemGroup);
            return (_local1);
        }
        private function _AuctionItemsContainer_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 181;
            _local1.y = 313;
            _local1.text = "没有检索到您要的商品";
            _local1.setStyle("fontSize", 25);
            _local1.id = "noItemNotice";
            if (!_local1.document){
                _local1.document = this;
            };
            this.noItemNotice = _local1;
            BindingManager.executeBindings(this, "noItemNotice", this.noItemNotice);
            return (_local1);
        }
        public function ___AuctionItemsContainer_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _AuctionItemsContainer_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (AuctionItemsListWindow.ITEM_HEIGHT);
            }, null, "itemGroup.itemHeight");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = currentDisplayItems;
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "itemGroup.itemsArray");
            return (result);
        }
        public function get buttonGroup():HGroup{
            return (this._1781625235buttonGroup);
        }
        public function set buttonGroup(_arg1:HGroup):void{
            var _local2:Object = this._1781625235buttonGroup;
            if (_local2 !== _arg1){
                this._1781625235buttonGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buttonGroup", _local2, _arg1));
                };
            };
        }
        public function get itemGroup():FakeListGroup{
            return (this._2131590956itemGroup);
        }
        public function set itemGroup(_arg1:FakeListGroup):void{
            var _local2:Object = this._2131590956itemGroup;
            if (_local2 !== _arg1){
                this._2131590956itemGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup", _local2, _arg1));
                };
            };
        }
        public function get noItemNotice():Label{
            return (this._1027829652noItemNotice);
        }
        public function set noItemNotice(_arg1:Label):void{
            var _local2:Object = this._1027829652noItemNotice;
            if (_local2 !== _arg1){
                this._1027829652noItemNotice = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noItemNotice", _local2, _arg1));
                };
            };
        }
        public function get pageDownBtn():Button{
            return (this._680725707pageDownBtn);
        }
        public function set pageDownBtn(_arg1:Button):void{
            var _local2:Object = this._680725707pageDownBtn;
            if (_local2 !== _arg1){
                this._680725707pageDownBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageDownBtn", _local2, _arg1));
                };
            };
        }
        public function get pageInfo():Label{
            return (this._859134941pageInfo);
        }
        public function set pageInfo(_arg1:Label):void{
            var _local2:Object = this._859134941pageInfo;
            if (_local2 !== _arg1){
                this._859134941pageInfo = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageInfo", _local2, _arg1));
                };
            };
        }
        public function get pageUpBtn():Button{
            return (this._874486898pageUpBtn);
        }
        public function set pageUpBtn(_arg1:Button):void{
            var _local2:Object = this._874486898pageUpBtn;
            if (_local2 !== _arg1){
                this._874486898pageUpBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageUpBtn", _local2, _arg1));
                };
            };
        }
        public function get scrollerCp():Scroller{
            return (this._66803271scrollerCp);
        }
        public function set scrollerCp(_arg1:Scroller):void{
            var _local2:Object = this._66803271scrollerCp;
            if (_local2 !== _arg1){
                this._66803271scrollerCp = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scrollerCp", _local2, _arg1));
                };
            };
        }
        public function get totalNumInfo():Label{
            return (this._1446209168totalNumInfo);
        }
        public function set totalNumInfo(_arg1:Label):void{
            var _local2:Object = this._1446209168totalNumInfo;
            if (_local2 !== _arg1){
                this._1446209168totalNumInfo = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalNumInfo", _local2, _arg1));
                };
            };
        }
        private function get currentDisplayItems():Array{
            return (this._1153258441currentDisplayItems);
        }
        private function set currentDisplayItems(_arg1:Array):void{
            var _local2:Object = this._1153258441currentDisplayItems;
            if (_local2 !== _arg1){
                this._1153258441currentDisplayItems = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentDisplayItems", _local2, _arg1));
                };
            };
        }

    }
}//package auction_system 
