//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
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
    import flash.system.*;
    import flash.media.*;
    import source_manager.*;
    import spark.effects.*;
    import spark.layouts.*;
    import custom_effect.*;
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

    public class RoomsList extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var _1479816687allPlayersInfoWindow:RoomsListAllPlayersInfoWindow;
        private var _1084978130fakeImg:SmoothBitmapImage;
        private var _357426321roomItemGroup:Group;
        private var _902274434roomScrollerCp:Scroller;
        private var _1379911005roomsBg:SmoothBitmapImage;
        private var _1195633060viewMenu:RoomsListTabWindow;
        private var __moduleFactoryInitialized:Boolean = false;
        private var refreshRoomTimer:Timer;
        private var refreshUserTimer:Timer;
        private var roomWindowItemDistance:Number = 79;
        private var firstDisplayRoomNum:int = 7;
        private var selectedRoomItem:RoomsListRoomItem;
        private var allRoomItem:Object;
        private var displayWindowStartRange:int = 1;
        private var windowHasBeenShown:Boolean = false;
        public var userPageIndex:int = 1;
        private var _embed_mxml_source_buttonImages______png_268632210:Class;
        private var _embed_mxml_source_commonUI____png_1145878686:Class;
        private var _embed_mxml_source_buttonImages______png_1779469934:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function RoomsList(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.allRoomItem = new Object();
            this._embed_mxml_source_buttonImages______png_268632210 = RoomsList__embed_mxml_source_buttonImages______png_268632210;
            this._embed_mxml_source_commonUI____png_1145878686 = RoomsList__embed_mxml_source_commonUI____png_1145878686;
            this._embed_mxml_source_buttonImages______png_1779469934 = RoomsList__embed_mxml_source_buttonImages______png_1779469934;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._RoomsList_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_RoomsListWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (RoomsList[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 1040;
            this.height = 800;
            this.layout = this._RoomsList_BasicLayout1_c();
            this.mxmlContent = [this._RoomsList_RoomsListAllPlayersInfoWindow1_i(), this._RoomsList_SmoothBitmapImage1_i(), this._RoomsList_SmoothBitmapImage2_c(), this._RoomsList_RoomsListTabWindow1_i(), this._RoomsList_HGroup1_c(), this._RoomsList_Group2_c(), this._RoomsList_Scroller1_i(), this._RoomsList_SmoothBitmapImage3_i()];
            this._RoomsList_Fade1_i();
            this.addEventListener("initialize", this.___RoomsList_Group1_initialize);
            this.addEventListener("remove", this.___RoomsList_Group1_remove);
            this.addEventListener("creationComplete", this.___RoomsList_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function getInstance():RoomsList{
            return (TCGClient.getInstance().roomsList);
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            RoomsList._watcherSetupUtil = _arg1;
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
        private function init():void{
            mouseChildren = false;
            alpha = 0;
            this.refreshRoomTimer = new Timer(10000);
            this.refreshRoomTimer.addEventListener(TimerEvent.TIMER, this.getRoomTimerHandler);
            this.refreshUserTimer = new Timer(15000);
            this.refreshUserTimer.addEventListener(TimerEvent.TIMER, this.getUserTimerHandler);
        }
        protected function createRoomItem(_arg1:int):void{
            var _local2:RoomsListRoomItem = new RoomsListRoomItem();
            this.roomItemGroup.addElement(_local2);
            _local2.y = (this.roomWindowItemDistance * _arg1);
            this.allRoomItem[(_arg1 + 1)] = _local2;
            _local2.addEventListener(MouseEvent.CLICK, this.clickRoomItemHandler);
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.roomsBg.source = RoomsListSourceMgr.getInstance().getSourceClass("roomsBg");
            var _local2:int;
            while (_local2 < this.firstDisplayRoomNum) {
                this.createRoomItem(_local2);
                _local2++;
            };
        }
        protected function addEffect_effectEndHandler(_arg1:EffectEvent):void{
            BasicOperationBar.getInstance().registerLeaveFunc(this.leaveFunc);
            if (!this.roomScrollerCp.parent){
                addElement(this.roomScrollerCp);
                addElement(this.allPlayersInfoWindow);
            };
            this.fakeImg.source = null;
            this.loadingStart();
            mouseChildren = true;
        }
        private function loadingStart():void{
            if (TCGClient.getInstance().customCurrentState != "roomsList"){
                return;
            };
            if (this.windowHasBeenShown){
                this.getRoomInfoFromServer();
            } else {
                this.windowHasBeenShown = true;
                addElement(new RoomsListSectionBtnGroup());
            };
            this.getUserInfoFromServer();
        }
        private function getRoomTimerHandler(_arg1:TimerEvent):void{
            this.getRoomInfoFromServer();
        }
        private function getUserTimerHandler(_arg1:TimerEvent):void{
            this.getUserInfoFromServer();
        }
        public function getUserInfoFromServer():void{
            LuaAgent.getInstance().run((("u.hall_room_mgr:get_user_list(" + this.userPageIndex) + ")"));
            this.refreshUserTimer.stop();
            this.refreshUserTimer.start();
        }
        private function getRoomInfoFromServer():void{
            LuaAgent.getInstance().run((((((("u.hall_room_mgr:get_room_list(\"" + this.getRoomListType()) + "\", ") + this.displayWindowStartRange) + ",") + (this.displayWindowStartRange + 19)) + ");"));
            this.refreshRoomTimer.stop();
            this.refreshRoomTimer.start();
        }
        public function buildRoomList(_arg1:Object):void{
            var _local3:Object;
            var _local4:int;
            var _local5:int;
            var _local6:RoomsListRoomItem;
            if (!this.allRoomItem[20]){
                _local4 = this.firstDisplayRoomNum;
                while (_local4 < 20) {
                    this.createRoomItem(_local4);
                    _local4++;
                };
            };
            var _local2:Array = new Array();
            for each (_local3 in _arg1) {
                _local5 = (_local3["number"] % 20);
                _local6 = this.allRoomItem[((_local5 == 0)) ? 20 : _local5];
                if (_local6){
                    _local6.roomInfo = _local3;
                };
            };
        }
        private function clickRoomItemHandler(_arg1:MouseEvent):void{
            if (this.selectedRoomItem){
                this.selectedRoomItem.isSelected = false;
            };
            this.selectedRoomItem = (_arg1.currentTarget as RoomsListRoomItem);
            this.selectedRoomItem.isSelected = true;
        }
        public function buildUserList(_arg1:Object):void{
            this.allPlayersInfoWindow.usersInfo = _arg1;
        }
        private function changeSelection():void{
            this.getRoomInfoFromServer();
        }
        public function getRoomListType():String{
            var _local1:String;
            if (((this.viewMenu) && (this.viewMenu.selectedItem))){
                _local1 = this.viewMenu.selectedItem.title;
            };
            if (_local1 == "新手区"){
                return ("normal");
            };
            if (_local1 == "正式区"){
                return ("official");
            };
            if (_local1 == "自由区"){
                return ("freedom");
            };
            return ("normal_4");
        }
        protected function displayWindowStartRangeChange(_arg1:int):void{
            this.displayWindowStartRange = _arg1;
            this.getRoomInfoFromServer();
        }
        protected function scroller1_mouseWheelHandler(_arg1:MouseEvent):void{
            _arg1.preventDefault();
            var _local2:Number = ((_arg1.delta < 0)) ? this.roomWindowItemDistance : -(this.roomWindowItemDistance);
            this.roomItemGroup.verticalScrollPosition = (this.roomItemGroup.verticalScrollPosition + _local2);
        }
        private function leaveFunc():void{
            if (!parent){
                return;
            };
            LuaAgent.getInstance().run("u.hall_room_mgr:leave_hall()");
        }
        protected function group1_removeHandler():void{
            var f:* = null;
            var effectEndHandler:* = null;
            effectEndHandler = function (_arg1:CustomEffectEvent):void{
                f.removeEventListener(CustomEffectEvent.END, effectEndHandler);
                fakeImg.source = f.targetBmd;
                removeElement(roomScrollerCp);
                removeElement(allPlayersInfoWindow);
                alpha = 0;
            };
            BasicOperationBar.getInstance().clearLeaveFunc(this.leaveFunc);
            this.refreshRoomTimer.stop();
            this.refreshUserTimer.stop();
            mouseChildren = false;
            f = new FakeFadeEffect(this, 500, 1, 0);
            f.play();
            f.addEventListener(CustomEffectEvent.END, effectEndHandler);
        }
        private function _RoomsList_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 1;
            _local1.startDelay = 500;
            _local1.duration = 500;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.addEffect_effectEndHandler(_arg1);
        }
        private function _RoomsList_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsList_RoomsListAllPlayersInfoWindow1_i():RoomsListAllPlayersInfoWindow{
            var _local1:RoomsListAllPlayersInfoWindow = new RoomsListAllPlayersInfoWindow();
            _local1.x = 13;
            _local1.y = 103;
            _local1.id = "allPlayersInfoWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.allPlayersInfoWindow = _local1;
            BindingManager.executeBindings(this, "allPlayersInfoWindow", this.allPlayersInfoWindow);
            return (_local1);
        }
        private function _RoomsList_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 289;
            _local1.y = 49;
            _local1.initialized(this, "roomsBg");
            this.roomsBg = _local1;
            BindingManager.executeBindings(this, "roomsBg", this.roomsBg);
            return (_local1);
        }
        private function _RoomsList_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1145878686;
            _local1.x = 550;
            _local1.y = 25;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsList_RoomsListTabWindow1_i():RoomsListTabWindow{
            var _local1:RoomsListTabWindow = new RoomsListTabWindow();
            _local1.x = 301;
            _local1.y = 95;
            _local1.addEventListener("select_item_changed", this.__viewMenu_select_item_changed);
            _local1.id = "viewMenu";
            if (!_local1.document){
                _local1.document = this;
            };
            this.viewMenu = _local1;
            BindingManager.executeBindings(this, "viewMenu", this.viewMenu);
            return (_local1);
        }
        public function __viewMenu_select_item_changed(_arg1:Event):void{
            this.changeSelection();
        }
        private function _RoomsList_HGroup1_c():HGroup{
            var _local1:HGroup = new HGroup();
            _local1.x = 655;
            _local1.y = 708;
            _local1.gap = 0;
            _local1.mxmlContent = [this._RoomsList_UniversalImageButton1_c(), this._RoomsList_UniversalImageButton2_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsList_UniversalImageButton1_c():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.labelImage = this._embed_mxml_source_buttonImages______png_268632210;
            _local1.addEventListener("click", this.___RoomsList_UniversalImageButton1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsList_UniversalImageButton1_click(_arg1:MouseEvent):void{
            this.getRoomInfoFromServer();
        }
        private function _RoomsList_UniversalImageButton2_c():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.labelImage = this._embed_mxml_source_buttonImages______png_1779469934;
            _local1.addEventListener("click", this.___RoomsList_UniversalImageButton2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsList_UniversalImageButton2_click(_arg1:MouseEvent):void{
            LuaAgent.getInstance().run((("u.hall_room_mgr:enter_room_quickly('" + this.getRoomListType()) + "')"));
        }
        private function _RoomsList_Group2_c():Group{
            var _local1:Group = new Group();
            _local1.x = 306;
            _local1.y = 705;
            _local1.layout = this._RoomsList_TileLayout1_c();
            _local1.mxmlContent = [this._RoomsList_Button1_c(), this._RoomsList_Button2_c(), this._RoomsList_Button3_c(), this._RoomsList_Button4_c(), this._RoomsList_Button5_c(), this._RoomsList_Button6_c(), this._RoomsList_Button7_c(), this._RoomsList_Button8_c(), this._RoomsList_Button9_c(), this._RoomsList_Button10_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsList_TileLayout1_c():TileLayout{
            var _local1:TileLayout = new TileLayout();
            _local1.verticalGap = 0;
            _local1.horizontalGap = 4;
            _local1.requestedColumnCount = 5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsList_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.label = "1-20";
            _local1.width = 64;
            _local1.height = 23;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomsList_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsList_Button1_click(_arg1:MouseEvent):void{
            this.displayWindowStartRangeChange(1);
        }
        private function _RoomsList_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.label = "21-40";
            _local1.width = 64;
            _local1.height = 23;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomsList_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsList_Button2_click(_arg1:MouseEvent):void{
            this.displayWindowStartRangeChange(21);
        }
        private function _RoomsList_Button3_c():Button{
            var _local1:Button = new Button();
            _local1.label = "41-60";
            _local1.width = 64;
            _local1.height = 23;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomsList_Button3_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsList_Button3_click(_arg1:MouseEvent):void{
            this.displayWindowStartRangeChange(41);
        }
        private function _RoomsList_Button4_c():Button{
            var _local1:Button = new Button();
            _local1.label = "61-80";
            _local1.width = 64;
            _local1.height = 23;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomsList_Button4_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsList_Button4_click(_arg1:MouseEvent):void{
            this.displayWindowStartRangeChange(61);
        }
        private function _RoomsList_Button5_c():Button{
            var _local1:Button = new Button();
            _local1.label = "81-100";
            _local1.width = 64;
            _local1.height = 23;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomsList_Button5_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsList_Button5_click(_arg1:MouseEvent):void{
            this.displayWindowStartRangeChange(81);
        }
        private function _RoomsList_Button6_c():Button{
            var _local1:Button = new Button();
            _local1.label = "101-120";
            _local1.width = 64;
            _local1.height = 23;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomsList_Button6_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsList_Button6_click(_arg1:MouseEvent):void{
            this.displayWindowStartRangeChange(101);
        }
        private function _RoomsList_Button7_c():Button{
            var _local1:Button = new Button();
            _local1.label = "121-140";
            _local1.width = 64;
            _local1.height = 23;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomsList_Button7_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsList_Button7_click(_arg1:MouseEvent):void{
            this.displayWindowStartRangeChange(121);
        }
        private function _RoomsList_Button8_c():Button{
            var _local1:Button = new Button();
            _local1.label = "141-160";
            _local1.width = 64;
            _local1.height = 23;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomsList_Button8_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsList_Button8_click(_arg1:MouseEvent):void{
            this.displayWindowStartRangeChange(141);
        }
        private function _RoomsList_Button9_c():Button{
            var _local1:Button = new Button();
            _local1.label = "161-180";
            _local1.width = 64;
            _local1.height = 23;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomsList_Button9_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsList_Button9_click(_arg1:MouseEvent):void{
            this.displayWindowStartRangeChange(161);
        }
        private function _RoomsList_Button10_c():Button{
            var _local1:Button = new Button();
            _local1.label = "181-200";
            _local1.width = 64;
            _local1.height = 23;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RoomsList_Button10_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsList_Button10_click(_arg1:MouseEvent):void{
            this.displayWindowStartRangeChange(181);
        }
        private function _RoomsList_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 316;
            _local1.y = 131;
            _local1.width = 670;
            _local1.height = 550;
            _local1.viewport = this._RoomsList_Group3_i();
            _local1.setStyle("horizontalScrollPolicy", "off");
            _local1.addEventListener("creationComplete", this.__roomScrollerCp_creationComplete);
            _local1.id = "roomScrollerCp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.roomScrollerCp = _local1;
            BindingManager.executeBindings(this, "roomScrollerCp", this.roomScrollerCp);
            return (_local1);
        }
        private function _RoomsList_Group3_i():Group{
            var _local1:Group = new Group();
            _local1.id = "roomItemGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.roomItemGroup = _local1;
            BindingManager.executeBindings(this, "roomItemGroup", this.roomItemGroup);
            return (_local1);
        }
        public function __roomScrollerCp_creationComplete(_arg1:FlexEvent):void{
            this.roomScrollerCp.addEventListener(MouseEvent.MOUSE_WHEEL, this.scroller1_mouseWheelHandler, true);
        }
        private function _RoomsList_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "fakeImg");
            this.fakeImg = _local1;
            BindingManager.executeBindings(this, "fakeImg", this.fakeImg);
            return (_local1);
        }
        public function ___RoomsList_Group1_initialize(_arg1:FlexEvent):void{
            this.init();
        }
        public function ___RoomsList_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler();
        }
        public function ___RoomsList_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _RoomsList_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
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
        public function get allPlayersInfoWindow():RoomsListAllPlayersInfoWindow{
            return (this._1479816687allPlayersInfoWindow);
        }
        public function set allPlayersInfoWindow(_arg1:RoomsListAllPlayersInfoWindow):void{
            var _local2:Object = this._1479816687allPlayersInfoWindow;
            if (_local2 !== _arg1){
                this._1479816687allPlayersInfoWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allPlayersInfoWindow", _local2, _arg1));
                };
            };
        }
        public function get fakeImg():SmoothBitmapImage{
            return (this._1084978130fakeImg);
        }
        public function set fakeImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1084978130fakeImg;
            if (_local2 !== _arg1){
                this._1084978130fakeImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fakeImg", _local2, _arg1));
                };
            };
        }
        public function get roomItemGroup():Group{
            return (this._357426321roomItemGroup);
        }
        public function set roomItemGroup(_arg1:Group):void{
            var _local2:Object = this._357426321roomItemGroup;
            if (_local2 !== _arg1){
                this._357426321roomItemGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomItemGroup", _local2, _arg1));
                };
            };
        }
        public function get roomScrollerCp():Scroller{
            return (this._902274434roomScrollerCp);
        }
        public function set roomScrollerCp(_arg1:Scroller):void{
            var _local2:Object = this._902274434roomScrollerCp;
            if (_local2 !== _arg1){
                this._902274434roomScrollerCp = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomScrollerCp", _local2, _arg1));
                };
            };
        }
        public function get roomsBg():SmoothBitmapImage{
            return (this._1379911005roomsBg);
        }
        public function set roomsBg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1379911005roomsBg;
            if (_local2 !== _arg1){
                this._1379911005roomsBg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomsBg", _local2, _arg1));
                };
            };
        }
        public function get viewMenu():RoomsListTabWindow{
            return (this._1195633060viewMenu);
        }
        public function set viewMenu(_arg1:RoomsListTabWindow):void{
            var _local2:Object = this._1195633060viewMenu;
            if (_local2 !== _arg1){
                this._1195633060viewMenu = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewMenu", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
