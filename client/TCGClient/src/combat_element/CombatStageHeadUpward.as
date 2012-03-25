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
    import flash.system.*;
    import flash.media.*;
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

    public class CombatStageHeadUpward extends CombatStageHeadWindowBase implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CombatStageHeadUpward_Label1:Label;
        private var _1480442097_clock:DuelCountDownClock;
        private var _90932927_head:MyImage;
        private var _1729896704_headGroup:Group;
        private var _612316949_hpFrame1:SmoothBitmapImage;
        private var _612316948_hpFrame2:SmoothBitmapImage;
        private var _1763092043_mainFrame:CombatStageHeadFrame;
        private var _278194141_nameFrame:SmoothBitmapImage;
        private var _91127370_num1:OneRollNum;
        private var _91127371_num2:OneRollNum;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CombatStageHeadUpward(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CombatStageHeadUpward_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_CombatStageHeadUpwardWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (CombatStageHeadUpward[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.mxmlContent = [this._CombatStageHeadUpward_Group1_i(), this._CombatStageHeadUpward_CombatStageHeadFrame1_i(), this._CombatStageHeadUpward_SmoothBitmapImage1_i(), this._CombatStageHeadUpward_OneRollNum1_i(), this._CombatStageHeadUpward_OneRollNum2_i(), this._CombatStageHeadUpward_SmoothBitmapImage2_i(), this._CombatStageHeadUpward_SmoothBitmapImage3_i(), this._CombatStageHeadUpward_Label1_i(), this._CombatStageHeadUpward_DuelCountDownClock1_i()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CombatStageHeadUpward._watcherSetupUtil = _arg1;
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
        override protected function showFoodChangeEffect(_arg1:int):void{
            var _local2:FoodChangeEffect;
            _local2 = new FoodChangeEffect();
            _local2.x = 120;
            _local2.y = 183;
            _local2.setInfo(_arg1, false);
            addElement(_local2);
        }
        private function _CombatStageHeadUpward_Group1_i():Group{
            var _local1:Group;
            _local1 = new Group();
            _local1.x = 37;
            _local1.y = 9;
            _local1.width = 166;
            _local1.height = 166;
            _local1.mxmlContent = [this._CombatStageHeadUpward_MyImage1_i()];
            _local1.addEventListener("click", this.___headGroup_click);
            _local1.addEventListener("creationComplete", this.___headGroup_creationComplete);
            _local1.id = "_headGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this._headGroup = _local1;
            BindingManager.executeBindings(this, "_headGroup", this._headGroup);
            return (_local1);
        }
        private function _CombatStageHeadUpward_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.width = 166;
            _local1.height = 166;
            _local1.id = "_head";
            if (!_local1.document){
                _local1.document = this;
            };
            this._head = _local1;
            BindingManager.executeBindings(this, "_head", this._head);
            return (_local1);
        }
        public function ___headGroup_click(_arg1:MouseEvent):void{
            head_clickHandler();
        }
        public function ___headGroup_creationComplete(_arg1:FlexEvent):void{
            addHeadMask();
        }
        private function _CombatStageHeadUpward_CombatStageHeadFrame1_i():CombatStageHeadFrame{
            var _local1:CombatStageHeadFrame;
            _local1 = new CombatStageHeadFrame();
            _local1.rotation = 180;
            _local1.x = 217;
            _local1.y = 183;
            _local1.id = "_mainFrame";
            if (!_local1.document){
                _local1.document = this;
            };
            this._mainFrame = _local1;
            BindingManager.executeBindings(this, "_mainFrame", this._mainFrame);
            return (_local1);
        }
        private function _CombatStageHeadUpward_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 7;
            _local1.y = 8;
            _local1.initialized(this, "_hpFrame1");
            this._hpFrame1 = _local1;
            BindingManager.executeBindings(this, "_hpFrame1", this._hpFrame1);
            return (_local1);
        }
        private function _CombatStageHeadUpward_OneRollNum1_i():OneRollNum{
            var _local1:OneRollNum;
            _local1 = new OneRollNum();
            _local1.x = 15;
            _local1.y = 28;
            _local1.width = 30;
            _local1.height = 30;
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 30);
            _local1.setStyle("fontFamily", "Georgia");
            _local1.id = "_num1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._num1 = _local1;
            BindingManager.executeBindings(this, "_num1", this._num1);
            return (_local1);
        }
        private function _CombatStageHeadUpward_OneRollNum2_i():OneRollNum{
            var _local1:OneRollNum;
            _local1 = new OneRollNum();
            _local1.x = 35;
            _local1.y = 28;
            _local1.width = 30;
            _local1.height = 30;
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 30);
            _local1.setStyle("fontFamily", "Georgia");
            _local1.id = "_num2";
            if (!_local1.document){
                _local1.document = this;
            };
            this._num2 = _local1;
            BindingManager.executeBindings(this, "_num2", this._num2);
            return (_local1);
        }
        private function _CombatStageHeadUpward_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 22;
            _local1.y = 23;
            _local1.initialized(this, "_hpFrame2");
            this._hpFrame2 = _local1;
            BindingManager.executeBindings(this, "_hpFrame2", this._hpFrame2);
            return (_local1);
        }
        private function _CombatStageHeadUpward_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 65;
            _local1.y = 1;
            _local1.initialized(this, "_nameFrame");
            this._nameFrame = _local1;
            BindingManager.executeBindings(this, "_nameFrame", this._nameFrame);
            return (_local1);
        }
        private function _CombatStageHeadUpward_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 71;
            _local1.y = 5;
            _local1.width = 91;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 15842197);
            _local1.id = "_CombatStageHeadUpward_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CombatStageHeadUpward_Label1 = _local1;
            BindingManager.executeBindings(this, "_CombatStageHeadUpward_Label1", this._CombatStageHeadUpward_Label1);
            return (_local1);
        }
        private function _CombatStageHeadUpward_DuelCountDownClock1_i():DuelCountDownClock{
            var _local1:DuelCountDownClock = new DuelCountDownClock();
            _local1.x = 94;
            _local1.y = 27;
            _local1.isUser = false;
            _local1.id = "_clock";
            if (!_local1.document){
                _local1.document = this;
            };
            this._clock = _local1;
            BindingManager.executeBindings(this, "_clock", this._clock);
            return (_local1);
        }
        private function _CombatStageHeadUpward_bindingsSetup():Array{
            var _local1:Array = [];
            _local1[0] = new Binding(this, null, null, "_headGroup.toolTip", "headTooltip");
            _local1[1] = new Binding(this, null, null, "_head.source", "headSource");
            _local1[2] = new Binding(this, null, null, "_CombatStageHeadUpward_Label1.text", "headName");
            return (_local1);
        }
        public function get _clock():DuelCountDownClock{
            return (this._1480442097_clock);
        }
        public function set _clock(_arg1:DuelCountDownClock):void{
            var _local2:Object = this._1480442097_clock;
            if (_local2 !== _arg1){
                this._1480442097_clock = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_clock", _local2, _arg1));
                };
            };
        }
        public function get _head():MyImage{
            return (this._90932927_head);
        }
        public function set _head(_arg1:MyImage):void{
            var _local2:Object = this._90932927_head;
            if (_local2 !== _arg1){
                this._90932927_head = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_head", _local2, _arg1));
                };
            };
        }
        public function get _headGroup():Group{
            return (this._1729896704_headGroup);
        }
        public function set _headGroup(_arg1:Group):void{
            var _local2:Object = this._1729896704_headGroup;
            if (_local2 !== _arg1){
                this._1729896704_headGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_headGroup", _local2, _arg1));
                };
            };
        }
        public function get _hpFrame1():SmoothBitmapImage{
            return (this._612316949_hpFrame1);
        }
        public function set _hpFrame1(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._612316949_hpFrame1;
            if (_local2 !== _arg1){
                this._612316949_hpFrame1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_hpFrame1", _local2, _arg1));
                };
            };
        }
        public function get _hpFrame2():SmoothBitmapImage{
            return (this._612316948_hpFrame2);
        }
        public function set _hpFrame2(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._612316948_hpFrame2;
            if (_local2 !== _arg1){
                this._612316948_hpFrame2 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_hpFrame2", _local2, _arg1));
                };
            };
        }
        public function get _mainFrame():CombatStageHeadFrame{
            return (this._1763092043_mainFrame);
        }
        public function set _mainFrame(_arg1:CombatStageHeadFrame):void{
            var _local2:Object = this._1763092043_mainFrame;
            if (_local2 !== _arg1){
                this._1763092043_mainFrame = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_mainFrame", _local2, _arg1));
                };
            };
        }
        public function get _nameFrame():SmoothBitmapImage{
            return (this._278194141_nameFrame);
        }
        public function set _nameFrame(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._278194141_nameFrame;
            if (_local2 !== _arg1){
                this._278194141_nameFrame = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_nameFrame", _local2, _arg1));
                };
            };
        }
        public function get _num1():OneRollNum{
            return (this._91127370_num1);
        }
        public function set _num1(_arg1:OneRollNum):void{
            var _local2:Object = this._91127370_num1;
            if (_local2 !== _arg1){
                this._91127370_num1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_num1", _local2, _arg1));
                };
            };
        }
        public function get _num2():OneRollNum{
            return (this._91127371_num2);
        }
        public function set _num2(_arg1:OneRollNum):void{
            var _local2:Object = this._91127371_num2;
            if (_local2 !== _arg1){
                this._91127371_num2 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_num2", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
