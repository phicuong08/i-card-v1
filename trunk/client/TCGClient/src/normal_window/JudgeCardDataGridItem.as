//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {

    import flash.display.*;
    
    import flash.geom.*;
    
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
	
	import mx.core.*;
	import mx.managers.*;
    import mx.binding.*;
	import mx.graphics.*;
	import mx.events.*;
	import mx.styles.*;
	
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    //import flash.filters.*;
    import __AS3__.vec.*;
    import source_manager.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import card_ui.*;
    import custom_effect.*;
    import spark.primitives.*;
   
    import flash.utils.*;
    import combat_element_script.*;
    import spark.effects.animation.*;
    import flash.accessibility.*;
    
    import flash.ui.*;
    import tool.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;
	import spark.filters.ColorMatrixFilter;
	
    public class JudgeCardDataGridItem extends Group implements IBindingClient {
		use namespace mx_internal;
        public static const ITEM_HEIGHT:Number = 62;

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _JudgeCardDataGridItem_ColorMatrixFilter1:spark.filters.ColorMatrixFilter;
        public var _JudgeCardDataGridItem_SmoothBitmapImage1:SmoothBitmapImage;
        private var _1422541317addBtn:Button;
        private var _128527240cardAmount:Label;
        private var _1526981222cardCountry:CardCountrySign;
        private var _553912979cardImg:MyImage;
        private var _553913023cardInt:Label;
        private var _8429125cardName:Label;
        private var _8262270cardStar:CardTriangleStarSign;
        private var _553922817cardStr:Label;
        private var _8227222cardType:CardTypeSign;
        private var _1904717613fadeEffect:Fade;
        private var _207684226glowEffect:AnimateFilter;
        private var _241920147headFrame:SmoothBitmapImage;
        private var _273241018mainGroup:Group;
        private var _1337219493mouseOverMask:Rect;
        private var _1248473773newCardSign:SmoothBitmapImage;
        private var _1282346808removeBtn:Button;
        private var _1656172024selectMask:Rect;
        private var __moduleFactoryInitialized:Boolean = false;
        public var _itemSource:Object;
        private var parentDataGrid:JudgeCardDataGrid;
        private var parentJudgeCard:JudgeCards;
        private var creationHasComplete:Boolean = false;
        private var _93647166bgImg:Class;
        private var _714582971grayFilter:Array;
        private var _itemEnabled:Boolean = true;
        public var moveEffect:MoveEffect;
        private var _embed_mxml_source_commonUI______png_1985530244:Class;
        private var _embed_mxml_source_commonUI_new_flag_png_1013362274:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function JudgeCardDataGridItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._itemSource = new Object();
            this.moveEffect = new MoveEffect(this, 300);
            this._embed_mxml_source_commonUI______png_1985530244 = JudgeCardDataGridItem__embed_mxml_source_commonUI______png_1985530244;
            this._embed_mxml_source_commonUI_new_flag_png_1013362274 = JudgeCardDataGridItem__embed_mxml_source_commonUI_new_flag_png_1013362274;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._JudgeCardDataGridItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_JudgeCardDataGridItemWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (JudgeCardDataGridItem[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 456;
            this.height = 62;
            this.layout = this._JudgeCardDataGridItem_BasicLayout1_c();
            this.filters = [this._JudgeCardDataGridItem_ColorMatrixFilter1_i()];
            this.mxmlContent = [this._JudgeCardDataGridItem_Group2_i(), this._JudgeCardDataGridItem_Button1_i(), this._JudgeCardDataGridItem_Button2_i(), this._JudgeCardDataGridItem_Rect1_i(), this._JudgeCardDataGridItem_Rect2_i()];
            this._JudgeCardDataGridItem_Fade1_i();
            this._JudgeCardDataGridItem_AnimateFilter1_i();
            this.addEventListener("rollOver", this.___JudgeCardDataGridItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___JudgeCardDataGridItem_Group1_rollOut);
            this.addEventListener("mouseDown", this.___JudgeCardDataGridItem_Group1_mouseDown);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            JudgeCardDataGridItem._watcherSetupUtil = _arg1;
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
                this.color = 15318650;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function set itemEnabled(_arg1:Boolean):void{
            this._itemEnabled = _arg1;
            if (this._itemEnabled){
                this.grayFilter = ColorUtil.getColorMatrixByBrightness(0);
            } else {
                this.grayFilter = ColorUtil.getGrayColorMatrix();
            };
        }
        public function get itemEnabled():Boolean{
            return (this._itemEnabled);
        }
        public function set itemSource(_arg1:Object):void{
            alpha = 1;
            this._itemSource = _arg1;
            this.buildInfo();
        }
        public function get itemSource():Object{
            return (this._itemSource);
        }
        public function getParentDataGrid():JudgeCardDataGrid{
            return (this.parentDataGrid);
        }
        private function buildInfo():void{
            var _local1:Object;
            if (((this._itemSource) && (this.creationHasComplete))){
                _local1 = this._itemSource;
                this.newCardSign.visible = _local1["isNew"];
                this.setEnabledByUserLevel();
                this.cardImg.source = (("source/cardImages/" + _local1["image"]) + ".jpg");
                if (_local1["agname"] != ""){
                    this.cardName.text = ((_local1["name"] + "·") + _local1["agname"]);
                } else {
                    this.cardName.text = _local1["name"];
                };
                this.cardCountry.country = _local1["country"];
                this.cardType.cardType = _local1["type"];
                this.cardStr.text = _local1["str"];
                this.cardInt.text = _local1["int"];
                this.cardStar.starNum = int(_local1["star"]);
                this.cardAmount.text = ("×" + _local1["num"]);
                this.mainGroup.toolTip = CardsInfo.getCardTooltip(_local1);
                this.bgImg = JudgeCardsSourceMgr.getInstance().getSourceClass((_local1["color"] + "Bar"));
            };
        }
        protected function setEnabledByUserLevel():void{
            this.itemEnabled = ((this.parentDataGrid.isDuelGrid) || ((this._itemSource["use_level"] <= JudgeCards.getInstance().currentUserLevel)));
        }
        public function setParents(_arg1:JudgeCardDataGrid, _arg2:JudgeCards):void{
            this.parentDataGrid = _arg1;
            this.parentJudgeCard = _arg2;
        }
        protected function dragStartHandler(_arg1:MouseEvent):void{
            if (((this.fadeEffect.isPlaying) || (!(this._itemEnabled)))){
                return;
            };
            var _local2:CardImage = new CardImage();
            _local2.setCardById(this.itemSource["id"]);
            _local2.scaleX = 1.3;
            _local2.scaleY = 1.3;
            var _local3:DropShadowFilter = new DropShadowFilter();
            _local3.angle = 40;
            _local3.distance = 40;
            _local3.alpha = 0.6;
            _local2.filters = [_local3];
            var _local4:DragSource = new DragSource();
            _local4.addData(this.itemSource, "source");
            DragManager.doDrag(this, _local4, _arg1, _local2, (-(mouseX) + 15), (-(mouseY) + 15), 0.8);
        }
        public function doMove(_arg1:int):void{
            if (parent){
                this.moveEffect.xTo = x;
                this.moveEffect.yTo = _arg1;
                this.moveEffect.play();
            } else {
                this.moveEffect.end();
                y = _arg1;
            };
        }
        public function playFadeEffect(_arg1:Boolean=true):void{
            var _local2:FakeFadeEffect;
            if (!parent){
                return;
            };
            if (_arg1){
                this.fadeEffect.end();
                this.fadeEffect.play();
            } else {
                _local2 = new FakeFadeEffect(this, 300, 1, 0);
                _local2.play();
            };
        }
        public function refreshNum():void{
            if (this.cardAmount){
                this.cardAmount.text = ("×" + this.itemSource.num);
            };
            this.glowEffect.end();
            this.glowEffect.play();
        }
        public function beSelected(_arg1:Boolean):void{
            this.selectMask.visible = _arg1;
        }
        protected function clickHandler(_arg1:MouseEvent, _arg2:String):void{
            if (((this.fadeEffect.isPlaying) || (!(this.itemEnabled)))){
                return;
            };
            var _local3:* = this.parentJudgeCard.doOperation(_arg2, this.parentDataGrid, this._itemSource);
            if (_local3 != true){
                this.hideBtnTooltip();
                this.addBtn.toolTip = _local3;
                this.removeBtn.toolTip = _local3;
            };
        }
        protected function hideBtnTooltip():void{
            this.removeBtn.toolTip = null;
            this.addBtn.toolTip = null;
        }
        protected function bordercontainer_rollOverHandler(_arg1:MouseEvent):void{
            if (DragManager.isDragging){
                return;
            };
            this.mouseOverMask.visible = true;
            this.showHideAddRemoveBtn(true);
            this.showDisplayCard(this._itemSource.id.toString());
        }
        protected function bordercontainer_rollOutHandler(_arg1:MouseEvent):void{
            this.mouseOverMask.visible = false;
            this.showHideAddRemoveBtn(false);
            this.showDisplayCard(null);
        }
        protected function showHideAddRemoveBtn(_arg1:Boolean):void{
            this.addBtn.visible = _arg1;
            this.removeBtn.visible = _arg1;
        }
        protected function showDisplayCard(_arg1:String):void{
            JudgeCards.getInstance().setDisplayCardId(_arg1);
        }
        protected function mainGroup_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            new MyDragManager(this.mainGroup, this.dragStartHandler);
            this.buildInfo();
            this.headFrame.source = JudgeCardsSourceMgr.getInstance().getSourceClass("headFrame");
        }
        protected function group1_mouseDownHandler(_arg1:MouseEvent):void{
            this._itemSource["isNew"] = false;
            this.newCardSign.visible = false;
            JudgeCards.getInstance().changeNewCardInfo(this.itemSource["id"].toString());
        }
        private function _JudgeCardDataGridItem_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            this.fadeEffect = _local1;
            BindingManager.executeBindings(this, "fadeEffect", this.fadeEffect);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_AnimateFilter1_i():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 1000;
            _local1.bitmapFilter = this._JudgeCardDataGridItem_GlowFilter1_c();
            new Vector.<MotionPath>(3)[0] = this._JudgeCardDataGridItem_SimpleMotionPath1_c();
            new Vector.<MotionPath>(3)[1] = this._JudgeCardDataGridItem_SimpleMotionPath2_c();
            new Vector.<MotionPath>(3)[2] = this._JudgeCardDataGridItem_SimpleMotionPath3_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            this.glowEffect = _local1;
            BindingManager.executeBindings(this, "glowEffect", this.glowEffect);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xC000FF;
            _local1.inner = true;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 0.8;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_SimpleMotionPath2_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 160;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_SimpleMotionPath3_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 160;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this._JudgeCardDataGridItem_ColorMatrixFilter1 = _local1;
            BindingManager.executeBindings(this, "_JudgeCardDataGridItem_ColorMatrixFilter1", this._JudgeCardDataGridItem_ColorMatrixFilter1);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.height = 62;
            _local1.mouseChildren = false;
            _local1.mxmlContent = [this._JudgeCardDataGridItem_SmoothBitmapImage1_i(), this._JudgeCardDataGridItem_SmoothBitmapImage2_c(), this._JudgeCardDataGridItem_MyImage1_i(), this._JudgeCardDataGridItem_SmoothBitmapImage3_i(), this._JudgeCardDataGridItem_SmoothBitmapImage4_i(), this._JudgeCardDataGridItem_Label1_i(), this._JudgeCardDataGridItem_CardCountrySign1_i(), this._JudgeCardDataGridItem_CardTypeSign1_i(), this._JudgeCardDataGridItem_Label2_i(), this._JudgeCardDataGridItem_Label3_i(), this._JudgeCardDataGridItem_CardTriangleStarSign1_i(), this._JudgeCardDataGridItem_Label4_i()];
            _local1.addEventListener("creationComplete", this.__mainGroup_creationComplete);
            _local1.id = "mainGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.mainGroup = _local1;
            BindingManager.executeBindings(this, "mainGroup", this.mainGroup);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "_JudgeCardDataGridItem_SmoothBitmapImage1");
            this._JudgeCardDataGridItem_SmoothBitmapImage1 = _local1;
            BindingManager.executeBindings(this, "_JudgeCardDataGridItem_SmoothBitmapImage1", this._JudgeCardDataGridItem_SmoothBitmapImage1);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI______png_1985530244;
            _local1.x = 3;
            _local1.y = 4;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 6;
            _local1.y = 7;
            _local1.width = 50;
            _local1.height = 50;
            _local1.id = "cardImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardImg = _local1;
            BindingManager.executeBindings(this, "cardImg", this.cardImg);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 3;
            _local1.y = 4;
            _local1.initialized(this, "headFrame");
            this.headFrame = _local1;
            BindingManager.executeBindings(this, "headFrame", this.headFrame);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_SmoothBitmapImage4_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 29;
            _local1.y = 31;
            _local1.width = 25;
            _local1.height = 25;
            _local1.source = this._embed_mxml_source_commonUI_new_flag_png_1013362274;
            _local1.initialized(this, "newCardSign");
            this.newCardSign = _local1;
            BindingManager.executeBindings(this, "newCardSign", this.newCardSign);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 54;
            _local1.width = 135;
            _local1.percentHeight = 100;
            _local1.filters = [this._JudgeCardDataGridItem_GlowFilter2_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 14);
            _local1.id = "cardName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardName = _local1;
            BindingManager.executeBindings(this, "cardName", this.cardName);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_CardCountrySign1_i():CardCountrySign{
            var _local1:CardCountrySign = new CardCountrySign();
            _local1.x = 188;
            _local1.y = 13;
            _local1.initialized(this, "cardCountry");
            this.cardCountry = _local1;
            BindingManager.executeBindings(this, "cardCountry", this.cardCountry);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_CardTypeSign1_i():CardTypeSign{
            var _local1:CardTypeSign = new CardTypeSign();
            _local1.x = 232;
            _local1.y = 11;
            _local1.initialized(this, "cardType");
            this.cardType = _local1;
            BindingManager.executeBindings(this, "cardType", this.cardType);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 281;
            _local1.width = 30;
            _local1.percentHeight = 100;
            _local1.filters = [this._JudgeCardDataGridItem_GlowFilter3_c()];
            _local1.setStyle("paddingTop", 4);
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "cardStr";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardStr = _local1;
            BindingManager.executeBindings(this, "cardStr", this.cardStr);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_GlowFilter3_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 327;
            _local1.width = 30;
            _local1.percentHeight = 100;
            _local1.filters = [this._JudgeCardDataGridItem_GlowFilter4_c()];
            _local1.setStyle("paddingTop", 4);
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "cardInt";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardInt = _local1;
            BindingManager.executeBindings(this, "cardInt", this.cardInt);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_GlowFilter4_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_CardTriangleStarSign1_i():CardTriangleStarSign{
            var _local1:CardTriangleStarSign = new CardTriangleStarSign();
            _local1.x = 372.5;
            _local1.y = 15.5;
            _local1.id = "cardStar";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardStar = _local1;
            BindingManager.executeBindings(this, "cardStar", this.cardStar);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_Label4_i():Label{
            var _local1:Label = new Label();
            _local1.x = 397;
            _local1.y = 7;
            _local1.width = 62;
            _local1.height = 52;
            _local1.filters = [this._JudgeCardDataGridItem_GlowFilter5_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.id = "cardAmount";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardAmount = _local1;
            BindingManager.executeBindings(this, "cardAmount", this.cardAmount);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_GlowFilter5_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function __mainGroup_creationComplete(_arg1:FlexEvent):void{
            this.mainGroup_creationCompleteHandler(_arg1);
        }
        private function _JudgeCardDataGridItem_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.buttonMode = true;
            _local1.x = 393;
            _local1.y = 4;
            _local1.label = "+";
            _local1.height = 14;
            _local1.width = 60;
            _local1.visible = false;
            _local1.setStyle("fontSize", 10);
            _local1.addEventListener("click", this.__addBtn_click);
            _local1.addEventListener("mouseOut", this.__addBtn_mouseOut);
            _local1.id = "addBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.addBtn = _local1;
            BindingManager.executeBindings(this, "addBtn", this.addBtn);
            return (_local1);
        }
        public function __addBtn_click(_arg1:MouseEvent):void{
            this.clickHandler(_arg1, "add");
        }
        public function __addBtn_mouseOut(_arg1:MouseEvent):void{
            this.hideBtnTooltip();
        }
        private function _JudgeCardDataGridItem_Button2_i():Button{
            var _local1:Button = new Button();
            _local1.buttonMode = true;
            _local1.x = 393;
            _local1.y = 44;
            _local1.label = "-";
            _local1.height = 14;
            _local1.width = 60;
            _local1.visible = false;
            _local1.setStyle("fontSize", 10);
            _local1.addEventListener("click", this.__removeBtn_click);
            _local1.addEventListener("mouseOut", this.__removeBtn_mouseOut);
            _local1.id = "removeBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.removeBtn = _local1;
            BindingManager.executeBindings(this, "removeBtn", this.removeBtn);
            return (_local1);
        }
        public function __removeBtn_click(_arg1:MouseEvent):void{
            this.clickHandler(_arg1, "remove");
        }
        public function __removeBtn_mouseOut(_arg1:MouseEvent):void{
            this.hideBtnTooltip();
        }
        private function _JudgeCardDataGridItem_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.visible = false;
            _local1.left = 0;
            _local1.top = 0;
            _local1.right = 0;
            _local1.bottom = 0;
            _local1.stroke = this._JudgeCardDataGridItem_SolidColorStroke1_c();
            _local1.initialized(this, "mouseOverMask");
            this.mouseOverMask = _local1;
            BindingManager.executeBindings(this, "mouseOverMask", this.mouseOverMask);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.weight = 3;
            _local1.color = 8376063;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_Rect2_i():Rect{
            var _local1:Rect = new Rect();
            _local1.visible = false;
            _local1.left = 0;
            _local1.top = 0;
            _local1.right = 0;
            _local1.bottom = 0;
            _local1.stroke = this._JudgeCardDataGridItem_SolidColorStroke2_c();
            _local1.initialized(this, "selectMask");
            this.selectMask = _local1;
            BindingManager.executeBindings(this, "selectMask", this.selectMask);
            return (_local1);
        }
        private function _JudgeCardDataGridItem_SolidColorStroke2_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.weight = 3;
            _local1.color = 2398201;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCardDataGridItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.bordercontainer_rollOverHandler(_arg1);
        }
        public function ___JudgeCardDataGridItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.bordercontainer_rollOutHandler(_arg1);
        }
        public function ___JudgeCardDataGridItem_Group1_mouseDown(_arg1:MouseEvent):void{
            this.group1_mouseDownHandler(_arg1);
        }
        private function _JudgeCardDataGridItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "fadeEffect.target");
            result[1] = new Binding(this, function ():Object{
                return (this);
            }, null, "glowEffect.target");
            result[2] = new Binding(this, function ():Object{
                return (grayFilter);
            }, null, "_JudgeCardDataGridItem_ColorMatrixFilter1.matrix");
            result[3] = new Binding(this, function ():Object{
                return (bgImg);
            }, null, "_JudgeCardDataGridItem_SmoothBitmapImage1.source");
            return (result);
        }
        public function get addBtn():Button{
            return (this._1422541317addBtn);
        }
        public function set addBtn(_arg1:Button):void{
            var _local2:Object = this._1422541317addBtn;
            if (_local2 !== _arg1){
                this._1422541317addBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addBtn", _local2, _arg1));
                };
            };
        }
        public function get cardAmount():Label{
            return (this._128527240cardAmount);
        }
        public function set cardAmount(_arg1:Label):void{
            var _local2:Object = this._128527240cardAmount;
            if (_local2 !== _arg1){
                this._128527240cardAmount = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardAmount", _local2, _arg1));
                };
            };
        }
        public function get cardCountry():CardCountrySign{
            return (this._1526981222cardCountry);
        }
        public function set cardCountry(_arg1:CardCountrySign):void{
            var _local2:Object = this._1526981222cardCountry;
            if (_local2 !== _arg1){
                this._1526981222cardCountry = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardCountry", _local2, _arg1));
                };
            };
        }
        public function get cardImg():MyImage{
            return (this._553912979cardImg);
        }
        public function set cardImg(_arg1:MyImage):void{
            var _local2:Object = this._553912979cardImg;
            if (_local2 !== _arg1){
                this._553912979cardImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardImg", _local2, _arg1));
                };
            };
        }
        public function get cardInt():Label{
            return (this._553913023cardInt);
        }
        public function set cardInt(_arg1:Label):void{
            var _local2:Object = this._553913023cardInt;
            if (_local2 !== _arg1){
                this._553913023cardInt = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardInt", _local2, _arg1));
                };
            };
        }
        public function get cardName():Label{
            return (this._8429125cardName);
        }
        public function set cardName(_arg1:Label):void{
            var _local2:Object = this._8429125cardName;
            if (_local2 !== _arg1){
                this._8429125cardName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardName", _local2, _arg1));
                };
            };
        }
        public function get cardStar():CardTriangleStarSign{
            return (this._8262270cardStar);
        }
        public function set cardStar(_arg1:CardTriangleStarSign):void{
            var _local2:Object = this._8262270cardStar;
            if (_local2 !== _arg1){
                this._8262270cardStar = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardStar", _local2, _arg1));
                };
            };
        }
        public function get cardStr():Label{
            return (this._553922817cardStr);
        }
        public function set cardStr(_arg1:Label):void{
            var _local2:Object = this._553922817cardStr;
            if (_local2 !== _arg1){
                this._553922817cardStr = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardStr", _local2, _arg1));
                };
            };
        }
        public function get cardType():CardTypeSign{
            return (this._8227222cardType);
        }
        public function set cardType(_arg1:CardTypeSign):void{
            var _local2:Object = this._8227222cardType;
            if (_local2 !== _arg1){
                this._8227222cardType = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardType", _local2, _arg1));
                };
            };
        }
        public function get fadeEffect():Fade{
            return (this._1904717613fadeEffect);
        }
        public function set fadeEffect(_arg1:Fade):void{
            var _local2:Object = this._1904717613fadeEffect;
            if (_local2 !== _arg1){
                this._1904717613fadeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeEffect", _local2, _arg1));
                };
            };
        }
        public function get glowEffect():AnimateFilter{
            return (this._207684226glowEffect);
        }
        public function set glowEffect(_arg1:AnimateFilter):void{
            var _local2:Object = this._207684226glowEffect;
            if (_local2 !== _arg1){
                this._207684226glowEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowEffect", _local2, _arg1));
                };
            };
        }
        public function get headFrame():SmoothBitmapImage{
            return (this._241920147headFrame);
        }
        public function set headFrame(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._241920147headFrame;
            if (_local2 !== _arg1){
                this._241920147headFrame = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headFrame", _local2, _arg1));
                };
            };
        }
        public function get mainGroup():Group{
            return (this._273241018mainGroup);
        }
        public function set mainGroup(_arg1:Group):void{
            var _local2:Object = this._273241018mainGroup;
            if (_local2 !== _arg1){
                this._273241018mainGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainGroup", _local2, _arg1));
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
        public function get newCardSign():SmoothBitmapImage{
            return (this._1248473773newCardSign);
        }
        public function set newCardSign(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1248473773newCardSign;
            if (_local2 !== _arg1){
                this._1248473773newCardSign = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newCardSign", _local2, _arg1));
                };
            };
        }
        public function get removeBtn():Button{
            return (this._1282346808removeBtn);
        }
        public function set removeBtn(_arg1:Button):void{
            var _local2:Object = this._1282346808removeBtn;
            if (_local2 !== _arg1){
                this._1282346808removeBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeBtn", _local2, _arg1));
                };
            };
        }
        public function get selectMask():Rect{
            return (this._1656172024selectMask);
        }
        public function set selectMask(_arg1:Rect):void{
            var _local2:Object = this._1656172024selectMask;
            if (_local2 !== _arg1){
                this._1656172024selectMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectMask", _local2, _arg1));
                };
            };
        }
        private function get bgImg():Class{
            return (this._93647166bgImg);
        }
        private function set bgImg(_arg1:Class):void{
            var _local2:Object = this._93647166bgImg;
            if (_local2 !== _arg1){
                this._93647166bgImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgImg", _local2, _arg1));
                };
            };
        }
        private function get grayFilter():Array{
            return (this._714582971grayFilter);
        }
        private function set grayFilter(_arg1:Array):void{
            var _local2:Object = this._714582971grayFilter;
            if (_local2 !== _arg1){
                this._714582971grayFilter = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "grayFilter", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
