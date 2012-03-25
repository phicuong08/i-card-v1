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
    import spark.effects.*;
    import spark.layouts.*;
    import flash.utils.*;
    import task.*;
    import beginner_guide.*;
    import flash.accessibility.*;
    import social_contact.*;
    import baggage.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class BasicOperationBar extends Group implements IBindingClient {
		use namespace mx_internal;
        public static var CLICK_LEAVE_BTN:String = "click_leave_btn";
        private static var _instance:BasicOperationBar;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var _1906752252baggageBtn:BasicOperationBarButton;
        private var _1577592869leaveBtn:BasicOperationBarButton;
        private var _1267520715removeEffect:Fade;
        private var _1537268073taskBtn:BasicOperationBarButton;
        private var __moduleFactoryInitialized:Boolean = false;
        private var leaveFunc:Function;
        private var weakLeaveFunc:Array;
        private var _embed_mxml_source_basicOperationBarUI____png_371697018:Class;
        private var _embed_mxml_source_basicOperationBarUI____png_286045434:Class;
        private var _embed_mxml_source_basicOperationBarUI____png_18625402:Class;
        private var _embed_mxml_source_basicOperationBarUI____png_388246714:Class;
        private var _embed_mxml_source_basicOperationBarUI____png_218607032:Class;
        private var _embed_mxml_source_basicOperationBarUI____png_1912294028:Class;
        private var _embed_mxml_source_basicOperationBarUI____png_101045434:Class;
        private var _embed_mxml_source_basicOperationBarUI____png_1910197064:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function BasicOperationBar(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.weakLeaveFunc = new Array();
            this._embed_mxml_source_basicOperationBarUI____png_371697018 = BasicOperationBar__embed_mxml_source_basicOperationBarUI____png_371697018;
            this._embed_mxml_source_basicOperationBarUI____png_286045434 = BasicOperationBar__embed_mxml_source_basicOperationBarUI____png_286045434;
            this._embed_mxml_source_basicOperationBarUI____png_18625402 = BasicOperationBar__embed_mxml_source_basicOperationBarUI____png_18625402;
            this._embed_mxml_source_basicOperationBarUI____png_388246714 = BasicOperationBar__embed_mxml_source_basicOperationBarUI____png_388246714;
            this._embed_mxml_source_basicOperationBarUI____png_218607032 = BasicOperationBar__embed_mxml_source_basicOperationBarUI____png_218607032;
            this._embed_mxml_source_basicOperationBarUI____png_1912294028 = BasicOperationBar__embed_mxml_source_basicOperationBarUI____png_1912294028;
            this._embed_mxml_source_basicOperationBarUI____png_101045434 = BasicOperationBar__embed_mxml_source_basicOperationBarUI____png_101045434;
            this._embed_mxml_source_basicOperationBarUI____png_1910197064 = BasicOperationBar__embed_mxml_source_basicOperationBarUI____png_1910197064;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._BasicOperationBar_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_BasicOperationBarWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (BasicOperationBar[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.depth = 50;
            this.bottom = -7;
            this.right = -7;
            this.width = 322;
            this.height = 90;
            this.mouseEnabled = false;
            this.layout = this._BasicOperationBar_BasicLayout1_c();
            this.mxmlContent = [this._BasicOperationBar_SmoothBitmapImage1_c(), this._BasicOperationBar_BasicOperationBarButton1_c(), this._BasicOperationBar_BasicOperationBarButton2_i(), this._BasicOperationBar_BasicOperationBarButton3_i(), this._BasicOperationBar_BasicOperationBarButton4_c(), this._BasicOperationBar_BasicOperationBarButton5_c(), this._BasicOperationBar_BasicOperationBarButton6_c(), this._BasicOperationBar_BasicOperationBarButton7_i()];
            this._BasicOperationBar_Fade1_i();
            this._BasicOperationBar_Fade2_i();
            this.addEventListener("initialize", this.___BasicOperationBar_Group1_initialize);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function getInstance():BasicOperationBar{
            return (_instance);
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            BasicOperationBar._watcherSetupUtil = _arg1;
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
            visible = false;
            _instance = this;
        }
        public function moveOut(_arg1:Boolean):void{
            if (_arg1){
                this.addEffect.play();
            } else {
                this.removeEffect.play();
            };
        }
        protected function leaveBtn_clickHandler(_arg1:MouseEvent):void{
            var _local2:Function = this.weakLeaveFunc.pop();
            if (_local2 != null){
                _local2();
            } else {
                if (this.leaveFunc != null){
                    this.leaveFunc();
                    BeginnerGuideUtil.dispatchLuaEvent("clickLeaveBtn");
                };
            };
            dispatchEvent(new Event(CLICK_LEAVE_BTN));
        }
        public function registerWeakLeaveFunc(_arg1:Function):void{
            this.weakLeaveFunc.push(_arg1);
        }
        public function clearWeakLeaveFunc(_arg1:Function):void{
            var _local2:int = this.weakLeaveFunc.indexOf(_arg1);
            if (_local2 != -1){
                this.weakLeaveFunc.splice(_local2, 1);
            };
        }
        public function registerLeaveFunc(_arg1:Function):void{
            this.leaveFunc = _arg1;
        }
        public function clearLeaveFunc(_arg1:Function):void{
            if (_arg1 == this.leaveFunc){
                this.leaveFunc = null;
            };
        }
        public function clearLeaveFuncInViolence():void{
            this.leaveFunc = null;
        }
        private function _BasicOperationBar_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.startDelay = 1000;
            _local1.duration = 500;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _BasicOperationBar_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 0;
            _local1.duration = 500;
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            visible = false;
        }
        private function _BasicOperationBar_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BasicOperationBar_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_basicOperationBarUI____png_218607032;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BasicOperationBar_BasicOperationBarButton1_c():BasicOperationBarButton{
            var _local1:BasicOperationBarButton = new BasicOperationBarButton();
            _local1.x = 13;
            _local1.y = 42;
            _local1.buttonImage = this._embed_mxml_source_basicOperationBarUI____png_1910197064;
            _local1.toolTip = "角色属性";
            _local1.addEventListener("click", this.___BasicOperationBar_BasicOperationBarButton1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___BasicOperationBar_BasicOperationBarButton1_click(_arg1:MouseEvent):void{
            UserDetailInfoWindow.autoShowHideWindow();
        }
        private function _BasicOperationBar_BasicOperationBarButton2_i():BasicOperationBarButton{
            var _local1:BasicOperationBarButton = new BasicOperationBarButton();
            _local1.x = 50;
            _local1.y = 42;
            _local1.buttonImage = this._embed_mxml_source_basicOperationBarUI____png_371697018;
            _local1.toolTip = "包裹";
            _local1.addEventListener("click", this.__baggageBtn_click);
            _local1.id = "baggageBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.baggageBtn = _local1;
            BindingManager.executeBindings(this, "baggageBtn", this.baggageBtn);
            return (_local1);
        }
        public function __baggageBtn_click(_arg1:MouseEvent):void{
            BaggageMgr.getInstance().autoShowHideBaggage();
        }
        private function _BasicOperationBar_BasicOperationBarButton3_i():BasicOperationBarButton{
            var _local1:BasicOperationBarButton = new BasicOperationBarButton();
            _local1.x = 87;
            _local1.y = 42;
            _local1.buttonImage = this._embed_mxml_source_basicOperationBarUI____png_388246714;
            _local1.toolTip = "任务";
            _local1.addEventListener("click", this.__taskBtn_click);
            _local1.id = "taskBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.taskBtn = _local1;
            BindingManager.executeBindings(this, "taskBtn", this.taskBtn);
            return (_local1);
        }
        public function __taskBtn_click(_arg1:MouseEvent):void{
            TaskMgr.getInstance().autoShowHideTaskWindow();
        }
        private function _BasicOperationBar_BasicOperationBarButton4_c():BasicOperationBarButton{
            var _local1:BasicOperationBarButton = new BasicOperationBarButton();
            _local1.x = 124;
            _local1.y = 42;
            _local1.buttonImage = this._embed_mxml_source_basicOperationBarUI____png_286045434;
            _local1.toolTip = "好友";
            _local1.addEventListener("click", this.___BasicOperationBar_BasicOperationBarButton4_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___BasicOperationBar_BasicOperationBarButton4_click(_arg1:MouseEvent):void{
            SocialContactMgr.getInstance().autoShowHideSocialContactWindow();
        }
        private function _BasicOperationBar_BasicOperationBarButton5_c():BasicOperationBarButton{
            var _local1:BasicOperationBarButton = new BasicOperationBarButton();
            _local1.x = 161;
            _local1.y = 42;
            _local1.buttonImage = this._embed_mxml_source_basicOperationBarUI____png_1912294028;
            _local1.toolTip = "功能暂未制作";
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BasicOperationBar_BasicOperationBarButton6_c():BasicOperationBarButton{
            var _local1:BasicOperationBarButton = new BasicOperationBarButton();
            _local1.x = 198;
            _local1.y = 42;
            _local1.buttonImage = this._embed_mxml_source_basicOperationBarUI____png_18625402;
            _local1.toolTip = "选项";
            _local1.addEventListener("click", this.___BasicOperationBar_BasicOperationBarButton6_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___BasicOperationBar_BasicOperationBarButton6_click(_arg1:MouseEvent):void{
            GameOptionsWindnow.addRemoveWindow();
        }
        private function _BasicOperationBar_BasicOperationBarButton7_i():BasicOperationBarButton{
            var _local1:BasicOperationBarButton = new BasicOperationBarButton();
            _local1.x = 235;
            _local1.y = 21;
            _local1.buttonImage = this._embed_mxml_source_basicOperationBarUI____png_101045434;
            _local1.addEventListener("click", this.__leaveBtn_click);
            _local1.id = "leaveBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.leaveBtn = _local1;
            BindingManager.executeBindings(this, "leaveBtn", this.leaveBtn);
            return (_local1);
        }
        public function __leaveBtn_click(_arg1:MouseEvent):void{
            this.leaveBtn_clickHandler(_arg1);
        }
        public function ___BasicOperationBar_Group1_initialize(_arg1:FlexEvent):void{
            this.init();
        }
        private function _BasicOperationBar_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "addEffect.target");
            result[1] = new Binding(this, function ():Object{
                return (this);
            }, null, "removeEffect.target");
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
        public function get baggageBtn():BasicOperationBarButton{
            return (this._1906752252baggageBtn);
        }
        public function set baggageBtn(_arg1:BasicOperationBarButton):void{
            var _local2:Object = this._1906752252baggageBtn;
            if (_local2 !== _arg1){
                this._1906752252baggageBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "baggageBtn", _local2, _arg1));
                };
            };
        }
        public function get leaveBtn():BasicOperationBarButton{
            return (this._1577592869leaveBtn);
        }
        public function set leaveBtn(_arg1:BasicOperationBarButton):void{
            var _local2:Object = this._1577592869leaveBtn;
            if (_local2 !== _arg1){
                this._1577592869leaveBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leaveBtn", _local2, _arg1));
                };
            };
        }
        public function get removeEffect():Fade{
            return (this._1267520715removeEffect);
        }
        public function set removeEffect(_arg1:Fade):void{
            var _local2:Object = this._1267520715removeEffect;
            if (_local2 !== _arg1){
                this._1267520715removeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeEffect", _local2, _arg1));
                };
            };
        }
        public function get taskBtn():BasicOperationBarButton{
            return (this._1537268073taskBtn);
        }
        public function set taskBtn(_arg1:BasicOperationBarButton):void{
            var _local2:Object = this._1537268073taskBtn;
            if (_local2 !== _arg1){
                this._1537268073taskBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "taskBtn", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
