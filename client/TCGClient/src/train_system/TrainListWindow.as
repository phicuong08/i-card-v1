//Created by Action Script Viewer - http://www.buraks.com/asv
package train_system {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import normal_window.*;
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import custom_effect.*;
    import mx.collections.*;
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

    public class TrainListWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _TrainListWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _TrainListWindow_CommonMiddleFrame2:CommonMiddleFrame;
        public var _TrainListWindow_CommonOuterFrame1:CommonOuterFrame;
        public var _TrainListWindow_CommonOuterFrame2:CommonOuterFrame;
        private var _304919812cardGroups:ComboBox;
        private var _1282133823fadeIn:Fade;
        private var _1316769434startBtn:UniversalImageButton;
        private var _1608366781trainTabWindow:CommonTabWindow;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1059420975userCardGroups:ArrayCollection;
        private var trainListWindowCurtainOne:TrainListWindowCurtainOne;
        private var trainListWindowCurtainTwo:TrainListWindowCurtainTwo;
        private var currentDisplayCurtain:TrainListWindowCurtainBase;
        private var _embed_mxml_source_buttonImages______png_1610395248:Class;
        private var _embed_mxml_source_buttonImages____png_1993273380:Class;
        private var _embed_mxml_source_commonUI____png_1542558160:Class;
        private var _embed_mxml_source_buttonImages_________png_1182990640:Class;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function TrainListWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._1059420975userCardGroups = new ArrayCollection();
            this.trainListWindowCurtainOne = new TrainListWindowCurtainOne();
            this.trainListWindowCurtainTwo = new TrainListWindowCurtainTwo();
            this._embed_mxml_source_buttonImages______png_1610395248 = TrainListWindow__embed_mxml_source_buttonImages______png_1610395248;
            this._embed_mxml_source_buttonImages____png_1993273380 = TrainListWindow__embed_mxml_source_buttonImages____png_1993273380;
            this._embed_mxml_source_commonUI____png_1542558160 = TrainListWindow__embed_mxml_source_commonUI____png_1542558160;
            this._embed_mxml_source_buttonImages_________png_1182990640 = TrainListWindow__embed_mxml_source_buttonImages_________png_1182990640;
            this._embed_mxml_source_commonUI____png_1538356188 = TrainListWindow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._TrainListWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_train_system_TrainListWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (TrainListWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.layout = this._TrainListWindow_BasicLayout1_c();
            this.mxmlContent = [this._TrainListWindow_CommonOuterFrame1_i(), this._TrainListWindow_CommonMiddleFrame1_i(), this._TrainListWindow_SmoothBitmapImage1_c(), this._TrainListWindow_Label1_c(), this._TrainListWindow_CommonTabWindow1_i(), this._TrainListWindow_Group2_c(), this._TrainListWindow_ClickScaleButton1_c(), this._TrainListWindow_ClickScaleButton2_c(), this._TrainListWindow_Label2_c(), this._TrainListWindow_ComboBox1_i(), this._TrainListWindow_SmoothBitmapImage2_c(), this._TrainListWindow_SmoothBitmapImage3_c(), this._TrainListWindow_SmoothBitmapImage4_c(), this._TrainListWindow_SmoothBitmapImage5_c(), this._TrainListWindow_UniversalImageButton1_i(), this._TrainListWindow_UniversalImageButton2_c()];
            this._TrainListWindow_Fade1_i();
            this.addEventListener("initialize", this.___TrainListWindow_Group1_initialize);
            this.addEventListener("remove", this.___TrainListWindow_Group1_remove);
            this.addEventListener("creationComplete", this.___TrainListWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            TrainListWindow._watcherSetupUtil = _arg1;
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
            this.trainListWindowCurtainOne.addEventListener(MouseEvent.DOUBLE_CLICK, this.doubleClickHandler);
            this.trainListWindowCurtainTwo.addEventListener(MouseEvent.DOUBLE_CLICK, this.doubleClickHandler);
            this.addCurtain(this.trainListWindowCurtainOne);
        }
        protected function doubleClickHandler(_arg1:MouseEvent):void{
            this.startTrain();
        }
        protected function fadeIn_effectEndHandler():void{
            BasicOperationBar.getInstance().registerLeaveFunc(this.leaveFunc);
            mouseChildren = true;
            this.setPlayerCardGroups(UserObject.groupCardsInfo);
        }
        protected function group1_removeHandler():void{
            var _local1:FakeFadeEffect = new FakeFadeEffect(this, 500, 1, 0);
            _local1.play();
            mouseChildren = false;
            alpha = 0;
        }
        private function setPlayerCardGroups(_arg1:Object):void{
            var _local3:String;
            this.userCardGroups.removeAll();
            var _local2:int;
            for (_local3 in _arg1) {
                this.userCardGroups.addItem({label:_local3});
                if (UserObject.selectCardGroup == _local3){
                    _local2 = (this.userCardGroups.length - 1);
                };
            };
            this.cardGroups.selectedIndex = _local2;
        }
        private function getTrainSection():int{
            return ((TrainListWindowItem.currentSelectItem) ? TrainListWindowItem.currentSelectItem.trainSection : 0);
        }
        private function startTrain():void{
            if (this.getTrainSection() == 0){
                MessageBox.showMessageBox(MessageBox.NOTICE, "提示", "请先选择一项训练！");
            } else {
                if (((this.cardGroups.selectedItem) && (this.userCardGroups.contains(this.cardGroups.selectedItem)))){
                    var doTrain:* = function ():void{
                        var _local1:Array = TrainSystem.getInstance().trainBegin(getTrainSection(), cardGroups.selectedItem.label);
                        if ((((_local1.length > 2)) && (!(_local1[1])))){
                            MessageBox.showMessageBox(MessageBox.NOTICE, "提醒：", _local1[2]);
                        } else {
                            mouseChildren = false;
                        };
                    };
                    doTrain();
                } else {
                    MessageBox.showMessageBox(MessageBox.NOTICE, "提醒：", "请选择正确的卡组！");
                };
            };
        }
        protected function cardGroups_removedFromStageHandler(_arg1:Event):void{
            var name:* = null;
            var event:* = _arg1;
            if (((this.cardGroups.selectedItem) && (this.userCardGroups.contains(this.cardGroups.selectedItem)))){
                var setSelectCardGroup:* = function ():void{
                    UserObject.selectCardGroup = name;
                };
                name = this.cardGroups.selectedItem.label;
                callLater(setSelectCardGroup);
            };
        }
        private function leaveFunc():void{
            BasicOperationBar.getInstance().clearLeaveFunc(this.leaveFunc);
            if (!parent){
                return;
            };
            TCGClient.getInstance().enterMainMenu();
        }
        protected function enterJudgeCardWindow(_arg1:MouseEvent):void{
            BasicOperationBar.getInstance().clearLeaveFunc(this.leaveFunc);
            TCGClient.getInstance().enterJudgeCardsWindow("trainList");
        }
        protected function showCurtainByTabWindow():void{
            this.clearSelectItem();
            switch (this.trainTabWindow.selectItemText){
                case "第一幕":
                    this.addCurtain(this.trainListWindowCurtainOne);
                    break;
                default:
                    this.addCurtain(this.trainListWindowCurtainTwo);
            };
        }
        protected function clearSelectItem():void{
            TrainListWindowItem.changeSelectItem(null);
        }
        protected function addCurtain(_arg1:TrainListWindowCurtainBase):void{
            if (_arg1 == this.currentDisplayCurtain){
                return;
            };
            if (this.currentDisplayCurtain){
                this.currentDisplayCurtain.removeSelf();
            };
            this.currentDisplayCurtain = _arg1;
            addElement(this.currentDisplayCurtain);
        }
        private function _TrainListWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.startDelay = 500;
            _local1.duration = 500;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectEnd", this.__fadeIn_effectEnd);
            this.fadeIn = _local1;
            BindingManager.executeBindings(this, "fadeIn", this.fadeIn);
            return (_local1);
        }
        public function __fadeIn_effectEnd(_arg1:EffectEvent):void{
            this.fadeIn_effectEndHandler();
        }
        private function _TrainListWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame;
            _local1 = new CommonOuterFrame();
            _local1.x = 84;
            _local1.y = 61;
            _local1.id = "_TrainListWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TrainListWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_TrainListWindow_CommonOuterFrame1", this._TrainListWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _TrainListWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 96;
            _local1.y = 134;
            _local1.alpha = 0.85;
            _local1.id = "_TrainListWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TrainListWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_TrainListWindow_CommonMiddleFrame1", this._TrainListWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _TrainListWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 76;
            _local1.y = 82;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 107;
            _local1.y = 76;
            _local1.text = "训练列表";
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindow_CommonTabWindow1_i():CommonTabWindow{
            var _local1:CommonTabWindow;
            _local1 = new CommonTabWindow();
            _local1.x = 96;
            _local1.y = 108;
            _local1.addEventListener("select_item_changed", this.__trainTabWindow_select_item_changed);
            _local1.id = "trainTabWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.trainTabWindow = _local1;
            BindingManager.executeBindings(this, "trainTabWindow", this.trainTabWindow);
            return (_local1);
        }
        public function __trainTabWindow_select_item_changed(_arg1:Event):void{
            this.showCurtainByTabWindow();
        }
        private function _TrainListWindow_Group2_c():Group{
            var _local1:Group = new Group();
            _local1.x = 316;
            _local1.y = 590;
            _local1.width = 410;
            _local1.height = 49;
            _local1.clipAndEnableScrolling = true;
            _local1.mxmlContent = [this._TrainListWindow_CommonOuterFrame2_i(), this._TrainListWindow_CommonMiddleFrame2_i()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindow_CommonOuterFrame2_i():CommonOuterFrame{
            var _local1:CommonOuterFrame;
            _local1 = new CommonOuterFrame();
            _local1.y = -40;
            _local1.alpha = 0.7;
            _local1.id = "_TrainListWindow_CommonOuterFrame2";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TrainListWindow_CommonOuterFrame2 = _local1;
            BindingManager.executeBindings(this, "_TrainListWindow_CommonOuterFrame2", this._TrainListWindow_CommonOuterFrame2);
            return (_local1);
        }
        private function _TrainListWindow_CommonMiddleFrame2_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 12;
            _local1.y = -40;
            _local1.alpha = 0.85;
            _local1.id = "_TrainListWindow_CommonMiddleFrame2";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TrainListWindow_CommonMiddleFrame2 = _local1;
            BindingManager.executeBindings(this, "_TrainListWindow_CommonMiddleFrame2", this._TrainListWindow_CommonMiddleFrame2);
            return (_local1);
        }
        private function _TrainListWindow_ClickScaleButton1_c():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.x = 129;
            _local1.y = 455;
            _local1.rotation = 180;
            _local1.buttonImage = this._embed_mxml_source_buttonImages_________png_1182990640;
            _local1.depth = 5;
            _local1.addEventListener("click", this.___TrainListWindow_ClickScaleButton1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TrainListWindow_ClickScaleButton1_click(_arg1:MouseEvent):void{
            this.trainTabWindow.changeToPreviousItem();
        }
        private function _TrainListWindow_ClickScaleButton2_c():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.x = 915;
            _local1.y = 243;
            _local1.buttonImage = this._embed_mxml_source_buttonImages_________png_1182990640;
            _local1.depth = 5;
            _local1.addEventListener("click", this.___TrainListWindow_ClickScaleButton2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TrainListWindow_ClickScaleButton2_click(_arg1:MouseEvent):void{
            this.trainTabWindow.changeToNextItem();
        }
        private function _TrainListWindow_Label2_c():Label{
            var _local1:Label = new Label();
            _local1.x = 414;
            _local1.y = 603;
            _local1.text = "卡组选择：";
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 14466179);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindow_ComboBox1_i():ComboBox{
            var _local1:ComboBox = new ComboBox();
            _local1.x = 483;
            _local1.y = 597;
            _local1.setStyle("fontSize", 14);
            _local1.addEventListener("focusIn", this.__cardGroups_focusIn);
            _local1.addEventListener("removedFromStage", this.__cardGroups_removedFromStage);
            _local1.id = "cardGroups";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardGroups = _local1;
            BindingManager.executeBindings(this, "cardGroups", this.cardGroups);
            return (_local1);
        }
        public function __cardGroups_focusIn(_arg1:FocusEvent):void{
            IME.enabled = true;
        }
        public function __cardGroups_removedFromStage(_arg1:Event):void{
            this.cardGroups_removedFromStageHandler(_arg1);
        }
        private function _TrainListWindow_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 475;
            _local1.y = 639;
            _local1.source = this._embed_mxml_source_commonUI____png_1542558160;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindow_SmoothBitmapImage3_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 545;
            _local1.y = 639;
            _local1.source = this._embed_mxml_source_commonUI____png_1542558160;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindow_SmoothBitmapImage4_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 475;
            _local1.y = 696;
            _local1.source = this._embed_mxml_source_commonUI____png_1542558160;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindow_SmoothBitmapImage5_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 545;
            _local1.y = 696;
            _local1.source = this._embed_mxml_source_commonUI____png_1542558160;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindow_UniversalImageButton1_i():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.x = 432;
            _local1.y = 657;
            _local1.btnScale = 1.1;
            _local1.labelImage = this._embed_mxml_source_buttonImages______png_1610395248;
            _local1.addEventListener("initialize", this.__startBtn_initialize);
            _local1.addEventListener("click", this.__startBtn_click);
            _local1.id = "startBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.startBtn = _local1;
            BindingManager.executeBindings(this, "startBtn", this.startBtn);
            return (_local1);
        }
        public function __startBtn_initialize(_arg1:FlexEvent):void{
            this.startBtn.setStyle("sound", "click_3");
        }
        public function __startBtn_click(_arg1:MouseEvent):void{
            this.startTrain();
        }
        private function _TrainListWindow_UniversalImageButton2_c():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.x = 432;
            _local1.y = 712;
            _local1.labelImage = this._embed_mxml_source_buttonImages____png_1993273380;
            _local1.addEventListener("click", this.___TrainListWindow_UniversalImageButton2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TrainListWindow_UniversalImageButton2_click(_arg1:MouseEvent):void{
            this.enterJudgeCardWindow(_arg1);
        }
        public function ___TrainListWindow_Group1_initialize(_arg1:FlexEvent):void{
            alpha = 0;
            mouseChildren = false;
        }
        public function ___TrainListWindow_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler();
        }
        public function ___TrainListWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _TrainListWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeIn");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [875, 529];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_TrainListWindow_CommonOuterFrame1.size");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [851, 445];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_TrainListWindow_CommonMiddleFrame1.size");
            result[3] = new Binding(this, function ():Array{
                var _local1:* = ["第一幕", "第二幕"];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "trainTabWindow.tabItemDataProvider");
            result[4] = new Binding(this, function ():Array{
                var _local1:* = [410, 89];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_TrainListWindow_CommonOuterFrame2.size");
            result[5] = new Binding(this, function ():Array{
                var _local1:* = [386, 77];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_TrainListWindow_CommonMiddleFrame2.size");
            result[6] = new Binding(this, function ():IList{
                return (userCardGroups);
            }, null, "cardGroups.dataProvider");
            return (result);
        }
        public function get cardGroups():ComboBox{
            return (this._304919812cardGroups);
        }
        public function set cardGroups(_arg1:ComboBox):void{
            var _local2:Object = this._304919812cardGroups;
            if (_local2 !== _arg1){
                this._304919812cardGroups = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardGroups", _local2, _arg1));
                };
            };
        }
        public function get fadeIn():Fade{
            return (this._1282133823fadeIn);
        }
        public function set fadeIn(_arg1:Fade):void{
            var _local2:Object = this._1282133823fadeIn;
            if (_local2 !== _arg1){
                this._1282133823fadeIn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeIn", _local2, _arg1));
                };
            };
        }
        public function get startBtn():UniversalImageButton{
            return (this._1316769434startBtn);
        }
        public function set startBtn(_arg1:UniversalImageButton):void{
            var _local2:Object = this._1316769434startBtn;
            if (_local2 !== _arg1){
                this._1316769434startBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "startBtn", _local2, _arg1));
                };
            };
        }
        public function get trainTabWindow():CommonTabWindow{
            return (this._1608366781trainTabWindow);
        }
        public function set trainTabWindow(_arg1:CommonTabWindow):void{
            var _local2:Object = this._1608366781trainTabWindow;
            if (_local2 !== _arg1){
                this._1608366781trainTabWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "trainTabWindow", _local2, _arg1));
                };
            };
        }
        private function get userCardGroups():ArrayCollection{
            return (this._1059420975userCardGroups);
        }
        private function set userCardGroups(_arg1:ArrayCollection):void{
            var _local2:Object = this._1059420975userCardGroups;
            if (_local2 !== _arg1){
                this._1059420975userCardGroups = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userCardGroups", _local2, _arg1));
                };
            };
        }

    }
}//package train_system 
