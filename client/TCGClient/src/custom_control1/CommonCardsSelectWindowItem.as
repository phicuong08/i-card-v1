//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import source_manager.*;
    import spark.layouts.*;
    import spark.filters.*;
    import card_ui.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import combat_element_script.*;
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

	use namespace mx_internal;
    public class CommonCardsSelectWindowItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CommonCardsSelectWindowItem_SmoothBitmapImage1:SmoothBitmapImage;
        private var _128527240cardAmount:Label;
        private var _1526981222cardCountry:CardCountrySign;
        private var _553912979cardImg:MyImage;
        private var _553913023cardInt:Label;
        private var _8429125cardName:Label;
        private var _8262270cardStar:CardTriangleStarSign;
        private var _553922817cardStr:Label;
        private var _8227222cardType:CardTypeSign;
        private var _241920147headFrame:SmoothBitmapImage;
        private var _1337219493mouseOverMask:Rect;
        private var __moduleFactoryInitialized:Boolean = false;
        public var _itemSource:Object;
        private var creationHasComplete:Boolean = false;
        private var _93647166bgImg:Class;
        private var _embed_mxml_source_commonUI______png_1985530244:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CommonCardsSelectWindowItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI______png_1985530244 = CommonCardsSelectWindowItem__embed_mxml_source_commonUI______png_1985530244;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CommonCardsSelectWindowItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_custom_control_CommonCardsSelectWindowItemWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (CommonCardsSelectWindowItem[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 456;
            this.height = 62;
            this.layout = this._CommonCardsSelectWindowItem_BasicLayout1_c();
            this.mxmlContent = [this._CommonCardsSelectWindowItem_SmoothBitmapImage1_i(), this._CommonCardsSelectWindowItem_SmoothBitmapImage2_c(), this._CommonCardsSelectWindowItem_MyImage1_i(), this._CommonCardsSelectWindowItem_SmoothBitmapImage3_i(), this._CommonCardsSelectWindowItem_Label1_i(), this._CommonCardsSelectWindowItem_CardCountrySign1_i(), this._CommonCardsSelectWindowItem_CardTypeSign1_i(), this._CommonCardsSelectWindowItem_Label2_i(), this._CommonCardsSelectWindowItem_Label3_i(), this._CommonCardsSelectWindowItem_CardTriangleStarSign1_i(), this._CommonCardsSelectWindowItem_Label4_i(), this._CommonCardsSelectWindowItem_Rect1_i()];
            this.addEventListener("creationComplete", this.___CommonCardsSelectWindowItem_Group1_creationComplete);
            this.addEventListener("rollOver", this.___CommonCardsSelectWindowItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___CommonCardsSelectWindowItem_Group1_rollOut);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CommonCardsSelectWindowItem._watcherSetupUtil = _arg1;
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
        public function set itemSource(_arg1:Object):void{
            this._itemSource = _arg1;
            this.buildInfo();
        }
        public function get itemSource():Object{
            return (this._itemSource);
        }
        private function buildInfo():void{
            var _local1:Object;
            if (((this._itemSource) && (this.creationHasComplete))){
                _local1 = this._itemSource;
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
                toolTip = CardsInfo.getCardTooltip(_local1);
                this.bgImg = JudgeCardsSourceMgr.getInstance().getSourceClass((_local1["color"] + "Bar"));
            };
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.buildInfo();
            this.headFrame.source = JudgeCardsSourceMgr.getInstance().getSourceClass("headFrame");
        }
        private function _CommonCardsSelectWindowItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonCardsSelectWindowItem_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "_CommonCardsSelectWindowItem_SmoothBitmapImage1");
            this._CommonCardsSelectWindowItem_SmoothBitmapImage1 = _local1;
            BindingManager.executeBindings(this, "_CommonCardsSelectWindowItem_SmoothBitmapImage1", this._CommonCardsSelectWindowItem_SmoothBitmapImage1);
            return (_local1);
        }
        private function _CommonCardsSelectWindowItem_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI______png_1985530244;
            _local1.x = 3;
            _local1.y = 4;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonCardsSelectWindowItem_MyImage1_i():MyImage{
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
        private function _CommonCardsSelectWindowItem_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 3;
            _local1.y = 4;
            _local1.initialized(this, "headFrame");
            this.headFrame = _local1;
            BindingManager.executeBindings(this, "headFrame", this.headFrame);
            return (_local1);
        }
        private function _CommonCardsSelectWindowItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 54;
            _local1.width = 135;
            _local1.percentHeight = 100;
            _local1.filters = [this._CommonCardsSelectWindowItem_GlowFilter1_c()];
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
        private function _CommonCardsSelectWindowItem_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonCardsSelectWindowItem_CardCountrySign1_i():CardCountrySign{
            var _local1:CardCountrySign = new CardCountrySign();
            _local1.x = 188;
            _local1.y = 13;
            _local1.initialized(this, "cardCountry");
            this.cardCountry = _local1;
            BindingManager.executeBindings(this, "cardCountry", this.cardCountry);
            return (_local1);
        }
        private function _CommonCardsSelectWindowItem_CardTypeSign1_i():CardTypeSign{
            var _local1:CardTypeSign = new CardTypeSign();
            _local1.x = 232;
            _local1.y = 11;
            _local1.initialized(this, "cardType");
            this.cardType = _local1;
            BindingManager.executeBindings(this, "cardType", this.cardType);
            return (_local1);
        }
        private function _CommonCardsSelectWindowItem_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 281;
            _local1.width = 30;
            _local1.percentHeight = 100;
            _local1.filters = [this._CommonCardsSelectWindowItem_GlowFilter2_c()];
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
        private function _CommonCardsSelectWindowItem_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonCardsSelectWindowItem_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 327;
            _local1.width = 30;
            _local1.percentHeight = 100;
            _local1.filters = [this._CommonCardsSelectWindowItem_GlowFilter3_c()];
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
        private function _CommonCardsSelectWindowItem_GlowFilter3_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonCardsSelectWindowItem_CardTriangleStarSign1_i():CardTriangleStarSign{
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
        private function _CommonCardsSelectWindowItem_Label4_i():Label{
            var _local1:Label = new Label();
            _local1.x = 397;
            _local1.y = 7;
            _local1.width = 62;
            _local1.height = 52;
            _local1.filters = [this._CommonCardsSelectWindowItem_GlowFilter4_c()];
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
        private function _CommonCardsSelectWindowItem_GlowFilter4_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonCardsSelectWindowItem_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.visible = false;
            _local1.left = 0;
            _local1.top = 0;
            _local1.right = 0;
            _local1.bottom = 0;
            _local1.stroke = this._CommonCardsSelectWindowItem_SolidColorStroke1_c();
            _local1.initialized(this, "mouseOverMask");
            this.mouseOverMask = _local1;
            BindingManager.executeBindings(this, "mouseOverMask", this.mouseOverMask);
            return (_local1);
        }
        private function _CommonCardsSelectWindowItem_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.weight = 3;
            _local1.color = 8376063;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CommonCardsSelectWindowItem_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function ___CommonCardsSelectWindowItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.mouseOverMask.visible = true;
        }
        public function ___CommonCardsSelectWindowItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.mouseOverMask.visible = false;
        }
        private function _CommonCardsSelectWindowItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (bgImg);
            }, null, "_CommonCardsSelectWindowItem_SmoothBitmapImage1.source");
            return (result);
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

    }
}//package custom_control 
