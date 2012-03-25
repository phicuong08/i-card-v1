//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
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
    import spark.primitives.*;
    import mx.graphics.*;
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
	
    public class WordWithCircle extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;
		public var __slot1;
        public var _WordWithCircle_Label1:Label;
        public var _WordWithCircle_SolidColorStroke1:SolidColorStroke;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _118889654_wordText:String;
        private var _1916878743_weight:int = 2;
        private var _716446545_circleAlpha:int = 1;
        private var _1480355228_color:uint = 0;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function WordWithCircle(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._WordWithCircle_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_custom_control_WordWithCircleWatcherSetupUtil");
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
            this.width = 40;
            this.height = 40;
            this.layout = this._WordWithCircle_BasicLayout1_c();
            this.mxmlContent = [this._WordWithCircle_Ellipse1_c(), this._WordWithCircle_Label1_i()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            WordWithCircle._watcherSetupUtil = _arg1;
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
        public function set wordText(_arg1:String):void{
            this._wordText = _arg1;
        }
        public function set circleWeight(_arg1:int):void{
            this._weight = _arg1;
        }
        public function set circleAlpha(_arg1:int):void{
            this._circleAlpha = _arg1;
        }
        public function set wordColor(_arg1:uint):void{
            this._color = _arg1;
        }
        private function _WordWithCircle_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _WordWithCircle_Ellipse1_c():Ellipse{
            var _local1:Ellipse = new Ellipse();
            _local1.horizontalCenter = 0;
            _local1.verticalCenter = 0;
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.stroke = this._WordWithCircle_SolidColorStroke1_i();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _WordWithCircle_SolidColorStroke1_i():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            this._WordWithCircle_SolidColorStroke1 = _local1;
            BindingManager.executeBindings(this, "_WordWithCircle_SolidColorStroke1", this._WordWithCircle_SolidColorStroke1);
            return (_local1);
        }
        private function _WordWithCircle_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.rotation = -30;
            _local1.horizontalCenter = 0;
            _local1.verticalCenter = 0;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 25);
            _local1.id = "_WordWithCircle_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._WordWithCircle_Label1 = _local1;
            BindingManager.executeBindings(this, "_WordWithCircle_Label1", this._WordWithCircle_Label1);
            return (_local1);
        }
        private function _WordWithCircle_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():uint{
                return (_color);
            }, null, "_WordWithCircle_SolidColorStroke1.color");
            result[1] = new Binding(this, function ():Number{
                return (_weight);
            }, null, "_WordWithCircle_SolidColorStroke1.weight");
            result[2] = new Binding(this, function ():Number{
                return (_circleAlpha);
            }, null, "_WordWithCircle_SolidColorStroke1.alpha");
            result[3] = new Binding(this, function ():uint{
                return (_color);
            }, function (_arg1:uint):void{
                _WordWithCircle_Label1.setStyle("color", _arg1);
            }, "_WordWithCircle_Label1.color");
            result[4] = new Binding(this, function ():String{
                var _local1:* = _wordText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_WordWithCircle_Label1.text");
            return (result);
        }
        private function get _wordText():String{
            return (this._118889654_wordText);
        }
        private function set _wordText(_arg1:String):void{
            var _local2:Object = this._118889654_wordText;
            if (_local2 !== _arg1){
                this._118889654_wordText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_wordText", _local2, _arg1));
                };
            };
        }
        private function get _weight():int{
            return (this._1916878743_weight);
        }
        private function set _weight(_arg1:int):void{
            var _local2:Object = this._1916878743_weight;
            if (_local2 !== _arg1){
                this._1916878743_weight = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_weight", _local2, _arg1));
                };
            };
        }
        private function get _circleAlpha():int{
            return (this._716446545_circleAlpha);
        }
        private function set _circleAlpha(_arg1:int):void{
            var _local2:Object = this._716446545_circleAlpha;
            if (_local2 !== _arg1){
                this._716446545_circleAlpha = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_circleAlpha", _local2, _arg1));
                };
            };
        }
        private function get _color():uint{
            return (this._1480355228_color);
        }
        private function set _color(_arg1:uint):void{
            var _local2:Object = this._1480355228_color;
            if (_local2 !== _arg1){
                this._1480355228_color = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_color", _local2, _arg1));
                };
            };
        }

    }
}//package custom_control 
