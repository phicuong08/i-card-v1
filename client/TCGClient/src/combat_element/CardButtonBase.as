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
    import flash.system.*;
    import flash.media.*;
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

    public class CardButtonBase extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _97884btn:Button;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1495860549btnEnabled:Boolean = true;
        protected var _1730705976_btnName:String;
        public var disableTooltip:String;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardButtonBase(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardButtonBase_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_CardButtonBaseWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (CardButtonBase[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.mxmlContent = [this._CardButtonBase_Button1_i()];
            this.addEventListener("rollOver", this.___CardButtonBase_Group1_rollOver);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardButtonBase._watcherSetupUtil = _arg1;
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
        public function set btnName(_arg1:String):void{
            this._btnName = _arg1;
        }
        public function get btnName():String{
            return (this._btnName);
        }
        override public function set enabled(_arg1:Boolean):void{
            super.enabled = true;
            this.btnEnabled = _arg1;
        }
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            toolTip = null;
            if (this.btnEnabled){
                return;
            };
            var _local2:String = this.getDisableTooltip(CombatStage.getInstance().cardButtons.belongCard);
            if (_local2){
                toolTip = _local2;
            } else {
                toolTip = this.disableTooltip;
            };
        }
        protected function getDisableTooltip(_arg1:GameCard):String{
            return (null);
        }
        private function _CardButtonBase_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.setStyle("skinClass", combatCardButtonSkin);
            _local1.id = "btn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.btn = _local1;
            BindingManager.executeBindings(this, "btn", this.btn);
            return (_local1);
        }
        public function ___CardButtonBase_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        private function _CardButtonBase_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():String{
                var _local1:* = _btnName;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "btn.label");
            result[1] = new Binding(this, null, null, "btn.enabled", "btnEnabled");
            return (result);
        }
        public function get btn():Button{
            return (this._97884btn);
        }
        public function set btn(_arg1:Button):void{
            var _local2:Object = this._97884btn;
            if (_local2 !== _arg1){
                this._97884btn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn", _local2, _arg1));
                };
            };
        }
        public function get btnEnabled():Boolean{
            return (this._1495860549btnEnabled);
        }
        public function set btnEnabled(_arg1:Boolean):void{
            var _local2:Object = this._1495860549btnEnabled;
            if (_local2 !== _arg1){
                this._1495860549btnEnabled = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnEnabled", _local2, _arg1));
                };
            };
        }
        protected function get _btnName():String{
            return (this._1730705976_btnName);
        }
        protected function set _btnName(_arg1:String):void{
            var _local2:Object = this._1730705976_btnName;
            if (_local2 !== _arg1){
                this._1730705976_btnName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_btnName", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
