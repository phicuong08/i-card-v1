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
    import spark.events.*;
    import mx.binding.*;
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import source_manager.*;
    import spark.effects.*;
    import train_system.*;
    import spark.layouts.*;
    import custom_effect.*;
    import mx.collections.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import combat_element_script.*;
    import player_view.*;
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

    public class RoomWindowNpcTrainArea extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var _2086216067btnGroup:Group;
        private var _897901840btnGroupFadeEffect:Fade;
        private var _1901031789inviteBtn:ClickScaleButton;
        private var _2141295713npcHead:MyImage;
        private var _2141419295npcList:ComboBox;
        private var _1403198902startTrainBtn:ClickScaleButton;
        private var _1276081972trainBtn:ClickScaleButton;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _2065192851npcListInfo:ArrayCollection;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function RoomWindowNpcTrainArea(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._2065192851npcListInfo = new ArrayCollection();
            this._embed_mxml_source_commonUI____png_1538356188 = RoomWindowNpcTrainArea__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._RoomWindowNpcTrainArea_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_RoomWindowNpcTrainAreaWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (RoomWindowNpcTrainArea[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 617;
            this.height = 321;
            this.layout = this._RoomWindowNpcTrainArea_BasicLayout1_c();
            this.mxmlContent = [this._RoomWindowNpcTrainArea_Rect1_c(), this._RoomWindowNpcTrainArea_CommonOuterFrame1_c(), this._RoomWindowNpcTrainArea_CommonMiddleFrame1_c(), this._RoomWindowNpcTrainArea_SmoothBitmapImage1_c(), this._RoomWindowNpcTrainArea_Label1_c(), this._RoomWindowNpcTrainArea_MyImage1_i(), this._RoomWindowNpcTrainArea_CommonHeadImageFrame1_c(), this._RoomWindowNpcTrainArea_Label2_c(), this._RoomWindowNpcTrainArea_Label3_c(), this._RoomWindowNpcTrainArea_ComboBox1_i(), this._RoomWindowNpcTrainArea_ClickScaleButton1_i(), this._RoomWindowNpcTrainArea_Group2_i()];
            this._RoomWindowNpcTrainArea_Fade1_i();
            this._RoomWindowNpcTrainArea_Fade2_i();
            this.addEventListener("remove", this.___RoomWindowNpcTrainArea_Group1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            RoomWindowNpcTrainArea._watcherSetupUtil = _arg1;
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
        protected function refreshTrainList():void{
            var _local3:int;
            var _local1:Array = UserObject.activeTrainList;
            this.npcListInfo.disableAutoUpdate();
            this.npcListInfo.removeAll();
            var _local2:int;
            while (_local2 < _local1.length) {
                _local3 = _local1[_local2];
                this.npcListInfo.addItem({
                    label:TrainSystem.getInstance().getTrainName(_local3),
                    section:_local3
                });
                _local2++;
            };
            this.npcListInfo.enableAutoUpdate();
            if (this.npcList){
                this.npcList.selectedIndex = 0;
                this.setNpcHeadImg();
            };
        }
        protected function button1_clickHandler(_arg1:MouseEvent):void{
            if (((this.npcList.selectedItem) && (this.npcListInfo.contains(this.npcList.selectedItem)))){
                RoomWindow.getInstance().tryStartRoomTrain(this.npcList.selectedItem.section);
            } else {
                MessageBox.showMessageBox(MessageBox.NOTICE, "提醒：", "请正确选择一项训练！");
            };
        }
        protected function group1_removeHandler(_arg1:FlexEvent):void{
            var _local2:FakeFadeEffect = new FakeFadeEffect(this, 300, 1, 0);
            _local2.play();
            this.btnGroup.alpha = 1;
            this.btnGroup.visible = true;
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function setNpcHeadImg():void{
            if (((this.npcList.selectedItem) && (this.npcListInfo.contains(this.npcList.selectedItem)))){
                this.npcHead.source = TrainSystem.getInstance().getTrainHeadInfo(this.npcList.selectedItem.section)[0].headIcon;
            };
        }
        private function _RoomWindowNpcTrainArea_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.refreshTrainList();
        }
        private function _RoomWindowNpcTrainArea_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            _local1.duration = 300;
            _local1.addEventListener("effectEnd", this.__btnGroupFadeEffect_effectEnd);
            this.btnGroupFadeEffect = _local1;
            BindingManager.executeBindings(this, "btnGroupFadeEffect", this.btnGroupFadeEffect);
            return (_local1);
        }
        public function __btnGroupFadeEffect_effectEnd(_arg1:EffectEvent):void{
            this.btnGroup.visible = false;
        }
        private function _RoomWindowNpcTrainArea_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.width = 617;
            _local1.height = 321;
            _local1.fill = this._RoomWindowNpcTrainArea_SolidColor1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 1511949;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_CommonOuterFrame1_c():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.width = 617;
            _local1.height = 321;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_CommonMiddleFrame1_c():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 12;
            _local1.y = 48;
            _local1.width = 593;
            _local1.height = 262;
            _local1.alpha = 0.5;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = -8;
            _local1.y = 23;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 30;
            _local1.y = 13;
            _local1.text = "房间训练";
            _local1.mouseEnabled = false;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 31;
            _local1.y = 58.5;
            _local1.width = 240;
            _local1.height = 240;
            _local1.id = "npcHead";
            if (!_local1.document){
                _local1.document = this;
            };
            this.npcHead = _local1;
            BindingManager.executeBindings(this, "npcHead", this.npcHead);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_CommonHeadImageFrame1_c():CommonHeadImageFrame{
            var _local1:CommonHeadImageFrame = new CommonHeadImageFrame();
            _local1.x = 29;
            _local1.y = 57;
            _local1.width = 244;
            _local1.height = 243;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_Label2_c():Label{
            var _local1:Label = new Label();
            _local1.x = 314;
            _local1.y = 90;
            _local1.text = "等待其他玩家时，可以先和 NPC 进行训练";
            _local1.setStyle("color", 14466179);
            _local1.setStyle("fontSize", 14);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_Label3_c():Label{
            var _local1:Label = new Label();
            _local1.x = 314;
            _local1.y = 119;
            _local1.text = "训练时若有对战玩家加入，则会打断训练，\r并直接开始与该玩家的决斗。";
            _local1.setStyle("color", 16725799);
            _local1.setStyle("fontSize", 14);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_ComboBox1_i():ComboBox{
            var _local1:ComboBox = new ComboBox();
            _local1.x = 370;
            _local1.y = 175;
            _local1.setStyle("fontSize", 14);
            _local1.addEventListener("focusIn", this.__npcList_focusIn);
            _local1.addEventListener("change", this.__npcList_change);
            _local1.id = "npcList";
            if (!_local1.document){
                _local1.document = this;
            };
            this.npcList = _local1;
            BindingManager.executeBindings(this, "npcList", this.npcList);
            return (_local1);
        }
        public function __npcList_focusIn(_arg1:FocusEvent):void{
            IME.enabled = true;
        }
        public function __npcList_change(_arg1:IndexChangeEvent):void{
            this.setNpcHeadImg();
        }
        private function _RoomWindowNpcTrainArea_ClickScaleButton1_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.x = 320;
            _local1.y = 225;
            _local1.addEventListener("initialize", this.__startTrainBtn_initialize);
            _local1.addEventListener("click", this.__startTrainBtn_click);
            _local1.id = "startTrainBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.startTrainBtn = _local1;
            BindingManager.executeBindings(this, "startTrainBtn", this.startTrainBtn);
            return (_local1);
        }
        public function __startTrainBtn_initialize(_arg1:FlexEvent):void{
            this.startTrainBtn.buttonImage = RoomWindowSourceMgr.getInstance().getSourceClass("startTrainBtnImg");
        }
        public function __startTrainBtn_click(_arg1:MouseEvent):void{
            this.button1_clickHandler(_arg1);
        }
        private function _RoomWindowNpcTrainArea_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.mxmlContent = [this._RoomWindowNpcTrainArea_Rect2_c(), this._RoomWindowNpcTrainArea_CommonOuterFrame2_c(), this._RoomWindowNpcTrainArea_ClickScaleButton2_i(), this._RoomWindowNpcTrainArea_ClickScaleButton3_i()];
            _local1.id = "btnGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.btnGroup = _local1;
            BindingManager.executeBindings(this, "btnGroup", this.btnGroup);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_Rect2_c():Rect{
            var _local1:Rect = new Rect();
            _local1.width = 617;
            _local1.height = 321;
            _local1.fill = this._RoomWindowNpcTrainArea_SolidColor2_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_SolidColor2_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 1511949;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_CommonOuterFrame2_c():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.width = 617;
            _local1.height = 321;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowNpcTrainArea_ClickScaleButton2_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.x = 12;
            _local1.y = 11;
            _local1.scaleArg = 0.98;
            _local1.addEventListener("initialize", this.__inviteBtn_initialize);
            _local1.addEventListener("click", this.__inviteBtn_click);
            _local1.id = "inviteBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.inviteBtn = _local1;
            BindingManager.executeBindings(this, "inviteBtn", this.inviteBtn);
            return (_local1);
        }
        public function __inviteBtn_initialize(_arg1:FlexEvent):void{
            this.inviteBtn.buttonImage = RoomWindowSourceMgr.getInstance().getSourceClass("inviteBtnImg");
        }
        public function __inviteBtn_click(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().autoShowHideAllHallPlayerWindow();
        }
        private function _RoomWindowNpcTrainArea_ClickScaleButton3_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.x = 12;
            _local1.y = 164;
            _local1.scaleArg = 0.98;
            _local1.addEventListener("initialize", this.__trainBtn_initialize);
            _local1.addEventListener("click", this.__trainBtn_click);
            _local1.id = "trainBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.trainBtn = _local1;
            BindingManager.executeBindings(this, "trainBtn", this.trainBtn);
            return (_local1);
        }
        public function __trainBtn_initialize(_arg1:FlexEvent):void{
            this.trainBtn.buttonImage = RoomWindowSourceMgr.getInstance().getSourceClass("trainBtnImg");
        }
        public function __trainBtn_click(_arg1:MouseEvent):void{
            if (!this.btnGroupFadeEffect.isPlaying){
                this.btnGroupFadeEffect.play();
            };
        }
        public function ___RoomWindowNpcTrainArea_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        private function _RoomWindowNpcTrainArea_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, null, "btnGroupFadeEffect.target", "btnGroup");
            result[2] = new Binding(this, function ():IList{
                return (npcListInfo);
            }, null, "npcList.dataProvider");
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
        public function get btnGroup():Group{
            return (this._2086216067btnGroup);
        }
        public function set btnGroup(_arg1:Group):void{
            var _local2:Object = this._2086216067btnGroup;
            if (_local2 !== _arg1){
                this._2086216067btnGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnGroup", _local2, _arg1));
                };
            };
        }
        public function get btnGroupFadeEffect():Fade{
            return (this._897901840btnGroupFadeEffect);
        }
        public function set btnGroupFadeEffect(_arg1:Fade):void{
            var _local2:Object = this._897901840btnGroupFadeEffect;
            if (_local2 !== _arg1){
                this._897901840btnGroupFadeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnGroupFadeEffect", _local2, _arg1));
                };
            };
        }
        public function get inviteBtn():ClickScaleButton{
            return (this._1901031789inviteBtn);
        }
        public function set inviteBtn(_arg1:ClickScaleButton):void{
            var _local2:Object = this._1901031789inviteBtn;
            if (_local2 !== _arg1){
                this._1901031789inviteBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteBtn", _local2, _arg1));
                };
            };
        }
        public function get npcHead():MyImage{
            return (this._2141295713npcHead);
        }
        public function set npcHead(_arg1:MyImage):void{
            var _local2:Object = this._2141295713npcHead;
            if (_local2 !== _arg1){
                this._2141295713npcHead = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "npcHead", _local2, _arg1));
                };
            };
        }
        public function get npcList():ComboBox{
            return (this._2141419295npcList);
        }
        public function set npcList(_arg1:ComboBox):void{
            var _local2:Object = this._2141419295npcList;
            if (_local2 !== _arg1){
                this._2141419295npcList = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "npcList", _local2, _arg1));
                };
            };
        }
        public function get startTrainBtn():ClickScaleButton{
            return (this._1403198902startTrainBtn);
        }
        public function set startTrainBtn(_arg1:ClickScaleButton):void{
            var _local2:Object = this._1403198902startTrainBtn;
            if (_local2 !== _arg1){
                this._1403198902startTrainBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "startTrainBtn", _local2, _arg1));
                };
            };
        }
        public function get trainBtn():ClickScaleButton{
            return (this._1276081972trainBtn);
        }
        public function set trainBtn(_arg1:ClickScaleButton):void{
            var _local2:Object = this._1276081972trainBtn;
            if (_local2 !== _arg1){
                this._1276081972trainBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "trainBtn", _local2, _arg1));
                };
            };
        }
        private function get npcListInfo():ArrayCollection{
            return (this._2065192851npcListInfo);
        }
        private function set npcListInfo(_arg1:ArrayCollection):void{
            var _local2:Object = this._2065192851npcListInfo;
            if (_local2 !== _arg1){
                this._2065192851npcListInfo = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "npcListInfo", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
