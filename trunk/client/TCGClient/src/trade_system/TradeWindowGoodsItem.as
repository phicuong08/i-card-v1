//Created by Action Script Viewer - http://www.buraks.com/asv
package trade_system {
    import __AS3__.vec.*;
    
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
    
    import flashx.textLayout.elements.*;
    
    import item_system.*;
    
    import mx.binding.*;
    import mx.core.*;
//    import mx.effects.*;
	import mx.effects.Parallel;
    import mx.events.*;
    import mx.filters.*;
    import mx.styles.*;
    
    import spark.components.*;
    import spark.effects.*;
    import spark.effects.animation.*;
    import spark.filters.*;
    import spark.layouts.*;
    
    import tool.*;
    
    import ui_element.*;
	use namespace mx_internal;
    public class TradeWindowGoodsItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _TradeWindowGoodsItem_Label1:Label;
        public var _TradeWindowGoodsItem_RichText1:RichText;
        private var _207684226glowEffect:Parallel;
        private var _2116183984itemImg:MyImage;
        private var __moduleFactoryInitialized:Boolean = false;
        public var isUserMode:Boolean = false;
        private var _1382868981itemImgPath:String;
        private var _2116189043itemNum:String;
        private var _1693082196descTextFlow:TextFlow;
        private var itemInfo:Object;
        public var isEmpty:Boolean = true;
        private var _embed_mxml_source_commonUI______png_1985530244:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function TradeWindowGoodsItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI______png_1985530244 = TradeWindowGoodsItem__embed_mxml_source_commonUI______png_1985530244;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._TradeWindowGoodsItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_trade_system_TradeWindowGoodsItemWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (TradeWindowGoodsItem[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 170;
            this.height = 56;
            this.layout = this._TradeWindowGoodsItem_BasicLayout1_c();
            this.mxmlContent = [this._TradeWindowGoodsItem_SmoothBitmapImage1_c(), this._TradeWindowGoodsItem_MyImage1_i(), this._TradeWindowGoodsItem_Label1_i(), this._TradeWindowGoodsItem_ItemBlackBackground1_c(), this._TradeWindowGoodsItem_RichText1_i()];
            this._TradeWindowGoodsItem_Parallel1_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            TradeWindowGoodsItem._watcherSetupUtil = _arg1;
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
        public function setGoodsInfo(_arg1:String, _arg2:int):void{
            if (((!(this.itemInfo)) || (!((this.itemInfo.num == _arg2))))){
                this.playGlowEffect();
            };
            this.isEmpty = false;
            var _local3:Object = ItemCardLib.getItemInfoById(_arg1);
            this.itemImgPath = (("source/cardImages/" + _local3.image) + ".jpg");
            this.itemNum = _arg2.toString();
            this.setDetailInfo(_arg1);
            this.itemInfo = {
                id:_arg1,
                num:_arg2
            };
        }
        protected function playGlowEffect():void{
            if (!this.glowEffect.isPlaying){
                this.glowEffect.play();
            };
        }
        protected function setDetailInfo(_arg1:String):void{
            var _local2:Object = ItemCardLib.getItemInfoById(_arg1);
            if (_local2.isCard){
                toolTip = CardsInfo.getCardTooltip(_local2);
            } else {
                toolTip = ItemMgr.getInstance().getItemTooltip(_local2);
            };
            this.descTextFlow = StringUtils.createTFByHtmlText(((ItemCardLib.getItemFullName(_local2.id) + "<br>") + ItemCardLib.getItemTypeText(_arg1, true)));
        }
        public function clearItem():void{
            this.isEmpty = true;
            this.itemImgPath = null;
            this.itemNum = null;
            toolTip = null;
            this.descTextFlow = null;
            this.itemInfo = null;
        }
        private function _TradeWindowGoodsItem_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.children = [this._TradeWindowGoodsItem_Fade1_c(), this._TradeWindowGoodsItem_AnimateFilter1_c()];
            this.glowEffect = _local1;
            BindingManager.executeBindings(this, "glowEffect", this.glowEffect);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_Fade1_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 500;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_AnimateFilter1_c():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 1000;
            _local1.bitmapFilter = this._TradeWindowGoodsItem_GlowFilter1_c();
            new Vector.<MotionPath>(3)[0] = this._TradeWindowGoodsItem_SimpleMotionPath1_c();
            new Vector.<MotionPath>(3)[1] = this._TradeWindowGoodsItem_SimpleMotionPath2_c();
            new Vector.<MotionPath>(3)[2] = this._TradeWindowGoodsItem_SimpleMotionPath3_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF7200;
            _local1.inner = true;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 0.8;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_SimpleMotionPath2_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_SimpleMotionPath3_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI______png_1985530244;
            _local1.alpha = 0.5;
            _local1.x = 2;
            _local1.y = 0;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 5;
            _local1.y = 3;
            _local1.width = 50;
            _local1.height = 50;
            _local1.id = "itemImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemImg = _local1;
            BindingManager.executeBindings(this, "itemImg", this.itemImg);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.right = 119;
            _local1.y = 5;
            _local1.mouseEnabled = false;
            _local1.filters = [this._TradeWindowGoodsItem_GlowFilter2_c(), this._TradeWindowGoodsItem_DropShadowFilter1_c()];
            _local1.setStyle("color", 0xE4FF00);
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 18);
            _local1.id = "_TradeWindowGoodsItem_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TradeWindowGoodsItem_Label1 = _local1;
            BindingManager.executeBindings(this, "_TradeWindowGoodsItem_Label1", this._TradeWindowGoodsItem_Label1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xB400FF;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_ItemBlackBackground1_c():ItemBlackBackground{
            var _local1:ItemBlackBackground = new ItemBlackBackground();
            _local1.x = 59;
            _local1.y = 0;
            _local1.height = 56;
            _local1.width = 110;
            _local1.alpha = 0.5;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 59;
            _local1.y = 0;
            _local1.height = 56;
            _local1.width = 110;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("color", 15126902);
            _local1.setStyle("fontSize", 14);
            _local1.id = "_TradeWindowGoodsItem_RichText1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TradeWindowGoodsItem_RichText1 = _local1;
            BindingManager.executeBindings(this, "_TradeWindowGoodsItem_RichText1", this._TradeWindowGoodsItem_RichText1);
            return (_local1);
        }
        private function _TradeWindowGoodsItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, null, "glowEffect.target", "itemImg");
            result[1] = new Binding(this, function ():Object{
                return (itemImgPath);
            }, null, "itemImg.source");
            result[2] = new Binding(this, function ():String{
                var _local1:* = ("×" + itemNum);
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_TradeWindowGoodsItem_Label1.text");
            result[3] = new Binding(this, function ():Boolean{
                return (!((itemNum == null)));
            }, null, "_TradeWindowGoodsItem_Label1.visible");
            result[4] = new Binding(this, function ():TextFlow{
                return (descTextFlow);
            }, null, "_TradeWindowGoodsItem_RichText1.textFlow");
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
        private function get descTextFlow():TextFlow{
            return (this._1693082196descTextFlow);
        }
        private function set descTextFlow(_arg1:TextFlow):void{
            var _local2:Object = this._1693082196descTextFlow;
            if (_local2 !== _arg1){
                this._1693082196descTextFlow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descTextFlow", _local2, _arg1));
                };
            };
        }

    }
}//package trade_system 
