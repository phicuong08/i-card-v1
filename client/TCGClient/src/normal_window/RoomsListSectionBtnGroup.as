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
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import source_manager.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import custom_effect.*;
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

    public class RoomsListSectionBtnGroup extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1020166578fadeInEffect:Fade;
        private var _205971323sectionBeginnerBtn:ClickScaleButton;
        private var _113912356sectionForthBtn:ClickScaleButton;
        private var _1800186036sectionOfficialBtn:ClickScaleButton;
        private var __moduleFactoryInitialized:Boolean = false;
        private var selectRoomTypeTitle:String = "新手区";
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function RoomsListSectionBtnGroup(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._RoomsListSectionBtnGroup_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_RoomsListSectionBtnGroupWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (RoomsListSectionBtnGroup[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.depth = 10;
            this.layout = this._RoomsListSectionBtnGroup_BasicLayout1_c();
            this.mxmlContent = [this._RoomsListSectionBtnGroup_Rect1_c(), this._RoomsListSectionBtnGroup_VGroup1_c()];
            this._RoomsListSectionBtnGroup_Fade1_i();
            this.addEventListener("creationComplete", this.___RoomsListSectionBtnGroup_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            RoomsListSectionBtnGroup._watcherSetupUtil = _arg1;
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
        public function removeSelf():void{
            var f:* = null;
            var endHandler:* = null;
            var p:* = parent;
            if (p){
                endHandler = function (_arg1:CustomEffectEvent):void{
                    f.removeEventListener(CustomEffectEvent.END, endHandler);
                    RoomsList.getInstance().viewMenu.selectItemText = selectRoomTypeTitle;
                };
                f = new FakeFadeEffect(this, 300, 1, 0);
                f.play();
                f.addEventListener(CustomEffectEvent.END, endHandler);
                p.removeElement(this);
            };
        }
        public function selectRoomSection(_arg1:String):void{
            this.selectRoomTypeTitle = _arg1;
            this.removeSelf();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            var stageChangeHandler:* = null;
            var event:* = _arg1;
            stageChangeHandler = function (_arg1):void{
                TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stageChangeHandler);
                removeSelf();
            };
            TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stageChangeHandler);
        }
        private function _RoomsListSectionBtnGroup_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 500;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        private function _RoomsListSectionBtnGroup_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsListSectionBtnGroup_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.fill = this._RoomsListSectionBtnGroup_SolidColor1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsListSectionBtnGroup_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            _local1.alpha = 0.6;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsListSectionBtnGroup_VGroup1_c():VGroup{
            var _local1:VGroup = new VGroup();
            _local1.gap = 30;
            _local1.horizontalCenter = 0;
            _local1.verticalCenter = 0;
            _local1.filters = [this._RoomsListSectionBtnGroup_DropShadowFilter1_c()];
            _local1.mxmlContent = [this._RoomsListSectionBtnGroup_ClickScaleButton1_i(), this._RoomsListSectionBtnGroup_ClickScaleButton2_i(), this._RoomsListSectionBtnGroup_ClickScaleButton3_i()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsListSectionBtnGroup_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.color = 0;
            _local1.distance = 5;
            _local1.alpha = 0.7;
            _local1.quality = 4;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsListSectionBtnGroup_ClickScaleButton1_i():ClickScaleButton{
            var _local1:ClickScaleButton;
            _local1 = new ClickScaleButton();
            _local1.buttonMode = true;
            _local1.toolTip = "适合新手玩家的对战区，只有#o20级以内#n的玩家才能加入。";
            _local1.addEventListener("click", this.__sectionBeginnerBtn_click);
            _local1.addEventListener("initialize", this.__sectionBeginnerBtn_initialize);
            _local1.id = "sectionBeginnerBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.sectionBeginnerBtn = _local1;
            BindingManager.executeBindings(this, "sectionBeginnerBtn", this.sectionBeginnerBtn);
            return (_local1);
        }
        public function __sectionBeginnerBtn_click(_arg1:MouseEvent):void{
            this.selectRoomSection("新手区");
        }
        public function __sectionBeginnerBtn_initialize(_arg1:FlexEvent):void{
            this.sectionBeginnerBtn.buttonImage = RoomsListSourceMgr.getInstance().getSourceClass("sectionBeginnerBtn");
        }
        private function _RoomsListSectionBtnGroup_ClickScaleButton2_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.buttonMode = true;
            _local1.toolTip = "加入该区房间需要#o8级以上#n，且参战卡组数目需在#o40到80#n之间。正式区中对战失败将被#r扣除一定积分#n！";
            _local1.addEventListener("click", this.__sectionOfficialBtn_click);
            _local1.addEventListener("initialize", this.__sectionOfficialBtn_initialize);
            _local1.id = "sectionOfficialBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.sectionOfficialBtn = _local1;
            BindingManager.executeBindings(this, "sectionOfficialBtn", this.sectionOfficialBtn);
            return (_local1);
        }
        public function __sectionOfficialBtn_click(_arg1:MouseEvent):void{
            this.selectRoomSection("正式区");
        }
        public function __sectionOfficialBtn_initialize(_arg1:FlexEvent):void{
            this.sectionOfficialBtn.buttonImage = RoomsListSourceMgr.getInstance().getSourceClass("sectionOfficialBtn");
        }
        private function _RoomsListSectionBtnGroup_ClickScaleButton3_i():ClickScaleButton{
            var _local1:ClickScaleButton = new ClickScaleButton();
            _local1.buttonMode = true;
            _local1.toolTip = "在该区房间中战斗将#r没有收益#n，参战卡组数目需在#o40到80之间#n。";
            _local1.addEventListener("click", this.__sectionForthBtn_click);
            _local1.addEventListener("initialize", this.__sectionForthBtn_initialize);
            _local1.id = "sectionForthBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.sectionForthBtn = _local1;
            BindingManager.executeBindings(this, "sectionForthBtn", this.sectionForthBtn);
            return (_local1);
        }
        public function __sectionForthBtn_click(_arg1:MouseEvent):void{
            this.selectRoomSection("自由区");
        }
        public function __sectionForthBtn_initialize(_arg1:FlexEvent):void{
            this.sectionForthBtn.buttonImage = RoomsListSourceMgr.getInstance().getSourceClass("sectionFreedomBtn");
        }
        public function ___RoomsListSectionBtnGroup_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _RoomsListSectionBtnGroup_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeInEffect");
            return (result);
        }
        public function get fadeInEffect():Fade{
            return (this._1020166578fadeInEffect);
        }
        public function set fadeInEffect(_arg1:Fade):void{
            var _local2:Object = this._1020166578fadeInEffect;
            if (_local2 !== _arg1){
                this._1020166578fadeInEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeInEffect", _local2, _arg1));
                };
            };
        }
        public function get sectionBeginnerBtn():ClickScaleButton{
            return (this._205971323sectionBeginnerBtn);
        }
        public function set sectionBeginnerBtn(_arg1:ClickScaleButton):void{
            var _local2:Object = this._205971323sectionBeginnerBtn;
            if (_local2 !== _arg1){
                this._205971323sectionBeginnerBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sectionBeginnerBtn", _local2, _arg1));
                };
            };
        }
        public function get sectionForthBtn():ClickScaleButton{
            return (this._113912356sectionForthBtn);
        }
        public function set sectionForthBtn(_arg1:ClickScaleButton):void{
            var _local2:Object = this._113912356sectionForthBtn;
            if (_local2 !== _arg1){
                this._113912356sectionForthBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sectionForthBtn", _local2, _arg1));
                };
            };
        }
        public function get sectionOfficialBtn():ClickScaleButton{
            return (this._1800186036sectionOfficialBtn);
        }
        public function set sectionOfficialBtn(_arg1:ClickScaleButton):void{
            var _local2:Object = this._1800186036sectionOfficialBtn;
            if (_local2 !== _arg1){
                this._1800186036sectionOfficialBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sectionOfficialBtn", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
