//Created by Action Script Viewer - http://www.buraks.com/asv
package achievement_system {
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
    import source_manager.*;
    import spark.effects.*;
    import spark.filters.*;
    import custom_effect.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
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

    public class AchievementGeneralViewWindow extends AutoDepthGroup implements IBindingClient {
		use namespace mx_internal;
        private static var instance:AchievementGeneralViewWindow;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1691041594achievementListText:SmoothBitmapImage;
        private var _413245038addEffect:Fade;
        private var _2131590956itemGroup:Group;
        private var _66803271scrollerCp:Scroller;
        private var __moduleFactoryInitialized:Boolean = false;
        private var userAchievementObject:Object;
        private var allAchievement:Array;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function AchievementGeneralViewWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.userAchievementObject = new Object();
            this.allAchievement = new Array();
            this._embed_mxml_source_commonUI____png_1538356188 = AchievementGeneralViewWindow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._AchievementGeneralViewWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_achievement_system_AchievementGeneralViewWindowWatcherSetupUtil");
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
            this.x = 287;
            this.y = 69;
            this.width = 705;
            this.height = 662;
            this.mxmlContent = [this._AchievementGeneralViewWindow_CommonOuterFrame1_c(), this._AchievementGeneralViewWindow_CommonMiddleFrame1_c(), this._AchievementGeneralViewWindow_SmoothBitmapImage1_c(), this._AchievementGeneralViewWindow_SmoothBitmapImage2_i(), this._AchievementGeneralViewWindow_CloseSignBtn1_c(), this._AchievementGeneralViewWindow_Scroller1_i()];
            this._AchievementGeneralViewWindow_Fade1_i();
            this.addEventListener("creationComplete", this.___AchievementGeneralViewWindow_AutoDepthGroup1_creationComplete);
            this.addEventListener("remove", this.___AchievementGeneralViewWindow_AutoDepthGroup1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function autoShowHideWindow():void{
            if (((instance) && (instance.parent))){
                instance.removeSelf();
            } else {
                if (TCGClient.getInstance().customCurrentState != "loadingWindow"){
                    instance = new (AchievementGeneralViewWindow)();
                    TCGClient.getInstance().mainGroup.addElement(instance);
                };
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            AchievementGeneralViewWindow._watcherSetupUtil = _arg1;
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
        protected function superdraggroup1_creationCompleteHandler(_arg1:FlexEvent):void{
            var w:* = null;
            var barCompleteHandler:* = null;
            var event:* = _arg1;
            BasicOperationBar.getInstance().registerWeakLeaveFunc(this.removeSelf);
            if (AchievementGeneralViewWindowSourceMgr.getInstance().loadingComplete){
                this.createSeveralItem();
                CommonUtil.addTimerLaterCall(500, this.createRemainAchievementItem);
            } else {
                barCompleteHandler = function (_arg1:Event):void{
                    w.removeEventListener(CommonLoadingBar.BAR_DISPLAY_COMPLETE, barCompleteHandler);
                    removeElement(w);
                    createSeveralItem();
                    createRemainAchievementItem();
                };
                w = new AchievementGeneralViewWindowLoadingBar();
                addElement(w);
                w.addEventListener(CommonLoadingBar.BAR_DISPLAY_COMPLETE, barCompleteHandler);
            };
            TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.removeSelf);
        }
        protected function superdraggroup1_removeHandler(_arg1:FlexEvent):void{
            if (instance == this){
                instance = null;
            };
            TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.removeSelf);
            BasicOperationBar.getInstance().clearWeakLeaveFunc(this.removeSelf);
        }
        public function removeSelf(_arg1=null):void{
            var _local3:FakeFadeEffect;
            var _local2:* = parent;
            if (_local2){
                _local3 = new FakeFadeEffect(this, 500, 1, 0);
                _local3.effectContainer.depth = depth;
                _local3.play();
                _local2.removeElement(this);
            };
        }
        private function createSeveralItem():void{
            var _local2:int;
            var _local3:String;
            var _local4:int;
            var _local5:AchievementGeneralViewItem;
            var _local6:int;
            this.achievementListText.source = AchievementGeneralViewWindowSourceMgr.getInstance().getSourceClass("achievementListText");
            var _local1:Array = UserObject.achievement;
            for each (_local2 in _local1) {
                this.userAchievementObject[_local2] = true;
            };
            for (_local3 in AchievementLib.achievementConfig) {
                this.allAchievement.push(int(_local3));
            };
            this.allAchievement.sort(Array.NUMERIC);
            _local4 = 0;
            while (_local4 < (this.scrollerCp.height / AchievementGeneralViewItem.MY_HEIGHT)) {
                _local5 = new AchievementGeneralViewItem();
                new AchievementGeneralViewItem().y = (_local5.height * _local4);
                _local6 = this.allAchievement[_local4];
                _local5.setAchievementInfo(_local6.toString(), (this.userAchievementObject[_local6] == true));
                this.itemGroup.addElement(_local5);
                _local4++;
            };
        }
        protected function createRemainAchievementItem():void{
            var _local1:int;
            var _local2:AchievementGeneralViewItem;
            var _local3:int;
            _local1 = (this.scrollerCp.height / AchievementGeneralViewItem.MY_HEIGHT);
            while (_local1 < this.allAchievement.length) {
                _local2 = new AchievementGeneralViewItem();
                _local2.y = (_local2.height * _local1);
                _local3 = this.allAchievement[_local1];
                _local2.setAchievementInfo(_local3.toString(), (this.userAchievementObject[_local3] == true));
                this.itemGroup.addElement(_local2);
                _local1++;
            };
        }
        protected function scroller1_mouseWheelHandler(_arg1:MouseEvent):void{
            _arg1.preventDefault();
            var _local2:Number = ((_arg1.delta < 0)) ? AchievementGeneralViewItem.MY_HEIGHT : -(AchievementGeneralViewItem.MY_HEIGHT);
            this.itemGroup.verticalScrollPosition = (this.itemGroup.verticalScrollPosition + _local2);
        }
        private function _AchievementGeneralViewWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 500;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _AchievementGeneralViewWindow_CommonOuterFrame1_c():CommonOuterFrame{
            var _local1:CommonOuterFrame;
            _local1 = new CommonOuterFrame();
            _local1.width = 705;
            _local1.height = 662;
            _local1.mouseEnabled = true;
            _local1.filters = [this._AchievementGeneralViewWindow_DropShadowFilter1_c()];
            _local1.addEventListener("mouseDown", this.___AchievementGeneralViewWindow_CommonOuterFrame1_mouseDown);
            _local1.addEventListener("mouseUp", this.___AchievementGeneralViewWindow_CommonOuterFrame1_mouseUp);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AchievementGeneralViewWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AchievementGeneralViewWindow_CommonOuterFrame1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
        }
        public function ___AchievementGeneralViewWindow_CommonOuterFrame1_mouseUp(_arg1:MouseEvent):void{
            this.stopDrag();
        }
        private function _AchievementGeneralViewWindow_CommonMiddleFrame1_c():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 9;
            _local1.y = 46;
            _local1.width = 686;
            _local1.height = 604;
            _local1.alpha = 0.7;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AchievementGeneralViewWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 21;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AchievementGeneralViewWindow_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 27;
            _local1.y = 13;
            _local1.initialized(this, "achievementListText");
            this.achievementListText = _local1;
            BindingManager.executeBindings(this, "achievementListText", this.achievementListText);
            return (_local1);
        }
        private function _AchievementGeneralViewWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 5;
            _local1.top = 5;
            _local1.addEventListener("click", this.___AchievementGeneralViewWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AchievementGeneralViewWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        private function _AchievementGeneralViewWindow_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 16.5;
            _local1.y = 58;
            _local1.width = 671;
            _local1.height = 584;
            _local1.viewport = this._AchievementGeneralViewWindow_Group1_i();
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
        private function _AchievementGeneralViewWindow_Group1_i():Group{
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
        public function ___AchievementGeneralViewWindow_AutoDepthGroup1_creationComplete(_arg1:FlexEvent):void{
            this.superdraggroup1_creationCompleteHandler(_arg1);
        }
        public function ___AchievementGeneralViewWindow_AutoDepthGroup1_remove(_arg1:FlexEvent):void{
            this.superdraggroup1_removeHandler(_arg1);
        }
        private function _AchievementGeneralViewWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            return (result);
        }
        public function get achievementListText():SmoothBitmapImage{
            return (this._1691041594achievementListText);
        }
        public function set achievementListText(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1691041594achievementListText;
            if (_local2 !== _arg1){
                this._1691041594achievementListText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "achievementListText", _local2, _arg1));
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

    }
}//package achievement_system 
