//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
    import spark.filters.*;
    import card_ui.*;
    import custom_effect.*;
    import flash.utils.*;
    import combat_element_script.*;
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

    public class CombatStageCardInfoWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CombatStageCardInfoWindow_CommonOuterFrame1:CommonOuterFrame;
        private var _265574357cardImage:CardImage;
        private var _1017317214descText:RichText;
        private var __moduleFactoryInitialized:Boolean = false;
        private var moveEffect:MoveEffect;
        private var targetCardImg:CardImage;
        private var isWindowShow:Boolean = false;
        private var showTimer:Timer;
        private var hideTimer:Timer;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CombatStageCardInfoWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.moveEffect = new MoveEffect(this);
            this.showTimer = new Timer(250);
            this.hideTimer = new Timer(250);
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CombatStageCardInfoWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_CombatStageCardInfoWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (CombatStageCardInfoWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 230;
            this.height = 412;
            this.x = -230;
            this.y = 150;
            this.layout = this._CombatStageCardInfoWindow_BasicLayout1_c();
            this.mxmlContent = [this._CombatStageCardInfoWindow_CommonOuterFrame1_i(), this._CombatStageCardInfoWindow_CardImage1_i(), this._CombatStageCardInfoWindow_RichText1_i()];
            this.addEventListener("creationComplete", this.___CombatStageCardInfoWindow_Group1_creationComplete);
            this.addEventListener("rollOver", this.___CombatStageCardInfoWindow_Group1_rollOver);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CombatStageCardInfoWindow._watcherSetupUtil = _arg1;
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
        public function reset():void{
            this.setHideTimerDelay();
            this.moveWindowIn();
        }
        private function creationCompleteHandler():void{
            this.showTimer.addEventListener(TimerEvent.TIMER, this.moveWindowOut);
            this.hideTimer.addEventListener(TimerEvent.TIMER, this.moveWindowIn);
        }
        public function setHideTimerDelay(_arg1:Number=250):void{
            this.hideTimer.delay = _arg1;
        }
        public function setCardInfo(_arg1:CardImage):void{
            this.targetCardImg = _arg1;
            if (this.isWindowShow){
                this.moveWindowOut();
            } else {
                this.hideTimer.stop();
                this.showTimer.stop();
                this.showTimer.start();
            };
        }
        private function _setCardInfo():Boolean{
            var _local1:String;
            if (((((((!(this.cardImage)) || (!(this.targetCardImg)))) || ((this.targetCardImg.cardId == "0")))) || (!(this.targetCardImg.creationHasComplete)))){
                return (false);
            };
            this.cardImage.setCardById(this.targetCardImg.cardId);
            if (this.targetCardImg.markWindow != null){
                this.cardImage.setMarkType(this.targetCardImg.markType);
                this.cardImage.setMark(this.targetCardImg.markWindow.toNum);
            } else {
                this.cardImage.removeMark();
            };
            this.cardImage.removeAllBuff();
            if (this.targetCardImg.buffWindow != null){
                this.cardImage.addBuff(this.targetCardImg.buffWindow.getAllBuffText());
            };
            switch (this.cardImage.cardInfo["color"]){
                case "silver":
                    _local1 = this.cardImage.cardInfo["info"];
                    break;
                case "gold":
                case "green":
                case "red":
                default:
                    _local1 = this.cardImage.cardInfo["skill_info"];
                    switch (this.cardImage.cardInfo["misc"]){
                        case "changbing":
                            _local1 = ("【长兵】" + _local1);
                            break;
                        case "duanbing":
                            _local1 = ("【短兵】" + _local1);
                            break;
                        case "zuoji":
                            _local1 = ("【坐骑】" + _local1);
                            break;
                    };
                    _local1 = (("#y" + _local1) + "#r");
            };
            this.descText.textFlow = StringUtils.createTFByHtmlText(_local1);
            return (true);
        }
        public function mouseOverCard(_arg1:GameCard):void{
            if ((((_arg1.cardInfo.camp == "enemy")) && (!(_arg1.cardInfo.isPositive)))){
                return;
            };
            this.setCardInfo(_arg1.cardImage);
        }
        public function mouseOutCard():void{
            this.showTimer.stop();
            this.hideTimer.start();
        }
        private function moveWindowOut(_arg1:TimerEvent=null):void{
            var _local2:Number;
            this.showTimer.stop();
            this.hideTimer.stop();
            if (this._setCardInfo()){
                this.moveEffect.yTo = y;
                _local2 = -25;
                if (((((this.moveEffect.isPlaying) && ((this.moveEffect.xTo == _local2)))) || (((!(this.moveEffect.isPlaying)) && ((x == _local2)))))){
                    return;
                };
                mouseEnabled = true;
                this.isWindowShow = true;
                this.moveEffect.xTo = _local2;
                this.moveEffect.duration = ((Math.abs((x - _local2)) * 300) / 230);
                this.moveEffect.play();
            };
        }
        private function moveWindowIn(_arg1:TimerEvent=null):void{
            var _local2:Number;
            this.targetCardImg = null;
            this.showTimer.stop();
            this.hideTimer.stop();
            this.moveEffect.yTo = y;
            _local2 = -230;
            if (((((this.moveEffect.isPlaying) && ((this.moveEffect.xTo == _local2)))) || (((!(this.moveEffect.isPlaying)) && ((x == _local2)))))){
                return;
            };
            mouseEnabled = false;
            this.isWindowShow = false;
            this.moveEffect.xTo = _local2;
            this.moveEffect.duration = ((Math.abs((x - _local2)) * 300) / 230);
            this.moveEffect.play();
        }
        private function _CombatStageCardInfoWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatStageCardInfoWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.alpha = 0.6;
            _local1.id = "_CombatStageCardInfoWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CombatStageCardInfoWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_CombatStageCardInfoWindow_CommonOuterFrame1", this._CombatStageCardInfoWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _CombatStageCardInfoWindow_CardImage1_i():CardImage{
            var _local1:CardImage = new CardImage();
            _local1.scaleX = 1.8;
            _local1.scaleY = 1.8;
            _local1.x = 49;
            _local1.y = 15;
            _local1.filters = [this._CombatStageCardInfoWindow_DropShadowFilter1_c()];
            _local1.id = "cardImage";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardImage = _local1;
            BindingManager.executeBindings(this, "cardImage", this.cardImage);
            return (_local1);
        }
        private function _CombatStageCardInfoWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.angle = 40;
            _local1.distance = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatStageCardInfoWindow_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 51;
            _local1.y = 230;
            _local1.width = 160;
            _local1.height = 172;
            _local1.setStyle("fontSize", 15);
            _local1.setStyle("color", 0xFFFFFF);
            _local1.id = "descText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.descText = _local1;
            BindingManager.executeBindings(this, "descText", this.descText);
            return (_local1);
        }
        public function ___CombatStageCardInfoWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.creationCompleteHandler();
        }
        public function ___CombatStageCardInfoWindow_Group1_rollOver(_arg1:MouseEvent):void{
            this.moveWindowIn();
        }
        private function _CombatStageCardInfoWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_CARD_INFO_WINDOW);
            }, null, "this.depth");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [230, 395];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_CombatStageCardInfoWindow_CommonOuterFrame1.size");
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
        public function get descText():RichText{
            return (this._1017317214descText);
        }
        public function set descText(_arg1:RichText):void{
            var _local2:Object = this._1017317214descText;
            if (_local2 !== _arg1){
                this._1017317214descText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descText", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
