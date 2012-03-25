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
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import source_manager.*;
    import spark.layouts.*;
    import spark.filters.*;
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
	use namespace mx_internal;
    public class RoomWindowViewerArea extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _RoomWindowViewerArea_CommonMiddleFrame1:CommonMiddleFrame;
        public var _RoomWindowViewerArea_CommonOuterFrame1:CommonOuterFrame;
        private var _2055795175beViewerBtn:Button;
        private var _2131590956itemGroup:Group;
        private var _66803271scrollerCp:Scroller;
        private var _1349545377viewerText:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var itemHeight:Number = 86;
        private var itemArray:Array;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function RoomWindowViewerArea(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.itemArray = new Array();
            this._embed_mxml_source_commonUI____png_1538356188 = RoomWindowViewerArea__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._RoomWindowViewerArea_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_RoomWindowViewerAreaWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                //return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 197;
            this.height = 632;
            this.layout = this._RoomWindowViewerArea_BasicLayout1_c();
            this.mxmlContent = [this._RoomWindowViewerArea_CommonOuterFrame1_i(), this._RoomWindowViewerArea_CommonMiddleFrame1_i(), this._RoomWindowViewerArea_SmoothBitmapImage1_c(), this._RoomWindowViewerArea_SmoothBitmapImage2_i(), this._RoomWindowViewerArea_Scroller1_i(), this._RoomWindowViewerArea_Button1_i()];
            this.addEventListener("creationComplete", this.___RoomWindowViewerArea_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            RoomWindowViewerArea._watcherSetupUtil = _arg1;
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
        public function addViewer(_arg1:Object, _arg2:Boolean, _arg3:Boolean):RoomWindowViewerAreaItem{
            var _local4:RoomWindowViewerAreaItem = new RoomWindowViewerAreaItem();
            _local4.y = (this.itemArray.length * this.itemHeight);
            this.itemArray.push(_local4);
            this.itemGroup.addElement(_local4);
            _arg1["viewer_number"] = this.itemArray.length;
            _local4.viewInfo = _arg1;
            _local4.isMeFlag = _arg2;
            _local4.isMainUserWindow = _arg3;
            this.rejustAllItemPos();
            return (_local4);
        }
        public function removeViewer(_arg1:String):Object{
            var _local2:Object;
            var _local3:RoomWindowViewerAreaItem = this.getViewerItemByName(_arg1);
            if (_local3){
                _local2 = {
                    info:_local3.viewInfo,
                    isMeFlag:_local3.isMeFlag,
                    isMainUserWindow:_local3.isMainUserWindow
                };
                this.itemGroup.removeElement(_local3);
                this.itemArray.splice(this.itemArray.indexOf(_local3), 1);
            };
            this.rejustAllItemPos();
            return (_local2);
        }
        public function setRoomOwner(_arg1:String):void{
            var _local2:RoomWindowViewerAreaItem = this.getViewerItemByName(_arg1);
            if (_local2){
                _local2.isMainUserWindow = true;
            };
        }
        public function changeViewerState(_arg1:String, _arg2:String, _arg3:String=null):void{
            var _local4:RoomWindowViewerAreaItem = this.getViewerItemByName(_arg1);
            if (_local4){
                _local4.changeViewerState(_arg2, _arg3);
            };
        }
        private function getViewerItemByName(_arg1:String):RoomWindowViewerAreaItem{
            var _local3:RoomWindowViewerAreaItem;
            var _local2:int;
            while (_local2 < this.itemArray.length) {
                _local3 = (this.itemArray[_local2] as RoomWindowViewerAreaItem);
                if (_local3.viewInfo.name == _arg1){
                    return (_local3);
                };
                _local2++;
            };
            return (null);
        }
        private function rejustAllItemPos():void{
            var _local2:RoomWindowViewerAreaItem;
            var _local1:int;
            while (_local1 < this.itemArray.length) {
                _local2 = (this.itemArray[_local1] as RoomWindowViewerAreaItem);
                _local2.viewInfo["viewer_number"] = (_local1 + 1);
                _local2.moveYpos((this.itemHeight * _local1));
                _local2.refreshNumber();
                _local1++;
            };
        }
        public function reset():void{
            var _local1:int = this.itemGroup.numElements;
            var _local2:int;
            while (_local2 < _local1) {
                this.itemGroup.removeElementAt(0);
                _local2++;
            };
            this.itemArray = new Array();
        }
        protected function scroller1_mouseWheelHandler(_arg1:MouseEvent):void{
            _arg1.preventDefault();
            var _local2:Number = ((_arg1.delta < 0)) ? this.itemHeight : -(this.itemHeight);
            this.itemGroup.verticalScrollPosition = (this.itemGroup.verticalScrollPosition + _local2);
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.viewerText.source = RoomWindowSourceMgr.getInstance().getSourceClass("viewerText");
        }
        protected function beViewerBtn_clickHandler(_arg1:MouseEvent):void{
            LuaAgent.getInstance().run("u.hall_room_mgr:player_change_seat(false)");
        }
        public function setBeViewerBtnEnabled(_arg1:Boolean):void{
            if (this.beViewerBtn.enabled != _arg1){
                this.beViewerBtn.enabled = _arg1;
            };
        }
        private function _RoomWindowViewerArea_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowViewerArea_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.x = -10;
            _local1.filters = [this._RoomWindowViewerArea_DropShadowFilter1_c()];
            _local1.id = "_RoomWindowViewerArea_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._RoomWindowViewerArea_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_RoomWindowViewerArea_CommonOuterFrame1", this._RoomWindowViewerArea_CommonOuterFrame1);
            return (_local1);
        }
        private function _RoomWindowViewerArea_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 10;
            _local1.alpha = 0.4;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowViewerArea_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = -10;
            _local1.y = 48;
            _local1.alpha = 0.5;
            _local1.id = "_RoomWindowViewerArea_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._RoomWindowViewerArea_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_RoomWindowViewerArea_CommonMiddleFrame1", this._RoomWindowViewerArea_CommonMiddleFrame1);
            return (_local1);
        }
        private function _RoomWindowViewerArea_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = -10;
            _local1.y = 17;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowViewerArea_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 17;
            _local1.y = 12;
            _local1.initialized(this, "viewerText");
            this.viewerText = _local1;
            BindingManager.executeBindings(this, "viewerText", this.viewerText);
            return (_local1);
        }
        private function _RoomWindowViewerArea_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 4;
            _local1.y = 56;
            _local1.width = 183;
            _local1.height = 557;
            _local1.viewport = this._RoomWindowViewerArea_Group2_i();
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
        private function _RoomWindowViewerArea_Group2_i():Group{
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
        private function _RoomWindowViewerArea_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.label = "参与观战";
            _local1.x = 111;
            _local1.y = 17;
            _local1.width = 77;
            _local1.height = 27;
            _local1.enabled = false;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__beViewerBtn_click);
            _local1.id = "beViewerBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.beViewerBtn = _local1;
            BindingManager.executeBindings(this, "beViewerBtn", this.beViewerBtn);
            return (_local1);
        }
        public function __beViewerBtn_click(_arg1:MouseEvent):void{
            this.beViewerBtn_clickHandler(_arg1);
        }
        public function ___RoomWindowViewerArea_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _RoomWindowViewerArea_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Array{
                var _local1:* = [207, 632];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RoomWindowViewerArea_CommonOuterFrame1.size");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [196, 572];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RoomWindowViewerArea_CommonMiddleFrame1.size");
            return (result);
        }
        public function get beViewerBtn():Button{
            return (this._2055795175beViewerBtn);
        }
        public function set beViewerBtn(_arg1:Button):void{
            var _local2:Object = this._2055795175beViewerBtn;
            if (_local2 !== _arg1){
                this._2055795175beViewerBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "beViewerBtn", _local2, _arg1));
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
        public function get viewerText():SmoothBitmapImage{
            return (this._1349545377viewerText);
        }
        public function set viewerText(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1349545377viewerText;
            if (_local2 !== _arg1){
                this._1349545377viewerText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewerText", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
