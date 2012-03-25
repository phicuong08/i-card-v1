//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
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
    import spark.filters.*;
    import flash.utils.*;
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

	use namespace mx_internal;
    public class RoomsListTabWindowItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private const brightColor:uint = 15126902;
        private const normalColor:uint = 13156254;

        public var _RoomsListTabWindowItem_ColorMatrixFilter1:ColorMatrixFilter;
        public var _RoomsListTabWindowItem_Label1:Label;
        private var _1116641007tabBright:SmoothBitmapImage;
        private var _1554100053tabDark:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1486614404_isSelected:Boolean = false;
        private var _1464826535_title:String;
        private var _714582971grayFilter:Array;
        private var _itemEnabled:Boolean = true;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function RoomsListTabWindowItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._RoomsListTabWindowItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_RoomsListTabWindowItemWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (RoomsListTabWindowItem[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.buttonMode = true;
            this.width = 48;
            this.height = 28;
            this.filters = [this._RoomsListTabWindowItem_ColorMatrixFilter1_i()];
            this.mxmlContent = [this._RoomsListTabWindowItem_SmoothBitmapImage1_i(), this._RoomsListTabWindowItem_SmoothBitmapImage2_i(), this._RoomsListTabWindowItem_Label1_i()];
            this.addEventListener("creationComplete", this.___RoomsListTabWindowItem_Group1_creationComplete);
            this.addEventListener("rollOver", this.___RoomsListTabWindowItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___RoomsListTabWindowItem_Group1_rollOut);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            RoomsListTabWindowItem._watcherSetupUtil = _arg1;
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
        public function set itemEnabled(_arg1:Boolean):void{
            this._itemEnabled = _arg1;
            if (this._itemEnabled){
                this.grayFilter = ColorUtil.getColorMatrixByBrightness(0);
            } else {
                this.grayFilter = ColorUtil.getGrayColorMatrix();
            };
        }
        public function get itemEnabled():Boolean{
            return (this._itemEnabled);
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
            this.tabBright.source = RoomsListSourceMgr.getInstance().getSourceClass("tabBright");
            this.tabDark.source = RoomsListSourceMgr.getInstance().getSourceClass("tabDark");
        }
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            if (this.itemEnabled){
                setStyle("color", this.brightColor);
            };
        }
        protected function group1_rollOutHandler(_arg1:MouseEvent):void{
            if (this.itemEnabled){
                this.setFontColorBySelectState();
            };
        }
        private function setFontColorBySelectState():void{
            var _local1:uint = (this._isSelected) ? this.brightColor : this.normalColor;
            setStyle("color", _local1);
        }
        private function _RoomsListTabWindowItem_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this._RoomsListTabWindowItem_ColorMatrixFilter1 = _local1;
            BindingManager.executeBindings(this, "_RoomsListTabWindowItem_ColorMatrixFilter1", this._RoomsListTabWindowItem_ColorMatrixFilter1);
            return (_local1);
        }
        private function _RoomsListTabWindowItem_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "tabBright");
            this.tabBright = _local1;
            BindingManager.executeBindings(this, "tabBright", this.tabBright);
            return (_local1);
        }
        private function _RoomsListTabWindowItem_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "tabDark");
            this.tabDark = _local1;
            BindingManager.executeBindings(this, "tabDark", this.tabDark);
            return (_local1);
        }
        private function _RoomsListTabWindowItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 0;
            _local1.y = 6;
            _local1.percentWidth = 100;
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("textAlign", "center");
            _local1.id = "_RoomsListTabWindowItem_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._RoomsListTabWindowItem_Label1 = _local1;
            BindingManager.executeBindings(this, "_RoomsListTabWindowItem_Label1", this._RoomsListTabWindowItem_Label1);
            return (_local1);
        }
        public function ___RoomsListTabWindowItem_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function ___RoomsListTabWindowItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        public function ___RoomsListTabWindowItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.group1_rollOutHandler(_arg1);
        }
        private function _RoomsListTabWindowItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():uint{
                return (normalColor);
            }, function (_arg1:uint):void{
                this.setStyle("color", _arg1);
            }, "this.color");
            result[1] = new Binding(this, function ():Object{
                return (grayFilter);
            }, null, "_RoomsListTabWindowItem_ColorMatrixFilter1.matrix");
            result[2] = new Binding(this, function ():Boolean{
                return (_isSelected);
            }, null, "tabBright.visible");
            result[3] = new Binding(this, function ():Boolean{
                return (!(_isSelected));
            }, null, "tabDark.visible");
            result[4] = new Binding(this, function ():String{
                var _local1:* = _title;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_RoomsListTabWindowItem_Label1.text");
            return (result);
        }
        public function get tabBright():SmoothBitmapImage{
            return (this._1116641007tabBright);
        }
        public function set tabBright(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1116641007tabBright;
            if (_local2 !== _arg1){
                this._1116641007tabBright = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBright", _local2, _arg1));
                };
            };
        }
        public function get tabDark():SmoothBitmapImage{
            return (this._1554100053tabDark);
        }
        public function set tabDark(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1554100053tabDark;
            if (_local2 !== _arg1){
                this._1554100053tabDark = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabDark", _local2, _arg1));
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
        private function get grayFilter():Array{
            return (this._714582971grayFilter);
        }
        private function set grayFilter(_arg1:Array):void{
            var _local2:Object = this._714582971grayFilter;
            if (_local2 !== _arg1){
                this._714582971grayFilter = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "grayFilter", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
