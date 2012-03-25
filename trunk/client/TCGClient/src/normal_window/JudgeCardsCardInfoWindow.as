//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
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
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import card_ui.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
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

    public class JudgeCardsCardInfoWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _8723007cardDesc:RichText;
        private var _733607779fadeOutEffect:Fade;
        private var _2124265467shopImage:CardImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _cardId:String;
        private var creationHasComplete:Boolean = false;
        private var hideTimer:Timer;
        private var isShow:Boolean = false;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function JudgeCardsCardInfoWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.hideTimer = new Timer(500, 1);
            this._embed_mxml_source_commonUI____png_1538356188 = JudgeCardsCardInfoWindow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._JudgeCardsCardInfoWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_JudgeCardsCardInfoWindowWatcherSetupUtil");
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
            this.width = 190;
            this.height = 425;
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.layout = this._JudgeCardsCardInfoWindow_BasicLayout1_c();
            this.mxmlContent = [this._JudgeCardsCardInfoWindow_CommonOuterFrame1_c(), this._JudgeCardsCardInfoWindow_SmoothBitmapImage1_c(), this._JudgeCardsCardInfoWindow_Label1_c(), this._JudgeCardsCardInfoWindow_Rect1_c(), this._JudgeCardsCardInfoWindow_CommonInnerFrame1_c(), this._JudgeCardsCardInfoWindow_CardImage1_i(), this._JudgeCardsCardInfoWindow_RichText1_i()];
            this._JudgeCardsCardInfoWindow_Fade1_i();
            this.addEventListener("creationComplete", this.___JudgeCardsCardInfoWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            JudgeCardsCardInfoWindow._watcherSetupUtil = _arg1;
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
        public function set cardId(_arg1:String):void{
            if (this._cardId == _arg1){
                return;
            };
            this._cardId = _arg1;
            this.displayCard();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.displayCard();
        }
        private function displayCard():void{
            var _local1:String;
            if (((this._cardId) && (this.creationHasComplete))){
                this.shopImage.setCardById(this._cardId);
                _local1 = (this.shopImage.cardInfo["info"] + this.shopImage.cardInfo["skill_info"]);
                this.cardDesc.textFlow = StringUtils.createTFByHtmlText(_local1);
            };
        }
        public function showWindow():void{
            if (this.isShow){
                return;
            };
            this.isShow = true;
            this.resetTimer();
            this.fadeOutEffect.stop();
            visible = true;
            alpha = 1;
        }
        public function hideWindow():void{
            if (!this.isShow){
                return;
            };
            this.isShow = false;
            this.hideTimer.addEventListener(TimerEvent.TIMER, this.hideWindowTimerHandler);
            this.hideTimer.start();
        }
        private function hideWindowTimerHandler(_arg1:TimerEvent):void{
            this.resetTimer();
            this.fadeOutEffect.play();
        }
        protected function fadeOutEffect_effectEndHandler(_arg1:EffectEvent):void{
            visible = false;
        }
        private function resetTimer():void{
            this.hideTimer.removeEventListener(TimerEvent.TIMER, this.hideWindowTimerHandler);
            this.hideTimer.reset();
        }
        private function _JudgeCardsCardInfoWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 300;
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            _local1.addEventListener("effectEnd", this.__fadeOutEffect_effectEnd);
            this.fadeOutEffect = _local1;
            BindingManager.executeBindings(this, "fadeOutEffect", this.fadeOutEffect);
            return (_local1);
        }
        public function __fadeOutEffect_effectEnd(_arg1:EffectEvent):void{
            this.fadeOutEffect_effectEndHandler(_arg1);
        }
        private function _JudgeCardsCardInfoWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardsCardInfoWindow_CommonOuterFrame1_c():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.width = 190;
            _local1.height = 425;
            _local1.alpha = 0.9;
            _local1.filters = [this._JudgeCardsCardInfoWindow_DropShadowFilter1_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardsCardInfoWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardsCardInfoWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 14;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardsCardInfoWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 20;
            _local1.y = 7;
            _local1.text = "卡片信息";
            _local1.mouseEnabled = false;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardsCardInfoWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 10;
            _local1.y = 35;
            _local1.alpha = 0.4;
            _local1.width = 169;
            _local1.height = 205;
            _local1.radiusX = 5;
            _local1.radiusY = 5;
            _local1.fill = this._JudgeCardsCardInfoWindow_SolidColor1_c();
            _local1.stroke = this._JudgeCardsCardInfoWindow_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardsCardInfoWindow_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardsCardInfoWindow_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 13156254;
            _local1.weight = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardsCardInfoWindow_CommonInnerFrame1_c():CommonInnerFrame{
            var _local1:CommonInnerFrame;
            _local1 = new CommonInnerFrame();
            _local1.x = 10;
            _local1.y = 250;
            _local1.width = 170;
            _local1.height = 165;
            _local1.alpha = 0.9;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardsCardInfoWindow_CardImage1_i():CardImage{
            var _local1:CardImage = new CardImage();
            _local1.x = 27;
            _local1.y = 46;
            _local1.scaleX = 1.6;
            _local1.scaleY = 1.6;
            _local1.filters = [this._JudgeCardsCardInfoWindow_DropShadowFilter2_c()];
            _local1.id = "shopImage";
            if (!_local1.document){
                _local1.document = this;
            };
            this.shopImage = _local1;
            BindingManager.executeBindings(this, "shopImage", this.shopImage);
            return (_local1);
        }
        private function _JudgeCardsCardInfoWindow_DropShadowFilter2_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.angle = 40;
            _local1.distance = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCardsCardInfoWindow_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 25;
            _local1.y = 258;
            _local1.width = 145;
            _local1.height = 170;
            _local1.setStyle("color", 15124616);
            _local1.setStyle("fontSize", 14);
            _local1.id = "cardDesc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardDesc = _local1;
            BindingManager.executeBindings(this, "cardDesc", this.cardDesc);
            return (_local1);
        }
        public function ___JudgeCardsCardInfoWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _JudgeCardsCardInfoWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "fadeOutEffect.target");
            return (result);
        }
        public function get cardDesc():RichText{
            return (this._8723007cardDesc);
        }
        public function set cardDesc(_arg1:RichText):void{
            var _local2:Object = this._8723007cardDesc;
            if (_local2 !== _arg1){
                this._8723007cardDesc = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardDesc", _local2, _arg1));
                };
            };
        }
        public function get fadeOutEffect():Fade{
            return (this._733607779fadeOutEffect);
        }
        public function set fadeOutEffect(_arg1:Fade):void{
            var _local2:Object = this._733607779fadeOutEffect;
            if (_local2 !== _arg1){
                this._733607779fadeOutEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeOutEffect", _local2, _arg1));
                };
            };
        }
        public function get shopImage():CardImage{
            return (this._2124265467shopImage);
        }
        public function set shopImage(_arg1:CardImage):void{
            var _local2:Object = this._2124265467shopImage;
            if (_local2 !== _arg1){
                this._2124265467shopImage = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopImage", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
