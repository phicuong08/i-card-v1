//Created by Action Script Viewer - http://www.buraks.com/asv
package debug1 {
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
    import mx.collections.*;
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

    public class GmWindow extends SuperDragGroup implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _GmWindow_ArrayCollection1:ArrayCollection;
        public var _GmWindow_CommonOuterFrame1:CommonOuterFrame;
        private var _492047636cardTargetName:TextInput;
        private var _914279215gmCardId:TextInput;
        private var _1722120848gmCardNum:ComboBox;
        private var _277093272gmLevelNum:TextInput;
        private var _1522173356gmMoneyNum:TextInput;
        private var _1369030298gmScoreNum:TextInput;
        private var _1658327648levelTargetName:TextInput;
        private var _1428013924moneyTargetName:TextInput;
        private var _531907602scoreTargetName:TextInput;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function GmWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GmWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_debug_GmWindowWatcherSetupUtil");
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
            this.x = 440;
            this.y = 250;
            this.width = 400;
            this.height = 300;
            this.depth = 50;
            this.mxmlContent = [this._GmWindow_CommonOuterFrame1_i(), this._GmWindow_CloseSignBtn1_c(), this._GmWindow_Label1_c(), this._GmWindow_Label2_c(), this._GmWindow_Label3_c(), this._GmWindow_Button1_c(), this._GmWindow_TextInput1_i(), this._GmWindow_TextInput2_i(), this._GmWindow_ComboBox1_i(), this._GmWindow_Label4_c(), this._GmWindow_Label5_c(), this._GmWindow_TextInput3_i(), this._GmWindow_TextInput4_i(), this._GmWindow_Button2_c(), this._GmWindow_Label6_c(), this._GmWindow_Label7_c(), this._GmWindow_TextInput5_i(), this._GmWindow_TextInput6_i(), this._GmWindow_Button3_c(), this._GmWindow_Label8_c(), this._GmWindow_Label9_c(), this._GmWindow_TextInput7_i(), this._GmWindow_TextInput8_i(), this._GmWindow_Button4_c()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GmWindow._watcherSetupUtil = _arg1;
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
                this.color = 14400386;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function gmAddUserCard():void{
            var _local1:String = this.cardTargetName.text;
            var _local2:String = this.gmCardId.text;
            if (((((this.gmCardNum.selectedItem) && ((_local1.length > 0)))) && ((_local2.length > 0)))){
                LuaAgent.getInstance().run((((((("u:send_gm_message({\"add_card_to_user\", \"" + _local1) + "\", ") + _local2) + ", ") + int(this.gmCardNum.selectedItem)) + "})"));
            };
        }
        protected function gmAddUserScore():void{
            var _local1:String = this.scoreTargetName.text;
            var _local2:String = this.gmScoreNum.text;
            if ((((_local1.length > 0)) && ((_local2.length > 0)))){
                LuaAgent.getInstance().run((((("u:send_gm_message({\"add_score_to_user\", \"" + _local1) + "\", ") + _local2) + "})"));
            };
        }
        protected function gmAddUserMoney():void{
            var _local1:String = this.moneyTargetName.text;
            var _local2:String = this.gmMoneyNum.text;
            if ((((_local1.length > 0)) && ((_local2.length > 0)))){
                LuaAgent.getInstance().run((((("u:send_gm_message({\"add_money_to_user\", \"" + _local1) + "\", ") + _local2) + "})"));
            };
        }
        protected function gmChangeUserLevel():void{
            var _local1:String = this.levelTargetName.text;
            var _local2:int = int(this.gmLevelNum.text);
            if ((((_local1.length > 0)) && ((_local2 > 0)))){
                LuaAgent.getInstance().run((((("u:send_gm_message({\"change_user_level\", \"" + _local1) + "\", ") + _local2) + "})"));
            };
        }
        private function _GmWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.mouseEnabled = true;
            _local1.filters = [this._GmWindow_DropShadowFilter1_c()];
            _local1.addEventListener("mouseDown", this.___GmWindow_CommonOuterFrame1_mouseDown);
            _local1.addEventListener("mouseUp", this.___GmWindow_CommonOuterFrame1_mouseUp);
            _local1.id = "_GmWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._GmWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_GmWindow_CommonOuterFrame1", this._GmWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _GmWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GmWindow_CommonOuterFrame1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
        }
        public function ___GmWindow_CommonOuterFrame1_mouseUp(_arg1:MouseEvent):void{
            this.stopDrag();
        }
        private function _GmWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 4;
            _local1.top = 4;
            _local1.addEventListener("click", this.___GmWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GmWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        private function _GmWindow_Label1_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 24;
            _local1.y = 19;
            _local1.text = "玩家名";
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GmWindow_Label2_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 96;
            _local1.y = 19;
            _local1.text = "卡片id";
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GmWindow_Label3_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 140;
            _local1.y = 19;
            _local1.text = "张数";
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GmWindow_Button1_c():Button{
            var _local1:Button;
            _local1 = new Button();
            _local1.x = 24;
            _local1.y = 70;
            _local1.label = "gm给玩家添加卡片";
            _local1.width = 158;
            _local1.height = 30;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___GmWindow_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GmWindow_Button1_click(_arg1:MouseEvent):void{
            this.gmAddUserCard();
        }
        private function _GmWindow_TextInput1_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 24;
            _local1.y = 39;
            _local1.width = 72;
            _local1.setStyle("color", 0);
            _local1.id = "cardTargetName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardTargetName = _local1;
            BindingManager.executeBindings(this, "cardTargetName", this.cardTargetName);
            return (_local1);
        }
        private function _GmWindow_TextInput2_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 104;
            _local1.y = 39;
            _local1.width = 25;
            _local1.setStyle("color", 0);
            _local1.id = "gmCardId";
            if (!_local1.document){
                _local1.document = this;
            };
            this.gmCardId = _local1;
            BindingManager.executeBindings(this, "gmCardId", this.gmCardId);
            return (_local1);
        }
        private function _GmWindow_ComboBox1_i():ComboBox{
            var _local1:ComboBox = new ComboBox();
            _local1.x = 137;
            _local1.y = 39;
            _local1.width = 45;
            _local1.dataProvider = this._GmWindow_ArrayCollection1_i();
            _local1.id = "gmCardNum";
            if (!_local1.document){
                _local1.document = this;
            };
            this.gmCardNum = _local1;
            BindingManager.executeBindings(this, "gmCardNum", this.gmCardNum);
            return (_local1);
        }
        private function _GmWindow_ArrayCollection1_i():ArrayCollection{
            var _local1:ArrayCollection = new ArrayCollection();
            _local1.initialized(this, "_GmWindow_ArrayCollection1");
            this._GmWindow_ArrayCollection1 = _local1;
            BindingManager.executeBindings(this, "_GmWindow_ArrayCollection1", this._GmWindow_ArrayCollection1);
            return (_local1);
        }
        private function _GmWindow_Label4_c():Label{
            var _local1:Label = new Label();
            _local1.x = 24;
            _local1.y = 117;
            _local1.text = "玩家名";
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GmWindow_Label5_c():Label{
            var _local1:Label = new Label();
            _local1.x = 107;
            _local1.y = 117;
            _local1.text = "积分数";
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GmWindow_TextInput3_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 24;
            _local1.y = 135;
            _local1.width = 72;
            _local1.setStyle("color", 0);
            _local1.id = "scoreTargetName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scoreTargetName = _local1;
            BindingManager.executeBindings(this, "scoreTargetName", this.scoreTargetName);
            return (_local1);
        }
        private function _GmWindow_TextInput4_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 104;
            _local1.y = 135;
            _local1.width = 42;
            _local1.setStyle("color", 0);
            _local1.id = "gmScoreNum";
            if (!_local1.document){
                _local1.document = this;
            };
            this.gmScoreNum = _local1;
            BindingManager.executeBindings(this, "gmScoreNum", this.gmScoreNum);
            return (_local1);
        }
        private function _GmWindow_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.x = 24;
            _local1.y = 166;
            _local1.label = "gm给玩家添加积分";
            _local1.width = 158;
            _local1.height = 30;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___GmWindow_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GmWindow_Button2_click(_arg1:MouseEvent):void{
            this.gmAddUserScore();
        }
        private function _GmWindow_Label6_c():Label{
            var _local1:Label = new Label();
            _local1.x = 24;
            _local1.y = 211;
            _local1.text = "玩家名";
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GmWindow_Label7_c():Label{
            var _local1:Label = new Label();
            _local1.x = 107;
            _local1.y = 211;
            _local1.text = "金钱数";
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GmWindow_TextInput5_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 24;
            _local1.y = 229;
            _local1.width = 72;
            _local1.setStyle("color", 0);
            _local1.id = "moneyTargetName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.moneyTargetName = _local1;
            BindingManager.executeBindings(this, "moneyTargetName", this.moneyTargetName);
            return (_local1);
        }
        private function _GmWindow_TextInput6_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 104;
            _local1.y = 229;
            _local1.width = 42;
            _local1.setStyle("color", 0);
            _local1.id = "gmMoneyNum";
            if (!_local1.document){
                _local1.document = this;
            };
            this.gmMoneyNum = _local1;
            BindingManager.executeBindings(this, "gmMoneyNum", this.gmMoneyNum);
            return (_local1);
        }
        private function _GmWindow_Button3_c():Button{
            var _local1:Button = new Button();
            _local1.x = 24;
            _local1.y = 260;
            _local1.label = "gm给玩家添加金钱";
            _local1.width = 158;
            _local1.height = 30;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___GmWindow_Button3_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GmWindow_Button3_click(_arg1:MouseEvent):void{
            this.gmAddUserMoney();
        }
        private function _GmWindow_Label8_c():Label{
            var _local1:Label = new Label();
            _local1.x = 216;
            _local1.y = 21;
            _local1.text = "玩家名";
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GmWindow_Label9_c():Label{
            var _local1:Label = new Label();
            _local1.x = 299;
            _local1.y = 21;
            _local1.text = "新等级";
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GmWindow_TextInput7_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 216;
            _local1.y = 39;
            _local1.width = 72;
            _local1.setStyle("color", 0);
            _local1.id = "levelTargetName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.levelTargetName = _local1;
            BindingManager.executeBindings(this, "levelTargetName", this.levelTargetName);
            return (_local1);
        }
        private function _GmWindow_TextInput8_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 296;
            _local1.y = 39;
            _local1.width = 42;
            _local1.setStyle("color", 0);
            _local1.id = "gmLevelNum";
            if (!_local1.document){
                _local1.document = this;
            };
            this.gmLevelNum = _local1;
            BindingManager.executeBindings(this, "gmLevelNum", this.gmLevelNum);
            return (_local1);
        }
        private function _GmWindow_Button4_c():Button{
            var _local1:Button = new Button();
            _local1.x = 216;
            _local1.y = 70;
            _local1.label = "gm修改玩家等级";
            _local1.width = 158;
            _local1.height = 30;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___GmWindow_Button4_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GmWindow_Button4_click(_arg1:MouseEvent):void{
            this.gmChangeUserLevel();
        }
        private function _GmWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, null, "_GmWindow_CommonOuterFrame1.width", "width");
            result[1] = new Binding(this, null, null, "_GmWindow_CommonOuterFrame1.height", "height");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [1, 2, 3];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_GmWindow_ArrayCollection1.source");
            return (result);
        }
        public function get cardTargetName():TextInput{
            return (this._492047636cardTargetName);
        }
        public function set cardTargetName(_arg1:TextInput):void{
            var _local2:Object = this._492047636cardTargetName;
            if (_local2 !== _arg1){
                this._492047636cardTargetName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardTargetName", _local2, _arg1));
                };
            };
        }
        public function get gmCardId():TextInput{
            return (this._914279215gmCardId);
        }
        public function set gmCardId(_arg1:TextInput):void{
            var _local2:Object = this._914279215gmCardId;
            if (_local2 !== _arg1){
                this._914279215gmCardId = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gmCardId", _local2, _arg1));
                };
            };
        }
        public function get gmCardNum():ComboBox{
            return (this._1722120848gmCardNum);
        }
        public function set gmCardNum(_arg1:ComboBox):void{
            var _local2:Object = this._1722120848gmCardNum;
            if (_local2 !== _arg1){
                this._1722120848gmCardNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gmCardNum", _local2, _arg1));
                };
            };
        }
        public function get gmLevelNum():TextInput{
            return (this._277093272gmLevelNum);
        }
        public function set gmLevelNum(_arg1:TextInput):void{
            var _local2:Object = this._277093272gmLevelNum;
            if (_local2 !== _arg1){
                this._277093272gmLevelNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gmLevelNum", _local2, _arg1));
                };
            };
        }
        public function get gmMoneyNum():TextInput{
            return (this._1522173356gmMoneyNum);
        }
        public function set gmMoneyNum(_arg1:TextInput):void{
            var _local2:Object = this._1522173356gmMoneyNum;
            if (_local2 !== _arg1){
                this._1522173356gmMoneyNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gmMoneyNum", _local2, _arg1));
                };
            };
        }
        public function get gmScoreNum():TextInput{
            return (this._1369030298gmScoreNum);
        }
        public function set gmScoreNum(_arg1:TextInput):void{
            var _local2:Object = this._1369030298gmScoreNum;
            if (_local2 !== _arg1){
                this._1369030298gmScoreNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gmScoreNum", _local2, _arg1));
                };
            };
        }
        public function get levelTargetName():TextInput{
            return (this._1658327648levelTargetName);
        }
        public function set levelTargetName(_arg1:TextInput):void{
            var _local2:Object = this._1658327648levelTargetName;
            if (_local2 !== _arg1){
                this._1658327648levelTargetName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelTargetName", _local2, _arg1));
                };
            };
        }
        public function get moneyTargetName():TextInput{
            return (this._1428013924moneyTargetName);
        }
        public function set moneyTargetName(_arg1:TextInput):void{
            var _local2:Object = this._1428013924moneyTargetName;
            if (_local2 !== _arg1){
                this._1428013924moneyTargetName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyTargetName", _local2, _arg1));
                };
            };
        }
        public function get scoreTargetName():TextInput{
            return (this._531907602scoreTargetName);
        }
        public function set scoreTargetName(_arg1:TextInput):void{
            var _local2:Object = this._531907602scoreTargetName;
            if (_local2 !== _arg1){
                this._531907602scoreTargetName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scoreTargetName", _local2, _arg1));
                };
            };
        }

    }
}//package debug 
