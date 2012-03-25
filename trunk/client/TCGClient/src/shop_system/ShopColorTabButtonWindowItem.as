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
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import source_manager.*;
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
    public class ShopColorTabButtonWindowItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private const brightColor:uint = 15126902;
        private const normalColor:uint = 13156254;

        public var _ShopColorTabButtonWindowItem_Label1:Label;
        private var _225760540tab_bright:SmoothBitmapImage;
        private var _907452960tab_dark:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1486614404_isSelected:Boolean = false;
        private var _1464826535_title:String;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function ShopColorTabButtonWindowItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._ShopColorTabButtonWindowItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_shop_system_ShopColorTabButtonWindowItemWatcherSetupUtil");
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
            this.buttonMode = true;
            this.width = 72;
            this.height = 27;
            this.mxmlContent = [this._ShopColorTabButtonWindowItem_SmoothBitmapImage1_i(), this._ShopColorTabButtonWindowItem_SmoothBitmapImage2_i(), this._ShopColorTabButtonWindowItem_Label1_i()];
            this.addEventListener("creationComplete", this.___ShopColorTabButtonWindowItem_Group1_creationComplete);
            this.addEventListener("rollOver", this.___ShopColorTabButtonWindowItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___ShopColorTabButtonWindowItem_Group1_rollOut);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            ShopColorTabButtonWindowItem._watcherSetupUtil = _arg1;
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
        public function set isSelected(_arg1:Boolean):void{
            if (this._isSelected == _arg1){
                return;
            };
            this._isSelected = _arg1;
            this.setFontColorBySelectState();
        }
        public function get isSelected():Boolean{
            return (this._isSelected);
        }
        public function set title(_arg1:String):void{
            this._title = _arg1;
        }
        public function get title():String{
            return (this._title);
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.tab_bright.source = ShopMainWindowSourceMgr.getInstance().getSourceClass("tab_bright");
            this.tab_dark.source = ShopMainWindowSourceMgr.getInstance().getSourceClass("tab_dark");
        }
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            setStyle("color", this.brightColor);
        }
        protected function group1_rollOutHandler(_arg1:MouseEvent):void{
            this.setFontColorBySelectState();
        }
        private function setFontColorBySelectState():void{
            var _local1:uint = (this._isSelected) ? this.brightColor : this.normalColor;
            setStyle("color", _local1);
        }
        private function _ShopColorTabButtonWindowItem_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "tab_bright");
            this.tab_bright = _local1;
            BindingManager.executeBindings(this, "tab_bright", this.tab_bright);
            return (_local1);
        }
        private function _ShopColorTabButtonWindowItem_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "tab_dark");
            this.tab_dark = _local1;
            BindingManager.executeBindings(this, "tab_dark", this.tab_dark);
            return (_local1);
        }
        private function _ShopColorTabButtonWindowItem_Label1_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 0;
            _local1.y = 6;
            _local1.width = 72;
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("textAlign", "center");
            _local1.id = "_ShopColorTabButtonWindowItem_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._ShopColorTabButtonWindowItem_Label1 = _local1;
            BindingManager.executeBindings(this, "_ShopColorTabButtonWindowItem_Label1", this._ShopColorTabButtonWindowItem_Label1);
            return (_local1);
        }
        public function ___ShopColorTabButtonWindowItem_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function ___ShopColorTabButtonWindowItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        public function ___ShopColorTabButtonWindowItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.group1_rollOutHandler(_arg1);
        }
        private function _ShopColorTabButtonWindowItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():uint{
                return (normalColor);
            }, function (_arg1:uint):void{
                this.setStyle("color", _arg1);
            }, "this.color");
            result[1] = new Binding(this, function ():Boolean{
                return (_isSelected);
            }, null, "tab_bright.visible");
            result[2] = new Binding(this, function ():Boolean{
                return (!(_isSelected));
            }, null, "tab_dark.visible");
            result[3] = new Binding(this, function ():String{
                var _local1:* = _title;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_ShopColorTabButtonWindowItem_Label1.text");
            return (result);
        }
        public function get tab_bright():SmoothBitmapImage{
            return (this._225760540tab_bright);
        }
        public function set tab_bright(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._225760540tab_bright;
            if (_local2 !== _arg1){
                this._225760540tab_bright = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab_bright", _local2, _arg1));
                };
            };
        }
        public function get tab_dark():SmoothBitmapImage{
            return (this._907452960tab_dark);
        }
        public function set tab_dark(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._907452960tab_dark;
            if (_local2 !== _arg1){
                this._907452960tab_dark = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab_dark", _local2, _arg1));
                };
            };
        }
        private function get _isSelected():Boolean{
            return (this._1486614404_isSelected);
        }
        private function set _isSelected(_arg1:Boolean):void{
            var _local2:Object = this._1486614404_isSelected;
            if (_local2 !== _arg1){
                this._1486614404_isSelected = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_isSelected", _local2, _arg1));
                };
            };
        }
        private function get _title():String{
            return (this._1464826535_title);
        }
        private function set _title(_arg1:String):void{
            var _local2:Object = this._1464826535_title;
            if (_local2 !== _arg1){
                this._1464826535_title = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_title", _local2, _arg1));
                };
            };
        }

    }
}//package shop_system 
