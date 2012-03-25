//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
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
    import spark.layouts.*;
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
    public class ExpBar extends Group implements IBindingClient {

        private static var img:Class = ExpBar_img;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _ExpBar_Label1:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var frame:ExpBarFrame;
        private var bar:UIComponent;
        private var barImgBd:BitmapData;
        private var totalNum:int = 1;
        private var num:int = 0;
        private var _2000932397numText:String = "? / ?";
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function ExpBar(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._ExpBar_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_ui_element_ExpBarWatcherSetupUtil");
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
            this.height = 20;
            this.layout = this._ExpBar_BasicLayout1_c();
            this.mxmlContent = [this._ExpBar_Label1_i()];
            this.addEventListener("initialize", this.___ExpBar_Group1_initialize);
            this.addEventListener("resize", this.___ExpBar_Group1_resize);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            ExpBar._watcherSetupUtil = _arg1;
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
        protected function group1_initializeHandler(_arg1:FlexEvent):void{
            this.barImgBd = (new img() as Bitmap).bitmapData;
            this.frame = new ExpBarFrame();
            addElement(this.frame);
            this.bar = new UIComponent();
            addElement(this.bar);
            this.bar.x = 4;
            this.bar.y = 4;
            this.group1_resizeHandler();
        }
        public function setValue(_arg1:Number, _arg2:Number):void{
            this.num = _arg1;
            this.totalNum = _arg2;
            this.numText = ((_arg1 + " / ") + _arg2);
            this.drawBar();
        }
        public function reset():void{
            this.numText = "? / ?";
            this.totalNum = 1;
            this.num = 0;
            this.drawBar();
        }
        protected function group1_resizeHandler():void{
            this.drawFrame();
            this.drawBar();
        }
        protected function drawFrame():void{
            this.frame.size = [width, height];
        }
        protected function drawBar():void{
            var _local1:Number;
            if (this.bar){
                _local1 = (this.num / this.totalNum);
                if (_local1 > 1){
                    _local1 = 1;
                };
                this.bar.graphics.clear();
                this.bar.graphics.beginBitmapFill(this.barImgBd);
                this.bar.graphics.drawRect(0, 0, ((width - (this.bar.x * 2)) * _local1), (height - (this.bar.y * 2)));
                this.bar.graphics.endFill();
            };
        }
        private function _ExpBar_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ExpBar_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.depth = 1;
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.setStyle("fontSize", 12);
            _local1.setStyle("color", 16777171);
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "_ExpBar_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._ExpBar_Label1 = _local1;
            BindingManager.executeBindings(this, "_ExpBar_Label1", this._ExpBar_Label1);
            return (_local1);
        }
        public function ___ExpBar_Group1_initialize(_arg1:FlexEvent):void{
            this.group1_initializeHandler(_arg1);
        }
        public function ___ExpBar_Group1_resize(_arg1:ResizeEvent):void{
            this.group1_resizeHandler();
        }
        private function _ExpBar_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():String{
                var _local1:* = numText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_ExpBar_Label1.text");
            return (result);
        }
        private function get numText():String{
            return (this._2000932397numText);
        }
        private function set numText(_arg1:String):void{
            var _local2:Object = this._2000932397numText;
            if (_local2 !== _arg1){
                this._2000932397numText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numText", _local2, _arg1));
                };
            };
        }

    }
}//package ui_element 
