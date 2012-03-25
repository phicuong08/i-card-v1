//Created by Action Script Viewer - http://www.buraks.com/asv
package shop_system {
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
    import source_manager.*;
    import spark.filters.*;
    import flashx.textLayout.elements.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import tool.*;
    import flash.net.*;
    import achievement_system.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class ShopCardInfoWindow extends Group {

        private var _8723007cardDesc:RichText;
        private var _641167755cardInfoArea:RichText;
        private var _1221271995headBg:SmoothBitmapImage;
        private var _1885192612leftDownFrame:SmoothBitmapImage;
        private var _1718814118leftFrame:SmoothBitmapImage;
        private var _2124265467shopImage:ShopCard;
        private var _266842037userHead:MyImage;
        private var _590547130userInfoArea:RichText;
        private var _266666762userName:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _8565794cardInfo:String;
        private var currentDisplayCard:ShopCard;
        private var creationHasComplete:Boolean = false;

        public function ShopCardInfoWindow(){
            this.width = 250;
            this.height = 800;
            this.mxmlContent = [this._ShopCardInfoWindow_SmoothBitmapImage1_i(), this._ShopCardInfoWindow_ShopCard1_i(), this._ShopCardInfoWindow_RichText1_i(), this._ShopCardInfoWindow_RichText2_i(), this._ShopCardInfoWindow_SmoothBitmapImage2_i(), this._ShopCardInfoWindow_MyImage1_i(), this._ShopCardInfoWindow_SmoothBitmapImage3_i(), this._ShopCardInfoWindow_Label1_i(), this._ShopCardInfoWindow_RichText3_i()];
            this.addEventListener("creationComplete", this.___ShopCardInfoWindow_Group1_creationComplete);
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
                this.color = 15124616;
                this.fontSize = 14;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.leftFrame.source = ShopMainWindowSourceMgr.getInstance().getSourceClass("leftFrame");
            this.leftDownFrame.source = ShopMainWindowSourceMgr.getInstance().getSourceClass("leftDownFrame");
            this.headBg.source = ShopMainWindowSourceMgr.getInstance().getSourceClass("headBg");
            this.refreshDisplayInfo();
        }
        public function setCard(_arg1:ShopCard):void{
            this.currentDisplayCard = _arg1;
            this.refreshDisplayInfo();
        }
        public function refreshDisplayInfo():void{
            if (!this.creationHasComplete){
                return;
            };
            this.userHead.source = (("source/userHead/" + UserObject.headIcon) + ".jpg");
            this.userName.text = UserObject.name;
            var _local1:TextFlow = new TextFlow();
            var _local2:ParagraphElement = new ParagraphElement();
            var _local3:SpanElement = new SpanElement();
            _local3.text = ("当前积分：" + UserObject.remainScore);
            _local2.addChild(_local3);
            _local3 = new SpanElement();
            _local3.text = ("\n当前金币：" + UserObject.money);
            _local2.addChild(_local3);
            _local1.addChild(_local2);
            this.userInfoArea.textFlow = _local1;
            if (!this.currentDisplayCard){
                return;
            };
            var _local4:Object = this.currentDisplayCard.shopCardInfo;
            this.shopImage.shopCardInfo = _local4;
            var _local5:String = (_local4.isCard) ? (_local4["info"] + _local4["skill_info"]) : _local4["desc"];
            this.cardDesc.textFlow = StringUtils.createTFByHtmlText(_local5);
            _local1 = new TextFlow();
            _local2 = new ParagraphElement();
            _local3 = new SpanElement();
            _local3.text = ((_local4.score_cost > 0)) ? ("需求积分：" + _local4.score_cost) : ("需求金币：" + _local4.money_cost);
            _local3.color = (this.currentDisplayCard.affordPay) ? ((_local4.money_cost > 0)) ? 13169476 : 0xFFFFFF : 0xFF0000;
            _local2.addChild(_local3);
            _local3 = new SpanElement();
            _local3.text = ("\n需求等级：" + _local4.level_request);
            _local3.color = (this.currentDisplayCard.affordLevel) ? 13169476 : 0xFF0000;
            _local2.addChild(_local3);
            _local3 = new SpanElement();
            var _local6:String = ((int(_local4.achievement_request) == 0)) ? "无" : AchievementLib.achievementConfig[_local4.achievement_request].name;
            _local3.text = ("\n需求成就：" + _local6);
            _local3.color = (this.currentDisplayCard.affordAchievement) ? 13169476 : 0xFF0000;
            _local2.addChild(_local3);
            _local1.addChild(_local2);
            this.cardInfoArea.textFlow = _local1;
        }
        private function _ShopCardInfoWindow_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 10;
            _local1.y = 90;
            _local1.initialized(this, "leftFrame");
            this.leftFrame = _local1;
            BindingManager.executeBindings(this, "leftFrame", this.leftFrame);
            return (_local1);
        }
        private function _ShopCardInfoWindow_ShopCard1_i():ShopCard{
            var _local1:ShopCard;
            _local1 = new ShopCard();
            _local1.x = 41;
            _local1.y = 131;
            _local1.mouseChildren = false;
            _local1.mouseEnabled = false;
            _local1.scaleX = 1.6;
            _local1.scaleY = 1.6;
            _local1.filters = [this._ShopCardInfoWindow_DropShadowFilter1_c()];
            _local1.id = "shopImage";
            if (!_local1.document){
                _local1.document = this;
            };
            this.shopImage = _local1;
            BindingManager.executeBindings(this, "shopImage", this.shopImage);
            return (_local1);
        }
        private function _ShopCardInfoWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.angle = 40;
            _local1.distance = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ShopCardInfoWindow_RichText1_i():RichText{
            var _local1:RichText;
            _local1 = new RichText();
            _local1.x = 33;
            _local1.y = 341;
            _local1.width = 145;
            _local1.height = 170;
            _local1.id = "cardDesc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardDesc = _local1;
            BindingManager.executeBindings(this, "cardDesc", this.cardDesc);
            return (_local1);
        }
        private function _ShopCardInfoWindow_RichText2_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 46;
            _local1.y = 548;
            _local1.width = 137;
            _local1.height = 60;
            _local1.setStyle("lineHeight", 31);
            _local1.id = "cardInfoArea";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardInfoArea = _local1;
            BindingManager.executeBindings(this, "cardInfoArea", this.cardInfoArea);
            return (_local1);
        }
        private function _ShopCardInfoWindow_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 24;
            _local1.y = 638;
            _local1.initialized(this, "leftDownFrame");
            this.leftDownFrame = _local1;
            BindingManager.executeBindings(this, "leftDownFrame", this.leftDownFrame);
            return (_local1);
        }
        private function _ShopCardInfoWindow_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 47.5;
            _local1.y = 625.5;
            _local1.width = 58;
            _local1.height = 58;
            _local1.id = "userHead";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userHead = _local1;
            BindingManager.executeBindings(this, "userHead", this.userHead);
            return (_local1);
        }
        private function _ShopCardInfoWindow_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 46;
            _local1.y = 623;
            _local1.initialized(this, "headBg");
            this.headBg = _local1;
            BindingManager.executeBindings(this, "headBg", this.headBg);
            return (_local1);
        }
        private function _ShopCardInfoWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 102;
            _local1.y = 656;
            _local1.width = 130;
            _local1.height = 24;
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "userName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userName = _local1;
            BindingManager.executeBindings(this, "userName", this.userName);
            return (_local1);
        }
        private function _ShopCardInfoWindow_RichText3_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 68;
            _local1.y = 710;
            _local1.width = 130;
            _local1.height = 65;
            _local1.setStyle("lineHeight", 32);
            _local1.id = "userInfoArea";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userInfoArea = _local1;
            BindingManager.executeBindings(this, "userInfoArea", this.userInfoArea);
            return (_local1);
        }
        public function ___ShopCardInfoWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
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
        public function get cardInfoArea():RichText{
            return (this._641167755cardInfoArea);
        }
        public function set cardInfoArea(_arg1:RichText):void{
            var _local2:Object = this._641167755cardInfoArea;
            if (_local2 !== _arg1){
                this._641167755cardInfoArea = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardInfoArea", _local2, _arg1));
                };
            };
        }
        public function get headBg():SmoothBitmapImage{
            return (this._1221271995headBg);
        }
        public function set headBg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1221271995headBg;
            if (_local2 !== _arg1){
                this._1221271995headBg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headBg", _local2, _arg1));
                };
            };
        }
        public function get leftDownFrame():SmoothBitmapImage{
            return (this._1885192612leftDownFrame);
        }
        public function set leftDownFrame(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1885192612leftDownFrame;
            if (_local2 !== _arg1){
                this._1885192612leftDownFrame = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftDownFrame", _local2, _arg1));
                };
            };
        }
        public function get leftFrame():SmoothBitmapImage{
            return (this._1718814118leftFrame);
        }
        public function set leftFrame(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1718814118leftFrame;
            if (_local2 !== _arg1){
                this._1718814118leftFrame = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftFrame", _local2, _arg1));
                };
            };
        }
        public function get shopImage():ShopCard{
            return (this._2124265467shopImage);
        }
        public function set shopImage(_arg1:ShopCard):void{
            var _local2:Object = this._2124265467shopImage;
            if (_local2 !== _arg1){
                this._2124265467shopImage = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopImage", _local2, _arg1));
                };
            };
        }
        public function get userHead():MyImage{
            return (this._266842037userHead);
        }
        public function set userHead(_arg1:MyImage):void{
            var _local2:Object = this._266842037userHead;
            if (_local2 !== _arg1){
                this._266842037userHead = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userHead", _local2, _arg1));
                };
            };
        }
        public function get userInfoArea():RichText{
            return (this._590547130userInfoArea);
        }
        public function set userInfoArea(_arg1:RichText):void{
            var _local2:Object = this._590547130userInfoArea;
            if (_local2 !== _arg1){
                this._590547130userInfoArea = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userInfoArea", _local2, _arg1));
                };
            };
        }
        public function get userName():Label{
            return (this._266666762userName);
        }
        public function set userName(_arg1:Label):void{
            var _local2:Object = this._266666762userName;
            if (_local2 !== _arg1){
                this._266666762userName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userName", _local2, _arg1));
                };
            };
        }
        private function get cardInfo():String{
            return (this._8565794cardInfo);
        }
        private function set cardInfo(_arg1:String):void{
            var _local2:Object = this._8565794cardInfo;
            if (_local2 !== _arg1){
                this._8565794cardInfo = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardInfo", _local2, _arg1));
                };
            };
        }

    }
}//package shop_system 
