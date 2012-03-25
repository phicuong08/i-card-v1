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
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class HeadNoticeWindow extends NoticeWindowBase implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _HeadNoticeWindow_HGroup1:HGroup;
        public var _HeadNoticeWindow_Label1:Label;
        public var _HeadNoticeWindow_TalkWindowImage1:TalkWindowImage;
        private var _842377084confirmBtn:BlueSmallButton;
        private var _3198432head:MyImage;
        private var _104961243noBtn:BlueSmallButton;
        private var _3560248tips:RichText;
        private var _734071307yesBtn:BlueSmallButton;
        private var __moduleFactoryInitialized:Boolean = false;
        protected var _1221271781headId:int = 524;
        private var _embed_mxml_source_commonUI_________png_2092283682:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function HeadNoticeWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI_________png_2092283682 = HeadNoticeWindow__embed_mxml_source_commonUI_________png_2092283682;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._HeadNoticeWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_beginner_guide_HeadNoticeWindowWatcherSetupUtil");
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
            this.width = 673;
            this.height = 185;
            this.x = 303;
            this.y = 307;
            this.mxmlContent = [this._HeadNoticeWindow_Group1_c(), this._HeadNoticeWindow_BlueSmallButton1_i(), this._HeadNoticeWindow_HGroup1_i()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            HeadNoticeWindow._watcherSetupUtil = _arg1;
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
            return (new Point(90, 90));
        }
        private function addMask():void{
            var _local1:UIComponent = new UIComponent();
            addElement(_local1);
            _local1.graphics.beginFill(0);
            _local1.graphics.drawCircle(((this.head.width / 2) + this.head.x), ((this.head.width / 2) + this.head.y), (this.head.width / 2));
            _local1.graphics.endFill();
            this.head.mask = _local1;
        }
        override public function setInfo(_arg1:Object):void{
            super.setInfo(_arg1);
            if (noticeInfo["headId"]){
                this.headId = noticeInfo["headId"];
            };
        }
        private function _HeadNoticeWindow_Group1_c():Group{
            var _local1:Group = new Group();
            _local1.mxmlContent = [this._HeadNoticeWindow_TalkWindowImage1_i(), this._HeadNoticeWindow_MyImage1_i(), this._HeadNoticeWindow_SmoothBitmapImage1_c(), this._HeadNoticeWindow_Label1_i(), this._HeadNoticeWindow_RichText1_i()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _HeadNoticeWindow_TalkWindowImage1_i():TalkWindowImage{
            var _local1:TalkWindowImage;
            _local1 = new TalkWindowImage();
            _local1.x = 74;
            _local1.y = 42;
            _local1.height = 129;
            _local1.id = "_HeadNoticeWindow_TalkWindowImage1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._HeadNoticeWindow_TalkWindowImage1 = _local1;
            BindingManager.executeBindings(this, "_HeadNoticeWindow_TalkWindowImage1", this._HeadNoticeWindow_TalkWindowImage1);
            return (_local1);
        }
        private function _HeadNoticeWindow_MyImage1_i():MyImage{
            var _local1:MyImage;
            _local1 = new MyImage();
            _local1.width = 140;
            _local1.height = 140;
            _local1.x = 21;
            _local1.y = 22;
            _local1.addEventListener("creationComplete", this.__head_creationComplete);
            _local1.id = "head";
            if (!_local1.document){
                _local1.document = this;
            };
            this.head = _local1;
            BindingManager.executeBindings(this, "head", this.head);
            return (_local1);
        }
        public function __head_creationComplete(_arg1:FlexEvent):void{
            this.addMask();
        }
        private function _HeadNoticeWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_________png_2092283682;
            _local1.x = 4;
            _local1.y = 0;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _HeadNoticeWindow_Label1_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.width = 130;
            _local1.height = 35;
            _local1.x = 166;
            _local1.y = 17;
            _local1.filters = [this._HeadNoticeWindow_GlowFilter1_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "_HeadNoticeWindow_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._HeadNoticeWindow_Label1 = _local1;
            BindingManager.executeBindings(this, "_HeadNoticeWindow_Label1", this._HeadNoticeWindow_Label1);
            return (_local1);
        }
        private function _HeadNoticeWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 1387371;
            _local1.strength = 6;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _HeadNoticeWindow_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 205;
            _local1.y = 41;
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
        private function _HeadNoticeWindow_BlueSmallButton1_i():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.y = 134;
            _local1.right = 50;
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
        private function _HeadNoticeWindow_HGroup1_i():HGroup{
            var _local1:HGroup = new HGroup();
            _local1.y = 134;
            _local1.right = 33;
            _local1.gap = 15;
            _local1.mxmlContent = [this._HeadNoticeWindow_BlueSmallButton2_i(), this._HeadNoticeWindow_BlueSmallButton3_i()];
            _local1.id = "_HeadNoticeWindow_HGroup1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._HeadNoticeWindow_HGroup1 = _local1;
            BindingManager.executeBindings(this, "_HeadNoticeWindow_HGroup1", this._HeadNoticeWindow_HGroup1);
            return (_local1);
        }
        private function _HeadNoticeWindow_BlueSmallButton2_i():BlueSmallButton{
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
        private function _HeadNoticeWindow_BlueSmallButton3_i():BlueSmallButton{
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
        private function _HeadNoticeWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return ((width - 74));
            }, null, "_HeadNoticeWindow_TalkWindowImage1.width");
            result[1] = new Binding(this, function ():Object{
                return ((("source/cardImages/" + headId) + ".jpg"));
            }, null, "head.source");
            result[2] = new Binding(this, function ():String{
                var _local1:* = title;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_HeadNoticeWindow_Label1.text");
            result[3] = new Binding(this, function ():Number{
                return ((width - 249));
            }, null, "tips.width");
            result[4] = new Binding(this, function ():Number{
                return ((height - 55));
            }, null, "tips.height");
            result[5] = new Binding(this, function ():TextFlow{
                return (tipFlow);
            }, null, "tips.textFlow");
            result[6] = new Binding(this, function ():Boolean{
                return ((btnMode == 1));
            }, null, "confirmBtn.visible");
            result[7] = new Binding(this, function ():String{
                var _local1:* = btnText1;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "confirmBtn.label");
            result[8] = new Binding(this, function ():Boolean{
                return ((btnMode == 2));
            }, null, "_HeadNoticeWindow_HGroup1.visible");
            result[9] = new Binding(this, function ():String{
                var _local1:* = btnText2;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "yesBtn.label");
            result[10] = new Binding(this, function ():String{
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
        public function get head():MyImage{
            return (this._3198432head);
        }
        public function set head(_arg1:MyImage):void{
            var _local2:Object = this._3198432head;
            if (_local2 !== _arg1){
                this._3198432head = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "head", _local2, _arg1));
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
        protected function get headId():int{
            return (this._1221271781headId);
        }
        protected function set headId(_arg1:int):void{
            var _local2:Object = this._1221271781headId;
            if (_local2 !== _arg1){
                this._1221271781headId = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headId", _local2, _arg1));
                };
            };
        }

    }
}//package beginner_guide 
