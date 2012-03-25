//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.accessibility.*;
    import flash.debugger.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;
    
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.filters.*;
    import mx.graphics.*;
    import mx.styles.*;
    
    import spark.components.*;
    import spark.primitives.*;
	use namespace mx_internal;
    public class CommonTabWindowItem extends Group implements IBindingClient {

        private static const brightColor:uint = 15126902;
        private static const normalColor:uint = 13156254;

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CommonTabWindowItem_CommonMiddleFrame1:CommonMiddleFrame;
        public var _CommonTabWindowItem_Label1:Label;
        public var _CommonTabWindowItem_Rect1:Rect;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1486614404_isSelected:Boolean = false;
        private var _1464826535_title:String;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function CommonTabWindowItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CommonTabWindowItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_ui_element_CommonTabWindowItemWatcherSetupUtil");
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
            this.buttonMode = true;
            this.width = 72;
            this.height = 26;
            this.clipAndEnableScrolling = true;
            this.mxmlContent = [this._CommonTabWindowItem_CommonMiddleFrame1_i(), this._CommonTabWindowItem_Rect1_i(), this._CommonTabWindowItem_Label1_i()];
            this.addEventListener("rollOver", this.___CommonTabWindowItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___CommonTabWindowItem_Group1_rollOut);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CommonTabWindowItem._watcherSetupUtil = _arg1;
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
            if (_arg1 == this._isSelected){
                return;
            };
            this._isSelected = _arg1;
            this.setFontColorBySelectState();
            height = (this._isSelected) ? 27 : 26;
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
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            setStyle("color", brightColor);
        }
        protected function group1_rollOutHandler(_arg1:MouseEvent):void{
            this.setFontColorBySelectState();
        }
        private function setFontColorBySelectState():void{
            var _local1:uint = (this._isSelected) ? brightColor : normalColor;
            setStyle("color", _local1);
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function _CommonTabWindowItem_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.id = "_CommonTabWindowItem_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CommonTabWindowItem_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_CommonTabWindowItem_CommonMiddleFrame1", this._CommonTabWindowItem_CommonMiddleFrame1);
            return (_local1);
        }
        private function _CommonTabWindowItem_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.width = 72;
            _local1.height = 26;
            _local1.fill = this._CommonTabWindowItem_SolidColor1_c();
            _local1.initialized(this, "_CommonTabWindowItem_Rect1");
            this._CommonTabWindowItem_Rect1 = _local1;
            BindingManager.executeBindings(this, "_CommonTabWindowItem_Rect1", this._CommonTabWindowItem_Rect1);
            return (_local1);
        }
        private function _CommonTabWindowItem_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            _local1.alpha = 0.5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CommonTabWindowItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 0;
            _local1.y = 6;
            _local1.width = 72;
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("textAlign", "center");
            _local1.id = "_CommonTabWindowItem_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CommonTabWindowItem_Label1 = _local1;
            BindingManager.executeBindings(this, "_CommonTabWindowItem_Label1", this._CommonTabWindowItem_Label1);
            return (_local1);
        }
        public function ___CommonTabWindowItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        public function ___CommonTabWindowItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.group1_rollOutHandler(_arg1);
        }
        private function _CommonTabWindowItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():uint{
                return (normalColor);
            }, function (_arg1:uint):void{
                this.setStyle("color", _arg1);
            }, "this.color");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [72, 30];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_CommonTabWindowItem_CommonMiddleFrame1.size");
            result[2] = new Binding(this, function ():Boolean{
                return (!(_isSelected));
            }, null, "_CommonTabWindowItem_Rect1.visible");
            result[3] = new Binding(this, function ():String{
                var _local1:* = _title;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_CommonTabWindowItem_Label1.text");
            return (result);
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
}//package ui_element 
