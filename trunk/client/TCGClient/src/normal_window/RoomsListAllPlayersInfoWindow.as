//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
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
    
    import mx.binding.*;
    import mx.collections.*;
    import mx.core.*;
    import mx.events.*;
    import mx.filters.*;
    import mx.styles.*;
    
    import skins.*;
    
    import source_manager.*;
    
    import spark.components.*;
    import spark.events.*;
    import spark.layouts.*;

    public class RoomsListAllPlayersInfoWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _2131590956itemGroup:Group;
        private var _1273109611pageSelect:ComboBox;
        private var _66803271scrollerCp:Scroller;
        private var _788148805usersInfoBg:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var creationHasComplete:Boolean = false;
        private var itemDistance:Number = 18;
        private var _userListInfo:Object;
        private var _900911502pagesData:ArrayCollection;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function RoomsListAllPlayersInfoWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._900911502pagesData = new ArrayCollection();
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._RoomsListAllPlayersInfoWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_RoomsListAllPlayersInfoWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (RoomsListAllPlayersInfoWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 288;
            this.height = 654;
            this.layout = this._RoomsListAllPlayersInfoWindow_BasicLayout1_c();
            this.mxmlContent = [this._RoomsListAllPlayersInfoWindow_SmoothBitmapImage1_i(), this._RoomsListAllPlayersInfoWindow_Label1_c(), this._RoomsListAllPlayersInfoWindow_Label2_c(), this._RoomsListAllPlayersInfoWindow_Label3_c(), this._RoomsListAllPlayersInfoWindow_Label4_c(), this._RoomsListAllPlayersInfoWindow_Scroller1_i(), this._RoomsListAllPlayersInfoWindow_Button1_c(), this._RoomsListAllPlayersInfoWindow_ComboBox1_i(), this._RoomsListAllPlayersInfoWindow_Button2_c()];
            this.addEventListener("creationComplete", this.___RoomsListAllPlayersInfoWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            RoomsListAllPlayersInfoWindow._watcherSetupUtil = _arg1;
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
        public function set usersInfo(_arg1:Object):void{
            this._userListInfo = _arg1;
            this.buildUserList();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.usersInfoBg.source = RoomsListSourceMgr.getInstance().getSourceClass("usersInfoBg");
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
            RoomsList.getInstance().userPageIndex = this._userListInfo.page_index;
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
            var _local2:RoomsListAllPlayersInfoWindowItem;
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
                        _local2 = (this.itemGroup.getElementAt(_local4) as RoomsListAllPlayersInfoWindowItem);
                    } else {
                        _local2 = new RoomsListAllPlayersInfoWindowItem();
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
        protected function scroller1_mouseWheelHandler(_arg1:MouseEvent):void{
            _arg1.preventDefault();
            var _local2:Number = ((_arg1.delta < 0)) ? this.itemDistance : -(this.itemDistance);
            this.itemGroup.verticalScrollPosition = (this.itemGroup.verticalScrollPosition + _local2);
        }
        protected function pageSelect_changeHandler(_arg1:IndexChangeEvent):void{
            if (((this.pageSelect.selectedItem) && (this.pagesData.contains(this.pageSelect.selectedItem)))){
                RoomsList.getInstance().userPageIndex = (this.pageSelect.selectedIndex + 1);
                RoomsList.getInstance().getUserInfoFromServer();
            };
        }
        private function changeToPrePage():void{
            if (RoomsList.getInstance().userPageIndex <= 1){
                return;
            };
            RoomsList.getInstance().userPageIndex = (RoomsList.getInstance().userPageIndex - 1);
            RoomsList.getInstance().getUserInfoFromServer();
        }
        private function changeToNextPage():void{
            RoomsList.getInstance().userPageIndex = (RoomsList.getInstance().userPageIndex + 1);
            RoomsList.getInstance().getUserInfoFromServer();
        }
        private function _RoomsListAllPlayersInfoWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsListAllPlayersInfoWindow_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "usersInfoBg");
            this.usersInfoBg = _local1;
            BindingManager.executeBindings(this, "usersInfoBg", this.usersInfoBg);
            return (_local1);
        }
        private function _RoomsListAllPlayersInfoWindow_Label1_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 19;
            _local1.y = 39;
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
        private function _RoomsListAllPlayersInfoWindow_Label2_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 99;
            _local1.y = 39;
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
        private function _RoomsListAllPlayersInfoWindow_Label3_c():Label{
            var _local1:Label = new Label();
            _local1.x = 129;
            _local1.y = 39;
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
        private function _RoomsListAllPlayersInfoWindow_Label4_c():Label{
            var _local1:Label = new Label();
            _local1.x = 195;
            _local1.y = 39;
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
        private function _RoomsListAllPlayersInfoWindow_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 14;
            _local1.y = 55;
            _local1.width = 263;
            _local1.height = 555;
            _local1.viewport = this._RoomsListAllPlayersInfoWindow_Group2_i();
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
        private function _RoomsListAllPlayersInfoWindow_Group2_i():Group{
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
        private function _RoomsListAllPlayersInfoWindow_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.label = "上一页";
            _local1.x = 37;
            _local1.y = 621;
            _local1.width = 60;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomsListAllPlayersInfoWindow_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsListAllPlayersInfoWindow_Button1_click(_arg1:MouseEvent):void{
            this.changeToPrePage();
        }
        private function _RoomsListAllPlayersInfoWindow_ComboBox1_i():ComboBox{
            var _local1:ComboBox = new ComboBox();
            _local1.x = 102;
            _local1.y = 622;
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
        private function _RoomsListAllPlayersInfoWindow_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.label = "下一页";
            _local1.x = 177;
            _local1.y = 621;
            _local1.width = 60;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomsListAllPlayersInfoWindow_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsListAllPlayersInfoWindow_Button2_click(_arg1:MouseEvent):void{
            this.changeToNextPage();
        }
        public function ___RoomsListAllPlayersInfoWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _RoomsListAllPlayersInfoWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():IList{
                return (pagesData);
            }, null, "pageSelect.dataProvider");
            return (result);
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
        public function get usersInfoBg():SmoothBitmapImage{
            return (this._788148805usersInfoBg);
        }
        public function set usersInfoBg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._788148805usersInfoBg;
            if (_local2 !== _arg1){
                this._788148805usersInfoBg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "usersInfoBg", _local2, _arg1));
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
}//package normal_window 
