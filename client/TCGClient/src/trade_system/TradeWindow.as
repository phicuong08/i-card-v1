//Created by Action Script Viewer - http://www.buraks.com/asv
package trade_system {
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
    import spark.effects.*;
    import spark.filters.*;
    import custom_effect.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import baggage.*;
    import skins.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class TradeWindow extends AutoDepthGroup implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _TradeWindow_CommonOuterFrame1:CommonOuterFrame;
        private var _413245038addEffect:Fade;
        private var _1079065019meArea:TradeWindowUserArea;
        private var _486049214targetArea:TradeWindowUserArea;
        private var __moduleFactoryInitialized:Boolean = false;
        private var addCardWindow:TradeAddCardWindow;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function TradeWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._TradeWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_trade_system_TradeWindowWatcherSetupUtil");
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
            this.width = 460;
            this.height = 500;
            this.mouseChildren = false;
            this.mxmlContent = [this._TradeWindow_CommonOuterFrame1_i(), this._TradeWindow_TradeWindowUserArea1_i(), this._TradeWindow_TradeWindowUserArea2_i(), this._TradeWindow_CloseSignBtn1_c(), this._TradeWindow_Button1_c(), this._TradeWindow_Button2_c(), this._TradeWindow_Button3_c()];
            this._TradeWindow_Fade1_i();
            this.addEventListener("remove", this.___TradeWindow_AutoDepthGroup1_remove);
            this.addEventListener("dragEnter", this.___TradeWindow_AutoDepthGroup1_dragEnter);
            this.addEventListener("dragDrop", this.___TradeWindow_AutoDepthGroup1_dragDrop);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            TradeWindow._watcherSetupUtil = _arg1;
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
        public function setUsersInfo(_arg1:Object, _arg2:Object):void{
            this.targetArea.setUserInfo(_arg1);
            this.meArea.setUserInfo(_arg2);
        }
        public function setTradeMoney(_arg1:int, _arg2:int):void{
            this.targetArea.setTradeMoney(_arg1);
            this.meArea.setTradeMoney(_arg2);
        }
        public function setTradeGoods(_arg1:Object, _arg2:Object):void{
            this.targetArea.setTradeGoods(_arg1);
            this.meArea.setTradeGoods(_arg2);
        }
        public function setTradeState(_arg1:Boolean, _arg2:Boolean):void{
            this.targetArea.setTradeState(_arg1);
            this.meArea.setTradeState(_arg2);
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function cancelDeal():void{
            TradeMgr.getInstance().tryCancelDeal();
        }
        protected function group1_dragEnterHandler(_arg1:DragEvent):void{
            var _local2:Object;
            var _local3:Object;
            if ((_arg1.dragInitiator is BaggageWindowItem)){
                _local2 = (_arg1.dragSource.dataForFormat("source") as Object);
                _local3 = _local2.itemLogicInfo;
                if (TradeMgr.getInstance().checkTradeGood(_local3.id, _local3.num)[1]){
                    DragManager.acceptDragDrop(this);
                };
            };
        }
        protected function group1_dragDropHandler(_arg1:DragEvent):void{
            var _local2:Object = (_arg1.dragSource.dataForFormat("source") as Object);
            var _local3:Object = _local2.itemLogicInfo;
            DragManager.showFeedback(DragManager.COPY);
            TradeMgr.getInstance().showGoodsNumAddWindow(_local3);
        }
        protected function button1_clickHandler(_arg1:MouseEvent):void{
            if (!this.addCardWindow){
                this.addCardWindow = new TradeAddCardWindow();
                this.addCardWindow.x = width;
            };
            if (!this.addCardWindow.parent){
                addElement(this.addCardWindow);
            };
        }
        protected function group1_removeHandler(_arg1:FlexEvent):void{
            var _local2:FakeFadeEffect = new FakeFadeEffect(this, 500, 1, 0);
            _local2.effectContainer.depth = depth;
            _local2.play();
        }
        private function _TradeWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 500;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            mouseChildren = true;
        }
        private function _TradeWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame;
            _local1 = new CommonOuterFrame();
            _local1.alpha = 0.9;
            _local1.mouseEnabled = true;
            _local1.filters = [this._TradeWindow_DropShadowFilter1_c()];
            _local1.addEventListener("mouseDown", this.___TradeWindow_CommonOuterFrame1_mouseDown);
            _local1.addEventListener("mouseUp", this.___TradeWindow_CommonOuterFrame1_mouseUp);
            _local1.id = "_TradeWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TradeWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_TradeWindow_CommonOuterFrame1", this._TradeWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _TradeWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TradeWindow_CommonOuterFrame1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
        }
        public function ___TradeWindow_CommonOuterFrame1_mouseUp(_arg1:MouseEvent):void{
            this.stopDrag();
        }
        private function _TradeWindow_TradeWindowUserArea1_i():TradeWindowUserArea{
            var _local1:TradeWindowUserArea = new TradeWindowUserArea();
            _local1.id = "targetArea";
            if (!_local1.document){
                _local1.document = this;
            };
            this.targetArea = _local1;
            BindingManager.executeBindings(this, "targetArea", this.targetArea);
            return (_local1);
        }
        private function _TradeWindow_TradeWindowUserArea2_i():TradeWindowUserArea{
            var _local1:TradeWindowUserArea;
            _local1 = new TradeWindowUserArea();
            _local1.x = 230;
            _local1.isUserMode = true;
            _local1.id = "meArea";
            if (!_local1.document){
                _local1.document = this;
            };
            this.meArea = _local1;
            BindingManager.executeBindings(this, "meArea", this.meArea);
            return (_local1);
        }
        private function _TradeWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 4;
            _local1.top = 4;
            _local1.addEventListener("click", this.___TradeWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TradeWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.cancelDeal();
        }
        private function _TradeWindow_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.right = 20;
            _local1.y = 65;
            _local1.label = "添加卡片";
            _local1.width = 105;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___TradeWindow_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TradeWindow_Button1_click(_arg1:MouseEvent):void{
            this.button1_clickHandler(_arg1);
        }
        private function _TradeWindow_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.label = "确认交易";
            _local1.right = 125;
            _local1.bottom = 10;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___TradeWindow_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TradeWindow_Button2_click(_arg1:MouseEvent):void{
            TradeMgr.getInstance().tryConfirmDeal();
        }
        private function _TradeWindow_Button3_c():Button{
            var _local1:Button = new Button();
            _local1.label = "取消交易";
            _local1.right = 20;
            _local1.bottom = 10;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___TradeWindow_Button3_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TradeWindow_Button3_click(_arg1:MouseEvent):void{
            this.cancelDeal();
        }
        public function ___TradeWindow_AutoDepthGroup1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        public function ___TradeWindow_AutoDepthGroup1_dragEnter(_arg1:DragEvent):void{
            this.group1_dragEnterHandler(_arg1);
        }
        public function ___TradeWindow_AutoDepthGroup1_dragDrop(_arg1:DragEvent):void{
            this.group1_dragDropHandler(_arg1);
        }
        private function _TradeWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [460, 500];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_TradeWindow_CommonOuterFrame1.size");
            return (result);
        }
        public function get addEffect():Fade{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Fade):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get meArea():TradeWindowUserArea{
            return (this._1079065019meArea);
        }
        public function set meArea(_arg1:TradeWindowUserArea):void{
            var _local2:Object = this._1079065019meArea;
            if (_local2 !== _arg1){
                this._1079065019meArea = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "meArea", _local2, _arg1));
                };
            };
        }
        public function get targetArea():TradeWindowUserArea{
            return (this._486049214targetArea);
        }
        public function set targetArea(_arg1:TradeWindowUserArea):void{
            var _local2:Object = this._486049214targetArea;
            if (_local2 !== _arg1){
                this._486049214targetArea = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetArea", _local2, _arg1));
                };
            };
        }

    }
}//package trade_system 
