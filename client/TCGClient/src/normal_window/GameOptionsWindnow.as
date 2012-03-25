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
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import combat_element.*;
    import mouse_keyboard_mgr.*;
    import SoundSystem.*;
    import flash.utils.*;
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

    public class GameOptionsWindnow extends AutoDepthGroup implements IBindingClient {
		use namespace mx_internal;
        private static var currentDisplayWindow:GameOptionsWindnow;
        private static var _scaleWithBrowserFlag:Boolean = false;
        public static var combatRotationFlag:Boolean = true;
        public static var strongHandCardEffect:Boolean = false;
        private static var _mouseChangeFlag:Boolean = false;
        public static var acceptInviteFlag:Boolean = true;
        public static var deactivateMusicOnFlag:Boolean = false;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _GameOptionsWindnow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _GameOptionsWindnow_CommonOuterFrame1:CommonOuterFrame;
        private var _1674897969acceptInvite:CheckBox;
        private var _413245038addEffect:Fade;
        private var _1511729217bgVolume:HSlider;
        private var _881795024deactivateMusicOn:CheckBox;
        private var _303080437effectVolume:HSlider;
        private var _364342453mouseChange:CheckBox;
        private var _1267520715removeEffect:Fade;
        private var _330066984scaleWithBrowser:CheckBox;
        private var _692335574strongHandCard:CheckBox;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function GameOptionsWindnow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI____png_1538356188 = GameOptionsWindnow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GameOptionsWindnow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_GameOptionsWindnowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (GameOptionsWindnow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.x = 508;
            this.y = 253;
            this.mouseChildren = false;
            this.width = 263;
            this.height = 294;
            this.layout = this._GameOptionsWindnow_BasicLayout1_c();
            this.mxmlContent = [this._GameOptionsWindnow_CommonOuterFrame1_i(), this._GameOptionsWindnow_CommonMiddleFrame1_i(), this._GameOptionsWindnow_SmoothBitmapImage1_c(), this._GameOptionsWindnow_Label1_c(), this._GameOptionsWindnow_CheckBox1_i(), this._GameOptionsWindnow_CheckBox2_i(), this._GameOptionsWindnow_CheckBox3_i(), this._GameOptionsWindnow_CheckBox4_i(), this._GameOptionsWindnow_CheckBox5_i(), this._GameOptionsWindnow_Label2_c(), this._GameOptionsWindnow_HSlider1_i(), this._GameOptionsWindnow_Label3_c(), this._GameOptionsWindnow_HSlider2_i(), this._GameOptionsWindnow_CloseSignBtn1_c()];
            this._GameOptionsWindnow_Fade1_i();
            this._GameOptionsWindnow_Fade2_i();
            this.addEventListener("creationComplete", this.___GameOptionsWindnow_AutoDepthGroup1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set scaleWithBrowserFlag(_arg1:Boolean):void{
            if (_arg1 != _scaleWithBrowserFlag){
                _scaleWithBrowserFlag = _arg1;
                TCGClient.getInstance().resizeByWindow(true);
                CommonUtil.addTimerLaterCall(100, TCGClient.getInstance().resizePointBg);
            };
        }
        public static function get scaleWithBrowserFlag():Boolean{
            return (_scaleWithBrowserFlag);
        }
        public static function set mouseChangeFlag(_arg1:Boolean):void{
            if (_arg1 != _mouseChangeFlag){
                _mouseChangeFlag = _arg1;
                MouseMgr.getInstance().resetMode();
            };
        }
        public static function get mouseChangeFlag():Boolean{
            return (_mouseChangeFlag);
        }
        public static function addRemoveWindow():void{
            if (currentDisplayWindow){
                currentDisplayWindow.removeSelf();
                currentDisplayWindow = null;
            } else {
                currentDisplayWindow = new (GameOptionsWindnow)();
                TCGClient.getInstance().mainGroup.addElement(currentDisplayWindow);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GameOptionsWindnow._watcherSetupUtil = _arg1;
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
        private function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function scaleWithBrowser_changeHandler():void{
            scaleWithBrowserFlag = this.scaleWithBrowser.selected;
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.effectVolume.value = (SoundMgr.getInstance().effectVolume * 100);
            this.bgVolume.value = (SoundMgr.getInstance().bgVolume * 100);
        }
        protected function hslider1_changeHandler(_arg1:Event):void{
            SoundMgr.getInstance().effectVolume = (this.effectVolume.value / 100);
        }
        protected function hslider2_changeHandler(_arg1:Event):void{
            SoundMgr.getInstance().bgVolume = (this.bgVolume.value / 100);
        }
        private function _GameOptionsWindnow_Fade1_i():Fade{
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
            mouseChildren = true;
        }
        private function _GameOptionsWindnow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            _local1.duration = 300;
            _local1.addEventListener("effectStart", this.__removeEffect_effectStart);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        public function __removeEffect_effectStart(_arg1:EffectEvent):void{
            mouseChildren = false;
        }
        private function _GameOptionsWindnow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameOptionsWindnow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.mouseEnabled = true;
            _local1.filters = [this._GameOptionsWindnow_DropShadowFilter1_c()];
            _local1.addEventListener("mouseDown", this.___GameOptionsWindnow_CommonOuterFrame1_mouseDown);
            _local1.addEventListener("mouseUp", this.___GameOptionsWindnow_CommonOuterFrame1_mouseUp);
            _local1.id = "_GameOptionsWindnow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._GameOptionsWindnow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_GameOptionsWindnow_CommonOuterFrame1", this._GameOptionsWindnow_CommonOuterFrame1);
            return (_local1);
        }
        private function _GameOptionsWindnow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GameOptionsWindnow_CommonOuterFrame1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
        }
        public function ___GameOptionsWindnow_CommonOuterFrame1_mouseUp(_arg1:MouseEvent):void{
            this.stopDrag();
        }
        private function _GameOptionsWindnow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 14;
            _local1.y = 40;
            _local1.alpha = 0.7;
            _local1.id = "_GameOptionsWindnow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._GameOptionsWindnow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_GameOptionsWindnow_CommonMiddleFrame1", this._GameOptionsWindnow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _GameOptionsWindnow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 17;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameOptionsWindnow_Label1_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 20;
            _local1.y = 10;
            _local1.text = "游戏功能选项";
            _local1.mouseEnabled = false;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameOptionsWindnow_CheckBox1_i():CheckBox{
            var _local1:CheckBox = new CheckBox();
            _local1.x = 42;
            _local1.y = 161;
            _local1.label = "美化游戏光标";
            _local1.toolTip = "改变游戏光标样式，略微影响性能。";
            _local1.addEventListener("change", this.__mouseChange_change);
            _local1.addEventListener("creationComplete", this.__mouseChange_creationComplete);
            _local1.id = "mouseChange";
            if (!_local1.document){
                _local1.document = this;
            };
            this.mouseChange = _local1;
            BindingManager.executeBindings(this, "mouseChange", this.mouseChange);
            return (_local1);
        }
        public function __mouseChange_change(_arg1:Event):void{
            mouseChangeFlag = this.mouseChange.selected;
        }
        public function __mouseChange_creationComplete(_arg1:FlexEvent):void{
            this.mouseChange.selected = mouseChangeFlag;
        }
        private function _GameOptionsWindnow_CheckBox2_i():CheckBox{
            var _local1:CheckBox = new CheckBox();
            _local1.x = 42;
            _local1.y = 187;
            _local1.label = "手卡特效加强";
            _local1.toolTip = "鼠标移入手卡时，周围的卡片有散开效果，有一定的性能消耗。";
            _local1.addEventListener("change", this.__strongHandCard_change);
            _local1.addEventListener("creationComplete", this.__strongHandCard_creationComplete);
            _local1.id = "strongHandCard";
            if (!_local1.document){
                _local1.document = this;
            };
            this.strongHandCard = _local1;
            BindingManager.executeBindings(this, "strongHandCard", this.strongHandCard);
            return (_local1);
        }
        public function __strongHandCard_change(_arg1:Event):void{
            strongHandCardEffect = this.strongHandCard.selected;
        }
        public function __strongHandCard_creationComplete(_arg1:FlexEvent):void{
            this.strongHandCard.selected = strongHandCardEffect;
        }
        private function _GameOptionsWindnow_CheckBox3_i():CheckBox{
            var _local1:CheckBox = new CheckBox();
            _local1.x = 42;
            _local1.y = 67;
            _local1.label = "画面充满整个窗口";
            _local1.toolTip = "游戏画面随浏览器窗口大小缩放，缩放后画面可能会有模糊，游戏的标准分辨率为 1280 * 800。";
            _local1.addEventListener("change", this.__scaleWithBrowser_change);
            _local1.addEventListener("creationComplete", this.__scaleWithBrowser_creationComplete);
            _local1.id = "scaleWithBrowser";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scaleWithBrowser = _local1;
            BindingManager.executeBindings(this, "scaleWithBrowser", this.scaleWithBrowser);
            return (_local1);
        }
        public function __scaleWithBrowser_change(_arg1:Event):void{
            scaleWithBrowserFlag = this.scaleWithBrowser.selected;
        }
        public function __scaleWithBrowser_creationComplete(_arg1:FlexEvent):void{
            this.scaleWithBrowser.selected = scaleWithBrowserFlag;
        }
        private function _GameOptionsWindnow_CheckBox4_i():CheckBox{
            var _local1:CheckBox = new CheckBox();
            _local1.x = 42;
            _local1.y = 213;
            _local1.label = "接受陌生玩家邀请";
            _local1.toolTip = "勾选该选项则同意接受其他玩家的对战邀请，否则系统将默认拒绝。";
            _local1.addEventListener("change", this.__acceptInvite_change);
            _local1.addEventListener("creationComplete", this.__acceptInvite_creationComplete);
            _local1.id = "acceptInvite";
            if (!_local1.document){
                _local1.document = this;
            };
            this.acceptInvite = _local1;
            BindingManager.executeBindings(this, "acceptInvite", this.acceptInvite);
            return (_local1);
        }
        public function __acceptInvite_change(_arg1:Event):void{
            acceptInviteFlag = this.acceptInvite.selected;
        }
        public function __acceptInvite_creationComplete(_arg1:FlexEvent):void{
            this.acceptInvite.selected = acceptInviteFlag;
        }
        private function _GameOptionsWindnow_CheckBox5_i():CheckBox{
            var _local1:CheckBox = new CheckBox();
            _local1.x = 42;
            _local1.y = 239;
            _local1.label = "不活动状态音乐开启";
            _local1.toolTip = "窗口处于未激活状态时仍播放游戏音乐，多开时建议不要勾选，以免出现多个背景声音。";
            _local1.addEventListener("change", this.__deactivateMusicOn_change);
            _local1.addEventListener("creationComplete", this.__deactivateMusicOn_creationComplete);
            _local1.id = "deactivateMusicOn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.deactivateMusicOn = _local1;
            BindingManager.executeBindings(this, "deactivateMusicOn", this.deactivateMusicOn);
            return (_local1);
        }
        public function __deactivateMusicOn_change(_arg1:Event):void{
            deactivateMusicOnFlag = this.deactivateMusicOn.selected;
        }
        public function __deactivateMusicOn_creationComplete(_arg1:FlexEvent):void{
            this.deactivateMusicOn.selected = deactivateMusicOnFlag;
        }
        private function _GameOptionsWindnow_Label2_c():Label{
            var _local1:Label = new Label();
            _local1.x = 42;
            _local1.y = 127;
            _local1.text = "音效音量：";
            _local1.mouseEnabled = false;
            _local1.setStyle("color", 14400386);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameOptionsWindnow_HSlider1_i():HSlider{
            var _local1:HSlider = new HSlider();
            _local1.x = 109;
            _local1.y = 128;
            _local1.maximum = 100;
            _local1.minimum = 0;
            _local1.width = 110;
            _local1.addEventListener("change", this.__effectVolume_change);
            _local1.id = "effectVolume";
            if (!_local1.document){
                _local1.document = this;
            };
            this.effectVolume = _local1;
            BindingManager.executeBindings(this, "effectVolume", this.effectVolume);
            return (_local1);
        }
        public function __effectVolume_change(_arg1:Event):void{
            this.hslider1_changeHandler(_arg1);
        }
        private function _GameOptionsWindnow_Label3_c():Label{
            var _local1:Label = new Label();
            _local1.x = 42;
            _local1.y = 103;
            _local1.text = "音乐音量：";
            _local1.mouseEnabled = false;
            _local1.setStyle("color", 14400386);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameOptionsWindnow_HSlider2_i():HSlider{
            var _local1:HSlider = new HSlider();
            _local1.x = 109;
            _local1.y = 104;
            _local1.maximum = 100;
            _local1.minimum = 0;
            _local1.width = 110;
            _local1.addEventListener("change", this.__bgVolume_change);
            _local1.id = "bgVolume";
            if (!_local1.document){
                _local1.document = this;
            };
            this.bgVolume = _local1;
            BindingManager.executeBindings(this, "bgVolume", this.bgVolume);
            return (_local1);
        }
        public function __bgVolume_change(_arg1:Event):void{
            this.hslider2_changeHandler(_arg1);
        }
        private function _GameOptionsWindnow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 4;
            _local1.top = 4;
            _local1.addEventListener("click", this.___GameOptionsWindnow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GameOptionsWindnow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            addRemoveWindow();
        }
        public function ___GameOptionsWindnow_AutoDepthGroup1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _GameOptionsWindnow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "removeEffect");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [263, 294];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_GameOptionsWindnow_CommonOuterFrame1.size");
            result[3] = new Binding(this, function ():Array{
                var _local1:* = [235, 241];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_GameOptionsWindnow_CommonMiddleFrame1.size");
            return (result);
        }
        public function get acceptInvite():CheckBox{
            return (this._1674897969acceptInvite);
        }
        public function set acceptInvite(_arg1:CheckBox):void{
            var _local2:Object = this._1674897969acceptInvite;
            if (_local2 !== _arg1){
                this._1674897969acceptInvite = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "acceptInvite", _local2, _arg1));
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
        public function get bgVolume():HSlider{
            return (this._1511729217bgVolume);
        }
        public function set bgVolume(_arg1:HSlider):void{
            var _local2:Object = this._1511729217bgVolume;
            if (_local2 !== _arg1){
                this._1511729217bgVolume = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgVolume", _local2, _arg1));
                };
            };
        }
        public function get deactivateMusicOn():CheckBox{
            return (this._881795024deactivateMusicOn);
        }
        public function set deactivateMusicOn(_arg1:CheckBox):void{
            var _local2:Object = this._881795024deactivateMusicOn;
            if (_local2 !== _arg1){
                this._881795024deactivateMusicOn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "deactivateMusicOn", _local2, _arg1));
                };
            };
        }
        public function get effectVolume():HSlider{
            return (this._303080437effectVolume);
        }
        public function set effectVolume(_arg1:HSlider):void{
            var _local2:Object = this._303080437effectVolume;
            if (_local2 !== _arg1){
                this._303080437effectVolume = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "effectVolume", _local2, _arg1));
                };
            };
        }
        public function get mouseChange():CheckBox{
            return (this._364342453mouseChange);
        }
        public function set mouseChange(_arg1:CheckBox):void{
            var _local2:Object = this._364342453mouseChange;
            if (_local2 !== _arg1){
                this._364342453mouseChange = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mouseChange", _local2, _arg1));
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
        public function get scaleWithBrowser():CheckBox{
            return (this._330066984scaleWithBrowser);
        }
        public function set scaleWithBrowser(_arg1:CheckBox):void{
            var _local2:Object = this._330066984scaleWithBrowser;
            if (_local2 !== _arg1){
                this._330066984scaleWithBrowser = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scaleWithBrowser", _local2, _arg1));
                };
            };
        }
        public function get strongHandCard():CheckBox{
            return (this._692335574strongHandCard);
        }
        public function set strongHandCard(_arg1:CheckBox):void{
            var _local2:Object = this._692335574strongHandCard;
            if (_local2 !== _arg1){
                this._692335574strongHandCard = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "strongHandCard", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
