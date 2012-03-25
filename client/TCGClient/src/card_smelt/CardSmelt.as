//Created by Action Script Viewer - http://www.buraks.com/asv
package card_smelt {
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
    import spark.effects.*;
    import spark.layouts.*;
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

    public class CardSmelt extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CardSmelt_CommonMiddleFrame1:CommonMiddleFrame;
        private var _2069887391bottomFrameImg:SmoothBitmapImage;
        private var _98258cap:CardSmeltCap;
        private var _1081500497cardContainer:Group;
        private var _147413017clearSpeedUpBtn:CardSmeltStyleButton;
        private var _450919198fadeDescEffect:Fade;
        private var _1020166578fadeInEffect:Fade;
        private var _491813559smeltBtn:CardSmeltStyleButton;
        private var _2086369598stateDesc:RichText;
        private var __moduleFactoryInitialized:Boolean = false;
        private var fadeInEffectEndSign:Boolean = false;
        private var smeltCardTable:Object;
        private var workCountDownTimer:Timer;
        public var smeltIndex:int;
        public var smeltInfo:Object;
        public var state:String = "free";
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardSmelt(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.smeltCardTable = new Object();
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardSmelt_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_card_smelt_CardSmeltWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (CardSmelt[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 457;
            this.height = 192;
            this.layout = this._CardSmelt_BasicLayout1_c();
            this.mxmlContent = [this._CardSmelt_CommonMiddleFrame1_i(), this._CardSmelt_SmoothBitmapImage1_i(), this._CardSmelt_Group2_i(), this._CardSmelt_CardSmeltCap1_i(), this._CardSmelt_RichText1_i(), this._CardSmelt_CardSmeltStyleButton1_i(), this._CardSmelt_CardSmeltStyleButton2_i()];
            this._CardSmelt_Fade2_i();
            this._CardSmelt_Fade1_i();
            this.addEventListener("creationComplete", this.___CardSmelt_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardSmelt._watcherSetupUtil = _arg1;
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
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.bottomFrameImg.source = JudgeCardsSourceMgr.getInstance().getSourceClass("cardSmeltBottomFrame");
            this.fadeInEffect.play();
        }
        protected function fadeInEffect_effectEndHandler(_arg1:EffectEvent):void{
            this.fadeInEffectEndSign = true;
            this.displayInfo();
        }
        protected function resetCard():void{
            this.cardContainer.removeAllElements();
            this.smeltCardTable = new Object();
        }
        public function setSmeltInfo(_arg1:Object, _arg2:int):void{
            mouseChildren = false;
            this.smeltInfo = _arg1;
            this.smeltIndex = _arg2;
            this.displayInfo();
        }
        protected function displayInfo():void{
            var _local1:String;
            if (((this.smeltInfo) && (this.fadeInEffectEndSign))){
                mouseChildren = true;
                this.state = this.smeltInfo["state"];
                if (this.state == "work"){
                    this.cap.closeCap();
                    this.startWorkCountDownTimer();
                } else {
                    this.stopWorkCountDownTimer();
                    this.resetCard();
                    this.cap.openCap();
                    if (this.state == "harvest"){
                        for (_local1 in this.smeltInfo["smelt_harvest_cards"]) {
                            this.addCard(_local1, this.smeltInfo["smelt_harvest_cards"][_local1], true);
                        };
                        this.stateDesc.textFlow = StringUtils.createTFByHtmlText("#g请领取熔炼所得的卡片。#n");
                    } else {
                        this.stateDesc.textFlow = StringUtils.createTFByHtmlText("请将需要熔炼的卡片放入熔炉中。");
                    };
                };
                this.fadeDescEffect.play();
                this.smeltBtn.enabled = (this.state == "free");
                this.clearSpeedUpBtn.enabled = !((this.state == "harvest"));
                this.clearSpeedUpBtn.label = ((this.state)=="work") ? "加  速" : "清  空";
            };
        }
        protected function startWorkCountDownTimer():void{
            if (!this.workCountDownTimer){
                this.workCountDownTimer = new Timer(1000);
                this.workCountDownTimer.addEventListener(TimerEvent.TIMER, this.countDownTimerHandler);
            };
            this.workCountDownTimer.start();
            this.countDownTimerHandler(null);
        }
        protected function countDownTimerHandler(_arg1:TimerEvent):void{
            var _local2:Number = (((this.smeltInfo.smelt_start_time + this.smeltInfo.smelt_need_time) * 1000) - new Date().time);
            var _local3:Date = new Date(((_local2 < 0)) ? 0 : _local2);
            var _local4 = (((((_local3.hoursUTC + "时") + ("0" + _local3.minutesUTC).substr(-2)) + "分") + ("0" + _local3.secondsUTC).substr(-2)) + "秒");
            var _local5:String = ("#r卡片熔炼中：#n<br>余时：" + _local4);
            this.stateDesc.textFlow = StringUtils.createTFByHtmlText(_local5);
        }
        protected function stopWorkCountDownTimer():void{
            if (this.workCountDownTimer){
                this.workCountDownTimer.stop();
            };
        }
        public function addCard(_arg1:String, _arg2:int, _arg3:Boolean=false):void{
            var _local4:CardSmeltCardItem = this.smeltCardTable[_arg1];
            if (_local4){
                _local4.cardNum = (_local4.cardNum + _arg2);
            } else {
                _local4 = new CardSmeltCardItem();
                _local4.setCardById(_arg1);
                _local4.cardNum = _arg2;
                _local4.belongSmelt = this;
                _local4.isHarvestCard = _arg3;
                this.cardContainer.addElement(_local4);
                this.smeltCardTable[_arg1] = _local4;
                this.rejustCardPos();
            };
            if (!_arg3){
                this.setHarvestCardDescText();
            };
        }
        protected function setHarvestCardDescText():void{
            var _local1:Number;
            if (CommonUtil.isObjectEmpty(this.smeltCardTable)){
                this.displayInfo();
            } else {
                _local1 = CardSmeltMgr.getInstance().getHarvestCardsRare(this.getContainerCardInfo());
                this.stateDesc.textFlow = StringUtils.createTFByHtmlText((int((_local1 * 100)) + "%概率产出稀有卡片"));
            };
        }
        public function removeCard(_arg1:String, _arg2:int):void{
            var _local3:CardSmeltCardItem = this.smeltCardTable[_arg1];
            if (_local3){
                if (_local3.cardNum <= _arg2){
                    this.cardContainer.removeElement(_local3);
                    delete this.smeltCardTable[_arg1];
                    this.rejustCardPos();
                } else {
                    _local3.cardNum = (_local3.cardNum - _arg2);
                };
                if (!_local3.isHarvestCard){
                    this.setHarvestCardDescText();
                };
            };
        }
        private function rejustCardPos():void{
            var _local4:CardSmeltCardItem;
            var _local1:int = this.cardContainer.numElements;
            var _local2:Number = ((this.cardContainer.width - 110) / (_local1 + 1));
            var _local3:int;
            while (_local3 < _local1) {
                _local4 = (this.cardContainer.getElementAt(_local3) as CardSmeltCardItem);
                _local4.changeXPos((_local2 * (_local1 - _local3)));
                _local3++;
            };
        }
        protected function cardContainer_dragEnterHandler(_arg1:DragEvent):void{
            if ((((_arg1.dragInitiator is SmeltDataGridItem)) && ((this.state == "free")))){
                DragManager.acceptDragDrop(this.cardContainer);
            };
        }
        protected function cardContainer_dragDropHandler(_arg1:DragEvent):void{
            CardSmeltMgr.getInstance().dragDropHandler(_arg1, this);
        }
        protected function cardContainer_creationCompleteHandler(_arg1:FlexEvent):void{
            this.cardContainer.graphics.beginFill(0, 0);
            this.cardContainer.graphics.drawRect(0, 0, this.cardContainer.width, this.cardContainer.height);
            this.cardContainer.graphics.endFill();
        }
        protected function getContainerCardInfo():Object{
            var _local2:CardSmeltCardItem;
            var _local1:Object = new Object();
            for each (_local2 in this.smeltCardTable) {
                _local1[_local2.cardId] = _local2.cardNum;
            };
            return (_local1);
        }
        protected function smeltBtn_clickHandler(_arg1:MouseEvent):void{
            CardSmeltMgr.getInstance().startSmelt((this.smeltIndex + 1), this.getContainerCardInfo());
        }
        protected function clearSpeedUpBtn_clickHandler(_arg1:MouseEvent):void{
            if (this.state != "work"){
                this.displayInfo();
            } else {
                CardSmeltMgr.getInstance().useSpeedUpItem((this.smeltIndex + 1));
            };
        }
        private function _CardSmelt_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            this.fadeDescEffect = _local1;
            BindingManager.executeBindings(this, "fadeDescEffect", this.fadeDescEffect);
            return (_local1);
        }
        private function _CardSmelt_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            _local1.addEventListener("effectEnd", this.__fadeInEffect_effectEnd);
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        public function __fadeInEffect_effectEnd(_arg1:EffectEvent):void{
            this.fadeInEffect_effectEndHandler(_arg1);
        }
        private function _CardSmelt_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardSmelt_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.id = "_CardSmelt_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CardSmelt_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_CardSmelt_CommonMiddleFrame1", this._CardSmelt_CommonMiddleFrame1);
            return (_local1);
        }
        private function _CardSmelt_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 11;
            _local1.y = 9;
            _local1.initialized(this, "bottomFrameImg");
            this.bottomFrameImg = _local1;
            BindingManager.executeBindings(this, "bottomFrameImg", this.bottomFrameImg);
            return (_local1);
        }
        private function _CardSmelt_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.x = 22;
            _local1.y = 24;
            _local1.width = 280;
            _local1.height = 150;
            _local1.addEventListener("dragEnter", this.__cardContainer_dragEnter);
            _local1.addEventListener("dragDrop", this.__cardContainer_dragDrop);
            _local1.addEventListener("creationComplete", this.__cardContainer_creationComplete);
            _local1.id = "cardContainer";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardContainer = _local1;
            BindingManager.executeBindings(this, "cardContainer", this.cardContainer);
            return (_local1);
        }
        public function __cardContainer_dragEnter(_arg1:DragEvent):void{
            this.cardContainer_dragEnterHandler(_arg1);
        }
        public function __cardContainer_dragDrop(_arg1:DragEvent):void{
            this.cardContainer_dragDropHandler(_arg1);
        }
        public function __cardContainer_creationComplete(_arg1:FlexEvent):void{
            this.cardContainer_creationCompleteHandler(_arg1);
        }
        private function _CardSmelt_CardSmeltCap1_i():CardSmeltCap{
            var _local1:CardSmeltCap = new CardSmeltCap();
            _local1.x = 11;
            _local1.y = 9;
            _local1.id = "cap";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cap = _local1;
            BindingManager.executeBindings(this, "cap", this.cap);
            return (_local1);
        }
        private function _CardSmelt_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 320;
            _local1.y = 15;
            _local1.width = 135;
            _local1.height = 95;
            _local1.setStyle("color", 15971955);
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "stateDesc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.stateDesc = _local1;
            BindingManager.executeBindings(this, "stateDesc", this.stateDesc);
            return (_local1);
        }
        private function _CardSmelt_CardSmeltStyleButton1_i():CardSmeltStyleButton{
            var _local1:CardSmeltStyleButton = new CardSmeltStyleButton();
            _local1.label = "清  空";
            _local1.x = 330;
            _local1.y = 107;
            _local1.addEventListener("click", this.__clearSpeedUpBtn_click);
            _local1.id = "clearSpeedUpBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.clearSpeedUpBtn = _local1;
            BindingManager.executeBindings(this, "clearSpeedUpBtn", this.clearSpeedUpBtn);
            return (_local1);
        }
        public function __clearSpeedUpBtn_click(_arg1:MouseEvent):void{
            this.clearSpeedUpBtn_clickHandler(_arg1);
        }
        private function _CardSmelt_CardSmeltStyleButton2_i():CardSmeltStyleButton{
            var _local1:CardSmeltStyleButton = new CardSmeltStyleButton();
            _local1.label = "熔  炼";
            _local1.x = 330;
            _local1.y = 146;
            _local1.addEventListener("click", this.__smeltBtn_click);
            _local1.id = "smeltBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.smeltBtn = _local1;
            BindingManager.executeBindings(this, "smeltBtn", this.smeltBtn);
            return (_local1);
        }
        public function __smeltBtn_click(_arg1:MouseEvent):void{
            this.smeltBtn_clickHandler(_arg1);
        }
        public function ___CardSmelt_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _CardSmelt_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "fadeInEffect.target");
            result[1] = new Binding(this, null, null, "fadeDescEffect.target", "stateDesc");
            result[2] = new Binding(this, null, null, "_CardSmelt_CommonMiddleFrame1.width", "width");
            result[3] = new Binding(this, null, null, "_CardSmelt_CommonMiddleFrame1.height", "height");
            return (result);
        }
        public function get bottomFrameImg():SmoothBitmapImage{
            return (this._2069887391bottomFrameImg);
        }
        public function set bottomFrameImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._2069887391bottomFrameImg;
            if (_local2 !== _arg1){
                this._2069887391bottomFrameImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottomFrameImg", _local2, _arg1));
                };
            };
        }
        public function get cap():CardSmeltCap{
            return (this._98258cap);
        }
        public function set cap(_arg1:CardSmeltCap):void{
            var _local2:Object = this._98258cap;
            if (_local2 !== _arg1){
                this._98258cap = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cap", _local2, _arg1));
                };
            };
        }
        public function get cardContainer():Group{
            return (this._1081500497cardContainer);
        }
        public function set cardContainer(_arg1:Group):void{
            var _local2:Object = this._1081500497cardContainer;
            if (_local2 !== _arg1){
                this._1081500497cardContainer = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardContainer", _local2, _arg1));
                };
            };
        }
        public function get clearSpeedUpBtn():CardSmeltStyleButton{
            return (this._147413017clearSpeedUpBtn);
        }
        public function set clearSpeedUpBtn(_arg1:CardSmeltStyleButton):void{
            var _local2:Object = this._147413017clearSpeedUpBtn;
            if (_local2 !== _arg1){
                this._147413017clearSpeedUpBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clearSpeedUpBtn", _local2, _arg1));
                };
            };
        }
        public function get fadeDescEffect():Fade{
            return (this._450919198fadeDescEffect);
        }
        public function set fadeDescEffect(_arg1:Fade):void{
            var _local2:Object = this._450919198fadeDescEffect;
            if (_local2 !== _arg1){
                this._450919198fadeDescEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeDescEffect", _local2, _arg1));
                };
            };
        }
        public function get fadeInEffect():Fade{
            return (this._1020166578fadeInEffect);
        }
        public function set fadeInEffect(_arg1:Fade):void{
            var _local2:Object = this._1020166578fadeInEffect;
            if (_local2 !== _arg1){
                this._1020166578fadeInEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeInEffect", _local2, _arg1));
                };
            };
        }
        public function get smeltBtn():CardSmeltStyleButton{
            return (this._491813559smeltBtn);
        }
        public function set smeltBtn(_arg1:CardSmeltStyleButton):void{
            var _local2:Object = this._491813559smeltBtn;
            if (_local2 !== _arg1){
                this._491813559smeltBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "smeltBtn", _local2, _arg1));
                };
            };
        }
        public function get stateDesc():RichText{
            return (this._2086369598stateDesc);
        }
        public function set stateDesc(_arg1:RichText):void{
            var _local2:Object = this._2086369598stateDesc;
            if (_local2 !== _arg1){
                this._2086369598stateDesc = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stateDesc", _local2, _arg1));
                };
            };
        }

    }
}//package card_smelt 
