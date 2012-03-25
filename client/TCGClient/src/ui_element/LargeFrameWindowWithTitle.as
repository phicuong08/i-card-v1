//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import custom_control1.*;
    
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
    import mx.styles.*;
    
    import spark.components.*;
	use namespace mx_internal;
    public class LargeFrameWindowWithTitle extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _LargeFrameWindowWithTitle_Label1:Label;
        public var _LargeFrameWindowWithTitle_LargeFrameWindow1:LargeFrameWindow;
        private var __moduleFactoryInitialized:Boolean = false;
        protected var _708118334_innerFrameClass:Class;
        protected var _670296614_titleText:String;
        protected var _709951320_innerFrameAlpha:Number = 1;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        private var _embed_mxml_source_commonUI____png_1145878686:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function LargeFrameWindowWithTitle(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._708118334_innerFrameClass = CommonOuterFrame;
            this._embed_mxml_source_commonUI____png_1538356188 = LargeFrameWindowWithTitle__embed_mxml_source_commonUI____png_1538356188;
            this._embed_mxml_source_commonUI____png_1145878686 = LargeFrameWindowWithTitle__embed_mxml_source_commonUI____png_1145878686;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._LargeFrameWindowWithTitle_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_ui_element_LargeFrameWindowWithTitleWatcherSetupUtil");
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
            this.mouseChildren = false;
            this.mxmlContent = [this._LargeFrameWindowWithTitle_LargeFrameWindow1_i(), this._LargeFrameWindowWithTitle_SmoothBitmapImage1_c(), this._LargeFrameWindowWithTitle_SmoothBitmapImage2_c(), this._LargeFrameWindowWithTitle_Label1_i()];
            this.addEventListener("creationComplete", this.___LargeFrameWindowWithTitle_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            LargeFrameWindowWithTitle._watcherSetupUtil = _arg1;
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
        public function set titleText(_arg1:String):void{
            this._titleText = _arg1;
        }
        public function set innerFrameClass(_arg1:Class):void{
            this._innerFrameClass = _arg1;
        }
        public function set innerFrameAlpha(_arg1:Number):void{
            this._innerFrameAlpha = _arg1;
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            var _local2:Scale9Image;
            if (this._innerFrameClass){
                _local2 = new this._innerFrameClass();
                _local2.size = [(width - 26), (height - 70)];
                _local2.alpha = this._innerFrameAlpha;
                _local2.x = 13;
                _local2.y = 61;
                addElement(_local2);
            };
        }
        private function _LargeFrameWindowWithTitle_LargeFrameWindow1_i():LargeFrameWindow{
            var _local1:LargeFrameWindow = new LargeFrameWindow();
            _local1.id = "_LargeFrameWindowWithTitle_LargeFrameWindow1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._LargeFrameWindowWithTitle_LargeFrameWindow1 = _local1;
            BindingManager.executeBindings(this, "_LargeFrameWindowWithTitle_LargeFrameWindow1", this._LargeFrameWindowWithTitle_LargeFrameWindow1);
            return (_local1);
        }
        private function _LargeFrameWindowWithTitle_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1145878686;
            _local1.horizontalCenter = 0;
            _local1.y = -19;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LargeFrameWindowWithTitle_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = -10;
            _local1.y = 25;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LargeFrameWindowWithTitle_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 30;
            _local1.y = 23;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 16);
            _local1.id = "_LargeFrameWindowWithTitle_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._LargeFrameWindowWithTitle_Label1 = _local1;
            BindingManager.executeBindings(this, "_LargeFrameWindowWithTitle_Label1", this._LargeFrameWindowWithTitle_Label1);
            return (_local1);
        }
        public function ___LargeFrameWindowWithTitle_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _LargeFrameWindowWithTitle_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, null, "_LargeFrameWindowWithTitle_LargeFrameWindow1.width", "width");
            result[1] = new Binding(this, null, null, "_LargeFrameWindowWithTitle_LargeFrameWindow1.height", "height");
            result[2] = new Binding(this, function ():String{
                var _local1:* = _titleText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_LargeFrameWindowWithTitle_Label1.text");
            return (result);
        }
        protected function get _innerFrameClass():Class{
            return (this._708118334_innerFrameClass);
        }
        protected function set _innerFrameClass(_arg1:Class):void{
            var _local2:Object = this._708118334_innerFrameClass;
            if (_local2 !== _arg1){
                this._708118334_innerFrameClass = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_innerFrameClass", _local2, _arg1));
                };
            };
        }
        protected function get _titleText():String{
            return (this._670296614_titleText);
        }
        protected function set _titleText(_arg1:String):void{
            var _local2:Object = this._670296614_titleText;
            if (_local2 !== _arg1){
                this._670296614_titleText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_titleText", _local2, _arg1));
                };
            };
        }
        protected function get _innerFrameAlpha():Number{
            return (this._709951320_innerFrameAlpha);
        }
        protected function set _innerFrameAlpha(_arg1:Number):void{
            var _local2:Object = this._709951320_innerFrameAlpha;
            if (_local2 !== _arg1){
                this._709951320_innerFrameAlpha = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_innerFrameAlpha", _local2, _arg1));
                };
            };
        }

    }
}//package ui_element 
