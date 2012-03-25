//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
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

    public class NoticeWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var currentDisplayNotice:NoticeWindow;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _NoticeWindow_Label1:Label;
        private var _413245038addEffect:Fade;
        private var _1267520715removeEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        public var clickRemove:Boolean = true;
        private var _180979260_noticeText:String;
        private var hideTimer:Timer;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function NoticeWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.hideTimer = new Timer(3000, 1);
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._NoticeWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_custom_control_NoticeWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (NoticeWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 400;
            this.height = 82;
            this.horizontalCenter = 0;
            this.y = 330;
            this.depth = 500;
            this.layout = this._NoticeWindow_BasicLayout1_c();
            this.mxmlContent = [this._NoticeWindow_Rect1_c(), this._NoticeWindow_Rect2_c(), this._NoticeWindow_Rect3_c(), this._NoticeWindow_Label1_i()];
            this._NoticeWindow_Fade1_i();
            this._NoticeWindow_Fade2_i();
            this.addEventListener("click", this.___NoticeWindow_Group1_click);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function showNotice(_arg1:String, _arg2:Number=3000, _arg3:Boolean=true):NoticeWindow{
            if (!currentDisplayNotice){
                currentDisplayNotice = new (NoticeWindow)();
                TCGClient.getInstance().addElement(currentDisplayNotice);
            };
            currentDisplayNotice.noticeText = _arg1;
            currentDisplayNotice.clickRemove = _arg3;
            currentDisplayNotice.doRemoveTimer(_arg2);
            return (currentDisplayNotice);
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            NoticeWindow._watcherSetupUtil = _arg1;
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
        public function set noticeText(_arg1:String):void{
            this._noticeText = _arg1;
        }
        private function doRemoveTimer(_arg1:Number):void{
            this.hideTimer.reset();
            this.hideTimer.delay = _arg1;
            this.hideTimer.addEventListener(TimerEvent.TIMER, this.hideWindow);
            this.hideTimer.start();
        }
        public function hideWindow(_arg1:TimerEvent=null):void{
            this.hideTimer.stop();
            this.hideTimer.removeEventListener(TimerEvent.TIMER, this.hideWindow);
            var _local2:* = parent;
            if (_local2){
                _local2.removeElement(this);
            };
            currentDisplayNotice = null;
        }
        private function clickHandler():void{
            if (((((!(this.clickRemove)) || (this.addEffect.isPlaying))) || (this.removeEffect.isPlaying))){
                return;
            };
            this.hideWindow();
        }
        private function _NoticeWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _NoticeWindow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            _local1.duration = 300;
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        private function _NoticeWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.top = 5;
            _local1.percentWidth = 100;
            _local1.height = 3;
            _local1.fill = this._NoticeWindow_LinearGradient1_c();
            _local1.filters = [this._NoticeWindow_GlowFilter1_c()];
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._NoticeWindow_GradientEntry1_c(), this._NoticeWindow_GradientEntry2_c(), this._NoticeWindow_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 9868164;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 9868164;
            _local1.alpha = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 9868164;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_Rect2_c():Rect{
            var _local1:Rect = new Rect();
            _local1.bottom = 5;
            _local1.percentWidth = 100;
            _local1.height = 3;
            _local1.fill = this._NoticeWindow_LinearGradient2_c();
            _local1.filters = [this._NoticeWindow_GlowFilter2_c()];
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_LinearGradient2_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._NoticeWindow_GradientEntry4_c(), this._NoticeWindow_GradientEntry5_c(), this._NoticeWindow_GradientEntry6_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_GradientEntry4_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 9868164;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_GradientEntry5_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 9868164;
            _local1.alpha = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_GradientEntry6_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 9868164;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_Rect3_c():Rect{
            var _local1:Rect = new Rect();
            _local1.top = 8;
            _local1.bottom = 8;
            _local1.percentWidth = 100;
            _local1.fill = this._NoticeWindow_LinearGradient3_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_LinearGradient3_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._NoticeWindow_GradientEntry7_c(), this._NoticeWindow_GradientEntry8_c(), this._NoticeWindow_GradientEntry9_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_GradientEntry7_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0xEDC900;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_GradientEntry8_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0xEDC900;
            _local1.alpha = 0.3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_GradientEntry9_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0xEDC900;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _NoticeWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.filters = [this._NoticeWindow_GlowFilter3_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 25);
            _local1.setStyle("color", 0xE6C300);
            _local1.id = "_NoticeWindow_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._NoticeWindow_Label1 = _local1;
            BindingManager.executeBindings(this, "_NoticeWindow_Label1", this._NoticeWindow_Label1);
            return (_local1);
        }
        private function _NoticeWindow_GlowFilter3_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.quality = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___NoticeWindow_Group1_click(_arg1:MouseEvent):void{
            this.clickHandler();
        }
        private function _NoticeWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "removeEffect");
            result[2] = new Binding(this, function ():String{
                var _local1:* = _noticeText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_NoticeWindow_Label1.text");
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
        private function get _noticeText():String{
            return (this._180979260_noticeText);
        }
        private function set _noticeText(_arg1:String):void{
            var _local2:Object = this._180979260_noticeText;
            if (_local2 !== _arg1){
                this._180979260_noticeText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_noticeText", _local2, _arg1));
                };
            };
        }

    }
}//package custom_control 
