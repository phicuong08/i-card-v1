//Created by Action Script Viewer - http://www.buraks.com/asv
package card_collection {
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
    import spark.filters.*;
    import card_ui.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import skins.*;
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

    public class CardCollectionCard extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CardCollectionCard_ColorMatrixFilter1:ColorMatrixFilter;
        private var _553912979cardImg:CardImage;
        private var _348630820submitBtn:Button;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _714582971grayFilter:Array;
        private var _1662487470_cardEnabled:Boolean = true;
        private var cardInfo:Object;
        private var collectionInfo:Object;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardCollectionCard(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardCollectionCard_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_card_collection_CardCollectionCardWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (CardCollectionCard[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 109.2;
            this.height = 145.6;
            this.layout = this._CardCollectionCard_BasicLayout1_c();
            this.mxmlContent = [this._CardCollectionCard_CardImage1_i()];
            this._CardCollectionCard_Button1_i();
            this.addEventListener("creationComplete", this.___CardCollectionCard_Group1_creationComplete);
            this.addEventListener("rollOver", this.___CardCollectionCard_Group1_rollOver);
            this.addEventListener("rollOut", this.___CardCollectionCard_Group1_rollOut);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardCollectionCard._watcherSetupUtil = _arg1;
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
        public function set cardEnabled(_arg1:Boolean):void{
            this._cardEnabled = _arg1;
            if (!this._cardEnabled){
                this.grayFilter = ColorUtil.getGrayColorMatrix();
            } else {
                this.grayFilter = ColorUtil.getColorMatrixByBrightness(0);
            };
        }
        public function get cardEnabled():Boolean{
            return (this._cardEnabled);
        }
        public function setInfo(_arg1:Object, _arg2:Object):void{
            this.cardInfo = _arg1;
            this.collectionInfo = _arg2;
            this.displayInfo();
        }
        public function refreshCollection(_arg1:Object):void{
            this.collectionInfo = _arg1;
            this.cardEnabled = !((_arg1["submit_card_info"][this.cardInfo.id] == null));
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.displayInfo();
        }
        protected function displayInfo():void{
            if (((initialized) && (this.cardInfo))){
                this.cardImg.setCardById(this.cardInfo.id);
                this.cardEnabled = !((this.collectionInfo["submit_card_info"][this.cardInfo.id] == null));
                toolTip = CardsInfo.getCardTooltip(this.cardInfo);
            };
        }
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            if (((!(this.cardEnabled)) && (this.submitBtn))){
                addElement(this.submitBtn);
            };
        }
        protected function group1_rollOutHandler(_arg1:MouseEvent):void{
            if (((this.submitBtn) && (this.submitBtn.parent))){
                removeElement(this.submitBtn);
            };
        }
        protected function submitBtn_clickHandler(_arg1:MouseEvent):void{
            var event:* = _arg1;
            var check_submit:* = CardCollectionMgr.getInstance().check_submit(this.cardInfo.id, 1);
            if (check_submit[1] == true){
                var collectionFunc:* = function (_arg1:Array):Boolean{
                    if (_arg1[0] == true){
                        CardCollectionMgr.getInstance().submitCard(cardInfo.id, 1);
                    };
                    return (true);
                };
                MessageBox.showMessageBox(MessageBox.SELECT, "操作提醒：", (("你确定要将备用卡中的一张【" + this.cardInfo.name) + "】放入集卡册吗？<br>#r提交后该卡将从备用卡中移除。#n"), collectionFunc);
            } else {
                MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "提示：", check_submit[2]);
            };
        }
        private function _CardCollectionCard_Button1_i():Button{
            var _local1:Button;
            _local1 = new Button();
            _local1.x = 12;
            _local1.y = 66;
            _local1.label = "提交卡片";
            _local1.width = 87;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__submitBtn_click);
            _local1.id = "submitBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.submitBtn = _local1;
            BindingManager.executeBindings(this, "submitBtn", this.submitBtn);
            return (_local1);
        }
        public function __submitBtn_click(_arg1:MouseEvent):void{
            this.submitBtn_clickHandler(_arg1);
        }
        private function _CardCollectionCard_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardCollectionCard_CardImage1_i():CardImage{
            var _local1:CardImage = new CardImage();
            _local1.scaleX = 1.3;
            _local1.scaleY = 1.3;
            _local1.filters = [this._CardCollectionCard_ColorMatrixFilter1_i()];
            _local1.id = "cardImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardImg = _local1;
            BindingManager.executeBindings(this, "cardImg", this.cardImg);
            return (_local1);
        }
        private function _CardCollectionCard_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this._CardCollectionCard_ColorMatrixFilter1 = _local1;
            BindingManager.executeBindings(this, "_CardCollectionCard_ColorMatrixFilter1", this._CardCollectionCard_ColorMatrixFilter1);
            return (_local1);
        }
        public function ___CardCollectionCard_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function ___CardCollectionCard_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        public function ___CardCollectionCard_Group1_rollOut(_arg1:MouseEvent):void{
            this.group1_rollOutHandler(_arg1);
        }
        private function _CardCollectionCard_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Boolean{
                return (!(_cardEnabled));
            }, null, "submitBtn.visible");
            result[1] = new Binding(this, function ():Object{
                return (grayFilter);
            }, null, "_CardCollectionCard_ColorMatrixFilter1.matrix");
            return (result);
        }
        public function get cardImg():CardImage{
            return (this._553912979cardImg);
        }
        public function set cardImg(_arg1:CardImage):void{
            var _local2:Object = this._553912979cardImg;
            if (_local2 !== _arg1){
                this._553912979cardImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardImg", _local2, _arg1));
                };
            };
        }
        public function get submitBtn():Button{
            return (this._348630820submitBtn);
        }
        public function set submitBtn(_arg1:Button):void{
            var _local2:Object = this._348630820submitBtn;
            if (_local2 !== _arg1){
                this._348630820submitBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "submitBtn", _local2, _arg1));
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
        private function get _cardEnabled():Boolean{
            return (this._1662487470_cardEnabled);
        }
        private function set _cardEnabled(_arg1:Boolean):void{
            var _local2:Object = this._1662487470_cardEnabled;
            if (_local2 !== _arg1){
                this._1662487470_cardEnabled = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_cardEnabled", _local2, _arg1));
                };
            };
        }

    }
}//package card_collection 
