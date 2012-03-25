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
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.filters.*;
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

    public class CardSmeltCardItem extends CardImage implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1020166578fadeInEffect:Fade;
        private var _2000932397numText:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var numLabel:Label;
        private var moveEffect:MoveEffect;
        private var surroundElf:SurroundElfEffect;
        private var _1382824681_cardNum:Number = 1;
        public var isHarvestCard:Boolean = false;
        public var belongSmelt:CardSmelt;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardSmeltCardItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardSmeltCardItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_card_smelt_CardSmeltCardItemWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (CardSmeltCardItem[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.scaleX = 1.3;
            this.scaleY = 1.3;
            this._CardSmeltCardItem_Fade1_i();
            this._CardSmeltCardItem_Label1_i();
            this.addEventListener("creationComplete", this.___CardSmeltCardItem_CardImage1_creationComplete);
            this.addEventListener("addedToStage", this.___CardSmeltCardItem_CardImage1_addedToStage);
            this.addEventListener("rollOver", this.___CardSmeltCardItem_CardImage1_rollOver);
            this.addEventListener("rollOut", this.___CardSmeltCardItem_CardImage1_rollOut);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardSmeltCardItem._watcherSetupUtil = _arg1;
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
        public function set cardNum(_arg1:Number):void{
            this._cardNum = _arg1;
        }
        public function get cardNum():Number{
            return (this._cardNum);
        }
        public function changeXPos(_arg1:Number):void{
            if (!this.moveEffect){
                this.moveEffect = new MoveEffect(this, 300);
            };
            this.moveEffect.xTo = _arg1;
            this.moveEffect.play();
        }
        protected function cardimage1_creationCompleteHandler(_arg1:FlexEvent):void{
            addElement(this.numText);
            new MyDragManager(this, this.dragStartHandler);
        }
        protected function dragStartHandler(_arg1:MouseEvent):void{
            var _local2:CardImage = new CardImage();
            _local2.setCardById(cardId);
            var _local3:DropShadowFilter = new DropShadowFilter();
            _local3.angle = 40;
            _local3.distance = 40;
            _local3.alpha = 0.6;
            _local2.filters = [_local3];
            var _local4:DragSource = new DragSource();
            _local4.addData({
                id:cardId,
                num:this.cardNum
            }, "source");
            DragManager.doDrag(this, _local4, _arg1, _local2, 0, 0, 0.8);
        }
        protected function startRoundElfEffect():void{
            if (!this.surroundElf){
                this.surroundElf = new SurroundElfEffect(this, 4, 0xCDEB00, 0xFFFFFF, 6);
            };
            this.surroundElf.play();
        }
        protected function stopRoundElfEffect():void{
            if (this.surroundElf){
                this.surroundElf.stop();
            };
        }
        protected function cardimage1_addedToStageHandler(_arg1:Event):void{
            if (this.isHarvestCard){
                this.startRoundElfEffect();
            } else {
                this.stopRoundElfEffect();
            };
        }
        protected function cardimage1_rollOverHandler(_arg1:MouseEvent):void{
            if (this.isHarvestCard){
                CardSmeltMgr.getInstance().setDisplayCardId(cardId);
            };
        }
        protected function cardimage1_rollOutHandler(_arg1:MouseEvent):void{
            if (this.isHarvestCard){
                CardSmeltMgr.getInstance().setDisplayCardId(null);
            };
        }
        override protected function createCardInfo():void{
            super.createCardInfo();
            if (cardId != "0"){
                toolTip = CardsInfo.getCardTooltip(cardId);
            };
        }
        private function _CardSmeltCardItem_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        private function _CardSmeltCardItem_Label1_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.top = 15;
            _local1.right = 5;
            _local1.mouseEnabled = false;
            _local1.filters = [this._CardSmeltCardItem_GlowFilter1_c(), this._CardSmeltCardItem_DropShadowFilter1_c()];
            _local1.setStyle("color", 0xE4FF00);
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 18);
            _local1.id = "numText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.numText = _local1;
            BindingManager.executeBindings(this, "numText", this.numText);
            return (_local1);
        }
        private function _CardSmeltCardItem_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xB400FF;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardSmeltCardItem_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardSmeltCardItem_CardImage1_creationComplete(_arg1:FlexEvent):void{
            this.cardimage1_creationCompleteHandler(_arg1);
        }
        public function ___CardSmeltCardItem_CardImage1_addedToStage(_arg1:Event):void{
            this.cardimage1_addedToStageHandler(_arg1);
        }
        public function ___CardSmeltCardItem_CardImage1_rollOver(_arg1:MouseEvent):void{
            this.cardimage1_rollOverHandler(_arg1);
        }
        public function ___CardSmeltCardItem_CardImage1_rollOut(_arg1:MouseEvent):void{
            this.cardimage1_rollOutHandler(_arg1);
        }
        private function _CardSmeltCardItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeInEffect");
            result[1] = new Binding(this, function ():String{
                var _local1:* = ("×" + _cardNum);
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "numText.text");
            return (result);
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
        public function get numText():Label{
            return (this._2000932397numText);
        }
        public function set numText(_arg1:Label):void{
            var _local2:Object = this._2000932397numText;
            if (_local2 !== _arg1){
                this._2000932397numText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numText", _local2, _arg1));
                };
            };
        }
        private function get _cardNum():Number{
            return (this._1382824681_cardNum);
        }
        private function set _cardNum(_arg1:Number):void{
            var _local2:Object = this._1382824681_cardNum;
            if (_local2 !== _arg1){
                this._1382824681_cardNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_cardNum", _local2, _arg1));
                };
            };
        }

    }
}//package card_smelt 
