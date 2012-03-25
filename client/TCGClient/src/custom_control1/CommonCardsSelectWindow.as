//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
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
    import source_manager.*;
    import spark.layouts.*;
    import spark.filters.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
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

    public class CommonCardsSelectWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CommonCardsSelectWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _CommonCardsSelectWindow_CommonOuterFrame1:CommonOuterFrame;
        private var _1781625235buttonGroup:HGroup;
        private var _1464533731descLabel:Label;
        private var _2131590956itemGroup:FakeListGroup;
        private var _231891831loadingText:Label;
        private var _273241018mainGroup:Group;
        private var _66803271scrollerCp:Scroller;
        private var __moduleFactoryInitialized:Boolean = false;
        public var dataSourceArray:Array;
        protected var _265361776cardItems:Array;
        protected var departedRangeArg:Array;
        protected var loadingHasComplete:Boolean = false;
        protected var creationHasComplete:Boolean = false;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function CommonCardsSelectWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.dataSourceArray = new Array();
            this._265361776cardItems = new Array();
            this.departedRangeArg = new Array();
            this._embed_mxml_source_commonUI____png_1538356188 = CommonCardsSelectWindow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CommonCardsSelectWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_custom_control_CommonCardsSelectWindowWatcherSetupUtil");
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
            this.height = 500;
            this.layout = this._CommonCardsSelectWindow_BasicLayout1_c();
            this.mxmlContent = [this._CommonCardsSelectWindow_CommonOuterFrame1_i(), this._CommonCardsSelectWindow_CommonMiddleFrame1_i(), this._CommonCardsSelectWindow_Rect1_c(), this._CommonCardsSelectWindow_SmoothBitmapImage1_c(), this._CommonCardsSelectWindow_Label1_c(), this._CommonCardsSelectWindow_CloseSignBtn1_c(), this._CommonCardsSelectWindow_Label2_i(), this._CommonCardsSelectWindow_Label3_i()];
            this._CommonCardsSelectWindow_Group2_i();
            this.addEventListener("creationComplete", this.___CommonCardsSelectWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CommonCardsSelectWindow._watcherSetupUtil = _arg1;
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
                this.fontSize = 14;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_creationCompleteHandler():void{
            if (JudgeCardsSourceMgr.getInstance().loadingComplete){
                this.loadingCompleteHandler(null);
                return;
            };
            JudgeCardsSourceMgr.getInstance().addEventListener(ProgressEvent.PROGRESS, this.loadingProgressHandler);
            JudgeCardsSourceMgr.getInstance().addEventListener(Event.COMPLETE, this.loadingCompleteHandler);
            JudgeCardsSourceMgr.getInstance().loadSwfFile();
        }
        protected function loadingProgressHandler(_arg1:ProgressEvent):void{
            var _local2 = (int(((_arg1.bytesLoaded / _arg1.bytesTotal) * 100)) + "%");
            if (this.loadingText.text != _local2){
                this.loadingText.text = _local2;
            };
        }
        protected function loadingCompleteHandler(_arg1:Event=null):void{
            JudgeCardsSourceMgr.getInstance().removeEventListener(ProgressEvent.PROGRESS, this.loadingProgressHandler);
            JudgeCardsSourceMgr.getInstance().removeEventListener(Event.COMPLETE, this.loadingCompleteHandler);
            removeElement(this.loadingText);
            addElement(this.mainGroup);
            this.loadingHasComplete = true;
            this.showCards();
        }
        protected function itemGroup_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.showCards();
        }
        protected function getTargetCards():Object{
            return (new Object());
        }
        protected function showCards():void{
            var _local2:String;
            var _local3:int;
            var _local4:CommonCardsSelectWindowItem;
            if (((!(this.loadingHasComplete)) || (!(this.creationHasComplete)))){
                return;
            };
            var _local1:Object = this.getTargetCards();
            for (_local2 in _local1) {
                this.dataSourceArray.push(this.buildCardInfo(_local2, _local1[_local2]));
            };
            _local3 = 0;
            while (_local3 < this.dataSourceArray.length) {
                _local4 = new CommonCardsSelectWindowItem();
                this.cardItems.push(_local4);
                _local4.y = (_local3 * _local4.height);
                _local4.addEventListener(MouseEvent.CLICK, this.itemClickHandler);
                _local3++;
            };
            this.rangeCards("type", false, false);
            this.rangeCards("color_range_index");
            this.itemGroup.resetDisplayItem();
        }
        protected function itemClickHandler(_arg1:MouseEvent):void{
            var _local2:CommonCardsSelectWindowItem = (_arg1.currentTarget as CommonCardsSelectWindowItem);
            this.doClickFunc(_local2.itemSource.id, _local2.itemSource.num);
        }
        protected function doClickFunc(_arg1, _arg2):void{
        }
        public function buildCardInfo(_arg1:String, _arg2:int):Object{
            var _local3:Object = {
                id:_arg1,
                num:_arg2
            };
            CardsInfo.addAttribById(_local3);
            return (_local3);
        }
        protected function setAllItemsSource():void{
            var _local1:int;
            while (_local1 < this.cardItems.length) {
                (this.cardItems[_local1] as CommonCardsSelectWindowItem).itemSource = this.dataSourceArray[_local1];
                _local1++;
            };
        }
        protected function rangeCards(_arg1:String, _arg2:Boolean=true, _arg3:Boolean=true):void{
            var _local7:Array;
            var _local8:Array;
            var _local4:uint = (_arg2) ? Array.NUMERIC : 0;
            var _local5:Boolean = ((this.departedRangeArg.length > 0)) ? !(this.departedRangeArg[(this.departedRangeArg.length - 1)].isCend) : false;
            if (!_local5){
                _local4 = (_local4 | Array.DESCENDING);
            };
            var _local6:int;
            while (_local6 < this.departedRangeArg.length) {
                if (this.departedRangeArg[_local6]["field"] == _arg1){
                    this.departedRangeArg.splice(_local6, 1);
                    break;
                };
                _local6++;
            };
            this.departedRangeArg.push({
                field:_arg1,
                option:_local4,
                isCend:_local5
            });
            if (_arg3){
                _local7 = new Array();
                _local8 = new Array();
                _local6 = (this.departedRangeArg.length - 1);
                while (_local6 >= 0) {
                    _local7.push(this.departedRangeArg[_local6]["field"]);
                    _local8.push(this.departedRangeArg[_local6]["option"]);
                    _local6--;
                };
                this.dataSourceArray.sortOn(_local7, _local8);
                this.setAllItemsSource();
            };
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function commonouterframe1_mouseDownHandler():void{
        }
        protected function commonouterframe1_mouseUpHandler():void{
        }
        private function _CommonCardsSelectWindow_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.mxmlContent = [this._CommonCardsSelectWindow_HGroup1_i(), this._CommonCardsSelectWindow_Scroller1_i()];
            _local1.id = "mainGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.mainGroup = _local1;
            BindingManager.executeBindings(this, "mainGroup", this.mainGroup);
            return (_local1);
        }
        private function _CommonCardsSelectWindow_HGroup1_i():HGroup{
            var _local1:HGroup;
            _local1 = new HGroup();
            _local1.buttonMode = true;
            _local1.x = 18;
            _local1.y = 85;
            _local1.gap = 0;
            _local1.height = 21;
            _local1.mxmlContent = [this._CommonCardsSelectWindow_Button1_c(), this._CommonCardsSelectWindow_Button2_c(), this._CommonCardsSelectWindow_Button3_c(), this._CommonCardsSelectWindow_Button4_c(), this._CommonCardsSelectWindow_Button5_c(), this._CommonCardsSelectWindow_Button6_c(), this._CommonCardsSelectWindow_Button7_c()];
            _local1.id = "buttonGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.buttonGroup = _local1;
            BindingManager.executeBindings(this, "buttonGroup", this.buttonGroup);
            return (_local1);
        }
        private function _CommonCardsSelectWindow_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.label = "卡片名称";
            _local1.width = 180;
            _local1.percentHeight = 100;
            _local1.setStyle("skinClass", dataGridTitleButtonSkin);
            _local1.addEventListener("click", this.___CommonCardsSelectWindow_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CommonCardsSelectWindow_Button1_click(_arg1:MouseEvent):void{
            this.rangeCards("name", false);
        }
        private function _CommonCardsSelectWindow_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.label = "势";
            _local1.width = 46;
            _local1.percentHeight = 100;
            _local1.setStyle("skinClass", dataGridTitleButtonSkin);
            _local1.addEventListener("click", this.___CommonCardsSelectWindow_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CommonCardsSelectWindow_Button2_click(_arg1:MouseEvent):void{
            this.rangeCards("country", false);
        }
        private function _CommonCardsSelectWindow_Button3_c():Button{
            var _local1:Button = new Button();
            _local1.label = "类";
            _local1.width = 46;
            _local1.percentHeight = 100;
            _local1.setStyle("skinClass", dataGridTitleButtonSkin);
            _local1.addEventListener("click", this.___CommonCardsSelectWindow_Button3_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CommonCardsSelectWindow_Button3_click(_arg1:MouseEvent):void{
            this.rangeCards("type", false, false);
            this.rangeCards("color_range_index");
        }
        private function _CommonCardsSelectWindow_Button4_c():Button{
            var _local1:Button = new Button();
            _local1.label = "武";
            _local1.width = 46;
            _local1.percentHeight = 100;
            _local1.setStyle("skinClass", dataGridTitleButtonSkin);
            _local1.addEventListener("click", this.___CommonCardsSelectWindow_Button4_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CommonCardsSelectWindow_Button4_click(_arg1:MouseEvent):void{
            this.rangeCards("str");
        }
        private function _CommonCardsSelectWindow_Button5_c():Button{
            var _local1:Button = new Button();
            _local1.label = "智";
            _local1.width = 46;
            _local1.percentHeight = 100;
            _local1.setStyle("skinClass", dataGridTitleButtonSkin);
            _local1.addEventListener("click", this.___CommonCardsSelectWindow_Button5_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CommonCardsSelectWindow_Button5_click(_arg1:MouseEvent):void{
            this.rangeCards("int");
        }
        private function _CommonCardsSelectWindow_Button6_c():Button{
            var _local1:Button = new Button();
            _local1.label = "星";
            _local1.width = 46;
            _local1.percentHeight = 100;
            _local1.setStyle("skinClass", dataGridTitleButtonSkin);
            _local1.addEventListener("click", this.___CommonCardsSelectWindow_Button6_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CommonCardsSelectWindow_Button6_click(_arg1:MouseEvent):void{
            this.rangeCards("star");
        }
        private function _CommonCardsSelectWindow_Button7_c():Button{
            var _local1:Button = new Button();
            _local1.label = "数量";
            _local1.width = 46;
            _local1.percentHeight = 100;
            _local1.setStyle("skinClass", dataGridTitleButtonSkin);
            _local1.addEventListener("click", this.___CommonCardsSelectWindow_Button7_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CommonCardsSelectWindow_Button7_click(_arg1:MouseEvent):void{
            this.rangeCards("num");
        }
        private function _CommonCardsSelectWindow_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 18;
            _local1.y = 109;
            _local1.width = 476;
            _local1.height = 371;
            _local1.viewport = this._CommonCardsSelectWindow_FakeListGroup1_i();
            _local1.setStyle("horizontalScrollPolicy", "off");
            _local1.setStyle("verticalScrollPolicy", "on");
            _local1.id = "scrollerCp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scrollerCp = _local1;
            BindingManager.executeBindings(this, "scrollerCp", this.scrollerCp);
            return (_local1);
        }
        private function _CommonCardsSelectWindow_FakeListGroup1_i():FakeListGroup{
            var _local1:FakeListGroup = new FakeListGroup();
            _local1.width = 456;
            _local1.height = 371;
            _local1.itemHeight = 62;
            _local1.addEventListener("creationComplete", this.__itemGroup_creationComplete);
            _local1.id = "itemGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup = _local1;
            BindingManager.executeBindings(this, "itemGroup", this.itemGroup);
            return (_local1);
        }
        public function __itemGroup_creationComplete(_arg1:FlexEvent):void{
            this.itemGroup_creationCompleteHandler(_arg1);
        }
        private function _CommonCardsSelectWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonCardsSelectWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.alpha = 0.9;
            _local1.mouseEnabled = true;
            _local1.filters = [this._CommonCardsSelectWindow_DropShadowFilter1_c()];
            _local1.addEventListener("mouseDown", this.___CommonCardsSelectWindow_CommonOuterFrame1_mouseDown);
            _local1.addEventListener("mouseUp", this.___CommonCardsSelectWindow_CommonOuterFrame1_mouseUp);
            _local1.id = "_CommonCardsSelectWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CommonCardsSelectWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_CommonCardsSelectWindow_CommonOuterFrame1", this._CommonCardsSelectWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _CommonCardsSelectWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CommonCardsSelectWindow_CommonOuterFrame1_mouseDown(_arg1:MouseEvent):void{
            this.commonouterframe1_mouseDownHandler();
        }
        public function ___CommonCardsSelectWindow_CommonOuterFrame1_mouseUp(_arg1:MouseEvent):void{
            this.commonouterframe1_mouseUpHandler();
        }
        private function _CommonCardsSelectWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 9;
            _local1.y = 72;
            _local1.alpha = 0.85;
            _local1.id = "_CommonCardsSelectWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CommonCardsSelectWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_CommonCardsSelectWindow_CommonMiddleFrame1", this._CommonCardsSelectWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _CommonCardsSelectWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 15;
            _local1.y = 80;
            _local1.alpha = 0.4;
            _local1.width = 485;
            _local1.height = 405;
            _local1.radiusX = 3;
            _local1.radiusY = 3;
            _local1.fill = this._CommonCardsSelectWindow_SolidColor1_c();
            _local1.stroke = this._CommonCardsSelectWindow_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonCardsSelectWindow_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonCardsSelectWindow_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 13156254;
            _local1.weight = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonCardsSelectWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 17;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonCardsSelectWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 31;
            _local1.y = 13;
            _local1.text = "卡片列表";
            _local1.mouseEnabled = false;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonCardsSelectWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 4;
            _local1.top = 4;
            _local1.addEventListener("click", this.___CommonCardsSelectWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CommonCardsSelectWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        private function _CommonCardsSelectWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 29;
            _local1.y = 45;
            _local1.mouseEnabled = false;
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 15126902);
            _local1.id = "descLabel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.descLabel = _local1;
            BindingManager.executeBindings(this, "descLabel", this.descLabel);
            return (_local1);
        }
        private function _CommonCardsSelectWindow_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.verticalCenter = 0;
            _local1.horizontalCenter = 0;
            _local1.setStyle("color", 15126902);
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 50);
            _local1.id = "loadingText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.loadingText = _local1;
            BindingManager.executeBindings(this, "loadingText", this.loadingText);
            return (_local1);
        }
        public function ___CommonCardsSelectWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        private function _CommonCardsSelectWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Array{
                var _local1:* = cardItems;
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "itemGroup.itemsArray");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [515, 500];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_CommonCardsSelectWindow_CommonOuterFrame1.size");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [497, 419];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_CommonCardsSelectWindow_CommonMiddleFrame1.size");
            return (result);
        }
        public function get buttonGroup():HGroup{
            return (this._1781625235buttonGroup);
        }
        public function set buttonGroup(_arg1:HGroup):void{
            var _local2:Object = this._1781625235buttonGroup;
            if (_local2 !== _arg1){
                this._1781625235buttonGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buttonGroup", _local2, _arg1));
                };
            };
        }
        public function get descLabel():Label{
            return (this._1464533731descLabel);
        }
        public function set descLabel(_arg1:Label):void{
            var _local2:Object = this._1464533731descLabel;
            if (_local2 !== _arg1){
                this._1464533731descLabel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descLabel", _local2, _arg1));
                };
            };
        }
        public function get itemGroup():FakeListGroup{
            return (this._2131590956itemGroup);
        }
        public function set itemGroup(_arg1:FakeListGroup):void{
            var _local2:Object = this._2131590956itemGroup;
            if (_local2 !== _arg1){
                this._2131590956itemGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup", _local2, _arg1));
                };
            };
        }
        public function get loadingText():Label{
            return (this._231891831loadingText);
        }
        public function set loadingText(_arg1:Label):void{
            var _local2:Object = this._231891831loadingText;
            if (_local2 !== _arg1){
                this._231891831loadingText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loadingText", _local2, _arg1));
                };
            };
        }
        public function get mainGroup():Group{
            return (this._273241018mainGroup);
        }
        public function set mainGroup(_arg1:Group):void{
            var _local2:Object = this._273241018mainGroup;
            if (_local2 !== _arg1){
                this._273241018mainGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainGroup", _local2, _arg1));
                };
            };
        }
        public function get scrollerCp():Scroller{
            return (this._66803271scrollerCp);
        }
        public function set scrollerCp(_arg1:Scroller):void{
            var _local2:Object = this._66803271scrollerCp;
            if (_local2 !== _arg1){
                this._66803271scrollerCp = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scrollerCp", _local2, _arg1));
                };
            };
        }
        protected function get cardItems():Array{
            return (this._265361776cardItems);
        }
        protected function set cardItems(_arg1:Array):void{
            var _local2:Object = this._265361776cardItems;
            if (_local2 !== _arg1){
                this._265361776cardItems = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardItems", _local2, _arg1));
                };
            };
        }

    }
}//package custom_control 
