//Created by Action Script Viewer - http://www.buraks.com/asv
package beginner_guide {
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
    import flashx.textLayout.elements.*;
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

    public class EasyNoticeWindow extends NoticeWindowBase implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _EasyNoticeWindow_HGroup1:HGroup;
        public var _EasyNoticeWindow_TalkWindowImage1:TalkWindowImage;
        private var _842377084confirmBtn:BlueSmallButton;
        private var _104961243noBtn:BlueSmallButton;
        private var _3560248tips:RichText;
        private var _734071307yesBtn:BlueSmallButton;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function EasyNoticeWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._EasyNoticeWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_beginner_guide_EasyNoticeWindowWatcherSetupUtil");
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
            this.width = 599;
            this.height = 129;
            this.x = 340;
            this.y = 335;
            this.mxmlContent = [this._EasyNoticeWindow_TalkWindowImage1_i(), this._EasyNoticeWindow_RichText1_i(), this._EasyNoticeWindow_BlueSmallButton1_i(), this._EasyNoticeWindow_HGroup1_i()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            EasyNoticeWindow._watcherSetupUtil = _arg1;
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
        override protected function getGuideLineStartPoint():Point{
            return (new Point(((width / 2) - 30), (height / 2)));
        }
        private function _EasyNoticeWindow_TalkWindowImage1_i():TalkWindowImage{
            var _local1:TalkWindowImage = new TalkWindowImage();
            _local1.id = "_EasyNoticeWindow_TalkWindowImage1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._EasyNoticeWindow_TalkWindowImage1 = _local1;
            BindingManager.executeBindings(this, "_EasyNoticeWindow_TalkWindowImage1", this._EasyNoticeWindow_TalkWindowImage1);
            return (_local1);
        }
        private function _EasyNoticeWindow_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 16);
            _local1.id = "tips";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tips = _local1;
            BindingManager.executeBindings(this, "tips", this.tips);
            return (_local1);
        }
        private function _EasyNoticeWindow_BlueSmallButton1_i():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.right = 50;
            _local1.bottom = 8;
            _local1.addEventListener("click", this.__confirmBtn_click);
            _local1.id = "confirmBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.confirmBtn = _local1;
            BindingManager.executeBindings(this, "confirmBtn", this.confirmBtn);
            return (_local1);
        }
        public function __confirmBtn_click(_arg1:MouseEvent):void{
            confirmBtn_clickHandler(_arg1);
        }
        private function _EasyNoticeWindow_HGroup1_i():HGroup{
            var _local1:HGroup = new HGroup();
            _local1.right = 33;
            _local1.gap = 15;
            _local1.bottom = 8;
            _local1.mxmlContent = [this._EasyNoticeWindow_BlueSmallButton2_i(), this._EasyNoticeWindow_BlueSmallButton3_i()];
            _local1.id = "_EasyNoticeWindow_HGroup1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._EasyNoticeWindow_HGroup1 = _local1;
            BindingManager.executeBindings(this, "_EasyNoticeWindow_HGroup1", this._EasyNoticeWindow_HGroup1);
            return (_local1);
        }
        private function _EasyNoticeWindow_BlueSmallButton2_i():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.addEventListener("click", this.__yesBtn_click);
            _local1.id = "yesBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.yesBtn = _local1;
            BindingManager.executeBindings(this, "yesBtn", this.yesBtn);
            return (_local1);
        }
        public function __yesBtn_click(_arg1:MouseEvent):void{
            yesBtn_clickHandler(_arg1);
        }
        private function _EasyNoticeWindow_BlueSmallButton3_i():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.addEventListener("click", this.__noBtn_click);
            _local1.id = "noBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.noBtn = _local1;
            BindingManager.executeBindings(this, "noBtn", this.noBtn);
            return (_local1);
        }
        public function __noBtn_click(_arg1:MouseEvent):void{
            noBtn_clickHandler(_arg1);
        }
        private function _EasyNoticeWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, null, "_EasyNoticeWindow_TalkWindowImage1.width", "width");
            result[1] = new Binding(this, null, null, "_EasyNoticeWindow_TalkWindowImage1.height", "height");
            result[2] = new Binding(this, null, null, "tips.width", "width");
            result[3] = new Binding(this, null, null, "tips.height", "height");
            result[4] = new Binding(this, function ():TextFlow{
                return (tipFlow);
            }, null, "tips.textFlow");
            result[5] = new Binding(this, function ():Boolean{
                return ((btnMode == 1));
            }, null, "confirmBtn.visible");
            result[6] = new Binding(this, function ():String{
                var _local1:* = btnText1;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "confirmBtn.label");
            result[7] = new Binding(this, function ():Boolean{
                return ((btnMode == 2));
            }, null, "_EasyNoticeWindow_HGroup1.visible");
            result[8] = new Binding(this, function ():String{
                var _local1:* = btnText2;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "yesBtn.label");
            result[9] = new Binding(this, function ():String{
                var _local1:* = btnText3;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "noBtn.label");
            return (result);
        }
        public function get confirmBtn():BlueSmallButton{
            return (this._842377084confirmBtn);
        }
        public function set confirmBtn(_arg1:BlueSmallButton):void{
            var _local2:Object = this._842377084confirmBtn;
            if (_local2 !== _arg1){
                this._842377084confirmBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirmBtn", _local2, _arg1));
                };
            };
        }
        public function get noBtn():BlueSmallButton{
            return (this._104961243noBtn);
        }
        public function set noBtn(_arg1:BlueSmallButton):void{
            var _local2:Object = this._104961243noBtn;
            if (_local2 !== _arg1){
                this._104961243noBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noBtn", _local2, _arg1));
                };
            };
        }
        public function get tips():RichText{
            return (this._3560248tips);
        }
        public function set tips(_arg1:RichText):void{
            var _local2:Object = this._3560248tips;
            if (_local2 !== _arg1){
                this._3560248tips = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tips", _local2, _arg1));
                };
            };
        }
        public function get yesBtn():BlueSmallButton{
            return (this._734071307yesBtn);
        }
        public function set yesBtn(_arg1:BlueSmallButton):void{
            var _local2:Object = this._734071307yesBtn;
            if (_local2 !== _arg1){
                this._734071307yesBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yesBtn", _local2, _arg1));
                };
            };
        }

    }
}//package beginner_guide 
