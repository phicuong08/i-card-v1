//Created by Action Script Viewer - http://www.buraks.com/asv
package shop_system {
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

	use namespace mx_internal;
    public class ShopCommonTabButtonWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem1:ShopCommonTabButtonWindowItem;
        public var _ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem2:ShopCommonTabButtonWindowItem;
        public var _ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem3:ShopCommonTabButtonWindowItem;
        public var _ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem4:ShopCommonTabButtonWindowItem;
        private var __moduleFactoryInitialized:Boolean = false;
        public var selectedItem:ShopCommonTabButtonWindowItem;
        private var _1760885984isMonsterCardShowMode:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function ShopCommonTabButtonWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._ShopCommonTabButtonWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_shop_system_ShopCommonTabButtonWindowWatcherSetupUtil");
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
            this.width = 384;
            this.height = 25;
            this.mxmlContent = [this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem1_i(), this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem2_i(), this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem3_i(), this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem4_i(), this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem5_c(), this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem6_c(), this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem7_c(), this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem8_c()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            ShopCommonTabButtonWindow._watcherSetupUtil = _arg1;
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
        protected function item_clickHandler(_arg1:MouseEvent):void{
            var _local2:ShopCommonTabButtonWindowItem = (_arg1.currentTarget as ShopCommonTabButtonWindowItem);
            if (_local2 != this.selectedItem){
                if (this.selectedItem){
                    this.selectedItem.isSelected = false;
                };
                this.selectedItem = _local2;
                this.selectedItem.isSelected = true;
            };
        }
        public function clean():void{
            if (this.selectedItem){
                this.selectedItem.isSelected = false;
            };
            this.selectedItem = null;
        }
        private function _ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem1_i():ShopCommonTabButtonWindowItem{
            var _local1:ShopCommonTabButtonWindowItem;
            _local1 = new ShopCommonTabButtonWindowItem();
            _local1.x = 0;
            _local1.title = "武";
            _local1.addEventListener("click", this.___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem1_click);
            _local1.id = "_ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem1 = _local1;
            BindingManager.executeBindings(this, "_ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem1", this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem1);
            return (_local1);
        }
        public function ___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem1_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        private function _ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem2_i():ShopCommonTabButtonWindowItem{
            var _local1:ShopCommonTabButtonWindowItem;
            _local1 = new ShopCommonTabButtonWindowItem();
            _local1.x = 48;
            _local1.title = "智";
            _local1.addEventListener("click", this.___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem2_click);
            _local1.id = "_ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem2";
            if (!_local1.document){
                _local1.document = this;
            };
            this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem2 = _local1;
            BindingManager.executeBindings(this, "_ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem2", this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem2);
            return (_local1);
        }
        public function ___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem2_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        private function _ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem3_i():ShopCommonTabButtonWindowItem{
            var _local1:ShopCommonTabButtonWindowItem = new ShopCommonTabButtonWindowItem();
            _local1.x = 96;
            _local1.title = "星";
            _local1.addEventListener("click", this.___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem3_click);
            _local1.id = "_ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem3";
            if (!_local1.document){
                _local1.document = this;
            };
            this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem3 = _local1;
            BindingManager.executeBindings(this, "_ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem3", this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem3);
            return (_local1);
        }
        public function ___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem3_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        private function _ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem4_i():ShopCommonTabButtonWindowItem{
            var _local1:ShopCommonTabButtonWindowItem = new ShopCommonTabButtonWindowItem();
            _local1.x = 144;
            _local1.title = "势";
            _local1.addEventListener("click", this.___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem4_click);
            _local1.id = "_ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem4";
            if (!_local1.document){
                _local1.document = this;
            };
            this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem4 = _local1;
            BindingManager.executeBindings(this, "_ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem4", this._ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem4);
            return (_local1);
        }
        public function ___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem4_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        private function _ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem5_c():ShopCommonTabButtonWindowItem{
            var _local1:ShopCommonTabButtonWindowItem;
            _local1 = new ShopCommonTabButtonWindowItem();
            _local1.x = 192;
            _local1.title = "类";
            _local1.addEventListener("click", this.___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem5_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem5_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        private function _ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem6_c():ShopCommonTabButtonWindowItem{
            var _local1:ShopCommonTabButtonWindowItem = new ShopCommonTabButtonWindowItem();
            _local1.x = 240;
            _local1.title = "名";
            _local1.addEventListener("click", this.___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem6_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem6_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        private function _ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem7_c():ShopCommonTabButtonWindowItem{
            var _local1:ShopCommonTabButtonWindowItem = new ShopCommonTabButtonWindowItem();
            _local1.x = 288;
            _local1.title = "价";
            _local1.addEventListener("click", this.___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem7_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem7_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        private function _ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem8_c():ShopCommonTabButtonWindowItem{
            var _local1:ShopCommonTabButtonWindowItem = new ShopCommonTabButtonWindowItem();
            _local1.x = 336;
            _local1.title = "级";
            _local1.addEventListener("click", this.___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem8_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem8_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        private function _ShopCommonTabButtonWindow_bindingsSetup():Array{
            var _local1:Array = [];
            _local1[0] = new Binding(this, null, null, "_ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem1.visible", "isMonsterCardShowMode");
            _local1[1] = new Binding(this, null, null, "_ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem2.visible", "isMonsterCardShowMode");
            _local1[2] = new Binding(this, null, null, "_ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem3.visible", "isMonsterCardShowMode");
            _local1[3] = new Binding(this, null, null, "_ShopCommonTabButtonWindow_ShopCommonTabButtonWindowItem4.visible", "isMonsterCardShowMode");
            return (_local1);
        }
        public function get isMonsterCardShowMode():Boolean{
            return (this._1760885984isMonsterCardShowMode);
        }
        public function set isMonsterCardShowMode(_arg1:Boolean):void{
            var _local2:Object = this._1760885984isMonsterCardShowMode;
            if (_local2 !== _arg1){
                this._1760885984isMonsterCardShowMode = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "isMonsterCardShowMode", _local2, _arg1));
                };
            };
        }

    }
}//package shop_system 
