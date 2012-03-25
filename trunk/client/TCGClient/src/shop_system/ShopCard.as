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
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
//    import flash.filters.*;
    import __AS3__.vec.*;
    import spark.effects.*;
    import spark.filters.*;
    import flash.utils.*;
    import combat_element_script.*;
    import item_system.*;
    import spark.effects.animation.*;
    import flash.accessibility.*;
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
//	import flash.filters.ColorMatrixFilter;
	use namespace mx_internal;
    public class ShopCard extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _ShopCard_ColorMatrixFilter1:ColorMatrixFilter;
        public var _ShopCard_Label1:Label;
        private var _258953191cardPrice:Label;
        private var _1282133955fadeEf:Fade;
        private var _207684226glowEffect:AnimateFilter;
        private var _176091291glowFilter:GlowFilter;
        private var _206997958goodImg:ItemCardBaggageImage;
        private var _1068264366moveEf:Move;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _714582971grayFilter:Array;
        private var _shopCardInfo:Object;
        private var _isActive:Boolean = true;
        public var isCardInList:Boolean = false;
        private var _2123191376goodsNum:int = 0;
        public var affordPay:Boolean;
        public var affordLevel:Boolean;
        public var affordAchievement:Boolean;
        public var useMoneyOrScore:Boolean;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function ShopCard(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._ShopCard_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_shop_system_ShopCardWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (ShopCard[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.scaleX = 1.3;
            this.scaleY = 1.3;
            this.filters = [this._ShopCard_ColorMatrixFilter1_i()];
            this.mxmlContent = [this._ShopCard_ItemCardBaggageImage1_i(), this._ShopCard_Label1_i(), this._ShopCard_Label2_i()];
            this._ShopCard_Fade1_i();
            this._ShopCard_AnimateFilter1_i();
            this._ShopCard_Move1_i();
            this.addEventListener("creationComplete", this.___ShopCard_Group1_creationComplete);
            this.addEventListener("rollOver", this.___ShopCard_Group1_rollOver);
            this.addEventListener("click", this.___ShopCard_Group1_click);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            ShopCard._watcherSetupUtil = _arg1;
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
        private function creationCompleteHandler():void{
            new MyDragManager(this, this.dragStartHandler);
        }
        protected function dragStartHandler(_arg1:MouseEvent):void{
            if (((this.fadeEf.isPlaying) || (this.moveEf.isPlaying))){
                return;
            };
            if (!this.isCardInList){
                if (!ShopMainWindow.getInstance().canPutCardInList()){
                    return;
                };
                if (!this._isActive){
                    return;
                };
            };
            var _local2:ShopCard = new ShopCard();
            _local2.scaleX = 1;
            _local2.scaleY = 1;
            var _local3:DropShadowFilter = new DropShadowFilter();
            _local3.angle = 40;
            _local3.distance = 40;
            _local3.alpha = 0.6;
            _local2.filters = [_local3];
            _local2.shopCardInfo = this._shopCardInfo;
            var _local4:DragSource = new DragSource();
            _local4.addData(this._shopCardInfo, "source");
            DragManager.doDrag(this, _local4, _arg1, _local2, 0, 0, 1);
            ShopMainWindow.getInstance().needRemoveCard = (this.isCardInList) ? this : null;
        }
        public function set shopCardInfo(_arg1:Object):void{
            this._shopCardInfo = _arg1;
            this.goodImg.targetInfo = _arg1;
            if (_arg1.isCard){
                this.glowFilter.color = this.getColor();
                this.cardPrice.y = ((ItemCardLib.getItemInfoById(this._shopCardInfo.id).star == "")) ? 77 : 57;
            } else {
                if (_arg1.type == "card_baggage"){
                    this.glowFilter.color = 0xFFF000;
                    this.cardPrice.y = 77;
                } else {
                    this.glowFilter.color = 0xFFF000;
                    this.cardPrice.y = 77;
                };
            };
            this.useMoneyOrScore = (this._shopCardInfo.money_cost > 0);
            if (this.useMoneyOrScore){
                this.cardPrice.text = this._shopCardInfo.money_cost;
            } else {
                this.cardPrice.text = this._shopCardInfo.score_cost;
            };
        }
        public function get shopCardInfo():Object{
            return (this._shopCardInfo);
        }
        private function getColor():uint{
            switch (this._shopCardInfo.color){
                case "gold":
                    return (0xFF0000);
                case "silver":
                    return (0xFF00);
                case "red":
                    return (0xFFFFFF);
                case "green":
                    return (0xFFF000);
            };
            return (0);
        }
        public function doMove(_arg1:Number=NaN, _arg2:Number=NaN):void{
            if (((!((x == _arg1))) || (!((y == _arg2))))){
                this.moveEf.xTo = _arg1;
                this.moveEf.yTo = _arg2;
                this.moveEf.play();
            };
        }
        public function doFade(_arg1:Boolean=true):void{
            if (_arg1){
                this.fadeEf.alphaTo = 1;
            } else {
                this.fadeEf.alphaTo = 0;
            };
            this.fadeEf.play();
        }
        public function setActiveInfo(_arg1:Boolean, _arg2:Boolean, _arg3:Boolean):void{
            this.affordPay = _arg1;
            this.affordLevel = _arg2;
            this.affordAchievement = _arg3;
            this._isActive = ((((_arg1) && (_arg2))) && (_arg3));
            if (_arg1){
                if (this.useMoneyOrScore){
                    this.cardPrice.setStyle("color", 0xE4FF00);
                } else {
                    this.cardPrice.setStyle("color", 0xFFFFFF);
                };
            } else {
                this.cardPrice.setStyle("color", 0xFF0000);
            };
            if (((!(_arg2)) || (!(_arg3)))){
                this.grayFilter = ColorUtil.getGrayColorMatrix();
            } else {
                this.grayFilter = ColorUtil.getColorMatrixByBrightness(0);
            };
        }
        public function get isActive():Boolean{
            return (this._isActive);
        }
        protected function group1_rollOverHandler():void{
            var _local1:String;
            var _local2:Object;
            if (DragManager.isDragging){
                return;
            };
            if (this._shopCardInfo.isCard){
                _local2 = UserObject.allCardsInfo;
                _local1 = (_local2[this._shopCardInfo.id]) ? (("持有 " + _local2[this._shopCardInfo.id]) + " 张\n") : "持有 0 张\n";
            } else {
                _local1 = "";
            };
            if (!this._isActive){
                _local1 = (_local1 + (this.affordPay) ? "" : ((this._shopCardInfo.score_cost > 0)) ? "积分不足\n" : "金币不足\n");
                _local1 = (_local1 + (this.affordLevel) ? "" : "等级不符\n");
                _local1 = (_local1 + (this.affordAchievement) ? "" : "成就不符\n");
            };
            this.toolTip = _local1;
        }
        protected function cardimage1_clickHandler(_arg1:MouseEvent):void{
            if (this.isCardInList){
                ShopMainWindow.getInstance().removeCardFromList(this);
            } else {
                if (this._isActive){
                    this.putCardIntoList();
                };
            };
        }
        private function putCardIntoList():void{
            var mainWindow:* = null;
            var card:* = null;
            var fadeEnd:* = null;
            fadeEnd = function (_arg1:EffectEvent):void{
                card.fadeEf.removeEventListener(EffectEvent.EFFECT_END, fadeEnd);
                card.fadeEf.duration = 400;
                mainWindow.removeElement(card);
                mainWindow.cardCasheArray.push(card);
            };
            mainWindow = ShopMainWindow.getInstance();
            if (!mainWindow.canPutCardInList()){
                return;
            };
            card = mainWindow.createCard();
            card.shopCardInfo = this.shopCardInfo;
            card.x = (mainWindow.mouseX - (this.mouseX * this.scaleX));
            card.y = (mainWindow.mouseY - (this.mouseY * this.scaleY));
            mainWindow.addElement(card);
            card.doMove(270, 618);
            card.fadeEf.duration = 300;
            card.doFade(false);
            card.fadeEf.addEventListener(EffectEvent.EFFECT_END, fadeEnd);
            mainWindow.addCardToList(this.shopCardInfo);
        }
        public function refreshCardBaggageCollenctionRate():void{
            this.goodImg.refreshCardBaggageCollenctionRate();
        }
        private function _ShopCard_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 400;
            this.fadeEf = _local1;
            BindingManager.executeBindings(this, "fadeEf", this.fadeEf);
            return (_local1);
        }
        private function _ShopCard_AnimateFilter1_i():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.repeatCount = 0;
            _local1.duration = 1000;
            _local1.repeatBehavior = "reverse";
            _local1.bitmapFilter = this._ShopCard_GlowFilter1_i();
            new Vector.<MotionPath>(1)[0] = this._ShopCard_SimpleMotionPath1_c();
            _local1.motionPaths = new Vector.<MotionPath>(1);
            this.glowEffect = _local1;
            BindingManager.executeBindings(this, "glowEffect", this.glowEffect);
            return (_local1);
        }
        private function _ShopCard_GlowFilter1_i():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.blurX = 200;
            _local1.blurY = 200;
            _local1.inner = true;
            _local1.strength = 2;
            this.glowFilter = _local1;
            BindingManager.executeBindings(this, "glowFilter", this.glowFilter);
            return (_local1);
        }
        private function _ShopCard_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 0.4;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ShopCard_Move1_i():Move{
            var _local1:Move = new Move();
            _local1.duration = 400;
            this.moveEf = _local1;
            BindingManager.executeBindings(this, "moveEf", this.moveEf);
            return (_local1);
        }
        private function _ShopCard_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this._ShopCard_ColorMatrixFilter1 = _local1;
            BindingManager.executeBindings(this, "_ShopCard_ColorMatrixFilter1", this._ShopCard_ColorMatrixFilter1);
            return (_local1);
        }
        private function _ShopCard_ItemCardBaggageImage1_i():ItemCardBaggageImage{
            var _local1:ItemCardBaggageImage = new ItemCardBaggageImage();
            _local1.id = "goodImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.goodImg = _local1;
            BindingManager.executeBindings(this, "goodImg", this.goodImg);
            return (_local1);
        }
        private function _ShopCard_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.right = 10;
            _local1.top = 20;
            _local1.depth = 1;
            _local1.mouseEnabled = false;
            _local1.filters = [this._ShopCard_GlowFilter2_c(), this._ShopCard_DropShadowFilter1_c()];
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("color", 0xE4FF00);
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "_ShopCard_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._ShopCard_Label1 = _local1;
            BindingManager.executeBindings(this, "_ShopCard_Label1", this._ShopCard_Label1);
            return (_local1);
        }
        private function _ShopCard_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xB400FF;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ShopCard_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ShopCard_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 8;
            _local1.y = 57;
            _local1.width = 74;
            _local1.height = 19;
            _local1.depth = 1;
            _local1.mouseEnabled = false;
            _local1.filters = [this._ShopCard_GlowFilter3_c()];
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 0xE4FF00);
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "cardPrice";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardPrice = _local1;
            BindingManager.executeBindings(this, "cardPrice", this.cardPrice);
            return (_local1);
        }
        private function _ShopCard_GlowFilter3_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___ShopCard_Group1_creationComplete(_arg1:FlexEvent):void{
            this.creationCompleteHandler();
        }
        public function ___ShopCard_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler();
        }
        public function ___ShopCard_Group1_click(_arg1:MouseEvent):void{
            this.cardimage1_clickHandler(_arg1);
        }
        private function _ShopCard_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "fadeEf.target");
            result[1] = new Binding(this, function ():Object{
                return (this);
            }, null, "moveEf.target");
            result[2] = new Binding(this, function ():Object{
                return (this);
            }, null, "glowEffect.target");
            result[3] = new Binding(this, function ():Object{
                return (grayFilter);
            }, null, "_ShopCard_ColorMatrixFilter1.matrix");
            result[4] = new Binding(this, function ():String{
                var _local1:* = ("×" + goodsNum);
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_ShopCard_Label1.text");
            result[5] = new Binding(this, function ():Boolean{
                return (!((goodsNum == 0)));
            }, null, "_ShopCard_Label1.visible");
            return (result);
        }
        public function get cardPrice():Label{
            return (this._258953191cardPrice);
        }
        public function set cardPrice(_arg1:Label):void{
            var _local2:Object = this._258953191cardPrice;
            if (_local2 !== _arg1){
                this._258953191cardPrice = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardPrice", _local2, _arg1));
                };
            };
        }
        public function get fadeEf():Fade{
            return (this._1282133955fadeEf);
        }
        public function set fadeEf(_arg1:Fade):void{
            var _local2:Object = this._1282133955fadeEf;
            if (_local2 !== _arg1){
                this._1282133955fadeEf = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeEf", _local2, _arg1));
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
        public function get glowFilter():GlowFilter{
            return (this._176091291glowFilter);
        }
        public function set glowFilter(_arg1:GlowFilter):void{
            var _local2:Object = this._176091291glowFilter;
            if (_local2 !== _arg1){
                this._176091291glowFilter = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowFilter", _local2, _arg1));
                };
            };
        }
        public function get goodImg():ItemCardBaggageImage{
            return (this._206997958goodImg);
        }
        public function set goodImg(_arg1:ItemCardBaggageImage):void{
            var _local2:Object = this._206997958goodImg;
            if (_local2 !== _arg1){
                this._206997958goodImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goodImg", _local2, _arg1));
                };
            };
        }
        public function get moveEf():Move{
            return (this._1068264366moveEf);
        }
        public function set moveEf(_arg1:Move):void{
            var _local2:Object = this._1068264366moveEf;
            if (_local2 !== _arg1){
                this._1068264366moveEf = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveEf", _local2, _arg1));
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
        public function get goodsNum():int{
            return (this._2123191376goodsNum);
        }
        public function set goodsNum(_arg1:int):void{
            var _local2:Object = this._2123191376goodsNum;
            if (_local2 !== _arg1){
                this._2123191376goodsNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goodsNum", _local2, _arg1));
                };
            };
        }

    }
}//package shop_system 
