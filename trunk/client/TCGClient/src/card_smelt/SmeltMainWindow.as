//Created by Action Script Viewer - http://www.buraks.com/asv
package card_smelt {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import normal_window.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import custom_effect.*;
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

    public class SmeltMainWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var _8621450cardGrid:SmeltDataGrid;
        private var _1691273874cardInfoWindow:JudgeCardsCardInfoWindow;
        private var _1081769385seltsWindow:SmeltsWindow;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml_source_buttonImages____png_1993273380:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function SmeltMainWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_buttonImages____png_1993273380 = SmeltMainWindow__embed_mxml_source_buttonImages____png_1993273380;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._SmeltMainWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_card_smelt_SmeltMainWindowWatcherSetupUtil");
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
            this.width = 0x0500;
            this.height = 800;
            this.mouseChildren = false;
            this.layout = this._SmeltMainWindow_BasicLayout1_c();
            this.mxmlContent = [this._SmeltMainWindow_SmeltDataGrid1_i(), this._SmeltMainWindow_SmeltsWindow1_i(), this._SmeltMainWindow_JudgeCardsCardInfoWindow1_i(), this._SmeltMainWindow_UniversalImageButton1_c()];
            this._SmeltMainWindow_Fade1_i();
            this.addEventListener("initialize", this.___SmeltMainWindow_Group1_initialize);
            this.addEventListener("remove", this.___SmeltMainWindow_Group1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            SmeltMainWindow._watcherSetupUtil = _arg1;
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
                this.fontSize = 14;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function addCardsToDataGrid(_arg1:Object, _arg2:int):void{
            if (this.cardGrid){
                this.cardGrid.addCard(_arg1, _arg2);
            };
        }
        public function addSmelt(_arg1:Object):void{
            if (this.seltsWindow){
                this.seltsWindow.addSmelt(_arg1);
            };
        }
        public function refreshSmelt(_arg1:int, _arg2:Object):void{
            if (this.seltsWindow){
                this.seltsWindow.refreshSmelt(_arg1, _arg2);
            };
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        public function setDisplayCardId(_arg1:String):void{
            if (!this.cardInfoWindow){
                return;
            };
            if (_arg1){
                this.cardInfoWindow.cardId = _arg1;
                this.cardInfoWindow.showWindow();
            } else {
                this.cardInfoWindow.hideWindow();
            };
        }
        protected function addEffect_effectEndHandler(_arg1:EffectEvent):void{
            mouseChildren = true;
            BasicOperationBar.getInstance().registerLeaveFunc(this.leaveWindow);
            this.displayAll();
        }
        protected function displayAll():void{
            this.seltsWindow.setAllSmeltInfo(CardSmeltMgr.getInstance().getUserSmeltInfo());
            CommonUtil.addTimerLaterCall(300, this.setSmeltAvailableCard);
        }
        protected function setSmeltAvailableCard():void{
            var _local3:String;
            var _local1:Object = CardSmeltMgr.getInstance().getAllSmeltCards();
            var _local2:Array = new Array();
            for (_local3 in _local1) {
                _local2.push(this.buildCardInfo(_local3, _local1[_local3]));
            };
            this.cardGrid.setDataSource(_local2);
        }
        private function buildCardInfo(_arg1:String, _arg2:int):Object{
            var _local3:Object = {
                id:_arg1,
                num:_arg2
            };
            CardsInfo.addAttribById(_local3);
            return (_local3);
        }
        private function leaveWindow():void{
            CardSmeltMgr.getInstance().hideSmeltMainWindow();
            TCGClient.getInstance().enterMainMenu();
            BasicOperationBar.getInstance().clearLeaveFunc(this.leaveWindow);
        }
        protected function group1_removeHandler(_arg1:FlexEvent):void{
            var _local2:FakeFadeEffect = new FakeFadeEffect(this, 500, 1, 0);
            _local2.play();
        }
        private function _SmeltMainWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 1;
            _local1.startDelay = 500;
            _local1.duration = 500;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.addEffect_effectEndHandler(_arg1);
        }
        private function _SmeltMainWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SmeltMainWindow_SmeltDataGrid1_i():SmeltDataGrid{
            var _local1:SmeltDataGrid = new SmeltDataGrid();
            _local1.x = 3;
            _local1.y = 16;
            _local1.id = "cardGrid";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardGrid = _local1;
            BindingManager.executeBindings(this, "cardGrid", this.cardGrid);
            return (_local1);
        }
        private function _SmeltMainWindow_SmeltsWindow1_i():SmeltsWindow{
            var _local1:SmeltsWindow;
            _local1 = new SmeltsWindow();
            _local1.x = 525;
            _local1.y = 16;
            _local1.id = "seltsWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.seltsWindow = _local1;
            BindingManager.executeBindings(this, "seltsWindow", this.seltsWindow);
            return (_local1);
        }
        private function _SmeltMainWindow_JudgeCardsCardInfoWindow1_i():JudgeCardsCardInfoWindow{
            var _local1:JudgeCardsCardInfoWindow;
            _local1 = new JudgeCardsCardInfoWindow();
            _local1.x = 1050;
            _local1.y = 80;
            _local1.visible = false;
            _local1.id = "cardInfoWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardInfoWindow = _local1;
            BindingManager.executeBindings(this, "cardInfoWindow", this.cardInfoWindow);
            return (_local1);
        }
        private function _SmeltMainWindow_UniversalImageButton1_c():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.x = 450;
            _local1.bottom = 25;
            _local1.labelImage = this._embed_mxml_source_buttonImages____png_1993273380;
            _local1.addEventListener("click", this.___SmeltMainWindow_UniversalImageButton1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___SmeltMainWindow_UniversalImageButton1_click(_arg1:MouseEvent):void{
            TCGClient.getInstance().enterJudgeCardsWindow();
        }
        public function ___SmeltMainWindow_Group1_initialize(_arg1:FlexEvent):void{
            alpha = 0;
        }
        public function ___SmeltMainWindow_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        private function _SmeltMainWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
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
        public function get cardGrid():SmeltDataGrid{
            return (this._8621450cardGrid);
        }
        public function set cardGrid(_arg1:SmeltDataGrid):void{
            var _local2:Object = this._8621450cardGrid;
            if (_local2 !== _arg1){
                this._8621450cardGrid = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardGrid", _local2, _arg1));
                };
            };
        }
        public function get cardInfoWindow():JudgeCardsCardInfoWindow{
            return (this._1691273874cardInfoWindow);
        }
        public function set cardInfoWindow(_arg1:JudgeCardsCardInfoWindow):void{
            var _local2:Object = this._1691273874cardInfoWindow;
            if (_local2 !== _arg1){
                this._1691273874cardInfoWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardInfoWindow", _local2, _arg1));
                };
            };
        }
        public function get seltsWindow():SmeltsWindow{
            return (this._1081769385seltsWindow);
        }
        public function set seltsWindow(_arg1:SmeltsWindow):void{
            var _local2:Object = this._1081769385seltsWindow;
            if (_local2 !== _arg1){
                this._1081769385seltsWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "seltsWindow", _local2, _arg1));
                };
            };
        }

    }
}//package card_smelt 
