//Created by Action Script Viewer - http://www.buraks.com/asv
package card_smelt {
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
    import source_manager.*;
    import spark.layouts.*;
    import spark.filters.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
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

    public class SmeltsWindow extends Group implements IBindingClient {

        private static const SMELT_ITEM_DISTANCE:Number = 196;

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _2131590956itemGroup:SmeltsGroup;
        private var _243485622noSmeltNotice:Label;
        private var _2135756891titleText:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _179968147smeltItems:Array;
        private var _embed_mxml_source_buttonImages_________png_1182990640:Class;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function SmeltsWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._179968147smeltItems = new Array();
            this._embed_mxml_source_buttonImages_________png_1182990640 = SmeltsWindow__embed_mxml_source_buttonImages_________png_1182990640;
            this._embed_mxml_source_commonUI____png_1538356188 = SmeltsWindow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._SmeltsWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_card_smelt_SmeltsWindowWatcherSetupUtil");
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
            this.width = 515;
            this.height = 712;
            this.layout = this._SmeltsWindow_BasicLayout1_c();
            this.mxmlContent = [this._SmeltsWindow_CommonOuterFrame1_c(), this._SmeltsWindow_CommonMiddleFrame1_c(), this._SmeltsWindow_SmoothBitmapImage1_c(), this._SmeltsWindow_SmoothBitmapImage2_i(), this._SmeltsWindow_Rect1_c(), this._SmeltsWindow_ClickScaleButton1_c(), this._SmeltsWindow_ClickScaleButton2_c(), this._SmeltsWindow_Scroller1_c(), this._SmeltsWindow_Label1_i()];
            this.addEventListener("creationComplete", this.___SmeltsWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            SmeltsWindow._watcherSetupUtil = _arg1;
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
            this.titleText.source = JudgeCardsSourceMgr.getInstance().getSourceClass("cardSmeltTitle");
        }
        public function addSmelt(_arg1:Object):void{
            this.createNewSmelt(_arg1);
            this.itemGroup.resetDisplayItem();
        }
        public function refreshSmelt(_arg1:int, _arg2:Object):void{
            if (this.smeltItems[(_arg1 - 1)]){
                (this.smeltItems[(_arg1 - 1)] as CardSmelt).setSmeltInfo(_arg2, (_arg1 - 1));
            };
        }
        public function setAllSmeltInfo(_arg1:Object):void{
            var _local4:Object;
            var _local2:Object = _arg1.smelts;
            var _local3 = 1;
            while ((_local4 = _local2[_local3.toString()])) {
                _local3++;
                this.createNewSmelt(_local4);
            };
            this.noSmeltNotice.visible = (this.smeltItems.length == 0);
            this.itemGroup.resetDisplayItem();
        }
        protected function createNewSmelt(_arg1:Object):void{
            var _local2:CardSmelt;
            _local2 = new CardSmelt();
            _local2.y = (this.smeltItems.length * SMELT_ITEM_DISTANCE);
            _local2.setSmeltInfo(_arg1, this.smeltItems.length);
            this.smeltItems.push(_local2);
        }
        private function _SmeltsWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SmeltsWindow_CommonOuterFrame1_c():CommonOuterFrame{
            var _local1:CommonOuterFrame;
            _local1 = new CommonOuterFrame();
            _local1.width = 515;
            _local1.height = 712;
            _local1.filters = [this._SmeltsWindow_DropShadowFilter1_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SmeltsWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.color = 0;
            _local1.distance = 7;
            _local1.alpha = 0.65;
            _local1.quality = 4;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SmeltsWindow_CommonMiddleFrame1_c():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 9;
            _local1.y = 48;
            _local1.width = 497;
            _local1.height = 654;
            _local1.alpha = 0.7;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SmeltsWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 21;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SmeltsWindow_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 29;
            _local1.y = 11;
            _local1.initialized(this, "titleText");
            this.titleText = _local1;
            BindingManager.executeBindings(this, "titleText", this.titleText);
            return (_local1);
        }
        private function _SmeltsWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 14;
            _local1.y = 52;
            _local1.width = 487;
            _local1.height = 646;
            _local1.alpha = 0.4;
            _local1.radiusX = 2;
            _local1.radiusY = 2;
            _local1.fill = this._SmeltsWindow_SolidColor1_c();
            _local1.stroke = this._SmeltsWindow_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SmeltsWindow_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SmeltsWindow_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 13156254;
            _local1.weight = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SmeltsWindow_ClickScaleButton1_c():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.x = 156;
            _local1.y = 82;
            _local1.rotation = -90;
            _local1.buttonImage = this._embed_mxml_source_buttonImages_________png_1182990640;
            _local1.addEventListener("click", this.___SmeltsWindow_ClickScaleButton1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___SmeltsWindow_ClickScaleButton1_click(_arg1:MouseEvent):void{
            this.itemGroup.verticalScrollPosition = (this.itemGroup.verticalScrollPosition - SMELT_ITEM_DISTANCE);
        }
        private function _SmeltsWindow_ClickScaleButton2_c():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.x = 368;
            _local1.y = 669;
            _local1.rotation = 90;
            _local1.buttonImage = this._embed_mxml_source_buttonImages_________png_1182990640;
            _local1.addEventListener("click", this.___SmeltsWindow_ClickScaleButton2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___SmeltsWindow_ClickScaleButton2_click(_arg1:MouseEvent):void{
            this.itemGroup.verticalScrollPosition = (this.itemGroup.verticalScrollPosition + SMELT_ITEM_DISTANCE);
        }
        private function _SmeltsWindow_Scroller1_c():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 20;
            _local1.y = 84;
            _local1.width = 475;
            _local1.height = 590;
            _local1.viewport = this._SmeltsWindow_SmeltsGroup1_i();
            _local1.setStyle("horizontalScrollPolicy", "off");
            _local1.setStyle("verticalScrollPolicy", "on");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SmeltsWindow_SmeltsGroup1_i():SmeltsGroup{
            var _local1:SmeltsGroup = new SmeltsGroup();
            _local1.width = 475;
            _local1.height = 590;
            _local1.id = "itemGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup = _local1;
            BindingManager.executeBindings(this, "itemGroup", this.itemGroup);
            return (_local1);
        }
        private function _SmeltsWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 158;
            _local1.y = 400;
            _local1.visible = false;
            _local1.text = "您尚未拥有炼卡炉";
            _local1.setStyle("fontSize", 25);
            _local1.setStyle("color", 15971955);
            _local1.id = "noSmeltNotice";
            if (!_local1.document){
                _local1.document = this;
            };
            this.noSmeltNotice = _local1;
            BindingManager.executeBindings(this, "noSmeltNotice", this.noSmeltNotice);
            return (_local1);
        }
        public function ___SmeltsWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _SmeltsWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (SMELT_ITEM_DISTANCE);
            }, null, "itemGroup.itemHeight");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = smeltItems;
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "itemGroup.itemsArray");
            return (result);
        }
        public function get itemGroup():SmeltsGroup{
            return (this._2131590956itemGroup);
        }
        public function set itemGroup(_arg1:SmeltsGroup):void{
            var _local2:Object = this._2131590956itemGroup;
            if (_local2 !== _arg1){
                this._2131590956itemGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup", _local2, _arg1));
                };
            };
        }
        public function get noSmeltNotice():Label{
            return (this._243485622noSmeltNotice);
        }
        public function set noSmeltNotice(_arg1:Label):void{
            var _local2:Object = this._243485622noSmeltNotice;
            if (_local2 !== _arg1){
                this._243485622noSmeltNotice = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noSmeltNotice", _local2, _arg1));
                };
            };
        }
        public function get titleText():SmoothBitmapImage{
            return (this._2135756891titleText);
        }
        public function set titleText(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._2135756891titleText;
            if (_local2 !== _arg1){
                this._2135756891titleText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleText", _local2, _arg1));
                };
            };
        }
        private function get smeltItems():Array{
            return (this._179968147smeltItems);
        }
        private function set smeltItems(_arg1:Array):void{
            var _local2:Object = this._179968147smeltItems;
            if (_local2 !== _arg1){
                this._179968147smeltItems = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "smeltItems", _local2, _arg1));
                };
            };
        }

    }
}//package card_smelt 
