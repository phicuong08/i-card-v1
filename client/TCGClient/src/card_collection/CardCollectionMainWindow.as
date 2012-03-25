//Created by Action Script Viewer - http://www.buraks.com/asv
package card_collection {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import spark.events.*;
    import mx.binding.*;
    import normal_window.*;
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import mx.collections.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import skins.*;
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

    public class CardCollectionMainWindow extends AutoDepthGroup implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private const PAGE_CARD_NUM:int = 24;

        public var _CardCollectionMainWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _CardCollectionMainWindow_LargeFrameWindowWithTitle1:LargeFrameWindowWithTitle;
        private var _413245038addEffect:Fade;
        private var _267258545cardGroup:Group;
        private var _1273109611pageSelect:ComboBox;
        private var __moduleFactoryInitialized:Boolean = false;
        private var collectonDetailInfo:Object;
        private var _900911502pagesData:ArrayCollection;
        private var currentDisplayCardInfoArr:Array;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardCollectionMainWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._900911502pagesData = new ArrayCollection();
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardCollectionMainWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_card_collection_CardCollectionMainWindowWatcherSetupUtil");
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
            this.x = 99;
            this.y = 60;
            this.width = 1082;
            this.height = 660;
            this.mouseChildren = false;
            this.mxmlContent = [this._CardCollectionMainWindow_LargeFrameWindowWithTitle1_i(), this._CardCollectionMainWindow_CommonMiddleFrame1_i(), this._CardCollectionMainWindow_CloseSignBtn1_c(), this._CardCollectionMainWindow_HGroup1_c(), this._CardCollectionMainWindow_Button5_c(), this._CardCollectionMainWindow_ComboBox1_i(), this._CardCollectionMainWindow_Button6_c(), this._CardCollectionMainWindow_Group1_i(), this._CardCollectionMainWindow_Label1_c()];
            this._CardCollectionMainWindow_Fade1_i();
            this.addEventListener("remove", this.___CardCollectionMainWindow_AutoDepthGroup1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardCollectionMainWindow._watcherSetupUtil = _arg1;
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
        private function addEffectCompleteHandler():void{
            BasicOperationBar.getInstance().registerWeakLeaveFunc(this.removeSelf);
            mouseChildren = true;
            this.getCardCollectionInfo();
        }
        public function refreshCollection(_arg1:Object):void{
            var _local4:CardCollectionCard;
            this.collectonDetailInfo = _arg1;
            var _local2:int = this.cardGroup.numElements;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = (this.cardGroup.getElementAt(_local3) as CardCollectionCard);
                _local4.refreshCollection(_arg1);
                _local3++;
            };
        }
        protected function getCardCollectionInfo():void{
            this.collectonDetailInfo = CardCollectionMgr.getInstance().getCollectionDetailData();
            this.buildCardInfoByColor("gold");
        }
        private function buildCardInfoByColor(_arg1:String):void{
            var _local3:Object;
            this.currentDisplayCardInfoArr = new Array();
            var _local2:Object = CardsInfo.getAllCardsInfo();
            for each (_local3 in _local2) {
                if ((((_local3["color"] == _arg1)) && (!((_local3["rare_level"] == 0))))){
                    this.currentDisplayCardInfoArr.push(CommonUtil.cloneObject(_local3));
                };
            };
            this.currentDisplayCardInfoArr.sortOn(["country", "id"], [0, Array.NUMERIC]);
            this.setPageSelectComboBox();
            this.setCardByFromPage();
        }
        private function setPageSelectComboBox():void{
            this.pagesData.disableAutoUpdate();
            var _local1:int = Math.ceil((this.currentDisplayCardInfoArr.length / this.PAGE_CARD_NUM));
            var _local2:int = (this.pagesData.length + 1);
            while (_local2 <= _local1) {
                this.pagesData.addItem({
                    index:_local2,
                    label:(("第" + _local2) + "页")
                });
                _local2++;
            };
            _local2 = (this.pagesData.length - 1);
            while (_local2 >= _local1) {
                this.pagesData.removeItemAt(_local2);
                _local2--;
            };
            this.pagesData.enableAutoUpdate();
            this.pageSelect.selectedIndex = 0;
        }
        protected function pageSelect_changeHandler(_arg1:IndexChangeEvent):void{
            if (((this.pageSelect.selectedItem) && (this.pagesData.contains(this.pageSelect.selectedItem)))){
                this.setCardByFromPage();
            };
        }
        private function changeToPrePage():void{
            if (this.pageSelect.selectedIndex != 0){
                this.pageSelect.selectedIndex = (this.pageSelect.selectedIndex - 1);
                this.setCardByFromPage();
            };
        }
        private function changeToNextPage():void{
            if (this.pageSelect.selectedIndex != (this.pagesData.length - 1)){
                this.pageSelect.selectedIndex = (this.pageSelect.selectedIndex + 1);
                this.setCardByFromPage();
            };
        }
        private function setCardByFromPage():void{
            var _local6:CardCollectionCard;
            var _local1:int = (this.pageSelect.selectedIndex * this.PAGE_CARD_NUM);
            var _local2:int = ((_local1 + this.PAGE_CARD_NUM) - 1);
            _local2 = (((this.currentDisplayCardInfoArr.length - 1) < _local2)) ? (this.currentDisplayCardInfoArr.length - 1) : _local2;
            var _local3:int = _local1;
            while (_local3 <= _local2) {
                _local6 = this.getCardByIndex((_local3 - _local1));
                _local6.setInfo(this.currentDisplayCardInfoArr[_local3], this.collectonDetailInfo);
                _local3++;
            };
            var _local4:int = this.cardGroup.numElements;
            var _local5:int = (_local4 - 1);
            while (_local5 > (_local2 - _local1)) {
                this.cardGroup.removeElementAt(_local5);
                _local5--;
            };
        }
        private function getCardByIndex(_arg1:int):CardCollectionCard{
            var _local2:CardCollectionCard;
            if (this.cardGroup.numElements <= _arg1){
                _local2 = new CardCollectionCard();
                this.cardGroup.addElement(_local2);
            } else {
                _local2 = (this.cardGroup.getElementAt(_arg1) as CardCollectionCard);
            };
            return (_local2);
        }
        private function leaveWindow():void{
            CardCollectionMgr.getInstance().hideCardCollectionMainWindow();
            TCGClient.getInstance().enterMainMenu();
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function group1_removeHandler(_arg1:FlexEvent):void{
            BasicOperationBar.getInstance().clearWeakLeaveFunc(this.removeSelf);
        }
        private function _CardCollectionMainWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 500;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.addEffectCompleteHandler();
        }
        private function _CardCollectionMainWindow_LargeFrameWindowWithTitle1_i():LargeFrameWindowWithTitle{
            var _local1:LargeFrameWindowWithTitle = new LargeFrameWindowWithTitle();
            _local1.titleText = "集卡册";
            _local1.innerFrameAlpha = 0.9;
            _local1.filters = [this._CardCollectionMainWindow_DropShadowFilter1_c()];
            _local1.addEventListener("mouseDown", this.___CardCollectionMainWindow_LargeFrameWindowWithTitle1_mouseDown);
            _local1.addEventListener("mouseUp", this.___CardCollectionMainWindow_LargeFrameWindowWithTitle1_mouseUp);
            _local1.id = "_CardCollectionMainWindow_LargeFrameWindowWithTitle1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CardCollectionMainWindow_LargeFrameWindowWithTitle1 = _local1;
            BindingManager.executeBindings(this, "_CardCollectionMainWindow_LargeFrameWindowWithTitle1", this._CardCollectionMainWindow_LargeFrameWindowWithTitle1);
            return (_local1);
        }
        private function _CardCollectionMainWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardCollectionMainWindow_LargeFrameWindowWithTitle1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
        }
        public function ___CardCollectionMainWindow_LargeFrameWindowWithTitle1_mouseUp(_arg1:MouseEvent):void{
            this.stopDrag();
        }
        private function _CardCollectionMainWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 13;
            _local1.y = 61;
            _local1.alpha = 0.7;
            _local1.id = "_CardCollectionMainWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CardCollectionMainWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_CardCollectionMainWindow_CommonMiddleFrame1", this._CardCollectionMainWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _CardCollectionMainWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 7;
            _local1.top = 20;
            _local1.addEventListener("click", this.___CardCollectionMainWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardCollectionMainWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        private function _CardCollectionMainWindow_HGroup1_c():HGroup{
            var _local1:HGroup = new HGroup();
            _local1.x = 50;
            _local1.y = 80;
            _local1.mxmlContent = [this._CardCollectionMainWindow_Button1_c(), this._CardCollectionMainWindow_Button2_c(), this._CardCollectionMainWindow_Button3_c(), this._CardCollectionMainWindow_Button4_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardCollectionMainWindow_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.label = "金色武将卡";
            _local1.width = 87;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___CardCollectionMainWindow_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardCollectionMainWindow_Button1_click(_arg1:MouseEvent):void{
            this.buildCardInfoByColor("gold");
        }
        private function _CardCollectionMainWindow_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.label = "银色武将卡";
            _local1.width = 87;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___CardCollectionMainWindow_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardCollectionMainWindow_Button2_click(_arg1:MouseEvent):void{
            this.buildCardInfoByColor("silver");
        }
        private function _CardCollectionMainWindow_Button3_c():Button{
            var _local1:Button = new Button();
            _local1.label = "计策卡";
            _local1.width = 87;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___CardCollectionMainWindow_Button3_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardCollectionMainWindow_Button3_click(_arg1:MouseEvent):void{
            this.buildCardInfoByColor("green");
        }
        private function _CardCollectionMainWindow_Button4_c():Button{
            var _local1:Button = new Button();
            _local1.label = "陷阱卡";
            _local1.width = 87;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___CardCollectionMainWindow_Button4_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardCollectionMainWindow_Button4_click(_arg1:MouseEvent):void{
            this.buildCardInfoByColor("red");
        }
        private function _CardCollectionMainWindow_Button5_c():Button{
            var _local1:Button = new Button();
            _local1.label = "上一页";
            _local1.x = 777;
            _local1.y = 80;
            _local1.width = 60;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___CardCollectionMainWindow_Button5_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardCollectionMainWindow_Button5_click(_arg1:MouseEvent):void{
            this.changeToPrePage();
        }
        private function _CardCollectionMainWindow_ComboBox1_i():ComboBox{
            var _local1:ComboBox = new ComboBox();
            _local1.x = 842;
            _local1.y = 81;
            _local1.width = 70;
            _local1.setStyle("fontSize", 14);
            _local1.addEventListener("focusIn", this.__pageSelect_focusIn);
            _local1.addEventListener("change", this.__pageSelect_change);
            _local1.id = "pageSelect";
            if (!_local1.document){
                _local1.document = this;
            };
            this.pageSelect = _local1;
            BindingManager.executeBindings(this, "pageSelect", this.pageSelect);
            return (_local1);
        }
        public function __pageSelect_focusIn(_arg1:FocusEvent):void{
            IME.enabled = true;
        }
        public function __pageSelect_change(_arg1:IndexChangeEvent):void{
            this.pageSelect_changeHandler(_arg1);
        }
        private function _CardCollectionMainWindow_Button6_c():Button{
            var _local1:Button = new Button();
            _local1.label = "下一页";
            _local1.x = 917;
            _local1.y = 80;
            _local1.width = 60;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___CardCollectionMainWindow_Button6_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardCollectionMainWindow_Button6_click(_arg1:MouseEvent):void{
            this.changeToNextPage();
        }
        private function _CardCollectionMainWindow_Group1_i():Group{
            var _local1:Group = new Group();
            _local1.x = 50;
            _local1.y = 130;
            _local1.width = 982;
            _local1.height = 550;
            _local1.layout = this._CardCollectionMainWindow_TileLayout1_c();
            _local1.filters = [this._CardCollectionMainWindow_DropShadowFilter2_c()];
            _local1.id = "cardGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardGroup = _local1;
            BindingManager.executeBindings(this, "cardGroup", this.cardGroup);
            return (_local1);
        }
        private function _CardCollectionMainWindow_TileLayout1_c():TileLayout{
            var _local1:TileLayout = new TileLayout();
            _local1.verticalGap = 10;
            _local1.horizontalGap = 13;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardCollectionMainWindow_DropShadowFilter2_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.angle = 40;
            _local1.distance = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardCollectionMainWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.text = "点击卡片上的“提交卡片”，可将卡片加入集卡册。";
            _local1.horizontalCenter = 0;
            _local1.bottom = 26;
            _local1.filters = [this._CardCollectionMainWindow_GlowFilter1_c()];
            _local1.setStyle("fontSize", 16);
            _local1.setStyle("color", 16767396);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardCollectionMainWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardCollectionMainWindow_AutoDepthGroup1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        private function _CardCollectionMainWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, null, "_CardCollectionMainWindow_LargeFrameWindowWithTitle1.width", "width");
            result[2] = new Binding(this, null, null, "_CardCollectionMainWindow_LargeFrameWindowWithTitle1.height", "height");
            result[3] = new Binding(this, function ():Number{
                return ((width - 26));
            }, null, "_CardCollectionMainWindow_CommonMiddleFrame1.width");
            result[4] = new Binding(this, function ():Number{
                return ((height - 70));
            }, null, "_CardCollectionMainWindow_CommonMiddleFrame1.height");
            result[5] = new Binding(this, function ():IList{
                return (pagesData);
            }, null, "pageSelect.dataProvider");
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
        public function get cardGroup():Group{
            return (this._267258545cardGroup);
        }
        public function set cardGroup(_arg1:Group):void{
            var _local2:Object = this._267258545cardGroup;
            if (_local2 !== _arg1){
                this._267258545cardGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardGroup", _local2, _arg1));
                };
            };
        }
        public function get pageSelect():ComboBox{
            return (this._1273109611pageSelect);
        }
        public function set pageSelect(_arg1:ComboBox):void{
            var _local2:Object = this._1273109611pageSelect;
            if (_local2 !== _arg1){
                this._1273109611pageSelect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelect", _local2, _arg1));
                };
            };
        }
        private function get pagesData():ArrayCollection{
            return (this._900911502pagesData);
        }
        private function set pagesData(_arg1:ArrayCollection):void{
            var _local2:Object = this._900911502pagesData;
            if (_local2 !== _arg1){
                this._900911502pagesData = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pagesData", _local2, _arg1));
                };
            };
        }

    }
}//package card_collection 
