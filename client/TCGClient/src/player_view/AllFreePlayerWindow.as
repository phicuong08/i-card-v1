//Created by Action Script Viewer - http://www.buraks.com/asv
package player_view {
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
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.filters.*;
    import custom_effect.*;
    import mx.collections.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import mouse_keyboard_mgr.*;
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

    public class AllFreePlayerWindow extends AutoDepthGroup implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _AllFreePlayerWindow_CommonInnerFrame1:CommonInnerFrame;
        public var _AllFreePlayerWindow_CommonOuterFrame1:CommonOuterFrame;
        private var _413245038addEffect:Fade;
        private var _2131590956itemGroup:Group;
        private var _1273109611pageSelect:ComboBox;
        private var _66803271scrollerCp:Scroller;
        private var __moduleFactoryInitialized:Boolean = false;
        private var itemDistance:Number = 18;
        private var _userListInfo:Object;
        private var _900911502pagesData:ArrayCollection;
        private var creationHasComplete:Boolean = false;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function AllFreePlayerWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._900911502pagesData = new ArrayCollection();
            this._embed_mxml_source_commonUI____png_1538356188 = AllFreePlayerWindow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._AllFreePlayerWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_player_view_AllFreePlayerWindowWatcherSetupUtil");
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
            this.width = 330;
            this.height = 394;
            this.depth = 5;
            this.mxmlContent = [this._AllFreePlayerWindow_CommonOuterFrame1_i(), this._AllFreePlayerWindow_SmoothBitmapImage1_c(), this._AllFreePlayerWindow_Label1_c(), this._AllFreePlayerWindow_CommonInnerFrame1_i(), this._AllFreePlayerWindow_Rect1_c(), this._AllFreePlayerWindow_Label2_c(), this._AllFreePlayerWindow_Label3_c(), this._AllFreePlayerWindow_Label4_c(), this._AllFreePlayerWindow_Label5_c(), this._AllFreePlayerWindow_Scroller1_i(), this._AllFreePlayerWindow_CloseSignBtn1_c(), this._AllFreePlayerWindow_Button1_c(), this._AllFreePlayerWindow_ComboBox1_i(), this._AllFreePlayerWindow_Button2_c()];
            this._AllFreePlayerWindow_Fade1_i();
            this.addEventListener("creationComplete", this.___AllFreePlayerWindow_AutoDepthGroup1_creationComplete);
            this.addEventListener("remove", this.___AllFreePlayerWindow_AutoDepthGroup1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            AllFreePlayerWindow._watcherSetupUtil = _arg1;
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
                this.color = 15388793;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_creationCompleteHandler():void{
            this.creationHasComplete = true;
            this.buildUserList();
        }
        public function set usersInfo(_arg1:Object):void{
            this._userListInfo = _arg1;
            this.buildUserList();
        }
        private function setPageSelectComboBox():void{
            this.pagesData.disableAutoUpdate();
            var _local1:int = (this.pagesData.length + 1);
            while (_local1 <= this._userListInfo.page_num) {
                this.pagesData.addItem({
                    index:_local1,
                    label:(("第" + _local1) + "页")
                });
                _local1++;
            };
            _local1 = (this.pagesData.length - 1);
            while (_local1 >= this._userListInfo.page_num) {
                this.pagesData.removeItemAt(_local1);
                _local1--;
            };
            this.pagesData.enableAutoUpdate();
            this.pageSelect.selectedIndex = (this._userListInfo.page_index - 1);
        }
        private function getRangedUserInfoArray(_arg1:Object):Array{
            var _local3:Object;
            var _local4:Object;
            var _local2:Array = new Array();
            for each (_local3 in _arg1) {
                _local4 = UserObject.transUserState(_local3["state"]);
                _local3["state_index"] = _local4["state_index"];
                _local3["state_color"] = _local4["state_color"];
                _local3["state_desc"] = _local4["state_desc"];
                _local2.push(_local3);
            };
            _local2.sortOn(["state_index", "level"], [Array.NUMERIC, (Array.NUMERIC | Array.DESCENDING)]);
            return (_local2);
        }
        private function buildUserList():void{
            var _local1:Array;
            var _local2:AllFreePlayerWindowItem;
            var _local3:int;
            var _local4:int;
            var _local5:int;
            if (((this._userListInfo) && (this.creationHasComplete))){
                this.setPageSelectComboBox();
                _local1 = this.getRangedUserInfoArray(this._userListInfo.page_user_info);
                _local3 = this.itemGroup.numChildren;
                _local4 = 0;
                while (_local4 < _local1.length) {
                    if (_local4 < _local3){
                        _local2 = (this.itemGroup.getElementAt(_local4) as AllFreePlayerWindowItem);
                    } else {
                        _local2 = new AllFreePlayerWindowItem();
                        this.itemGroup.addElement(_local2);
                        _local2.y = (this.itemDistance * _local4);
                    };
                    _local2.playerInfo = _local1[_local4];
                    _local4++;
                };
                _local5 = _local4;
                while (_local5 < _local3) {
                    this.itemGroup.removeElementAt((this.itemGroup.numChildren - 1));
                    _local5++;
                };
            };
        }
        protected function pageSelect_changeHandler(_arg1:IndexChangeEvent):void{
            if (((this.pageSelect.selectedItem) && (this.pagesData.contains(this.pageSelect.selectedItem)))){
                this.refreshData((this.pageSelect.selectedIndex + 1));
            };
        }
        private function changeToPrePage():void{
            if (this.pageSelect.selectedIndex != 0){
                this.refreshData(this.pageSelect.selectedIndex);
            };
        }
        private function changeToNextPage():void{
            this.refreshData((this.pageSelect.selectedIndex + 2));
        }
        private function refreshData(_arg1:int):void{
            LuaAgent.getInstance().run((("u.player_view_mgr:get_user_list(" + _arg1) + ")"));
        }
        protected function scroller1_mouseWheelHandler(_arg1:MouseEvent):void{
            _arg1.preventDefault();
            var _local2:Number = ((_arg1.delta < 0)) ? this.itemDistance : -(this.itemDistance);
            this.itemGroup.verticalScrollPosition = (this.itemGroup.verticalScrollPosition + _local2);
        }
        public function removeSelf(_arg1=null):void{
            var _local2:* = parent;
            if (_local2){
                _local2.removeElement(this);
            };
        }
        protected function group1_removeHandler(_arg1:FlexEvent):void{
            var _local2:FakeFadeEffect = new FakeFadeEffect(this, 300, 1, 0);
            _local2.effectContainer.depth = depth;
            _local2.play();
        }
        protected function stopDragHandler(_arg1:MouseEvent):void{
            this.stopDrag();
            var _local2:Point = parent.globalToLocal(localToGlobal(new Point(0, 0)));
            x = _local2.x;
            y = _local2.y;
        }
        private function _AllFreePlayerWindow_Fade1_i():Fade{
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
            this.refreshData(1);
        }
        private function _AllFreePlayerWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.alpha = 0.9;
            _local1.mouseEnabled = true;
            _local1.filters = [this._AllFreePlayerWindow_DropShadowFilter1_c()];
            _local1.addEventListener("mouseDown", this.___AllFreePlayerWindow_CommonOuterFrame1_mouseDown);
            _local1.addEventListener("mouseUp", this.___AllFreePlayerWindow_CommonOuterFrame1_mouseUp);
            _local1.id = "_AllFreePlayerWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AllFreePlayerWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_AllFreePlayerWindow_CommonOuterFrame1", this._AllFreePlayerWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AllFreePlayerWindow_CommonOuterFrame1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
            MouseMgr.getInstance().setCursor("drag");
        }
        public function ___AllFreePlayerWindow_CommonOuterFrame1_mouseUp(_arg1:MouseEvent):void{
            this.stopDragHandler(_arg1);
            MouseMgr.getInstance().clearCursor("drag");
        }
        private function _AllFreePlayerWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 20;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 20;
            _local1.y = 13;
            _local1.text = "玩家列表";
            _local1.mouseEnabled = false;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_CommonInnerFrame1_i():CommonInnerFrame{
            var _local1:CommonInnerFrame = new CommonInnerFrame();
            _local1.x = 14;
            _local1.y = 40;
            _local1.alpha = 0.9;
            _local1.id = "_AllFreePlayerWindow_CommonInnerFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AllFreePlayerWindow_CommonInnerFrame1 = _local1;
            BindingManager.executeBindings(this, "_AllFreePlayerWindow_CommonInnerFrame1", this._AllFreePlayerWindow_CommonInnerFrame1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 21;
            _local1.y = 49;
            _local1.width = 260;
            _local1.height = 18;
            _local1.fill = this._AllFreePlayerWindow_LinearGradient1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._AllFreePlayerWindow_GradientEntry1_c(), this._AllFreePlayerWindow_GradientEntry2_c(), this._AllFreePlayerWindow_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 8881240;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 8881240;
            _local1.alpha = 0.8;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 8881240;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_Label2_c():Label{
            var _local1:Label = new Label();
            _local1.x = 25;
            _local1.y = 51;
            _local1.width = 80;
            _local1.text = "玩家名称";
            _local1.setStyle("color", 15388793);
            _local1.setStyle("textAlign", "center");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_Label3_c():Label{
            var _local1:Label = new Label();
            _local1.x = 115;
            _local1.y = 51;
            _local1.width = 30;
            _local1.text = "等级";
            _local1.setStyle("color", 15388793);
            _local1.setStyle("textAlign", "center");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_Label4_c():Label{
            var _local1:Label = new Label();
            _local1.x = 155;
            _local1.y = 51;
            _local1.width = 60;
            _local1.text = "状态";
            _local1.setStyle("color", 15388793);
            _local1.setStyle("textAlign", "center");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_Label5_c():Label{
            var _local1:Label = new Label();
            _local1.x = 225;
            _local1.y = 51;
            _local1.width = 60;
            _local1.text = "所在房间";
            _local1.setStyle("color", 15388793);
            _local1.setStyle("textAlign", "center");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindow_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 20;
            _local1.y = 67;
            _local1.width = 290;
            _local1.height = 262;
            _local1.viewport = this._AllFreePlayerWindow_Group1_i();
            _local1.setStyle("horizontalScrollPolicy", "off");
            _local1.addEventListener("creationComplete", this.__scrollerCp_creationComplete);
            _local1.id = "scrollerCp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scrollerCp = _local1;
            BindingManager.executeBindings(this, "scrollerCp", this.scrollerCp);
            return (_local1);
        }
        private function _AllFreePlayerWindow_Group1_i():Group{
            var _local1:Group = new Group();
            _local1.id = "itemGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup = _local1;
            BindingManager.executeBindings(this, "itemGroup", this.itemGroup);
            return (_local1);
        }
        public function __scrollerCp_creationComplete(_arg1:FlexEvent):void{
            this.scrollerCp.addEventListener(MouseEvent.MOUSE_WHEEL, this.scroller1_mouseWheelHandler, true);
        }
        private function _AllFreePlayerWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 7;
            _local1.top = 7;
            _local1.addEventListener("click", this.___AllFreePlayerWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AllFreePlayerWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        private function _AllFreePlayerWindow_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.label = "上一页";
            _local1.x = 66;
            _local1.y = 352;
            _local1.width = 60;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___AllFreePlayerWindow_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AllFreePlayerWindow_Button1_click(_arg1:MouseEvent):void{
            this.changeToPrePage();
        }
        private function _AllFreePlayerWindow_ComboBox1_i():ComboBox{
            var _local1:ComboBox = new ComboBox();
            _local1.x = 131;
            _local1.y = 353;
            _local1.width = 70;
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
        private function _AllFreePlayerWindow_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.label = "下一页";
            _local1.x = 206;
            _local1.y = 352;
            _local1.width = 60;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___AllFreePlayerWindow_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AllFreePlayerWindow_Button2_click(_arg1:MouseEvent):void{
            this.changeToNextPage();
        }
        public function ___AllFreePlayerWindow_AutoDepthGroup1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        public function ___AllFreePlayerWindow_AutoDepthGroup1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        private function _AllFreePlayerWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [330, 394];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_AllFreePlayerWindow_CommonOuterFrame1.size");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [302, 300];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_AllFreePlayerWindow_CommonInnerFrame1.size");
            result[3] = new Binding(this, function ():IList{
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
        public function get itemGroup():Group{
            return (this._2131590956itemGroup);
        }
        public function set itemGroup(_arg1:Group):void{
            var _local2:Object = this._2131590956itemGroup;
            if (_local2 !== _arg1){
                this._2131590956itemGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup", _local2, _arg1));
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
}//package player_view 
