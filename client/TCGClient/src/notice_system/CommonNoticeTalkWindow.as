//Created by Action Script Viewer - http://www.buraks.com/asv
package notice_system {
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
    import task_guide.*;
    import flashx.textLayout.elements.*;
    import SoundSystem.*;
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

    public class CommonNoticeTalkWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1020166578fadeInEffect:Fade;
        private var _733607779fadeOutEffect:Fade;
        private var _3198432head:MyImage;
        private var _1115960181headName:Label;
        private var _525800341ignoreCheckBox:CheckBox;
        private var _3560248tips:RichText;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1312067479tipFlow:TextFlow;
        private var noticeInfo:Object;
        private var gl:GuideLineWindow;
        private var _embed_mxml_source_commonUI_________png_1086246204:Class;
        private var _embed_mxml_source_commonUI_________png_2092283682:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function CommonNoticeTalkWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI_________png_1086246204 = CommonNoticeTalkWindow__embed_mxml_source_commonUI_________png_1086246204;
            this._embed_mxml_source_commonUI_________png_2092283682 = CommonNoticeTalkWindow__embed_mxml_source_commonUI_________png_2092283682;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CommonNoticeTalkWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_notice_system_CommonNoticeTalkWindowWatcherSetupUtil");
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
            this.depth = 21;
            this.mouseChildren = false;
            this.layout = this._CommonNoticeTalkWindow_BasicLayout1_c();
            this.mxmlContent = [this._CommonNoticeTalkWindow_Group2_c(), this._CommonNoticeTalkWindow_CheckBox1_i(), this._CommonNoticeTalkWindow_BlueSmallButton1_c()];
            this._CommonNoticeTalkWindow_Fade1_i();
            this._CommonNoticeTalkWindow_Fade2_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CommonNoticeTalkWindow._watcherSetupUtil = _arg1;
        }

        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            var factory:* = _arg1;
            super.moduleFactory = factory;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
            if (!this.styleDeclaration){
                this.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
            };
            this.styleDeclaration.defaultFactory = function ():void{
                this.color = 16767396;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function setNoticeInfo(_arg1:Object):void{
            this.noticeInfo = _arg1;
            this.ignoreCheckBox.visible = _arg1["id"];
            this.setTipContent(_arg1["content"]);
            callLater(this.setGuideLine);
            if (_arg1["disableActionList"]){
                CombatConsole.getInstance().enableActionList = false;
            };
        }
        private function setGuideLine():void{
            var _local8:Number;
            if (((!(this.noticeInfo)) || (!(this.noticeInfo["guideLine"])))){
                return;
            };
            var _local1:Point = TCGClient.getInstance().mainGroup.localToGlobal(this.noticeInfo["guideLine"]);
            var _local2:Point = globalToLocal(_local1);
            if (!this.gl){
                this.gl = new GuideLineWindow();
                addElement(this.gl);
            };
            var _local3 = 90;
            var _local4 = 90;
            var _local5:int = _local2.x;
            var _local6:int = _local2.y;
            var _local7:Number = (_local5 - _local3);
            _local8 = (_local6 - _local4);
            this.gl.depth = -1;
            this.gl.x = _local3;
            this.gl.y = _local4;
            this.gl.width = Math.sqrt(((_local7 * _local7) + (_local8 * _local8)));
            this.gl.rotation = ((Math.atan2(_local8, _local7) * 180) / Math.PI);
        }
        override public function set y(_arg1:Number):void{
            super.y = _arg1;
            callLater(this.setGuideLine);
        }
        private function setTipContent(_arg1:String):void{
            this.tipFlow = StringUtils.createTFByHtmlText(_arg1);
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
            if (this.noticeInfo["disableActionList"]){
                CombatConsole.getInstance().enableActionList = true;
            };
        }
        private function addMask():void{
            var _local1:UIComponent = new UIComponent();
            addElement(_local1);
            _local1.graphics.beginFill(0);
            _local1.graphics.drawCircle(((this.head.width / 2) + this.head.x), ((this.head.width / 2) + this.head.y), (this.head.width / 2));
            _local1.graphics.endFill();
            this.head.mask = _local1;
        }
        protected function closesignbtn1_clickHandler(_arg1:MouseEvent):void{
            if (((this.ignoreCheckBox) && (this.ignoreCheckBox.selected))){
                NoticeMgr.getInstance().addIgnoreNoticeId(this.noticeInfo["id"]);
            };
            this.removeSelf();
        }
        private function _CommonNoticeTalkWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 500;
            _local1.addEventListener("effectStart", this.__fadeInEffect_effectStart);
            _local1.addEventListener("effectEnd", this.__fadeInEffect_effectEnd);
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        public function __fadeInEffect_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("window_show");
        }
        public function __fadeInEffect_effectEnd(_arg1:EffectEvent):void{
            mouseChildren = true;
        }
        private function _CommonNoticeTalkWindow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 0;
            _local1.duration = 300;
            _local1.addEventListener("effectStart", this.__fadeOutEffect_effectStart);
            this.fadeOutEffect = _local1;
            BindingManager.executeBindings(this, "fadeOutEffect", this.fadeOutEffect);
            return (_local1);
        }
        public function __fadeOutEffect_effectStart(_arg1:EffectEvent):void{
            mouseChildren = false;
        }
        private function _CommonNoticeTalkWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonNoticeTalkWindow_Group2_c():Group{
            var _local1:Group = new Group();
            _local1.mxmlContent = [this._CommonNoticeTalkWindow_SmoothBitmapImage1_c(), this._CommonNoticeTalkWindow_MyImage1_i(), this._CommonNoticeTalkWindow_SmoothBitmapImage2_c(), this._CommonNoticeTalkWindow_Label1_i(), this._CommonNoticeTalkWindow_RichText1_i()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonNoticeTalkWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_________png_1086246204;
            _local1.x = 74;
            _local1.y = 42;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonNoticeTalkWindow_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.width = 140;
            _local1.height = 140;
            _local1.x = 21;
            _local1.y = 22;
            _local1.source = "source/cardImages/524.jpg";
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
        private function _CommonNoticeTalkWindow_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_________png_2092283682;
            _local1.x = 4;
            _local1.y = 0;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonNoticeTalkWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.width = 130;
            _local1.height = 35;
            _local1.x = 166;
            _local1.y = 17;
            _local1.text = "指引提示";
            _local1.filters = [this._CommonNoticeTalkWindow_GlowFilter1_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "headName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.headName = _local1;
            BindingManager.executeBindings(this, "headName", this.headName);
            return (_local1);
        }
        private function _CommonNoticeTalkWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 1387371;
            _local1.strength = 6;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonNoticeTalkWindow_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 205;
            _local1.y = 41;
            _local1.width = 424;
            _local1.height = 130;
            _local1.content = "\n\t\t";
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
        private function _CommonNoticeTalkWindow_CheckBox1_i():CheckBox{
            var _local1:CheckBox = new CheckBox();
            _local1.x = 300;
            _local1.y = 144;
            _local1.visible = false;
            _local1.selected = false;
            _local1.label = "不再显示该任务指引";
            _local1.id = "ignoreCheckBox";
            if (!_local1.document){
                _local1.document = this;
            };
            this.ignoreCheckBox = _local1;
            BindingManager.executeBindings(this, "ignoreCheckBox", this.ignoreCheckBox);
            return (_local1);
        }
        private function _CommonNoticeTalkWindow_BlueSmallButton1_c():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.x = 580;
            _local1.y = 134;
            _local1.label = "确认";
            _local1.addEventListener("click", this.___CommonNoticeTalkWindow_BlueSmallButton1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CommonNoticeTalkWindow_BlueSmallButton1_click(_arg1:MouseEvent):void{
            this.closesignbtn1_clickHandler(_arg1);
        }
        private function _CommonNoticeTalkWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeInEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "fadeOutEffect");
            result[2] = new Binding(this, function ():TextFlow{
                return (tipFlow);
            }, null, "tips.textFlow");
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
        public function get fadeOutEffect():Fade{
            return (this._733607779fadeOutEffect);
        }
        public function set fadeOutEffect(_arg1:Fade):void{
            var _local2:Object = this._733607779fadeOutEffect;
            if (_local2 !== _arg1){
                this._733607779fadeOutEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeOutEffect", _local2, _arg1));
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
        public function get headName():Label{
            return (this._1115960181headName);
        }
        public function set headName(_arg1:Label):void{
            var _local2:Object = this._1115960181headName;
            if (_local2 !== _arg1){
                this._1115960181headName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headName", _local2, _arg1));
                };
            };
        }
        public function get ignoreCheckBox():CheckBox{
            return (this._525800341ignoreCheckBox);
        }
        public function set ignoreCheckBox(_arg1:CheckBox):void{
            var _local2:Object = this._525800341ignoreCheckBox;
            if (_local2 !== _arg1){
                this._525800341ignoreCheckBox = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ignoreCheckBox", _local2, _arg1));
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
        private function get tipFlow():TextFlow{
            return (this._1312067479tipFlow);
        }
        private function set tipFlow(_arg1:TextFlow):void{
            var _local2:Object = this._1312067479tipFlow;
            if (_local2 !== _arg1){
                this._1312067479tipFlow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipFlow", _local2, _arg1));
                };
            };
        }

    }
}//package notice_system 
