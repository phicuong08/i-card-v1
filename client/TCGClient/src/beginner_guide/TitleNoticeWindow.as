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
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.filters.*;
    import flashx.textLayout.elements.*;
    import flash.utils.*;
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

    public class TitleNoticeWindow extends NoticeWindowBase implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _TitleNoticeWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _TitleNoticeWindow_CommonOuterFrame1:CommonOuterFrame;
        public var _TitleNoticeWindow_Label1:Label;
        public var _TitleNoticeWindow_Label2:Label;
        private var _842377084confirmBtn:Button;
        private var _104961243noBtn:Button;
        private var _3560248tips:RichText;
        private var _734071307yesBtn:Button;
        private var __moduleFactoryInitialized:Boolean = false;
        protected var _45005005titleCenter:Boolean = false;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function TitleNoticeWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI____png_1538356188 = TitleNoticeWindow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._TitleNoticeWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_beginner_guide_TitleNoticeWindowWatcherSetupUtil");
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
            this.width = 553;
            this.height = 197;
            this.x = 363;
            this.y = 301;
            this.mxmlContent = [this._TitleNoticeWindow_CommonOuterFrame1_i(), this._TitleNoticeWindow_CommonMiddleFrame1_i(), this._TitleNoticeWindow_SmoothBitmapImage1_c(), this._TitleNoticeWindow_Label1_i(), this._TitleNoticeWindow_Label2_i(), this._TitleNoticeWindow_RichText1_i(), this._TitleNoticeWindow_Button1_i(), this._TitleNoticeWindow_Button2_i(), this._TitleNoticeWindow_Button3_i()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            TitleNoticeWindow._watcherSetupUtil = _arg1;
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
        override public function setInfo(_arg1:Object):void{
            super.setInfo(_arg1);
            if (noticeInfo["titleCenter"]){
                this.titleCenter = noticeInfo["titleCenter"];
            };
        }
        private function _TitleNoticeWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.filters = [this._TitleNoticeWindow_DropShadowFilter1_c()];
            _local1.id = "_TitleNoticeWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TitleNoticeWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_TitleNoticeWindow_CommonOuterFrame1", this._TitleNoticeWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _TitleNoticeWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TitleNoticeWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 14;
            _local1.y = 40;
            _local1.alpha = 0.7;
            _local1.id = "_TitleNoticeWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TitleNoticeWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_TitleNoticeWindow_CommonMiddleFrame1", this._TitleNoticeWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _TitleNoticeWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 20;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TitleNoticeWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 29;
            _local1.y = 13;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 18);
            _local1.id = "_TitleNoticeWindow_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TitleNoticeWindow_Label1 = _local1;
            BindingManager.executeBindings(this, "_TitleNoticeWindow_Label1", this._TitleNoticeWindow_Label1);
            return (_local1);
        }
        private function _TitleNoticeWindow_Label2_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 0;
            _local1.y = 13;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 18);
            _local1.id = "_TitleNoticeWindow_Label2";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TitleNoticeWindow_Label2 = _local1;
            BindingManager.executeBindings(this, "_TitleNoticeWindow_Label2", this._TitleNoticeWindow_Label2);
            return (_local1);
        }
        private function _TitleNoticeWindow_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 14;
            _local1.y = 40;
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
        private function _TitleNoticeWindow_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.bottom = 10;
            _local1.horizontalCenter = 0;
            _local1.label = "确 定";
            _local1.width = 75;
            _local1.height = 27;
            _local1.buttonMode = true;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
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
        private function _TitleNoticeWindow_Button2_i():Button{
            var _local1:Button = new Button();
            _local1.bottom = 10;
            _local1.left = 120;
            _local1.label = "确 认";
            _local1.width = 75;
            _local1.height = 30;
            _local1.buttonMode = true;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
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
        private function _TitleNoticeWindow_Button3_i():Button{
            var _local1:Button = new Button();
            _local1.bottom = 10;
            _local1.right = 120;
            _local1.label = "取 消";
            _local1.width = 75;
            _local1.height = 30;
            _local1.buttonMode = true;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
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
        private function _TitleNoticeWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, null, "_TitleNoticeWindow_CommonOuterFrame1.width", "width");
            result[1] = new Binding(this, null, null, "_TitleNoticeWindow_CommonOuterFrame1.height", "height");
            result[2] = new Binding(this, function ():Number{
                return ((width - 28));
            }, null, "_TitleNoticeWindow_CommonMiddleFrame1.width");
            result[3] = new Binding(this, function ():Number{
                return ((height - 84));
            }, null, "_TitleNoticeWindow_CommonMiddleFrame1.height");
            result[4] = new Binding(this, function ():String{
                var _local1:* = title;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_TitleNoticeWindow_Label1.text");
            result[5] = new Binding(this, function ():Boolean{
                return (!(titleCenter));
            }, null, "_TitleNoticeWindow_Label1.visible");
            result[6] = new Binding(this, null, null, "_TitleNoticeWindow_Label2.width", "width");
            result[7] = new Binding(this, null, null, "_TitleNoticeWindow_Label2.height", "height");
            result[8] = new Binding(this, function ():String{
                var _local1:* = title;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_TitleNoticeWindow_Label2.text");
            result[9] = new Binding(this, function ():Boolean{
                return (titleCenter);
            }, null, "_TitleNoticeWindow_Label2.visible");
            result[10] = new Binding(this, function ():Number{
                return ((width - 28));
            }, null, "tips.width");
            result[11] = new Binding(this, function ():Number{
                return ((height - 84));
            }, null, "tips.height");
            result[12] = new Binding(this, function ():TextFlow{
                return (tipFlow);
            }, null, "tips.textFlow");
            result[13] = new Binding(this, function ():Boolean{
                return ((btnMode == 1));
            }, null, "confirmBtn.visible");
            result[14] = new Binding(this, function ():Boolean{
                return ((btnMode == 2));
            }, null, "yesBtn.visible");
            result[15] = new Binding(this, function ():Boolean{
                return ((btnMode == 2));
            }, null, "noBtn.visible");
            return (result);
        }
        public function get confirmBtn():Button{
            return (this._842377084confirmBtn);
        }
        public function set confirmBtn(_arg1:Button):void{
            var _local2:Object = this._842377084confirmBtn;
            if (_local2 !== _arg1){
                this._842377084confirmBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirmBtn", _local2, _arg1));
                };
            };
        }
        public function get noBtn():Button{
            return (this._104961243noBtn);
        }
        public function set noBtn(_arg1:Button):void{
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
        public function get yesBtn():Button{
            return (this._734071307yesBtn);
        }
        public function set yesBtn(_arg1:Button):void{
            var _local2:Object = this._734071307yesBtn;
            if (_local2 !== _arg1){
                this._734071307yesBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yesBtn", _local2, _arg1));
                };
            };
        }
        protected function get titleCenter():Boolean{
            return (this._45005005titleCenter);
        }
        protected function set titleCenter(_arg1:Boolean):void{
            var _local2:Object = this._45005005titleCenter;
            if (_local2 !== _arg1){
                this._45005005titleCenter = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleCenter", _local2, _arg1));
                };
            };
        }

    }
}//package beginner_guide 
