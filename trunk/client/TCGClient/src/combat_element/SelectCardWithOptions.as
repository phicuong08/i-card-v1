//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
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
    import spark.filters.*;
    import flash.utils.*;
    import combat_element_script.*;
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
	use namespace mx_internal;
    public class SelectCardWithOptions extends StageSelectWindowBase implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1856148036_scaleEffect:Scale;
        private var _476548482cancelBtn:Button;
        private var _1286989506ensureBtn:Button;
        private var _556388489firstItemGoldLine:SmoothBitmapImage;
        private var _398103768middleFrame:CommonMiddleFrame;
        private var _1721019826outerFrame:CommonOuterFrame;
        private var _1234104453scaleEffect:Scale;
        private var _3560248tips:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var optionsArr:Array;
        private var maxNeedOptionNum:int = 1;
        private var minNeedOptionNum:int = 0;
        private var selectOptionsArray:Array;
        private var _245942307ensureBtnEnabled:Boolean = true;
        private var _990953311cancelBtnEnabled:Boolean = true;
        private var _1311656857tipTexs:String;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        private var _embed_mxml_source_commonUI______png_298371472:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function SelectCardWithOptions(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.optionsArr = new Array();
            this.selectOptionsArray = new Array();
            this._embed_mxml_source_commonUI____png_1538356188 = SelectCardWithOptions__embed_mxml_source_commonUI____png_1538356188;
            this._embed_mxml_source_commonUI______png_298371472 = SelectCardWithOptions__embed_mxml_source_commonUI______png_298371472;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._SelectCardWithOptions_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_SelectCardWithOptionsWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                //return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 580;
            this.height = 250;
            this.horizontalCenter = 0;
            this.verticalCenter = 0;
            this.mxmlContent = [this._SelectCardWithOptions_CommonOuterFrame1_i(), this._SelectCardWithOptions_CommonMiddleFrame1_i(), this._SelectCardWithOptions_SmoothBitmapImage1_c(), this._SelectCardWithOptions_Label1_c(), this._SelectCardWithOptions_Label2_i(), this._SelectCardWithOptions_SmoothBitmapImage2_i(), this._SelectCardWithOptions_Button1_i(), this._SelectCardWithOptions_Button2_i()];
            this._SelectCardWithOptions_Scale2_i();
            this._SelectCardWithOptions_Scale1_i();
            this.addEventListener("creationComplete", this.___SelectCardWithOptions_StageSelectWindowBase1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            SelectCardWithOptions._watcherSetupUtil = _arg1;
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
        public function addOptions(_arg1:Array):void{
            var _local3:SelectCardOptionItem;
            var _local2:int;
            while (_local2 < _arg1.length) {
                _local3 = this.addOneOption(_arg1[_local2].toString(), (_local2 + 1));
                _local3.y = ((this.firstItemGoldLine.y + 1) + (_local2 * _local3.height));
                _local2++;
            };
            height = ((_local3.y + _local3.height) + 60);
            this.outerFrame.size = [width, height];
            this.middleFrame.size = [(width - 28), (height - 82)];
        }
        private function addOneOption(_arg1:String, _arg2:int):SelectCardOptionItem{
            var _local3:SelectCardOptionItem = new SelectCardOptionItem();
            _local3.setOptionInfo(_arg1, _arg2);
            addElement(_local3);
            _local3.addEventListener(MouseEvent.CLICK, this.mouserClickOption);
            return (_local3);
        }
        protected function createCompleteHandler():void{
            CombatConsole.getInstance().setOperationMenuFlag("select", true);
            this.addOptions(this.optionsArr);
            this.optionsArr = null;
        }
        private function mouserClickOption(_arg1:MouseEvent):void{
            var _local4:SelectCardOptionItem;
            var _local2:SelectCardOptionItem = (_arg1.currentTarget as SelectCardOptionItem);
            var _local3:int = this.selectOptionsArray.indexOf(_local2);
            if (_local3 == -1){
                if (this.selectOptionsArray.length > 0){
                    _local4 = this.selectOptionsArray.shift();
                    _local4.selected = false;
                };
                this.selectOptionsArray.push(_local2);
                _local2.selected = true;
            } else {
                this.selectOptionsArray.splice(_local3, 1);
                _local2.selected = false;
            };
            this.checkNum();
        }
        public function setInfo(_arg1:int=0, _arg2:int=0, _arg3:Boolean=true, _arg4:Array=null, _arg5:String=null, _arg6=null):void{
            this.minNeedOptionNum = _arg2;
            this.cancelBtnEnabled = _arg3;
            this.optionsArr = _arg4;
            this.setTipByReason(_arg5);
            this.checkNum();
        }
        private function setTipByReason(_arg1:String):void{
            switch (_arg1){
                case "recruit from":
                    this.tipTexs = "从哪里出战？";
                    break;
                default:
                    this.tipTexs = "请选择：";
            };
        }
        private function checkNum():void{
            this.ensureBtnEnabled = (((this.selectOptionsArray.length <= this.maxNeedOptionNum)) && ((this.selectOptionsArray.length >= this.minNeedOptionNum)));
        }
        protected function btnClickHandler(_arg1:Boolean):void{
            var _local2:Array;
            var _local3:SelectCardOptionItem;
            if ((((this.maxNeedOptionNum <= 0)) || ((_arg1 == false)))){
                this.removeSelf();
                this.doSelect("'',0");
            } else {
                _local2 = new Array();
                _local2.push("''");
                _local2.push(this.selectOptionsArray.length);
                for each (_local3 in this.selectOptionsArray) {
                    _local2.push(_local3.optionIndex);
                };
                this.doSelect(_local2.toString());
            };
        }
        private function doSelect(_arg1:String):void{
            var _local2 = (("return d:do_select(" + _arg1) + ");");
            var _local3:Array = LuaAgent.getInstance().run(_local2);
            if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                this.removeSelf();
            };
        }
        override public function removeSelf():void{
            super.removeSelf();
            CombatConsole.getInstance().setOperationMenuFlag("select", false);
        }
        private function _SelectCardWithOptions_Scale2_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXTo = 0.01;
            _local1.scaleYTo = 0.01;
            _local1.duration = 200;
            this._scaleEffect = _local1;
            BindingManager.executeBindings(this, "_scaleEffect", this._scaleEffect);
            return (_local1);
        }
        private function _SelectCardWithOptions_Scale1_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 0.01;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 0.01;
            _local1.scaleYTo = 1;
            _local1.duration = 200;
            this.scaleEffect = _local1;
            BindingManager.executeBindings(this, "scaleEffect", this.scaleEffect);
            return (_local1);
        }
        private function _SelectCardWithOptions_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.filters = [this._SelectCardWithOptions_DropShadowFilter1_c()];
            _local1.id = "outerFrame";
            if (!_local1.document){
                _local1.document = this;
            };
            this.outerFrame = _local1;
            BindingManager.executeBindings(this, "outerFrame", this.outerFrame);
            return (_local1);
        }
        private function _SelectCardWithOptions_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardWithOptions_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 14;
            _local1.y = 40;
            _local1.alpha = 0.7;
            _local1.id = "middleFrame";
            if (!_local1.document){
                _local1.document = this;
            };
            this.middleFrame = _local1;
            BindingManager.executeBindings(this, "middleFrame", this.middleFrame);
            return (_local1);
        }
        private function _SelectCardWithOptions_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 20;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardWithOptions_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 28;
            _local1.y = 13;
            _local1.text = "请选择：";
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 18);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardWithOptions_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 55;
            _local1.y = 54;
            _local1.height = 48;
            _local1.width = 473;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 16);
            _local1.setStyle("color", 16178309);
            _local1.id = "tips";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tips = _local1;
            BindingManager.executeBindings(this, "tips", this.tips);
            return (_local1);
        }
        private function _SelectCardWithOptions_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.y = 120;
            _local1.horizontalCenter = 0;
            _local1.source = this._embed_mxml_source_commonUI______png_298371472;
            _local1.initialized(this, "firstItemGoldLine");
            this.firstItemGoldLine = _local1;
            BindingManager.executeBindings(this, "firstItemGoldLine", this.firstItemGoldLine);
            return (_local1);
        }
        private function _SelectCardWithOptions_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.label = "确 定";
            _local1.bottom = 10;
            _local1.left = 150;
            _local1.width = 75;
            _local1.height = 27;
            _local1.buttonMode = true;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__ensureBtn_click);
            _local1.id = "ensureBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.ensureBtn = _local1;
            BindingManager.executeBindings(this, "ensureBtn", this.ensureBtn);
            return (_local1);
        }
        public function __ensureBtn_click(_arg1:MouseEvent):void{
            this.btnClickHandler(true);
        }
        private function _SelectCardWithOptions_Button2_i():Button{
            var _local1:Button = new Button();
            _local1.label = "取 消";
            _local1.bottom = 10;
            _local1.right = 150;
            _local1.width = 75;
            _local1.height = 27;
            _local1.buttonMode = true;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__cancelBtn_click);
            _local1.id = "cancelBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cancelBtn = _local1;
            BindingManager.executeBindings(this, "cancelBtn", this.cancelBtn);
            return (_local1);
        }
        public function __cancelBtn_click(_arg1:MouseEvent):void{
            this.btnClickHandler(false);
        }
        public function ___SelectCardWithOptions_StageSelectWindowBase1_creationComplete(_arg1:FlexEvent):void{
            this.createCompleteHandler();
        }
        private function _SelectCardWithOptions_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_SELECT_CARD_WITH_OPTIONS);
            }, null, "this.depth");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "scaleEffect");
            result[2] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "_scaleEffect");
            result[3] = new Binding(this, function ():Array{
                var _local1:* = [580, 250];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "outerFrame.size");
            result[4] = new Binding(this, function ():Array{
                var _local1:* = [552, 168];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "middleFrame.size");
            result[5] = new Binding(this, function ():String{
                var _local1:* = tipTexs;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "tips.text");
            result[6] = new Binding(this, function ():Boolean{
                return (ensureBtnEnabled);
            }, null, "ensureBtn.enabled");
            result[7] = new Binding(this, function ():Boolean{
                return (cancelBtnEnabled);
            }, null, "cancelBtn.enabled");
            return (result);
        }
        public function get _scaleEffect():Scale{
            return (this._1856148036_scaleEffect);
        }
        public function set _scaleEffect(_arg1:Scale):void{
            var _local2:Object = this._1856148036_scaleEffect;
            if (_local2 !== _arg1){
                this._1856148036_scaleEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_scaleEffect", _local2, _arg1));
                };
            };
        }
        public function get cancelBtn():Button{
            return (this._476548482cancelBtn);
        }
        public function set cancelBtn(_arg1:Button):void{
            var _local2:Object = this._476548482cancelBtn;
            if (_local2 !== _arg1){
                this._476548482cancelBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelBtn", _local2, _arg1));
                };
            };
        }
        public function get ensureBtn():Button{
            return (this._1286989506ensureBtn);
        }
        public function set ensureBtn(_arg1:Button):void{
            var _local2:Object = this._1286989506ensureBtn;
            if (_local2 !== _arg1){
                this._1286989506ensureBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ensureBtn", _local2, _arg1));
                };
            };
        }
        public function get firstItemGoldLine():SmoothBitmapImage{
            return (this._556388489firstItemGoldLine);
        }
        public function set firstItemGoldLine(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._556388489firstItemGoldLine;
            if (_local2 !== _arg1){
                this._556388489firstItemGoldLine = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "firstItemGoldLine", _local2, _arg1));
                };
            };
        }
        public function get middleFrame():CommonMiddleFrame{
            return (this._398103768middleFrame);
        }
        public function set middleFrame(_arg1:CommonMiddleFrame):void{
            var _local2:Object = this._398103768middleFrame;
            if (_local2 !== _arg1){
                this._398103768middleFrame = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "middleFrame", _local2, _arg1));
                };
            };
        }
        public function get outerFrame():CommonOuterFrame{
            return (this._1721019826outerFrame);
        }
        public function set outerFrame(_arg1:CommonOuterFrame):void{
            var _local2:Object = this._1721019826outerFrame;
            if (_local2 !== _arg1){
                this._1721019826outerFrame = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerFrame", _local2, _arg1));
                };
            };
        }
        public function get scaleEffect():Scale{
            return (this._1234104453scaleEffect);
        }
        public function set scaleEffect(_arg1:Scale):void{
            var _local2:Object = this._1234104453scaleEffect;
            if (_local2 !== _arg1){
                this._1234104453scaleEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scaleEffect", _local2, _arg1));
                };
            };
        }
        public function get tips():Label{
            return (this._3560248tips);
        }
        public function set tips(_arg1:Label):void{
            var _local2:Object = this._3560248tips;
            if (_local2 !== _arg1){
                this._3560248tips = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tips", _local2, _arg1));
                };
            };
        }
        private function get ensureBtnEnabled():Boolean{
            return (this._245942307ensureBtnEnabled);
        }
        private function set ensureBtnEnabled(_arg1:Boolean):void{
            var _local2:Object = this._245942307ensureBtnEnabled;
            if (_local2 !== _arg1){
                this._245942307ensureBtnEnabled = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ensureBtnEnabled", _local2, _arg1));
                };
            };
        }
        private function get cancelBtnEnabled():Boolean{
            return (this._990953311cancelBtnEnabled);
        }
        private function set cancelBtnEnabled(_arg1:Boolean):void{
            var _local2:Object = this._990953311cancelBtnEnabled;
            if (_local2 !== _arg1){
                this._990953311cancelBtnEnabled = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelBtnEnabled", _local2, _arg1));
                };
            };
        }
        private function get tipTexs():String{
            return (this._1311656857tipTexs);
        }
        private function set tipTexs(_arg1:String):void{
            var _local2:Object = this._1311656857tipTexs;
            if (_local2 !== _arg1){
                this._1311656857tipTexs = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipTexs", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
