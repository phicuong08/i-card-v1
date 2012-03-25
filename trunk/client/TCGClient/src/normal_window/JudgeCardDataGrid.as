//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
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
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import source_manager.*;
    import spark.layouts.*;
    import spark.filters.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flashx.textLayout.elements.*;
    import flash.utils.*;
    import beginner_guide.*;
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

    public class JudgeCardDataGrid extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _JudgeCardDataGrid_CommonMiddleFrame1:CommonMiddleFrame;
        public var _JudgeCardDataGrid_CommonOuterFrame1:CommonOuterFrame;
        private var _912674735allCard:RichText;
        private var _1781625235buttonGroup:HGroup;
        private var _2035892112goldCard:Label;
        private var _2036342372goldRect:SmoothBitmapImage;
        private var _2066449587greenCard:Label;
        private var _2066899847greenRect:SmoothBitmapImage;
        private var _2131590956itemGroup:FakeListGroup;
        private var _1082193729redCard:Label;
        private var _1082643989redRect:SmoothBitmapImage;
        private var _66803271scrollerCp:Scroller;
        private var _1961718717silverCard:Label;
        private var _1962168977silverRect:SmoothBitmapImage;
        private var _2135756891titleText:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        public var dataSourceArray:Array;
        public var dataSourceObject:Object;
        public var cardsInfo:Object;
        private var _2060322489_isDuelGrid:Boolean = false;
        private var _265361776cardItems:Array;
        protected var cardItemSourcePool:Array;
        public var selectItem:JudgeCardDataGridItem;
        protected var departedRangeArg:Array;
        protected var _parentJudgeCard:JudgeCards;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function JudgeCardDataGrid(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._265361776cardItems = new Array();
            this.cardItemSourcePool = new Array();
            this.departedRangeArg = new Array();
            this._embed_mxml_source_commonUI____png_1538356188 = JudgeCardDataGrid__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._JudgeCardDataGrid_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_JudgeCardDataGridWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (JudgeCardDataGrid[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 515;
            this.height = 712;
            this.layout = this._JudgeCardDataGrid_BasicLayout1_c();
            this.mxmlContent = [this._JudgeCardDataGrid_CommonOuterFrame1_i(), this._JudgeCardDataGrid_CommonMiddleFrame1_i(), this._JudgeCardDataGrid_SmoothBitmapImage1_c(), this._JudgeCardDataGrid_SmoothBitmapImage2_i(), this._JudgeCardDataGrid_Rect1_c(), this._JudgeCardDataGrid_SmoothBitmapImage3_i(), this._JudgeCardDataGrid_SmoothBitmapImage4_i(), this._JudgeCardDataGrid_SmoothBitmapImage5_i(), this._JudgeCardDataGrid_SmoothBitmapImage6_i(), this._JudgeCardDataGrid_Label1_i(), this._JudgeCardDataGrid_Label2_i(), this._JudgeCardDataGrid_Label3_i(), this._JudgeCardDataGrid_Label4_i(), this._JudgeCardDataGrid_RichText1_i(), this._JudgeCardDataGrid_HGroup1_i(), this._JudgeCardDataGrid_Scroller1_i()];
            this.addEventListener("creationComplete", this.___JudgeCardDataGrid_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            JudgeCardDataGrid._watcherSetupUtil = _arg1;
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
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function set isDuelGrid(_arg1:Boolean):void{
            this._isDuelGrid = _arg1;
        }
        public function get isDuelGrid():Boolean{
            return (this._isDuelGrid);
        }
        public function set parentJudgeCard(_arg1:JudgeCards):void{
            this._parentJudgeCard = _arg1;
        }
        public function cleanWindow():void{
            this.dataSourceArray = null;
            this.dataSourceObject = null;
            this.departedRangeArg = new Array();
            this.cardsInfo = null;
            this.itemGroup.reset();
            this.cardItemSourcePool = new Array();
            this.cardItems = new Array();
            this.selectItem = null;
        }
        public function setDataSource(_arg1):void{
            this.departedRangeArg = new Array();
            if ((_arg1 is Array)){
                this.createObjectSource(_arg1);
            } else {
                if ((_arg1 is Object)){
                    this.createArraySource(_arg1);
                };
            };
            this.buildCardInfo();
            this.doInitRange();
        }
        protected function doInitRange():void{
            if (this._isDuelGrid){
                this.rangeCards("type", false, false);
                this.rangeCards("color_range_index");
            } else {
                this.rangeCards("isNew", false);
            };
        }
        protected function createArraySource(_arg1:Object):void{
            var _local2:Object;
            this.dataSourceObject = _arg1;
            this.dataSourceArray = new Array();
            for each (_local2 in _arg1) {
                this.dataSourceArray.push(_local2);
            };
        }
        protected function createObjectSource(_arg1:Array):void{
            var _local2:Object;
            this.dataSourceArray = _arg1;
            this.dataSourceObject = new Object();
            for each (_local2 in _arg1) {
                this.dataSourceObject[_local2["id"]] = _local2;
            };
        }
        protected function buildCardInfo():void{
            var _local1:Object;
            this.cardsInfo = new Object();
            this.cardsInfo["totalNum"] = 0;
            this.cardsInfo["greenNum"] = 0;
            this.cardsInfo["redNum"] = 0;
            this.cardsInfo["silverNum"] = 0;
            this.cardsInfo["goldNum"] = 0;
            for each (_local1 in this.dataSourceArray) {
                this.cardsInfo["totalNum"] = (this.cardsInfo["totalNum"] + int(_local1["num"]));
                this.cardsInfo[(_local1["color"] + "Num")] = (this.cardsInfo[(_local1["color"] + "Num")] + int(_local1["num"]));
            };
            this.refreshCardInfo();
        }
        protected function refreshCardInfo():void{
            var _local1:TextFlow = new TextFlow();
            var _local2:ParagraphElement = new ParagraphElement();
            var _local3:SpanElement = new SpanElement();
            _local3.text = "共计 ";
            _local2.addChild(_local3);
            _local3 = new SpanElement();
            _local3.color = 11070338;
            _local3.text = this.cardsInfo["totalNum"].toString();
            _local2.addChild(_local3);
            _local3 = new SpanElement();
            _local3.text = " 张";
            _local2.addChild(_local3);
            _local1.addChild(_local2);
            this.allCard.textFlow = _local1;
            this.greenCard.text = ("× " + this.cardsInfo["greenNum"]);
            this.redCard.text = ("× " + this.cardsInfo["redNum"]);
            this.silverCard.text = ("× " + this.cardsInfo["silverNum"]);
            this.goldCard.text = ("× " + this.cardsInfo["goldNum"]);
        }
        protected function getCardItemComponent():JudgeCardDataGridItem{
            var _local1:JudgeCardDataGridItem;
            if (this.cardItemSourcePool.length > 0){
                _local1 = this.cardItemSourcePool.pop();
            } else {
                _local1 = this.createNewCardItem();
                _local1.addEventListener(MouseEvent.MOUSE_DOWN, this.selectCard);
                _local1.setParents(this, this._parentJudgeCard);
            };
            _local1.moveEffect.end();
            return (_local1);
        }
        protected function createNewCardItem():JudgeCardDataGridItem{
            return (new JudgeCardDataGridItem());
        }
        protected function selectCard(_arg1:MouseEvent):void{
            if (this.selectItem != null){
                this.selectItem.beSelected(false);
            };
            this.selectItem = (_arg1.currentTarget as JudgeCardDataGridItem);
            this.selectItem.beSelected(true);
        }
        protected function createCardItems():void{
            var i:* = 0;
            var newCardItemLength:* = 0;
            var newItem:* = null;
            var buildItem:* = null;
            var unWantedItems:* = null;
            buildItem = function ():void{
                if (i >= newCardItemLength){
                    itemGroup.resetDisplayItem();
                    if (!_isDuelGrid){
                        setParentLoadingPercent(1);
                    };
                    return;
                };
                newItem = getCardItemComponent();
                newItem.itemSource = dataSourceArray[i];
                newItem.x = 0;
                newItem.y = (i * JudgeCardDataGridItem.ITEM_HEIGHT);
                cardItems.push(newItem);
                i++;
                if (!_isDuelGrid){
                    setParentLoadingPercent((i / newCardItemLength));
                };
                callLater(buildItem);
            };
            newCardItemLength = this.dataSourceArray.length;
            i = 0;
            while (i < this.cardItems.length) {
                if (i >= newCardItemLength){
                    unWantedItems = this.cardItems.splice(i);
                    this.cardItemSourcePool = this.cardItemSourcePool.concat(unWantedItems);
                    break;
                };
                this.cardItems[i].itemSource = this.dataSourceArray[i];
                i = (i + 1);
            };
            buildItem();
        }
        protected function setParentLoadingPercent(_arg1:Number):void{
            JudgeCards.getInstance().setLoadingPercent(_arg1);
        }
        public function addCard(_arg1:Object, _arg2:int=1):void{
            var _local4:int;
            var _local5:int;
            var _local6:JudgeCardDataGridItem;
            var _local3:Object = this.dataSourceObject[_arg1["id"]];
            if (_local3 != null){
                _local3["num"] = (_local3["num"] + _arg2);
                _local4 = this.dataSourceArray.indexOf(_local3);
                this.cardItems[_local4].refreshNum();
            } else {
                _local5 = this.getIndexByMousePos();
                _local6 = this.getCardItemComponent();
                _local6.itemSource = this.initCardInfo(_arg1["id"], _arg2);
                _local6.y = (_local5 * JudgeCardDataGridItem.ITEM_HEIGHT);
                this.cardItems.splice(_local5, 0, _local6);
                _local6.playFadeEffect();
                this.rejustCardItems();
                this.dataSourceArray.splice(_local5, 0, _local6.itemSource);
                this.dataSourceObject[_arg1["id"]] = _local6.itemSource;
                this.itemGroup.resetDisplayItem();
            };
            this.cardsInfo["totalNum"] = (this.cardsInfo["totalNum"] + _arg2);
            this.cardsInfo[(_arg1["color"] + "Num")] = (this.cardsInfo[(_arg1["color"] + "Num")] + _arg2);
            this.refreshCardInfo();
            BeginnerGuideUtil.dispatchLuaEvent("addJudgeCardGridCard", {isDuelGrid:this._isDuelGrid});
        }
        protected function initCardInfo(_arg1:String, _arg2:int):Object{
            return (this._parentJudgeCard.buildCardInfo(_arg1, _arg2));
        }
        protected function getIndexByMousePos():int{
            var _local1:int = (this.itemGroup.mouseY / JudgeCardDataGridItem.ITEM_HEIGHT);
            _local1 = ((_local1 < 0)) ? 0 : _local1;
            return (((_local1 >= this.cardItems.length)) ? this.cardItems.length : _local1);
        }
        public function removeCard(_arg1:Object, _arg2:int=1):void{
            var _local4:int;
            var _local5:JudgeCardDataGridItem;
            var _local6:int;
            var _local3:Object = this.dataSourceObject[_arg1["id"]];
            if (_local3 == null){
                return;
            };
            _local3["num"] = (_local3["num"] - _arg2);
            if (_local3["num"] <= 0){
                _local4 = this.dataSourceArray.indexOf(_local3);
                _local5 = this.cardItems.splice(_local4, 1)[0];
                this.cardItemSourcePool.push(_local5);
                _local5.playFadeEffect(false);
                this.itemGroup.resetDisplayItem();
                this.dataSourceArray.splice(_local4, 1);
                delete this.dataSourceObject[_arg1["id"]];
                this.rejustCardItems();
            } else {
                _local6 = this.dataSourceArray.indexOf(_local3);
                this.cardItems[_local6].refreshNum();
            };
            this.cardsInfo["totalNum"] = (this.cardsInfo["totalNum"] - _arg2);
            this.cardsInfo[(_arg1["color"] + "Num")] = (this.cardsInfo[(_arg1["color"] + "Num")] - _arg2);
            this.refreshCardInfo();
        }
        public function checkOperation(_arg1:String, _arg2:Object, _arg3:Boolean=false){
            if ((((_arg1 == "add")) && (_arg3))){
                return (true);
            };
            var _local4:Object = this.dataSourceObject[_arg2["id"]];
            if ((((_arg1 == "add")) && (this._isDuelGrid))){
                if (this.cardsInfo["totalNum"] >= 80){
                    MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "提示：", "决斗卡总数已达 80 张，无法再添加。");
                    return ("决斗卡总数已达 80 张，无法再添加");
                };
                if (((!((_local4 == null))) && ((_local4["num"] >= 3)))){
                    return ("决斗卡组中该卡已达 3 张，无法再添加");
                };
            } else {
                if (_arg1 == "remove"){
                    if (_local4 == null){
                        return ("没有能被添加进来的卡片");
                    };
                };
            };
            return (true);
        }
        public function doOperation(_arg1:String, _arg2:Object):void{
            if (_arg1 == "add"){
                this.addCard(_arg2);
            } else {
                this.removeCard(_arg2);
            };
        }
        protected function rejustCardItems():void{
            var _local1:int;
            while (_local1 < this.cardItems.length) {
                (this.cardItems[_local1] as JudgeCardDataGridItem).doMove((JudgeCardDataGridItem.ITEM_HEIGHT * _local1));
                _local1++;
            };
        }
        protected function dragEnterHandler(_arg1:DragEvent):void{
            var _local2:Object;
            if ((_arg1.dragInitiator is JudgeCardDataGridItem)){
                _local2 = (_arg1.dragSource.dataForFormat("source") as Object);
                if (this.checkOperation("add", _local2, !((this.dataSourceArray.indexOf(_local2) == -1))) == true){
                    DragManager.acceptDragDrop(this.itemGroup);
                };
            };
        }
        protected function dragDropHandler(_arg1:DragEvent):void{
            var _local4:int;
            var _local5:Object;
            var _local2:Object = (_arg1.dragSource.dataForFormat("source") as Object);
            var _local3:int = this.dataSourceArray.indexOf(_local2);
            if (_local3 != -1){
                _local4 = this.getIndexByMousePos();
                if (_local3 != _local4){
                    _local4 = ((_local4 >= this.cardItems.length)) ? (_local4 - 1) : _local4;
                    _local5 = this.cardItems[_local4].itemSource;
                    this.cardItems[_local4].itemSource = this.cardItems[_local3].itemSource;
                    this.dataSourceArray[_local4] = this.dataSourceArray[_local3];
                    this.cardItems[_local3].itemSource = _local5;
                    this.dataSourceArray[_local3] = _local5;
                    this.cardItems[_local4].playFadeEffect();
                    this.cardItems[_local3].playFadeEffect();
                };
            } else {
                this._parentJudgeCard.doOperation("add", this, _local2);
            };
        }
        protected function rangeCards(_arg1:String, _arg2:Boolean=true, _arg3:Boolean=true):void{
            var _local7:Array;
            var _local8:Array;
            var _local4:uint = (_arg2) ? Array.NUMERIC : 0;
            var _local5:Boolean = ((this.departedRangeArg.length > 0)) ? !(this.departedRangeArg[(this.departedRangeArg.length - 1)].isCend) : false;
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
            if (_arg3){
                _local7 = new Array();
                _local8 = new Array();
                _local6 = (this.departedRangeArg.length - 1);
                while (_local6 >= 0) {
                    _local7.push(this.departedRangeArg[_local6]["field"]);
                    _local8.push(this.departedRangeArg[_local6]["option"]);
                    _local6--;
                };
                this.dataSourceArray.sortOn(_local7, _local8);
                this.createCardItems();
            };
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.setTitleImg();
            this.goldRect.source = JudgeCardsSourceMgr.getInstance().getSourceClass("goldRect");
            this.silverRect.source = JudgeCardsSourceMgr.getInstance().getSourceClass("silverRect");
            this.greenRect.source = JudgeCardsSourceMgr.getInstance().getSourceClass("greenRect");
            this.redRect.source = JudgeCardsSourceMgr.getInstance().getSourceClass("redRect");
        }
        protected function setTitleImg():void{
            var _local1:String = (this._isDuelGrid) ? "duelCardText" : "allCardText";
            this.titleText.source = JudgeCardsSourceMgr.getInstance().getSourceClass(_local1);
        }
        private function _JudgeCardDataGrid_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGrid_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.filters = [this._JudgeCardDataGrid_DropShadowFilter1_c()];
            _local1.id = "_JudgeCardDataGrid_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._JudgeCardDataGrid_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_JudgeCardDataGrid_CommonOuterFrame1", this._JudgeCardDataGrid_CommonOuterFrame1);
            return (_local1);
        }
        private function _JudgeCardDataGrid_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.color = 0;
            _local1.distance = 7;
            _local1.alpha = 0.65;
            _local1.quality = 4;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGrid_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 9;
            _local1.y = 48;
            _local1.alpha = 0.7;
            _local1.id = "_JudgeCardDataGrid_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._JudgeCardDataGrid_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_JudgeCardDataGrid_CommonMiddleFrame1", this._JudgeCardDataGrid_CommonMiddleFrame1);
            return (_local1);
        }
        private function _JudgeCardDataGrid_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 21;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGrid_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 29;
            _local1.y = 11;
            _local1.initialized(this, "titleText");
            this.titleText = _local1;
            BindingManager.executeBindings(this, "titleText", this.titleText);
            return (_local1);
        }
        private function _JudgeCardDataGrid_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 15;
            _local1.y = 94;
            _local1.width = 485;
            _local1.height = 602;
            _local1.alpha = 0.4;
            _local1.radiusX = 2;
            _local1.radiusY = 2;
            _local1.fill = this._JudgeCardDataGrid_SolidColor1_c();
            _local1.stroke = this._JudgeCardDataGrid_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGrid_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGrid_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 13156254;
            _local1.weight = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGrid_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 33;
            _local1.y = 64;
            _local1.initialized(this, "goldRect");
            this.goldRect = _local1;
            BindingManager.executeBindings(this, "goldRect", this.goldRect);
            return (_local1);
        }
        private function _JudgeCardDataGrid_SmoothBitmapImage4_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 103;
            _local1.y = 64;
            _local1.initialized(this, "silverRect");
            this.silverRect = _local1;
            BindingManager.executeBindings(this, "silverRect", this.silverRect);
            return (_local1);
        }
        private function _JudgeCardDataGrid_SmoothBitmapImage5_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 172;
            _local1.y = 64;
            _local1.initialized(this, "greenRect");
            this.greenRect = _local1;
            BindingManager.executeBindings(this, "greenRect", this.greenRect);
            return (_local1);
        }
        private function _JudgeCardDataGrid_SmoothBitmapImage6_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 241;
            _local1.y = 64;
            _local1.initialized(this, "redRect");
            this.redRect = _local1;
            BindingManager.executeBindings(this, "redRect", this.redRect);
            return (_local1);
        }
        private function _JudgeCardDataGrid_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 55;
            _local1.y = 67;
            _local1.height = 20;
            _local1.setStyle("color", 16379315);
            _local1.id = "goldCard";
            if (!_local1.document){
                _local1.document = this;
            };
            this.goldCard = _local1;
            BindingManager.executeBindings(this, "goldCard", this.goldCard);
            return (_local1);
        }
        private function _JudgeCardDataGrid_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 125;
            _local1.y = 67;
            _local1.height = 20;
            _local1.setStyle("color", 14605270);
            _local1.id = "silverCard";
            if (!_local1.document){
                _local1.document = this;
            };
            this.silverCard = _local1;
            BindingManager.executeBindings(this, "silverCard", this.silverCard);
            return (_local1);
        }
        private function _JudgeCardDataGrid_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 195;
            _local1.y = 67;
            _local1.height = 20;
            _local1.setStyle("color", 13231012);
            _local1.id = "greenCard";
            if (!_local1.document){
                _local1.document = this;
            };
            this.greenCard = _local1;
            BindingManager.executeBindings(this, "greenCard", this.greenCard);
            return (_local1);
        }
        private function _JudgeCardDataGrid_Label4_i():Label{
            var _local1:Label = new Label();
            _local1.x = 265;
            _local1.y = 67;
            _local1.height = 20;
            _local1.setStyle("color", 16026753);
            _local1.id = "redCard";
            if (!_local1.document){
                _local1.document = this;
            };
            this.redCard = _local1;
            BindingManager.executeBindings(this, "redCard", this.redCard);
            return (_local1);
        }
        private function _JudgeCardDataGrid_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 394;
            _local1.y = 65;
            _local1.width = 110;
            _local1.setStyle("color", 16510647);
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "allCard";
            if (!_local1.document){
                _local1.document = this;
            };
            this.allCard = _local1;
            BindingManager.executeBindings(this, "allCard", this.allCard);
            return (_local1);
        }
        private function _JudgeCardDataGrid_HGroup1_i():HGroup{
            var _local1:HGroup = new HGroup();
            _local1.buttonMode = true;
            _local1.x = 18;
            _local1.y = 99;
            _local1.gap = 0;
            _local1.height = 21;
            _local1.mxmlContent = [this._JudgeCardDataGrid_Button1_c(), this._JudgeCardDataGrid_Button2_c(), this._JudgeCardDataGrid_Button3_c(), this._JudgeCardDataGrid_Button4_c(), this._JudgeCardDataGrid_Button5_c(), this._JudgeCardDataGrid_Button6_c(), this._JudgeCardDataGrid_Button7_c()];
            _local1.id = "buttonGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.buttonGroup = _local1;
            BindingManager.executeBindings(this, "buttonGroup", this.buttonGroup);
            return (_local1);
        }
        private function _JudgeCardDataGrid_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.label = "卡片名称";
            _local1.width = 180;
            _local1.percentHeight = 100;
            _local1.addEventListener("click", this.___JudgeCardDataGrid_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCardDataGrid_Button1_click(_arg1:MouseEvent):void{
            this.rangeCards("name", false);
        }
        private function _JudgeCardDataGrid_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.label = "势";
            _local1.width = 46;
            _local1.percentHeight = 100;
            _local1.addEventListener("click", this.___JudgeCardDataGrid_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCardDataGrid_Button2_click(_arg1:MouseEvent):void{
            this.rangeCards("country", false);
        }
        private function _JudgeCardDataGrid_Button3_c():Button{
            var _local1:Button = new Button();
            _local1.label = "类";
            _local1.width = 46;
            _local1.percentHeight = 100;
            _local1.addEventListener("click", this.___JudgeCardDataGrid_Button3_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCardDataGrid_Button3_click(_arg1:MouseEvent):void{
            this.rangeCards("type", false, false);
            this.rangeCards("color_range_index");
        }
        private function _JudgeCardDataGrid_Button4_c():Button{
            var _local1:Button = new Button();
            _local1.label = "武";
            _local1.width = 46;
            _local1.percentHeight = 100;
            _local1.addEventListener("click", this.___JudgeCardDataGrid_Button4_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCardDataGrid_Button4_click(_arg1:MouseEvent):void{
            this.rangeCards("str");
        }
        private function _JudgeCardDataGrid_Button5_c():Button{
            var _local1:Button = new Button();
            _local1.label = "智";
            _local1.width = 46;
            _local1.percentHeight = 100;
            _local1.addEventListener("click", this.___JudgeCardDataGrid_Button5_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCardDataGrid_Button5_click(_arg1:MouseEvent):void{
            this.rangeCards("int");
        }
        private function _JudgeCardDataGrid_Button6_c():Button{
            var _local1:Button = new Button();
            _local1.label = "星";
            _local1.width = 46;
            _local1.percentHeight = 100;
            _local1.addEventListener("click", this.___JudgeCardDataGrid_Button6_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCardDataGrid_Button6_click(_arg1:MouseEvent):void{
            this.rangeCards("star");
        }
        private function _JudgeCardDataGrid_Button7_c():Button{
            var _local1:Button = new Button();
            _local1.label = "数量";
            _local1.width = 46;
            _local1.percentHeight = 100;
            _local1.addEventListener("click", this.___JudgeCardDataGrid_Button7_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCardDataGrid_Button7_click(_arg1:MouseEvent):void{
            this.rangeCards("num");
        }
        private function _JudgeCardDataGrid_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 18;
            _local1.y = 123;
            _local1.width = 476;
            _local1.height = 568;
            _local1.viewport = this._JudgeCardDataGrid_FakeListGroup1_i();
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
        private function _JudgeCardDataGrid_FakeListGroup1_i():FakeListGroup{
            var _local1:FakeListGroup = new FakeListGroup();
            _local1.width = 456;
            _local1.height = 568;
            _local1.addEventListener("dragEnter", this.__itemGroup_dragEnter);
            _local1.addEventListener("dragDrop", this.__itemGroup_dragDrop);
            _local1.id = "itemGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup = _local1;
            BindingManager.executeBindings(this, "itemGroup", this.itemGroup);
            return (_local1);
        }
        public function __itemGroup_dragEnter(_arg1:DragEvent):void{
            this.dragEnterHandler(_arg1);
        }
        public function __itemGroup_dragDrop(_arg1:DragEvent):void{
            this.dragDropHandler(_arg1);
        }
        public function ___JudgeCardDataGrid_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _JudgeCardDataGrid_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Array{
                var _local1:* = [515, 712];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_JudgeCardDataGrid_CommonOuterFrame1.size");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [497, 654];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_JudgeCardDataGrid_CommonMiddleFrame1.size");
            result[2] = new Binding(this, function ():Number{
                return (JudgeCardDataGridItem.ITEM_HEIGHT);
            }, null, "itemGroup.itemHeight");
            result[3] = new Binding(this, function ():Array{
                var _local1:* = cardItems;
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "itemGroup.itemsArray", "cardItems");
            return (result);
        }
        public function get allCard():RichText{
            return (this._912674735allCard);
        }
        public function set allCard(_arg1:RichText):void{
            var _local2:Object = this._912674735allCard;
            if (_local2 !== _arg1){
                this._912674735allCard = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allCard", _local2, _arg1));
                };
            };
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
        public function get goldCard():Label{
            return (this._2035892112goldCard);
        }
        public function set goldCard(_arg1:Label):void{
            var _local2:Object = this._2035892112goldCard;
            if (_local2 !== _arg1){
                this._2035892112goldCard = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldCard", _local2, _arg1));
                };
            };
        }
        public function get goldRect():SmoothBitmapImage{
            return (this._2036342372goldRect);
        }
        public function set goldRect(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._2036342372goldRect;
            if (_local2 !== _arg1){
                this._2036342372goldRect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldRect", _local2, _arg1));
                };
            };
        }
        public function get greenCard():Label{
            return (this._2066449587greenCard);
        }
        public function set greenCard(_arg1:Label):void{
            var _local2:Object = this._2066449587greenCard;
            if (_local2 !== _arg1){
                this._2066449587greenCard = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "greenCard", _local2, _arg1));
                };
            };
        }
        public function get greenRect():SmoothBitmapImage{
            return (this._2066899847greenRect);
        }
        public function set greenRect(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._2066899847greenRect;
            if (_local2 !== _arg1){
                this._2066899847greenRect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "greenRect", _local2, _arg1));
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
        public function get redCard():Label{
            return (this._1082193729redCard);
        }
        public function set redCard(_arg1:Label):void{
            var _local2:Object = this._1082193729redCard;
            if (_local2 !== _arg1){
                this._1082193729redCard = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "redCard", _local2, _arg1));
                };
            };
        }
        public function get redRect():SmoothBitmapImage{
            return (this._1082643989redRect);
        }
        public function set redRect(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1082643989redRect;
            if (_local2 !== _arg1){
                this._1082643989redRect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "redRect", _local2, _arg1));
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
        public function get silverCard():Label{
            return (this._1961718717silverCard);
        }
        public function set silverCard(_arg1:Label):void{
            var _local2:Object = this._1961718717silverCard;
            if (_local2 !== _arg1){
                this._1961718717silverCard = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "silverCard", _local2, _arg1));
                };
            };
        }
        public function get silverRect():SmoothBitmapImage{
            return (this._1962168977silverRect);
        }
        public function set silverRect(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1962168977silverRect;
            if (_local2 !== _arg1){
                this._1962168977silverRect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "silverRect", _local2, _arg1));
                };
            };
        }
        public function get titleText():SmoothBitmapImage{
            return (this._2135756891titleText);
        }
        public function set titleText(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._2135756891titleText;
            if (_local2 !== _arg1){
                this._2135756891titleText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleText", _local2, _arg1));
                };
            };
        }
        public function get _isDuelGrid():Boolean{
            return (this._2060322489_isDuelGrid);
        }
        public function set _isDuelGrid(_arg1:Boolean):void{
            var _local2:Object = this._2060322489_isDuelGrid;
            if (_local2 !== _arg1){
                this._2060322489_isDuelGrid = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_isDuelGrid", _local2, _arg1));
                };
            };
        }
        public function get cardItems():Array{
            return (this._265361776cardItems);
        }
        public function set cardItems(_arg1:Array):void{
            var _local2:Object = this._265361776cardItems;
            if (_local2 !== _arg1){
                this._265361776cardItems = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardItems", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
