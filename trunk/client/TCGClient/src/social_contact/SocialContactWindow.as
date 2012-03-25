//Created by Action Script Viewer - http://www.buraks.com/asv
package social_contact {
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
    import spark.effects.*;
    import spark.filters.*;
    import custom_effect.*;
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

    public class SocialContactWindow extends AutoDepthGroup implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _SocialContactWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _SocialContactWindow_CommonOuterFrame1:CommonOuterFrame;
        private var _1422541317addBtn:Button;
        private var _413245038addEffect:Fade;
        private var _2131590956itemGroup:VGroup;
        private var _1282346808removeBtn:Button;
        private var _66803271scrollerCp:Scroller;
        private var _1709687781tabWindow:CommonTabWindow;
        private var __moduleFactoryInitialized:Boolean = false;
        private var allSocialContactInfo:Object;
        private var addUserWindow:SocialContactAddUserWindow;
        private var _932962275currentDisplayType:String = "friends";
        private var addEffectEnd:Boolean = false;
        private var itemGroupCreationHasComplete:Boolean = false;
        private var currentSelectItem:SocialContactWindowItem;
        private var itemSourcePool:Array;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function SocialContactWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.itemSourcePool = new Array();
            this._embed_mxml_source_commonUI____png_1538356188 = SocialContactWindow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._SocialContactWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_social_contact_SocialContactWindowWatcherSetupUtil");
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
            this.width = 240;
            this.height = 440;
            this.mxmlContent = [this._SocialContactWindow_CommonOuterFrame1_i(), this._SocialContactWindow_CommonMiddleFrame1_i(), this._SocialContactWindow_SmoothBitmapImage1_c(), this._SocialContactWindow_Label1_c(), this._SocialContactWindow_CloseSignBtn1_c(), this._SocialContactWindow_CommonTabWindow1_i(), this._SocialContactWindow_Rect1_c(), this._SocialContactWindow_Scroller1_i(), this._SocialContactWindow_Button1_i(), this._SocialContactWindow_Button2_i()];
            this._SocialContactWindow_Fade1_i();
            this.addEventListener("remove", this.___SocialContactWindow_AutoDepthGroup1_remove);
            this.addEventListener("mouseUp", this.___SocialContactWindow_AutoDepthGroup1_mouseUp);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            SocialContactWindow._watcherSetupUtil = _arg1;
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
        protected function tabWindow_clickHandler(_arg1:MouseEvent):void{
            var _local2:String = this.translateType(this.tabWindow.selectItemText);
            if (this.currentDisplayType != _local2){
                this.currentDisplayType = _local2;
                this.removeAddUserWindow();
                this.buildAllItem();
            };
        }
        protected function itemGroup_creationCompleteHandler(_arg1:FlexEvent):void{
            this.itemGroupCreationHasComplete = true;
            this.buildAllItem();
        }
        protected function addEffect_effectEndHandler(_arg1:EffectEvent):void{
            this.addEffectEnd = true;
            LuaAgent.getInstance().run("return u.social_contact_mgr:get_all_social_contact_info()");
        }
        private function translateType(_arg1:String):String{
            switch (_arg1){
                case "friends":
                    return ("我的好友");
                case "ignore":
                    return ("忽略名单");
                case "我的好友":
                    return ("friends");
                default:
                    return ("ignore");
            };
        }
        public function setAllSocialContactInfo(_arg1:Object):void{
            this.allSocialContactInfo = _arg1;
            this.buildAllItem();
        }
        private function buildAllItem():void{
            var _local1:String;
            var _local2:Object;
            var _local3:Array;
            var _local4:Object;
            var _local5:int;
            var _local6:int;
            var _local7:SocialContactWindowItem;
            var _local8:int;
            if (((((this.addEffectEnd) && (this.itemGroupCreationHasComplete))) && (this.allSocialContactInfo))){
                _local1 = (this.currentSelectItem) ? this.currentSelectItem.userInfo["name"] : null;
                this.setSelected(null);
                _local2 = (this.allSocialContactInfo[this.currentDisplayType]) ? this.allSocialContactInfo[this.currentDisplayType] : new Object();
                _local3 = new Array();
                for each (_local4 in _local2) {
                    _local3.push(_local4);
                };
                _local3.sortOn(["is_online", "level", "name"], [Array.DESCENDING, (Array.NUMERIC | Array.DESCENDING), 0]);
                _local5 = this.itemGroup.numElements;
                _local6 = _local3.length;
                _local8 = 0;
                while (_local8 < _local6) {
                    _local7 = ((_local8 < _local5)) ? (this.itemGroup.getElementAt(_local8) as SocialContactWindowItem) : this.createOneItem();
                    _local7.userInfo = _local3[_local8];
                    if (_local7.userInfo["name"] == _local1){
                        this.setSelected(_local7);
                    };
                    _local8++;
                };
                _local8 = 0;
                while (_local8 < (_local5 - _local6)) {
                    _local7 = (this.itemGroup.removeElementAt((this.itemGroup.numElements - 1)) as SocialContactWindowItem);
                    this.itemSourcePool.push(_local7);
                    _local8++;
                };
            };
        }
        private function createOneItem():SocialContactWindowItem{
            var _local1:SocialContactWindowItem;
            if (this.itemSourcePool.length){
                _local1 = this.itemSourcePool.pop();
            } else {
                _local1 = new SocialContactWindowItem();
                _local1.addEventListener(MouseEvent.CLICK, this.itemClickHandler);
            };
            this.itemGroup.addElement(_local1);
            return (_local1);
        }
        private function itemClickHandler(_arg1:MouseEvent):void{
            this.setSelected((_arg1.currentTarget as SocialContactWindowItem));
        }
        private function setSelected(_arg1:SocialContactWindowItem):void{
            if (_arg1 == this.currentSelectItem){
                return;
            };
            if (this.currentSelectItem){
                this.currentSelectItem.isSelected = false;
            };
            this.currentSelectItem = _arg1;
            if (this.currentSelectItem){
                this.currentSelectItem.isSelected = true;
            };
        }
        public function friendRefresh(_arg1:Object):void{
            if (!this.allSocialContactInfo){
                return;
            };
            this.allSocialContactInfo["friends"][_arg1["name"]] = _arg1;
            this.buildAllItem();
        }
        public function friendRemoved(_arg1:String):void{
            if (!this.allSocialContactInfo){
                return;
            };
            delete this.allSocialContactInfo["friends"][_arg1];
            this.buildAllItem();
        }
        public function ignoreAdded(_arg1:Object):void{
            if (!this.allSocialContactInfo){
                return;
            };
            this.allSocialContactInfo["ignore"][_arg1["name"]] = _arg1;
            this.buildAllItem();
        }
        public function ignoreRemoved(_arg1:String):void{
            if (!this.allSocialContactInfo){
                return;
            };
            delete this.allSocialContactInfo["ignore"][_arg1];
            this.buildAllItem();
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function button1_clickHandler(_arg1:MouseEvent):void{
            if (((!(this.addUserWindow)) || (!(this.addUserWindow.parent)))){
                this.addUserWindow = new SocialContactAddUserWindow((this.currentDisplayType == "friends"));
                this.addUserWindow.x = (this.addBtn.x - 20);
                this.addUserWindow.y = ((this.addBtn.y - this.addUserWindow.height) - 10);
                addElement(this.addUserWindow);
            } else {
                this.removeAddUserWindow();
            };
        }
        private function removeAddUserWindow():void{
            var _local1:*;
            if (this.addUserWindow){
                _local1 = this.addUserWindow.parent;
                if (_local1){
                    _local1.removeElement(this.addUserWindow);
                };
            };
        }
        protected function button2_clickHandler(_arg1:MouseEvent):void{
            var event:* = _arg1;
            if (!this.currentSelectItem){
                MessageBox.showMessageBox(MessageBox.NOTICE, "提示", "请先在列表选择一个玩家。");
                return;
            };
            if (this.currentDisplayType == "friends"){
                var deleteFriendFunc:* = function (_arg1:Array):Boolean{
                    if (_arg1[0] == true){
                        SocialContactMgr.getInstance().tryRemoveFriend(currentSelectItem.userInfo["name"]);
                    };
                    return (true);
                };
                MessageBox.showMessageBox(MessageBox.SELECT, "提示", (("是否确认从好友列表中删除“" + this.currentSelectItem.userInfo["name"]) + "”？"), deleteFriendFunc);
            } else {
                var deleteIgnoreFunc:* = function (_arg1:Array):Boolean{
                    if (_arg1[0] == true){
                        SocialContactMgr.getInstance().tryRemoveIgnore(currentSelectItem.userInfo["name"]);
                    };
                    return (true);
                };
                MessageBox.showMessageBox(MessageBox.SELECT, "提示", (("是否确认从忽略列表中删除“" + this.currentSelectItem.userInfo["name"]) + "”？"), deleteIgnoreFunc);
            };
        }
        protected function superdraggroup1_removeHandler(_arg1:FlexEvent):void{
            var _local2:FakeFadeEffect = new FakeFadeEffect(this, 300, 1, 0);
            _local2.effectContainer.depth = depth;
            _local2.play();
        }
        private function _SocialContactWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 300;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.addEffect_effectEndHandler(_arg1);
        }
        private function _SocialContactWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.alpha = 0.9;
            _local1.mouseEnabled = true;
            _local1.filters = [this._SocialContactWindow_DropShadowFilter1_c()];
            _local1.addEventListener("mouseDown", this.___SocialContactWindow_CommonOuterFrame1_mouseDown);
            _local1.id = "_SocialContactWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._SocialContactWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_SocialContactWindow_CommonOuterFrame1", this._SocialContactWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _SocialContactWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___SocialContactWindow_CommonOuterFrame1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
        }
        private function _SocialContactWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 15;
            _local1.y = 70;
            _local1.alpha = 0.85;
            _local1.id = "_SocialContactWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._SocialContactWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_SocialContactWindow_CommonMiddleFrame1", this._SocialContactWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _SocialContactWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 17;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SocialContactWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 31;
            _local1.y = 13;
            _local1.text = "好友列表";
            _local1.mouseEnabled = false;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SocialContactWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 4;
            _local1.top = 4;
            _local1.addEventListener("click", this.___SocialContactWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___SocialContactWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        private function _SocialContactWindow_CommonTabWindow1_i():CommonTabWindow{
            var _local1:CommonTabWindow = new CommonTabWindow();
            _local1.x = 15;
            _local1.y = 44;
            _local1.addEventListener("click", this.__tabWindow_click);
            _local1.id = "tabWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tabWindow = _local1;
            BindingManager.executeBindings(this, "tabWindow", this.tabWindow);
            return (_local1);
        }
        public function __tabWindow_click(_arg1:MouseEvent):void{
            this.tabWindow_clickHandler(_arg1);
        }
        private function _SocialContactWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 21;
            _local1.y = 80;
            _local1.alpha = 0.4;
            _local1.width = 198;
            _local1.height = 309;
            _local1.radiusX = 5;
            _local1.radiusY = 5;
            _local1.fill = this._SocialContactWindow_SolidColor1_c();
            _local1.stroke = this._SocialContactWindow_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SocialContactWindow_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SocialContactWindow_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 13156254;
            _local1.weight = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SocialContactWindow_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 31;
            _local1.y = 94;
            _local1.width = 186;
            _local1.maxHeight = 275;
            _local1.viewport = this._SocialContactWindow_VGroup1_i();
            _local1.setStyle("horizontalScrollPolicy", "off");
            _local1.id = "scrollerCp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scrollerCp = _local1;
            BindingManager.executeBindings(this, "scrollerCp", this.scrollerCp);
            return (_local1);
        }
        private function _SocialContactWindow_VGroup1_i():VGroup{
            var _local1:VGroup = new VGroup();
            _local1.gap = 0;
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
        private function _SocialContactWindow_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.left = 30;
            _local1.bottom = 10;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__addBtn_click);
            _local1.id = "addBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.addBtn = _local1;
            BindingManager.executeBindings(this, "addBtn", this.addBtn);
            return (_local1);
        }
        public function __addBtn_click(_arg1:MouseEvent):void{
            this.button1_clickHandler(_arg1);
        }
        private function _SocialContactWindow_Button2_i():Button{
            var _local1:Button = new Button();
            _local1.right = 30;
            _local1.bottom = 10;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__removeBtn_click);
            _local1.id = "removeBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.removeBtn = _local1;
            BindingManager.executeBindings(this, "removeBtn", this.removeBtn);
            return (_local1);
        }
        public function __removeBtn_click(_arg1:MouseEvent):void{
            this.button2_clickHandler(_arg1);
        }
        public function ___SocialContactWindow_AutoDepthGroup1_remove(_arg1:FlexEvent):void{
            this.superdraggroup1_removeHandler(_arg1);
        }
        public function ___SocialContactWindow_AutoDepthGroup1_mouseUp(_arg1:MouseEvent):void{
            this.stopDrag();
        }
        private function _SocialContactWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [240, 440];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_SocialContactWindow_CommonOuterFrame1.size");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [210, 325];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_SocialContactWindow_CommonMiddleFrame1.size");
            result[3] = new Binding(this, function ():Array{
                var _local1:* = ["我的好友", "忽略名单"];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "tabWindow.tabItemDataProvider");
            result[4] = new Binding(this, function ():String{
                var _local1:* = ((currentDisplayType == "friends")) ? "添加好友" : "添加忽略";
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "addBtn.label");
            result[5] = new Binding(this, function ():String{
                var _local1:* = ((currentDisplayType == "friends")) ? "删除好友" : "删除忽略";
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "removeBtn.label");
            return (result);
        }
        public function get addBtn():Button{
            return (this._1422541317addBtn);
        }
        public function set addBtn(_arg1:Button):void{
            var _local2:Object = this._1422541317addBtn;
            if (_local2 !== _arg1){
                this._1422541317addBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addBtn", _local2, _arg1));
                };
            };
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
        public function get itemGroup():VGroup{
            return (this._2131590956itemGroup);
        }
        public function set itemGroup(_arg1:VGroup):void{
            var _local2:Object = this._2131590956itemGroup;
            if (_local2 !== _arg1){
                this._2131590956itemGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup", _local2, _arg1));
                };
            };
        }
        public function get removeBtn():Button{
            return (this._1282346808removeBtn);
        }
        public function set removeBtn(_arg1:Button):void{
            var _local2:Object = this._1282346808removeBtn;
            if (_local2 !== _arg1){
                this._1282346808removeBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeBtn", _local2, _arg1));
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
        public function get tabWindow():CommonTabWindow{
            return (this._1709687781tabWindow);
        }
        public function set tabWindow(_arg1:CommonTabWindow):void{
            var _local2:Object = this._1709687781tabWindow;
            if (_local2 !== _arg1){
                this._1709687781tabWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabWindow", _local2, _arg1));
                };
            };
        }
        private function get currentDisplayType():String{
            return (this._932962275currentDisplayType);
        }
        private function set currentDisplayType(_arg1:String):void{
            var _local2:Object = this._932962275currentDisplayType;
            if (_local2 !== _arg1){
                this._932962275currentDisplayType = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentDisplayType", _local2, _arg1));
                };
            };
        }

    }
}//package social_contact 
