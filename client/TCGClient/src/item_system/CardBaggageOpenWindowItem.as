//Created by Action Script Viewer - http://www.buraks.com/asv
package item_system {
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
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
    import card_ui.*;
    import custom_effect.*;
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
    public class CardBaggageOpenWindowItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _265574357cardImage:CardImage;
        private var _1845177213newSign:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _553918038cardNum:int = 1;
        private var cardId:String;
        private var _1264914502isNewCard:Boolean = false;
        private var _embed_mxml_source_commonUI_new_flag_png_1013362274:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function CardBaggageOpenWindowItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI_new_flag_png_1013362274 = CardBaggageOpenWindowItem__embed_mxml_source_commonUI_new_flag_png_1013362274;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardBaggageOpenWindowItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_item_system_CardBaggageOpenWindowItemWatcherSetupUtil");
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
            this.width = 84;
            this.height = 112;
            this.scaleX = 1.4;
            this.scaleY = 1.4;
            this.layout = this._CardBaggageOpenWindowItem_BasicLayout1_c();
            this.mxmlContent = [this._CardBaggageOpenWindowItem_CardImage1_i(), this._CardBaggageOpenWindowItem_SmoothBitmapImage1_i()];
            this.addEventListener("creationComplete", this.___CardBaggageOpenWindowItem_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardBaggageOpenWindowItem._watcherSetupUtil = _arg1;
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
        public function setInfo(_arg1:String, _arg2:int, _arg3:Boolean):void{
            this.cardId = _arg1;
            this.cardNum = _arg2;
            this.isNewCard = _arg3;
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            var _local2:SurroundElfEffect;
            if (this.cardId){
                this.cardImage.alwaysUseSmallFontSize = true;
                this.cardImage.setCardById(this.cardId);
                this.toolTip = CardsInfo.getCardTooltip(this.cardImage.cardInfo);
                if (this.isNewCard){
                    _local2 = new SurroundElfEffect(this.cardImage, 6, 0xCDEB00, 0xFFFFFF, 6);
                    _local2.play();
                };
            };
        }
        private function _CardBaggageOpenWindowItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBaggageOpenWindowItem_CardImage1_i():CardImage{
            var _local1:CardImage = new CardImage();
            _local1.id = "cardImage";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardImage = _local1;
            BindingManager.executeBindings(this, "cardImage", this.cardImage);
            return (_local1);
        }
        private function _CardBaggageOpenWindowItem_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 6;
            _local1.y = 7;
            _local1.scaleX = 0.714;
            _local1.scaleY = 0.714;
            _local1.source = this._embed_mxml_source_commonUI_new_flag_png_1013362274;
            _local1.initialized(this, "newSign");
            this.newSign = _local1;
            BindingManager.executeBindings(this, "newSign", this.newSign);
            return (_local1);
        }
        public function ___CardBaggageOpenWindowItem_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _CardBaggageOpenWindowItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Boolean{
                return (isNewCard);
            }, null, "newSign.visible");
            return (result);
        }
        public function get cardImage():CardImage{
            return (this._265574357cardImage);
        }
        public function set cardImage(_arg1:CardImage):void{
            var _local2:Object = this._265574357cardImage;
            if (_local2 !== _arg1){
                this._265574357cardImage = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardImage", _local2, _arg1));
                };
            };
        }
        public function get newSign():SmoothBitmapImage{
            return (this._1845177213newSign);
        }
        public function set newSign(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1845177213newSign;
            if (_local2 !== _arg1){
                this._1845177213newSign = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newSign", _local2, _arg1));
                };
            };
        }
        private function get cardNum():int{
            return (this._553918038cardNum);
        }
        private function set cardNum(_arg1:int):void{
            var _local2:Object = this._553918038cardNum;
            if (_local2 !== _arg1){
                this._553918038cardNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardNum", _local2, _arg1));
                };
            };
        }
        private function get isNewCard():Boolean{
            return (this._1264914502isNewCard);
        }
        private function set isNewCard(_arg1:Boolean):void{
            var _local2:Object = this._1264914502isNewCard;
            if (_local2 !== _arg1){
                this._1264914502isNewCard = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "isNewCard", _local2, _arg1));
                };
            };
        }

    }
}//package item_system 
