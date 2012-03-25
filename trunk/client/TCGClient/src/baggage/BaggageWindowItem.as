//Created by Action Script Viewer - http://www.buraks.com/asv
package baggage {
    import __AS3__.vec.*;
    
    import auction_system.*;
    
    import combat_element_script.*;
    
    import custom_control1.*;
    
    import flash.accessibility.*;
    import flash.debugger.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;
    
    import item_system.*;
    
    import mx.binding.*;
    import mx.core.*;
//    import mx.effects.*;
	import mx.effects.Parallel;
    import mx.events.*;
    import mx.filters.*;
    import mx.managers.*;
    import mx.styles.*;
    
    import shop_system.*;
    
    import spark.components.*;
    import spark.effects.*;
    import spark.effects.animation.*;
    import spark.filters.*;
    import spark.layouts.*;
    
    import tool.*;
    
    import trade_system.*;
    
    import ui_element.*;

	
    public class BaggageWindowItem extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _BaggageWindowItem_Label1:Label;
        private var _207684226glowEffect:Parallel;
        private var _2116183984itemImg:MyImage;
        private var _1267520715removeEffect:Parallel;
        private var _788485687rollOverFilter:GlowFilter;
        private var _836075691useBtn:BlueSmallButton;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1382868981itemImgPath:String;
        private var _2116189043itemNum:String;
        private var _itemLogicInfo;
        public var itemInfo:Object;
        public var pos:int;
        private var _embed_mxml_source_commonUI______png_1985530244:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function BaggageWindowItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI______png_1985530244 = BaggageWindowItem__embed_mxml_source_commonUI______png_1985530244;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._BaggageWindowItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_baggage_BaggageWindowItemWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (BaggageWindowItem[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 56;
            this.height = 56;
            this.layout = this._BaggageWindowItem_BasicLayout1_c();
            this.mxmlContent = [this._BaggageWindowItem_SmoothBitmapImage1_c(), this._BaggageWindowItem_MyImage1_i(), this._BaggageWindowItem_Label1_i(), this._BaggageWindowItem_BlueSmallButton1_i()];
            this._BaggageWindowItem_Parallel1_i();
            this._BaggageWindowItem_Parallel2_i();
            this._BaggageWindowItem_GlowFilter1_i();
            this.addEventListener("rollOver", this.___BaggageWindowItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___BaggageWindowItem_Group1_rollOut);
            this.addEventListener("creationComplete", this.___BaggageWindowItem_Group1_creationComplete);
            this.addEventListener("dragEnter", this.___BaggageWindowItem_Group1_dragEnter);
            this.addEventListener("dragDrop", this.___BaggageWindowItem_Group1_dragDrop);
            this.addEventListener("mouseDown", this.___BaggageWindowItem_Group1_mouseDown);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            BaggageWindowItem._watcherSetupUtil = _arg1;
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
        public function set itemLogicInfo(_arg1):void{
            this.removeEffect.stop();
            this._itemLogicInfo = _arg1;
            if (this._itemLogicInfo){
                this.itemNum = this._itemLogicInfo.num.toString();
                this.itemInfo = ItemCardLib.getItemInfoById(this._itemLogicInfo.id);
                this.itemImgPath = (("source/cardImages/" + this.itemInfo.image) + ".jpg");
                callLater(this.createTooltip);
                this.playGlowEffect();
            } else {
                this.reset();
            };
        }
        public function get itemLogicInfo():Object{
            return (this._itemLogicInfo);
        }
        public function refreshNum(_arg1:int):void{
            this._itemLogicInfo.num = _arg1;
            if (this._itemLogicInfo.num > 0){
                this.playGlowEffect();
                this.itemNum = this._itemLogicInfo.num.toString();
            } else {
                if (!this.removeEffect.isPlaying){
                    this.removeEffect.play();
                };
            };
        }
        protected function reset():void{
            this.itemNum = null;
            this._itemLogicInfo = null;
            this.itemImgPath = null;
            this.itemInfo = null;
            this.filters = [];
            this.useBtn.visible = false;
            callLater(this.deleteTooltip);
        }
        protected function group1_creationCompleteHandler():void{
            new MyDragManager(this.itemImg, this.dragStartHandler);
        }
        protected function itemImg_clickHandler(_arg1:MouseEvent):void{
            if (!this._itemLogicInfo){
                return;
            };
            TradeMgr.getInstance().showGoodsNumAddWindow(this._itemLogicInfo);
            AuctionMgr.getInstance().showGoodsNumAddWindow(this._itemLogicInfo);
        }
        protected function dragStartHandler(_arg1:MouseEvent):void{
            var dragImg:* = null;
            var itemLogicInfoSave:* = undefined;
            var dragCompleteHandler:* = null;
            var event:* = _arg1;
            dragCompleteHandler = function (_arg1:DragEvent):void{
                removeEventListener(DragEvent.DRAG_COMPLETE, dragCompleteHandler);
                if (DragManager.getFeedback() != DragManager.MOVE){
                    BaggageMgr.getInstance().setItem(pos, itemLogicInfoSave);
                };
            };
            if (!this._itemLogicInfo){
                return;
            };
            dragImg = new MyImage();
            dragImg.width = 50;
            dragImg.height = 50;
            var d:* = new DropShadowFilter();
            d.angle = 45;
            d.distance = 20;
            d.alpha = 0.6;
            dragImg.filters = [d];
            dragImg.source = this.itemImgPath;
            var ds:* = new DragSource();
            ds.addData({
                pos:this.pos,
                itemLogicInfo:this._itemLogicInfo
            }, "source");
            DragManager.doDrag(this, ds, event, dragImg, 0, 0, 1);
            itemLogicInfoSave = this._itemLogicInfo;
            this.itemLogicInfo = null;
            addEventListener(DragEvent.DRAG_COMPLETE, dragCompleteHandler);
        }
        protected function group1_dragEnterHandler(_arg1:DragEvent):void{
            if ((((_arg1.dragInitiator is BaggageWindowItem)) || ((_arg1.dragInitiator is ShopCard)))){
                DragManager.acceptDragDrop(this);
            };
        }
        protected function group1_dragDropHandler(_arg1:DragEvent):void{
            var cardInfo:* = null;
            var shopCardInfo:* = null;
            var arr:* = null;
            var event:* = _arg1;
            if ((event.dragInitiator is BaggageWindowItem)){
                cardInfo = (event.dragSource.dataForFormat("source") as Object);
                BaggageMgr.getInstance().putItemToNewPos(cardInfo.pos, this.pos);
            } else {
                if ((event.dragInitiator is ShopCard)){
                    shopCardInfo = (event.dragSource.dataForFormat("source") as Object);
                    arr = LuaAgent.getInstance().run((("return u.item_mgr:check_buy_goods({ [" + shopCardInfo.id) + "] = 1 })"));
                    if (arr[1]){
                        var confirmFunc:* = function (_arg1:Array):Boolean{
                            if (_arg1[0]){
                                LuaAgent.getInstance().run((("return u.item_mgr:buy_goods({ [" + shopCardInfo.id) + "] = 1 })"));
                                if (ShopMainWindow.getInstance()){
                                    ShopMainWindow.getInstance().disableCardUserCanNotBuy();
                                    ShopMainWindow.getInstance().cardInfoWindow.refreshDisplayInfo();
                                };
                            };
                            return (true);
                        };
                        MessageBox.showMessageBox(MessageBox.SELECT, "提示", (((((("您确认要购买【" + shopCardInfo.name) + "】?\n需花费 ") + arr[2]) + " 积分，") + arr[3]) + " 金币。"), confirmFunc);
                    } else {
                        if (arr[2] == "score"){
                            MessageBox.showMessageBox(MessageBox.NOTICE, "提示", (((("您的积分不足！\n需要 " + arr[3]) + " 积分。\n您当前的积分为 ") + UserObject.remainScore) + "。"));
                        } else {
                            if (arr[2] == "money"){
                                MessageBox.showMessageBox(MessageBox.NOTICE, "提示", (((("您的金币不足！\n需要 " + arr[3]) + " 金币。\n您当前的金币为 ") + UserObject.money) + "。"));
                            } else {
                                if (arr[2] == "full"){
                                    MessageBox.showMessageBox(MessageBox.NOTICE, "提示", "您的包裹空间不足！");
                                };
                            };
                        };
                    };
                };
            };
        }
        protected function playGlowEffect():void{
            if (!this.glowEffect.isPlaying){
                this.glowEffect.play();
            };
        }
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            if (this._itemLogicInfo){
                this.filters = [this.rollOverFilter];
                this.useBtn.visible = true;
            };
        }
        protected function group1_rollOutHandler(_arg1:MouseEvent):void{
            this.filters = [];
            this.useBtn.visible = false;
        }
        protected function clickUseBtn():void{
            BaggageMgr.getInstance().useItem(this);
        }
        private function createTooltip():void{
            toolTip = ItemMgr.getInstance().getItemTooltip(this.itemInfo);
        }
        private function deleteTooltip():void{
            toolTip = null;
        }
        protected function group1_mouseDownHandler(_arg1:MouseEvent):void{
            var _local2:*;
            if (!this._itemLogicInfo){
                _local2 = CommonUtil.getAncestorByClass(this, BaggageWindow);
                if (_local2){
                    (_local2 as BaggageWindow).startDrag();
                };
            };
        }
        private function _BaggageWindowItem_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.children = [this._BaggageWindowItem_Fade1_c(), this._BaggageWindowItem_AnimateFilter1_c()];
            this.glowEffect = _local1;
            BindingManager.executeBindings(this, "glowEffect", this.glowEffect);
            return (_local1);
        }
        private function _BaggageWindowItem_Fade1_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 500;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_AnimateFilter1_c():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 1000;
            _local1.bitmapFilter = this._BaggageWindowItem_GlowFilter2_c();
            new Vector.<MotionPath>(3)[0] = this._BaggageWindowItem_SimpleMotionPath1_c();
            new Vector.<MotionPath>(3)[1] = this._BaggageWindowItem_SimpleMotionPath2_c();
            new Vector.<MotionPath>(3)[2] = this._BaggageWindowItem_SimpleMotionPath3_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF7200;
            _local1.inner = true;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 0.8;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_SimpleMotionPath2_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_SimpleMotionPath3_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_Parallel2_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.children = [this._BaggageWindowItem_Fade2_c(), this._BaggageWindowItem_AnimateFilter2_c()];
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        private function _BaggageWindowItem_Fade2_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            _local1.duration = 500;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_AnimateFilter2_c():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 500;
            _local1.bitmapFilter = this._BaggageWindowItem_GlowFilter3_c();
            new Vector.<MotionPath>(3)[0] = this._BaggageWindowItem_SimpleMotionPath4_c();
            new Vector.<MotionPath>(3)[1] = this._BaggageWindowItem_SimpleMotionPath5_c();
            new Vector.<MotionPath>(3)[2] = this._BaggageWindowItem_SimpleMotionPath6_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_GlowFilter3_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF00F0;
            _local1.inner = true;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_SimpleMotionPath4_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 0.8;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_SimpleMotionPath5_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_SimpleMotionPath6_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            this.reset();
        }
        private function _BaggageWindowItem_GlowFilter1_i():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF7200;
            _local1.inner = true;
            _local1.strength = 1;
            _local1.alpha = 0.5;
            _local1.blurX = 20;
            _local1.blurY = 20;
            this.rollOverFilter = _local1;
            BindingManager.executeBindings(this, "rollOverFilter", this.rollOverFilter);
            return (_local1);
        }
        private function _BaggageWindowItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI______png_1985530244;
            _local1.alpha = 0.7;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 3;
            _local1.y = 3;
            _local1.width = 50;
            _local1.height = 50;
            _local1.addEventListener("click", this.__itemImg_click);
            _local1.id = "itemImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemImg = _local1;
            BindingManager.executeBindings(this, "itemImg", this.itemImg);
            return (_local1);
        }
        public function __itemImg_click(_arg1:MouseEvent):void{
            this.itemImg_clickHandler(_arg1);
        }
        private function _BaggageWindowItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.top = 5;
            _local1.right = 4;
            _local1.mouseEnabled = false;
            _local1.filters = [this._BaggageWindowItem_GlowFilter4_c(), this._BaggageWindowItem_DropShadowFilter1_c()];
            _local1.setStyle("color", 0xE4FF00);
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 18);
            _local1.id = "_BaggageWindowItem_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._BaggageWindowItem_Label1 = _local1;
            BindingManager.executeBindings(this, "_BaggageWindowItem_Label1", this._BaggageWindowItem_Label1);
            return (_local1);
        }
        private function _BaggageWindowItem_GlowFilter4_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xB400FF;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowItem_BlueSmallButton1_i():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.visible = false;
            _local1.right = 0;
            _local1.bottom = 0;
            _local1.label = "使用";
            _local1.addEventListener("click", this.__useBtn_click);
            _local1.id = "useBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.useBtn = _local1;
            BindingManager.executeBindings(this, "useBtn", this.useBtn);
            return (_local1);
        }
        public function __useBtn_click(_arg1:MouseEvent):void{
            this.clickUseBtn();
        }
        public function ___BaggageWindowItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        public function ___BaggageWindowItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.group1_rollOutHandler(_arg1);
        }
        public function ___BaggageWindowItem_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        public function ___BaggageWindowItem_Group1_dragEnter(_arg1:DragEvent):void{
            this.group1_dragEnterHandler(_arg1);
        }
        public function ___BaggageWindowItem_Group1_dragDrop(_arg1:DragEvent):void{
            this.group1_dragDropHandler(_arg1);
        }
        public function ___BaggageWindowItem_Group1_mouseDown(_arg1:MouseEvent):void{
            this.group1_mouseDownHandler(_arg1);
        }
        private function _BaggageWindowItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, null, "glowEffect.target", "itemImg");
            result[1] = new Binding(this, null, null, "removeEffect.target", "itemImg");
            result[2] = new Binding(this, function ():Object{
                return (itemImgPath);
            }, null, "itemImg.source");
            result[3] = new Binding(this, function ():String{
                var _local1:* = ("×" + itemNum);
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_BaggageWindowItem_Label1.text");
            result[4] = new Binding(this, function ():Boolean{
                return (!((itemNum == null)));
            }, null, "_BaggageWindowItem_Label1.visible");
            return (result);
        }
        public function get glowEffect():Parallel{
            return (this._207684226glowEffect);
        }
        public function set glowEffect(_arg1:Parallel):void{
            var _local2:Object = this._207684226glowEffect;
            if (_local2 !== _arg1){
                this._207684226glowEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowEffect", _local2, _arg1));
                };
            };
        }
        public function get itemImg():MyImage{
            return (this._2116183984itemImg);
        }
        public function set itemImg(_arg1:MyImage):void{
            var _local2:Object = this._2116183984itemImg;
            if (_local2 !== _arg1){
                this._2116183984itemImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemImg", _local2, _arg1));
                };
            };
        }
        public function get removeEffect():Parallel{
            return (this._1267520715removeEffect);
        }
        public function set removeEffect(_arg1:Parallel):void{
            var _local2:Object = this._1267520715removeEffect;
            if (_local2 !== _arg1){
                this._1267520715removeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeEffect", _local2, _arg1));
                };
            };
        }
        public function get rollOverFilter():GlowFilter{
            return (this._788485687rollOverFilter);
        }
        public function set rollOverFilter(_arg1:GlowFilter):void{
            var _local2:Object = this._788485687rollOverFilter;
            if (_local2 !== _arg1){
                this._788485687rollOverFilter = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rollOverFilter", _local2, _arg1));
                };
            };
        }
        public function get useBtn():BlueSmallButton{
            return (this._836075691useBtn);
        }
        public function set useBtn(_arg1:BlueSmallButton):void{
            var _local2:Object = this._836075691useBtn;
            if (_local2 !== _arg1){
                this._836075691useBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useBtn", _local2, _arg1));
                };
            };
        }
        private function get itemImgPath():String{
            return (this._1382868981itemImgPath);
        }
        private function set itemImgPath(_arg1:String):void{
            var _local2:Object = this._1382868981itemImgPath;
            if (_local2 !== _arg1){
                this._1382868981itemImgPath = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemImgPath", _local2, _arg1));
                };
            };
        }
        private function get itemNum():String{
            return (this._2116189043itemNum);
        }
        private function set itemNum(_arg1:String):void{
            var _local2:Object = this._2116189043itemNum;
            if (_local2 !== _arg1){
                this._2116189043itemNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemNum", _local2, _arg1));
                };
            };
        }

    }
}//package baggage 
