//Created by Action Script Viewer - http://www.buraks.com/asv
package shop_system {
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
    import normal_window.*;
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.core.*;
    import source_manager.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import custom_effect.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import combat_element_script.*;
    import beginner_guide.*;
    import flash.accessibility.*;
    import baggage.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class ShopMainWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _instance:ShopMainWindow;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var _1377586698buyBtn:ClickScaleButton;
        private var _1691273874cardInfoWindow:ShopCardInfoWindow;
        private var _1690043686cardWantBuy:Group;
        private var _634346507cardWantBuyBg:SmoothBitmapImage;
        private var _278037198cardWantBuyMask:SmoothBitmapImage;
        private var _790270159clearBtn:ClickScaleButton;
        private var _935220162colorTabWindow:ShopColorTabButtonWindow;
        private var _410799558commonTabWindow:ShopCommonTabButtonWindow;
        private var _1081572386mainBg:SmoothBitmapImage;
        private var _226533380scrollerDown:Scroller;
        private var _66803829scrollerUp:Scroller;
        private var _2125949655shopGroup:Group;
        private var __moduleFactoryInitialized:Boolean = false;
        public var cardCasheArray:Array;
        public var needRemoveCard:ShopCard;
        private var departedRangeArg:Array;
        private var rarelyCardArray:Array;
        private var cardBaggageArray:Array;
        private var itemArray:Array;
        private var currentDisplayCardArr:Array;
        private var cardDisInList:Number = 121;
        private var _embed_mxml_source_commonUI____png_1145878686:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function ShopMainWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.cardCasheArray = new Array();
            this.departedRangeArg = new Array();
            this.rarelyCardArray = new Array();
            this.cardBaggageArray = new Array();
            this.itemArray = new Array();
            this._embed_mxml_source_commonUI____png_1145878686 = ShopMainWindow__embed_mxml_source_commonUI____png_1145878686;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._ShopMainWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_shop_system_ShopMainWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (ShopMainWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.mouseChildren = false;
            this.layout = this._ShopMainWindow_BasicLayout1_c();
            this.mxmlContent = [this._ShopMainWindow_Rect1_c(), this._ShopMainWindow_ShopCardInfoWindow1_i(), this._ShopMainWindow_SmoothBitmapImage1_i(), this._ShopMainWindow_Scroller1_i(), this._ShopMainWindow_SmoothBitmapImage2_i(), this._ShopMainWindow_SmoothBitmapImage3_i(), this._ShopMainWindow_SmoothBitmapImage4_c(), this._ShopMainWindow_ShopColorTabButtonWindow1_i(), this._ShopMainWindow_ShopCommonTabButtonWindow1_i(), this._ShopMainWindow_Scroller2_i(), this._ShopMainWindow_ClickScaleButton1_i(), this._ShopMainWindow_ClickScaleButton2_i()];
            this._ShopMainWindow_Fade1_i();
            this.addEventListener("remove", this.___ShopMainWindow_Group1_remove);
            this.addEventListener("initialize", this.___ShopMainWindow_Group1_initialize);
            this.addEventListener("creationComplete", this.___ShopMainWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function getInstance():ShopMainWindow{
            return (_instance);
        }
        public static function cleanInstance():void{
            _instance = null;
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            ShopMainWindow._watcherSetupUtil = _arg1;
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
        protected function group1_creationCompleteHandler():void{
            this.cardWantBuyBg.source = ShopMainWindowSourceMgr.getInstance().getSourceClass("cardWantBuyBg");
            this.cardWantBuyMask.source = ShopMainWindowSourceMgr.getInstance().getSourceClass("cardWantBuyMask");
            this.mainBg.source = ShopMainWindowSourceMgr.getInstance().getSourceClass("mainBg");
            this.buyBtn.buttonImage = ShopMainWindowSourceMgr.getInstance().getSourceClass("buyBtnImg");
            this.clearBtn.buttonImage = ShopMainWindowSourceMgr.getInstance().getSourceClass("clearBtnImg");
        }
        private function leaveWindow():void{
            if (!parent){
                return;
            };
            BaggageMgr.getInstance().hideBaggage();
            var _local1:FakeFadeEffect = new FakeFadeEffect(this, 500, 1, 0);
            _local1.play();
            this.removeSelf();
            TCGClient.getInstance().enterMainMenu();
            BasicOperationBar.getInstance().clearLeaveFunc(this.leaveWindow);
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function removeHandler():void{
            cleanInstance();
            UserPropertyChangeEventDispatcher.getInstance().removeEventListener(UserPropertyChangeEventDispatcher.SCORE_CHANGED, this.userPropertyChanged);
            UserPropertyChangeEventDispatcher.getInstance().removeEventListener(UserPropertyChangeEventDispatcher.MONEY_CHANGED, this.userPropertyChanged);
            this.scrollerUp.removeEventListener(MouseEvent.MOUSE_WHEEL, this.scrollerUp_mouseWheelHandler, true);
            this.scrollerDown.removeEventListener(MouseEvent.MOUSE_WHEEL, this.scrollerDown_mouseWheelHandler, true);
            TCGClient.getInstance().removeEventListener(DragEvent.DRAG_ENTER, this.mainWindowDragEnterHandler);
        }
        protected function addEffectCompleteHandler():void{
            _instance = this;
            BasicOperationBar.getInstance().registerLeaveFunc(this.leaveWindow);
            mouseChildren = true;
            BeginnerGuideUtil.dispatchLuaEvent("ShopMainWindowAdd");
            this.initShopArray();
            this.currentDisplayCardArr = this.cardBaggageArray;
            this.rangeCards("order", true);
            UserPropertyChangeEventDispatcher.getInstance().addEventListener(UserPropertyChangeEventDispatcher.SCORE_CHANGED, this.userPropertyChanged);
            UserPropertyChangeEventDispatcher.getInstance().addEventListener(UserPropertyChangeEventDispatcher.MONEY_CHANGED, this.userPropertyChanged);
            this.scrollerUp.addEventListener(MouseEvent.MOUSE_WHEEL, this.scrollerUp_mouseWheelHandler, true);
            this.scrollerDown.addEventListener(MouseEvent.MOUSE_WHEEL, this.scrollerDown_mouseWheelHandler, true);
            TCGClient.getInstance().addEventListener(DragEvent.DRAG_ENTER, this.mainWindowDragEnterHandler);
            BaggageMgr.getInstance().showBaggage();
        }
        private function userPropertyChanged(_arg1:Event):void{
            this.disableCardUserCanNotBuy();
            this.cardInfoWindow.refreshDisplayInfo();
        }
        protected function scrollerUp_mouseWheelHandler(_arg1:MouseEvent):void{
            _arg1.preventDefault();
            var _local2:Number = this.shopGroup.getVerticalScrollPositionDelta(((_arg1.delta)<0) ? NavigationUnit.DOWN : NavigationUnit.UP);
            if (!isNaN(_local2)){
                this.shopGroup.verticalScrollPosition = (this.shopGroup.verticalScrollPosition + _local2);
            };
        }
        protected function scrollerDown_mouseWheelHandler(_arg1:MouseEvent):void{
            _arg1.preventDefault();
            var _local2:Number = ((_arg1.delta < 0)) ? this.cardDisInList : -(this.cardDisInList);
            this.cardWantBuy.horizontalScrollPosition = (this.cardWantBuy.horizontalScrollPosition + _local2);
        }
        private function initShopArray():void{
            var _local2:Object;
            var _local3:Object;
            var _local4:Object;
            var _local5:String;
            var _local6:Object;
            var _local7:String;
            var _local1:Object = ShopLib.getCardShopConfig();
            for each (_local2 in _local1) {
                _local4 = new Object();
                _local4.isCard = true;
                for (_local5 in _local2) {
                    _local4[_local5] = _local2[_local5];
                };
                CardsInfo.addAttribById(_local4);
                this.rarelyCardArray.push(_local4);
            };
            _local1 = ShopLib.getItemShopConfig();
            for each (_local3 in _local1) {
                if (_local3["sale_arg"] == "no_sale"){
                } else {
                    _local6 = new Object();
                    for (_local7 in _local3) {
                        _local6[_local7] = _local3[_local7];
                    };
                    if (_local6.type != "card_baggage"){
                        this.itemArray.push(_local6);
                    } else {
                        this.cardBaggageArray.push(_local6);
                    };
                };
            };
        }
        private function rangeCards(_arg1:String, _arg2:Boolean=true, _arg3:Boolean=true):void{
            var _local4:uint = (_arg2) ? Array.NUMERIC : 0;
            var _local5:Boolean = ((this.departedRangeArg.length > 0)) ? !(this.departedRangeArg[(this.departedRangeArg.length - 1)].isCend) : true;
            if (!_local5){
                _local4 = (_local4 | Array.DESCENDING);
            };
            var _local6:int;
            while (_local6 < this.departedRangeArg.length) {
                if (this.departedRangeArg[_local6]["field"] == _arg1){
                    this.departedRangeArg.splice(_local6, 1);
                    break;
                };
                _local6++;
            };
            this.departedRangeArg.push({
                field:_arg1,
                option:_local4,
                isCend:_local5
            });
            var _local7:Array = new Array();
            var _local8:Array = new Array();
            _local6 = (this.departedRangeArg.length - 1);
            while (_local6 >= 0) {
                _local7.push(this.departedRangeArg[_local6]["field"]);
                _local8.push(this.departedRangeArg[_local6]["option"]);
                _local6--;
            };
            this.currentDisplayCardArr.sortOn(_local7, _local8);
            if (_arg3){
                this.displayCards(this.currentDisplayCardArr);
            };
        }
        private function displayCards(_arg1:Array):void{
            var _local6:ShopCard;
            var _local2:int = this.shopGroup.numElements;
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                if (_local4 < _local2){
                    (this.shopGroup.getElementAt(_local4) as ShopCard).shopCardInfo = _arg1[_local4];
                } else {
                    _local6 = this.createCard();
                    _local6.shopCardInfo = _arg1[_local4];
                    this.shopGroup.addElement(_local6);
                };
                _local4++;
            };
            var _local5:int = _local3;
            while (_local5 < _local2) {
                this.cardCasheArray.push(this.shopGroup.removeElementAt(_local3));
                _local5++;
            };
            this.disableCardUserCanNotBuy();
        }
        public function disableCardUserCanNotBuy():void{
            var _local7:ShopCard;
            var _local8:Boolean;
            var _local1:int = UserObject.remainScore;
            var _local2:int = UserObject.money;
            var _local3:int = UserObject.level;
            var _local4:Array = UserObject.achievement;
            var _local5:int = this.shopGroup.numElements;
            var _local6:int;
            while (_local6 < _local5) {
                _local7 = (this.shopGroup.getElementAt(_local6) as ShopCard);
                _local8 = (((int(_local7.shopCardInfo.achievement_request) == 0)) || (!((_local4.indexOf(int(_local7.shopCardInfo.achievement_request)) == -1))));
                if (_local7.shopCardInfo.money_cost > 0){
                    _local7.setActiveInfo((_local2 >= _local7.shopCardInfo.money_cost), (_local3 >= _local7.shopCardInfo.level_request), _local8);
                } else {
                    _local7.setActiveInfo((_local1 >= _local7.shopCardInfo.score_cost), (_local3 >= _local7.shopCardInfo.level_request), _local8);
                };
                _local6++;
            };
        }
        public function refreshCardBaggageCollenctionRate():void{
            var _local3:ShopCard;
            if (((((!(this.colorTabWindow)) || (!(this.colorTabWindow.selectedItem)))) || (!((this.colorTabWindow.selectedItem.title == "卡包"))))){
                return;
            };
            var _local1:int = this.shopGroup.numElements;
            var _local2:int;
            while (_local2 < _local1) {
                _local3 = (this.shopGroup.getElementAt(_local2) as ShopCard);
                _local3.refreshCardBaggageCollenctionRate();
                _local2++;
            };
        }
        public function createCard():ShopCard{
            var _local1:ShopCard = this.cardCasheArray.pop();
            if (!_local1){
                _local1 = new ShopCard();
                _local1.addEventListener(MouseEvent.ROLL_OVER, this.mouseOverCard);
                _local1.addEventListener(MouseEvent.ROLL_OUT, this.mouseOutCard);
            };
            _local1.setActiveInfo(true, true, true);
            _local1.goodsNum = 0;
            _local1.glowEffect.stop();
            _local1.moveEf.stop();
            _local1.fadeEf.stop();
            _local1.alpha = 1;
            return (_local1);
        }
        private function mouseOverCard(_arg1:MouseEvent):void{
            if (((DragManager.isDragging) && (_arg1.buttonDown))){
                return;
            };
            var _local2:ShopCard = (_arg1.currentTarget as ShopCard);
            this.cardInfoWindow.setCard(_local2);
            if (_local2.isActive){
                _local2.glowEffect.play();
            };
        }
        private function mouseOutCard(_arg1:MouseEvent):void{
            var _local2:ShopCard = (_arg1.currentTarget as ShopCard);
            _local2.glowEffect.end();
        }
        public function addCardToList(_arg1:Object, _arg2:int=0):void{
            var _local5:ShopCard;
            var _local3:int;
            while (_local3 < this.cardWantBuy.numElements) {
                _local5 = (this.cardWantBuy.getElementAt(_local3) as ShopCard);
                if (_local5.shopCardInfo.id == _arg1.id){
                    _local5.goodsNum = (_local5.goodsNum + 1);
                    return;
                };
                _local3++;
            };
            var _local4:ShopCard = this.createCard();
            _local4.shopCardInfo = _arg1;
            _local4.x = this.getListCardPos(_arg2);
            _local4.y = 0;
            _local4.goodsNum = 1;
            this.cardWantBuy.addElementAt(_local4, _arg2);
            _local4.alpha = 0;
            _local4.doFade();
            _local4.isCardInList = true;
            this.rejustListCard();
            BeginnerGuideUtil.dispatchLuaEvent("putShopCardInList");
        }
        public function removeCardFromList(_arg1:ShopCard, _arg2:Boolean=true, _arg3:Boolean=true):void{
            var moveImg:* = null;
            var rect:* = null;
            var fadeEnd:* = null;
            var card:* = _arg1;
            var needEffect:Boolean = _arg2;
            var removeCardByNum:Boolean = _arg3;
            if (this.cardWantBuy == card.parent){
                if (needEffect){
                    fadeEnd = function (_arg1:EffectEvent):void{
                        moveImg.fadeEf.removeEventListener(EffectEvent.EFFECT_END, fadeEnd);
                        removeElement(moveImg);
                        cardCasheArray.push(moveImg);
                    };
                    moveImg = this.createCard();
                    moveImg.shopCardInfo = card.shopCardInfo;
                    rect = card.getRect(this);
                    moveImg.x = rect.x;
                    moveImg.y = rect.y;
                    addElement(moveImg);
                    moveImg.doMove(585, 0x0100);
                    moveImg.doFade(false);
                    moveImg.fadeEf.addEventListener(EffectEvent.EFFECT_END, fadeEnd);
                };
                if (removeCardByNum){
                    card.goodsNum = (card.goodsNum - 1);
                    if (card.goodsNum > 0){
                        return;
                    };
                };
                card.isCardInList = false;
                this.cardWantBuy.removeElement(card);
                this.cardCasheArray.push(card);
                this.rejustListCard();
            };
        }
        public function rejustListCard():void{
            var _local2:ShopCard;
            var _local1:int;
            while (_local1 < this.cardWantBuy.numElements) {
                _local2 = (this.cardWantBuy.getElementAt(_local1) as ShopCard);
                _local2.doMove(this.getListCardPos(_local1));
                _local1++;
            };
        }
        public function getListCardPos(_arg1:int):Number{
            return ((_arg1 * this.cardDisInList));
        }
        private function getListIndexByMouse():int{
            var _local2:ShopCard;
            var _local3:Number;
            var _local1:int;
            while (_local1 < this.cardWantBuy.numElements) {
                _local2 = (this.cardWantBuy.getElementAt(_local1) as ShopCard);
                _local3 = ((this.cardDisInList / 2) + 1);
                if ((((_local2.mouseX >= -(_local3))) && ((_local2.mouseX <= _local3)))){
                    return (_local1);
                };
                _local1++;
            };
            return (this.cardWantBuy.numElements);
        }
        private function mainWindowDragEnterHandler(_arg1:DragEvent):void{
            if ((_arg1.dragInitiator is ShopCard)){
                DragManager.acceptDragDrop(TCGClient.getInstance());
            };
        }
        private function cardWantBuyDragEnterHandler(_arg1:DragEvent):void{
            if ((_arg1.dragInitiator is ShopCard)){
                if (this.needRemoveCard){
                    this.removeCardFromList(this.needRemoveCard, false);
                    this.needRemoveCard = null;
                };
                DragManager.acceptDragDrop(this.cardWantBuy);
            };
        }
        private function cardWantBuyDragDropHandler(_arg1:DragEvent):void{
            var _local2:Object = (_arg1.dragSource.dataForFormat("source") as Object);
            this.addCardToList(_local2, this.getListIndexByMouse());
        }
        public function canPutCardInList():Boolean{
            if (this.cardWantBuy.numElements >= 20){
                MessageBox.showMessageBox(MessageBox.NOTICE, "提示", "预购栏已满，无法再添加卡片！");
                return (false);
            };
            return (true);
        }
        private function buyListGoods():void{
            var cardInfoObject:* = null;
            var card:* = null;
            var cardId:* = 0;
            var cardNum:* = this.cardWantBuy.numElements;
            if (cardNum == 0){
                return;
            };
            cardInfoObject = new Object();
            var i:* = 0;
            while (i < cardNum) {
                card = (this.cardWantBuy.getElementAt(i) as ShopCard);
                cardId = int(card.shopCardInfo.id);
                cardInfoObject[cardId] = (cardInfoObject[cardId]) ? (cardInfoObject[cardId] + 1) : card.goodsNum;
                i = (i + 1);
            };
            var arr:* = LuaAgent.getInstance().run((("return u.item_mgr:check_buy_goods(" + LuaAgent.objectToLuaString(cardInfoObject)) + ")"));
            if (arr[1]){
                var confirmFunc:* = function (_arg1:Array):Boolean{
                    if (_arg1[0]){
                        LuaAgent.getInstance().run((("return u.item_mgr:buy_goods(" + LuaAgent.objectToLuaString(cardInfoObject)) + ")"));
                        removeAllCardFromList();
                    };
                    return (true);
                };
                MessageBox.showMessageBox(MessageBox.SELECT, "提示", (((("您确认要购买这些商品吗?\n共需花费 " + arr[2]) + " 积分，") + arr[3]) + " 金币。"), confirmFunc);
            } else {
                if (arr[2] == "score"){
                    MessageBox.showMessageBox(MessageBox.NOTICE, "提示", (((("您的积分不足！\n共需要 " + arr[3]) + " 积分。\n您当前的积分为 ") + UserObject.remainScore) + "。"));
                } else {
                    if (arr[2] == "money"){
                        MessageBox.showMessageBox(MessageBox.NOTICE, "提示", (((("您的金币不足！\n共需要 " + arr[3]) + " 金币。\n您当前的金币为 ") + UserObject.money) + "。"));
                    } else {
                        if (arr[2] == "full"){
                            MessageBox.showMessageBox(MessageBox.NOTICE, "提示", "您的包裹空间不足！");
                        };
                    };
                };
            };
        }
        protected function removeAllCardFromList():void{
            var _local1:int = this.cardWantBuy.numElements;
            var _local2:int;
            while (_local2 < _local1) {
                this.removeCardFromList((this.cardWantBuy.getElementAt(0) as ShopCard), false, false);
                _local2++;
            };
        }
        protected function colorTabWindow_clickHandler(_arg1:MouseEvent):void{
            if (!this.colorTabWindow.selectedItem){
                return;
            };
            this.departedRangeArg = new Array();
            switch (this.colorTabWindow.selectedItem.title){
                case "卡片":
                    this.currentDisplayCardArr = this.rarelyCardArray;
                    this.rangeCards("order", true);
                    this.commonTabWindow.isMonsterCardShowMode = true;
                    break;
                case "卡包":
                    this.currentDisplayCardArr = this.cardBaggageArray;
                    this.rangeCards("order", true);
                    this.commonTabWindow.isMonsterCardShowMode = false;
                    break;
                case "道具":
                    this.currentDisplayCardArr = this.itemArray;
                    this.rangeCards("order", true);
                    this.commonTabWindow.isMonsterCardShowMode = false;
                    break;
            };
            this.commonTabWindow.clean();
            BeginnerGuideUtil.dispatchLuaEvent("shopTabChanged");
        }
        protected function commonTabWindow_clickHandler(_arg1:MouseEvent):void{
            if (!this.commonTabWindow.selectedItem){
                return;
            };
            switch (this.commonTabWindow.selectedItem.title){
                case "武":
                    this.rangeCards("str");
                    break;
                case "智":
                    this.rangeCards("int");
                    break;
                case "星":
                    this.rangeCards("star");
                    break;
                case "势":
                    this.rangeCards("country", false);
                    break;
                case "类":
                    this.rangeCards("type", false, false);
                    this.rangeCards("color_range_index");
                    break;
                case "名":
                    this.rangeCards("name", false);
                    break;
                case "价":
                    if (this.colorTabWindow.selectedItem.title == "稀有卡片"){
                        this.rangeCards("cost");
                    } else {
                        this.rangeCards("money_cost");
                    };
                    break;
                case "级":
                    this.rangeCards("level_request");
                    break;
            };
        }
        private function _ShopMainWindow_Fade1_i():Fade{
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
        private function _ShopMainWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ShopMainWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.fill = this._ShopMainWindow_SolidColor1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ShopMainWindow_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ShopMainWindow_ShopCardInfoWindow1_i():ShopCardInfoWindow{
            var _local1:ShopCardInfoWindow = new ShopCardInfoWindow();
            _local1.id = "cardInfoWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardInfoWindow = _local1;
            BindingManager.executeBindings(this, "cardInfoWindow", this.cardInfoWindow);
            return (_local1);
        }
        private function _ShopMainWindow_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 222;
            _local1.y = 623;
            _local1.initialized(this, "cardWantBuyBg");
            this.cardWantBuyBg = _local1;
            BindingManager.executeBindings(this, "cardWantBuyBg", this.cardWantBuyBg);
            return (_local1);
        }
        private function _ShopMainWindow_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 240;
            _local1.y = 616;
            _local1.width = 715;
            _local1.height = 162;
            _local1.viewport = this._ShopMainWindow_Group2_i();
            _local1.setStyle("verticalScrollPolicy", "off");
            _local1.id = "scrollerDown";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scrollerDown = _local1;
            BindingManager.executeBindings(this, "scrollerDown", this.scrollerDown);
            return (_local1);
        }
        private function _ShopMainWindow_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.width = 715;
            _local1.height = 162;
            _local1.filters = [this._ShopMainWindow_DropShadowFilter1_c()];
            _local1.addEventListener("dragEnter", this.__cardWantBuy_dragEnter);
            _local1.addEventListener("dragDrop", this.__cardWantBuy_dragDrop);
            _local1.id = "cardWantBuy";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardWantBuy = _local1;
            BindingManager.executeBindings(this, "cardWantBuy", this.cardWantBuy);
            return (_local1);
        }
        private function _ShopMainWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.angle = 40;
            _local1.distance = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function __cardWantBuy_dragEnter(_arg1:DragEvent):void{
            this.cardWantBuyDragEnterHandler(_arg1);
        }
        public function __cardWantBuy_dragDrop(_arg1:DragEvent):void{
            this.cardWantBuyDragDropHandler(_arg1);
        }
        private function _ShopMainWindow_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 221;
            _local1.y = 0x0200;
            _local1.initialized(this, "cardWantBuyMask");
            this.cardWantBuyMask = _local1;
            BindingManager.executeBindings(this, "cardWantBuyMask", this.cardWantBuyMask);
            return (_local1);
        }
        private function _ShopMainWindow_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 191;
            _local1.y = 27;
            _local1.initialized(this, "mainBg");
            this.mainBg = _local1;
            BindingManager.executeBindings(this, "mainBg", this.mainBg);
            return (_local1);
        }
        private function _ShopMainWindow_SmoothBitmapImage4_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 496;
            _local1.y = 9;
            _local1.source = this._embed_mxml_source_commonUI____png_1145878686;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ShopMainWindow_ShopColorTabButtonWindow1_i():ShopColorTabButtonWindow{
            var _local1:ShopColorTabButtonWindow = new ShopColorTabButtonWindow();
            _local1.x = 206;
            _local1.y = 92;
            _local1.addEventListener("click", this.__colorTabWindow_click);
            _local1.id = "colorTabWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.colorTabWindow = _local1;
            BindingManager.executeBindings(this, "colorTabWindow", this.colorTabWindow);
            return (_local1);
        }
        public function __colorTabWindow_click(_arg1:MouseEvent):void{
            this.colorTabWindow_clickHandler(_arg1);
        }
        private function _ShopMainWindow_ShopCommonTabButtonWindow1_i():ShopCommonTabButtonWindow{
            var _local1:ShopCommonTabButtonWindow = new ShopCommonTabButtonWindow();
            _local1.x = 574;
            _local1.y = 92;
            _local1.addEventListener("click", this.__commonTabWindow_click);
            _local1.id = "commonTabWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.commonTabWindow = _local1;
            BindingManager.executeBindings(this, "commonTabWindow", this.commonTabWindow);
            return (_local1);
        }
        public function __commonTabWindow_click(_arg1:MouseEvent):void{
            this.commonTabWindow_clickHandler(_arg1);
        }
        private function _ShopMainWindow_Scroller2_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 216;
            _local1.y = 136;
            _local1.width = 750;
            _local1.height = 460;
            _local1.viewport = this._ShopMainWindow_Group3_i();
            _local1.setStyle("horizontalScrollPolicy", "off");
            _local1.id = "scrollerUp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scrollerUp = _local1;
            BindingManager.executeBindings(this, "scrollerUp", this.scrollerUp);
            return (_local1);
        }
        private function _ShopMainWindow_Group3_i():Group{
            var _local1:Group = new Group();
            _local1.layout = this._ShopMainWindow_TileLayout1_c();
            _local1.filters = [this._ShopMainWindow_DropShadowFilter2_c()];
            _local1.id = "shopGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.shopGroup = _local1;
            BindingManager.executeBindings(this, "shopGroup", this.shopGroup);
            return (_local1);
        }
        private function _ShopMainWindow_TileLayout1_c():TileLayout{
            var _local1:TileLayout = new TileLayout();
            _local1.verticalGap = 10;
            _local1.horizontalGap = 13;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ShopMainWindow_DropShadowFilter2_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.angle = 40;
            _local1.distance = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ShopMainWindow_ClickScaleButton1_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.x = 525;
            _local1.y = 623;
            _local1.addEventListener("click", this.__buyBtn_click);
            _local1.id = "buyBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.buyBtn = _local1;
            BindingManager.executeBindings(this, "buyBtn", this.buyBtn);
            return (_local1);
        }
        public function __buyBtn_click(_arg1:MouseEvent):void{
            this.buyListGoods();
        }
        private function _ShopMainWindow_ClickScaleButton2_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.x = 605;
            _local1.y = 623;
            _local1.addEventListener("click", this.__clearBtn_click);
            _local1.id = "clearBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.clearBtn = _local1;
            BindingManager.executeBindings(this, "clearBtn", this.clearBtn);
            return (_local1);
        }
        public function __clearBtn_click(_arg1:MouseEvent):void{
            this.removeAllCardFromList();
        }
        public function ___ShopMainWindow_Group1_remove(_arg1:FlexEvent):void{
            this.removeHandler();
        }
        public function ___ShopMainWindow_Group1_initialize(_arg1:FlexEvent):void{
            alpha = 0;
        }
        public function ___ShopMainWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        private function _ShopMainWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
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
        public function get buyBtn():ClickScaleButton{
            return (this._1377586698buyBtn);
        }
        public function set buyBtn(_arg1:ClickScaleButton):void{
            var _local2:Object = this._1377586698buyBtn;
            if (_local2 !== _arg1){
                this._1377586698buyBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buyBtn", _local2, _arg1));
                };
            };
        }
        public function get cardInfoWindow():ShopCardInfoWindow{
            return (this._1691273874cardInfoWindow);
        }
        public function set cardInfoWindow(_arg1:ShopCardInfoWindow):void{
            var _local2:Object = this._1691273874cardInfoWindow;
            if (_local2 !== _arg1){
                this._1691273874cardInfoWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardInfoWindow", _local2, _arg1));
                };
            };
        }
        public function get cardWantBuy():Group{
            return (this._1690043686cardWantBuy);
        }
        public function set cardWantBuy(_arg1:Group):void{
            var _local2:Object = this._1690043686cardWantBuy;
            if (_local2 !== _arg1){
                this._1690043686cardWantBuy = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardWantBuy", _local2, _arg1));
                };
            };
        }
        public function get cardWantBuyBg():SmoothBitmapImage{
            return (this._634346507cardWantBuyBg);
        }
        public function set cardWantBuyBg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._634346507cardWantBuyBg;
            if (_local2 !== _arg1){
                this._634346507cardWantBuyBg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardWantBuyBg", _local2, _arg1));
                };
            };
        }
        public function get cardWantBuyMask():SmoothBitmapImage{
            return (this._278037198cardWantBuyMask);
        }
        public function set cardWantBuyMask(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._278037198cardWantBuyMask;
            if (_local2 !== _arg1){
                this._278037198cardWantBuyMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardWantBuyMask", _local2, _arg1));
                };
            };
        }
        public function get clearBtn():ClickScaleButton{
            return (this._790270159clearBtn);
        }
        public function set clearBtn(_arg1:ClickScaleButton):void{
            var _local2:Object = this._790270159clearBtn;
            if (_local2 !== _arg1){
                this._790270159clearBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clearBtn", _local2, _arg1));
                };
            };
        }
        public function get colorTabWindow():ShopColorTabButtonWindow{
            return (this._935220162colorTabWindow);
        }
        public function set colorTabWindow(_arg1:ShopColorTabButtonWindow):void{
            var _local2:Object = this._935220162colorTabWindow;
            if (_local2 !== _arg1){
                this._935220162colorTabWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorTabWindow", _local2, _arg1));
                };
            };
        }
        public function get commonTabWindow():ShopCommonTabButtonWindow{
            return (this._410799558commonTabWindow);
        }
        public function set commonTabWindow(_arg1:ShopCommonTabButtonWindow):void{
            var _local2:Object = this._410799558commonTabWindow;
            if (_local2 !== _arg1){
                this._410799558commonTabWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "commonTabWindow", _local2, _arg1));
                };
            };
        }
        public function get mainBg():SmoothBitmapImage{
            return (this._1081572386mainBg);
        }
        public function set mainBg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1081572386mainBg;
            if (_local2 !== _arg1){
                this._1081572386mainBg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainBg", _local2, _arg1));
                };
            };
        }
        public function get scrollerDown():Scroller{
            return (this._226533380scrollerDown);
        }
        public function set scrollerDown(_arg1:Scroller):void{
            var _local2:Object = this._226533380scrollerDown;
            if (_local2 !== _arg1){
                this._226533380scrollerDown = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scrollerDown", _local2, _arg1));
                };
            };
        }
        public function get scrollerUp():Scroller{
            return (this._66803829scrollerUp);
        }
        public function set scrollerUp(_arg1:Scroller):void{
            var _local2:Object = this._66803829scrollerUp;
            if (_local2 !== _arg1){
                this._66803829scrollerUp = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scrollerUp", _local2, _arg1));
                };
            };
        }
        public function get shopGroup():Group{
            return (this._2125949655shopGroup);
        }
        public function set shopGroup(_arg1:Group):void{
            var _local2:Object = this._2125949655shopGroup;
            if (_local2 !== _arg1){
                this._2125949655shopGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopGroup", _local2, _arg1));
                };
            };
        }

    }
}//package shop_system 
