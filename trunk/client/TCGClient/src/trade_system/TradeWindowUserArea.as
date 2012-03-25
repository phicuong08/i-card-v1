//Created by Action Script Viewer - http://www.buraks.com/asv
package trade_system {
    import combat_element_script.*;
    
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
    
    import player_view.*;
    
    import skins.*;
    
    import spark.components.*;
    import spark.events.*;
    import spark.layouts.*;
    import spark.primitives.*;
    
    import ui_element.*;

	use namespace mx_internal;
    public class TradeWindowUserArea extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _TradeWindowUserArea_CommonMiddleFrame1:CommonMiddleFrame;
        public var _TradeWindowUserArea_Label1:Label;
        public var _TradeWindowUserArea_MyImage1:MyImage;
        public var _TradeWindowUserArea_Rect2:Rect;
        private var _344195532confirmMask:Rect;
        private var _2131590956itemGroup:VGroup;
        private var _835484395userMoneyInput:TextInput;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _28358903_isUserMode:Boolean = false;
        private var _266666762userName:String;
        private var _45181353userHeadIconPath:String;
        private var _322759605userMoney:int = 0;
        private var _2086217137confirmState:Boolean = false;
        private var serverMoney:int = 0;
        private var goodsInfo:Object;
        private var creationHasComplete:Boolean = false;
        private var goodsItemOb:Object;
        private var _embed_mxml_source_commonUI_____png_1704344224:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function TradeWindowUserArea(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.goodsItemOb = new Object();
            this._embed_mxml_source_commonUI_____png_1704344224 = TradeWindowUserArea__embed_mxml_source_commonUI_____png_1704344224;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._TradeWindowUserArea_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_trade_system_TradeWindowUserAreaWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                //return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 230;
            this.height = 500;
            this.mouseEnabled = false;
            this.layout = this._TradeWindowUserArea_BasicLayout1_c();
            this.mxmlContent = [this._TradeWindowUserArea_CommonMiddleFrame1_i(), this._TradeWindowUserArea_Rect1_c(), this._TradeWindowUserArea_VGroup1_i(), this._TradeWindowUserArea_MyImage1_i(), this._TradeWindowUserArea_SmoothBitmapImage1_c(), this._TradeWindowUserArea_Label1_i(), this._TradeWindowUserArea_Label2_c(), this._TradeWindowUserArea_TextInput1_i(), this._TradeWindowUserArea_Rect2_i(), this._TradeWindowUserArea_Rect3_i()];
            this.addEventListener("creationComplete", this.___TradeWindowUserArea_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            TradeWindowUserArea._watcherSetupUtil = _arg1;
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
                this.color = 15126902;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function set isUserMode(_arg1:Boolean):void{
            this._isUserMode = _arg1;
        }
        public function get isUserMode():Boolean{
            return (this._isUserMode);
        }
        public function setUserInfo(_arg1:Object):void{
            this.userName = _arg1.name;
            this.userHeadIconPath = (("source/userHead/" + _arg1.head_icon) + ".jpg");
        }
        public function setTradeMoney(_arg1:int):void{
            if (this.isUserMode){
                this.serverMoney = _arg1;
            } else {
                this.userMoney = _arg1;
            };
        }
        public function setTradeState(_arg1:Boolean):void{
            this.confirmState = _arg1;
        }
        public function setTradeGoods(_arg1:Object):void{
            this.goodsInfo = _arg1;
            this.displayGoods();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            var _local2:int;
            while (_local2 < 6) {
                this.itemGroup.addElement(this.createOneGoodsItem());
                _local2++;
            };
            this.displayGoods();
        }
        private function createOneGoodsItem():TradeWindowGoodsItem{
            var _local1:TradeWindowGoodsItem = new TradeWindowGoodsItem();
            _local1.isUserMode = this._isUserMode;
            return (_local1);
        }
        private function getOneEmptyItem():TradeWindowGoodsItem{
            var _local2:TradeWindowGoodsItem;
            var _local1:int;
            while (_local1 < this.itemGroup.numElements) {
                _local2 = (this.itemGroup.getElementAt(_local1) as TradeWindowGoodsItem);
                if (_local2.isEmpty){
                    return (_local2);
                };
                _local1++;
            };
            return (null);
        }
        protected function displayGoods():void{
            var _local1:String;
            if (((this.goodsInfo) && (this.creationHasComplete))){
                for (_local1 in this.goodsInfo) {
                    if (!this.goodsItemOb[_local1]){
                        this.goodsItemOb[_local1] = this.getOneEmptyItem();
                    };
                    (this.goodsItemOb[_local1] as TradeWindowGoodsItem).setGoodsInfo(_local1, this.goodsInfo[_local1]);
                };
                for (_local1 in this.goodsItemOb) {
                    if (!this.goodsInfo[_local1]){
                        (this.goodsItemOb[_local1] as TradeWindowGoodsItem).clearItem();
                        delete this.goodsItemOb[_local1];
                    };
                };
            };
        }
        protected function myimage1_clickHandler(_arg1:MouseEvent):void{
            if (this.userName){
                PlayViewMgr.getInstance().showOpMenu(this.userName);
            };
        }
        protected function userMoneyInput_changeHandler(_arg1:TextOperationEvent):void{
            if (!this.isUserMode){
                return;
            };
            var _local2:int = int(this.userMoneyInput.text);
            var _local3:int = UserObject.money;
            if ((((this.serverMoney > _local3)) || ((_local2 < this.serverMoney)))){
                this.userMoneyInput.text = this.serverMoney.toString();
                return;
            };
            if (_local2 > _local3){
                this.userMoneyInput.text = _local3.toString();
            };
            TradeMgr.getInstance().putMoneyInDeal(int(this.userMoneyInput.text));
        }
        private function _TradeWindowUserArea_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowUserArea_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 19;
            _local1.y = 92;
            _local1.alpha = 0.85;
            _local1.id = "_TradeWindowUserArea_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TradeWindowUserArea_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_TradeWindowUserArea_CommonMiddleFrame1", this._TradeWindowUserArea_CommonMiddleFrame1);
            return (_local1);
        }
        private function _TradeWindowUserArea_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 25;
            _local1.y = 100;
            _local1.alpha = 0.4;
            _local1.width = 178;
            _local1.height = 349;
            _local1.radiusX = 5;
            _local1.radiusY = 5;
            _local1.fill = this._TradeWindowUserArea_SolidColor1_c();
            _local1.stroke = this._TradeWindowUserArea_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowUserArea_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowUserArea_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 13156254;
            _local1.weight = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowUserArea_VGroup1_i():VGroup{
            var _local1:VGroup = new VGroup();
            _local1.x = 30;
            _local1.y = 107;
            _local1.gap = 0;
            _local1.id = "itemGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup = _local1;
            BindingManager.executeBindings(this, "itemGroup", this.itemGroup);
            return (_local1);
        }
        private function _TradeWindowUserArea_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 17;
            _local1.y = 12;
            _local1.width = 60;
            _local1.height = 60;
            _local1.addEventListener("click", this.___TradeWindowUserArea_MyImage1_click);
            _local1.id = "_TradeWindowUserArea_MyImage1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TradeWindowUserArea_MyImage1 = _local1;
            BindingManager.executeBindings(this, "_TradeWindowUserArea_MyImage1", this._TradeWindowUserArea_MyImage1);
            return (_local1);
        }
        public function ___TradeWindowUserArea_MyImage1_click(_arg1:MouseEvent):void{
            this.myimage1_clickHandler(_arg1);
        }
        private function _TradeWindowUserArea_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 15;
            _local1.y = 10;
            _local1.source = this._embed_mxml_source_commonUI_____png_1704344224;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowUserArea_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 88;
            _local1.y = 21;
            _local1.mouseEnabled = false;
            _local1.id = "_TradeWindowUserArea_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TradeWindowUserArea_Label1 = _local1;
            BindingManager.executeBindings(this, "_TradeWindowUserArea_Label1", this._TradeWindowUserArea_Label1);
            return (_local1);
        }
        private function _TradeWindowUserArea_Label2_c():Label{
            var _local1:Label = new Label();
            _local1.x = 88;
            _local1.y = 44;
            _local1.text = "金币：";
            _local1.mouseEnabled = false;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowUserArea_TextInput1_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 124;
            _local1.y = 41;
            _local1.restrict = "0-9";
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("skinClass", textInputSkin);
            _local1.addEventListener("change", this.__userMoneyInput_change);
            _local1.id = "userMoneyInput";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userMoneyInput = _local1;
            BindingManager.executeBindings(this, "userMoneyInput", this.userMoneyInput);
            return (_local1);
        }
        public function __userMoneyInput_change(_arg1:TextOperationEvent):void{
            this.userMoneyInput_changeHandler(_arg1);
        }
        private function _TradeWindowUserArea_Rect2_i():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 120;
            _local1.y = 38;
            _local1.width = 91;
            _local1.height = 21;
            _local1.stroke = this._TradeWindowUserArea_SolidColorStroke2_c();
            _local1.initialized(this, "_TradeWindowUserArea_Rect2");
            this._TradeWindowUserArea_Rect2 = _local1;
            BindingManager.executeBindings(this, "_TradeWindowUserArea_Rect2", this._TradeWindowUserArea_Rect2);
            return (_local1);
        }
        private function _TradeWindowUserArea_SolidColorStroke2_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 14791514;
            _local1.weight = 1;
            _local1.alpha = 0.9;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowUserArea_Rect3_i():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 19;
            _local1.y = 92;
            _local1.width = 190;
            _local1.height = 363;
            _local1.radiusX = 5;
            _local1.radiusY = 5;
            _local1.fill = this._TradeWindowUserArea_SolidColor2_c();
            _local1.stroke = this._TradeWindowUserArea_SolidColorStroke3_c();
            _local1.initialized(this, "confirmMask");
            this.confirmMask = _local1;
            BindingManager.executeBindings(this, "confirmMask", this.confirmMask);
            return (_local1);
        }
        private function _TradeWindowUserArea_SolidColor2_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 10420001;
            _local1.alpha = 0.1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowUserArea_SolidColorStroke3_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 10420001;
            _local1.weight = 5;
            _local1.alpha = 0.3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TradeWindowUserArea_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _TradeWindowUserArea_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Array{
                var _local1:* = [190, 363];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_TradeWindowUserArea_CommonMiddleFrame1.size");
            result[1] = new Binding(this, function ():Object{
                return (userHeadIconPath);
            }, null, "_TradeWindowUserArea_MyImage1.source");
            result[2] = new Binding(this, function ():String{
                var _local1:* = userName;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_TradeWindowUserArea_Label1.text");
            result[3] = new Binding(this, function ():String{
                var _local1:* = userMoney;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "userMoneyInput.text");
            result[4] = new Binding(this, function ():Boolean{
                return (_isUserMode);
            }, null, "userMoneyInput.mouseChildren");
            result[5] = new Binding(this, function ():Boolean{
                return (_isUserMode);
            }, null, "userMoneyInput.mouseEnabled");
            result[6] = new Binding(this, function ():Boolean{
                return (_isUserMode);
            }, null, "_TradeWindowUserArea_Rect2.visible");
            result[7] = new Binding(this, function ():Boolean{
                return (confirmState);
            }, null, "confirmMask.visible");
            return (result);
        }
        public function get confirmMask():Rect{
            return (this._344195532confirmMask);
        }
        public function set confirmMask(_arg1:Rect):void{
            var _local2:Object = this._344195532confirmMask;
            if (_local2 !== _arg1){
                this._344195532confirmMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirmMask", _local2, _arg1));
                };
            };
        }
        public function get itemGroup():VGroup{
            return (this._2131590956itemGroup);
        }
        public function set itemGroup(_arg1:VGroup):void{
            var _local2:Object = this._2131590956itemGroup;
            if (_local2 !== _arg1){
                this._2131590956itemGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup", _local2, _arg1));
                };
            };
        }
        public function get userMoneyInput():TextInput{
            return (this._835484395userMoneyInput);
        }
        public function set userMoneyInput(_arg1:TextInput):void{
            var _local2:Object = this._835484395userMoneyInput;
            if (_local2 !== _arg1){
                this._835484395userMoneyInput = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userMoneyInput", _local2, _arg1));
                };
            };
        }
        private function get _isUserMode():Boolean{
            return (this._28358903_isUserMode);
        }
        private function set _isUserMode(_arg1:Boolean):void{
            var _local2:Object = this._28358903_isUserMode;
            if (_local2 !== _arg1){
                this._28358903_isUserMode = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_isUserMode", _local2, _arg1));
                };
            };
        }
        private function get userName():String{
            return (this._266666762userName);
        }
        private function set userName(_arg1:String):void{
            var _local2:Object = this._266666762userName;
            if (_local2 !== _arg1){
                this._266666762userName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userName", _local2, _arg1));
                };
            };
        }
        private function get userHeadIconPath():String{
            return (this._45181353userHeadIconPath);
        }
        private function set userHeadIconPath(_arg1:String):void{
            var _local2:Object = this._45181353userHeadIconPath;
            if (_local2 !== _arg1){
                this._45181353userHeadIconPath = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userHeadIconPath", _local2, _arg1));
                };
            };
        }
        private function get userMoney():int{
            return (this._322759605userMoney);
        }
        private function set userMoney(_arg1:int):void{
            var _local2:Object = this._322759605userMoney;
            if (_local2 !== _arg1){
                this._322759605userMoney = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userMoney", _local2, _arg1));
                };
            };
        }
        private function get confirmState():Boolean{
            return (this._2086217137confirmState);
        }
        private function set confirmState(_arg1:Boolean):void{
            var _local2:Object = this._2086217137confirmState;
            if (_local2 !== _arg1){
                this._2086217137confirmState = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirmState", _local2, _arg1));
                };
            };
        }

    }
}//package trade_system 
